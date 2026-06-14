#include "../shared.h"
#include "foliage_common.hlsli"

Texture2D<float4> __3__36__0__0__g_puddleMask : register(t124, space36);

Texture2D<float4> __3__36__0__0__g_climateSandTex : register(t125, space36);

Texture2D<uint16_t> __3__36__0__0__g_sceneDecalMask : register(t126, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t29, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t196, space36);

Texture3D<float2> __3__36__0__0__g_hairDualScatteringLUT : register(t215, space36);

Texture2D<float4> __3__36__0__0__g_blueNoise : register(t85, space36);

Texture2D<float4> __3__36__0__0__g_bentCone : register(t50, space36);

Texture2D<float4> __3__36__0__0__g_character : register(t41, space36);

Texture2D<float4> __3__36__0__0__g_specularResult : register(t146, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t155, space36);

Texture2D<float2> __3__36__0__0__g_hairBrdfLookup : register(t157, space36);

Texture2D<uint2> __3__36__0__0__g_stencilPrev : register(t61, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResult : register(t178, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResultPrev : register(t179, space36);

Texture2D<half4> __3__36__0__0__g_specularResultPrev : register(t180, space36);

Texture2D<half2> __3__36__0__0__g_sceneAO : register(t51, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t15, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t16, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t17, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t18, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t63, space36);

Texture2D<uint2> __3__36__0__0__g_normalDepthHalf : register(t44, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t42, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t52, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t66, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t45, space36);

Texture2D<float4> __3__36__0__0__g_manyLightsMoments : register(t53, space36);

Texture2D<float> __3__36__0__0__g_specularRayHitDistance : register(t67, space36);

Texture2D<uint> __3__36__0__0__g_tiledManyLightsMasks : register(t11, space36);

ByteAddressBuffer __3__37__0__0__g_structureCounterBuffer : register(t26, space37);

Texture2D<half4> __3__36__0__0__g_sceneShadowColor : register(t47, space36);

RWTexture2D<float4> __3__38__0__1__g_diffuseHalfPrevUAV : register(u41, space38);

RWTexture2D<float4> __3__38__0__1__g_sceneColorUAV : register(u12, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneSpecularUAV : register(u4, space38);

RWTexture2D<half4> __3__38__0__1__g_diffuseResultUAV : register(u13, space38);

RWTexture2D<half4> __3__38__0__1__g_specularResultUAV : register(u14, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV : register(u19, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b18, space35) {
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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b32, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__WeatherConstantBuffer : register(b45, space35) {
  float _rain : packoffset(c000.x);
  float _windSpeed : packoffset(c000.y);
  float _puddleRate : packoffset(c000.z);
  float _humidity : packoffset(c000.w);
  float _puddleScale : packoffset(c001.x);
  float2 _windDir : packoffset(c001.y);
  float _snowAmount : packoffset(c001.w);
  float _snowDetail : packoffset(c002.x);
  float _iceRate : packoffset(c002.y);
  float _snowRate : packoffset(c002.z);
  uint _weatherCheckFlag : packoffset(c002.w);
  float2 _climateTextureOnePixelMeter : packoffset(c003.x);
  float2 _cloudScroll : packoffset(c003.z);
  int2 _climateTextureSize : packoffset(c004.x);
  float _heightScaleMin : packoffset(c004.z);
  float _heightScaleMax : packoffset(c004.w);
  float _temperatureSnowStart : packoffset(c005.x);
  float _temperatureSnowEnd : packoffset(c005.y);
  float _temperatureDeformableSnowStart : packoffset(c005.z);
  float _tempeartureDeformableSnowEnd : packoffset(c005.w);
  float _rainDropletAmount : packoffset(c006.x);
  float _rainDropletRate : packoffset(c006.y);
  float _puddleCloudAltitude : packoffset(c006.z);
  float _puddleCloudThickenss : packoffset(c006.w);
};

cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b28, space35) {
  float _sunLightIntensity : packoffset(c000.x);
  float _sunLightPreset : packoffset(c000.y);
  float _sunSizeAngle : packoffset(c000.z);
  float _sunSizeAngleCosine : packoffset(c000.w);
  float _sunDirY : packoffset(c001.x);
  float _moonLightIntensity : packoffset(c001.y);
  float _moonLightPreset : packoffset(c001.z);
  float _moonSizeAngle : packoffset(c001.w);
  float _moonSizeAngleCosine : packoffset(c002.x);
  float _moonDirY : packoffset(c002.y);
  float _earthAxisTilt : packoffset(c002.z);
  float _latitude : packoffset(c002.w);
  float _earthRadius : packoffset(c003.x);
  float _atmosphereThickness : packoffset(c003.y);
  float _rayleighScaledHeight : packoffset(c003.z);
  uint _rayleighScatteringColor : packoffset(c003.w);
  float _mieScaledHeight : packoffset(c004.x);
  float _mieAerosolDensity : packoffset(c004.y);
  float _mieAerosolAbsorption : packoffset(c004.z);
  float _miePhaseConst : packoffset(c004.w);
  float _ozoneRatio : packoffset(c005.x);
  float _directionalLightLuminanceScale : packoffset(c005.y);
  float _distanceScale : packoffset(c005.z);
  float _heightFogDensity : packoffset(c005.w);
  float _heightFogBaseline : packoffset(c006.x);
  float _heightFogFalloff : packoffset(c006.y);
  float _heightFogScale : packoffset(c006.z);
  float _cloudBaseDensity : packoffset(c006.w);
  float _cloudBaseContrast : packoffset(c007.x);
  float _cloudBaseScale : packoffset(c007.y);
  float _cloudAlpha : packoffset(c007.z);
  float _cloudScrollMultiplier : packoffset(c007.w);
  float _cloudScatteringCoefficient : packoffset(c008.x);
  float _cloudPhaseConstFront : packoffset(c008.y);
  float _cloudPhaseConstBack : packoffset(c008.z);
  float _cloudAltitude : packoffset(c008.w);
  float _cloudThickness : packoffset(c009.x);
  float _cloudVisibleRange : packoffset(c009.y);
  float _cloudNear : packoffset(c009.z);
  float _cloudFadeRange : packoffset(c009.w);
  float _cloudDetailRatio : packoffset(c010.x);
  float _cloudDetailScale : packoffset(c010.y);
  float _cloudMultiRatio : packoffset(c010.z);
  float _cloudBeerPowderRatio : packoffset(c010.w);
  float _cloudCirrusAltitude : packoffset(c011.x);
  float _cloudCirrusDensity : packoffset(c011.y);
  float _cloudCirrusScale : packoffset(c011.z);
  float _cloudCirrusWeightR : packoffset(c011.w);
  float _cloudCirrusWeightG : packoffset(c012.x);
  float _cloudCirrusWeightB : packoffset(c012.y);
  float _cloudFlow : packoffset(c012.z);
  float _cloudSeed : packoffset(c012.w);
  float4 _volumeFogScatterColor : packoffset(c013.x);
  float4 _mieScatterColor : packoffset(c014.x);
};

cbuffer __3__35__0__0__PrecomputedAmbientConstantBuffer : register(b29, space35) {
  float4 _precomputedAmbient0 : packoffset(c000.x);
  float4 _precomputedAmbient1 : packoffset(c001.x);
  float4 _precomputedAmbient2 : packoffset(c002.x);
  float4 _precomputedAmbient3 : packoffset(c003.x);
  float4 _precomputedAmbient4 : packoffset(c004.x);
  float4 _precomputedAmbient5 : packoffset(c005.x);
  float4 _precomputedAmbient6 : packoffset(c006.x);
  float4 _precomputedAmbient7 : packoffset(c007.x);
  float4 _precomputedAmbients[56] : packoffset(c008.x);
};

cbuffer __3__35__0__0__TileConstantBuffer : register(b31, space35) {
  struct {
    uint4 g_tileIndex[4096];
  } __3__35__0__0__TileConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__TileConstantBuffer_raw[4096] : packoffset(c0);
  uint4 __3__35__0__0__TileConstantBuffer_raw_uint[4096] : packoffset(c0);
};

cbuffer __3__35__0__0__EnvironmentLightingHistoryConstantBuffer : register(b46, space35) {
  float4 _environmentLightingHistory[4] : packoffset(c000.x);
};

cbuffer __3__35__0__0__MaterialParameterPresetTableConstantBuffer : register(b40, space35) {
  struct {
    float4 _clothLightingCategory;
    float4 _clothLightingParameter[8];
    float4 _colorPresetInfo;
    uint4 _colorPresetParameter[16];
    float4 _debugOption;
  } __3__35__0__0__MaterialParameterPresetTableConstantBuffer_view : packoffset(c000.x);

  // Raw views preserve dynamic cbufferLoadLegacy.f32/i32 access.
  float4 __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[27] : packoffset(c0);
  uint4 __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw_uint[27] : packoffset(c0);
};

cbuffer __3__1__0__0__WeatherShadingConstants : register(b1, space1) {
  int4 _paramWeather : packoffset(c000.x);
  float4 _paramShading : packoffset(c001.x);
  int2 _readBackBufferSize : packoffset(c002.x);
  float _readBackFieldSize : packoffset(c002.z);
  int _enableSandAO : packoffset(c002.w);
  float4 _blurSourceSize : packoffset(c003.x);
  float4 _blurTargetSize : packoffset(c004.x);
  float2 _paramGlobalSand : packoffset(c005.x);
  float2 _climateTextureRender : packoffset(c005.z);
};

cbuffer __3__1__0__0__RenderVoxelConstants : register(b0, space1) {
  float4 _renderParams : packoffset(c000.x);
  float4 _renderParams2 : packoffset(c001.x);
  float4 _cubemapViewPosRelative : packoffset(c002.x);
  float4 _lightingParams : packoffset(c003.x);
  float4 _tiledRadianceCacheParams : packoffset(c004.x);
  float _rtaoIntensity : packoffset(c005.x);
};

SamplerState __3__40__0__0__g_sampler : register(s1, space40);

SamplerState __3__40__0__0__g_samplerClamp : register(s3, space40);

SamplerState __3__40__0__0__g_samplerPoint : register(s4, space40);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearWrapUWClampV : register(s1, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _69;
  int _70;
  int4 _78;
  int _88;
  int _92;
  uint _98;
  uint _100;
  float _101;
  float _102;
  float _103;
  float _104;
  float _108;
  float _109;
  float _111;
  uint2 _114;
  int _116;
  float _119;
  float _120;
  int _441;
  half _481;
  half _482;
  half _483;
  half _484;
  half _492;
  half _493;
  half _494;
  half _495;
  int _496;
  int _497;
  float _498;
  float _499;
  bool _594;
  float _811;
  float _812;
  float _1031;
  float _1032;
  float _1033;
  float _1034;
  float _1056;
  float _1057;
  float _1058;
  float _1059;
  float _1060;
  int _1066;
  half _1067;
  float _1068;
  float _1069;
  float _1070;
  float _1071;
  float _1072;
  float _1101;
  half _1102;
  float _1104;
  float _1130;
  float _1131;
  float _1138;
  float _1139;
  float _1140;
  float _1141;
  half _1142;
  float _1148;
  float _1149;
  float _1150;
  float _1151;
  half _1152;
  half _1213;
  float _1230;
  float _1594;
  half _1595;
  float _1596;
  float _1597;
  float _1598;
  int _1599;
  float _1600;
  float _1601;
  float _1602;
  bool _1655;
  bool _1658;
  bool _1659;
  float _1677;
  float _1688;
  float _1689;
  float _1699;
  float _1700;
  half _1701;
  half _1702;
  half _1703;
  half _1704;
  half _1705;
  float _1717;
  bool _1740;
  float _1749;
  float _1790;
  float _1791;
  float _1876;
  float _1954;
  bool _2057;
  float _2129;
  float _2130;
  float _2131;
  float _2132;
  float _2295;
  int _2296;
  float _2353;
  float _2365;
  float _2478;
  float _2479;
  float _2480;
  float _2481;
  float _2483;
  float _2484;
  float _2485;
  float _2486;
  float _2490;
  float _2491;
  float _2492;
  float _2493;
  float _2494;
  float _2519;
  float _2543;
  bool _2554;
  half _2584;
  int _2585;
  float _2586;
  float _2587;
  float _2588;
  float _2858;
  float _2877;
  float _2881;
  float _2913;
  float _2958;
  float _2959;
  float _2960;
  float _2961;
  float _2967;
  float _2968;
  float _2969;
  float _2970;
  float _2973;
  float _2974;
  float _2975;
  float _2976;
  half _2977;
  float _3129;
  int _3130;
  int _3131;
  float _3132;
  float _3133;
  float _3134;
  float _3135;
  float _3268;
  float _3269;
  float _3270;
  float _3331;
  float _3341;
  float _3342;
  float _3343;
  float _3388;
  float _3389;
  float _3521;
  float _3522;
  float _3523;
  float _3538;
  float _3539;
  float _3540;
  float _3541;
  float _3542;
  bool _3608;
  bool _3609;
  float _3645;
  float _3646;
  float _3647;
  float _3648;
  float _3714;
  float _3717;
  float _3718;
  float _3719;
  float _3720;
  float _3755;
  float _3756;
  float _3757;
  float _3772;
  float _3801;
  float _3802;
  float _3803;
  float _3804;
  float _3805;
  half _3812;
  half _3813;
  half _3814;
  half _3815;
  half _3816;
  float _3817;
  float _3823;
  half _3824;
  half _3825;
  half _3826;
  half _3827;
  half _3828;
  float _3829;
  float _3830;
  float _3831;
  float _3832;
  float _3833;
  float _3834;
  half _3875;
  half _3876;
  half _3877;
  float _3892;
  float _3893;
  float _3894;
  float _3914;
  float _3974;
  float _4072;
  float _4073;
  float _4074;
  bool _4134;
  bool _4155;
  bool _4157;
  bool _4158;
  float _4175;
  int _4176;
  float _4177;
  float _4178;
  float _4179;
  float _4180;
  float _4181;
  float _4220;
  float _4257;
  float _4264;
  float _4265;
  float _4266;
  bool _4287;
  bool _4289;
  bool _4293;
  int _4294;
  float _4295;
  bool _4304;
  int _4305;
  float _4306;
  float _4309;
  int _4310;
  bool _4311;
  bool _4312;
  float _4329;
  float _4330;
  float _4331;
  float _4372;
  float _4643;
  float _4644;
  float _4645;
  float _4646;
  float _4647;
  float _4648;
  float _4649;
  float _4650;
  float _4651;
  float _4821;
  float _4822;
  float _4823;
  float _4824;
  float _4825;
  float _4826;
  float _4827;
  float _4828;
  float _4829;
  float _4919;
  float _4920;
  float _4921;
  float _4988;
  float _4989;
  float _4990;
  float _4991;
  float _4992;
  float _4993;
  float _5038;
  float _5039;
  float _5040;
  float _5041;
  float _5042;
  float _5043;
  float _5044;
  float _5045;
  float _5046;
  float _5061;
  float _5062;
  float _5063;
  float _5064;
  float _5065;
  float _5066;
  float _5067;
  float _5068;
  float _5069;
  float _5081;
  float _5082;
  float _5083;
  float _5385;
  float _5401;
  float _5402;
  float _5403;
  float _5404;
  float _5405;
  float _5406;
  float _5407;
  float _5408;
  float _5409;
  float _5420;
  float _5421;
  float _5422;
  float _5434;
  float _5435;
  float _5436;
  float _5437;
  float _5438;
  float _5439;
  float _5440;
  float _5441;
  float _5442;
  float _5443;
  float _5444;
  float _5445;
  float _5448;
  float _5449;
  float _5450;
  float _5451;
  float _5452;
  float _5453;
  float _5454;
  float _5455;
  float _5456;
  float _5457;
  float _5458;
  float _5459;
  float _5473;
  float _5474;
  float _5593;
  float _5594;
  float _5595;
  float _5596;
  float _5597;
  float _5598;
  float _5599;
  float _5600;
  float _5601;
  float _5645;
  half _5694;
  half _5695;
  half _5696;
  float _5709;
  float _5741;
  float _5742;
  float _5835;
  float _5836;
  float _5837;
  float _5896;
  float _5897;
  float _5898;
  bool _5955;
  float _5988;
  float _5989;
  float _5990;
  float _6011;
  float _6012;
  float _6013;
  float _6027;
  float _6028;
  float _6029;
  float _6048;
  float _6049;
  float _6050;
  uint4 _128;
  float4 _134;
  half _143;
  half _147;
  half _152;
  half _156;
  half _161;
  half _165;
  uint _177;
  bool _178;
  bool _179;
  float _189;
  float _190;
  float _191;
  float _193;
  half _197;
  half _198;
  half _199;
  half _202;
  half _203;
  float _208;
  float _209;
  float _213;
  float _215;
  float _222;
  float _223;
  float _224;
  float _226;
  float _229;
  float _230;
  float _231;
  float _232;
  float _238;
  float _239;
  float _240;
  float _241;
  half _253;
  half _254;
  half _255;
  half _257;
  half _258;
  half _259;
  half _260;
  half _264;
  half _265;
  half _266;
  half _282;
  half _283;
  half _284;
  bool _289;
  half _291;
  uint _308;
  uint _316;
  uint _324;
  uint _332;
  uint _340;
  uint _348;
  uint _356;
  uint _364;
  uint _372;
  uint _380;
  uint _388;
  uint _396;
  uint _404;
  uint _412;
  uint _420;
  uint _428;
  int _470;
  int _471;
  int4 _502;
  int _507;
  int _511;
  int _515;
  int _519;
  float _544;
  float _549;
  float _550;
  float _551;
  float _552;
  int _553;
  int _554;
  int _555;
  int _556;
  float _596;
  float _601;
  int _614;
  bool _617;
  int4 _646;
  float _665;
  float _666;
  float _667;
  float _669;
  float _673;
  float _674;
  float _675;
  float _691;
  float _692;
  float _693;
  float _695;
  float _714;
  float _715;
  float _716;
  float _718;
  float _737;
  float _738;
  float _739;
  float _741;
  bool _746;
  float _747;
  float _760;
  float _761;
  float _762;
  float _763;
  float _768;
  float _771;
  float _774;
  float _777;
  float _780;
  float _813;
  float _814;
  float _815;
  float _816;
  float _817;
  float _818;
  float _819;
  float _820;
  bool _829;
  float _838;
  float _839;
  float _840;
  float _841;
  float _842;
  float _843;
  float _848;
  float _849;
  float _850;
  float _851;
  float _855;
  float _864;
  float _865;
  float _866;
  float _867;
  half4 _869;
  uint _879;
  half4 _880;
  uint _893;
  half4 _894;
  half4 _907;
  float4 _921;
  float4 _928;
  float4 _938;
  float4 _948;
  bool _967;
  float _969;
  float _971;
  float _1007;
  float _1008;
  float _1009;
  float _1010;
  float _1012;
  float _1013;
  float _1014;
  float _1015;
  bool _1016;
  bool _1018;
  float4 _1025;
  uint _1041;
  int _1043;
  float4 _1050;
  bool _1076;
  float _1083;
  float _1114;
  float _1115;
  float _1117;
  float _1118;
  float _1119;
  float _1133;
  float4 _1154;
  float4 _1161;
  float4 _1171;
  float4 _1181;
  float _1194;
  float _1195;
  float _1196;
  float _1198;
  float _1199;
  float _1200;
  float _1201;
  float _1214;
  float _1231;
  float _1232;
  float _1233;
  float _1234;
  float _1235;
  float _1236;
  float _1237;
  float _1238;
  float _1244;
  float _1248;
  float _1249;
  float _1250;
  float _1254;
  float _1255;
  float _1256;
  float _1263;
  float _1273;
  float _1274;
  float _1275;
  float _1276;
  float _1277;
  float _1278;
  float _1287;
  float _1292;
  float _1298;
  float _1299;
  float _1303;
  float _1304;
  float _1309;
  float _1310;
  float _1311;
  float _1312;
  float _1324;
  float _1328;
  float _1338;
  float _1339;
  float _1343;
  float _1345;
  float _1346;
  float _1359;
  float _1369;
  float _1370;
  float _1371;
  float _1380;
  float2 _1389;
  float2 _1392;
  float2 _1395;
  float _1402;
  float _1403;
  float _1404;
  float _1405;
  float _1406;
  float _1407;
  float _1408;
  float _1409;
  float _1410;
  float _1411;
  float _1412;
  float _1413;
  float _1414;
  float _1415;
  float _1416;
  float _1417;
  float _1418;
  float _1419;
  float _1429;
  float _1430;
  float _1431;
  float _1432;
  float _1433;
  float _1434;
  float _1442;
  float _1443;
  float _1444;
  float _1445;
  float _1447;
  float _1448;
  float _1449;
  float _1450;
  float _1451;
  float _1452;
  float _1455;
  float _1456;
  float _1457;
  float _1467;
  float _1490;
  float _1494;
  float _1498;
  float _1516;
  float _1523;
  float _1524;
  float _1525;
  float _1534;
  float _1541;
  float _1548;
  float _1576;
  float _1577;
  float _1578;
  float _1579;
  float _1580;
  float _1609;
  float _1610;
  float _1611;
  half2 _1613;
  half2 _1620;
  half2 _1629;
  half2 _1638;
  float _1645;
  bool _1652;
  bool _1664;
  bool _1665;
  float _1667;
  bool _1670;
  bool _1672;
  uint _1679;
  half _1690;
  bool _1694;
  int _1706;
  bool _1707;
  bool _1708;
  bool _1709;
  float _1710;
  float _1711;
  float _1712;
  float _1713;
  float _1718;
  bool _1720;
  float _1777;
  float2 _1784;
  float _1793;
  float _1796;
  float _1797;
  float _1805;
  float _1810;
  float _1811;
  int _1814;
  int _1815;
  float _1816;
  float _1817;
  float _1820;
  float _1821;
  int4 _1823;
  int _1846;
  float _1884;
  float _1885;
  float _1886;
  float _1887;
  float _1891;
  float _1908;
  float _1909;
  float _1912;
  bool _1927;
  float _1929;
  float _1931;
  bool _1935;
  float _1962;
  float _1967;
  float _1968;
  float _1969;
  float _1970;
  float _1971;
  float _1972;
  float _1973;
  float _1974;
  float _1976;
  float _1989;
  float _1990;
  float _1991;
  float _1992;
  int _1994;
  int _1995;
  int _1996;
  int _1997;
  bool _2036;
  bool _2037;
  bool _2038;
  bool _2039;
  int _2051;
  bool _2066;
  bool _2088;
  bool _2095;
  int4 _2134;
  float _2153;
  float _2154;
  float _2155;
  float _2157;
  float _2162;
  float _2177;
  float _2178;
  float _2179;
  float _2181;
  float _2186;
  float _2201;
  float _2202;
  float _2203;
  float _2205;
  float _2210;
  float _2225;
  float _2226;
  float _2227;
  float _2229;
  float _2234;
  float _2237;
  float _2254;
  float _2255;
  float _2256;
  float _2257;
  float _2262;
  float _2264;
  float _2266;
  float _2268;
  float _2270;
  float _2271;
  float _2272;
  float _2273;
  int _2276;
  int _2277;
  int _2285;
  int _2287;
  float _2306;
  uint _2307;
  half4 _2309;
  uint _2314;
  half4 _2315;
  half4 _2320;
  half4 _2325;
  float _2330;
  float _2339;
  float _2344;
  float _2357;
  float _2360;
  bool _2361;
  bool _2366;
  float _2367;
  float _2369;
  float4 _2380;
  float _2385;
  float _2387;
  float _2388;
  float _2389;
  float _2390;
  float _2391;
  float _2392;
  float _2434;
  float _2451;
  float _2452;
  float _2453;
  float _2458;
  float _2473;
  float _2501;
  float _2502;
  float _2503;
  float _2510;
  float _2511;
  float _2512;
  float _2520;
  float _2526;
  float _2536;
  float _2537;
  float _2538;
  bool _2546;
  bool _2556;
  half _2559;
  uint _2569;
  int _2571;
  float4 _2578;
  float _2590;
  float _2594;
  float _2595;
  float _2596;
  float _2598;
  float _2599;
  float _2600;
  float _2601;
  float _2606;
  float _2608;
  float _2609;
  float _2610;
  float _2611;
  float _2616;
  float _2621;
  float _2623;
  float _2625;
  float _2649;
  float _2653;
  float _2657;
  float _2661;
  float _2699;
  float _2700;
  float _2701;
  float _2705;
  float _2741;
  float _2752;
  float _2753;
  float _2754;
  float _2755;
  float _2759;
  float _2760;
  float _2761;
  float _2777;
  float _2778;
  float _2779;
  float _2780;
  float _2781;
  float _2782;
  float _2783;
  bool _2786;
  float _2788;
  float _2792;
  float _2793;
  float _2797;
  float _2802;
  int _2808;
  bool _2811;
  float _2814;
  float _2818;
  float _2823;
  float _2849;
  float _2860;
  float _2866;
  float _2890;
  float _2903;
  half _2916;
  float _2934;
  float _2945;
  float _2946;
  float _2947;
  float _2948;
  float _2949;
  float _2950;
  float _2951;
  float _2952;
  float _2978;
  float _2979;
  float _2980;
  float _2993;
  float _2994;
  float _2995;
  float _2996;
  float _3021;
  float _3022;
  float _3023;
  float _3024;
  bool _3026;
  float _3039;
  float _3042;
  float _3043;
  float _3053;
  float _3054;
  int _3057;
  int _3058;
  float _3059;
  float _3060;
  int4 _3070;
  int _3077;
  float _3094;
  float _3095;
  float _3096;
  float _3097;
  float _3112;
  float _3113;
  float _3114;
  float _3115;
  bool _3136;
  uint _3137;
  half4 _3139;
  float _3152;
  uint _3158;
  half4 _3159;
  float _3172;
  half4 _3182;
  float _3195;
  half4 _3205;
  float _3218;
  float _3242;
  float _3244;
  float _3246;
  float _3248;
  float _3249;
  float _3256;
  float _3263;
  float _3271;
  float _3272;
  float _3273;
  float _3286;
  float _3296;
  float _3297;
  float _3298;
  float _3306;
  float _3311;
  bool _3312;
  int _3314;
  bool _3334;
  float _3335;
  float2 _3358;
  float2 _3364;
  float _3371;
  float _3372;
  float _3374;
  float _3382;
  float _3384;
  float _3391;
  float _3394;
  float _3395;
  float _3397;
  float _3405;
  float _3406;
  float _3407;
  float4 _3412;
  float _3416;
  float _3417;
  float _3418;
  float _3420;
  float _3424;
  float _3425;
  float _3426;
  float _3428;
  float2 _3441;
  float _3448;
  float _3458;
  float2 _3463;
  float2 _3468;
  float _3472;
  float _3474;
  float _3491;
  float _3495;
  float _3496;
  float _3497;
  float _3504;
  float2 _3528;
  float _3545;
  float _3552;
  float _3553;
  float _3554;
  float _3579;
  float4 _3589;
  bool _3619;
  float4 _3639;
  float _3655;
  float _3658;
  float _3671;
  float _3672;
  float _3673;
  float _3678;
  float _3683;
  float _3694;
  float _3712;
  float _3724;
  bool _3725;
  float _3728;
  float _3773;
  float _3774;
  float _3775;
  float _3780;
  float _3783;
  float _3790;
  float _3791;
  half4 _3836;
  float _3841;
  float _3842;
  float _3843;
  uint _3847;
  float _3863;
  float _3864;
  float _3865;
  float _3867;
  bool _3880;
  float _3919;
  float _3920;
  float _3924;
  float _3926;
  float _3931;
  float _3936;
  float _3944;
  float _3951;
  float2 _3979;
  float _4001;
  float _4019;
  float _4020;
  float _4021;
  float _4037;
  float _4045;
  float _4057;
  float _4060;
  float _4066;
  float _4094;
  float _4096;
  float _4103;
  float _4104;
  float _4105;
  float _4106;
  float _4126;
  float _4127;
  float _4128;
  float _4136;
  float _4137;
  bool _4140;
  bool _4143;
  float _4144;
  bool _4152;
  float _4159;
  float _4160;
  float _4161;
  uint16_t _4163;
  float _4186;
  float _4187;
  float _4188;
  float _4189;
  float _4200;
  float _4205;
  float _4206;
  float _4207;
  float _4209;
  float _4210;
  float _4211;
  float _4212;
  bool _4213;
  float _4226;
  float _4236;
  float _4237;
  float _4238;
  float _4239;
  int _4240;
  bool _4241;
  bool _4244;
  float _4258;
  float _4267;
  float _4268;
  bool _4270;
  float _4272;
  float _4273;
  float _4274;
  bool _4275;
  bool _4277;
  int _4278;
  float _4317;
  float _4332;
  float _4333;
  float _4334;
  float _4335;
  float _4336;
  float _4337;
  float _4338;
  float _4340;
  float _4341;
  float _4342;
  float _4343;
  float _4344;
  float _4345;
  float _4347;
  float _4349;
  float _4350;
  float _4352;
  bool _4353;
  bool _4354;
  bool _4355;
  float _4390;
  float _4394;
  float4 _4399;
  float _4403;
  float _4404;
  float _4405;
  float _4406;
  float _4417;
  float _4418;
  float _4424;
  float _4428;
  float _4429;
  float _4430;
  float _4434;
  float _4435;
  float _4436;
  float _4443;
  float _4447;
  float _4454;
  float _4455;
  float _4456;
  float _4457;
  float _4458;
  float _4459;
  float _4461;
  float _4475;
  float _4476;
  float _4483;
  float _4492;
  float _4497;
  float _4503;
  float _4504;
  float _4508;
  float _4509;
  float _4514;
  float _4515;
  float _4516;
  float _4517;
  float _4529;
  float _4533;
  float _4543;
  float _4544;
  float _4548;
  float _4550;
  float _4551;
  float _4564;
  float _4571;
  float _4572;
  float _4582;
  float _4593;
  float _4598;
  float _4617;
  float _4619;
  float _4621;
  float _4623;
  float _4630;
  float _4631;
  float _4632;
  float _4639;
  float _4640;
  float _4641;
  bool _4653;
  float _4668;
  float _4674;
  float _4675;
  float _4676;
  float _4677;
  float _4678;
  float _4679;
  float _4680;
  float _4687;
  float _4700;
  float _4703;
  float _4704;
  float _4706;
  float _4709;
  float _4710;
  float _4711;
  float _4715;
  float _4716;
  float _4717;
  float _4718;
  float _4719;
  float _4720;
  float _4732;
  float _4736;
  float _4740;
  float _4741;
  float _4742;
  float _4743;
  float _4755;
  float _4759;
  float _4775;
  float _4780;
  float _4781;
  float _4791;
  float _4816;
  float _4832;
  float _4833;
  float _4834;
  float _4835;
  float _4838;
  float _4839;
  float _4840;
  float _4845;
  float _4846;
  float _4873;
  float _4876;
  float _4877;
  float _4879;
  float _4882;
  float _4883;
  float _4887;
  float _4888;
  float _4889;
  float _4891;
  float _4892;
  float _4904;
  float _4908;
  bool _4922;
  float _4929;
  float _4941;
  float _4945;
  float _4952;
  float _4965;
  float _4974;
  float _4997;
  float _4998;
  float _4999;
  float _5000;
  float _5001;
  float _5002;
  bool _5004;
  float _5047;
  float _5048;
  float _5049;
  float _5050;
  float _5051;
  float _5052;
  float _5073;
  float _5085;
  float _5089;
  float _5090;
  float _5092;
  float _5097;
  float _5105;
  float _5111;
  float _5113;
  float _5118;
  float _5132;
  float _5142;
  float _5145;
  float _5152;
  float _5153;
  float _5154;
  float _5160;
  float2 _5169;
  float2 _5172;
  float2 _5175;
  float _5184;
  float _5185;
  float _5186;
  float _5187;
  float _5188;
  float _5189;
  float _5190;
  float _5191;
  float _5192;
  float _5193;
  float _5194;
  float _5195;
  float _5196;
  float _5197;
  float _5198;
  float _5199;
  float _5200;
  float _5201;
  float _5211;
  float _5212;
  float _5213;
  float _5214;
  float _5215;
  float _5216;
  float _5224;
  float _5225;
  float _5226;
  float _5227;
  float _5229;
  float _5230;
  float _5231;
  float _5232;
  float _5233;
  float _5234;
  float _5238;
  float _5239;
  float _5249;
  float _5272;
  float _5276;
  float _5280;
  float _5298;
  float _5305;
  float _5306;
  float _5307;
  float _5311;
  float _5318;
  float _5325;
  float _5333;
  float _5354;
  float _5386;
  float _5396;
  float _5423;
  float _5424;
  float _5425;
  float _5427;
  float _5429;
  float _5431;
  float _5467;
  float _5469;
  float _5476;
  float _5479;
  float _5480;
  float _5482;
  float _5488;
  float _5489;
  float4 _5494;
  float _5498;
  float _5499;
  float _5500;
  float _5502;
  float _5506;
  float _5507;
  float _5508;
  float _5510;
  float _5511;
  float _5512;
  float _5513;
  float _5525;
  float _5526;
  float _5529;
  float _5530;
  float _5544;
  float _5546;
  float _5548;
  float _5549;
  float _5551;
  float _5567;
  float _5574;
  float _5579;
  float _5608;
  float _5609;
  float _5610;
  uint _5613;
  bool _5628;
  float _5660;
  float _5664;
  float _5665;
  float _5666;
  float _5669;
  half _5676;
  half _5677;
  half _5678;
  bool _5698;
  half _5699;
  float _5700;
  float _5701;
  float _5702;
  float _5710;
  float _5716;
  float _5723;
  float _5724;
  float _5725;
  float _5726;
  float _5727;
  float _5728;
  float2 _5737;
  float _5746;
  float _5747;
  float _5748;
  float _5750;
  float _5757;
  float _5758;
  float _5759;
  float _5776;
  float _5777;
  float _5778;
  float _5779;
  float _5790;
  half _5800;
  half _5801;
  half _5802;
  float _5804;
  float _5805;
  float _5806;
  float _5810;
  float _5818;
  float _5841;
  float _5842;
  float _5843;
  float _5872;
  float _5873;
  float _5874;
  float _5875;
  float _5888;
  float _5889;
  float _5890;
  float _5902;
  float _5903;
  float _5904;
  float _5926;
  float _5927;
  float _5928;
  float _5933;
  float _5996;
  float _6000;
  float _6014;
  float _6015;
  float _6016;
  float _6020;
  float _6021;
  float _6022;
  float _6038;
  float _6039;
  float _6043;
  int _55[4];
  _69 = (int)(SV_GroupID.x) & 15;
  _70 = (uint)(_69) >> 2;
  _78 = asint(__3__35__0__0__TileConstantBuffer_raw_uint[((int)((uint)(SV_GroupID.x) >> 7))]);
  _55[0] = _78.x;
  _55[1] = _78.y;
  _55[2] = _78.z;
  _55[3] = _78.w;
  _88 = _55[min((uint)((((uint)(SV_GroupID.x) >> 5) & 3)), 3u)];
  _92 = select((((int)(SV_GroupID.x) & 16) == 0), _88, ((uint)(_88) >> 16));
  _98 = (((uint)((_69 - (_70 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)(_92 << 5)) & 8160));
  _100 = (((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)(_92) >> 3) & 8160));
  _101 = (float)((uint)_98);
  _102 = (float)((uint)_100);
  _103 = _101 + 0.5f;
  _104 = _102 + 0.5f;
  _108 = _bufferSizeAndInvSize.z * _103;
  _109 = _104 * _bufferSizeAndInvSize.w;
  _111 = __3__36__0__0__g_depth.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_depth_load]
  _114 = __3__36__0__0__g_stencil.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_stencil_load]
  _116 = _114.x & 127;  // [sem: _3__36__0__0__g_stencil_load_derived]
  _119 = max(1.0000000116860974e-07f, _111.x);  // [sem: _3__36__0__0__g_depth_load_derived]
  _120 = _nearFarProj.x / _119;
  // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
  // Description: Crimson Desert 1.11 changed RenderDiffuseTiled to evaluate partially valid 2x2 quads while preserving the original per-pixel invalid predicate for full-resolution scene-color writes. This block computes the per-pixel invalid flag and quad-lane validity flags used by the 1.11 half-resolution history fallback.
  bool _rndx_invalidPixel = (((_111.x < 1.0000000116860974e-07f) || (_111.x == 1.0f)) || (_116 == 10));
  float _rndx_invalidPixelF = (float)((bool)_rndx_invalidPixel);
  bool _rndx_quadInvalid0 = !(QuadReadLaneAt(_rndx_invalidPixelF, 0) == 0.0f);
  bool _rndx_quadInvalid1 = !(QuadReadLaneAt(_rndx_invalidPixelF, 1) == 0.0f);
  bool _rndx_quadInvalid2 = !(QuadReadLaneAt(_rndx_invalidPixelF, 2) == 0.0f);
  bool _rndx_quadInvalid3 = !(QuadReadLaneAt(_rndx_invalidPixelF, 3) == 0.0f);
  // RenoDX: <<< [Patch: Native111InvalidLaneParity]
  if (!(((_rndx_quadInvalid0 && _rndx_quadInvalid1) && _rndx_quadInvalid2) && _rndx_quadInvalid3)) {
    _128 = __3__36__0__0__g_baseColor.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_baseColor_load]
    _134 = __3__36__0__0__g_normal.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_normal_load]
    _143 = half(((float)((uint)((uint)(((uint)((uint)(_128.x)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _147 = half(((float)((uint)((uint)(_128.x & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _152 = half(((float)((uint)((uint)(((uint)((uint)(_128.y)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _156 = half(((float)((uint)((uint)(_128.y & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _161 = half(((float)((uint)((uint)(((uint)((uint)(_128.z)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _165 = half(((float)((uint)((uint)(_128.z & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _177 = uint((_134.w * 3.0f) + 0.5f);  // [sem: _3__36__0__0__g_normal_load_derived]
    _178 = (_177 == 1);
    _179 = (_177 == 3);
    _189 = (saturate(_134.x * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _190 = (saturate(_134.y * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _191 = (saturate(_134.z * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _193 = rsqrt(dot(float3(_189, _190, _191), float3(_189, _190, _191)));  // [sem: invLength]
    _197 = half(_193 * _189);
    _198 = half(_193 * _190);
    _199 = half(_191 * _193);
  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _202 = ((half)((half)(half(((float)((uint)((uint)(((uint)((uint)(_128.w)) >> 8) & 255)))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;
    _203 = ((half)((half)(half(((float)((uint)((uint)(_128.w & 255)))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _208 = float(_202 + _203) * 0.5f;
    _209 = float(_202 - _203) * 0.5f;
    _213 = (1.0f - abs(_208)) - abs(_209);
    _215 = rsqrt(dot(float3(_208, _209, _213), float3(_208, _209, _213)));  // [sem: invLength]
    _222 = float(_197);
    _223 = float(_198);
    _224 = float(_199);
    _226 = select((_199 >= 0.0h), 1.0f, -1.0f);
    _229 = -0.0f - (1.0f / (_226 + _224));
    _230 = _223 * _229;
    _231 = _230 * _222;
    _232 = _226 * _222;
    _238 = -0.0f - _223;
    _239 = float(half(_215 * _208));
    _240 = float(half(_215 * _209));
    _241 = float(half(_215 * _213));
    _253 = half(mad(_241, _222, mad(_240, _231, (_239 * (((_232 * _222) * _229) + 1.0f)))));
    _254 = half(mad(_241, _223, mad(_240, ((_230 * _223) + _226), ((_239 * _226) * _231))));
    _255 = half(mad(_241, _224, mad(_240, _238, (-0.0f - (_232 * _239)))));
    _257 = rsqrt((half)(dot(half3(_253, _254, _255), half3(_253, _254, _255))));  // [sem: invLength]
    _258 = _257 * _253;
    _259 = _257 * _254;
    _260 = _257 * _255;
    _264 = saturate((half)(_143 * _143));  // [sem: expr_sat]
    _265 = saturate((half)(_147 * _147));  // [sem: expr_sat]
    _266 = saturate((half)(_152 * _152));  // [sem: expr_sat]
  // [sem: expr_sat]
    _282 = saturate((half)(((half)(((half)(_265 * 0.3395996h)) + ((half)(_264 * 0.61328125h)))) + ((half)(_266 * 0.04736328h))));
  // [sem: expr_sat]
    _283 = saturate((half)(((half)(((half)(_265 * 0.9165039h)) + ((half)(_264 * 0.07019043h)))) + ((half)(_266 * 0.013450623h))));
  // [sem: expr_sat]
    _284 = saturate((half)(((half)(((half)(_265 * 0.109558105h)) + ((half)(_264 * 0.020614624h)))) + ((half)(_266 * 0.8696289h))));
    if ((uint)(_116 + -65) < (uint)2) {
      _481 = _156;
      _482 = _197;
      _483 = _198;
      _484 = _199;
      _492 = _481;
      _493 = _482;
      _494 = _483;
      _495 = _484;
      _496 = ((int)((int)((uint)(max((int)(1), (int)(_98))) + (uint)(-1))) >> 1);
      _497 = ((int)((int)((uint)(max((int)(1), (int)(_100))) + (uint)(-1))) >> 1);
      _498 = _108;
      _499 = _109;
    } else {
      _289 = (_116 == 29);
      _291 = select(((_116 == 24) || _289), 0.0f, _156);
      if (_289) {
        _308 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_bufferSizeAndInvSize.x * float((int)(_100))) + float((int)(_98)));
        _316 = ((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
        _324 = ((uint)((((int)((_316 << 4) + (uint)(-1556008596))) ^ ((int)(_316 + 1013904242u))) ^ (((uint)(_316) >> 5) + -939442524))) + _308;
        _332 = ((uint)((((int)((_324 << 4) + (uint)(-1383041155))) ^ ((int)(_324 + 1013904242u))) ^ ((int)(((uint)((uint)(_324) >> 5)) + 2123724318u)))) + _316;
        _340 = ((uint)((((int)((_332 << 4) + (uint)(-1556008596))) ^ ((int)(_332 + (uint)(-626627285)))) ^ (((uint)(_332) >> 5) + -939442524))) + _324;
        _348 = ((uint)((((int)((_340 << 4) + (uint)(-1383041155))) ^ ((int)(_340 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_340) >> 5)) + 2123724318u)))) + _332;
        _356 = ((uint)((((int)((_348 << 4) + (uint)(-1556008596))) ^ ((int)(_348 + 2027808484u))) ^ (((uint)(_348) >> 5) + -939442524))) + _340;
        _364 = ((uint)((((int)((_356 << 4) + (uint)(-1383041155))) ^ ((int)(_356 + 2027808484u))) ^ ((int)(((uint)((uint)(_356) >> 5)) + 2123724318u)))) + _348;
        _372 = ((uint)((((int)((_364 << 4) + (uint)(-1556008596))) ^ ((int)(_364 + 387276957u))) ^ (((uint)(_364) >> 5) + -939442524))) + _356;
        _380 = ((uint)((((int)((_372 << 4) + (uint)(-1383041155))) ^ ((int)(_372 + 387276957u))) ^ ((int)(((uint)((uint)(_372) >> 5)) + 2123724318u)))) + _364;
        _388 = ((uint)((((int)((_380 << 4) + (uint)(-1556008596))) ^ ((int)(_380 + (uint)(-1253254570)))) ^ (((uint)(_380) >> 5) + -939442524))) + _372;
        _396 = ((uint)((((int)((_388 << 4) + (uint)(-1383041155))) ^ ((int)(_388 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_388) >> 5)) + 2123724318u)))) + _380;
        _404 = ((uint)((((int)((_396 << 4) + (uint)(-1556008596))) ^ ((int)(_396 + 1401181199u))) ^ (((uint)(_396) >> 5) + -939442524))) + _388;
        _412 = ((uint)((((int)((_404 << 4) + (uint)(-1383041155))) ^ ((int)(_404 + 1401181199u))) ^ ((int)(((uint)((uint)(_404) >> 5)) + 2123724318u)))) + _396;
        _420 = ((uint)((((int)((_412 << 4) + (uint)(-1556008596))) ^ ((int)(_412 + (uint)(-239350328)))) ^ (((uint)(_412) >> 5) + -939442524))) + _404;
        _428 = ((uint)((((int)((_420 << 4) + (uint)(-1383041155))) ^ ((int)(_420 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_420) >> 5)) + 2123724318u)))) + _412;
        if ((_420 & 16777215) == 0) {
          _441 = ((int)(((uint)((((int)((_428 << 4) + (uint)(-1556008596))) ^ ((int)(_428 + (uint)(-1879881855)))) ^ (((uint)(_428) >> 5) + -939442524))) + _420));
        } else {
          _441 = _420;
        }
        _470 = int(min(max(((((saturate(1.0f - (_120 * 0.015625f)) * 4.0f) * ((((float)((uint)((uint)(((int)(_441 * 48271)) & 16777215)))) * 1.1920928955078125e-07f) + -1.0f)) + float((int)((int)((uint)(max((int)(1), (int)(_98))) + (uint)(-1))))) * 0.5f), 0.0f), ((_bufferSizeAndInvSize.x * 0.5f) + -2.0f)));
        _471 = int(min(max((float((int)((int)((uint)(max((int)(1), (int)(_100))) + (uint)(-1)))) * 0.5f), 0.0f), ((_bufferSizeAndInvSize.y * 0.5f) + -2.0f)));
        _492 = _291;
        _493 = _258;
        _494 = _259;
        _495 = _260;
        _496 = _470;
        _497 = _471;
        _498 = ((_bufferSizeAndInvSize.z * 2.0f) * (float((int)(_470)) + 0.5f));
        _499 = ((_bufferSizeAndInvSize.w * 2.0f) * (float((int)(_471)) + 0.5f));
      } else {
        _481 = _291;
        _482 = _258;
        _483 = _259;
        _484 = _260;
        _492 = _481;
        _493 = _482;
        _494 = _483;
        _495 = _484;
        _496 = ((int)((int)((uint)(max((int)(1), (int)(_98))) + (uint)(-1))) >> 1);
        _497 = ((int)((int)((uint)(max((int)(1), (int)(_100))) + (uint)(-1))) >> 1);
        _498 = _108;
        _499 = _109;
      }
    }
    _502 = __3__36__0__0__g_normalDepthHalf.GatherGreen(__3__40__0__0__g_samplerPoint, float2(_498, _499));  // [sem: _3__36__0__0__g_normalDepthHalf_gather]
    _507 = (uint)((uint)(_502.w)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _511 = (uint)((uint)(_502.z)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _515 = (uint)((uint)(_502.x)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _519 = (uint)((uint)(_502.y)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _544 = (max(0.0f, (_120 + -1.0f)) * 0.05000000074505806f) * _temporalReprojectionParams.y;
    _549 = max(0.0f, (abs(_120 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_502.w & 16777215)))) * 5.960465188081798e-08f)))) - _544));
    _550 = max(0.0f, (abs(_120 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_502.z & 16777215)))) * 5.960465188081798e-08f)))) - _544));
    _551 = max(0.0f, (abs(_120 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_502.x & 16777215)))) * 5.960465188081798e-08f)))) - _544));
    _552 = max(0.0f, (abs(_120 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_502.y & 16777215)))) * 5.960465188081798e-08f)))) - _544));
    _553 = _507 & 127;
    _554 = _511 & 127;
    _555 = _515 & 127;
    _556 = _519 & 127;
    if ((uint)_116 > (uint)11) {
      if (!(((uint)_116 < (uint)21) || (_116 == 107))) {
        _594 = (_116 == 7);
      } else {
        _594 = true;
      }
    } else {
      if (!(_116 == 6)) {
        _594 = (_116 == 7);
      } else {
        _594 = true;
      }
    }
    _596 = _120 * _120;
    _601 = select(_594, -7.213475227355957f, -72.13475036621094f) * (1.0f / ((select(_594, 0.05000000074505806f, 0.009999999776482582f) * _596) + 1.0f));
    _614 = _114.x & 126;  // [sem: _3__36__0__0__g_stencil_load_derived]
    _617 = (_614 == 66) || (_116 == 54);
    _646 = __3__36__0__0__g_normalDepthHalf.GatherRed(__3__40__0__0__g_samplerPoint, float2(_498, _499));  // [sem: _3__36__0__0__g_normalDepthHalf_gather]
    _665 = min(1.0f, ((((float)((uint)((uint)(_646.w & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _666 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_646.w)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _667 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_646.w)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _669 = rsqrt(dot(float3(_665, _666, _667), float3(_665, _666, _667)));  // [sem: invLength]
    _673 = float(_493);
    _674 = float(_494);
    _675 = float(_495);
    _691 = min(1.0f, ((((float)((uint)((uint)(_646.z & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _692 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_646.z)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _693 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_646.z)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _695 = rsqrt(dot(float3(_691, _692, _693), float3(_691, _692, _693)));  // [sem: invLength]
    _714 = min(1.0f, ((((float)((uint)((uint)(_646.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _715 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_646.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _716 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_646.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _718 = rsqrt(dot(float3(_714, _715, _716), float3(_714, _715, _716)));  // [sem: invLength]
    _737 = min(1.0f, ((((float)((uint)((uint)(_646.y & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _738 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_646.y)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _739 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_646.y)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _741 = rsqrt(dot(float3(_737, _738, _739), float3(_737, _738, _739)));  // [sem: invLength]
    _746 = (_116 == 29);
    _747 = select(_746, 8192.0f, 256.0f);
    _760 = exp2(log2(saturate(dot(float3(_673, _674, _675), float3((_669 * _665), (_669 * _666), (_669 * _667))))) * _747);
    _761 = exp2(log2(saturate(dot(float3(_673, _674, _675), float3((_695 * _691), (_695 * _692), (_695 * _693))))) * _747);
    _762 = exp2(log2(saturate(dot(float3(_673, _674, _675), float3((_718 * _714), (_718 * _715), (_718 * _716))))) * _747);
    _763 = exp2(log2(saturate(dot(float3(_673, _674, _675), float3((_741 * _737), (_741 * _738), (_741 * _739))))) * _747);
    _768 = 1.0f / max(9.999999974752427e-07f, (((_761 + _760) + _762) + _763));
    _771 = ((exp2((_549 * _549) * _601) * ((float)((bool)((uint)(!(_617 ^ (((_507 & 126) == 66) || (_553 == 54)))))))) * _760) * _768;
    _774 = ((exp2((_550 * _550) * _601) * ((float)((bool)((uint)(!(_617 ^ (((_511 & 126) == 66) || (_554 == 54)))))))) * _761) * _768;
    _777 = ((exp2((_551 * _551) * _601) * ((float)((bool)((uint)(!(_617 ^ (((_515 & 126) == 66) || (_555 == 54)))))))) * _762) * _768;
    _780 = ((exp2((_552 * _552) * _601) * ((float)((bool)((uint)(!(_617 ^ (((_519 & 126) == 66) || (_556 == 54)))))))) * _763) * _768;
    if (_746) {
      _811 = abs(((float((int)(_98)) * 0.5f) + -0.25f) - float((int)(_496)));
      _812 = abs(((float((int)(_100)) * 0.5f) + -0.25f) - float((int)(_497)));
    } else {
      _811 = (((float)((uint)((_98 - (_496 << 1)) - ((uint)(_frameNumber.x & 1))))) * 0.5f);
      _812 = (((float)((uint)((_100 - (_497 << 1)) - ((uint)(((uint)((uint)(_frameNumber.x)) >> 1) & 1))))) * 0.5f);
    }
    _813 = saturate(_811);  // [sem: _811_sat]
    _814 = saturate(_812);  // [sem: _812_sat]
    _815 = 1.0f - _813;
    _816 = 1.0f - _814;
    _817 = _816 * _815;
    _818 = _816 * _813;
    _819 = _815 * _814;
    _820 = _814 * _813;
    _829 = (_116 != 29) && ((_780 == 0.0f) && ((_777 == 0.0f) && ((_771 == 0.0f) && (_774 == 0.0f))));
    _838 = saturate(_817 * select(_829, 1.0f, _771));  // [sem: expr_sat]
    _839 = saturate(_818 * select(_829, 1.0f, _774));  // [sem: expr_sat]
    _840 = saturate(_819 * select(_829, 1.0f, _777));  // [sem: expr_sat]
    _841 = saturate(_820 * select(_829, 1.0f, _780));  // [sem: expr_sat]
    _842 = dot(float4(_838, _839, _840, _841), float4(1.0f, 1.0f, 1.0f, 1.0f));
    _843 = max(0.0f, _842);
    _848 = saturate(_838 / _843);  // [sem: expr_sat]
    _849 = saturate(_839 / _843);  // [sem: expr_sat]
    _850 = saturate(_840 / _843);  // [sem: expr_sat]
    _851 = saturate(_841 / _843);  // [sem: expr_sat]
    _855 = (float)((bool)((uint)(((((_556 == 6) || ((_556 == 107) || ((uint)(_556 + -12) < (uint)9))) || (((_555 == 6) || ((_555 == 107) || ((uint)(_555 + -12) < (uint)9))) || (((_553 == 6) || ((_553 == 107) || ((uint)(_553 + -12) < (uint)9))) || ((_554 == 6) || ((_554 == 107) || ((uint)(_554 + -12) < (uint)9)))))) || _594) && (_842 < 9.999999747378752e-05f))));
    _864 = ((_817 - _848) * _855) + _848;
    _865 = ((_818 - _849) * _855) + _849;
    _866 = ((_819 - _850) * _855) + _850;
    _867 = ((_820 - _851) * _855) + _851;
    half4 _869 = __3__36__0__0__g_diffuseResult.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _879 = _496 + 1u;
    half4 _880 = __3__36__0__0__g_diffuseResult.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _893 = _497 + 1u;
    half4 _894 = __3__36__0__0__g_diffuseResult.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    half4 _907 = __3__36__0__0__g_diffuseResult.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _921 = __3__36__0__0__g_specularResult.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _928 = __3__36__0__0__g_specularResult.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _938 = __3__36__0__0__g_specularResult.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _948 = __3__36__0__0__g_specularResult.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _967 = (_116 == 38) || (((uint)(_116 + -27) < (uint)2) || ((_116 == 26) || (((uint)(_116 + -105) < (uint)2) || _179)));
    _969 = (_108 * 2.0f) + -1.0f;
    _971 = 1.0f - (_109 * 2.0f);
    _1007 = mad((_invViewProjRelative[2].w), _119, mad((_invViewProjRelative[1].w), _971, ((_invViewProjRelative[0].w) * _969))) + (_invViewProjRelative[3].w);
    _1008 = (mad((_invViewProjRelative[2].x), _119, mad((_invViewProjRelative[1].x), _971, ((_invViewProjRelative[0].x) * _969))) + (_invViewProjRelative[3].x)) / _1007;
    _1009 = (mad((_invViewProjRelative[2].y), _119, mad((_invViewProjRelative[1].y), _971, ((_invViewProjRelative[0].y) * _969))) + (_invViewProjRelative[3].y)) / _1007;
    _1010 = (mad((_invViewProjRelative[2].z), _119, mad((_invViewProjRelative[1].z), _971, ((_invViewProjRelative[0].z) * _969))) + (_invViewProjRelative[3].z)) / _1007;
    _1012 = rsqrt(dot(float3(_1008, _1009, _1010), float3(_1008, _1009, _1010)));  // [sem: invLength]
    _1013 = _1012 * _1008;
    _1014 = _1012 * _1009;
    _1015 = _1012 * _1010;
    _1016 = (_116 == 33);
    _1018 = (_116 == 55);
    if ((_614 == 64) || ((_1016 || _617) || (_1018 || _967))) {
      _1025 = __3__36__0__0__g_character.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_character_load]
      _1031 = _1025.x;  // [sem: _3__36__0__0__g_character_load_derived]
      _1032 = _1025.y;  // [sem: _3__36__0__0__g_character_load_derived]
      _1033 = _1025.z;  // [sem: _3__36__0__0__g_character_load_derived]
      _1034 = _1025.w;  // [sem: _3__36__0__0__g_character_load_derived]
    } else {
      _1031 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _1032 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _1033 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _1034 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
    }
    if (_1016) {
      _1041 = uint((_1033 * 255.0f) + 0.5f);
      _1043 = ((uint)(_1041) >> 4) & 7;
      if (!(_1043 == 0)) {
        _1050 = __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((int)(_1043 + 1))];
        _1056 = 1.0f;
        _1057 = min((1.0f - _1050.y), _1050.x);
        _1058 = (((float)((uint)((uint)(_1041 & 15)))) * 0.06666667014360428f);
        _1059 = _1050.y;
        _1060 = _1050.x;
      } else {
        _1056 = 0.0f;
        _1057 = 0.0f;
        _1058 = 0.0f;
        _1059 = 0.0f;
        _1060 = 0.0f;
      }
      _1066 = _116;
      _1067 = (half)(half(_effectiveMetallicForVelvet * _1060));
      _1068 = _1056;
      _1069 = _1057;
      _1070 = _1058;
      _1071 = _1059;
      _1072 = _1060;
    } else {
      if (_1018) {
        if (!(_1033 < 0.0010000000474974513f)) {
          _1041 = uint((_1033 * 255.0f) + 0.5f);
          _1043 = ((uint)(_1041) >> 4) & 7;
          if (!(_1043 == 0)) {
            _1050 = __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((int)(_1043 + 1))];
            _1056 = 1.0f;
            _1057 = min((1.0f - _1050.y), _1050.x);
            _1058 = (((float)((uint)((uint)(_1041 & 15)))) * 0.06666667014360428f);
            _1059 = _1050.y;
            _1060 = _1050.x;
          } else {
            _1056 = 0.0f;
            _1057 = 0.0f;
            _1058 = 0.0f;
            _1059 = 0.0f;
            _1060 = 0.0f;
          }
          _1066 = _116;
          _1067 = (half)(half(_effectiveMetallicForVelvet * _1060));
          _1068 = _1056;
          _1069 = _1057;
          _1070 = _1058;
          _1071 = _1059;
          _1072 = _1060;
        } else {
          _1066 = 53;
          _1067 = _492;
          _1068 = 0.0f;
          _1069 = 0.0f;
          _1070 = 0.0f;
          _1071 = 0.0f;
          _1072 = 0.0f;
        }
      } else {
        _1066 = _116;
        _1067 = _492;
        _1068 = 0.0f;
        _1069 = 0.0f;
        _1070 = 0.0f;
        _1071 = 0.0f;
        _1072 = 0.0f;
      }
    }
    if (_1066 == 66) {
      _1104 = float(_1067);
      _1138 = _1104;
      _1139 = ((_1031 * 2.0f) + -1.0f);
      _1140 = ((_1032 * 2.0f) + -1.0f);
      _1141 = ((_1033 * 2.0f) + -1.0f);
      _1142 = 0.0h;
      if ((_1066 == 54) || ((_1066 & 126) == 66)) {
        _1148 = _1138;
        _1149 = _1139;
        _1150 = _1140;
        _1151 = _1141;
        _1152 = _1142;
        _1154 = __3__36__0__0__g_bentCone.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
        _1161 = __3__36__0__0__g_bentCone.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
        _1171 = __3__36__0__0__g_bentCone.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
        _1181 = __3__36__0__0__g_bentCone.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
        _1194 = (((((_1161.x * _865) + (_1154.x * _864)) + (_1171.x * _866)) + (_1181.x * _867)) * 2.0f) + -1.0f;
        _1195 = (((((_1161.y * _865) + (_1154.y * _864)) + (_1171.y * _866)) + (_1181.y * _867)) * 2.0f) + -1.0f;
        _1196 = (((((_1161.z * _865) + (_1154.z * _864)) + (_1171.z * _866)) + (_1181.z * _867)) * 2.0f) + -1.0f;
        _1198 = rsqrt(dot(float3(_1194, _1195, _1196), float3(_1194, _1195, _1196)));  // [sem: invLength]
        _1199 = _1194 * _1198;
        _1200 = _1195 * _1198;
        _1201 = _1196 * _1198;
        if (!(_renderParams.z > 0.0f)) {
          if (!(_renderParams2.y > 0.0f)) {
            _1213 = (half)(saturate((half)(_161 + 0.15002441h)));
          } else {
            _1213 = _161;
          }
        } else {
          _1213 = _161;
        }
        _1214 = float(_1213);
        if (_1066 == 54) {
          _1230 = (((asfloat(_globalLightParams.z) * _1214) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_165)));
        } else {
          _1230 = _bevelParams.y;
        }
        _1231 = float(_282);
        _1232 = float(_283);
        _1233 = float(_284);
        _1234 = dot(float3(_1149, _1150, _1151), float3(_1199, _1200, _1201));
        _1235 = -0.0f - _1013;
        _1236 = -0.0f - _1014;
        _1237 = -0.0f - _1015;
        _1238 = dot(float3(_1149, _1150, _1151), float3(_1235, _1236, _1237));
        _1244 = cos(abs(asin(_1238) - asin(_1234)) * 0.5f);
        _1248 = _1199 - (_1234 * _1149);
        _1249 = _1200 - (_1234 * _1150);
        _1250 = _1201 - (_1234 * _1151);
        _1254 = _1235 - (_1238 * _1149);
        _1255 = _1236 - (_1238 * _1150);
        _1256 = _1237 - (_1238 * _1151);
  // [sem: invLength]
        _1263 = rsqrt((dot(float3(_1254, _1255, _1256), float3(_1254, _1255, _1256)) * dot(float3(_1248, _1249, _1250), float3(_1248, _1249, _1250))) + 9.999999747378752e-05f) * dot(float3(_1248, _1249, _1250), float3(_1254, _1255, _1256));
        _1273 = min(max(_1214, 0.09803921729326248f), 1.0f);
        _1274 = _1273 * _1273;
        _1275 = _1274 * 0.5f;
        _1276 = _1274 * 2.0f;
        _1277 = _1238 + _1234;
        _1278 = _1277 - _1230;
        _1287 = 1.0f / ((1.190000057220459f / _1244) + (_1244 * 0.36000001430511475f));
        _1292 = ((_1287 * (0.6000000238418579f - (_1263 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1263 * 0.5f) + 0.5f));
        _1298 = 1.0f - (sqrt(saturate(1.0f - (_1292 * _1292))) * _1244);
        _1299 = _1298 * _1298;
        _1303 = 0.9534794092178345f - ((_1299 * _1299) * (_1298 * 0.9534794092178345f));
        _1304 = _1287 * _1292;
        _1309 = (sqrt(1.0f - (_1304 * _1304)) * 0.5f) / _1244;
        _1310 = log2(_1231);
        _1311 = log2(_1232);
        _1312 = log2(_1233);
        _1324 = ((_1303 * _1303) * (exp2((((_1278 * _1278) * -0.5f) / (_1275 * _1275)) * 1.4426950216293335f) / (_1274 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1263 * 5.2658371925354f));
        _1328 = _1277 - (_1230 * 4.0f);
        _1338 = 1.0f - (_1244 * 0.5f);
        _1339 = _1338 * _1338;
        _1343 = (_1339 * _1339) * (0.9534794092178345f - (_1244 * 0.47673970460891724f));
        _1345 = 0.9534794092178345f - _1343;
        _1346 = 0.800000011920929f / _1244;
        _1359 = (((_1345 * _1345) * (_1343 + 0.04652056470513344f)) * (exp2((((_1328 * _1328) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1274 * 5.013256549835205f))) * exp2((_1263 * 24.525815963745117f) + -24.208423614501953f);
        _1369 = min(0.0f, (-0.0f - ((_1324 * exp2(_1310 * _1309)) + (_1359 * exp2(_1346 * _1310)))));
        _1370 = min(0.0f, (-0.0f - ((_1324 * exp2(_1311 * _1309)) + (_1359 * exp2(_1346 * _1311)))));
        _1371 = min(0.0f, (-0.0f - ((_1324 * exp2(_1312 * _1309)) + (_1359 * exp2(_1346 * _1312)))));
        _1380 = saturate(abs(dot(float3(_1199, _1200, _1201), float3(_1149, _1150, _1151))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _1389 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1310 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _1392 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _1395 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
        _1402 = min(0.9900000095367432f, _1389.x);
        _1403 = min(0.9900000095367432f, _1392.x);
        _1404 = min(0.9900000095367432f, _1395.x);
        _1405 = min(0.9900000095367432f, _1389.y);
        _1406 = min(0.9900000095367432f, _1392.y);
        _1407 = min(0.9900000095367432f, _1395.y);
        _1408 = _1402 * _1402;
        _1409 = _1403 * _1403;
        _1410 = _1404 * _1404;
        _1411 = _1405 * _1405;
        _1412 = _1406 * _1406;
        _1413 = _1407 * _1407;
        _1414 = _1411 * _1405;
        _1415 = _1412 * _1406;
        _1416 = _1413 * _1407;
        _1417 = 1.0f - _1408;
        _1418 = 1.0f - _1409;
        _1419 = 1.0f - _1410;
        _1429 = _1417 * _1417;
        _1430 = _1418 * _1418;
        _1431 = _1419 * _1419;
        _1432 = _1429 * _1417;
        _1433 = _1430 * _1418;
        _1434 = _1431 * _1419;
        _1442 = min(max(_1214, 0.18000000715255737f), 0.6000000238418579f);
        _1443 = _1442 * _1442;
        _1444 = _1443 * 0.25f;
        _1445 = _1443 * 4.0f;
        _1447 = (_1403 + _1402) + _1404;
        _1448 = _1402 / _1447;
        _1449 = _1403 / _1447;
        _1450 = _1404 / _1447;
        _1451 = dot(float3(_1443, _1444, _1445), float3(_1448, _1449, _1450));
        _1452 = _1451 * _1451;
        _1455 = asin(min(max(_1238, -1.0f), 1.0f)) + asin(min(max(_1234, -1.0f), 1.0f));
        _1456 = _1455 * 0.5f;
        _1457 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1448, _1449, _1450));
        _1467 = _1457 * _1457;
        _1490 = (_1406 + _1405) + _1407;
        _1494 = dot(float3(_1443, _1444, _1445), float3((_1405 / _1490), (_1406 / _1490), (_1407 / _1490)));
        _1498 = sqrt((_1494 * _1494) + (_1452 * 2.0f));
        _1516 = (_1494 * 3.0f) + (_1451 * 2.0f);
        _1523 = (((_1414 + _1405) * ((_1408 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1414) + _1405);
        _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1415) + _1406);
        _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1416) + _1407);
        _1534 = _1456 - (((_1467 * (((_1408 * 4.0f) * _1411) + (_1429 * 2.0f))) * (1.0f - ((_1411 * 2.0f) / _1429))) / _1432);
        _1541 = _1456 - (((_1467 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
        _1548 = _1456 - (((_1467 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
        _1576 = exp2((((_1455 * -0.25f) * _1456) / _1452) * 1.4426950216293335f) * 1.399999976158142f;
        _1577 = ((((((_1414 * _1408) / _1432) + ((_1405 * _1408) / _1417)) * 4.398229598999023f) * exp2((((_1534 * _1534) * -0.5f) / ((_1523 * _1523) + _1452)) * 1.4426950216293335f)) + ((((_1389.x + _1369) * 0.25f) - _1369) * 6.2831854820251465f)) * _1576;
        _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1541 * _1541) * -0.5f) / ((_1524 * _1524) + _1452)) * 1.4426950216293335f)) + ((((_1392.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1576;
        _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1548 * _1548) * -0.5f) / ((_1525 * _1525) + _1452)) * 1.4426950216293335f)) + ((((_1395.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1576;
        _1580 = max(0.125f, _1148);
        _1594 = _1148;
        _1595 = _1152;
        _1596 = _1149;
        _1597 = _1150;
        _1598 = _1151;
        _1599 = _1066;
        _1600 = max(0.009999999776482582f, ((_1580 * (_1231 - _1577)) + _1577));
        _1601 = max(0.009999999776482582f, (lerp(_1578, _1232, _1580)));
        _1602 = max(0.009999999776482582f, (lerp(_1579, _1233, _1580)));
      } else {
        _1594 = _1138;
        _1595 = _1142;
        _1596 = _1139;
        _1597 = _1140;
        _1598 = _1141;
        _1599 = _1066;
        _1600 = 0.0f;
        _1601 = 0.0f;
        _1602 = 0.0f;
      }
    } else {
      _1076 = (_1066 == 54);
      if ((_1066 == 67) || _1076) {
        _1083 = (float)((uint)((uint)(((int)(_frameNumber.x * 73)) & 127)));
        if (!(float(_1067) > (frac(frac(dot(float2(((_1083 * 32.665000915527344f) + _101), ((_1083 * 11.8149995803833f) + _102)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) * 0.20000000298023224f))) {
          if ((_1066 & 126) == 66) {
            _1104 = 1.0f;
            _1138 = _1104;
            _1139 = ((_1031 * 2.0f) + -1.0f);
            _1140 = ((_1032 * 2.0f) + -1.0f);
            _1141 = ((_1033 * 2.0f) + -1.0f);
            _1142 = 0.0h;
            if ((_1066 == 54) || ((_1066 & 126) == 66)) {
              _1148 = _1138;
              _1149 = _1139;
              _1150 = _1140;
              _1151 = _1141;
              _1152 = _1142;
              _1154 = __3__36__0__0__g_bentCone.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1161 = __3__36__0__0__g_bentCone.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1171 = __3__36__0__0__g_bentCone.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1181 = __3__36__0__0__g_bentCone.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1194 = (((((_1161.x * _865) + (_1154.x * _864)) + (_1171.x * _866)) + (_1181.x * _867)) * 2.0f) + -1.0f;
              _1195 = (((((_1161.y * _865) + (_1154.y * _864)) + (_1171.y * _866)) + (_1181.y * _867)) * 2.0f) + -1.0f;
              _1196 = (((((_1161.z * _865) + (_1154.z * _864)) + (_1171.z * _866)) + (_1181.z * _867)) * 2.0f) + -1.0f;
              _1198 = rsqrt(dot(float3(_1194, _1195, _1196), float3(_1194, _1195, _1196)));  // [sem: invLength]
              _1199 = _1194 * _1198;
              _1200 = _1195 * _1198;
              _1201 = _1196 * _1198;
              if (!(_renderParams.z > 0.0f)) {
                if (!(_renderParams2.y > 0.0f)) {
                  _1213 = (half)(saturate((half)(_161 + 0.15002441h)));
                } else {
                  _1213 = _161;
                }
              } else {
                _1213 = _161;
              }
              _1214 = float(_1213);
              if (_1066 == 54) {
                _1230 = (((asfloat(_globalLightParams.z) * _1214) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_165)));
              } else {
                _1230 = _bevelParams.y;
              }
              _1231 = float(_282);
              _1232 = float(_283);
              _1233 = float(_284);
              _1234 = dot(float3(_1149, _1150, _1151), float3(_1199, _1200, _1201));
              _1235 = -0.0f - _1013;
              _1236 = -0.0f - _1014;
              _1237 = -0.0f - _1015;
              _1238 = dot(float3(_1149, _1150, _1151), float3(_1235, _1236, _1237));
              _1244 = cos(abs(asin(_1238) - asin(_1234)) * 0.5f);
              _1248 = _1199 - (_1234 * _1149);
              _1249 = _1200 - (_1234 * _1150);
              _1250 = _1201 - (_1234 * _1151);
              _1254 = _1235 - (_1238 * _1149);
              _1255 = _1236 - (_1238 * _1150);
              _1256 = _1237 - (_1238 * _1151);
  // [sem: invLength]
              _1263 = rsqrt((dot(float3(_1254, _1255, _1256), float3(_1254, _1255, _1256)) * dot(float3(_1248, _1249, _1250), float3(_1248, _1249, _1250))) + 9.999999747378752e-05f) * dot(float3(_1248, _1249, _1250), float3(_1254, _1255, _1256));
              _1273 = min(max(_1214, 0.09803921729326248f), 1.0f);
              _1274 = _1273 * _1273;
              _1275 = _1274 * 0.5f;
              _1276 = _1274 * 2.0f;
              _1277 = _1238 + _1234;
              _1278 = _1277 - _1230;
              _1287 = 1.0f / ((1.190000057220459f / _1244) + (_1244 * 0.36000001430511475f));
              _1292 = ((_1287 * (0.6000000238418579f - (_1263 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1263 * 0.5f) + 0.5f));
              _1298 = 1.0f - (sqrt(saturate(1.0f - (_1292 * _1292))) * _1244);
              _1299 = _1298 * _1298;
              _1303 = 0.9534794092178345f - ((_1299 * _1299) * (_1298 * 0.9534794092178345f));
              _1304 = _1287 * _1292;
              _1309 = (sqrt(1.0f - (_1304 * _1304)) * 0.5f) / _1244;
              _1310 = log2(_1231);
              _1311 = log2(_1232);
              _1312 = log2(_1233);
              _1324 = ((_1303 * _1303) * (exp2((((_1278 * _1278) * -0.5f) / (_1275 * _1275)) * 1.4426950216293335f) / (_1274 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1263 * 5.2658371925354f));
              _1328 = _1277 - (_1230 * 4.0f);
              _1338 = 1.0f - (_1244 * 0.5f);
              _1339 = _1338 * _1338;
              _1343 = (_1339 * _1339) * (0.9534794092178345f - (_1244 * 0.47673970460891724f));
              _1345 = 0.9534794092178345f - _1343;
              _1346 = 0.800000011920929f / _1244;
              _1359 = (((_1345 * _1345) * (_1343 + 0.04652056470513344f)) * (exp2((((_1328 * _1328) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1274 * 5.013256549835205f))) * exp2((_1263 * 24.525815963745117f) + -24.208423614501953f);
              _1369 = min(0.0f, (-0.0f - ((_1324 * exp2(_1310 * _1309)) + (_1359 * exp2(_1346 * _1310)))));
              _1370 = min(0.0f, (-0.0f - ((_1324 * exp2(_1311 * _1309)) + (_1359 * exp2(_1346 * _1311)))));
              _1371 = min(0.0f, (-0.0f - ((_1324 * exp2(_1312 * _1309)) + (_1359 * exp2(_1346 * _1312)))));
              _1380 = saturate(abs(dot(float3(_1199, _1200, _1201), float3(_1149, _1150, _1151))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1389 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1310 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1392 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1395 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
              _1402 = min(0.9900000095367432f, _1389.x);
              _1403 = min(0.9900000095367432f, _1392.x);
              _1404 = min(0.9900000095367432f, _1395.x);
              _1405 = min(0.9900000095367432f, _1389.y);
              _1406 = min(0.9900000095367432f, _1392.y);
              _1407 = min(0.9900000095367432f, _1395.y);
              _1408 = _1402 * _1402;
              _1409 = _1403 * _1403;
              _1410 = _1404 * _1404;
              _1411 = _1405 * _1405;
              _1412 = _1406 * _1406;
              _1413 = _1407 * _1407;
              _1414 = _1411 * _1405;
              _1415 = _1412 * _1406;
              _1416 = _1413 * _1407;
              _1417 = 1.0f - _1408;
              _1418 = 1.0f - _1409;
              _1419 = 1.0f - _1410;
              _1429 = _1417 * _1417;
              _1430 = _1418 * _1418;
              _1431 = _1419 * _1419;
              _1432 = _1429 * _1417;
              _1433 = _1430 * _1418;
              _1434 = _1431 * _1419;
              _1442 = min(max(_1214, 0.18000000715255737f), 0.6000000238418579f);
              _1443 = _1442 * _1442;
              _1444 = _1443 * 0.25f;
              _1445 = _1443 * 4.0f;
              _1447 = (_1403 + _1402) + _1404;
              _1448 = _1402 / _1447;
              _1449 = _1403 / _1447;
              _1450 = _1404 / _1447;
              _1451 = dot(float3(_1443, _1444, _1445), float3(_1448, _1449, _1450));
              _1452 = _1451 * _1451;
              _1455 = asin(min(max(_1238, -1.0f), 1.0f)) + asin(min(max(_1234, -1.0f), 1.0f));
              _1456 = _1455 * 0.5f;
              _1457 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1448, _1449, _1450));
              _1467 = _1457 * _1457;
              _1490 = (_1406 + _1405) + _1407;
              _1494 = dot(float3(_1443, _1444, _1445), float3((_1405 / _1490), (_1406 / _1490), (_1407 / _1490)));
              _1498 = sqrt((_1494 * _1494) + (_1452 * 2.0f));
              _1516 = (_1494 * 3.0f) + (_1451 * 2.0f);
              _1523 = (((_1414 + _1405) * ((_1408 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1414) + _1405);
              _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1415) + _1406);
              _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1416) + _1407);
              _1534 = _1456 - (((_1467 * (((_1408 * 4.0f) * _1411) + (_1429 * 2.0f))) * (1.0f - ((_1411 * 2.0f) / _1429))) / _1432);
              _1541 = _1456 - (((_1467 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
              _1548 = _1456 - (((_1467 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
              _1576 = exp2((((_1455 * -0.25f) * _1456) / _1452) * 1.4426950216293335f) * 1.399999976158142f;
              _1577 = ((((((_1414 * _1408) / _1432) + ((_1405 * _1408) / _1417)) * 4.398229598999023f) * exp2((((_1534 * _1534) * -0.5f) / ((_1523 * _1523) + _1452)) * 1.4426950216293335f)) + ((((_1389.x + _1369) * 0.25f) - _1369) * 6.2831854820251465f)) * _1576;
              _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1541 * _1541) * -0.5f) / ((_1524 * _1524) + _1452)) * 1.4426950216293335f)) + ((((_1392.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1576;
              _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1548 * _1548) * -0.5f) / ((_1525 * _1525) + _1452)) * 1.4426950216293335f)) + ((((_1395.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1576;
              _1580 = max(0.125f, _1148);
              _1594 = _1148;
              _1595 = _1152;
              _1596 = _1149;
              _1597 = _1150;
              _1598 = _1151;
              _1599 = _1066;
              _1600 = max(0.009999999776482582f, ((_1580 * (_1231 - _1577)) + _1577));
              _1601 = max(0.009999999776482582f, (lerp(_1578, _1232, _1580)));
              _1602 = max(0.009999999776482582f, (lerp(_1579, _1233, _1580)));
            } else {
              _1594 = _1138;
              _1595 = _1142;
              _1596 = _1139;
              _1597 = _1140;
              _1598 = _1141;
              _1599 = _1066;
              _1600 = 0.0f;
              _1601 = 0.0f;
              _1602 = 0.0f;
            }
          } else {
            _1101 = 1.0f;
            _1102 = 0.0h;
            if (_1076) {
              _1114 = (_1031 * 2.0f) + -1.0f;
              _1115 = (_1032 * 2.0f) + -1.0f;
              _1117 = 1.0f - abs(_1114);
              _1118 = abs(_1115);
              _1119 = _1117 - _1118;
              if (!(_1119 >= 0.0f)) {
                _1130 = ((1.0f - _1118) * select((_1114 >= 0.0f), 1.0f, -1.0f));
                _1131 = (_1117 * select((_1115 >= 0.0f), 1.0f, -1.0f));
              } else {
                _1130 = _1114;
                _1131 = _1115;
              }
              _1133 = rsqrt(dot(float3(_1130, _1131, _1119), float3(_1130, _1131, _1119)));  // [sem: invLength]
              _1148 = _1101;
              _1149 = (_1133 * _1130);
              _1150 = (_1133 * _1131);
              _1151 = (_1133 * _1119);
              _1152 = 0.0h;
              _1154 = __3__36__0__0__g_bentCone.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1161 = __3__36__0__0__g_bentCone.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1171 = __3__36__0__0__g_bentCone.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1181 = __3__36__0__0__g_bentCone.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1194 = (((((_1161.x * _865) + (_1154.x * _864)) + (_1171.x * _866)) + (_1181.x * _867)) * 2.0f) + -1.0f;
              _1195 = (((((_1161.y * _865) + (_1154.y * _864)) + (_1171.y * _866)) + (_1181.y * _867)) * 2.0f) + -1.0f;
              _1196 = (((((_1161.z * _865) + (_1154.z * _864)) + (_1171.z * _866)) + (_1181.z * _867)) * 2.0f) + -1.0f;
              _1198 = rsqrt(dot(float3(_1194, _1195, _1196), float3(_1194, _1195, _1196)));  // [sem: invLength]
              _1199 = _1194 * _1198;
              _1200 = _1195 * _1198;
              _1201 = _1196 * _1198;
              if (!(_renderParams.z > 0.0f)) {
                if (!(_renderParams2.y > 0.0f)) {
                  _1213 = (half)(saturate((half)(_161 + 0.15002441h)));
                } else {
                  _1213 = _161;
                }
              } else {
                _1213 = _161;
              }
              _1214 = float(_1213);
              if (_1066 == 54) {
                _1230 = (((asfloat(_globalLightParams.z) * _1214) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_165)));
              } else {
                _1230 = _bevelParams.y;
              }
              _1231 = float(_282);
              _1232 = float(_283);
              _1233 = float(_284);
              _1234 = dot(float3(_1149, _1150, _1151), float3(_1199, _1200, _1201));
              _1235 = -0.0f - _1013;
              _1236 = -0.0f - _1014;
              _1237 = -0.0f - _1015;
              _1238 = dot(float3(_1149, _1150, _1151), float3(_1235, _1236, _1237));
              _1244 = cos(abs(asin(_1238) - asin(_1234)) * 0.5f);
              _1248 = _1199 - (_1234 * _1149);
              _1249 = _1200 - (_1234 * _1150);
              _1250 = _1201 - (_1234 * _1151);
              _1254 = _1235 - (_1238 * _1149);
              _1255 = _1236 - (_1238 * _1150);
              _1256 = _1237 - (_1238 * _1151);
  // [sem: invLength]
              _1263 = rsqrt((dot(float3(_1254, _1255, _1256), float3(_1254, _1255, _1256)) * dot(float3(_1248, _1249, _1250), float3(_1248, _1249, _1250))) + 9.999999747378752e-05f) * dot(float3(_1248, _1249, _1250), float3(_1254, _1255, _1256));
              _1273 = min(max(_1214, 0.09803921729326248f), 1.0f);
              _1274 = _1273 * _1273;
              _1275 = _1274 * 0.5f;
              _1276 = _1274 * 2.0f;
              _1277 = _1238 + _1234;
              _1278 = _1277 - _1230;
              _1287 = 1.0f / ((1.190000057220459f / _1244) + (_1244 * 0.36000001430511475f));
              _1292 = ((_1287 * (0.6000000238418579f - (_1263 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1263 * 0.5f) + 0.5f));
              _1298 = 1.0f - (sqrt(saturate(1.0f - (_1292 * _1292))) * _1244);
              _1299 = _1298 * _1298;
              _1303 = 0.9534794092178345f - ((_1299 * _1299) * (_1298 * 0.9534794092178345f));
              _1304 = _1287 * _1292;
              _1309 = (sqrt(1.0f - (_1304 * _1304)) * 0.5f) / _1244;
              _1310 = log2(_1231);
              _1311 = log2(_1232);
              _1312 = log2(_1233);
              _1324 = ((_1303 * _1303) * (exp2((((_1278 * _1278) * -0.5f) / (_1275 * _1275)) * 1.4426950216293335f) / (_1274 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1263 * 5.2658371925354f));
              _1328 = _1277 - (_1230 * 4.0f);
              _1338 = 1.0f - (_1244 * 0.5f);
              _1339 = _1338 * _1338;
              _1343 = (_1339 * _1339) * (0.9534794092178345f - (_1244 * 0.47673970460891724f));
              _1345 = 0.9534794092178345f - _1343;
              _1346 = 0.800000011920929f / _1244;
              _1359 = (((_1345 * _1345) * (_1343 + 0.04652056470513344f)) * (exp2((((_1328 * _1328) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1274 * 5.013256549835205f))) * exp2((_1263 * 24.525815963745117f) + -24.208423614501953f);
              _1369 = min(0.0f, (-0.0f - ((_1324 * exp2(_1310 * _1309)) + (_1359 * exp2(_1346 * _1310)))));
              _1370 = min(0.0f, (-0.0f - ((_1324 * exp2(_1311 * _1309)) + (_1359 * exp2(_1346 * _1311)))));
              _1371 = min(0.0f, (-0.0f - ((_1324 * exp2(_1312 * _1309)) + (_1359 * exp2(_1346 * _1312)))));
              _1380 = saturate(abs(dot(float3(_1199, _1200, _1201), float3(_1149, _1150, _1151))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1389 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1310 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1392 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1395 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
              _1402 = min(0.9900000095367432f, _1389.x);
              _1403 = min(0.9900000095367432f, _1392.x);
              _1404 = min(0.9900000095367432f, _1395.x);
              _1405 = min(0.9900000095367432f, _1389.y);
              _1406 = min(0.9900000095367432f, _1392.y);
              _1407 = min(0.9900000095367432f, _1395.y);
              _1408 = _1402 * _1402;
              _1409 = _1403 * _1403;
              _1410 = _1404 * _1404;
              _1411 = _1405 * _1405;
              _1412 = _1406 * _1406;
              _1413 = _1407 * _1407;
              _1414 = _1411 * _1405;
              _1415 = _1412 * _1406;
              _1416 = _1413 * _1407;
              _1417 = 1.0f - _1408;
              _1418 = 1.0f - _1409;
              _1419 = 1.0f - _1410;
              _1429 = _1417 * _1417;
              _1430 = _1418 * _1418;
              _1431 = _1419 * _1419;
              _1432 = _1429 * _1417;
              _1433 = _1430 * _1418;
              _1434 = _1431 * _1419;
              _1442 = min(max(_1214, 0.18000000715255737f), 0.6000000238418579f);
              _1443 = _1442 * _1442;
              _1444 = _1443 * 0.25f;
              _1445 = _1443 * 4.0f;
              _1447 = (_1403 + _1402) + _1404;
              _1448 = _1402 / _1447;
              _1449 = _1403 / _1447;
              _1450 = _1404 / _1447;
              _1451 = dot(float3(_1443, _1444, _1445), float3(_1448, _1449, _1450));
              _1452 = _1451 * _1451;
              _1455 = asin(min(max(_1238, -1.0f), 1.0f)) + asin(min(max(_1234, -1.0f), 1.0f));
              _1456 = _1455 * 0.5f;
              _1457 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1448, _1449, _1450));
              _1467 = _1457 * _1457;
              _1490 = (_1406 + _1405) + _1407;
              _1494 = dot(float3(_1443, _1444, _1445), float3((_1405 / _1490), (_1406 / _1490), (_1407 / _1490)));
              _1498 = sqrt((_1494 * _1494) + (_1452 * 2.0f));
              _1516 = (_1494 * 3.0f) + (_1451 * 2.0f);
              _1523 = (((_1414 + _1405) * ((_1408 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1414) + _1405);
              _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1415) + _1406);
              _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1416) + _1407);
              _1534 = _1456 - (((_1467 * (((_1408 * 4.0f) * _1411) + (_1429 * 2.0f))) * (1.0f - ((_1411 * 2.0f) / _1429))) / _1432);
              _1541 = _1456 - (((_1467 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
              _1548 = _1456 - (((_1467 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
              _1576 = exp2((((_1455 * -0.25f) * _1456) / _1452) * 1.4426950216293335f) * 1.399999976158142f;
              _1577 = ((((((_1414 * _1408) / _1432) + ((_1405 * _1408) / _1417)) * 4.398229598999023f) * exp2((((_1534 * _1534) * -0.5f) / ((_1523 * _1523) + _1452)) * 1.4426950216293335f)) + ((((_1389.x + _1369) * 0.25f) - _1369) * 6.2831854820251465f)) * _1576;
              _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1541 * _1541) * -0.5f) / ((_1524 * _1524) + _1452)) * 1.4426950216293335f)) + ((((_1392.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1576;
              _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1548 * _1548) * -0.5f) / ((_1525 * _1525) + _1452)) * 1.4426950216293335f)) + ((((_1395.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1576;
              _1580 = max(0.125f, _1148);
              _1594 = _1148;
              _1595 = _1152;
              _1596 = _1149;
              _1597 = _1150;
              _1598 = _1151;
              _1599 = _1066;
              _1600 = max(0.009999999776482582f, ((_1580 * (_1231 - _1577)) + _1577));
              _1601 = max(0.009999999776482582f, (lerp(_1578, _1232, _1580)));
              _1602 = max(0.009999999776482582f, (lerp(_1579, _1233, _1580)));
            } else {
              _1138 = _1101;
              _1139 = _673;
              _1140 = _674;
              _1141 = _675;
              _1142 = _1102;
              if ((_1066 == 54) || ((_1066 & 126) == 66)) {
                _1148 = _1138;
                _1149 = _1139;
                _1150 = _1140;
                _1151 = _1141;
                _1152 = _1142;
                _1154 = __3__36__0__0__g_bentCone.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
                _1161 = __3__36__0__0__g_bentCone.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
                _1171 = __3__36__0__0__g_bentCone.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
                _1181 = __3__36__0__0__g_bentCone.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
                _1194 = (((((_1161.x * _865) + (_1154.x * _864)) + (_1171.x * _866)) + (_1181.x * _867)) * 2.0f) + -1.0f;
                _1195 = (((((_1161.y * _865) + (_1154.y * _864)) + (_1171.y * _866)) + (_1181.y * _867)) * 2.0f) + -1.0f;
                _1196 = (((((_1161.z * _865) + (_1154.z * _864)) + (_1171.z * _866)) + (_1181.z * _867)) * 2.0f) + -1.0f;
                _1198 = rsqrt(dot(float3(_1194, _1195, _1196), float3(_1194, _1195, _1196)));  // [sem: invLength]
                _1199 = _1194 * _1198;
                _1200 = _1195 * _1198;
                _1201 = _1196 * _1198;
                if (!(_renderParams.z > 0.0f)) {
                  if (!(_renderParams2.y > 0.0f)) {
                    _1213 = (half)(saturate((half)(_161 + 0.15002441h)));
                  } else {
                    _1213 = _161;
                  }
                } else {
                  _1213 = _161;
                }
                _1214 = float(_1213);
                if (_1066 == 54) {
                  _1230 = (((asfloat(_globalLightParams.z) * _1214) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_165)));
                } else {
                  _1230 = _bevelParams.y;
                }
                _1231 = float(_282);
                _1232 = float(_283);
                _1233 = float(_284);
                _1234 = dot(float3(_1149, _1150, _1151), float3(_1199, _1200, _1201));
                _1235 = -0.0f - _1013;
                _1236 = -0.0f - _1014;
                _1237 = -0.0f - _1015;
                _1238 = dot(float3(_1149, _1150, _1151), float3(_1235, _1236, _1237));
                _1244 = cos(abs(asin(_1238) - asin(_1234)) * 0.5f);
                _1248 = _1199 - (_1234 * _1149);
                _1249 = _1200 - (_1234 * _1150);
                _1250 = _1201 - (_1234 * _1151);
                _1254 = _1235 - (_1238 * _1149);
                _1255 = _1236 - (_1238 * _1150);
                _1256 = _1237 - (_1238 * _1151);
  // [sem: invLength]
                _1263 = rsqrt((dot(float3(_1254, _1255, _1256), float3(_1254, _1255, _1256)) * dot(float3(_1248, _1249, _1250), float3(_1248, _1249, _1250))) + 9.999999747378752e-05f) * dot(float3(_1248, _1249, _1250), float3(_1254, _1255, _1256));
                _1273 = min(max(_1214, 0.09803921729326248f), 1.0f);
                _1274 = _1273 * _1273;
                _1275 = _1274 * 0.5f;
                _1276 = _1274 * 2.0f;
                _1277 = _1238 + _1234;
                _1278 = _1277 - _1230;
                _1287 = 1.0f / ((1.190000057220459f / _1244) + (_1244 * 0.36000001430511475f));
                _1292 = ((_1287 * (0.6000000238418579f - (_1263 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1263 * 0.5f) + 0.5f));
                _1298 = 1.0f - (sqrt(saturate(1.0f - (_1292 * _1292))) * _1244);
                _1299 = _1298 * _1298;
                _1303 = 0.9534794092178345f - ((_1299 * _1299) * (_1298 * 0.9534794092178345f));
                _1304 = _1287 * _1292;
                _1309 = (sqrt(1.0f - (_1304 * _1304)) * 0.5f) / _1244;
                _1310 = log2(_1231);
                _1311 = log2(_1232);
                _1312 = log2(_1233);
                _1324 = ((_1303 * _1303) * (exp2((((_1278 * _1278) * -0.5f) / (_1275 * _1275)) * 1.4426950216293335f) / (_1274 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1263 * 5.2658371925354f));
                _1328 = _1277 - (_1230 * 4.0f);
                _1338 = 1.0f - (_1244 * 0.5f);
                _1339 = _1338 * _1338;
                _1343 = (_1339 * _1339) * (0.9534794092178345f - (_1244 * 0.47673970460891724f));
                _1345 = 0.9534794092178345f - _1343;
                _1346 = 0.800000011920929f / _1244;
                _1359 = (((_1345 * _1345) * (_1343 + 0.04652056470513344f)) * (exp2((((_1328 * _1328) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1274 * 5.013256549835205f))) * exp2((_1263 * 24.525815963745117f) + -24.208423614501953f);
                _1369 = min(0.0f, (-0.0f - ((_1324 * exp2(_1310 * _1309)) + (_1359 * exp2(_1346 * _1310)))));
                _1370 = min(0.0f, (-0.0f - ((_1324 * exp2(_1311 * _1309)) + (_1359 * exp2(_1346 * _1311)))));
                _1371 = min(0.0f, (-0.0f - ((_1324 * exp2(_1312 * _1309)) + (_1359 * exp2(_1346 * _1312)))));
                _1380 = saturate(abs(dot(float3(_1199, _1200, _1201), float3(_1149, _1150, _1151))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
                _1389 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1310 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
                _1392 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
                _1395 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
                _1402 = min(0.9900000095367432f, _1389.x);
                _1403 = min(0.9900000095367432f, _1392.x);
                _1404 = min(0.9900000095367432f, _1395.x);
                _1405 = min(0.9900000095367432f, _1389.y);
                _1406 = min(0.9900000095367432f, _1392.y);
                _1407 = min(0.9900000095367432f, _1395.y);
                _1408 = _1402 * _1402;
                _1409 = _1403 * _1403;
                _1410 = _1404 * _1404;
                _1411 = _1405 * _1405;
                _1412 = _1406 * _1406;
                _1413 = _1407 * _1407;
                _1414 = _1411 * _1405;
                _1415 = _1412 * _1406;
                _1416 = _1413 * _1407;
                _1417 = 1.0f - _1408;
                _1418 = 1.0f - _1409;
                _1419 = 1.0f - _1410;
                _1429 = _1417 * _1417;
                _1430 = _1418 * _1418;
                _1431 = _1419 * _1419;
                _1432 = _1429 * _1417;
                _1433 = _1430 * _1418;
                _1434 = _1431 * _1419;
                _1442 = min(max(_1214, 0.18000000715255737f), 0.6000000238418579f);
                _1443 = _1442 * _1442;
                _1444 = _1443 * 0.25f;
                _1445 = _1443 * 4.0f;
                _1447 = (_1403 + _1402) + _1404;
                _1448 = _1402 / _1447;
                _1449 = _1403 / _1447;
                _1450 = _1404 / _1447;
                _1451 = dot(float3(_1443, _1444, _1445), float3(_1448, _1449, _1450));
                _1452 = _1451 * _1451;
                _1455 = asin(min(max(_1238, -1.0f), 1.0f)) + asin(min(max(_1234, -1.0f), 1.0f));
                _1456 = _1455 * 0.5f;
                _1457 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1448, _1449, _1450));
                _1467 = _1457 * _1457;
                _1490 = (_1406 + _1405) + _1407;
                _1494 = dot(float3(_1443, _1444, _1445), float3((_1405 / _1490), (_1406 / _1490), (_1407 / _1490)));
                _1498 = sqrt((_1494 * _1494) + (_1452 * 2.0f));
                _1516 = (_1494 * 3.0f) + (_1451 * 2.0f);
                _1523 = (((_1414 + _1405) * ((_1408 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1414) + _1405);
                _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1415) + _1406);
                _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1416) + _1407);
                _1534 = _1456 - (((_1467 * (((_1408 * 4.0f) * _1411) + (_1429 * 2.0f))) * (1.0f - ((_1411 * 2.0f) / _1429))) / _1432);
                _1541 = _1456 - (((_1467 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
                _1548 = _1456 - (((_1467 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
                _1576 = exp2((((_1455 * -0.25f) * _1456) / _1452) * 1.4426950216293335f) * 1.399999976158142f;
                _1577 = ((((((_1414 * _1408) / _1432) + ((_1405 * _1408) / _1417)) * 4.398229598999023f) * exp2((((_1534 * _1534) * -0.5f) / ((_1523 * _1523) + _1452)) * 1.4426950216293335f)) + ((((_1389.x + _1369) * 0.25f) - _1369) * 6.2831854820251465f)) * _1576;
                _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1541 * _1541) * -0.5f) / ((_1524 * _1524) + _1452)) * 1.4426950216293335f)) + ((((_1392.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1576;
                _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1548 * _1548) * -0.5f) / ((_1525 * _1525) + _1452)) * 1.4426950216293335f)) + ((((_1395.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1576;
                _1580 = max(0.125f, _1148);
                _1594 = _1148;
                _1595 = _1152;
                _1596 = _1149;
                _1597 = _1150;
                _1598 = _1151;
                _1599 = _1066;
                _1600 = max(0.009999999776482582f, ((_1580 * (_1231 - _1577)) + _1577));
                _1601 = max(0.009999999776482582f, (lerp(_1578, _1232, _1580)));
                _1602 = max(0.009999999776482582f, (lerp(_1579, _1233, _1580)));
              } else {
                _1594 = _1138;
                _1595 = _1142;
                _1596 = _1139;
                _1597 = _1140;
                _1598 = _1141;
                _1599 = _1066;
                _1600 = 0.0f;
                _1601 = 0.0f;
                _1602 = 0.0f;
              }
            }
          }
        } else {
          _1594 = 1.0f;
          _1595 = 0.0h;
          _1596 = _673;
          _1597 = _674;
          _1598 = _675;
          _1599 = 53;
          _1600 = 0.0f;
          _1601 = 0.0f;
          _1602 = 0.0f;
        }
      } else {
        _1101 = 0.0f;
        _1102 = _1067;
        if (_1076) {
          _1114 = (_1031 * 2.0f) + -1.0f;
          _1115 = (_1032 * 2.0f) + -1.0f;
          _1117 = 1.0f - abs(_1114);
          _1118 = abs(_1115);
          _1119 = _1117 - _1118;
          if (!(_1119 >= 0.0f)) {
            _1130 = ((1.0f - _1118) * select((_1114 >= 0.0f), 1.0f, -1.0f));
            _1131 = (_1117 * select((_1115 >= 0.0f), 1.0f, -1.0f));
          } else {
            _1130 = _1114;
            _1131 = _1115;
          }
          _1133 = rsqrt(dot(float3(_1130, _1131, _1119), float3(_1130, _1131, _1119)));  // [sem: invLength]
          _1148 = _1101;
          _1149 = (_1133 * _1130);
          _1150 = (_1133 * _1131);
          _1151 = (_1133 * _1119);
          _1152 = 0.0h;
          _1154 = __3__36__0__0__g_bentCone.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
          _1161 = __3__36__0__0__g_bentCone.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
          _1171 = __3__36__0__0__g_bentCone.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
          _1181 = __3__36__0__0__g_bentCone.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
          _1194 = (((((_1161.x * _865) + (_1154.x * _864)) + (_1171.x * _866)) + (_1181.x * _867)) * 2.0f) + -1.0f;
          _1195 = (((((_1161.y * _865) + (_1154.y * _864)) + (_1171.y * _866)) + (_1181.y * _867)) * 2.0f) + -1.0f;
          _1196 = (((((_1161.z * _865) + (_1154.z * _864)) + (_1171.z * _866)) + (_1181.z * _867)) * 2.0f) + -1.0f;
          _1198 = rsqrt(dot(float3(_1194, _1195, _1196), float3(_1194, _1195, _1196)));  // [sem: invLength]
          _1199 = _1194 * _1198;
          _1200 = _1195 * _1198;
          _1201 = _1196 * _1198;
          if (!(_renderParams.z > 0.0f)) {
            if (!(_renderParams2.y > 0.0f)) {
              _1213 = (half)(saturate((half)(_161 + 0.15002441h)));
            } else {
              _1213 = _161;
            }
          } else {
            _1213 = _161;
          }
          _1214 = float(_1213);
          if (_1066 == 54) {
            _1230 = (((asfloat(_globalLightParams.z) * _1214) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_165)));
          } else {
            _1230 = _bevelParams.y;
          }
          _1231 = float(_282);
          _1232 = float(_283);
          _1233 = float(_284);
          _1234 = dot(float3(_1149, _1150, _1151), float3(_1199, _1200, _1201));
          _1235 = -0.0f - _1013;
          _1236 = -0.0f - _1014;
          _1237 = -0.0f - _1015;
          _1238 = dot(float3(_1149, _1150, _1151), float3(_1235, _1236, _1237));
          _1244 = cos(abs(asin(_1238) - asin(_1234)) * 0.5f);
          _1248 = _1199 - (_1234 * _1149);
          _1249 = _1200 - (_1234 * _1150);
          _1250 = _1201 - (_1234 * _1151);
          _1254 = _1235 - (_1238 * _1149);
          _1255 = _1236 - (_1238 * _1150);
          _1256 = _1237 - (_1238 * _1151);
  // [sem: invLength]
          _1263 = rsqrt((dot(float3(_1254, _1255, _1256), float3(_1254, _1255, _1256)) * dot(float3(_1248, _1249, _1250), float3(_1248, _1249, _1250))) + 9.999999747378752e-05f) * dot(float3(_1248, _1249, _1250), float3(_1254, _1255, _1256));
          _1273 = min(max(_1214, 0.09803921729326248f), 1.0f);
          _1274 = _1273 * _1273;
          _1275 = _1274 * 0.5f;
          _1276 = _1274 * 2.0f;
          _1277 = _1238 + _1234;
          _1278 = _1277 - _1230;
          _1287 = 1.0f / ((1.190000057220459f / _1244) + (_1244 * 0.36000001430511475f));
          _1292 = ((_1287 * (0.6000000238418579f - (_1263 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1263 * 0.5f) + 0.5f));
          _1298 = 1.0f - (sqrt(saturate(1.0f - (_1292 * _1292))) * _1244);
          _1299 = _1298 * _1298;
          _1303 = 0.9534794092178345f - ((_1299 * _1299) * (_1298 * 0.9534794092178345f));
          _1304 = _1287 * _1292;
          _1309 = (sqrt(1.0f - (_1304 * _1304)) * 0.5f) / _1244;
          _1310 = log2(_1231);
          _1311 = log2(_1232);
          _1312 = log2(_1233);
          _1324 = ((_1303 * _1303) * (exp2((((_1278 * _1278) * -0.5f) / (_1275 * _1275)) * 1.4426950216293335f) / (_1274 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1263 * 5.2658371925354f));
          _1328 = _1277 - (_1230 * 4.0f);
          _1338 = 1.0f - (_1244 * 0.5f);
          _1339 = _1338 * _1338;
          _1343 = (_1339 * _1339) * (0.9534794092178345f - (_1244 * 0.47673970460891724f));
          _1345 = 0.9534794092178345f - _1343;
          _1346 = 0.800000011920929f / _1244;
          _1359 = (((_1345 * _1345) * (_1343 + 0.04652056470513344f)) * (exp2((((_1328 * _1328) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1274 * 5.013256549835205f))) * exp2((_1263 * 24.525815963745117f) + -24.208423614501953f);
          _1369 = min(0.0f, (-0.0f - ((_1324 * exp2(_1310 * _1309)) + (_1359 * exp2(_1346 * _1310)))));
          _1370 = min(0.0f, (-0.0f - ((_1324 * exp2(_1311 * _1309)) + (_1359 * exp2(_1346 * _1311)))));
          _1371 = min(0.0f, (-0.0f - ((_1324 * exp2(_1312 * _1309)) + (_1359 * exp2(_1346 * _1312)))));
          _1380 = saturate(abs(dot(float3(_1199, _1200, _1201), float3(_1149, _1150, _1151))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
          _1389 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1310 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
          _1392 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
          _1395 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
          _1402 = min(0.9900000095367432f, _1389.x);
          _1403 = min(0.9900000095367432f, _1392.x);
          _1404 = min(0.9900000095367432f, _1395.x);
          _1405 = min(0.9900000095367432f, _1389.y);
          _1406 = min(0.9900000095367432f, _1392.y);
          _1407 = min(0.9900000095367432f, _1395.y);
          _1408 = _1402 * _1402;
          _1409 = _1403 * _1403;
          _1410 = _1404 * _1404;
          _1411 = _1405 * _1405;
          _1412 = _1406 * _1406;
          _1413 = _1407 * _1407;
          _1414 = _1411 * _1405;
          _1415 = _1412 * _1406;
          _1416 = _1413 * _1407;
          _1417 = 1.0f - _1408;
          _1418 = 1.0f - _1409;
          _1419 = 1.0f - _1410;
          _1429 = _1417 * _1417;
          _1430 = _1418 * _1418;
          _1431 = _1419 * _1419;
          _1432 = _1429 * _1417;
          _1433 = _1430 * _1418;
          _1434 = _1431 * _1419;
          _1442 = min(max(_1214, 0.18000000715255737f), 0.6000000238418579f);
          _1443 = _1442 * _1442;
          _1444 = _1443 * 0.25f;
          _1445 = _1443 * 4.0f;
          _1447 = (_1403 + _1402) + _1404;
          _1448 = _1402 / _1447;
          _1449 = _1403 / _1447;
          _1450 = _1404 / _1447;
          _1451 = dot(float3(_1443, _1444, _1445), float3(_1448, _1449, _1450));
          _1452 = _1451 * _1451;
          _1455 = asin(min(max(_1238, -1.0f), 1.0f)) + asin(min(max(_1234, -1.0f), 1.0f));
          _1456 = _1455 * 0.5f;
          _1457 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1448, _1449, _1450));
          _1467 = _1457 * _1457;
          _1490 = (_1406 + _1405) + _1407;
          _1494 = dot(float3(_1443, _1444, _1445), float3((_1405 / _1490), (_1406 / _1490), (_1407 / _1490)));
          _1498 = sqrt((_1494 * _1494) + (_1452 * 2.0f));
          _1516 = (_1494 * 3.0f) + (_1451 * 2.0f);
          _1523 = (((_1414 + _1405) * ((_1408 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1414) + _1405);
          _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1415) + _1406);
          _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1416) + _1407);
          _1534 = _1456 - (((_1467 * (((_1408 * 4.0f) * _1411) + (_1429 * 2.0f))) * (1.0f - ((_1411 * 2.0f) / _1429))) / _1432);
          _1541 = _1456 - (((_1467 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
          _1548 = _1456 - (((_1467 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
          _1576 = exp2((((_1455 * -0.25f) * _1456) / _1452) * 1.4426950216293335f) * 1.399999976158142f;
          _1577 = ((((((_1414 * _1408) / _1432) + ((_1405 * _1408) / _1417)) * 4.398229598999023f) * exp2((((_1534 * _1534) * -0.5f) / ((_1523 * _1523) + _1452)) * 1.4426950216293335f)) + ((((_1389.x + _1369) * 0.25f) - _1369) * 6.2831854820251465f)) * _1576;
          _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1541 * _1541) * -0.5f) / ((_1524 * _1524) + _1452)) * 1.4426950216293335f)) + ((((_1392.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1576;
          _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1548 * _1548) * -0.5f) / ((_1525 * _1525) + _1452)) * 1.4426950216293335f)) + ((((_1395.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1576;
          _1580 = max(0.125f, _1148);
          _1594 = _1148;
          _1595 = _1152;
          _1596 = _1149;
          _1597 = _1150;
          _1598 = _1151;
          _1599 = _1066;
          _1600 = max(0.009999999776482582f, ((_1580 * (_1231 - _1577)) + _1577));
          _1601 = max(0.009999999776482582f, (lerp(_1578, _1232, _1580)));
          _1602 = max(0.009999999776482582f, (lerp(_1579, _1233, _1580)));
        } else {
          _1138 = _1101;
          _1139 = _673;
          _1140 = _674;
          _1141 = _675;
          _1142 = _1102;
          if ((_1066 == 54) || ((_1066 & 126) == 66)) {
            _1148 = _1138;
            _1149 = _1139;
            _1150 = _1140;
            _1151 = _1141;
            _1152 = _1142;
            _1154 = __3__36__0__0__g_bentCone.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
            _1161 = __3__36__0__0__g_bentCone.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_bentCone_load]
            _1171 = __3__36__0__0__g_bentCone.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
            _1181 = __3__36__0__0__g_bentCone.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_bentCone_load]
            _1194 = (((((_1161.x * _865) + (_1154.x * _864)) + (_1171.x * _866)) + (_1181.x * _867)) * 2.0f) + -1.0f;
            _1195 = (((((_1161.y * _865) + (_1154.y * _864)) + (_1171.y * _866)) + (_1181.y * _867)) * 2.0f) + -1.0f;
            _1196 = (((((_1161.z * _865) + (_1154.z * _864)) + (_1171.z * _866)) + (_1181.z * _867)) * 2.0f) + -1.0f;
            _1198 = rsqrt(dot(float3(_1194, _1195, _1196), float3(_1194, _1195, _1196)));  // [sem: invLength]
            _1199 = _1194 * _1198;
            _1200 = _1195 * _1198;
            _1201 = _1196 * _1198;
            if (!(_renderParams.z > 0.0f)) {
              if (!(_renderParams2.y > 0.0f)) {
                _1213 = (half)(saturate((half)(_161 + 0.15002441h)));
              } else {
                _1213 = _161;
              }
            } else {
              _1213 = _161;
            }
            _1214 = float(_1213);
            if (_1066 == 54) {
              _1230 = (((asfloat(_globalLightParams.z) * _1214) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_165)));
            } else {
              _1230 = _bevelParams.y;
            }
            _1231 = float(_282);
            _1232 = float(_283);
            _1233 = float(_284);
            _1234 = dot(float3(_1149, _1150, _1151), float3(_1199, _1200, _1201));
            _1235 = -0.0f - _1013;
            _1236 = -0.0f - _1014;
            _1237 = -0.0f - _1015;
            _1238 = dot(float3(_1149, _1150, _1151), float3(_1235, _1236, _1237));
            _1244 = cos(abs(asin(_1238) - asin(_1234)) * 0.5f);
            _1248 = _1199 - (_1234 * _1149);
            _1249 = _1200 - (_1234 * _1150);
            _1250 = _1201 - (_1234 * _1151);
            _1254 = _1235 - (_1238 * _1149);
            _1255 = _1236 - (_1238 * _1150);
            _1256 = _1237 - (_1238 * _1151);
  // [sem: invLength]
            _1263 = rsqrt((dot(float3(_1254, _1255, _1256), float3(_1254, _1255, _1256)) * dot(float3(_1248, _1249, _1250), float3(_1248, _1249, _1250))) + 9.999999747378752e-05f) * dot(float3(_1248, _1249, _1250), float3(_1254, _1255, _1256));
            _1273 = min(max(_1214, 0.09803921729326248f), 1.0f);
            _1274 = _1273 * _1273;
            _1275 = _1274 * 0.5f;
            _1276 = _1274 * 2.0f;
            _1277 = _1238 + _1234;
            _1278 = _1277 - _1230;
            _1287 = 1.0f / ((1.190000057220459f / _1244) + (_1244 * 0.36000001430511475f));
            _1292 = ((_1287 * (0.6000000238418579f - (_1263 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1263 * 0.5f) + 0.5f));
            _1298 = 1.0f - (sqrt(saturate(1.0f - (_1292 * _1292))) * _1244);
            _1299 = _1298 * _1298;
            _1303 = 0.9534794092178345f - ((_1299 * _1299) * (_1298 * 0.9534794092178345f));
            _1304 = _1287 * _1292;
            _1309 = (sqrt(1.0f - (_1304 * _1304)) * 0.5f) / _1244;
            _1310 = log2(_1231);
            _1311 = log2(_1232);
            _1312 = log2(_1233);
            _1324 = ((_1303 * _1303) * (exp2((((_1278 * _1278) * -0.5f) / (_1275 * _1275)) * 1.4426950216293335f) / (_1274 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1263 * 5.2658371925354f));
            _1328 = _1277 - (_1230 * 4.0f);
            _1338 = 1.0f - (_1244 * 0.5f);
            _1339 = _1338 * _1338;
            _1343 = (_1339 * _1339) * (0.9534794092178345f - (_1244 * 0.47673970460891724f));
            _1345 = 0.9534794092178345f - _1343;
            _1346 = 0.800000011920929f / _1244;
            _1359 = (((_1345 * _1345) * (_1343 + 0.04652056470513344f)) * (exp2((((_1328 * _1328) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1274 * 5.013256549835205f))) * exp2((_1263 * 24.525815963745117f) + -24.208423614501953f);
            _1369 = min(0.0f, (-0.0f - ((_1324 * exp2(_1310 * _1309)) + (_1359 * exp2(_1346 * _1310)))));
            _1370 = min(0.0f, (-0.0f - ((_1324 * exp2(_1311 * _1309)) + (_1359 * exp2(_1346 * _1311)))));
            _1371 = min(0.0f, (-0.0f - ((_1324 * exp2(_1312 * _1309)) + (_1359 * exp2(_1346 * _1312)))));
            _1380 = saturate(abs(dot(float3(_1199, _1200, _1201), float3(_1149, _1150, _1151))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
            _1389 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1310 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
            _1392 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
            _1395 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1380, _1214, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
            _1402 = min(0.9900000095367432f, _1389.x);
            _1403 = min(0.9900000095367432f, _1392.x);
            _1404 = min(0.9900000095367432f, _1395.x);
            _1405 = min(0.9900000095367432f, _1389.y);
            _1406 = min(0.9900000095367432f, _1392.y);
            _1407 = min(0.9900000095367432f, _1395.y);
            _1408 = _1402 * _1402;
            _1409 = _1403 * _1403;
            _1410 = _1404 * _1404;
            _1411 = _1405 * _1405;
            _1412 = _1406 * _1406;
            _1413 = _1407 * _1407;
            _1414 = _1411 * _1405;
            _1415 = _1412 * _1406;
            _1416 = _1413 * _1407;
            _1417 = 1.0f - _1408;
            _1418 = 1.0f - _1409;
            _1419 = 1.0f - _1410;
            _1429 = _1417 * _1417;
            _1430 = _1418 * _1418;
            _1431 = _1419 * _1419;
            _1432 = _1429 * _1417;
            _1433 = _1430 * _1418;
            _1434 = _1431 * _1419;
            _1442 = min(max(_1214, 0.18000000715255737f), 0.6000000238418579f);
            _1443 = _1442 * _1442;
            _1444 = _1443 * 0.25f;
            _1445 = _1443 * 4.0f;
            _1447 = (_1403 + _1402) + _1404;
            _1448 = _1402 / _1447;
            _1449 = _1403 / _1447;
            _1450 = _1404 / _1447;
            _1451 = dot(float3(_1443, _1444, _1445), float3(_1448, _1449, _1450));
            _1452 = _1451 * _1451;
            _1455 = asin(min(max(_1238, -1.0f), 1.0f)) + asin(min(max(_1234, -1.0f), 1.0f));
            _1456 = _1455 * 0.5f;
            _1457 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1448, _1449, _1450));
            _1467 = _1457 * _1457;
            _1490 = (_1406 + _1405) + _1407;
            _1494 = dot(float3(_1443, _1444, _1445), float3((_1405 / _1490), (_1406 / _1490), (_1407 / _1490)));
            _1498 = sqrt((_1494 * _1494) + (_1452 * 2.0f));
            _1516 = (_1494 * 3.0f) + (_1451 * 2.0f);
            _1523 = (((_1414 + _1405) * ((_1408 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1414) + _1405);
            _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1415) + _1406);
            _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1498) / ((_1516 * _1416) + _1407);
            _1534 = _1456 - (((_1467 * (((_1408 * 4.0f) * _1411) + (_1429 * 2.0f))) * (1.0f - ((_1411 * 2.0f) / _1429))) / _1432);
            _1541 = _1456 - (((_1467 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
            _1548 = _1456 - (((_1467 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
            _1576 = exp2((((_1455 * -0.25f) * _1456) / _1452) * 1.4426950216293335f) * 1.399999976158142f;
            _1577 = ((((((_1414 * _1408) / _1432) + ((_1405 * _1408) / _1417)) * 4.398229598999023f) * exp2((((_1534 * _1534) * -0.5f) / ((_1523 * _1523) + _1452)) * 1.4426950216293335f)) + ((((_1389.x + _1369) * 0.25f) - _1369) * 6.2831854820251465f)) * _1576;
            _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1541 * _1541) * -0.5f) / ((_1524 * _1524) + _1452)) * 1.4426950216293335f)) + ((((_1392.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1576;
            _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1548 * _1548) * -0.5f) / ((_1525 * _1525) + _1452)) * 1.4426950216293335f)) + ((((_1395.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1576;
            _1580 = max(0.125f, _1148);
            _1594 = _1148;
            _1595 = _1152;
            _1596 = _1149;
            _1597 = _1150;
            _1598 = _1151;
            _1599 = _1066;
            _1600 = max(0.009999999776482582f, ((_1580 * (_1231 - _1577)) + _1577));
            _1601 = max(0.009999999776482582f, (lerp(_1578, _1232, _1580)));
            _1602 = max(0.009999999776482582f, (lerp(_1579, _1233, _1580)));
          } else {
            _1594 = _1138;
            _1595 = _1142;
            _1596 = _1139;
            _1597 = _1140;
            _1598 = _1141;
            _1599 = _1066;
            _1600 = 0.0f;
            _1601 = 0.0f;
            _1602 = 0.0f;
          }
        }
      }
    }
    _1609 = -0.0f - min(0.0f, (-0.0f - ((((float(_869.x) * _864) + (float(_880.x) * _865)) + (float(_894.x) * _866)) + (float(_907.x) * _867))));
    _1610 = -0.0f - min(0.0f, (-0.0f - ((((float(_869.y) * _864) + (float(_880.y) * _865)) + (float(_894.y) * _866)) + (float(_907.y) * _867))));
    _1611 = -0.0f - min(0.0f, (-0.0f - ((((float(_869.z) * _864) + (float(_880.z) * _865)) + (float(_894.z) * _866)) + (float(_907.z) * _867))));
    half2 _1613 = __3__36__0__0__g_sceneAO.Load(int3(_496, _497, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _1620 = __3__36__0__0__g_sceneAO.Load(int3(_879, _497, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _1629 = __3__36__0__0__g_sceneAO.Load(int3(_496, _893, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _1638 = __3__36__0__0__g_sceneAO.Load(int3(_879, _893, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    _1645 = (((float(_1620.x) * _865) + (float(_1613.x) * _864)) + (float(_1629.x) * _866)) + (float(_1638.x) * _867);
    if ((uint)_1599 > (uint)11) {
      _1652 = ((uint)_1599 < (uint)19);
      if (!((uint)_1599 < (uint)20)) {
        _1655 = _1652;
        _1658 = _1655;
        _1659 = (_1599 == 107);
      } else {
        _1658 = _1652;
        _1659 = true;
      }
    } else {
      if (!((uint)_1599 > (uint)10)) {
        _1655 = false;
        _1658 = _1655;
        _1659 = (_1599 == 107);
      } else {
        _1658 = false;
        _1659 = true;
      }
    }
    _1664 = (_1599 == 65);
    _1665 = _1664 || (_1658 || ((_1599 == 96) || _1659));
    _1667 = select(_1665, float(_1595), 0.0f);
    _1670 = ((uint)(_1599 & 24) > (uint)23);
    if (_1670) {
      _1672 = (_1599 == 29);
      if (_1672) {
        _1677 = float(saturate(_161));
      } else {
        _1677 = 0.0f;
      }
      _1679 = uint((half)(_165 * 255.0h));
      if (_178) {
        _1688 = select(((_1679 & 128) != 0), 1.0f, 0.0f);
        _1689 = (((float)((uint)((uint)(_1679 & 127)))) * 0.007874015718698502f);
      } else {
        _1688 = 0.0f;
        _1689 = 0.0f;
      }
      _1690 = half(_1689);
      _1694 = (_1690 > 0.99902344h);
      _1699 = _1688;
      _1700 = _1677;
      _1701 = _1690;
      _1702 = (half)(select(((_1599 == 24) || _1672), 0.010002136f, _161));
      _1703 = (half)(select(_1694, 1.0f, _282));
      _1704 = (half)(select(_1694, 1.0f, _283));
      _1705 = (half)(select(_1694, 1.0f, _284));
    } else {
      _1699 = 0.0f;
      _1700 = 0.0f;
      _1701 = (half)(select(_1665, 0.0f, _1595));
      _1702 = _161;
      _1703 = _282;
      _1704 = _283;
      _1705 = _284;
    }
    // RenoDX: >>> [Patch: FoliageColorCorrect] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x353D4158 is an inferred 1.10 direct diffuse sibling that reads scene AO and writes scene color like the covered RenderDiffuseTiled family. Apply AO+ foliage color shaping with g_sceneShadowColor visibility so shadowed foliage does not receive the fully sunlit color-shaping path.
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_116 - 12) < 7u)) {
      float3 _rndx_fcBaseColor = float3(float(_1703), float(_1704), float(_1705));
      half4 _rndx_fcShadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_98, _100, 0));
      float _rndx_fcShadowVis = saturate(dot(float3(_rndx_fcShadow.xyz), float3(0.2126f, 0.7152f, 0.0722f)));
      float3 _rndx_fcCorrected = FoliageColorCorrect(_rndx_fcBaseColor, _sunDirection.xyz, _rndx_fcShadowVis, float3(1.0f, 1.0f, 1.0f));
      float3 _rndx_fscColor = FoliageSelectiveColor(_rndx_fcCorrected);
      _1703 = half(_rndx_fscColor.x);
      _1704 = half(_rndx_fscColor.y);
      _1705 = half(_rndx_fscColor.z);
    }
    // RenoDX: <<< [Patch: FoliageColorCorrect]
    _1706 = _1599 & -2;
    _1707 = (_1706 == 66);
    _1708 = (_1599 == 54);
    _1709 = _1708 || _1707;
    _1710 = -0.0f - _1013;
    _1711 = -0.0f - _1014;
    _1712 = -0.0f - _1015;
    _1713 = dot(float3(_1710, _1711, _1712), float3(_673, _674, _675));
    if (_1709) {
      _1717 = abs(_1713);
    } else {
      _1717 = _1713;
    }
    _1718 = saturate(_1717);  // [sem: _1717_sat]
    _1720 = ((_114.x & 128) == 0);  // [sem: _3__36__0__0__g_stencil_load_derived]
    if (_1720) {
      if ((uint)_116 > (uint)52) {
        if (!(((_114.x & 125) == 105) || ((uint)_116 < (uint)68))) {
          _1740 = (_116 == 98);
        } else {
          _1740 = true;
        }
      } else {
        if ((uint)_116 > (uint)10) {
          if ((uint)_116 < (uint)20) {
            if (_614 == 14) {
              _1740 = (_116 == 98);
            } else {
              _1740 = true;
            }
          } else {
            if (!((_114.x & 125) == 105)) {
              _1740 = (_116 == 98);
            } else {
              _1740 = true;
            }
          }
        } else {
          _1740 = (_116 == 98);
        }
      }
    } else {
      _1740 = true;
    }
    [branch]
    if (_1670) {
      _1749 = (((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(_98, _100, 0)))).x) & 16777215)))) * 5.960465188081798e-08f);
    } else {
      _1749 = _111.x;
    }
    _1777 = mad((_projToPrevProj[2].w), _1749, mad((_projToPrevProj[1].w), _971, ((_projToPrevProj[0].w) * _969))) + (_projToPrevProj[3].w);
    if (_1740) {
      _1784 = __3__36__0__0__g_velocity.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_velocity_load]
      _1790 = (_1784.x * 2.0f);
      _1791 = (_1784.y * 2.0f);
    } else {
      _1790 = (((mad((_projToPrevProj[2].x), _1749, mad((_projToPrevProj[1].x), _971, ((_projToPrevProj[0].x) * _969))) + (_projToPrevProj[3].x)) / _1777) - _969);
      _1791 = (((mad((_projToPrevProj[2].y), _1749, mad((_projToPrevProj[1].y), _971, ((_projToPrevProj[0].y) * _969))) + (_projToPrevProj[3].y)) / _1777) - _971);
    }
    _1793 = _nearFarProj.x / max(1.0000000116860974e-07f, _1749);
    _1796 = (_1790 * 0.5f) + _108;
    _1797 = _109 - (_1791 * 0.5f);
    _1805 = select((((_1796 < 0.0f) || (_1796 > 1.0f)) || ((_1797 < 0.0f) || (_1797 > 1.0f))), 1.0f, 0.0f);
    _1810 = (_1796 * _bufferSizeAndInvSize.x) + -0.5f;
    _1811 = (_1797 * _bufferSizeAndInvSize.y) + -0.5f;
    _1814 = int(floor(_1810));
    _1815 = int(floor(_1811));
    _1816 = float((int)(_1814));
    _1817 = float((int)(_1815));
    _1820 = (_1816 + 0.5f) * _bufferSizeAndInvSize.z;
    _1821 = (_1817 + 0.5f) * _bufferSizeAndInvSize.w;
    _1823 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1820, _1821));  // [sem: _3__36__0__0__g_depthOpaquePrev_gather]
    _1846 = mad(((uint)((uint)(_1823.w)) >> 24), 16777216, mad(((uint)((uint)(_1823.z)) >> 24), 65536, mad(((uint)((uint)(_1823.y)) >> 24), 256, ((uint)((uint)(_1823.x)) >> 24))));
    if (_1720) {
      if ((uint)_116 > (uint)52) {
        if (!((_116 == 98) || (((_114.x & 125) == 105) || ((uint)_116 < (uint)68)))) {
          _1876 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _1876 = 0.0f;
        }
      } else {
        if ((uint)_116 > (uint)10) {
          if ((uint)_116 < (uint)20) {
            if (_614 == 14) {
              _1876 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1876 = 0.0f;
            }
          } else {
            if (!((_114.x & 125) == 105)) {
              _1876 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1876 = 0.0f;
            }
          }
        } else {
          _1876 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _1876 = 0.0f;
    }
    _1884 = _screenPercentage.x * 2.0f;
    _1885 = _1884 * abs(_108 + -0.5f);
    _1886 = _screenPercentage.y * 2.0f;
    _1887 = _1886 * abs(_109 + -0.5f);
    _1891 = sqrt(dot(float2(_1885, _1887), float2(_1885, _1887)) + 1.0f) * _1793;
    _1908 = _1884 * abs(_1796 + -0.5f);
    _1909 = _1886 * abs(_1797 + -0.5f);
    _1912 = sqrt(dot(float2(_1908, _1909), float2(_1908, _1909)) + 1.0f);
    _1927 = _594 || ((uint)(_1599 + -97) < (uint)2);
    _1929 = _1793 * _1793;
    _1931 = (_1929 * select(_1927, 0.5f, 0.20000000298023224f)) + 1.0f;
    _1935 = ((uint)(_1599 + -53) < (uint)15);
    if (_1935) {
      _1954 = (1000.0f - (saturate((float)((bool)(uint)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _1954 = 50.0f;
    }
    _1962 = select(((_1599 == 57) || _1935), 0.0f, ((_temporalReprojectionParams.y * 0.10000000149011612f) * max(0.0f, (_1793 + -1.0f))));
    _1967 = max(0.0f, (abs(_1891 - (_1912 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1823.x & 16777215)))) * 5.960465188081798e-08f))) - _1876))) - _1962));
    _1968 = max(0.0f, (abs(_1891 - (_1912 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1823.y & 16777215)))) * 5.960465188081798e-08f))) - _1876))) - _1962));
    _1969 = max(0.0f, (abs(_1891 - (_1912 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1823.z & 16777215)))) * 5.960465188081798e-08f))) - _1876))) - _1962));
    _1970 = max(0.0f, (abs(_1891 - (_1912 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1823.w & 16777215)))) * 5.960465188081798e-08f))) - _1876))) - _1962));
    _1971 = _1967 * _1967;
    _1972 = _1968 * _1968;
    _1973 = _1969 * _1969;
    _1974 = _1970 * _1970;
    _1976 = (-1.4426950216293335f / ((_1929 * 0.10000000149011612f) + 1.0f)) * select(_1927, 0.20000000298023224f, _1954);
    _1989 = select((_1971 > _1931), 0.0f, exp2(_1976 * _1971));
    _1990 = select((_1972 > _1931), 0.0f, exp2(_1972 * _1976));
    _1991 = select((_1973 > _1931), 0.0f, exp2(_1973 * _1976));
    _1992 = select((_1974 > _1931), 0.0f, exp2(_1974 * _1976));
    if (!_1670) {
      _1994 = _1846 & 127;
      _1995 = _1846 & 32512;
      _1996 = _1846 & 8323072;
      _1997 = _1846 & 2130706432;
      _2036 = (_1994 == 57) || ((uint)(_1994 + -53) < (uint)15);
      _2037 = (_1995 == 14592) || ((uint)((((uint)(_1846) >> 8) & 127) + -53) < (uint)15);
      _2038 = (_1996 == 3735552) || ((uint)((((uint)(_1846) >> 16) & 127) + -53) < (uint)15);
      _2039 = (_1997 == 956301312) || ((uint)((((uint)(_1846) >> 24) & 127) + -53) < (uint)15);
      _2051 = _116 + -53;
      if (_1720) {
        _2057 = ((_116 == 57) || ((uint)_2051 < (uint)15));
      } else {
        _2057 = true;
      }
      _2066 = (_1599 == 6);
      _2088 = ((uint)(_1599 + -105) < (uint)3);
      _2095 = (_116 == 57) || ((uint)_2051 < (uint)15);
      _2129 = (((float)((bool)((uint)((_617 || ((_1994 != 54) && ((_1846 & 126) != 66))) && (!(((((_1846 & 128) != 0) || _2036) ^ _2057) || ((_2066 ^ (_1994 == 6)) || ((_2088 ^ ((_1994 == 107) || ((uint)(_1994 + -105) < (uint)2))) || (_2036 ^ _2095))))))))) * _1989);
      _2130 = (((float)((bool)((uint)((_617 || ((_1995 != 13824) && ((_1846 & 32256) != 16896))) && (!(((((_1846 & 32768) != 0) || _2037) ^ _2057) || ((_2066 ^ (_1995 == 1536)) || ((_2088 ^ (((_1846 & 32000) == 26880) || (_1995 == 27136))) || (_2037 ^ _2095))))))))) * _1990);
      _2131 = (((float)((bool)((uint)((_617 || ((_1996 != 3538944) && ((_1846 & 8257536) != 4325376))) && (!(((((_1846 & 8388608) != 0) || _2038) ^ _2057) || ((_2066 ^ (_1996 == 393216)) || ((_2088 ^ (((_1846 & 8192000) == 6881280) || (_1996 == 6946816))) || (_2038 ^ _2095))))))))) * _1991);
      _2132 = (((float)((bool)((uint)((_617 || ((_1997 != 905969664) && ((_1846 & 2113929216) != 1107296256))) && (!(((((int)_1846 < (int)0) || _2039) ^ _2057) || ((_2066 ^ (_1997 == 100663296)) || ((_2088 ^ (((_1846 & 2097152000) == 1761607680) || (_1997 == 1778384896))) || (_2039 ^ _2095))))))))) * _1992);
    } else {
      _2129 = _1989;
      _2130 = _1990;
      _2131 = _1991;
      _2132 = _1992;
    }
    _2134 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1820, _1821));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather]
    _2153 = min(1.0f, ((((float)((uint)((uint)(_2134.w & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2154 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2134.w)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2155 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2134.w)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _2157 = rsqrt(dot(float3(_2153, _2154, _2155), float3(_2153, _2154, _2155)));  // [sem: invLength]
    _2162 = saturate(dot(float3(_673, _674, _675), float3((_2157 * _2153), (_2157 * _2154), (_2157 * _2155))));  // [sem: expr_sat]
    _2177 = min(1.0f, ((((float)((uint)((uint)(_2134.z & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2178 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2134.z)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2179 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2134.z)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _2181 = rsqrt(dot(float3(_2177, _2178, _2179), float3(_2177, _2178, _2179)));  // [sem: invLength]
    _2186 = saturate(dot(float3(_673, _674, _675), float3((_2181 * _2177), (_2181 * _2178), (_2181 * _2179))));  // [sem: expr_sat]
    _2201 = min(1.0f, ((((float)((uint)((uint)(_2134.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2202 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2134.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2203 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2134.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _2205 = rsqrt(dot(float3(_2201, _2202, _2203), float3(_2201, _2202, _2203)));  // [sem: invLength]
    _2210 = saturate(dot(float3(_673, _674, _675), float3((_2205 * _2201), (_2205 * _2202), (_2205 * _2203))));  // [sem: expr_sat]
    _2225 = min(1.0f, ((((float)((uint)((uint)(_2134.y & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2226 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2134.y)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2227 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2134.y)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _2229 = rsqrt(dot(float3(_2225, _2226, _2227), float3(_2225, _2226, _2227)));  // [sem: invLength]
    _2234 = saturate(dot(float3(_673, _674, _675), float3((_2229 * _2225), (_2229 * _2226), (_2229 * _2227))));  // [sem: expr_sat]
    _2237 = select((_1708 || (_1707 || _1927)), 0.009999999776482582f, 1.0f);
    _2254 = _1810 - _1816;
    _2255 = _1811 - _1817;
    _2256 = 1.0f - _2254;
    _2257 = 1.0f - _2255;
    _2262 = (_2256 * _2255) * _2129;
    _2264 = (_2255 * _2254) * _2130;
    _2266 = (_2257 * _2254) * _2131;
    _2268 = (_2257 * _2256) * _2132;
    _2270 = saturate(select(_1670, 1.0f, (pow(_2210, _2237))) * _2262);  // [sem: expr_sat]
    _2271 = saturate(select(_1670, 1.0f, (pow(_2234, _2237))) * _2264);  // [sem: expr_sat]
    _2272 = saturate(select(_1670, 1.0f, (pow(_2186, _2237))) * _2266);  // [sem: expr_sat]
    _2273 = saturate(select(_1670, 1.0f, (pow(_2162, _2237))) * _2268);  // [sem: expr_sat]
    _2276 = asint(__3__37__0__0__g_structureCounterBuffer.Load(8));
    _2277 = WaveReadLaneFirst(_2276);
    [branch]
    if (!(_2277 == 0)) {
      _2285 = (((uint)(__3__36__0__0__g_tiledManyLightsMasks.Load(int3(((int)(_98) >> 5), ((int)(_100) >> 5), 0)))).x) & 4;
      _2287 = (uint)(_2285) >> 2;
      if (!(_2285 == 0)) {
        _2295 = max((saturate(dot(float3(_1609, _1610, _1611), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _1805);
        _2296 = _2287;
      } else {
        _2295 = _1805;
        _2296 = _2287;
      }
    } else {
      _2295 = _1805;
      _2296 = 0;
    }
  // [sem: expr_sat]
    _2306 = saturate(max(_2295, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    _2307 = _1815 + 1u;
    half4 _2309 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1814, _2307, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    _2314 = _1814 + 1u;
    half4 _2315 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_2314, _2307, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    half4 _2320 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_2314, _1815, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    half4 _2325 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1814, _1815, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    _2330 = dot(float4(_2270, _2271, _2272, _2273), float4(1.0f, 1.0f, 1.0f, 1.0f));
  // [sem: expr_sat]
    _2339 = saturate(dot(float4(_2270, _2271, _2272, _2273), float4(float(_2309.w), float(_2315.w), float(_2320.w), float(_2325.w))) * (1.0f / max(1.0f, _2330)));
    _2344 = sqrt((_1791 * _1791) + (_1790 * _1790)) * 50.0f;
    if (_1935) {
      _2353 = saturate(1.0f - _2344);  // [sem: expr_sat]
    } else {
      _2353 = (1.0f - (saturate(_2344) * 0.5f));  // [sem: expr_sat]
    }
    _2357 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    _2360 = min(31.0f, ((_2353 * 15.0f) * _2357));
    _2361 = (_1599 == 29);
    if (_2361) {
      _2365 = min(2.0f, _2360);
    } else {
      _2365 = _2360;
    }
    _2366 = (_1599 == 24);
    _2367 = select(_2366, 1.0f, _2339);
    _2369 = (_2367 * _2367) * 4.0f;
    _2380 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_108, _109), 0.0f);  // [sem: _3__36__0__0__g_manyLightsMoments_sampleLod]
    _2385 = saturate(_2380.w);  // [sem: expr_sat]
    _2387 = 1.0f / max(9.999999974752427e-07f, _2330);
    _2388 = _2387 * _2270;
    _2389 = _2387 * _2271;
    _2390 = _2387 * _2272;
    _2391 = _2387 * _2273;
    _2392 = saturate(saturate(max(_2306, (1.0f / ((saturate(_2369) * _2365) + 1.0f))) + _renderParams.z));  // [sem: expr_sat]
    _2434 = 1.0f / _exposure4.x;
    _2451 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_2391 * float(_2325.x)) + ((_2390 * float(_2320.x)) + ((_2388 * float(_2309.x)) + (_2389 * float(_2315.x))))))) * _exposure4.y)))));
    _2452 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_2391 * float(_2325.y)) + ((_2390 * float(_2320.y)) + ((_2388 * float(_2309.y)) + (_2389 * float(_2315.y))))))) * _exposure4.y)))));
    _2453 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_2391 * float(_2325.z)) + ((_2390 * float(_2320.z)) + ((_2388 * float(_2309.z)) + (_2389 * float(_2315.z))))))) * _exposure4.y)))));
    if (_renderParams.y == 0.0f) {
      if (_1707) {
        _2483 = _2451;
        _2484 = _2452;
        _2485 = _2453;
        _2486 = _2392;
        _2490 = _2483;
        _2491 = _2484;
        _2492 = _2485;
        _2493 = _2486;
        _2494 = saturate(_2339 + 0.0625f);  // [sem: expr_sat]
      } else {
        if (!_1708) {
          _2458 = dot(float3(_2451, _2452, _2453), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
          _2473 = ((min(_2458, _2380.y) / max(9.999999974752427e-07f, _2458)) * _2385) + saturate(1.0f - _2385);
  // [sem: expr_sat]
          _2478 = saturate((saturate(((_2380.x - _2458) * 5.0f) / max(9.999999974752427e-07f, _2380.x)) * 0.5f) + _2392);
          _2479 = (_2473 * _2451);
          _2480 = (_2473 * _2452);
          _2481 = (_2473 * _2453);
        } else {
          _2478 = _2392;  // [sem: expr_sat]
          _2479 = _2451;
          _2480 = _2452;
          _2481 = _2453;
        }
        if (!_2366) {
          _2483 = _2479;
          _2484 = _2480;
          _2485 = _2481;
          _2486 = _2478;
          _2490 = _2483;
          _2491 = _2484;
          _2492 = _2485;
          _2493 = _2486;
          _2494 = saturate(_2339 + 0.0625f);  // [sem: expr_sat]
        } else {
          _2490 = _2479;
          _2491 = _2480;
          _2492 = _2481;
          _2493 = _2478;
          _2494 = 0.0f;  // [sem: expr_sat]
        }
      }
    } else {
      _2478 = _2392;  // [sem: expr_sat]
      _2479 = _2451;
      _2480 = _2452;
      _2481 = _2453;
      if (!_2366) {
        _2483 = _2479;
        _2484 = _2480;
        _2485 = _2481;
        _2486 = _2478;
        _2490 = _2483;
        _2491 = _2484;
        _2492 = _2485;
        _2493 = _2486;
        _2494 = saturate(_2339 + 0.0625f);  // [sem: expr_sat]
      } else {
        _2490 = _2479;
        _2491 = _2480;
        _2492 = _2481;
        _2493 = _2478;
        _2494 = 0.0f;  // [sem: expr_sat]
      }
    }
    _2501 = (_2493 * (_1609 - _2490)) + _2490;
    _2502 = (_2493 * (_1610 - _2491)) + _2491;
    _2503 = (_2493 * (_1611 - _2492)) + _2492;
    __3__38__0__1__g_diffuseResultUAV[int2(_98, _100)] = float4((half)(half(_2501)), (half)(half(_2502)), (half)(half(_2503)), (half)(half(_2494)));
    _2510 = float(_1703);
    _2511 = float(_1704);
    _2512 = float(_1705);
    if (_1599 == 53) {
      _2519 = saturate(((_2511 + _2510) + _2512) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _2519 = 1.0f;  // [sem: expr_sat]
    }
    _2520 = float(_1701);
    _2526 = (0.699999988079071f / min(max(max(max(_2510, _2511), _2512), 0.009999999776482582f), 0.699999988079071f)) * _2519;
    _2536 = (((_2526 * _2510) + -0.03999999910593033f) * _2520) + 0.03999999910593033f;
    _2537 = (((_2526 * _2511) + -0.03999999910593033f) * _2520) + 0.03999999910593033f;
    _2538 = (((_2526 * _2512) + -0.03999999910593033f) * _2520) + 0.03999999910593033f;
    if (!_1670) {
      _2543 = saturate(1.0f - _1645);  // [sem: expr_sat]
    } else {
      _2543 = 1.0f;  // [sem: expr_sat]
    }
    _2546 = (_1599 == 98) || (_1706 == 96);
    if (!_2546) {
      bool __branch_chain_2547;
      if ((uint)(_1599 + -105) < (uint)2) {
        _2554 = _178;
        __branch_chain_2547 = true;
      } else {
        if (!((uint)(_1599 + -11) < (uint)9)) {
          _2554 = false;
          __branch_chain_2547 = true;
        } else {
          _2584 = 0.0h;
          _2585 = _1599;
          _2586 = 0.0f;
          _2587 = 0.0f;
          _2588 = 0.0f;
          __branch_chain_2547 = false;
        }
      }
      if (__branch_chain_2547) {
        _2556 = (_1599 == 107) || _2554;
        _2559 = select(_2556, 0.0f, _1701);
        if (_2556 || (!_1664)) {
          if (_1599 == 33) {
            _2569 = uint((_1033 * 255.0f) + 0.5f);
            _2571 = ((uint)(_2569) >> 4) & 7;
            if (!(_2571 == 0)) {
              _2578 = __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((int)(_2571 + 1))];
              _2584 = _2559;
              _2585 = _1599;
              _2586 = min((1.0f - _2578.y), _2578.x);
              _2587 = (((float)((uint)((uint)(_2569 & 15)))) * 0.06666667014360428f);
              _2588 = _2578.x;
            } else {
              _2584 = _2559;
              _2585 = _1599;
              _2586 = 0.0f;
              _2587 = 0.0f;
              _2588 = 0.0f;
            }
          } else {
            if (_1599 == 55) {
              if (!(_1033 < 0.0010000000474974513f)) {
                _2569 = uint((_1033 * 255.0f) + 0.5f);
                _2571 = ((uint)(_2569) >> 4) & 7;
                if (!(_2571 == 0)) {
                  _2578 = __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((int)(_2571 + 1))];
                  _2584 = _2559;
                  _2585 = _1599;
                  _2586 = min((1.0f - _2578.y), _2578.x);
                  _2587 = (((float)((uint)((uint)(_2569 & 15)))) * 0.06666667014360428f);
                  _2588 = _2578.x;
                } else {
                  _2584 = _2559;
                  _2585 = _1599;
                  _2586 = 0.0f;
                  _2587 = 0.0f;
                  _2588 = 0.0f;
                }
              } else {
                _2584 = _2559;
                _2585 = 53;
                _2586 = 0.0f;
                _2587 = 0.0f;
                _2588 = 0.0f;
              }
            } else {
              _2584 = _2559;
              _2585 = _1599;
              _2586 = 0.0f;
              _2587 = 0.0f;
              _2588 = 0.0f;
            }
          }
        } else {
          _2584 = 0.0h;
          _2585 = 65;
          _2586 = 0.0f;
          _2587 = 0.0f;
          _2588 = 0.0f;
        }
      }
    } else {
      _2584 = 0.0h;
      _2585 = _1599;
      _2586 = 0.0f;
      _2587 = 0.0f;
      _2588 = 0.0f;
    }
    _2590 = dot(float3(_1013, _1014, _1015), float3(_673, _674, _675)) * 2.0f;
    _2594 = _1013 - (_2590 * _673);
    _2595 = _1014 - (_2590 * _674);
    _2596 = _1015 - (_2590 * _675);
    _2598 = rsqrt(dot(float3(_2594, _2595, _2596), float3(_2594, _2595, _2596)));  // [sem: invLength]
    _2599 = _2594 * _2598;
    _2600 = _2595 * _2598;
    _2601 = _2596 * _2598;
    _2606 = float(_1702);
    _2608 = select((_2606 < 0.800000011920929f), ((__3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_108, _109), 0.0f)).x), 0.0f);
    _2609 = _2608 * _2599;
    _2610 = _2608 * _2600;
    _2611 = _2608 * _2601;
    _2616 = dot(float3(_2609, _2610, _2611), float3((-0.0f - _673), (-0.0f - _674), (-0.0f - _675))) * 2.0f;
    _2621 = ((_2616 * _673) + _1008) + _2609;
    _2623 = ((_2616 * _674) + _1009) + _2610;
    _2625 = ((_2616 * _675) + _1010) + _2611;
    _2649 = mad((_viewProjRelative[2].x), _2625, mad((_viewProjRelative[1].x), _2623, (_2621 * (_viewProjRelative[0].x)))) + (_viewProjRelative[3].x);
    _2653 = mad((_viewProjRelative[2].y), _2625, mad((_viewProjRelative[1].y), _2623, (_2621 * (_viewProjRelative[0].y)))) + (_viewProjRelative[3].y);
    _2657 = mad((_viewProjRelative[2].z), _2625, mad((_viewProjRelative[1].z), _2623, (_2621 * (_viewProjRelative[0].z)))) + (_viewProjRelative[3].z);
    _2661 = mad((_viewProjRelative[2].w), _2625, mad((_viewProjRelative[1].w), _2623, (_2621 * (_viewProjRelative[0].w)))) + (_viewProjRelative[3].w);
    _2699 = mad((_projToPrevProj[3].w), _2661, mad((_projToPrevProj[2].w), _2657, mad((_projToPrevProj[1].w), _2653, ((_projToPrevProj[0].w) * _2649))));
    _2700 = mad((_projToPrevProj[3].x), _2661, mad((_projToPrevProj[2].x), _2657, mad((_projToPrevProj[1].x), _2653, ((_projToPrevProj[0].x) * _2649)))) / _2699;
    _2701 = mad((_projToPrevProj[3].y), _2661, mad((_projToPrevProj[2].y), _2657, mad((_projToPrevProj[1].y), _2653, ((_projToPrevProj[0].y) * _2649)))) / _2699;
    _2705 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[3].z), _2661, mad((_projToPrevProj[2].z), _2657, mad((_projToPrevProj[1].z), _2653, ((_projToPrevProj[0].z) * _2649)))) / _2699));
    _2741 = mad((_invViewProjRelativePrev[2].w), _2705, mad((_invViewProjRelativePrev[1].w), _2701, ((_invViewProjRelativePrev[0].w) * _2700))) + (_invViewProjRelativePrev[3].w);
    _2752 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[2].x), _2705, mad((_invViewProjRelativePrev[1].x), _2701, ((_invViewProjRelativePrev[0].x) * _2700))) + (_invViewProjRelativePrev[3].x)) / _2741) - _2621);
    _2753 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[2].y), _2705, mad((_invViewProjRelativePrev[1].y), _2701, ((_invViewProjRelativePrev[0].y) * _2700))) + (_invViewProjRelativePrev[3].y)) / _2741) - _2623);
    _2754 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _2705, mad((_invViewProjRelativePrev[1].z), _2701, ((_invViewProjRelativePrev[0].z) * _2700))) + (_invViewProjRelativePrev[3].z)) / _2741) - _2625);
    _2755 = dot(float3(_2752, _2753, _2754), float3(_2599, _2600, _2601));
    _2759 = _2752 - (_2755 * _2599);
    _2760 = _2753 - (_2755 * _2600);
    _2761 = _2754 - (_2755 * _2601);
    _2777 = (saturate(_2608 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_2759 * _2759) + (_2760 * _2760)) + (_2761 * _2761)) / max(0.0010000000474974513f, _2608))) + -1.0f)) + 1.0f;
    _2778 = _2777 * _2777;
    _2779 = _2778 * _2778;
    _2780 = _2779 * _2210;
    _2781 = _2779 * _2234;
    _2782 = _2779 * _2186;
    _2783 = _2779 * _2162;
    _2786 = (_renderParams.z > 0.0f);
    _2788 = float(1.0h - _1702);
    _2792 = (_2700 - (_2649 / _2661)) - _1790;
    _2793 = (_2701 - (_2653 / _2661)) - _1791;
    _2797 = sqrt((_2793 * _2793) + (_2792 * _2792));
  // [sem: expr_sat]
    _2802 = saturate((((_2788 * _2788) * (1.0f - (_1718 * 0.8999999761581421f))) * _2797) * select(_2786, 2000.0f, 500.0f));
    _2808 = _2585 & -2;
    _2811 = (_2585 == 29);
    _2814 = select(((_1670 || _2811) || ((_2808 == 24) || (_renderParams.y > 0.0f))), 1.0f, ((((float(_1620.y) * _865) + (float(_1613.y) * _864)) + (float(_1629.y) * _866)) + (float(_1638.y) * _867)));
    _2818 = float(_2584);
    _2823 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
  // [sem: expr_sat]
    _2849 = saturate(saturate(1.0f - (((_2818 * _120) / max(0.0010000000474974513f, _1718)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_2823 * 0.07500000298023224f)) + max(0.019999999552965164f, _2606)) + (saturate(_120 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_120 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_2818) * 0.75f)));
    if (_2585 == 64) {
      _2858 = ((saturate(_120 * 0.25f) * (_2849 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _2858 = _2849;
    }
    _2860 = (_2823 * 16.0f) + 16.0f;
    _2866 = select((_2823 > 1.0f), 0.0f, saturate((1.0f / _2860) * (_120 - _2860)));
    if (_2585 == 105) {
      _2877 = 1.0f;
      _2881 = select((_2585 == 65), 0.0f, _2877);
    } else {
      if (!((uint)(_2585 & 24) > (uint)23)) {
        _2877 = select((_2585 == 107), 1.0f, ((_2866 + _2858) - (_2866 * _2858)));
        _2881 = select((_2585 == 65), 0.0f, _2877);
      } else {
        _2881 = 0.0f;
      }
    }
    _2890 = select(((_2585 == 57) || ((uint)((int)(_2585 + (uint)(-53))) < (uint)15)), 31.0f, 63.0f);
    if (!_2811) {
      _2903 = (saturate((2000.0f - (saturate(float(_2584 * 0.5h) + (_120 * 0.0625f)) * 1500.0f)) * _2797) * (7.0f - _2890)) + _2890;
      if ((uint)((int)(_2585 + (uint)(-12))) < (uint)9) {
        _2913 = ((saturate(_120 * 0.004999999888241291f) * (_2903 + -2.0f)) + 2.0f);
      } else {
        _2913 = _2903;
      }
    } else {
      _2913 = _2890;
    }
    _2916 = max(0.040008545h, _1702);
  // [sem: expr_sat]
    _2934 = saturate(max(max(_2306, select(_2786, (_2802 + 0.125f), 0.0f)), (1.0f / (((saturate((_2357 * _2357) * _2369) * min(64.0f, (_2913 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _2881) + (_120 * 0.0078125f)) + float(((half)(_2916 * _2916)) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    if ((uint)_2585 > (uint)52) {
      if ((uint)_2585 < (uint)68) {
        if (_2808 == 66) {
          _2967 = _2780;
          _2968 = _2781;
          _2969 = _2782;
          _2970 = _2783;
          _2973 = _2967;
          _2974 = _2968;
          _2975 = _2969;
          _2976 = _2970;
          _2977 = (half)(max(0.89990234h, _1702));
        } else {
          if (!(_2585 == 54)) {
            _2945 = _2780 * _2780;
            _2946 = _2781 * _2781;
            _2947 = _2782 * _2782;
            _2948 = _2783 * _2783;
            _2949 = _2945 * _2945;
            _2950 = _2946 * _2946;
            _2951 = _2947 * _2947;
            _2952 = _2948 * _2948;
            _2958 = (_2949 * _2949);
            _2959 = (_2950 * _2950);
            _2960 = (_2951 * _2951);
            _2961 = (_2952 * _2952);
          } else {
            _2958 = _2780;
            _2959 = _2781;
            _2960 = _2782;
            _2961 = _2783;
          }
          if ((_2585 == 54) || (_2808 == 66)) {
            _2967 = _2958;
            _2968 = _2959;
            _2969 = _2960;
            _2970 = _2961;
            _2973 = _2967;
            _2974 = _2968;
            _2975 = _2969;
            _2976 = _2970;
            _2977 = (half)(max(0.89990234h, _1702));
          } else {
            _2973 = _2958;
            _2974 = _2959;
            _2975 = _2960;
            _2976 = _2961;
            _2977 = (half)(max(0.099975586h, _1702));
          }
        }
      } else {
        _2973 = _2780;
        _2974 = _2781;
        _2975 = _2782;
        _2976 = _2783;
        _2977 = (half)(max(0.099975586h, _1702));
      }
    } else {
      _2958 = _2780;
      _2959 = _2781;
      _2960 = _2782;
      _2961 = _2783;
      if ((_2585 == 54) || (_2808 == 66)) {
        _2967 = _2958;
        _2968 = _2959;
        _2969 = _2960;
        _2970 = _2961;
        _2973 = _2967;
        _2974 = _2968;
        _2975 = _2969;
        _2976 = _2970;
        _2977 = (half)(max(0.89990234h, _1702));
      } else {
        _2973 = _2958;
        _2974 = _2959;
        _2975 = _2960;
        _2976 = _2961;
        _2977 = (half)(max(0.099975586h, _1702));
      }
    }
    _2978 = float(_2977);
    _2979 = _2978 * _2978;
    _2980 = _2979 * _2979;
    _2993 = (((_2980 * _2973) - _2973) * _2973) + 1.0f;
    _2994 = (((_2980 * _2974) - _2974) * _2974) + 1.0f;
    _2995 = (((_2980 * _2975) - _2975) * _2975) + 1.0f;
    _2996 = (((_2980 * _2976) - _2976) * _2976) + 1.0f;
    _3021 = saturate(select(_2811, 1.0f, saturate((_2980 / (_2993 * _2993)) * _2973)) * _2262);  // [sem: expr_sat]
    _3022 = saturate(select(_2811, 1.0f, saturate((_2980 / (_2994 * _2994)) * _2974)) * _2264);  // [sem: expr_sat]
    _3023 = saturate(select(_2811, 1.0f, saturate((_2980 / (_2995 * _2995)) * _2975)) * _2266);  // [sem: expr_sat]
    _3024 = saturate(select(_2811, 1.0f, saturate((_2980 / (_2996 * _2996)) * _2976)) * _2268);  // [sem: expr_sat]
    _3026 = ((uint)(_2585 & 24) > (uint)23);
    [branch]
    if (_3026) {
      _3039 = mad((_projToPrevProj[2].w), _111.x, mad((_projToPrevProj[1].w), _971, ((_projToPrevProj[0].w) * _969))) + (_projToPrevProj[3].w);
      _3042 = ((mad((_projToPrevProj[2].x), _111.x, mad((_projToPrevProj[1].x), _971, ((_projToPrevProj[0].x) * _969))) + (_projToPrevProj[3].x)) / _3039) - _969;
      _3043 = ((mad((_projToPrevProj[2].y), _111.x, mad((_projToPrevProj[1].y), _971, ((_projToPrevProj[0].y) * _969))) + (_projToPrevProj[3].y)) / _3039) - _971;
      _3053 = (((_3042 * 0.5f) + _108) * _bufferSizeAndInvSize.x) + -0.5f;
      _3054 = ((_109 - (_3043 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
      _3057 = int(floor(_3053));
      _3058 = int(floor(_3054));
      _3059 = float((int)(_3057));
      _3060 = float((int)(_3058));
      [branch]
      if (_2811) {
  // [sem: _3__36__0__0__g_stencilPrev_gather]
        _3070 = __3__36__0__0__g_stencilPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(((_3059 + 0.5f) * _bufferSizeAndInvSize.z), ((_3060 + 0.5f) * _bufferSizeAndInvSize.w)));
        _3077 = mad(_3070.w, 16777216, mad(_3070.z, 65536, mad(_3070.y, 256, _3070.x)));
        _3094 = saturate(((float)((bool)(uint)((uint)(_3077 & 24) > (uint)23))) * _3021);  // [sem: expr_sat]
        _3095 = saturate(((float)((bool)(uint)((uint)(_3077 & 6144) > (uint)5888))) * _3022);  // [sem: expr_sat]
        _3096 = saturate(((float)((bool)(uint)((uint)(_3077 & 1572864) > (uint)1507328))) * _3023);  // [sem: expr_sat]
        _3097 = saturate(((float)((bool)(uint)((uint)(_3077 & 402653184) > (uint)385875968))) * _3024);  // [sem: expr_sat]
        _3129 = max(saturate(min(max(((_1700 / ((_596 * 0.004999999888241291f) + 1.0f)) + (_2802 * 0.5f)), 0.03125f), 0.5f) + _2934), saturate(1.0f - dot(float4(_3094, _3095, _3096, _3097), float4(1.0f, 1.0f, 1.0f, 1.0f))));
        _3130 = _3057;
        _3131 = _3058;
        _3132 = _3094;
        _3133 = _3095;
        _3134 = _3096;
        _3135 = _3097;
      } else {
        _3112 = _3053 - _3059;
        _3113 = _3054 - _3060;
        _3114 = 1.0f - _3112;
        _3115 = 1.0f - _3113;
        _3129 = (saturate((sqrt((_3043 * _3043) + (_3042 * _3042)) * 50.0f) + 0.125f) * 0.875f);
        _3130 = _3057;
        _3131 = _3058;
        _3132 = (_3114 * _3113);
        _3133 = (_3113 * _3112);
        _3134 = (_3115 * _3112);
        _3135 = (_3115 * _3114);
      }
    } else {
      _3129 = _2934;
      _3130 = _1814;
      _3131 = _1815;
      _3132 = _3021;
      _3133 = _3022;
      _3134 = _3023;
      _3135 = _3024;
    }
    _3136 = (_2818 > 0.20000000298023224f);
    _3137 = _3131 + 1u;
    half4 _3139 = __3__36__0__0__g_specularResultPrev.Load(int3(_3130, _3137, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _3152 = ((float)((bool)((uint)(!(_3136 ^ ((half)(_3139.w) < 0.0h)))))) * _3132;
    _3158 = _3130 + 1u;
    half4 _3159 = __3__36__0__0__g_specularResultPrev.Load(int3(_3158, _3137, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _3172 = ((float)((bool)((uint)(!(_3136 ^ ((half)(_3159.w) < 0.0h)))))) * _3133;
    half4 _3182 = __3__36__0__0__g_specularResultPrev.Load(int3(_3158, _3131, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _3195 = ((float)((bool)((uint)(!(_3136 ^ ((half)(_3182.w) < 0.0h)))))) * _3134;
    half4 _3205 = __3__36__0__0__g_specularResultPrev.Load(int3(_3130, _3131, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _3218 = ((float)((bool)((uint)(!(_3136 ^ ((half)(_3205.w) < 0.0h)))))) * _3135;
    _3242 = 1.0f / max(((saturate(_120 * 0.0625f) * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_3152, _3172, _3195, _3218), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    _3244 = -0.0f - (min(0.0f, (-0.0f - ((((_3152 * float(_3139.x)) + (_3172 * float(_3159.x))) + (_3195 * float(_3182.x))) + (_3218 * float(_3205.x))))) * _3242);
    _3246 = -0.0f - (min(0.0f, (-0.0f - ((((_3152 * float(_3139.y)) + (_3172 * float(_3159.y))) + (_3195 * float(_3182.y))) + (_3218 * float(_3205.y))))) * _3242);
    _3248 = -0.0f - (min(0.0f, (-0.0f - ((((_3152 * float(_3139.z)) + (_3172 * float(_3159.z))) + (_3195 * float(_3182.z))) + (_3218 * float(_3205.z))))) * _3242);
    _3249 = _3242 * min(0.0f, (-0.0f - ((((_3152 * abs(float(_3139.w))) + (_3172 * abs(float(_3159.w)))) + (_3195 * abs(float(_3182.w)))) + (_3218 * abs(float(_3205.w))))));
    if ((_2585 != 54) && ((_2808 != 66) && (_renderParams.y == 0.0f))) {
      _3256 = dot(float3(_3244, _3246, _3248), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _3263 = ((min(_3256, _2380.z) / max(9.999999717180685e-10f, _3256)) * _2385) + saturate(1.0f - _2385);
      _3268 = (_3263 * _3244);
      _3269 = (_3263 * _3246);
      _3270 = (_3263 * _3248);
    } else {
      _3268 = _3244;
      _3269 = _3246;
      _3270 = _3248;
    }
    _3271 = _3268 * _exposure4.y;
    _3272 = _3269 * _exposure4.y;
    _3273 = _3270 * _exposure4.y;
    _3286 = ((max(0.0010000000474974513f, _2543) + _3249) * _3129) - _3249;
    _3296 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2814 * ((((_928.x * _865) + (_921.x * _864)) + (_938.x * _866)) + (_948.x * _867))) - _3271) * _3129) + _3271))));
    _3297 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2814 * ((((_928.y * _865) + (_921.y * _864)) + (_938.y * _866)) + (_948.y * _867))) - _3272) * _3129) + _3272))));
    _3298 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2814 * ((((_928.z * _865) + (_921.z * _864)) + (_938.z * _866)) + (_948.z * _867))) - _3273) * _3129) + _3273))));
    __3__38__0__1__g_specularResultUAV[int2(_98, _100)] = float4((half)(half(_3296)), (half)(half(_3297)), (half)(half(_3298)), (half)(half(select(_3136, (-0.0f - _3286), _3286))));
    _3306 = select(_3026, 0.0f, _3286);
    _3311 = float(half(lerp(_3306, 1.0f, _2606)));
    _3312 = (_2808 == 64);
    _3314 = ((int)(uint)(_179)) ^ 1;
    if ((((int)(uint)(_3312)) & _3314) == 0) {
      _3331 = saturate(exp2((_3311 * _3311) * (_120 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _3331 = select((_cavityParams.z > 0.0f), select(_179, 0.0f, _1032), 1.0f);  // [sem: expr_sat]
    }
    _3334 = (_cavityParams.x == 0.0f);
    _3335 = select(_3334, 1.0f, _3331);
    if (_3312) {
      _3341 = (_3335 * _2536);
      _3342 = (_3335 * _2537);
      _3343 = (_3335 * _2538);
    } else {
      _3341 = _2536;
      _3342 = _2537;
      _3343 = _2538;
    }
    if ((_2585 == 54) || (_2808 == 66)) {
  // [sem: _3__36__0__0__g_hairBrdfLookup_sampleLod]
      _3358 = __3__36__0__0__g_hairBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, (1.0f - saturate(abs(dot(float3(_1596, _1597, _1598), float3(_1013, _1014, _1015)))))), (1.0f - max(0.75f, (_3311 * 2.0f)))), 0.0f);
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
      _3364 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1718), (1.0f - _3311)), 0.0f);
      _3371 = ((_3364.x - _3358.x) * _1594) + _3358.x;
      _3372 = ((_3364.y - _3358.y) * _1594) + _3358.y;
      _3374 = (_3371 * 0.009999999776482582f) + _3372;
      _3538 = _3371;
      _3539 = _3372;
      _3540 = _3374;
      _3541 = _3374;
      _3542 = _3374;
    } else {
      if ((uint)((int)(_2585 + (uint)(-97))) < (uint)2) {
        if (!(abs(_223) > 0.9900000095367432f)) {
          _3382 = -0.0f - _224;
          _3384 = rsqrt(dot(float3(_3382, 0.0f, _222), float3(_3382, 0.0f, _222)));  // [sem: invLength]
          _3388 = (_3384 * _3382);
          _3389 = (_3384 * _222);
        } else {
          _3388 = 1.0f;
          _3389 = 0.0f;
        }
        _3391 = -0.0f - (_223 * _3389);
        _3394 = (_3389 * _222) - (_3388 * _224);
        _3395 = _3388 * _223;
        _3397 = rsqrt(dot(float3(_3391, _3394, _3395), float3(_3391, _3394, _3395)));  // [sem: invLength]
        _3405 = _viewPos.x + _1008;
        _3406 = _viewPos.y + _1009;
        _3407 = _viewPos.z + _1010;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
        _3412 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_3388, 0.0f, _3389), float3(_3405, _3406, _3407)), dot(float3((_3397 * _3391), (_3394 * _3397), (_3397 * _3395)), float3(_3405, _3406, _3407))), 0.0f);
        _3416 = _3412.x + -0.5f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
        _3417 = _3412.y + -0.5f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
        _3418 = _3412.z + -0.5f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
        _3420 = rsqrt(dot(float3(_3416, _3417, _3418), float3(_3416, _3417, _3418)));  // [sem: invLength]
        _3424 = (_3416 * _3420) + _673;
        _3425 = (_3417 * _3420) + _674;
        _3426 = (_3418 * _3420) + _675;
        _3428 = rsqrt(dot(float3(_3424, _3425, _3426), float3(_3424, _3425, _3426)));  // [sem: invLength]
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
        _3441 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1718), (1.0f - _3311)), 0.0f);
        _3448 = _3441.y + (exp2(log2(saturate(dot(float3(_1710, _1711, _1712), float3((_3424 * _3428), (_3425 * _3428), (_3426 * _3428))))) * 512.0f) * 20.0f);
        _3538 = _3441.x;
        _3539 = _3441.y;
        _3540 = (_3448 + (_3441.x * _3341));
        _3541 = (_3448 + (_3441.x * _3342));
        _3542 = (_3448 + (_3441.x * _3343));
      } else {
        if (_3312) {
          if (_2585 == 65) {
            _3521 = _3341;
            _3522 = _3342;
            _3523 = _3343;
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
            _3528 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1718), (1.0f - _3311)), 0.0f);
            _3538 = _3528.x;
            _3539 = _3528.y;
            _3540 = ((_3528.x * _3521) + _3528.y);
            _3541 = ((_3528.x * _3522) + _3528.y);
            _3542 = ((_3528.x * _3523) + _3528.y);
          } else {
            _3458 = min(0.9900000095367432f, _1718);
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
            _3463 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_3458, saturate(1.0f - (_3311 * 1.3300000429153442f))), 0.0f);
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
            _3468 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_3458, saturate(1.0f - (_3311 * 0.47998046875f))), 0.0f);
            _3472 = (_3468.x + _3463.x) * 0.5f;
            _3474 = (_3468.y + _3463.y) * 0.5f;
            _3538 = _3472;
            _3539 = _3474;
            _3540 = ((_3472 * _3341) + _3474);
            _3541 = ((_3472 * _3342) + _3474);
            _3542 = ((_3472 * _3343) + _3474);
          }
        } else {
          if ((_2585 == 33) || (_2585 == 55)) {
            _3491 = max(dot(float3(_2510, _2511, _2512), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
            _3495 = sqrt(_2510) - _3491;
            _3496 = sqrt(_2511) - _3491;
            _3497 = sqrt(_2512) - _3491;
            _3504 = saturate(1.0f - (pow(_1718, 4.0f)));  // [sem: expr_sat]
            _3521 = ((((_3495 * _2586) + _3491) + (_3504 * (_3495 * (_2588 - _2586)))) * _2587);
            _3522 = ((((_3496 * _2586) + _3491) + ((_3496 * (_2588 - _2586)) * _3504)) * _2587);
            _3523 = ((((_3497 * _2586) + _3491) + ((_3497 * (_2588 - _2586)) * _3504)) * _2587);
          } else {
            _3521 = _3341;
            _3522 = _3342;
            _3523 = _3343;
          }
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
          _3528 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1718), (1.0f - _3311)), 0.0f);
          _3538 = _3528.x;
          _3539 = _3528.y;
          _3540 = ((_3528.x * _3521) + _3528.y);
          _3541 = ((_3528.x * _3522) + _3528.y);
          _3542 = ((_3528.x * _3523) + _3528.y);
        }
      }
    }
    _3545 = select((_3312 || _3026), 1.0f, _3335) * _2434;
    _3552 = _2501 * _2434;
    _3553 = _2502 * _2434;
    _3554 = _2503 * _2434;
    if ((uint)_1599 > (uint)52) {
      if (((uint)_1599 < (uint)68) || _1670) {
        _3812 = _1701;
        _3813 = _1702;
        _3814 = _1703;
        _3815 = _1704;
        _3816 = _1705;
        _3817 = _3306;
        if (_1709) {
          _3823 = _3817;
          _3824 = _3814;
          _3825 = _3815;
          _3826 = _3816;
          _3827 = _3813;
          _3828 = _3812;
          _3829 = 0.0f;
          _3830 = 0.0f;
          _3831 = 0.0f;
          _3832 = (_3552 * _1600);
          _3833 = (_3553 * _1601);
          _3834 = (_3554 * _1602);
        } else {
          _3823 = _3817;
          _3824 = _3814;
          _3825 = _3815;
          _3826 = _3816;
          _3827 = _3813;
          _3828 = _3812;
          _3829 = _3552;
          _3830 = _3553;
          _3831 = _3554;
          _3832 = 0.0f;
          _3833 = 0.0f;
          _3834 = 0.0f;
        }
      } else {
        if (!((_1599 == 6) || ((_1706 == 106) || (((uint)(_1599 + -27) < (uint)2) || ((_1599 == 105) || (_1599 == 26)))))) {
          if (!(_1599 == 7)) {
            _3579 = exp2(log2(_3306) * (saturate(_120 * 0.03125f) + 1.0f));
  // [sem: _3__36__0__0__g_puddleMask_sampleLod]
            _3589 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_108, _109), 0.0f);
            bool __branch_chain_3573;
            if ((_1599 == 15) || ((_1706 == 12) || ((_1599 & -4) == 16))) {
              _3608 = false;
              _3609 = true;
              __branch_chain_3573 = true;
            } else {
              if (!((uint)_1599 > (uint)10)) {
                _3608 = true;
                _3609 = false;
                __branch_chain_3573 = true;
              } else {
                if ((uint)_1599 < (uint)20) {
                  _3608 = false;
                  _3609 = false;
                  __branch_chain_3573 = true;
                } else {
                  if (!(_1599 == 97)) {
                    _3608 = (_1599 != 107);
                    _3609 = false;
                    __branch_chain_3573 = true;
                  } else {
                    _3801 = _2520;
                    _3802 = _2606;
                    _3803 = _2510;
                    _3804 = _2511;
                    _3805 = _2512;
                    __branch_chain_3573 = false;
                  }
                }
              }
            }
            if (__branch_chain_3573) {
              if (_3589.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  _3619 = (_1599 == 36);
                  if (!_3619) {
  // [sem: _3__36__0__0__g_climateSandTex_sampleLod]
                    _3639 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _1008) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x) >> 1))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _1010) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y) >> 1))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _3645 = _3639.x;
                    _3646 = _3639.y;
                    _3647 = _3639.z;
                    _3648 = _3639.w;
                  } else {
                    _3645 = 0.11999999731779099f;
                    _3646 = 0.11999999731779099f;
                    _3647 = 0.10000000149011612f;
                    _3648 = 0.5f;
                  }
                  _3655 = 1.0f - saturate(((_viewPos.y + _1009) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (!(_3655 <= 0.0f)) {
                    _3658 = saturate(_3579);  // [sem: _3579_sat]
                    _3671 = ((_3646 * 0.3395099937915802f) + (_3645 * 0.6131200194358826f)) + (_3647 * 0.047370001673698425f);
                    _3672 = ((_3646 * 0.9163600206375122f) + (_3645 * 0.07020000368356705f)) + (_3647 * 0.013450000435113907f);
                    _3673 = ((_3646 * 0.10958000272512436f) + (_3645 * 0.02061999961733818f)) + (_3647 * 0.8697999715805054f);
                    _3678 = select(_3609, 1.0f, ((float)((bool)(uint)(saturate(dot(float3(_673, _674, _675), float3(0.0f, 1.0f, 0.0f))) > 0.5f))));
                    if (_enableSandAO == 1) {
                      _3683 = 1.0f - _3589.x;
                      if (_3619) {
                        _3714 = ((((_3683 * 10.0f) * _3648) * _3655) * _3658);
                        _3717 = _3671;
                        _3718 = _3672;
                        _3719 = _3673;
                        _3720 = saturate(_3714);  // [sem: _3714_sat]
                      } else {
                        _3694 = saturate(_3648 + -0.5f);  // [sem: expr_sat]
                        _3717 = _3671;
                        _3718 = _3672;
                        _3719 = _3673;
  // [sem: _3714_sat]
                        _3720 = ((((_3694 * 2.0f) * max((_3678 * _3589.x), min((_3658 * ((_3589.x * 7.0f) + 3.0f)), (_3694 * 40.0f)))) + (((_3683 * 10.0f) * _3658) * saturate((0.5f - _3648) * 2.0f))) * _3655);
                      }
                    } else {
                      _3712 = ((_3655 * _3648) * _3589.x) * _3678;
                      if (_3619) {
                        _3714 = _3712;
                        _3717 = _3671;
                        _3718 = _3672;
                        _3719 = _3673;
                        _3720 = saturate(_3714);  // [sem: _3714_sat]
                      } else {
                        _3717 = _3671;
                        _3718 = _3672;
                        _3719 = _3673;
                        _3720 = _3712;  // [sem: _3714_sat]
                      }
                    }
                  } else {
                    _3717 = 0.0f;
                    _3718 = 0.0f;
                    _3719 = 0.0f;
                    _3720 = 0.0f;  // [sem: _3714_sat]
                  }
                  _3724 = ((1.0f - _3589.w) * (1.0f - _3589.y)) * _3720;
                  _3725 = (_3724 > 9.999999747378752e-05f);
                  if (_3725) {
                    if (_3609) {
                      _3728 = saturate(_3724);  // [sem: _3724_sat]
                      _3755 = (((sqrt(_3717 * _2510) - _2510) * _3728) + _2510);
                      _3756 = (((sqrt(_3718 * _2511) - _2511) * _3728) + _2511);
                      _3757 = (((sqrt(_3719 * _2512) - _2512) * _3728) + _2512);
                    } else {
                      _3755 = ((_3724 * (_3717 - _2510)) + _2510);
                      _3756 = ((_3724 * (_3718 - _2511)) + _2511);
                      _3757 = ((_3724 * (_3719 - _2512)) + _2512);
                    }
                  } else {
                    _3755 = _2510;
                    _3756 = _2511;
                    _3757 = _2512;
                  }
                  if (_3619 && _3725) {
                    if (_3609) {
                      _3772 = (((sqrt(_2606 * 0.25f) - _2606) * saturate(_3724)) + _2606);
                    } else {
                      _3772 = ((_3724 * (0.25f - _2606)) + _2606);
                    }
                  } else {
                    _3772 = _2606;
                  }
                  _3773 = saturate(_3755);  // [sem: _3755_sat]
                  _3774 = saturate(_3756);  // [sem: _3756_sat]
                  _3775 = saturate(_3757);  // [sem: _3757_sat]
                  _3780 = (_3772 * (1.0f - _3579)) + _3579;
                  _3783 = ((_3772 - _3780) * _3589.y) + _3780;
                  _3790 = (((_3579 * _3579) * _3589.z) * ((float)((bool)_3608))) * saturate(dot(float3(_673, _674, _675), float3(0.0f, 1.0f, 0.0f)));
                  _3791 = _3790 * -0.5f;
                  _3801 = (_2520 - (_3579 * _2520));
                  _3802 = (_3783 - (_3790 * _3783));
                  _3803 = ((_3791 * _3773) + _3773);
                  _3804 = ((_3791 * _3774) + _3774);
                  _3805 = ((_3791 * _3775) + _3775);
                } else {
                  _3801 = _2520;
                  _3802 = _2606;
                  _3803 = _2510;
                  _3804 = _2511;
                  _3805 = _2512;
                }
              } else {
                _3801 = _2520;
                _3802 = _2606;
                _3803 = _2510;
                _3804 = _2511;
                _3805 = _2512;
              }
            }
            _3812 = (half)(half(_3801));
            _3813 = (half)(half(_3802));
            _3814 = (half)(half(_3803));
            _3815 = (half)(half(_3804));
            _3816 = (half)(half(_3805));
            _3817 = _3579;
          } else {
            _3812 = _1701;
            _3813 = _1702;
            _3814 = _1703;
            _3815 = _1704;
            _3816 = _1705;
            _3817 = _3306;
          }
          if (_1709) {
            _3823 = _3817;
            _3824 = _3814;
            _3825 = _3815;
            _3826 = _3816;
            _3827 = _3813;
            _3828 = _3812;
            _3829 = 0.0f;
            _3830 = 0.0f;
            _3831 = 0.0f;
            _3832 = (_3552 * _1600);
            _3833 = (_3553 * _1601);
            _3834 = (_3554 * _1602);
          } else {
            _3823 = _3817;
            _3824 = _3814;
            _3825 = _3815;
            _3826 = _3816;
            _3827 = _3813;
            _3828 = _3812;
            _3829 = _3552;
            _3830 = _3553;
            _3831 = _3554;
            _3832 = 0.0f;
            _3833 = 0.0f;
            _3834 = 0.0f;
          }
        } else {
          _3823 = _3306;
          _3824 = _1703;
          _3825 = _1704;
          _3826 = _1705;
          _3827 = _1702;
          _3828 = _1701;
          _3829 = _3552;
          _3830 = _3553;
          _3831 = _3554;
          _3832 = 0.0f;
          _3833 = 0.0f;
          _3834 = 0.0f;
        }
      }
    } else {
      if (_1670) {
        _3812 = _1701;
        _3813 = _1702;
        _3814 = _1703;
        _3815 = _1704;
        _3816 = _1705;
        _3817 = _3306;
        if (_1709) {
          _3823 = _3817;
          _3824 = _3814;
          _3825 = _3815;
          _3826 = _3816;
          _3827 = _3813;
          _3828 = _3812;
          _3829 = 0.0f;
          _3830 = 0.0f;
          _3831 = 0.0f;
          _3832 = (_3552 * _1600);
          _3833 = (_3553 * _1601);
          _3834 = (_3554 * _1602);
        } else {
          _3823 = _3817;
          _3824 = _3814;
          _3825 = _3815;
          _3826 = _3816;
          _3827 = _3813;
          _3828 = _3812;
          _3829 = _3552;
          _3830 = _3553;
          _3831 = _3554;
          _3832 = 0.0f;
          _3833 = 0.0f;
          _3834 = 0.0f;
        }
      } else {
        if (!((_1599 == 6) || ((_1706 == 106) || (((uint)(_1599 + -27) < (uint)2) || ((_1599 == 105) || (_1599 == 26)))))) {
          if (!(_1599 == 7)) {
            _3579 = exp2(log2(_3306) * (saturate(_120 * 0.03125f) + 1.0f));
  // [sem: _3__36__0__0__g_puddleMask_sampleLod]
            _3589 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_108, _109), 0.0f);
            bool __branch_chain_3573;
            if ((_1599 == 15) || ((_1706 == 12) || ((_1599 & -4) == 16))) {
              _3608 = false;
              _3609 = true;
              __branch_chain_3573 = true;
            } else {
              if (!((uint)_1599 > (uint)10)) {
                _3608 = true;
                _3609 = false;
                __branch_chain_3573 = true;
              } else {
                if ((uint)_1599 < (uint)20) {
                  _3608 = false;
                  _3609 = false;
                  __branch_chain_3573 = true;
                } else {
                  if (!(_1599 == 97)) {
                    _3608 = (_1599 != 107);
                    _3609 = false;
                    __branch_chain_3573 = true;
                  } else {
                    _3801 = _2520;
                    _3802 = _2606;
                    _3803 = _2510;
                    _3804 = _2511;
                    _3805 = _2512;
                    __branch_chain_3573 = false;
                  }
                }
              }
            }
            if (__branch_chain_3573) {
              if (_3589.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  _3619 = (_1599 == 36);
                  if (!_3619) {
  // [sem: _3__36__0__0__g_climateSandTex_sampleLod]
                    _3639 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _1008) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x) >> 1))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _1010) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y) >> 1))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _3645 = _3639.x;
                    _3646 = _3639.y;
                    _3647 = _3639.z;
                    _3648 = _3639.w;
                  } else {
                    _3645 = 0.11999999731779099f;
                    _3646 = 0.11999999731779099f;
                    _3647 = 0.10000000149011612f;
                    _3648 = 0.5f;
                  }
                  _3655 = 1.0f - saturate(((_viewPos.y + _1009) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (!(_3655 <= 0.0f)) {
                    _3658 = saturate(_3579);  // [sem: _3579_sat]
                    _3671 = ((_3646 * 0.3395099937915802f) + (_3645 * 0.6131200194358826f)) + (_3647 * 0.047370001673698425f);
                    _3672 = ((_3646 * 0.9163600206375122f) + (_3645 * 0.07020000368356705f)) + (_3647 * 0.013450000435113907f);
                    _3673 = ((_3646 * 0.10958000272512436f) + (_3645 * 0.02061999961733818f)) + (_3647 * 0.8697999715805054f);
                    _3678 = select(_3609, 1.0f, ((float)((bool)(uint)(saturate(dot(float3(_673, _674, _675), float3(0.0f, 1.0f, 0.0f))) > 0.5f))));
                    if (_enableSandAO == 1) {
                      _3683 = 1.0f - _3589.x;
                      if (_3619) {
                        _3714 = ((((_3683 * 10.0f) * _3648) * _3655) * _3658);
                        _3717 = _3671;
                        _3718 = _3672;
                        _3719 = _3673;
                        _3720 = saturate(_3714);  // [sem: _3714_sat]
                      } else {
                        _3694 = saturate(_3648 + -0.5f);  // [sem: expr_sat]
                        _3717 = _3671;
                        _3718 = _3672;
                        _3719 = _3673;
  // [sem: _3714_sat]
                        _3720 = ((((_3694 * 2.0f) * max((_3678 * _3589.x), min((_3658 * ((_3589.x * 7.0f) + 3.0f)), (_3694 * 40.0f)))) + (((_3683 * 10.0f) * _3658) * saturate((0.5f - _3648) * 2.0f))) * _3655);
                      }
                    } else {
                      _3712 = ((_3655 * _3648) * _3589.x) * _3678;
                      if (_3619) {
                        _3714 = _3712;
                        _3717 = _3671;
                        _3718 = _3672;
                        _3719 = _3673;
                        _3720 = saturate(_3714);  // [sem: _3714_sat]
                      } else {
                        _3717 = _3671;
                        _3718 = _3672;
                        _3719 = _3673;
                        _3720 = _3712;  // [sem: _3714_sat]
                      }
                    }
                  } else {
                    _3717 = 0.0f;
                    _3718 = 0.0f;
                    _3719 = 0.0f;
                    _3720 = 0.0f;  // [sem: _3714_sat]
                  }
                  _3724 = ((1.0f - _3589.w) * (1.0f - _3589.y)) * _3720;
                  _3725 = (_3724 > 9.999999747378752e-05f);
                  if (_3725) {
                    if (_3609) {
                      _3728 = saturate(_3724);  // [sem: _3724_sat]
                      _3755 = (((sqrt(_3717 * _2510) - _2510) * _3728) + _2510);
                      _3756 = (((sqrt(_3718 * _2511) - _2511) * _3728) + _2511);
                      _3757 = (((sqrt(_3719 * _2512) - _2512) * _3728) + _2512);
                    } else {
                      _3755 = ((_3724 * (_3717 - _2510)) + _2510);
                      _3756 = ((_3724 * (_3718 - _2511)) + _2511);
                      _3757 = ((_3724 * (_3719 - _2512)) + _2512);
                    }
                  } else {
                    _3755 = _2510;
                    _3756 = _2511;
                    _3757 = _2512;
                  }
                  if (_3619 && _3725) {
                    if (_3609) {
                      _3772 = (((sqrt(_2606 * 0.25f) - _2606) * saturate(_3724)) + _2606);
                    } else {
                      _3772 = ((_3724 * (0.25f - _2606)) + _2606);
                    }
                  } else {
                    _3772 = _2606;
                  }
                  _3773 = saturate(_3755);  // [sem: _3755_sat]
                  _3774 = saturate(_3756);  // [sem: _3756_sat]
                  _3775 = saturate(_3757);  // [sem: _3757_sat]
                  _3780 = (_3772 * (1.0f - _3579)) + _3579;
                  _3783 = ((_3772 - _3780) * _3589.y) + _3780;
                  _3790 = (((_3579 * _3579) * _3589.z) * ((float)((bool)_3608))) * saturate(dot(float3(_673, _674, _675), float3(0.0f, 1.0f, 0.0f)));
                  _3791 = _3790 * -0.5f;
                  _3801 = (_2520 - (_3579 * _2520));
                  _3802 = (_3783 - (_3790 * _3783));
                  _3803 = ((_3791 * _3773) + _3773);
                  _3804 = ((_3791 * _3774) + _3774);
                  _3805 = ((_3791 * _3775) + _3775);
                } else {
                  _3801 = _2520;
                  _3802 = _2606;
                  _3803 = _2510;
                  _3804 = _2511;
                  _3805 = _2512;
                }
              } else {
                _3801 = _2520;
                _3802 = _2606;
                _3803 = _2510;
                _3804 = _2511;
                _3805 = _2512;
              }
            }
            _3812 = (half)(half(_3801));
            _3813 = (half)(half(_3802));
            _3814 = (half)(half(_3803));
            _3815 = (half)(half(_3804));
            _3816 = (half)(half(_3805));
            _3817 = _3579;
          } else {
            _3812 = _1701;
            _3813 = _1702;
            _3814 = _1703;
            _3815 = _1704;
            _3816 = _1705;
            _3817 = _3306;
          }
          if (_1709) {
            _3823 = _3817;
            _3824 = _3814;
            _3825 = _3815;
            _3826 = _3816;
            _3827 = _3813;
            _3828 = _3812;
            _3829 = 0.0f;
            _3830 = 0.0f;
            _3831 = 0.0f;
            _3832 = (_3552 * _1600);
            _3833 = (_3553 * _1601);
            _3834 = (_3554 * _1602);
          } else {
            _3823 = _3817;
            _3824 = _3814;
            _3825 = _3815;
            _3826 = _3816;
            _3827 = _3813;
            _3828 = _3812;
            _3829 = _3552;
            _3830 = _3553;
            _3831 = _3554;
            _3832 = 0.0f;
            _3833 = 0.0f;
            _3834 = 0.0f;
          }
        } else {
          _3823 = _3306;
          _3824 = _1703;
          _3825 = _1704;
          _3826 = _1705;
          _3827 = _1702;
          _3828 = _1701;
          _3829 = _3552;
          _3830 = _3553;
          _3831 = _3554;
          _3832 = 0.0f;
          _3833 = 0.0f;
          _3834 = 0.0f;
        }
      }
    }
    half4 _3836 = __3__36__0__0__g_sceneShadowColor.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_sceneShadowColor_load]
    _3841 = float(_3836.x);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    _3842 = float(_3836.y);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    _3843 = float(_3836.z);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    [branch]
    if (_1670) {
      _3847 = __3__36__0__0__g_sceneNormal.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_sceneNormal_load]
      _3863 = min(1.0f, ((((float)((uint)((uint)(_3847.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
      _3864 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_3847.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
      _3865 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_3847.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
      _3867 = rsqrt(dot(float3(_3863, _3864, _3865), float3(_3863, _3864, _3865)));  // [sem: invLength]
      _3875 = (half)(half(_3867 * _3863));
      _3876 = (half)(half(_3867 * _3864));
      _3877 = (half)(half(_3867 * _3865));
    } else {
      _3875 = _493;
      _3876 = _494;
      _3877 = _495;
    }
    _3880 = (_sunDirection.y > 0.0f);
    if ((_3880) || ((!(_3880)) && (_sunDirection.y > _moonDirection.y))) {
      _3892 = _sunDirection.x;
      _3893 = _sunDirection.y;
      _3894 = _sunDirection.z;
    } else {
      _3892 = _moonDirection.x;
      _3893 = _moonDirection.y;
      _3894 = _moonDirection.z;
    }
    if ((_3880) || ((!(_3880)) && (_sunDirection.y > _moonDirection.y))) {
      _3914 = _precomputedAmbient7.y;
    } else {
      _3914 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    _3919 = _viewPos.y + _1009;
    _3920 = _3919 + _earthRadius;
    _3924 = (_1010 * _1010) + (_1008 * _1008);
    _3926 = sqrt((_3920 * _3920) + _3924);
    _3931 = dot(float3((_1008 / _3926), (_3920 / _3926), (_1010 / _3926)), float3(_3892, _3893, _3894));
    _3936 = min(max(((_3926 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    _3944 = max(_3936, 0.0f);
    _3951 = (-0.0f - sqrt((_3944 + (_earthRadius * 2.0f)) * _3944)) / (_3944 + _earthRadius);
    if (_3931 > _3951) {
      _3974 = ((exp2(log2(saturate((_3931 - _3951) / (1.0f - _3951))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _3974 = ((exp2(log2(saturate((_3951 - _3931) / (_3951 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
  // [sem: _3__36__0__0__g_texNetDensity_sampleLod]
    _3979 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_3936 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _3974), 0.0f);
    _4001 = ((_3979.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);  // [sem: _3__36__0__0__g_texNetDensity_sampleLod_derived]
    _4019 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _3979.x) + _4001) * -1.4426950216293335f);
    _4020 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _3979.x) + _4001) * -1.4426950216293335f);
    _4021 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (((float)((uint)((uint)(_rayleighScatteringColor & 255)))) * 1.960784317134312e-07f)) * _3979.x) + _4001) * -1.4426950216293335f);
    _4037 = sqrt(_3924);
    _4045 = (_cloudAltitude - (max(((_4037 * _4037) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    _4057 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_3893 > 0.0f))) - ((int)(uint)((int)(_3893 < 0.0f))))) * 0.5f))) + _4045;
    if (_1009 < _4045) {
      _4060 = dot(float3(0.0f, 1.0f, 0.0f), float3(_3892, _3893, _3894));
      _4066 = select((abs(_4060) < 9.99999993922529e-09f), 1e+08f, ((_4057 - dot(float3(0.0f, 1.0f, 0.0f), float3(_1008, _1009, _1010))) / _4060));
      _4072 = ((_4066 * _3892) + _1008);
      _4073 = _4057;
      _4074 = ((_4066 * _3894) + _1010);
    } else {
      _4072 = _1008;
      _4073 = _1009;
      _4074 = _1010;
    }
    _4094 = saturate(abs(_3893) * 4.0f);  // [sem: expr_sat]
    _4096 = (_4094 * _4094) * exp2(((_distanceScale * -1.4426950216293335f) * ((__3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_4072 * 4.999999873689376e-05f) + 0.5f), ((_4073 - _4045) / _cloudThickness), ((_4074 * 4.999999873689376e-05f) + 0.5f)), 0.0f)).x)) * (_cloudScatteringCoefficient / _distanceScale));
    _4103 = ((1.0f - _4096) * saturate(((_1009 - _cloudThickness) - _4045) * 0.10000000149011612f)) + _4096;
    _4104 = _4103 * (((_4020 * 0.3395099937915802f) + (_4019 * 0.6131200194358826f)) + (_4021 * 0.047370001673698425f));
    _4105 = _4103 * (((_4020 * 0.9163600206375122f) + (_4019 * 0.07020000368356705f)) + (_4021 * 0.013450000435113907f));
    _4106 = _4103 * (((_4020 * 0.10958000272512436f) + (_4019 * 0.02061999961733818f)) + (_4021 * 0.8697999715805054f));
    _4126 = float(_3824);
    _4127 = float(_3825);
    _4128 = float(_3826);
    if (!_2546) {
      _4134 = (_178 && ((uint)(_1599 + -105) < (uint)2));
    } else {
      _4134 = true;
    }
    _4136 = float(max(0.010002136h, _3827));
    _4137 = float(_3828);
    _4140 = (_1599 == 107);
    _4143 = _1664 || (((uint)(_1599 + -11) < (uint)9) || (_4140 || _4134));
    _4144 = select(_4143, 0.0f, _4137);
    if ((_1706 == 26) || ((_1599 == 105) || (_1599 == 28))) {
      _4155 = true;
      _4157 = _4155;
      _4158 = _4140;
    } else {
      _4152 = (_1599 == 106);
      if (!(_1599 == 19)) {
        _4155 = _4152;
        _4157 = _4155;
        _4158 = _4140;
      } else {
        _4157 = _4152;
        _4158 = true;
      }
    }
    _4159 = float(_3875);
    _4160 = float(_3876);
    _4161 = float(_3877);
    _4163 = __3__36__0__0__g_sceneDecalMask.Load(int3(_98, _100, 0));  // [sem: _3__36__0__0__g_sceneDecalMask_load]
    if (_1599 == 97) {
      _4175 = (((float)((uint16_t)((uint)((uint16_t)((uint)(_4163.x)) >> 2)))) * 0.01587301678955555f);
      _4176 = (((uint)((uint)((int)(min16uint)((int)((int)(_4163.x) & 2)))) >> 1) + 97);
      _4177 = 0.0f;
      _4178 = 0.0f;
      _4179 = 0.0f;
      _4180 = 0.0f;
      _4181 = 0.0f;
    } else {
      _4175 = select(_4143, _4137, 0.0f);
      _4176 = _1599;
      _4177 = _1068;
      _4178 = _1069;
      _4179 = _1070;
      _4180 = _1071;
      _4181 = _1072;
    }
    _4186 = float(saturate(_198));
    _4187 = _4186 * _4186;
    _4188 = _4187 * _4187;
    _4189 = _4188 * _4188;
    _4200 = ((_4189 * _4189) * select((_2361 || (_4157 || _4158)), 0.0f, 1.0f)) * (((float4)(__3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _103), (_bufferSizeAndInvSize.w * _104)), 0.0f))).y);
    _4205 = _4159 - (_4200 * _4159);
    _4206 = (_4200 * (1.0f - _4160)) + _4160;
    _4207 = _4161 - (_4200 * _4161);
    _4209 = rsqrt(dot(float3(_4205, _4206, _4207), float3(_4205, _4206, _4207)));  // [sem: invLength]
    _4210 = _4205 * _4209;
    _4211 = _4206 * _4209;
    _4212 = _4207 * _4209;
    _4213 = (_4176 == 53);
    if (_4213) {
      _4220 = saturate(((_4127 + _4126) + _4128) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _4220 = 1.0f;  // [sem: expr_sat]
    }
    _4226 = (0.699999988079071f / min(max(max(max(_4126, _4127), _4128), 0.009999999776482582f), 0.699999988079071f)) * _4220;
    _4236 = (((_4226 * _4126) + -0.03999999910593033f) * _4144) + 0.03999999910593033f;
    _4237 = (((_4226 * _4127) + -0.03999999910593033f) * _4144) + 0.03999999910593033f;
    _4238 = (((_4226 * _4128) + -0.03999999910593033f) * _4144) + 0.03999999910593033f;
    _4239 = float(_3827);
    _4240 = _4176 & -2;
    _4241 = (_4240 == 64);
    _4244 = ((((int)(uint)(_4241)) & _3314) == 0);
    if (_4244) {
      _4257 = saturate(exp2((_4239 * _4239) * (_120 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _4257 = select((_cavityParams.z > 0.0f), select(_179, 0.0f, _1032), 1.0f);  // [sem: expr_sat]
    }
    _4258 = select(_3334, 1.0f, _4257);
    if (_4241) {
      _4264 = (_4258 * _4236);
      _4265 = (_4258 * _4237);
      _4266 = (_4258 * _4238);
    } else {
      _4264 = _4236;
      _4265 = _4237;
      _4266 = _4238;
    }
    _4267 = _4136 * _4136;
    _4268 = _4267 * _4267;
    _4270 = ((uint)(_4176 + -97) < (uint)2);
    _4272 = select(_4270, 0.5f, (_4136 * 0.60009765625f));
    _4273 = _4272 * _4272;
    _4274 = _4273 * _4273;
    _4275 = (_4176 == 33);
    if (!_4275) {
      _4277 = (_4176 == 55);
      _4278 = (int)(uint)(_4277);
      if ((_4176 == 98) || (_4240 == 96)) {
        _4287 = true;
        if (_4277) {
          _4289 = _4287;
          _4293 = _4289;
          _4294 = ((int)(uint)((int)(_4177 > 0.0f)));
          _4295 = _4177;
        } else {
          _4293 = _4287;
          _4294 = _4278;
          _4295 = 0.0f;
        }
        if ((uint)_4176 > (uint)11) {
          if (!(((uint)_4176 < (uint)21) || (_4176 == 107))) {
            _4304 = _4293;
            _4305 = _4294;
            _4306 = _4295;
            _4309 = _4306;
            _4310 = _4305;
            _4311 = _4304;
            _4312 = (_4176 == 7);
          } else {
            _4309 = _4295;
            _4310 = _4294;
            _4311 = _4293;
            _4312 = true;
          }
        } else {
          if (!(_4176 == 6)) {
            _4304 = _4293;
            _4305 = _4294;
            _4306 = _4295;
            _4309 = _4306;
            _4310 = _4305;
            _4311 = _4304;
            _4312 = (_4176 == 7);
          } else {
            _4309 = _4295;
            _4310 = _4294;
            _4311 = _4293;
            _4312 = true;
          }
        }
      } else {
        if ((uint)(_4176 + -105) < (uint)2) {
          if (_4277) {
            _4289 = _178;
            _4293 = _4289;
            _4294 = ((int)(uint)((int)(_4177 > 0.0f)));
            _4295 = _4177;
            if ((uint)_4176 > (uint)11) {
              if (!(((uint)_4176 < (uint)21) || (_4176 == 107))) {
                _4304 = _4293;
                _4305 = _4294;
                _4306 = _4295;
                _4309 = _4306;
                _4310 = _4305;
                _4311 = _4304;
                _4312 = (_4176 == 7);
              } else {
                _4309 = _4295;
                _4310 = _4294;
                _4311 = _4293;
                _4312 = true;
              }
            } else {
              if (!(_4176 == 6)) {
                _4304 = _4293;
                _4305 = _4294;
                _4306 = _4295;
                _4309 = _4306;
                _4310 = _4305;
                _4311 = _4304;
                _4312 = (_4176 == 7);
              } else {
                _4309 = _4295;
                _4310 = _4294;
                _4311 = _4293;
                _4312 = true;
              }
            }
          } else {
            _4304 = _178;
            _4305 = _4278;
            _4306 = 0.0f;
            _4309 = _4306;
            _4310 = _4305;
            _4311 = _4304;
            _4312 = (_4176 == 7);
          }
        } else {
          _4287 = false;
          if (_4277) {
            _4289 = _4287;
            _4293 = _4289;
            _4294 = ((int)(uint)((int)(_4177 > 0.0f)));
            _4295 = _4177;
          } else {
            _4293 = _4287;
            _4294 = _4278;
            _4295 = 0.0f;
          }
          if ((uint)_4176 > (uint)11) {
            if (!(((uint)_4176 < (uint)21) || (_4176 == 107))) {
              _4304 = _4293;
              _4305 = _4294;
              _4306 = _4295;
              _4309 = _4306;
              _4310 = _4305;
              _4311 = _4304;
              _4312 = (_4176 == 7);
            } else {
              _4309 = _4295;
              _4310 = _4294;
              _4311 = _4293;
              _4312 = true;
            }
          } else {
            if (!(_4176 == 6)) {
              _4304 = _4293;
              _4305 = _4294;
              _4306 = _4295;
              _4309 = _4306;
              _4310 = _4305;
              _4311 = _4304;
              _4312 = (_4176 == 7);
            } else {
              _4309 = _4295;
              _4310 = _4294;
              _4311 = _4293;
              _4312 = true;
            }
          }
        }
      }
    } else {
      _4289 = false;
      _4293 = _4289;
      _4294 = ((int)(uint)((int)(_4177 > 0.0f)));
      _4295 = _4177;
      if ((uint)_4176 > (uint)11) {
        if (!(((uint)_4176 < (uint)21) || (_4176 == 107))) {
          _4304 = _4293;
          _4305 = _4294;
          _4306 = _4295;
          _4309 = _4306;
          _4310 = _4305;
          _4311 = _4304;
          _4312 = (_4176 == 7);
        } else {
          _4309 = _4295;
          _4310 = _4294;
          _4311 = _4293;
          _4312 = true;
        }
      } else {
        if (!(_4176 == 6)) {
          _4304 = _4293;
          _4305 = _4294;
          _4306 = _4295;
          _4309 = _4306;
          _4310 = _4305;
          _4311 = _4304;
          _4312 = (_4176 == 7);
        } else {
          _4309 = _4295;
          _4310 = _4294;
          _4311 = _4293;
          _4312 = true;
        }
      }
    }
    _4317 = exp2(log2(float(_3836.w)) * 2.200000047683716f) * 1000.0f;  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    if ((_3880) || ((!(_3880)) && (_sunDirection.y > _moonDirection.y))) {
      _4329 = _sunDirection.x;
      _4330 = _sunDirection.y;
      _4331 = _sunDirection.z;
    } else {
      _4329 = _moonDirection.x;
      _4330 = _moonDirection.y;
      _4331 = _moonDirection.z;
    }
    _4332 = _lightingParams.x * _3914;
    _4333 = (((_4104 * 0.6131200194358826f) + (_4105 * 0.3395099937915802f)) + (_4106 * 0.047370001673698425f)) * _4332;
    _4334 = (((_4104 * 0.07020000368356705f) + (_4105 * 0.9163600206375122f)) + (_4106 * 0.013450000435113907f)) * _4332;
    _4335 = (((_4104 * 0.02061999961733818f) + (_4105 * 0.10958000272512436f)) + (_4106 * 0.8697999715805054f)) * _4332;
    _4336 = _4329 - _1013;
    _4337 = _4330 - _1014;
    _4338 = _4331 - _1015;
    _4340 = rsqrt(dot(float3(_4336, _4337, _4338), float3(_4336, _4337, _4338)));  // [sem: invLength]
    _4341 = _4340 * _4336;
    _4342 = _4340 * _4337;
    _4343 = _4340 * _4338;
    _4344 = dot(float3(_4159, _4160, _4161), float3(_4329, _4330, _4331));
    _4345 = dot(float3(_4210, _4211, _4212), float3(_4329, _4330, _4331));
    _4347 = saturate(dot(float3(_4159, _4160, _4161), float3(_1710, _1711, _1712)));  // [sem: expr_sat]
    _4349 = saturate(dot(float3(_4210, _4211, _4212), float3(_4341, _4342, _4343)));  // [sem: expr_sat]
    _4350 = dot(float3(_1710, _1711, _1712), float3(_4341, _4342, _4343));
    _4352 = saturate(dot(float3(_4329, _4330, _4331), float3(_4341, _4342, _4343)));  // [sem: expr_sat]
    _4353 = (_4240 == 66);
    _4354 = (_4176 == 54);
    _4355 = _4354 || _4353;
    if (_4355) {
      if (_4354) {
        _4372 = (((asfloat(_globalLightParams.z) * _4136) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_165)));
      } else {
        _4372 = _bevelParams.y;
      }
      _4390 = (sqrt(_3924 + (_1009 * _1009)) * 2.0f) + 1.0f;
      _4394 = (_1594 * 7.0f) + 1.0f;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
      _4399 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2((((dot(float3(_1008, _1009, _1010), float3(((_1598 * _223) - (_1597 * _224)), ((_1596 * _224) - (_1598 * _222)), ((_1597 * _222) - (_1596 * _223)))) * 2.0f) / _4390) * _4394), (((dot(float3(_1008, _1009, _1010), float3(_1596, _1597, _1598)) * 0.5f) / _4390) * _4394)), 0.0f);
      _4403 = _1594 * 0.5f;
      _4404 = _4399.x * 2.0f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
      _4405 = _4399.y * 2.0f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
      _4406 = _4399.z * 2.0f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
      _4417 = dot(float3(_1596, _1597, _1598), float3(_4329, _4330, _4331));
      _4418 = dot(float3(_1596, _1597, _1598), float3(_1710, _1711, _1712));
      _4424 = cos(abs(asin(_4418) - asin(_4417)) * 0.5f);
      _4428 = _4329 - (_4417 * _1596);
      _4429 = _4330 - (_4417 * _1597);
      _4430 = _4331 - (_4417 * _1598);
      _4434 = _1710 - (_4418 * _1596);
      _4435 = _1711 - (_4418 * _1597);
      _4436 = _1712 - (_4418 * _1598);
  // [sem: invLength]
      _4443 = rsqrt((dot(float3(_4434, _4435, _4436), float3(_4434, _4435, _4436)) * dot(float3(_4428, _4429, _4430), float3(_4428, _4429, _4430))) + 9.999999747378752e-05f) * dot(float3(_4428, _4429, _4430), float3(_4434, _4435, _4436));
      _4447 = sqrt(saturate((_4443 * 0.5f) + 0.5f));
      _4454 = min(max(max(0.05000000074505806f, _4136), 0.09803921729326248f), 1.0f);
      _4455 = _4454 * _4454;
      _4456 = _4455 * 0.5f;
      _4457 = _4455 * 2.0f;
      _4458 = _4418 + _4417;
      _4459 = _4458 + (_4372 * 2.0f);
      _4461 = (_4447 * 1.4142135381698608f) * _4455;
      _4475 = 1.0f - sqrt(saturate((dot(float3(_1710, _1711, _1712), float3(_4329, _4330, _4331)) * 0.5f) + 0.5f));
      _4476 = _4475 * _4475;
      _4483 = _4458 - _4372;
      _4492 = 1.0f / ((1.190000057220459f / _4424) + (_4424 * 0.36000001430511475f));
      _4497 = ((_4492 * (0.6000000238418579f - (_4443 * 0.800000011920929f))) + 1.0f) * _4447;
      _4503 = 1.0f - (sqrt(saturate(1.0f - (_4497 * _4497))) * _4424);
      _4504 = _4503 * _4503;
      _4508 = 0.9534794092178345f - ((_4504 * _4504) * (_4503 * 0.9534794092178345f));
      _4509 = _4492 * _4497;
      _4514 = (sqrt(1.0f - (_4509 * _4509)) * 0.5f) / _4424;
      _4515 = log2(_4126);
      _4516 = log2(_4127);
      _4517 = log2(_4128);
      _4529 = ((_4508 * _4508) * (exp2((((_4483 * _4483) * -0.5f) / (_4456 * _4456)) * 1.4426950216293335f) / (_4455 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_4443 * 5.2658371925354f));
      _4533 = _4458 - (_4372 * 4.0f);
      _4543 = 1.0f - (_4424 * 0.5f);
      _4544 = _4543 * _4543;
      _4548 = (_4544 * _4544) * (0.9534794092178345f - (_4424 * 0.47673970460891724f));
      _4550 = 0.9534794092178345f - _4548;
      _4551 = 0.800000011920929f / _4424;
      _4564 = (((_4550 * _4550) * (_4548 + 0.04652056470513344f)) * (exp2((((_4533 * _4533) * -0.5f) / (_4457 * _4457)) * 1.4426950216293335f) / (_4455 * 5.013256549835205f))) * exp2((_4443 * 24.525815963745117f) + -24.208423614501953f);
      _4571 = saturate(_4345);  // [sem: _4345_sat]
      _4572 = (((_4447 * 0.25f) * (exp2((((_4459 * _4459) * -0.5f) / (_4461 * _4461)) * 1.4426950216293335f) / (_4461 * 2.5066282749176025f))) * (((_4476 * _4476) * (_4475 * 0.9534794092178345f)) + 0.04652056470513344f)) * _4571;
      _4582 = -0.0f - _4571;
      _4593 = saturate((_4345 + 1.0f) * 0.25f);  // [sem: expr_sat]
      _4598 = max(0.0010000000474974513f, dot(float3(_4126, _4127, _4128), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f)));
      _4617 = ((((1.0f - abs(_4345)) - _4593) * 0.33000001311302185f) + _4593) * 0.07957746833562851f;
      _4619 = (exp2(log2(_4126 / _4598) * (1.0f - _3841)) * _4617) * sqrt(_4126);
      _4621 = (exp2(log2(_4127 / _4598) * (1.0f - _3842)) * _4617) * sqrt(_4127);
      _4623 = (exp2(log2(_4128 / _4598) * (1.0f - _3843)) * _4617) * sqrt(_4128);
      _4630 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_4564 * exp2(_4551 * _4515)) + (_4529 * exp2(_4515 * _4514))) * _4582)))));
      _4631 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_4564 * exp2(_4551 * _4516)) + (_4529 * exp2(_4516 * _4514))) * _4582)))));
      _4632 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_4564 * exp2(_4551 * _4517)) + (_4529 * exp2(_4517 * _4514))) * _4582)))));
      _4639 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_4404, 1.0f, _4403)) * _4572))) * _3841));
      _4640 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_4405, 1.0f, _4403)) * _4572))) * _3842));
      _4641 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_4406, 1.0f, _4403)) * _4572))) * _3843));
      if (!_4353) {
        _4643 = _4630;
        _4644 = _4631;
        _4645 = _4632;
        _4646 = _4639;
        _4647 = _4640;
        _4648 = _4641;
        _4649 = _4619;
        _4650 = _4621;
        _4651 = _4623;
        if (!_4354) {
          _4653 = (_4310 == 0);
          if (_4653) {
            if ((_4344 > 0.0f) || (_4345 > 0.0f)) {
              _4821 = 0.0f;
              _4822 = 0.0f;
              _4823 = 0.0f;
              _4824 = 0.0f;
              _4825 = 0.0f;
              _4826 = 0.0f;
              _4827 = 0.0f;
              _4828 = 0.0f;
              _4829 = 0.0f;
              if (!(_4177 > 0.9900000095367432f)) {
                _4832 = saturate(_4344);  // [sem: _4344_sat]
                _4833 = 1.0f - _4268;
                _4834 = 1.0f - _4352;
                _4835 = _4834 * _4834;
                _4838 = ((_4835 * _4835) * _4834) + _4352;
                _4839 = 1.0f - _4832;
                _4840 = _4839 * _4839;
                _4845 = 1.0f - _4347;
                _4846 = _4845 * _4845;
                _4873 = (_4832 * 0.31830987334251404f) * ((((_4352 * ((((_4833 * 34.5f) + -59.0f) * _4833) + 24.5f)) * exp2(-0.0f - (max(((_4833 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_4349)))) + _4838) + ((((1.0f - ((_4840 * _4840) * (_4839 * 0.75f))) * (1.0f - ((_4846 * _4846) * (_4845 * 0.75f)))) - _4838) * saturate((_4833 * 2.200000047683716f) + -0.5f)));
                _4876 = saturate(1.0f - saturate(_4350));  // [sem: expr_sat]
                _4877 = _4876 * _4876;
                _4879 = (_4877 * _4877) * _4876;
                _4882 = _4879 * saturate(_4265 * 50.0f);
                _4883 = 1.0f - _4879;
                _4887 = (_4883 * _4264) + _4882;
                _4888 = (_4883 * _4265) + _4882;
                _4889 = (_4883 * _4266) + _4882;
                if (!(_4176 == 29)) {
                  _4891 = saturate(_4345);  // [sem: _4345_sat]
                  _4892 = 1.0f - _4267;
                  _4904 = (((_4349 * _4268) - _4349) * _4349) + 1.0f;
                  _4908 = (_4268 / ((_4904 * _4904) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4892) + _4267) * _4345) + (_4347 * ((_4345 * _4892) + _4267))));
                  _4919 = (max((_4908 * _4887), 0.0f) * _4891);
                  _4920 = (max((_4908 * _4888), 0.0f) * _4891);
                  _4921 = (max((_4908 * _4889), 0.0f) * _4891);
                } else {
                  _4919 = 0.0f;
                  _4920 = 0.0f;
                  _4921 = 0.0f;
                }
                _4922 = (_4176 == 65);
                if (_4241) {
                  if (_4922) {
                    _4965 = max(9.999999974752427e-07f, _exposure2.x);
                    _4974 = ((_4832 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4210, _4211, _4212), float3(_1710, _1711, _1712)))) * 16.0f)) / (((_4965 * _4965) * 1e+06f) + 1.0f);
                    _4988 = _4919;
                    _4989 = _4920;
                    _4990 = _4921;
                    _4991 = ((((_4974 * _4126) - _4873) * _4175) + _4873);
                    _4992 = ((((_4974 * _4127) - _4873) * _4175) + _4873);
                    _4993 = ((((_4974 * _4128) - _4873) * _4175) + _4873);
                  } else {
                    _4929 = 1.0f - _4273;
                    _4941 = (((_4349 * _4274) - _4349) * _4349) + 1.0f;
                    _4945 = (_4274 / ((_4941 * _4941) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4929) + _4273) * _4345) + (_4347 * ((_4345 * _4929) + _4273))));
                    _4952 = saturate(_4345) * 0.39990234375f;
                    _4988 = ((max((_4945 * _4887), 0.0f) * _4952) + (_4919 * 0.60009765625f));
                    _4989 = ((max((_4945 * _4888), 0.0f) * _4952) + (_4920 * 0.60009765625f));
                    _4990 = ((max((_4945 * _4889), 0.0f) * _4952) + (_4921 * 0.60009765625f));
                    _4991 = _4873;
                    _4992 = _4873;
                    _4993 = _4873;
                  }
                } else {
                  if (_4922) {
                    _4965 = max(9.999999974752427e-07f, _exposure2.x);
                    _4974 = ((_4832 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4210, _4211, _4212), float3(_1710, _1711, _1712)))) * 16.0f)) / (((_4965 * _4965) * 1e+06f) + 1.0f);
                    _4988 = _4919;
                    _4989 = _4920;
                    _4990 = _4921;
                    _4991 = ((((_4974 * _4126) - _4873) * _4175) + _4873);
                    _4992 = ((((_4974 * _4127) - _4873) * _4175) + _4873);
                    _4993 = ((((_4974 * _4128) - _4873) * _4175) + _4873);
                  } else {
                    _4988 = _4919;
                    _4989 = _4920;
                    _4990 = _4921;
                    _4991 = _4873;
                    _4992 = _4873;
                    _4993 = _4873;
                  }
                }
              } else {
                _4988 = _4646;
                _4989 = _4647;
                _4990 = _4648;
                _4991 = _4649;
                _4992 = _4650;
                _4993 = _4651;
              }
              _4997 = min(-0.0f, (-0.0f - _4991));
              _4998 = min(-0.0f, (-0.0f - _4992));
              _4999 = min(-0.0f, (-0.0f - _4993));
              _5000 = -0.0f - _4997;
              _5001 = -0.0f - _4998;
              _5002 = -0.0f - _4999;
              _5061 = _4643;
              _5062 = _4644;
              _5063 = _4645;
              _5064 = (_4988 * _3841);
              _5065 = (_4989 * _3842);
              _5066 = (_4990 * _3843);
              _5067 = (_3841 * _5000);
              _5068 = (_3842 * _5001);
              _5069 = (_3843 * _5002);
            } else {
              _5061 = _4643;
              _5062 = _4644;
              _5063 = _4645;
              _5064 = _4646;
              _5065 = _4647;
              _5066 = _4648;
              _5067 = _4649;
              _5068 = _4650;
              _5069 = _4651;
            }
          } else {
            _4668 = (saturate(_4344) * 0.31830987334251404f) * (((saturate(1.0f - _effectiveMetallicForVelvet) + -1.0f) * _4181) + 1.0f);
            _4674 = max(dot(float3(_4126, _4127, _4128), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
            _4675 = sqrt(_4126);
            _4676 = sqrt(_4127);
            _4677 = sqrt(_4128);
            _4678 = _4675 - _4674;
            _4679 = _4676 - _4674;
            _4680 = _4677 - _4674;
            _4687 = saturate(1.0f - (pow(_4347, 4.0f)));  // [sem: expr_sat]
            _4700 = (((_4679 * _4178) + _4674) + ((_4679 * (_4181 - _4178)) * _4687)) * _4179;
            _4703 = saturate(1.0f - saturate(_4350));  // [sem: expr_sat]
            _4704 = _4703 * _4703;
            _4706 = (_4704 * _4704) * _4703;
            _4709 = _4706 * saturate(_4700 * 50.0f);
            _4710 = 1.0f - _4706;
            _4711 = _4710 * _4179;
            _4715 = (_4711 * (((_4678 * _4178) + _4674) + (_4687 * (_4678 * (_4181 - _4178))))) + _4709;
            _4716 = (_4710 * _4700) + _4709;
            _4717 = (_4711 * (((_4680 * _4178) + _4674) + ((_4680 * (_4181 - _4178)) * _4687))) + _4709;
            _4718 = min(_4349, 0.9998999834060669f);
            _4719 = _4718 * _4718;
            _4720 = 1.0f - _4719;
            _4732 = (((exp2(((-0.0f - _4719) / (_4720 * _4268)) * 1.4426950216293335f) * 4.0f) / (_4720 * _4720)) + 1.0f) / ((_4268 * 12.566370964050293f) + 3.1415927410125732f);
            _4736 = ((_4347 + _4345) - (_4347 * _4345)) * 4.0f;
            _4740 = (_4715 * _4732) / _4736;
            _4741 = (_4716 * _4732) / _4736;
            _4742 = (_4717 * _4732) / _4736;
            _4743 = 1.0f - _4267;
            _4755 = (((_4349 * _4268) - _4349) * _4349) + 1.0f;
            _4759 = (_4268 / ((_4755 * _4755) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4743) + _4267) * _4344) + (_4347 * ((_4344 * _4743) + _4267))));
            _4775 = saturate(_4345);  // [sem: _4345_sat]
            _4780 = (_4180 * 1.5f) + 2.5f;
            _4781 = _4780 * _4780;
            _4791 = (max(0.0f, (0.30000001192092896f - _4344)) * 0.25f) * ((exp2(_4781 * -0.48089835047721863f) * 3.0f) + exp2(_4781 * -1.4426950216293335f));
            _4816 = (((1.0f - _4181) * 0.47746479511260986f) * saturate(_4180)) * saturate((pow(_4349, 4.0f)) * exp2(log2(saturate(1.0f - abs(_4344))) * 3.0f));
            _4821 = (_4816 * _4675);
            _4822 = (_4816 * _4676);
            _4823 = (_4816 * _4677);
            _4824 = ((((max((_4759 * _4715), 0.0f) - _4740) * _4178) + _4740) * _4775);
            _4825 = ((((max((_4759 * _4716), 0.0f) - _4741) * _4178) + _4741) * _4775);
            _4826 = ((((max((_4759 * _4717), 0.0f) - _4742) * _4178) + _4742) * _4775);
            _4827 = (((_4675 * _3841) * _4791) + _4668);
            _4828 = (((_4676 * _3842) * _4791) + _4668);
            _4829 = (((_4677 * _3843) * _4791) + _4668);
            if (!(_4177 > 0.9900000095367432f)) {
              _4832 = saturate(_4344);  // [sem: _4344_sat]
              _4833 = 1.0f - _4268;
              _4834 = 1.0f - _4352;
              _4835 = _4834 * _4834;
              _4838 = ((_4835 * _4835) * _4834) + _4352;
              _4839 = 1.0f - _4832;
              _4840 = _4839 * _4839;
              _4845 = 1.0f - _4347;
              _4846 = _4845 * _4845;
              _4873 = (_4832 * 0.31830987334251404f) * ((((_4352 * ((((_4833 * 34.5f) + -59.0f) * _4833) + 24.5f)) * exp2(-0.0f - (max(((_4833 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_4349)))) + _4838) + ((((1.0f - ((_4840 * _4840) * (_4839 * 0.75f))) * (1.0f - ((_4846 * _4846) * (_4845 * 0.75f)))) - _4838) * saturate((_4833 * 2.200000047683716f) + -0.5f)));
              _4876 = saturate(1.0f - saturate(_4350));  // [sem: expr_sat]
              _4877 = _4876 * _4876;
              _4879 = (_4877 * _4877) * _4876;
              _4882 = _4879 * saturate(_4265 * 50.0f);
              _4883 = 1.0f - _4879;
              _4887 = (_4883 * _4264) + _4882;
              _4888 = (_4883 * _4265) + _4882;
              _4889 = (_4883 * _4266) + _4882;
              if (!(_4176 == 29)) {
                _4891 = saturate(_4345);  // [sem: _4345_sat]
                _4892 = 1.0f - _4267;
                _4904 = (((_4349 * _4268) - _4349) * _4349) + 1.0f;
                _4908 = (_4268 / ((_4904 * _4904) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4892) + _4267) * _4345) + (_4347 * ((_4345 * _4892) + _4267))));
                _4919 = (max((_4908 * _4887), 0.0f) * _4891);
                _4920 = (max((_4908 * _4888), 0.0f) * _4891);
                _4921 = (max((_4908 * _4889), 0.0f) * _4891);
              } else {
                _4919 = 0.0f;
                _4920 = 0.0f;
                _4921 = 0.0f;
              }
              _4922 = (_4176 == 65);
              if (_4241) {
                if (_4922) {
                  _4965 = max(9.999999974752427e-07f, _exposure2.x);
                  _4974 = ((_4832 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4210, _4211, _4212), float3(_1710, _1711, _1712)))) * 16.0f)) / (((_4965 * _4965) * 1e+06f) + 1.0f);
                  _4988 = _4919;
                  _4989 = _4920;
                  _4990 = _4921;
                  _4991 = ((((_4974 * _4126) - _4873) * _4175) + _4873);
                  _4992 = ((((_4974 * _4127) - _4873) * _4175) + _4873);
                  _4993 = ((((_4974 * _4128) - _4873) * _4175) + _4873);
                } else {
                  _4929 = 1.0f - _4273;
                  _4941 = (((_4349 * _4274) - _4349) * _4349) + 1.0f;
                  _4945 = (_4274 / ((_4941 * _4941) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4929) + _4273) * _4345) + (_4347 * ((_4345 * _4929) + _4273))));
                  _4952 = saturate(_4345) * 0.39990234375f;
                  _4988 = ((max((_4945 * _4887), 0.0f) * _4952) + (_4919 * 0.60009765625f));
                  _4989 = ((max((_4945 * _4888), 0.0f) * _4952) + (_4920 * 0.60009765625f));
                  _4990 = ((max((_4945 * _4889), 0.0f) * _4952) + (_4921 * 0.60009765625f));
                  _4991 = _4873;
                  _4992 = _4873;
                  _4993 = _4873;
                }
              } else {
                if (_4922) {
                  _4965 = max(9.999999974752427e-07f, _exposure2.x);
                  _4974 = ((_4832 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4210, _4211, _4212), float3(_1710, _1711, _1712)))) * 16.0f)) / (((_4965 * _4965) * 1e+06f) + 1.0f);
                  _4988 = _4919;
                  _4989 = _4920;
                  _4990 = _4921;
                  _4991 = ((((_4974 * _4126) - _4873) * _4175) + _4873);
                  _4992 = ((((_4974 * _4127) - _4873) * _4175) + _4873);
                  _4993 = ((((_4974 * _4128) - _4873) * _4175) + _4873);
                } else {
                  _4988 = _4919;
                  _4989 = _4920;
                  _4990 = _4921;
                  _4991 = _4873;
                  _4992 = _4873;
                  _4993 = _4873;
                }
              }
            } else {
              _4988 = _4646;
              _4989 = _4647;
              _4990 = _4648;
              _4991 = _4649;
              _4992 = _4650;
              _4993 = _4651;
            }
            _4997 = min(-0.0f, (-0.0f - _4991));
            _4998 = min(-0.0f, (-0.0f - _4992));
            _4999 = min(-0.0f, (-0.0f - _4993));
            _5000 = -0.0f - _4997;
            _5001 = -0.0f - _4998;
            _5002 = -0.0f - _4999;
            _5004 = (_4177 > 0.0f);
            if (_5004) {
              _5038 = (_4643 - (_4643 * _4309));
              _5039 = (_4644 - (_4644 * _4309));
              _5040 = (_4645 - (_4645 * _4309));
              _5041 = (lerp(_4988, _4824, _4309));  // [sem: blended]
              _5042 = (lerp(_4989, _4825, _4309));  // [sem: blended]
              _5043 = (lerp(_4990, _4826, _4309));  // [sem: blended]
              _5044 = (((_4997 + _4827) * _4309) - _4997);
              _5045 = (((_4998 + _4828) * _4309) - _4998);
              _5046 = (((_4999 + _4829) * _4309) - _4999);
            } else {
              _5038 = _4643;
              _5039 = _4644;
              _5040 = _4645;
              _5041 = _4988;  // [sem: blended]
              _5042 = _4989;  // [sem: blended]
              _5043 = _4990;  // [sem: blended]
              _5044 = _5000;
              _5045 = _5001;
              _5046 = _5002;
            }
            _5047 = _5044 * _3841;
            _5048 = _5045 * _3842;
            _5049 = _5046 * _3843;
            _5050 = _5041 * _3841;
            _5051 = _5042 * _3842;
            _5052 = _5043 * _3843;
            if (_5004) {
              _5061 = _5038;
              _5062 = _5039;
              _5063 = _5040;
              _5064 = (_5050 + (_4821 * _4309));
              _5065 = (_5051 + (_4822 * _4309));
              _5066 = (_5052 + (_4823 * _4309));
              _5067 = _5047;
              _5068 = _5048;
              _5069 = _5049;
            } else {
              _5061 = _5038;
              _5062 = _5039;
              _5063 = _5040;
              _5064 = _5050;
              _5065 = _5051;
              _5066 = _5052;
              _5067 = _5047;
              _5068 = _5048;
              _5069 = _5049;
            }
          }
        } else {
          _5061 = _4643;
          _5062 = _4644;
          _5063 = _4645;
          _5064 = _4646;
          _5065 = _4647;
          _5066 = _4648;
          _5067 = _4649;
          _5068 = _4650;
          _5069 = _4651;
        }
      } else {
        _5061 = _4630;
        _5062 = _4631;
        _5063 = _4632;
        _5064 = _4639;
        _5065 = _4640;
        _5066 = _4641;
        _5067 = _4619;
        _5068 = _4621;
        _5069 = _4623;
      }
    } else {
      _4643 = 0.0f;
      _4644 = 0.0f;
      _4645 = 0.0f;
      _4646 = 0.0f;
      _4647 = 0.0f;
      _4648 = 0.0f;
      _4649 = 0.0f;
      _4650 = 0.0f;
      _4651 = 0.0f;
      if (!_4354) {
        _4653 = (_4310 == 0);
        if (_4653) {
          if ((_4344 > 0.0f) || (_4345 > 0.0f)) {
            _4821 = 0.0f;
            _4822 = 0.0f;
            _4823 = 0.0f;
            _4824 = 0.0f;
            _4825 = 0.0f;
            _4826 = 0.0f;
            _4827 = 0.0f;
            _4828 = 0.0f;
            _4829 = 0.0f;
            if (!(_4177 > 0.9900000095367432f)) {
              _4832 = saturate(_4344);  // [sem: _4344_sat]
              _4833 = 1.0f - _4268;
              _4834 = 1.0f - _4352;
              _4835 = _4834 * _4834;
              _4838 = ((_4835 * _4835) * _4834) + _4352;
              _4839 = 1.0f - _4832;
              _4840 = _4839 * _4839;
              _4845 = 1.0f - _4347;
              _4846 = _4845 * _4845;
              _4873 = (_4832 * 0.31830987334251404f) * ((((_4352 * ((((_4833 * 34.5f) + -59.0f) * _4833) + 24.5f)) * exp2(-0.0f - (max(((_4833 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_4349)))) + _4838) + ((((1.0f - ((_4840 * _4840) * (_4839 * 0.75f))) * (1.0f - ((_4846 * _4846) * (_4845 * 0.75f)))) - _4838) * saturate((_4833 * 2.200000047683716f) + -0.5f)));
              _4876 = saturate(1.0f - saturate(_4350));  // [sem: expr_sat]
              _4877 = _4876 * _4876;
              _4879 = (_4877 * _4877) * _4876;
              _4882 = _4879 * saturate(_4265 * 50.0f);
              _4883 = 1.0f - _4879;
              _4887 = (_4883 * _4264) + _4882;
              _4888 = (_4883 * _4265) + _4882;
              _4889 = (_4883 * _4266) + _4882;
              if (!(_4176 == 29)) {
                _4891 = saturate(_4345);  // [sem: _4345_sat]
                _4892 = 1.0f - _4267;
                _4904 = (((_4349 * _4268) - _4349) * _4349) + 1.0f;
                _4908 = (_4268 / ((_4904 * _4904) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4892) + _4267) * _4345) + (_4347 * ((_4345 * _4892) + _4267))));
                _4919 = (max((_4908 * _4887), 0.0f) * _4891);
                _4920 = (max((_4908 * _4888), 0.0f) * _4891);
                _4921 = (max((_4908 * _4889), 0.0f) * _4891);
              } else {
                _4919 = 0.0f;
                _4920 = 0.0f;
                _4921 = 0.0f;
              }
              _4922 = (_4176 == 65);
              if (_4241) {
                if (_4922) {
                  _4965 = max(9.999999974752427e-07f, _exposure2.x);
                  _4974 = ((_4832 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4210, _4211, _4212), float3(_1710, _1711, _1712)))) * 16.0f)) / (((_4965 * _4965) * 1e+06f) + 1.0f);
                  _4988 = _4919;
                  _4989 = _4920;
                  _4990 = _4921;
                  _4991 = ((((_4974 * _4126) - _4873) * _4175) + _4873);
                  _4992 = ((((_4974 * _4127) - _4873) * _4175) + _4873);
                  _4993 = ((((_4974 * _4128) - _4873) * _4175) + _4873);
                } else {
                  _4929 = 1.0f - _4273;
                  _4941 = (((_4349 * _4274) - _4349) * _4349) + 1.0f;
                  _4945 = (_4274 / ((_4941 * _4941) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4929) + _4273) * _4345) + (_4347 * ((_4345 * _4929) + _4273))));
                  _4952 = saturate(_4345) * 0.39990234375f;
                  _4988 = ((max((_4945 * _4887), 0.0f) * _4952) + (_4919 * 0.60009765625f));
                  _4989 = ((max((_4945 * _4888), 0.0f) * _4952) + (_4920 * 0.60009765625f));
                  _4990 = ((max((_4945 * _4889), 0.0f) * _4952) + (_4921 * 0.60009765625f));
                  _4991 = _4873;
                  _4992 = _4873;
                  _4993 = _4873;
                }
              } else {
                if (_4922) {
                  _4965 = max(9.999999974752427e-07f, _exposure2.x);
                  _4974 = ((_4832 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4210, _4211, _4212), float3(_1710, _1711, _1712)))) * 16.0f)) / (((_4965 * _4965) * 1e+06f) + 1.0f);
                  _4988 = _4919;
                  _4989 = _4920;
                  _4990 = _4921;
                  _4991 = ((((_4974 * _4126) - _4873) * _4175) + _4873);
                  _4992 = ((((_4974 * _4127) - _4873) * _4175) + _4873);
                  _4993 = ((((_4974 * _4128) - _4873) * _4175) + _4873);
                } else {
                  _4988 = _4919;
                  _4989 = _4920;
                  _4990 = _4921;
                  _4991 = _4873;
                  _4992 = _4873;
                  _4993 = _4873;
                }
              }
            } else {
              _4988 = _4646;
              _4989 = _4647;
              _4990 = _4648;
              _4991 = _4649;
              _4992 = _4650;
              _4993 = _4651;
            }
            _4997 = min(-0.0f, (-0.0f - _4991));
            _4998 = min(-0.0f, (-0.0f - _4992));
            _4999 = min(-0.0f, (-0.0f - _4993));
            _5000 = -0.0f - _4997;
            _5001 = -0.0f - _4998;
            _5002 = -0.0f - _4999;
            _5061 = _4643;
            _5062 = _4644;
            _5063 = _4645;
            _5064 = (_4988 * _3841);
            _5065 = (_4989 * _3842);
            _5066 = (_4990 * _3843);
            _5067 = (_3841 * _5000);
            _5068 = (_3842 * _5001);
            _5069 = (_3843 * _5002);
          } else {
            _5061 = _4643;
            _5062 = _4644;
            _5063 = _4645;
            _5064 = _4646;
            _5065 = _4647;
            _5066 = _4648;
            _5067 = _4649;
            _5068 = _4650;
            _5069 = _4651;
          }
        } else {
          _4668 = (saturate(_4344) * 0.31830987334251404f) * (((saturate(1.0f - _effectiveMetallicForVelvet) + -1.0f) * _4181) + 1.0f);
          _4674 = max(dot(float3(_4126, _4127, _4128), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
          _4675 = sqrt(_4126);
          _4676 = sqrt(_4127);
          _4677 = sqrt(_4128);
          _4678 = _4675 - _4674;
          _4679 = _4676 - _4674;
          _4680 = _4677 - _4674;
          _4687 = saturate(1.0f - (pow(_4347, 4.0f)));  // [sem: expr_sat]
          _4700 = (((_4679 * _4178) + _4674) + ((_4679 * (_4181 - _4178)) * _4687)) * _4179;
          _4703 = saturate(1.0f - saturate(_4350));  // [sem: expr_sat]
          _4704 = _4703 * _4703;
          _4706 = (_4704 * _4704) * _4703;
          _4709 = _4706 * saturate(_4700 * 50.0f);
          _4710 = 1.0f - _4706;
          _4711 = _4710 * _4179;
          _4715 = (_4711 * (((_4678 * _4178) + _4674) + (_4687 * (_4678 * (_4181 - _4178))))) + _4709;
          _4716 = (_4710 * _4700) + _4709;
          _4717 = (_4711 * (((_4680 * _4178) + _4674) + ((_4680 * (_4181 - _4178)) * _4687))) + _4709;
          _4718 = min(_4349, 0.9998999834060669f);
          _4719 = _4718 * _4718;
          _4720 = 1.0f - _4719;
          _4732 = (((exp2(((-0.0f - _4719) / (_4720 * _4268)) * 1.4426950216293335f) * 4.0f) / (_4720 * _4720)) + 1.0f) / ((_4268 * 12.566370964050293f) + 3.1415927410125732f);
          _4736 = ((_4347 + _4345) - (_4347 * _4345)) * 4.0f;
          _4740 = (_4715 * _4732) / _4736;
          _4741 = (_4716 * _4732) / _4736;
          _4742 = (_4717 * _4732) / _4736;
          _4743 = 1.0f - _4267;
          _4755 = (((_4349 * _4268) - _4349) * _4349) + 1.0f;
          _4759 = (_4268 / ((_4755 * _4755) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4743) + _4267) * _4344) + (_4347 * ((_4344 * _4743) + _4267))));
          _4775 = saturate(_4345);  // [sem: _4345_sat]
          _4780 = (_4180 * 1.5f) + 2.5f;
          _4781 = _4780 * _4780;
          _4791 = (max(0.0f, (0.30000001192092896f - _4344)) * 0.25f) * ((exp2(_4781 * -0.48089835047721863f) * 3.0f) + exp2(_4781 * -1.4426950216293335f));
          _4816 = (((1.0f - _4181) * 0.47746479511260986f) * saturate(_4180)) * saturate((pow(_4349, 4.0f)) * exp2(log2(saturate(1.0f - abs(_4344))) * 3.0f));
          _4821 = (_4816 * _4675);
          _4822 = (_4816 * _4676);
          _4823 = (_4816 * _4677);
          _4824 = ((((max((_4759 * _4715), 0.0f) - _4740) * _4178) + _4740) * _4775);
          _4825 = ((((max((_4759 * _4716), 0.0f) - _4741) * _4178) + _4741) * _4775);
          _4826 = ((((max((_4759 * _4717), 0.0f) - _4742) * _4178) + _4742) * _4775);
          _4827 = (((_4675 * _3841) * _4791) + _4668);
          _4828 = (((_4676 * _3842) * _4791) + _4668);
          _4829 = (((_4677 * _3843) * _4791) + _4668);
          if (!(_4177 > 0.9900000095367432f)) {
            _4832 = saturate(_4344);  // [sem: _4344_sat]
            _4833 = 1.0f - _4268;
            _4834 = 1.0f - _4352;
            _4835 = _4834 * _4834;
            _4838 = ((_4835 * _4835) * _4834) + _4352;
            _4839 = 1.0f - _4832;
            _4840 = _4839 * _4839;
            _4845 = 1.0f - _4347;
            _4846 = _4845 * _4845;
            _4873 = (_4832 * 0.31830987334251404f) * ((((_4352 * ((((_4833 * 34.5f) + -59.0f) * _4833) + 24.5f)) * exp2(-0.0f - (max(((_4833 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_4349)))) + _4838) + ((((1.0f - ((_4840 * _4840) * (_4839 * 0.75f))) * (1.0f - ((_4846 * _4846) * (_4845 * 0.75f)))) - _4838) * saturate((_4833 * 2.200000047683716f) + -0.5f)));
            _4876 = saturate(1.0f - saturate(_4350));  // [sem: expr_sat]
            _4877 = _4876 * _4876;
            _4879 = (_4877 * _4877) * _4876;
            _4882 = _4879 * saturate(_4265 * 50.0f);
            _4883 = 1.0f - _4879;
            _4887 = (_4883 * _4264) + _4882;
            _4888 = (_4883 * _4265) + _4882;
            _4889 = (_4883 * _4266) + _4882;
            if (!(_4176 == 29)) {
              _4891 = saturate(_4345);  // [sem: _4345_sat]
              _4892 = 1.0f - _4267;
              _4904 = (((_4349 * _4268) - _4349) * _4349) + 1.0f;
              _4908 = (_4268 / ((_4904 * _4904) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4892) + _4267) * _4345) + (_4347 * ((_4345 * _4892) + _4267))));
              _4919 = (max((_4908 * _4887), 0.0f) * _4891);
              _4920 = (max((_4908 * _4888), 0.0f) * _4891);
              _4921 = (max((_4908 * _4889), 0.0f) * _4891);
            } else {
              _4919 = 0.0f;
              _4920 = 0.0f;
              _4921 = 0.0f;
            }
            _4922 = (_4176 == 65);
            if (_4241) {
              if (_4922) {
                _4965 = max(9.999999974752427e-07f, _exposure2.x);
                _4974 = ((_4832 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4210, _4211, _4212), float3(_1710, _1711, _1712)))) * 16.0f)) / (((_4965 * _4965) * 1e+06f) + 1.0f);
                _4988 = _4919;
                _4989 = _4920;
                _4990 = _4921;
                _4991 = ((((_4974 * _4126) - _4873) * _4175) + _4873);
                _4992 = ((((_4974 * _4127) - _4873) * _4175) + _4873);
                _4993 = ((((_4974 * _4128) - _4873) * _4175) + _4873);
              } else {
                _4929 = 1.0f - _4273;
                _4941 = (((_4349 * _4274) - _4349) * _4349) + 1.0f;
                _4945 = (_4274 / ((_4941 * _4941) * 3.1415927410125732f)) * (0.5f / ((((_4347 * _4929) + _4273) * _4345) + (_4347 * ((_4345 * _4929) + _4273))));
                _4952 = saturate(_4345) * 0.39990234375f;
                _4988 = ((max((_4945 * _4887), 0.0f) * _4952) + (_4919 * 0.60009765625f));
                _4989 = ((max((_4945 * _4888), 0.0f) * _4952) + (_4920 * 0.60009765625f));
                _4990 = ((max((_4945 * _4889), 0.0f) * _4952) + (_4921 * 0.60009765625f));
                _4991 = _4873;
                _4992 = _4873;
                _4993 = _4873;
              }
            } else {
              if (_4922) {
                _4965 = max(9.999999974752427e-07f, _exposure2.x);
                _4974 = ((_4832 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4210, _4211, _4212), float3(_1710, _1711, _1712)))) * 16.0f)) / (((_4965 * _4965) * 1e+06f) + 1.0f);
                _4988 = _4919;
                _4989 = _4920;
                _4990 = _4921;
                _4991 = ((((_4974 * _4126) - _4873) * _4175) + _4873);
                _4992 = ((((_4974 * _4127) - _4873) * _4175) + _4873);
                _4993 = ((((_4974 * _4128) - _4873) * _4175) + _4873);
              } else {
                _4988 = _4919;
                _4989 = _4920;
                _4990 = _4921;
                _4991 = _4873;
                _4992 = _4873;
                _4993 = _4873;
              }
            }
          } else {
            _4988 = _4646;
            _4989 = _4647;
            _4990 = _4648;
            _4991 = _4649;
            _4992 = _4650;
            _4993 = _4651;
          }
          _4997 = min(-0.0f, (-0.0f - _4991));
          _4998 = min(-0.0f, (-0.0f - _4992));
          _4999 = min(-0.0f, (-0.0f - _4993));
          _5000 = -0.0f - _4997;
          _5001 = -0.0f - _4998;
          _5002 = -0.0f - _4999;
          _5004 = (_4177 > 0.0f);
          if (_5004) {
            _5038 = (_4643 - (_4643 * _4309));
            _5039 = (_4644 - (_4644 * _4309));
            _5040 = (_4645 - (_4645 * _4309));
            _5041 = (lerp(_4988, _4824, _4309));  // [sem: blended]
            _5042 = (lerp(_4989, _4825, _4309));  // [sem: blended]
            _5043 = (lerp(_4990, _4826, _4309));  // [sem: blended]
            _5044 = (((_4997 + _4827) * _4309) - _4997);
            _5045 = (((_4998 + _4828) * _4309) - _4998);
            _5046 = (((_4999 + _4829) * _4309) - _4999);
          } else {
            _5038 = _4643;
            _5039 = _4644;
            _5040 = _4645;
            _5041 = _4988;  // [sem: blended]
            _5042 = _4989;  // [sem: blended]
            _5043 = _4990;  // [sem: blended]
            _5044 = _5000;
            _5045 = _5001;
            _5046 = _5002;
          }
          _5047 = _5044 * _3841;
          _5048 = _5045 * _3842;
          _5049 = _5046 * _3843;
          _5050 = _5041 * _3841;
          _5051 = _5042 * _3842;
          _5052 = _5043 * _3843;
          if (_5004) {
            _5061 = _5038;
            _5062 = _5039;
            _5063 = _5040;
            _5064 = (_5050 + (_4821 * _4309));
            _5065 = (_5051 + (_4822 * _4309));
            _5066 = (_5052 + (_4823 * _4309));
            _5067 = _5047;
            _5068 = _5048;
            _5069 = _5049;
          } else {
            _5061 = _5038;
            _5062 = _5039;
            _5063 = _5040;
            _5064 = _5050;
            _5065 = _5051;
            _5066 = _5052;
            _5067 = _5047;
            _5068 = _5048;
            _5069 = _5049;
          }
        }
      } else {
        _5061 = _4643;
        _5062 = _4644;
        _5063 = _4645;
        _5064 = _4646;
        _5065 = _4647;
        _5066 = _4648;
        _5067 = _4649;
        _5068 = _4650;
        _5069 = _4651;
      }
    }
    if (_4312) {
      _5073 = max(0.0f, (0.30000001192092896f - _4344)) * 0.23190687596797943f;
      _5081 = ((_5073 * _3841) + _5067);
      _5082 = ((_5073 * _3842) + _5068);
      _5083 = ((_5073 * _3843) + _5069);
    } else {
      _5081 = _5067;
      _5082 = _5068;
      _5083 = _5069;
    }
    _5085 = 1.0f - (_4350 * 0.8500000238418579f);
    if (_4241) {
      _5089 = max(4.0f, _4317);
      _5090 = _5089 * _5089;
      _5092 = exp2(_5090 * -225.4210968017578f);
      _5097 = exp2(_5090 * -29.807748794555664f);
      _5105 = exp2(_5090 * -7.714946269989014f);
      _5111 = exp2(_5090 * -2.544435739517212f);
      _5113 = _5111 * 0.007000000216066837f;
      _5118 = exp2(_5090 * -0.7249723672866821f);
      _5132 = saturate(dot(float3(_4329, _4330, _4331), float3((-0.0f - _222), _238, (-0.0f - _224))) + 0.30000001192092896f) * 0.31830987334251404f;
      _5420 = ((_5132 * ((((((_5097 * 0.10000000149011612f) + (_5092 * 0.2329999953508377f)) + (_5105 * 0.11800000071525574f)) + (_5111 * 0.11299999803304672f)) + (_5118 * 0.3580000102519989f)) + (exp2(_5090 * -0.19469568133354187f) * 0.07800000160932541f))) + _5081);
      _5421 = ((_5132 * (((((_5097 * 0.335999995470047f) + (_5092 * 0.45500001311302185f)) + (_5105 * 0.1979999989271164f)) + _5113) + (_5118 * 0.004000000189989805f))) + _5082);
      _5422 = ((_5132 * (((_5097 * 0.3440000116825104f) + (_5092 * 0.6489999890327454f)) + _5113)) + _5083);
      _5423 = _5420 * _4333;
      _5424 = _5421 * _4334;
      _5425 = _5422 * _4335;
      _5427 = (_5064 * _4333) * _3841;
      _5429 = (_5065 * _4334) * _3842;
      _5431 = (_5066 * _4335) * _3843;
      bool __branch_chain_5419;
      if (_4176 == 97) {
        _5448 = _5427;
        _5449 = _5429;
        _5450 = _5431;
        _5451 = _5423;
        _5452 = _5424;
        _5453 = _5425;
        _5454 = _5061;
        _5455 = _5062;
        _5456 = _5063;
        _5457 = _3841;
        _5458 = _3842;
        _5459 = _3843;
        __branch_chain_5419 = true;
      } else {
        _5434 = _5427;
        _5435 = _5429;
        _5436 = _5431;
        _5437 = _5423;
        _5438 = _5424;
        _5439 = _5425;
        _5440 = _5061;
        _5441 = _5062;
        _5442 = _5063;
        _5443 = _3841;
        _5444 = _3842;
        _5445 = _3843;
        if (_4176 == 98) {
          _5448 = _5434;
          _5449 = _5435;
          _5450 = _5436;
          _5451 = _5437;
          _5452 = _5438;
          _5453 = _5439;
          _5454 = _5440;
          _5455 = _5441;
          _5456 = _5442;
          _5457 = _5443;
          _5458 = _5444;
          _5459 = _5445;
          __branch_chain_5419 = true;
        } else {
          _5593 = _5437;
          _5594 = _5438;
          _5595 = _5439;
          _5596 = _5440;
          _5597 = _5441;
          _5598 = _5442;
          _5599 = _5434;
          _5600 = _5435;
          _5601 = _5436;
          __branch_chain_5419 = false;
        }
      }
      if (__branch_chain_5419) {
        if ((_120 < 1000.0f) && (_3828 == 0.0h)) {
          if (!(abs(_223) > 0.9900000095367432f)) {
            _5467 = -0.0f - _224;
            _5469 = rsqrt(dot(float3(_5467, 0.0f, _222), float3(_5467, 0.0f, _222)));  // [sem: invLength]
            _5473 = (_5469 * _5467);
            _5474 = (_5469 * _222);
          } else {
            _5473 = 1.0f;
            _5474 = 0.0f;
          }
          _5476 = -0.0f - (_223 * _5474);
          _5479 = (_5474 * _222) - (_5473 * _224);
          _5480 = _5473 * _223;
          _5482 = rsqrt(dot(float3(_5476, _5479, _5480), float3(_5476, _5479, _5480)));  // [sem: invLength]
          _5488 = _viewPos.x + _1008;
          _5489 = _viewPos.z + _1010;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
          _5494 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5473, 0.0f, _5474), float3(_5488, _3919, _5489)), dot(float3((_5482 * _5476), (_5479 * _5482), (_5482 * _5480)), float3(_5488, _3919, _5489))), 0.0f);
          _5498 = _5494.x + -0.5f;
          _5499 = _5494.y + -0.5f;
          _5500 = _5494.z + -0.5f;
          _5502 = rsqrt(dot(float3(_5498, _5499, _5500), float3(_5498, _5499, _5500)));  // [sem: invLength]
          _5506 = (_5498 * _5502) + _4210;
          _5507 = (_5499 * _5502) + _4211;
          _5508 = (_5500 * _5502) + _4212;
          _5510 = rsqrt(dot(float3(_5506, _5507, _5508), float3(_5506, _5507, _5508)));  // [sem: invLength]
          _5511 = _5506 * _5510;
          _5512 = _5507 * _5510;
          _5513 = _5508 * _5510;
          _5525 = abs(((_101 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
          _5526 = abs(1.0f - ((_102 * 2.0f) * _bufferSizeAndInvSize.w));
          _5529 = saturate(_5525 * _5525);  // [sem: expr_sat]
          _5530 = saturate(_5526 * _5526);  // [sem: expr_sat]
          _5544 = dot(float3((-0.0f - _5511), (-0.0f - _5512), (-0.0f - _5513)), float3(_4329, _4330, _4331));
          _5546 = saturate(dot(float3(_5511, _5512, _5513), float3(_1710, _1711, _1712)));  // [sem: expr_sat]
          _5548 = saturate(1.0f - _4350);  // [sem: expr_sat]
          _5549 = _5548 * _5548;
          _5551 = (_5549 * _5549) * _5548;
          _5567 = 1.0f - ((_4349 * _4349) * 0.9998999834060669f);
          _5574 = (max((((3.18309866997879e-05f / (_5567 * _5567)) * (0.5f / ((((_5546 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5544) + (_5546 * ((_5544 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5551, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5544)) + (exp2(log2(saturate(dot(float3(_1710, _1711, _1712), float3(_5511, _5512, _5513)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
          _5579 = saturate(1.0f - (_120 * 0.0010000000474974513f)) * ((1.0f - ((_5530 * _5530) * (3.0f - (_5530 * 2.0f)))) * (1.0f - ((_5529 * _5529) * (3.0f - (_5529 * 2.0f)))));
          _5593 = _5451;
          _5594 = _5452;
          _5595 = _5453;
          _5596 = _5454;
          _5597 = _5455;
          _5598 = _5456;
          _5599 = ((((_5579 * _4333) * _5457) * _5574) + _5448);
          _5600 = ((((_5579 * _4334) * _5458) * _5574) + _5449);
          _5601 = ((((_5579 * _4335) * _5459) * _5574) + _5450);
        } else {
          _5593 = _5451;
          _5594 = _5452;
          _5595 = _5453;
          _5596 = _5454;
          _5597 = _5455;
          _5598 = _5456;
          _5599 = _5448;
          _5600 = _5449;
          _5601 = _5450;
        }
      }
    } else {
      if (_4355) {
        _5142 = dot(float3(_4126, _4127, _4128), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * _renderParams2.w;
        _5145 = _5142 + (_1645 - (_5142 * _1645));
        _5152 = (pow(_3841, 1.2000000476837158f));
        _5153 = (pow(_3842, 1.2000000476837158f));
        _5154 = (pow(_3843, 1.2000000476837158f));
        _5160 = saturate(abs(dot(float3(_4329, _4330, _4331), float3(_1596, _1597, _1598))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _5169 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_5160, _4136, saturate(sqrt(sqrt(_4126)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _5172 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_5160, _4136, saturate(sqrt(sqrt(_4127)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _5175 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_5160, _4136, saturate(sqrt(sqrt(_4128)))), 0.0f);
        _5184 = min(0.9900000095367432f, _5169.x);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5185 = min(0.9900000095367432f, _5172.x);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5186 = min(0.9900000095367432f, _5175.x);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5187 = min(0.9900000095367432f, _5169.y);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5188 = min(0.9900000095367432f, _5172.y);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5189 = min(0.9900000095367432f, _5175.y);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5190 = _5184 * _5184;
        _5191 = _5185 * _5185;
        _5192 = _5186 * _5186;
        _5193 = _5187 * _5187;
        _5194 = _5188 * _5188;
        _5195 = _5189 * _5189;
        _5196 = _5193 * _5187;
        _5197 = _5194 * _5188;
        _5198 = _5195 * _5189;
        _5199 = 1.0f - _5190;
        _5200 = 1.0f - _5191;
        _5201 = 1.0f - _5192;
        _5211 = _5199 * _5199;
        _5212 = _5200 * _5200;
        _5213 = _5201 * _5201;
        _5214 = _5211 * _5199;
        _5215 = _5212 * _5200;
        _5216 = _5213 * _5201;
        _5224 = min(max(_4136, 0.18000000715255737f), 0.6000000238418579f);
        _5225 = _5224 * _5224;
        _5226 = _5225 * 0.25f;
        _5227 = _5225 * 4.0f;
        _5229 = (_5185 + _5184) + _5186;
        _5230 = _5184 / _5229;
        _5231 = _5185 / _5229;
        _5232 = _5186 / _5229;
        _5233 = dot(float3(_5225, _5226, _5227), float3(_5230, _5231, _5232));
        _5234 = _5233 * _5233;
        _5238 = (asin(min(max(dot(float3(_1596, _1597, _1598), float3(_1710, _1711, _1712)), -1.0f), 1.0f)) + asin(min(max(dot(float3(_1596, _1597, _1598), float3(_4329, _4330, _4331)), -1.0f), 1.0f))) * 0.5f;
        _5239 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_5230, _5231, _5232));
        _5249 = _5239 * _5239;
        _5272 = (_5188 + _5187) + _5189;
        _5276 = dot(float3(_5225, _5226, _5227), float3((_5187 / _5272), (_5188 / _5272), (_5189 / _5272)));
        _5280 = sqrt((_5276 * _5276) + (_5234 * 2.0f));
        _5298 = (_5276 * 3.0f) + (_5233 * 2.0f);
        _5305 = (((_5196 + _5187) * ((_5190 * 0.699999988079071f) + 1.0f)) * _5280) / ((_5298 * _5196) + _5187);
        _5306 = (((_5197 + _5188) * ((_5191 * 0.699999988079071f) + 1.0f)) * _5280) / ((_5298 * _5197) + _5188);
        _5307 = (((_5198 + _5189) * ((_5192 * 0.699999988079071f) + 1.0f)) * _5280) / ((_5298 * _5198) + _5189);
        _5311 = _5238 - (((_5249 * (((_5190 * 4.0f) * _5193) + (_5211 * 2.0f))) * (1.0f - ((_5193 * 2.0f) / _5211))) / _5214);
        _5318 = _5238 - (((_5249 * (((_5191 * 4.0f) * _5194) + (_5212 * 2.0f))) * (1.0f - ((_5194 * 2.0f) / _5212))) / _5215);
        _5325 = _5238 - (((_5249 * (((_5192 * 4.0f) * _5195) + (_5213 * 2.0f))) * (1.0f - ((_5195 * 2.0f) / _5213))) / _5216);
        _5333 = (1.0f - _1594) * 2.0999999046325684f;
        _5354 = (_1594 * 0.31830987334251404f) * saturate(_4344);
        _5401 = _5152;
        _5402 = _5153;
        _5403 = _5154;
        _5404 = (((_5145 * _4333) * _5152) * ((((((_5196 * _5190) / _5214) + ((_5187 * _5190) / _5199)) * _5333) * exp2((((_5311 * _5311) * -0.5f) / ((_5305 * _5305) + _5234)) * 1.4426950216293335f)) + _5061));
        _5405 = (((_5145 * _4334) * _5153) * ((((((_5197 * _5191) / _5215) + ((_5188 * _5191) / _5200)) * _5333) * exp2((((_5318 * _5318) * -0.5f) / ((_5306 * _5306) + _5234)) * 1.4426950216293335f)) + _5062));
        _5406 = (((_5145 * _4335) * _5154) * ((((((_5198 * _5192) / _5216) + ((_5189 * _5192) / _5201)) * _5333) * exp2((((_5325 * _5325) * -0.5f) / ((_5307 * _5307) + _5234)) * 1.4426950216293335f)) + _5063));
        _5407 = (_5354 * _5152);
        _5408 = (_5354 * _5153);
        _5409 = (_5354 * _5154);
        _5434 = ((_5064 * _4333) * _5401);
        _5435 = ((_5065 * _4334) * _5402);
        _5436 = ((_5066 * _4335) * _5403);
        _5437 = (_5407 * _4333);
        _5438 = (_5408 * _4334);
        _5439 = (_5409 * _4335);
        _5440 = _5404;
        _5441 = _5405;
        _5442 = _5406;
        _5443 = _5401;
        _5444 = _5402;
        _5445 = _5403;
        if (_4176 == 98) {
          _5448 = _5434;
          _5449 = _5435;
          _5450 = _5436;
          _5451 = _5437;
          _5452 = _5438;
          _5453 = _5439;
          _5454 = _5440;
          _5455 = _5441;
          _5456 = _5442;
          _5457 = _5443;
          _5458 = _5444;
          _5459 = _5445;
          if ((_120 < 1000.0f) && (_3828 == 0.0h)) {
            if (!(abs(_223) > 0.9900000095367432f)) {
              _5467 = -0.0f - _224;
              _5469 = rsqrt(dot(float3(_5467, 0.0f, _222), float3(_5467, 0.0f, _222)));  // [sem: invLength]
              _5473 = (_5469 * _5467);
              _5474 = (_5469 * _222);
            } else {
              _5473 = 1.0f;
              _5474 = 0.0f;
            }
            _5476 = -0.0f - (_223 * _5474);
            _5479 = (_5474 * _222) - (_5473 * _224);
            _5480 = _5473 * _223;
            _5482 = rsqrt(dot(float3(_5476, _5479, _5480), float3(_5476, _5479, _5480)));  // [sem: invLength]
            _5488 = _viewPos.x + _1008;
            _5489 = _viewPos.z + _1010;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
            _5494 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5473, 0.0f, _5474), float3(_5488, _3919, _5489)), dot(float3((_5482 * _5476), (_5479 * _5482), (_5482 * _5480)), float3(_5488, _3919, _5489))), 0.0f);
            _5498 = _5494.x + -0.5f;
            _5499 = _5494.y + -0.5f;
            _5500 = _5494.z + -0.5f;
            _5502 = rsqrt(dot(float3(_5498, _5499, _5500), float3(_5498, _5499, _5500)));  // [sem: invLength]
            _5506 = (_5498 * _5502) + _4210;
            _5507 = (_5499 * _5502) + _4211;
            _5508 = (_5500 * _5502) + _4212;
            _5510 = rsqrt(dot(float3(_5506, _5507, _5508), float3(_5506, _5507, _5508)));  // [sem: invLength]
            _5511 = _5506 * _5510;
            _5512 = _5507 * _5510;
            _5513 = _5508 * _5510;
            _5525 = abs(((_101 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
            _5526 = abs(1.0f - ((_102 * 2.0f) * _bufferSizeAndInvSize.w));
            _5529 = saturate(_5525 * _5525);  // [sem: expr_sat]
            _5530 = saturate(_5526 * _5526);  // [sem: expr_sat]
            _5544 = dot(float3((-0.0f - _5511), (-0.0f - _5512), (-0.0f - _5513)), float3(_4329, _4330, _4331));
            _5546 = saturate(dot(float3(_5511, _5512, _5513), float3(_1710, _1711, _1712)));  // [sem: expr_sat]
            _5548 = saturate(1.0f - _4350);  // [sem: expr_sat]
            _5549 = _5548 * _5548;
            _5551 = (_5549 * _5549) * _5548;
            _5567 = 1.0f - ((_4349 * _4349) * 0.9998999834060669f);
            _5574 = (max((((3.18309866997879e-05f / (_5567 * _5567)) * (0.5f / ((((_5546 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5544) + (_5546 * ((_5544 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5551, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5544)) + (exp2(log2(saturate(dot(float3(_1710, _1711, _1712), float3(_5511, _5512, _5513)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
            _5579 = saturate(1.0f - (_120 * 0.0010000000474974513f)) * ((1.0f - ((_5530 * _5530) * (3.0f - (_5530 * 2.0f)))) * (1.0f - ((_5529 * _5529) * (3.0f - (_5529 * 2.0f)))));
            _5593 = _5451;
            _5594 = _5452;
            _5595 = _5453;
            _5596 = _5454;
            _5597 = _5455;
            _5598 = _5456;
            _5599 = ((((_5579 * _4333) * _5457) * _5574) + _5448);
            _5600 = ((((_5579 * _4334) * _5458) * _5574) + _5449);
            _5601 = ((((_5579 * _4335) * _5459) * _5574) + _5450);
          } else {
            _5593 = _5451;
            _5594 = _5452;
            _5595 = _5453;
            _5596 = _5454;
            _5597 = _5455;
            _5598 = _5456;
            _5599 = _5448;
            _5600 = _5449;
            _5601 = _5450;
          }
        } else {
          _5593 = _5437;
          _5594 = _5438;
          _5595 = _5439;
          _5596 = _5440;
          _5597 = _5441;
          _5598 = _5442;
          _5599 = _5434;
          _5600 = _5435;
          _5601 = _5436;
        }
      } else {
        if (_4311) {
          if (_4176 == 97) {
            _5448 = ((_5064 * _4333) * _3841);
            _5449 = ((_5065 * _4334) * _3842);
            _5450 = ((_5066 * _4335) * _3843);
            _5451 = (_5081 * _4333);
            _5452 = (_5082 * _4334);
            _5453 = (_5083 * _4335);
            _5454 = _5061;
            _5455 = _5062;
            _5456 = _5063;
            _5457 = _3841;
            _5458 = _3842;
            _5459 = _3843;
            if ((_120 < 1000.0f) && (_3828 == 0.0h)) {
              if (!(abs(_223) > 0.9900000095367432f)) {
                _5467 = -0.0f - _224;
                _5469 = rsqrt(dot(float3(_5467, 0.0f, _222), float3(_5467, 0.0f, _222)));  // [sem: invLength]
                _5473 = (_5469 * _5467);
                _5474 = (_5469 * _222);
              } else {
                _5473 = 1.0f;
                _5474 = 0.0f;
              }
              _5476 = -0.0f - (_223 * _5474);
              _5479 = (_5474 * _222) - (_5473 * _224);
              _5480 = _5473 * _223;
              _5482 = rsqrt(dot(float3(_5476, _5479, _5480), float3(_5476, _5479, _5480)));  // [sem: invLength]
              _5488 = _viewPos.x + _1008;
              _5489 = _viewPos.z + _1010;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
              _5494 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5473, 0.0f, _5474), float3(_5488, _3919, _5489)), dot(float3((_5482 * _5476), (_5479 * _5482), (_5482 * _5480)), float3(_5488, _3919, _5489))), 0.0f);
              _5498 = _5494.x + -0.5f;
              _5499 = _5494.y + -0.5f;
              _5500 = _5494.z + -0.5f;
              _5502 = rsqrt(dot(float3(_5498, _5499, _5500), float3(_5498, _5499, _5500)));  // [sem: invLength]
              _5506 = (_5498 * _5502) + _4210;
              _5507 = (_5499 * _5502) + _4211;
              _5508 = (_5500 * _5502) + _4212;
              _5510 = rsqrt(dot(float3(_5506, _5507, _5508), float3(_5506, _5507, _5508)));  // [sem: invLength]
              _5511 = _5506 * _5510;
              _5512 = _5507 * _5510;
              _5513 = _5508 * _5510;
              _5525 = abs(((_101 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
              _5526 = abs(1.0f - ((_102 * 2.0f) * _bufferSizeAndInvSize.w));
              _5529 = saturate(_5525 * _5525);  // [sem: expr_sat]
              _5530 = saturate(_5526 * _5526);  // [sem: expr_sat]
              _5544 = dot(float3((-0.0f - _5511), (-0.0f - _5512), (-0.0f - _5513)), float3(_4329, _4330, _4331));
              _5546 = saturate(dot(float3(_5511, _5512, _5513), float3(_1710, _1711, _1712)));  // [sem: expr_sat]
              _5548 = saturate(1.0f - _4350);  // [sem: expr_sat]
              _5549 = _5548 * _5548;
              _5551 = (_5549 * _5549) * _5548;
              _5567 = 1.0f - ((_4349 * _4349) * 0.9998999834060669f);
              _5574 = (max((((3.18309866997879e-05f / (_5567 * _5567)) * (0.5f / ((((_5546 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5544) + (_5546 * ((_5544 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5551, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5544)) + (exp2(log2(saturate(dot(float3(_1710, _1711, _1712), float3(_5511, _5512, _5513)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
              _5579 = saturate(1.0f - (_120 * 0.0010000000474974513f)) * ((1.0f - ((_5530 * _5530) * (3.0f - (_5530 * 2.0f)))) * (1.0f - ((_5529 * _5529) * (3.0f - (_5529 * 2.0f)))));
              _5593 = _5451;
              _5594 = _5452;
              _5595 = _5453;
              _5596 = _5454;
              _5597 = _5455;
              _5598 = _5456;
              _5599 = ((((_5579 * _4333) * _5457) * _5574) + _5448);
              _5600 = ((((_5579 * _4334) * _5458) * _5574) + _5449);
              _5601 = ((((_5579 * _4335) * _5459) * _5574) + _5450);
            } else {
              _5593 = _5451;
              _5594 = _5452;
              _5595 = _5453;
              _5596 = _5454;
              _5597 = _5455;
              _5598 = _5456;
              _5599 = _5448;
              _5600 = _5449;
              _5601 = _5450;
            }
          } else {
            if ((uint)(_4176 + -105) < (uint)2) {
              _5401 = _3841;
              _5402 = _3842;
              _5403 = _3843;
              _5404 = _5061;
              _5405 = _5062;
              _5406 = _5063;
              _5407 = _5081;
              _5408 = _5082;
              _5409 = _5083;
              _5434 = ((_5064 * _4333) * _5401);
              _5435 = ((_5065 * _4334) * _5402);
              _5436 = ((_5066 * _4335) * _5403);
              _5437 = (_5407 * _4333);
              _5438 = (_5408 * _4334);
              _5439 = (_5409 * _4335);
              _5440 = _5404;
              _5441 = _5405;
              _5442 = _5406;
              _5443 = _5401;
              _5444 = _5402;
              _5445 = _5403;
              if (_4176 == 98) {
                _5448 = _5434;
                _5449 = _5435;
                _5450 = _5436;
                _5451 = _5437;
                _5452 = _5438;
                _5453 = _5439;
                _5454 = _5440;
                _5455 = _5441;
                _5456 = _5442;
                _5457 = _5443;
                _5458 = _5444;
                _5459 = _5445;
                if ((_120 < 1000.0f) && (_3828 == 0.0h)) {
                  if (!(abs(_223) > 0.9900000095367432f)) {
                    _5467 = -0.0f - _224;
                    _5469 = rsqrt(dot(float3(_5467, 0.0f, _222), float3(_5467, 0.0f, _222)));  // [sem: invLength]
                    _5473 = (_5469 * _5467);
                    _5474 = (_5469 * _222);
                  } else {
                    _5473 = 1.0f;
                    _5474 = 0.0f;
                  }
                  _5476 = -0.0f - (_223 * _5474);
                  _5479 = (_5474 * _222) - (_5473 * _224);
                  _5480 = _5473 * _223;
                  _5482 = rsqrt(dot(float3(_5476, _5479, _5480), float3(_5476, _5479, _5480)));  // [sem: invLength]
                  _5488 = _viewPos.x + _1008;
                  _5489 = _viewPos.z + _1010;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
                  _5494 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5473, 0.0f, _5474), float3(_5488, _3919, _5489)), dot(float3((_5482 * _5476), (_5479 * _5482), (_5482 * _5480)), float3(_5488, _3919, _5489))), 0.0f);
                  _5498 = _5494.x + -0.5f;
                  _5499 = _5494.y + -0.5f;
                  _5500 = _5494.z + -0.5f;
                  _5502 = rsqrt(dot(float3(_5498, _5499, _5500), float3(_5498, _5499, _5500)));  // [sem: invLength]
                  _5506 = (_5498 * _5502) + _4210;
                  _5507 = (_5499 * _5502) + _4211;
                  _5508 = (_5500 * _5502) + _4212;
                  _5510 = rsqrt(dot(float3(_5506, _5507, _5508), float3(_5506, _5507, _5508)));  // [sem: invLength]
                  _5511 = _5506 * _5510;
                  _5512 = _5507 * _5510;
                  _5513 = _5508 * _5510;
                  _5525 = abs(((_101 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
                  _5526 = abs(1.0f - ((_102 * 2.0f) * _bufferSizeAndInvSize.w));
                  _5529 = saturate(_5525 * _5525);  // [sem: expr_sat]
                  _5530 = saturate(_5526 * _5526);  // [sem: expr_sat]
                  _5544 = dot(float3((-0.0f - _5511), (-0.0f - _5512), (-0.0f - _5513)), float3(_4329, _4330, _4331));
                  _5546 = saturate(dot(float3(_5511, _5512, _5513), float3(_1710, _1711, _1712)));  // [sem: expr_sat]
                  _5548 = saturate(1.0f - _4350);  // [sem: expr_sat]
                  _5549 = _5548 * _5548;
                  _5551 = (_5549 * _5549) * _5548;
                  _5567 = 1.0f - ((_4349 * _4349) * 0.9998999834060669f);
                  _5574 = (max((((3.18309866997879e-05f / (_5567 * _5567)) * (0.5f / ((((_5546 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5544) + (_5546 * ((_5544 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5551, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5544)) + (exp2(log2(saturate(dot(float3(_1710, _1711, _1712), float3(_5511, _5512, _5513)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
                  _5579 = saturate(1.0f - (_120 * 0.0010000000474974513f)) * ((1.0f - ((_5530 * _5530) * (3.0f - (_5530 * 2.0f)))) * (1.0f - ((_5529 * _5529) * (3.0f - (_5529 * 2.0f)))));
                  _5593 = _5451;
                  _5594 = _5452;
                  _5595 = _5453;
                  _5596 = _5454;
                  _5597 = _5455;
                  _5598 = _5456;
                  _5599 = ((((_5579 * _4333) * _5457) * _5574) + _5448);
                  _5600 = ((((_5579 * _4334) * _5458) * _5574) + _5449);
                  _5601 = ((((_5579 * _4335) * _5459) * _5574) + _5450);
                } else {
                  _5593 = _5451;
                  _5594 = _5452;
                  _5595 = _5453;
                  _5596 = _5454;
                  _5597 = _5455;
                  _5598 = _5456;
                  _5599 = _5448;
                  _5600 = _5449;
                  _5601 = _5450;
                }
              } else {
                _5593 = _5437;
                _5594 = _5438;
                _5595 = _5439;
                _5596 = _5440;
                _5597 = _5441;
                _5598 = _5442;
                _5599 = _5434;
                _5600 = _5435;
                _5601 = _5436;
              }
            } else {
              if (!(_4317 >= 999.9000244140625f)) {
                _5385 = ((max(0.0020000000949949026f, _4317) * 0.4000000059604645f) / ((_4175 * 100.0f) + 0.10000000149011612f));
              } else {
                _5385 = 1000.0f;
              }
              _5386 = _5385 * _5385;
              _5396 = (((_4175 * 0.25f) * (0.022082746028900146f / (_5085 * _5085))) * max(0.0f, (0.30000001192092896f - _4344))) * ((exp2(_5386 * -0.48089835047721863f) * 3.0f) + exp2(_5386 * -1.4426950216293335f));
              _5420 = (_5396 + _5081);
              _5421 = (_5396 + _5082);
              _5422 = (_5396 + _5083);
              _5423 = _5420 * _4333;
              _5424 = _5421 * _4334;
              _5425 = _5422 * _4335;
              _5427 = (_5064 * _4333) * _3841;
              _5429 = (_5065 * _4334) * _3842;
              _5431 = (_5066 * _4335) * _3843;
              bool __branch_chain_5419;
              if (_4176 == 97) {
                _5448 = _5427;
                _5449 = _5429;
                _5450 = _5431;
                _5451 = _5423;
                _5452 = _5424;
                _5453 = _5425;
                _5454 = _5061;
                _5455 = _5062;
                _5456 = _5063;
                _5457 = _3841;
                _5458 = _3842;
                _5459 = _3843;
                __branch_chain_5419 = true;
              } else {
                _5434 = _5427;
                _5435 = _5429;
                _5436 = _5431;
                _5437 = _5423;
                _5438 = _5424;
                _5439 = _5425;
                _5440 = _5061;
                _5441 = _5062;
                _5442 = _5063;
                _5443 = _3841;
                _5444 = _3842;
                _5445 = _3843;
                if (_4176 == 98) {
                  _5448 = _5434;
                  _5449 = _5435;
                  _5450 = _5436;
                  _5451 = _5437;
                  _5452 = _5438;
                  _5453 = _5439;
                  _5454 = _5440;
                  _5455 = _5441;
                  _5456 = _5442;
                  _5457 = _5443;
                  _5458 = _5444;
                  _5459 = _5445;
                  __branch_chain_5419 = true;
                } else {
                  _5593 = _5437;
                  _5594 = _5438;
                  _5595 = _5439;
                  _5596 = _5440;
                  _5597 = _5441;
                  _5598 = _5442;
                  _5599 = _5434;
                  _5600 = _5435;
                  _5601 = _5436;
                  __branch_chain_5419 = false;
                }
              }
              if (__branch_chain_5419) {
                if ((_120 < 1000.0f) && (_3828 == 0.0h)) {
                  if (!(abs(_223) > 0.9900000095367432f)) {
                    _5467 = -0.0f - _224;
                    _5469 = rsqrt(dot(float3(_5467, 0.0f, _222), float3(_5467, 0.0f, _222)));  // [sem: invLength]
                    _5473 = (_5469 * _5467);
                    _5474 = (_5469 * _222);
                  } else {
                    _5473 = 1.0f;
                    _5474 = 0.0f;
                  }
                  _5476 = -0.0f - (_223 * _5474);
                  _5479 = (_5474 * _222) - (_5473 * _224);
                  _5480 = _5473 * _223;
                  _5482 = rsqrt(dot(float3(_5476, _5479, _5480), float3(_5476, _5479, _5480)));  // [sem: invLength]
                  _5488 = _viewPos.x + _1008;
                  _5489 = _viewPos.z + _1010;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
                  _5494 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5473, 0.0f, _5474), float3(_5488, _3919, _5489)), dot(float3((_5482 * _5476), (_5479 * _5482), (_5482 * _5480)), float3(_5488, _3919, _5489))), 0.0f);
                  _5498 = _5494.x + -0.5f;
                  _5499 = _5494.y + -0.5f;
                  _5500 = _5494.z + -0.5f;
                  _5502 = rsqrt(dot(float3(_5498, _5499, _5500), float3(_5498, _5499, _5500)));  // [sem: invLength]
                  _5506 = (_5498 * _5502) + _4210;
                  _5507 = (_5499 * _5502) + _4211;
                  _5508 = (_5500 * _5502) + _4212;
                  _5510 = rsqrt(dot(float3(_5506, _5507, _5508), float3(_5506, _5507, _5508)));  // [sem: invLength]
                  _5511 = _5506 * _5510;
                  _5512 = _5507 * _5510;
                  _5513 = _5508 * _5510;
                  _5525 = abs(((_101 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
                  _5526 = abs(1.0f - ((_102 * 2.0f) * _bufferSizeAndInvSize.w));
                  _5529 = saturate(_5525 * _5525);  // [sem: expr_sat]
                  _5530 = saturate(_5526 * _5526);  // [sem: expr_sat]
                  _5544 = dot(float3((-0.0f - _5511), (-0.0f - _5512), (-0.0f - _5513)), float3(_4329, _4330, _4331));
                  _5546 = saturate(dot(float3(_5511, _5512, _5513), float3(_1710, _1711, _1712)));  // [sem: expr_sat]
                  _5548 = saturate(1.0f - _4350);  // [sem: expr_sat]
                  _5549 = _5548 * _5548;
                  _5551 = (_5549 * _5549) * _5548;
                  _5567 = 1.0f - ((_4349 * _4349) * 0.9998999834060669f);
                  _5574 = (max((((3.18309866997879e-05f / (_5567 * _5567)) * (0.5f / ((((_5546 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5544) + (_5546 * ((_5544 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5551, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5544)) + (exp2(log2(saturate(dot(float3(_1710, _1711, _1712), float3(_5511, _5512, _5513)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
                  _5579 = saturate(1.0f - (_120 * 0.0010000000474974513f)) * ((1.0f - ((_5530 * _5530) * (3.0f - (_5530 * 2.0f)))) * (1.0f - ((_5529 * _5529) * (3.0f - (_5529 * 2.0f)))));
                  _5593 = _5451;
                  _5594 = _5452;
                  _5595 = _5453;
                  _5596 = _5454;
                  _5597 = _5455;
                  _5598 = _5456;
                  _5599 = ((((_5579 * _4333) * _5457) * _5574) + _5448);
                  _5600 = ((((_5579 * _4334) * _5458) * _5574) + _5449);
                  _5601 = ((((_5579 * _4335) * _5459) * _5574) + _5450);
                } else {
                  _5593 = _5451;
                  _5594 = _5452;
                  _5595 = _5453;
                  _5596 = _5454;
                  _5597 = _5455;
                  _5598 = _5456;
                  _5599 = _5448;
                  _5600 = _5449;
                  _5601 = _5450;
                }
              }
            }
          }
        } else {
          _5420 = _5081;
          _5421 = _5082;
          _5422 = _5083;
          _5423 = _5420 * _4333;
          _5424 = _5421 * _4334;
          _5425 = _5422 * _4335;
          _5427 = (_5064 * _4333) * _3841;
          _5429 = (_5065 * _4334) * _3842;
          _5431 = (_5066 * _4335) * _3843;
          bool __branch_chain_5419;
          if (_4176 == 97) {
            _5448 = _5427;
            _5449 = _5429;
            _5450 = _5431;
            _5451 = _5423;
            _5452 = _5424;
            _5453 = _5425;
            _5454 = _5061;
            _5455 = _5062;
            _5456 = _5063;
            _5457 = _3841;
            _5458 = _3842;
            _5459 = _3843;
            __branch_chain_5419 = true;
          } else {
            _5434 = _5427;
            _5435 = _5429;
            _5436 = _5431;
            _5437 = _5423;
            _5438 = _5424;
            _5439 = _5425;
            _5440 = _5061;
            _5441 = _5062;
            _5442 = _5063;
            _5443 = _3841;
            _5444 = _3842;
            _5445 = _3843;
            if (_4176 == 98) {
              _5448 = _5434;
              _5449 = _5435;
              _5450 = _5436;
              _5451 = _5437;
              _5452 = _5438;
              _5453 = _5439;
              _5454 = _5440;
              _5455 = _5441;
              _5456 = _5442;
              _5457 = _5443;
              _5458 = _5444;
              _5459 = _5445;
              __branch_chain_5419 = true;
            } else {
              _5593 = _5437;
              _5594 = _5438;
              _5595 = _5439;
              _5596 = _5440;
              _5597 = _5441;
              _5598 = _5442;
              _5599 = _5434;
              _5600 = _5435;
              _5601 = _5436;
              __branch_chain_5419 = false;
            }
          }
          if (__branch_chain_5419) {
            if ((_120 < 1000.0f) && (_3828 == 0.0h)) {
              if (!(abs(_223) > 0.9900000095367432f)) {
                _5467 = -0.0f - _224;
                _5469 = rsqrt(dot(float3(_5467, 0.0f, _222), float3(_5467, 0.0f, _222)));  // [sem: invLength]
                _5473 = (_5469 * _5467);
                _5474 = (_5469 * _222);
              } else {
                _5473 = 1.0f;
                _5474 = 0.0f;
              }
              _5476 = -0.0f - (_223 * _5474);
              _5479 = (_5474 * _222) - (_5473 * _224);
              _5480 = _5473 * _223;
              _5482 = rsqrt(dot(float3(_5476, _5479, _5480), float3(_5476, _5479, _5480)));  // [sem: invLength]
              _5488 = _viewPos.x + _1008;
              _5489 = _viewPos.z + _1010;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
              _5494 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5473, 0.0f, _5474), float3(_5488, _3919, _5489)), dot(float3((_5482 * _5476), (_5479 * _5482), (_5482 * _5480)), float3(_5488, _3919, _5489))), 0.0f);
              _5498 = _5494.x + -0.5f;
              _5499 = _5494.y + -0.5f;
              _5500 = _5494.z + -0.5f;
              _5502 = rsqrt(dot(float3(_5498, _5499, _5500), float3(_5498, _5499, _5500)));  // [sem: invLength]
              _5506 = (_5498 * _5502) + _4210;
              _5507 = (_5499 * _5502) + _4211;
              _5508 = (_5500 * _5502) + _4212;
              _5510 = rsqrt(dot(float3(_5506, _5507, _5508), float3(_5506, _5507, _5508)));  // [sem: invLength]
              _5511 = _5506 * _5510;
              _5512 = _5507 * _5510;
              _5513 = _5508 * _5510;
              _5525 = abs(((_101 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
              _5526 = abs(1.0f - ((_102 * 2.0f) * _bufferSizeAndInvSize.w));
              _5529 = saturate(_5525 * _5525);  // [sem: expr_sat]
              _5530 = saturate(_5526 * _5526);  // [sem: expr_sat]
              _5544 = dot(float3((-0.0f - _5511), (-0.0f - _5512), (-0.0f - _5513)), float3(_4329, _4330, _4331));
              _5546 = saturate(dot(float3(_5511, _5512, _5513), float3(_1710, _1711, _1712)));  // [sem: expr_sat]
              _5548 = saturate(1.0f - _4350);  // [sem: expr_sat]
              _5549 = _5548 * _5548;
              _5551 = (_5549 * _5549) * _5548;
              _5567 = 1.0f - ((_4349 * _4349) * 0.9998999834060669f);
              _5574 = (max((((3.18309866997879e-05f / (_5567 * _5567)) * (0.5f / ((((_5546 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5544) + (_5546 * ((_5544 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5551, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5544)) + (exp2(log2(saturate(dot(float3(_1710, _1711, _1712), float3(_5511, _5512, _5513)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
              _5579 = saturate(1.0f - (_120 * 0.0010000000474974513f)) * ((1.0f - ((_5530 * _5530) * (3.0f - (_5530 * 2.0f)))) * (1.0f - ((_5529 * _5529) * (3.0f - (_5529 * 2.0f)))));
              _5593 = _5451;
              _5594 = _5452;
              _5595 = _5453;
              _5596 = _5454;
              _5597 = _5455;
              _5598 = _5456;
              _5599 = ((((_5579 * _4333) * _5457) * _5574) + _5448);
              _5600 = ((((_5579 * _4334) * _5458) * _5574) + _5449);
              _5601 = ((((_5579 * _4335) * _5459) * _5574) + _5450);
            } else {
              _5593 = _5451;
              _5594 = _5452;
              _5595 = _5453;
              _5596 = _5454;
              _5597 = _5455;
              _5598 = _5456;
              _5599 = _5448;
              _5600 = _5449;
              _5601 = _5450;
            }
          }
        }
      }
    }
    _5608 = _5593 + _3829;
    _5609 = _5594 + _3830;
    _5610 = _5595 + _3831;
    _5613 = _frameNumber.x * 13;
    [branch]
    if (((((int)(_5613 + _98)) | ((int)(_5613 + _100))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((int)(_98) >> 5), ((int)(_100) >> 5))] = float4((half)(half(_5608)), (half)(half(_5609)), (half)(half(_5610)), 1.0f);
    }
    _5628 = ((uint)(_4176 & 24) > (uint)23);
    if (_4244) {
      _5645 = saturate(exp2((_4239 * _4239) * (_120 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _5645 = select((_cavityParams.z > 0.0f), select(_179, 0.0f, _1699), 1.0f);  // [sem: expr_sat]
    }
    _5660 = select(_4241, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _5645) * select((_178 && _5628), (1.0f - _1699), 1.0f)));
    _5664 = min(60000.0f, (_5660 * (((_3540 * _3296) * _3545) - min(0.0f, (-0.0f - _5599)))));
    _5665 = min(60000.0f, (_5660 * (((_3541 * _3297) * _3545) - min(0.0f, (-0.0f - _5600)))));
    _5666 = min(60000.0f, (_5660 * (((_3542 * _3298) * _3545) - min(0.0f, (-0.0f - _5601)))));
    _5669 = 1.0f - _renderParams.x;
    _5676 = half((_renderParams.x * _4126) + _5669);
    _5677 = half((_renderParams.x * _4127) + _5669);
    _5678 = half((_renderParams.x * _4128) + _5669);
    if (_4241 && (_renderParams2.x == 0.0f)) {
      _5694 = (half)(exp2((half)((half)(log2(_5676)) * 0.5h)));
      _5695 = (half)(exp2((half)((half)(log2(_5677)) * 0.5h)));
      _5696 = (half)(exp2((half)((half)(log2(_5678)) * 0.5h)));
    } else {
      _5694 = _5676;
      _5695 = _5677;
      _5696 = _5678;
    }
    _5698 = _4275 || (_4176 == 55);
    _5699 = select(_5698, 0.0f, _3828);
    _5700 = float(_5694);
    _5701 = float(_5695);
    _5702 = float(_5696);
    if (_4213) {
      _5709 = saturate(((_5701 + _5700) + _5702) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _5709 = 1.0f;  // [sem: expr_sat]
    }
    _5710 = float(_5699);
    _5716 = (0.699999988079071f / min(max(max(max(_5700, _5701), _5702), 0.009999999776482582f), 0.699999988079071f)) * _5709;
    _5723 = ((_5716 * _5700) + -0.03999999910593033f) * _5710;
    _5724 = ((_5716 * _5701) + -0.03999999910593033f) * _5710;
    _5725 = ((_5716 * _5702) + -0.03999999910593033f) * _5710;
    _5726 = _5723 + 0.03999999910593033f;
    _5727 = _5724 + 0.03999999910593033f;
    _5728 = _5725 + 0.03999999910593033f;
    if (_4270 || (_4354 || (_4353 || _5698))) {
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
      _5737 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__3__40__0__0__g_samplerClamp, float2(min(0.9900000095367432f, _1718), (1.0f - max(0.019999999552965164f, float(_161)))), 0.0f);
      _5741 = _5737.x;
      _5742 = _5737.y;
    } else {
      _5741 = _3538;
      _5742 = _3539;
    }
    _5746 = (_5741 * _5726) + _5742;
    _5747 = (_5741 * _5727) + _5742;
    _5748 = (_5741 * _5728) + _5742;
    _5750 = (1.0f - _5741) - _5742;
    _5757 = ((0.9599999785423279f - _5723) * 0.0476190485060215f) + _5726;
    _5758 = ((0.9599999785423279f - _5724) * 0.0476190485060215f) + _5727;
    _5759 = ((0.9599999785423279f - _5725) * 0.0476190485060215f) + _5728;
    _5776 = saturate(1.0f - _3823);  // [sem: expr_sat]
    _5777 = (((_5746 * _5757) / (1.0f - (_5750 * _5757))) * _5750) * _5776;
    _5778 = (((_5747 * _5758) / (1.0f - (_5750 * _5758))) * _5750) * _5776;
    _5779 = (((_5748 * _5759) / (1.0f - (_5750 * _5759))) * _5750) * _5776;
    _5790 = float(1.0h - _5699);
    _5800 = half(((_5700 * _5790) * saturate((1.0f - _5746) - _5777)) + _5777);
    _5801 = half(((_5701 * _5790) * saturate((1.0f - _5747) - _5778)) + _5778);
    _5802 = half(((_5702 * _5790) * saturate((1.0f - _5748) - _5779)) + _5779);
    _5804 = float(_5800);
    _5805 = float(_5801);
    _5806 = float(_5802);
    if (_4176 == 65) {
      _5810 = max(9.999999974752427e-07f, _exposure2.x);
      _5818 = ((pow(_4347, 16.0f)) * 50.26548385620117f) / (((_5810 * _5810) * 1e+06f) + 1.0f);
      _5835 = (((((_5804 * _5608) * _5818) - _5608) * _1667) + _5608);
      _5836 = (((((_5805 * _5609) * _5818) - _5609) * _1667) + _5609);
      _5837 = (((((_5806 * _5610) * _5818) - _5610) * _1667) + _5610);
    } else {
      _5835 = _5608;
      _5836 = _5609;
      _5837 = _5610;
    }
    _5841 = (min(65535.0f, _5596) + _3832) + (_5835 * _5804);
    _5842 = (min(65535.0f, _5597) + _3833) + (_5836 * _5805);
    _5843 = (min(65535.0f, _5598) + _3834) + (_5837 * _5806);
    _5872 = exp2((saturate(_1034) * 20.0f) + -8.0f) + -0.00390625f;
    _5873 = _5872 * select((_1031 < 0.040449999272823334f), (_1031 * 0.07739938050508499f), exp2(log2((_1031 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5874 = _5872 * select((_1032 < 0.040449999272823334f), (_1032 * 0.07739938050508499f), exp2(log2((_1032 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5875 = _5872 * select((_1033 < 0.040449999272823334f), (_1033 * 0.07739938050508499f), exp2(log2((_1033 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5888 = ((_5873 * 0.6131200194358826f) + (_5874 * 0.3395099937915802f)) + (_5875 * 0.047370001673698425f);
    _5889 = ((_5873 * 0.07020000368356705f) + (_5874 * 0.9163600206375122f)) + (_5875 * 0.013450000435113907f);
    _5890 = ((_5873 * 0.02061999961733818f) + (_5874 * 0.10958000272512436f)) + (_5875 * 0.8697999715805054f);
    if (_967) {
      _5896 = (_5888 + _5841);
      _5897 = (_5889 + _5842);
      _5898 = (_5890 + _5843);
    } else {
      _5896 = _5841;
      _5897 = _5842;
      _5898 = _5843;
    }
    _5902 = _5896 + (_5664 * _5710);
    _5903 = _5897 + (_5665 * _5710);
    _5904 = _5898 + (_5666 * _5710);
    // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
    // Description: Crimson Desert 1.11 avoids averaging half-resolution history across a 2x2 quad that contains any invalid lane. This preserves the current lane value for mixed valid/invalid quads instead of blending in invalid neighbors.
    if (!(((_rndx_quadInvalid0 || _rndx_quadInvalid1) || _rndx_quadInvalid2) || _rndx_quadInvalid3)) {
      _5926 = ((((QuadReadLaneAt(_5902, 1) + QuadReadLaneAt(_5902, 0)) + QuadReadLaneAt(_5902, 2)) + QuadReadLaneAt(_5902, 3)) * 0.25f);
      _5927 = ((((QuadReadLaneAt(_5903, 1) + QuadReadLaneAt(_5903, 0)) + QuadReadLaneAt(_5903, 2)) + QuadReadLaneAt(_5903, 3)) * 0.25f);
      _5928 = ((((QuadReadLaneAt(_5904, 1) + QuadReadLaneAt(_5904, 0)) + QuadReadLaneAt(_5904, 2)) + QuadReadLaneAt(_5904, 3)) * 0.25f);
    } else {
      _5926 = _5902;
      _5927 = _5903;
      _5928 = _5904;
    }
    // RenoDX: <<< [Patch: Native111InvalidLaneParity]
    [branch]
    if (((_100 | _98) & 1) == 0) {
      _5933 = dot(float3(_5926, _5927, _5928), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((int)(_98) >> 1), ((int)(_100) >> 1))] = float4(min(60000.0f, _5926), min(60000.0f, _5927), min(60000.0f, _5928), min(60000.0f, select((_2296 != 0), (-0.0f - _5933), _5933)));
    }
    if (_5628) {
      _5955 = ((_5699 == 0.0h) && (!(((!(_5800 == 0.0h)) && (!(_5801 == 0.0h))) && (!(_5802 == 0.0h)))));
    } else {
      _5955 = false;
    }
    if ((_5628 || ((_4176 == 96) || (_4354 || ((_4176 & -4) == 64)))) || ((_120 <= 10.0f) && _4270)) {
      __3__38__0__1__g_sceneSpecularUAV[int2(_98, _100)] = float4(((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _5664)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _5665)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _5666)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _3306)))))));
      _5988 = _5896;
      _5989 = _5897;
      _5990 = _5898;
    } else {
      _5988 = (_5896 + _5664);
      _5989 = (_5897 + _5665);
      _5990 = (_5898 + _5666);
    }
    if (!(((uint)(_4176 + -53) < (uint)15) || (!_967))) {
      _5996 = dot(float3(_5888, _5889, _5890), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _6000 = max((max(_5996, 1.0f) / max(_5996, 0.10000000149011612f)), 0.0f);
      _6011 = ((_5988 - _5888) + (_6000 * _5888));
      _6012 = ((_5989 - _5889) + (_6000 * _5889));
      _6013 = ((_5990 - _5890) + (_6000 * _5890));
    } else {
      _6011 = _5988;
      _6012 = _5989;
      _6013 = _5990;
    }
    _6014 = min(60000.0f, _6011);
    _6015 = min(60000.0f, _6012);
    _6016 = min(60000.0f, _6013);
    // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
    // Description: Because the 1.11 RenderDiffuseTiled body can run for invalid lanes in partially valid quads, this guard preserves vanilla 1.11 behavior by preventing invalid pixels from reading, accumulating, or storing full-resolution scene color.
    if (!_rndx_invalidPixel) {
    [branch]
    if (_5955) {
      _6020 = __3__38__0__1__g_sceneColorUAV[int2(_98, _100)].x;
      _6021 = __3__38__0__1__g_sceneColorUAV[int2(_98, _100)].y;
      _6022 = __3__38__0__1__g_sceneColorUAV[int2(_98, _100)].z;
      _6027 = (_6020 + _6014);
      _6028 = (_6021 + _6015);
      _6029 = (_6022 + _6016);
    } else {
      _6027 = _6014;
      _6028 = _6015;
      _6029 = _6016;
    }
    if (!(_renderParams.y == 0.0f)) {
      _6038 = dot(float3(_6027, _6028, _6029), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _6039 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _6038);
      _6043 = max(9.999999717180685e-10f, _6038);
      _6048 = ((_6039 * _6027) / _6043);
      _6049 = ((_6039 * _6028) / _6043);
      _6050 = ((_6039 * _6029) / _6043);
    } else {
      _6048 = _6027;
      _6049 = _6028;
      _6050 = _6029;
    }
    // RenoDX: >>> [Patch: FoliageFinalAO] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x353D4158 is a 1.10 direct diffuse sibling that can otherwise leave foliage pixels using vanilla direct-light AO while adjacent RenderDiffuseTiled siblings receive RenoDX foliage AO. Apply the same final direct-lit AO darkening for foliage stencil materials, using vanilla blended scene AO and shadow visibility so direct light remains naturally occluded.
    if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_116 - 12) < 7u)) {
      half4 _rndx_shadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_98, _100, 0));
      float _rndx_directRatio = saturate(dot(float3(_rndx_shadow.xyz), float3(0.333f, 0.333f, 0.333f)));
      float _rndx_ao = lerp(1.0f, saturate(_1645), _rndx_directRatio * FOLIAGE_AO_STRENGTH);
      _6048 *= _rndx_ao;
      _6049 *= _rndx_ao;
      _6050 *= _rndx_ao;
    }
    // RenoDX: <<< [Patch: FoliageFinalAO]
    __3__38__0__1__g_sceneColorUAV[int2(_98, _100)] = float4(_6048, _6049, _6050, 1.0f);
    }
    // RenoDX: <<< [Patch: Native111InvalidLaneParity]
  }
}
