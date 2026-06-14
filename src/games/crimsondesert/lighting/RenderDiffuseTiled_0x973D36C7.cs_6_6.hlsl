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

Texture2D<float4> __3__36__0__0__g_sceneSpecularHalf : register(t62, space36);

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
  int _70;
  int _71;
  int4 _79;
  int _89;
  int _93;
  uint _99;
  uint _101;
  float _102;
  float _103;
  float _104;
  float _105;
  float _109;
  float _110;
  float _112;
  uint2 _115;
  int _117;
  float _120;
  float _121;
  int _442;
  half _482;
  half _483;
  half _484;
  half _485;
  half _493;
  half _494;
  half _495;
  half _496;
  int _497;
  int _498;
  float _499;
  float _500;
  bool _595;
  float _812;
  float _813;
  float _1032;
  float _1033;
  float _1034;
  float _1035;
  float _1057;
  float _1058;
  float _1059;
  float _1060;
  float _1061;
  int _1067;
  half _1068;
  float _1069;
  float _1070;
  float _1071;
  float _1072;
  float _1073;
  float _1102;
  half _1103;
  float _1105;
  float _1131;
  float _1132;
  float _1139;
  float _1140;
  float _1141;
  float _1142;
  half _1143;
  float _1149;
  float _1150;
  float _1151;
  float _1152;
  half _1153;
  half _1214;
  float _1231;
  float _1647;
  half _1648;
  float _1649;
  float _1650;
  float _1651;
  int _1652;
  float _1653;
  float _1654;
  float _1655;
  float _1656;
  float _1657;
  float _1658;
  bool _1711;
  bool _1714;
  bool _1715;
  float _1733;
  float _1744;
  float _1745;
  float _1755;
  float _1756;
  half _1757;
  half _1758;
  half _1759;
  half _1760;
  half _1761;
  float _1773;
  bool _1796;
  float _1805;
  float _1846;
  float _1847;
  float _1932;
  float _2010;
  bool _2113;
  float _2185;
  float _2186;
  float _2187;
  float _2188;
  float _2351;
  int _2352;
  float _2409;
  float _2421;
  float _2534;
  float _2535;
  float _2536;
  float _2537;
  float _2539;
  float _2540;
  float _2541;
  float _2542;
  float _2546;
  float _2547;
  float _2548;
  float _2549;
  float _2550;
  float _2575;
  float _2599;
  bool _2610;
  half _2640;
  int _2641;
  float _2642;
  float _2643;
  float _2644;
  float _2914;
  float _2933;
  float _2937;
  float _2969;
  float _3014;
  float _3015;
  float _3016;
  float _3017;
  float _3023;
  float _3024;
  float _3025;
  float _3026;
  float _3029;
  float _3030;
  float _3031;
  float _3032;
  half _3033;
  float _3185;
  int _3186;
  int _3187;
  float _3188;
  float _3189;
  float _3190;
  float _3191;
  float _3324;
  float _3325;
  float _3326;
  float _3387;
  float _3397;
  float _3398;
  float _3399;
  float _3444;
  float _3445;
  float _3577;
  float _3578;
  float _3579;
  float _3594;
  float _3595;
  float _3596;
  float _3597;
  float _3598;
  bool _3664;
  bool _3665;
  float _3701;
  float _3702;
  float _3703;
  float _3704;
  float _3770;
  float _3773;
  float _3774;
  float _3775;
  float _3776;
  float _3811;
  float _3812;
  float _3813;
  float _3828;
  float _3857;
  float _3858;
  float _3859;
  float _3860;
  float _3861;
  half _3868;
  half _3869;
  half _3870;
  half _3871;
  half _3872;
  float _3873;
  float _3879;
  half _3880;
  half _3881;
  half _3882;
  half _3883;
  half _3884;
  float _3885;
  float _3886;
  float _3887;
  float _3888;
  float _3889;
  float _3890;
  half _3931;
  half _3932;
  half _3933;
  float _3948;
  float _3949;
  float _3950;
  float _3970;
  float _4030;
  float _4128;
  float _4129;
  float _4130;
  bool _4190;
  bool _4211;
  bool _4213;
  bool _4214;
  float _4231;
  int _4232;
  float _4233;
  float _4234;
  float _4235;
  float _4236;
  float _4237;
  float _4276;
  float _4313;
  float _4320;
  float _4321;
  float _4322;
  bool _4343;
  bool _4345;
  bool _4349;
  int _4350;
  float _4351;
  bool _4360;
  int _4361;
  float _4362;
  float _4365;
  int _4366;
  bool _4367;
  bool _4368;
  float _4385;
  float _4386;
  float _4387;
  float _4428;
  float _4699;
  float _4700;
  float _4701;
  float _4702;
  float _4703;
  float _4704;
  float _4705;
  float _4706;
  float _4707;
  float _4877;
  float _4878;
  float _4879;
  float _4880;
  float _4881;
  float _4882;
  float _4883;
  float _4884;
  float _4885;
  float _4975;
  float _4976;
  float _4977;
  float _5044;
  float _5045;
  float _5046;
  float _5047;
  float _5048;
  float _5049;
  float _5094;
  float _5095;
  float _5096;
  float _5097;
  float _5098;
  float _5099;
  float _5100;
  float _5101;
  float _5102;
  float _5117;
  float _5118;
  float _5119;
  float _5120;
  float _5121;
  float _5122;
  float _5123;
  float _5124;
  float _5125;
  float _5137;
  float _5138;
  float _5139;
  float _5455;
  float _5481;
  float _5482;
  float _5483;
  float _5484;
  float _5485;
  float _5486;
  float _5487;
  float _5488;
  float _5489;
  float _5500;
  float _5501;
  float _5502;
  float _5503;
  float _5504;
  float _5505;
  float _5506;
  float _5507;
  float _5508;
  float _5509;
  float _5510;
  float _5511;
  float _5525;
  float _5526;
  float _5645;
  float _5646;
  float _5647;
  float _5648;
  float _5649;
  float _5650;
  float _5651;
  float _5652;
  float _5653;
  float _5697;
  half _5746;
  half _5747;
  half _5748;
  float _5761;
  float _5793;
  float _5794;
  float _5887;
  float _5888;
  float _5889;
  float _5948;
  float _5949;
  float _5950;
  bool _6007;
  float _6040;
  float _6041;
  float _6042;
  float _6063;
  float _6064;
  float _6065;
  float _6079;
  float _6080;
  float _6081;
  float _6100;
  float _6101;
  float _6102;
  uint4 _129;
  float4 _135;
  half _144;
  half _148;
  half _153;
  half _157;
  half _162;
  half _166;
  uint _178;
  bool _179;
  bool _180;
  float _190;
  float _191;
  float _192;
  float _194;
  half _198;
  half _199;
  half _200;
  half _203;
  half _204;
  float _209;
  float _210;
  float _214;
  float _216;
  float _223;
  float _224;
  float _225;
  float _227;
  float _230;
  float _231;
  float _232;
  float _233;
  float _239;
  float _240;
  float _241;
  float _242;
  half _254;
  half _255;
  half _256;
  half _258;
  half _259;
  half _260;
  half _261;
  half _265;
  half _266;
  half _267;
  half _283;
  half _284;
  half _285;
  bool _290;
  half _292;
  uint _309;
  uint _317;
  uint _325;
  uint _333;
  uint _341;
  uint _349;
  uint _357;
  uint _365;
  uint _373;
  uint _381;
  uint _389;
  uint _397;
  uint _405;
  uint _413;
  uint _421;
  uint _429;
  int _471;
  int _472;
  int4 _503;
  int _508;
  int _512;
  int _516;
  int _520;
  float _545;
  float _550;
  float _551;
  float _552;
  float _553;
  int _554;
  int _555;
  int _556;
  int _557;
  float _597;
  float _602;
  int _615;
  bool _618;
  int4 _647;
  float _666;
  float _667;
  float _668;
  float _670;
  float _674;
  float _675;
  float _676;
  float _692;
  float _693;
  float _694;
  float _696;
  float _715;
  float _716;
  float _717;
  float _719;
  float _738;
  float _739;
  float _740;
  float _742;
  bool _747;
  float _748;
  float _761;
  float _762;
  float _763;
  float _764;
  float _769;
  float _772;
  float _775;
  float _778;
  float _781;
  float _814;
  float _815;
  float _816;
  float _817;
  float _818;
  float _819;
  float _820;
  float _821;
  bool _830;
  float _839;
  float _840;
  float _841;
  float _842;
  float _843;
  float _844;
  float _849;
  float _850;
  float _851;
  float _852;
  float _856;
  float _865;
  float _866;
  float _867;
  float _868;
  half4 _870;
  uint _880;
  half4 _881;
  uint _894;
  half4 _895;
  half4 _908;
  float _918;
  float _919;
  float _920;
  float4 _922;
  float4 _929;
  float4 _939;
  float4 _949;
  bool _968;
  float _970;
  float _972;
  float _1008;
  float _1009;
  float _1010;
  float _1011;
  float _1013;
  float _1014;
  float _1015;
  float _1016;
  bool _1017;
  bool _1019;
  float4 _1026;
  uint _1042;
  int _1044;
  float4 _1051;
  bool _1077;
  float _1084;
  float _1115;
  float _1116;
  float _1118;
  float _1119;
  float _1120;
  float _1134;
  float4 _1155;
  float4 _1162;
  float4 _1172;
  float4 _1182;
  float _1195;
  float _1196;
  float _1197;
  float _1199;
  float _1200;
  float _1201;
  float _1202;
  float _1215;
  float _1232;
  float _1233;
  float _1234;
  float _1235;
  float _1236;
  float _1237;
  float _1238;
  float _1239;
  float _1245;
  float _1249;
  float _1250;
  float _1251;
  float _1255;
  float _1256;
  float _1257;
  float _1264;
  float _1274;
  float _1275;
  float _1276;
  float _1277;
  float _1278;
  float _1279;
  float _1288;
  float _1293;
  float _1299;
  float _1300;
  float _1304;
  float _1305;
  float _1310;
  float _1311;
  float _1312;
  float _1313;
  float _1325;
  float _1329;
  float _1339;
  float _1340;
  float _1344;
  float _1346;
  float _1347;
  float _1360;
  float _1370;
  float _1371;
  float _1372;
  float _1381;
  float2 _1390;
  float2 _1393;
  float2 _1396;
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
  float _1420;
  float _1430;
  float _1431;
  float _1432;
  float _1433;
  float _1434;
  float _1435;
  float _1443;
  float _1444;
  float _1445;
  float _1446;
  float _1448;
  float _1449;
  float _1450;
  float _1451;
  float _1452;
  float _1453;
  float _1456;
  float _1457;
  float _1458;
  float _1468;
  float _1491;
  float _1495;
  float _1499;
  float _1517;
  float _1524;
  float _1525;
  float _1526;
  float _1535;
  float _1542;
  float _1549;
  float _1577;
  float _1578;
  float _1579;
  float _1580;
  float _1581;
  float _1591;
  float _1592;
  float _1593;
  float4 _1595;
  float4 _1602;
  float4 _1612;
  float4 _1622;
  float _1665;
  float _1666;
  float _1667;
  half2 _1669;
  half2 _1676;
  half2 _1685;
  half2 _1694;
  float _1701;
  bool _1708;
  bool _1720;
  bool _1721;
  float _1723;
  bool _1726;
  bool _1728;
  uint _1735;
  half _1746;
  bool _1750;
  int _1762;
  bool _1763;
  bool _1764;
  bool _1765;
  float _1766;
  float _1767;
  float _1768;
  float _1769;
  float _1774;
  bool _1776;
  float _1833;
  float2 _1840;
  float _1849;
  float _1852;
  float _1853;
  float _1861;
  float _1866;
  float _1867;
  int _1870;
  int _1871;
  float _1872;
  float _1873;
  float _1876;
  float _1877;
  int4 _1879;
  int _1902;
  float _1940;
  float _1941;
  float _1942;
  float _1943;
  float _1947;
  float _1964;
  float _1965;
  float _1968;
  bool _1983;
  float _1985;
  float _1987;
  bool _1991;
  float _2018;
  float _2023;
  float _2024;
  float _2025;
  float _2026;
  float _2027;
  float _2028;
  float _2029;
  float _2030;
  float _2032;
  float _2045;
  float _2046;
  float _2047;
  float _2048;
  int _2050;
  int _2051;
  int _2052;
  int _2053;
  bool _2092;
  bool _2093;
  bool _2094;
  bool _2095;
  int _2107;
  bool _2122;
  bool _2144;
  bool _2151;
  int4 _2190;
  float _2209;
  float _2210;
  float _2211;
  float _2213;
  float _2218;
  float _2233;
  float _2234;
  float _2235;
  float _2237;
  float _2242;
  float _2257;
  float _2258;
  float _2259;
  float _2261;
  float _2266;
  float _2281;
  float _2282;
  float _2283;
  float _2285;
  float _2290;
  float _2293;
  float _2310;
  float _2311;
  float _2312;
  float _2313;
  float _2318;
  float _2320;
  float _2322;
  float _2324;
  float _2326;
  float _2327;
  float _2328;
  float _2329;
  int _2332;
  int _2333;
  int _2341;
  int _2343;
  float _2362;
  uint _2363;
  half4 _2365;
  uint _2370;
  half4 _2371;
  half4 _2376;
  half4 _2381;
  float _2386;
  float _2395;
  float _2400;
  float _2413;
  float _2416;
  bool _2417;
  bool _2422;
  float _2423;
  float _2425;
  float4 _2436;
  float _2441;
  float _2443;
  float _2444;
  float _2445;
  float _2446;
  float _2447;
  float _2448;
  float _2490;
  float _2507;
  float _2508;
  float _2509;
  float _2514;
  float _2529;
  float _2557;
  float _2558;
  float _2559;
  float _2566;
  float _2567;
  float _2568;
  float _2576;
  float _2582;
  float _2592;
  float _2593;
  float _2594;
  bool _2602;
  bool _2612;
  half _2615;
  uint _2625;
  int _2627;
  float4 _2634;
  float _2646;
  float _2650;
  float _2651;
  float _2652;
  float _2654;
  float _2655;
  float _2656;
  float _2657;
  float _2662;
  float _2664;
  float _2665;
  float _2666;
  float _2667;
  float _2672;
  float _2677;
  float _2679;
  float _2681;
  float _2705;
  float _2709;
  float _2713;
  float _2717;
  float _2755;
  float _2756;
  float _2757;
  float _2761;
  float _2797;
  float _2808;
  float _2809;
  float _2810;
  float _2811;
  float _2815;
  float _2816;
  float _2817;
  float _2833;
  float _2834;
  float _2835;
  float _2836;
  float _2837;
  float _2838;
  float _2839;
  bool _2842;
  float _2844;
  float _2848;
  float _2849;
  float _2853;
  float _2858;
  int _2864;
  bool _2867;
  float _2870;
  float _2874;
  float _2879;
  float _2905;
  float _2916;
  float _2922;
  float _2946;
  float _2959;
  half _2972;
  float _2990;
  float _3001;
  float _3002;
  float _3003;
  float _3004;
  float _3005;
  float _3006;
  float _3007;
  float _3008;
  float _3034;
  float _3035;
  float _3036;
  float _3049;
  float _3050;
  float _3051;
  float _3052;
  float _3077;
  float _3078;
  float _3079;
  float _3080;
  bool _3082;
  float _3095;
  float _3098;
  float _3099;
  float _3109;
  float _3110;
  int _3113;
  int _3114;
  float _3115;
  float _3116;
  int4 _3126;
  int _3133;
  float _3150;
  float _3151;
  float _3152;
  float _3153;
  float _3168;
  float _3169;
  float _3170;
  float _3171;
  bool _3192;
  uint _3193;
  half4 _3195;
  float _3208;
  uint _3214;
  half4 _3215;
  float _3228;
  half4 _3238;
  float _3251;
  half4 _3261;
  float _3274;
  float _3298;
  float _3300;
  float _3302;
  float _3304;
  float _3305;
  float _3312;
  float _3319;
  float _3327;
  float _3328;
  float _3329;
  float _3342;
  float _3352;
  float _3353;
  float _3354;
  float _3362;
  float _3367;
  bool _3368;
  int _3370;
  bool _3390;
  float _3391;
  float2 _3414;
  float2 _3420;
  float _3427;
  float _3428;
  float _3430;
  float _3438;
  float _3440;
  float _3447;
  float _3450;
  float _3451;
  float _3453;
  float _3461;
  float _3462;
  float _3463;
  float4 _3468;
  float _3472;
  float _3473;
  float _3474;
  float _3476;
  float _3480;
  float _3481;
  float _3482;
  float _3484;
  float2 _3497;
  float _3504;
  float _3514;
  float2 _3519;
  float2 _3524;
  float _3528;
  float _3530;
  float _3547;
  float _3551;
  float _3552;
  float _3553;
  float _3560;
  float2 _3584;
  float _3601;
  float _3608;
  float _3609;
  float _3610;
  float _3635;
  float4 _3645;
  bool _3675;
  float4 _3695;
  float _3711;
  float _3714;
  float _3727;
  float _3728;
  float _3729;
  float _3734;
  float _3739;
  float _3750;
  float _3768;
  float _3780;
  bool _3781;
  float _3784;
  float _3829;
  float _3830;
  float _3831;
  float _3836;
  float _3839;
  float _3846;
  float _3847;
  half4 _3892;
  float _3897;
  float _3898;
  float _3899;
  uint _3903;
  float _3919;
  float _3920;
  float _3921;
  float _3923;
  bool _3936;
  float _3975;
  float _3976;
  float _3980;
  float _3982;
  float _3987;
  float _3992;
  float _4000;
  float _4007;
  float2 _4035;
  float _4057;
  float _4075;
  float _4076;
  float _4077;
  float _4093;
  float _4101;
  float _4113;
  float _4116;
  float _4122;
  float _4150;
  float _4152;
  float _4159;
  float _4160;
  float _4161;
  float _4162;
  float _4182;
  float _4183;
  float _4184;
  float _4192;
  float _4193;
  bool _4196;
  bool _4199;
  float _4200;
  bool _4208;
  float _4215;
  float _4216;
  float _4217;
  uint16_t _4219;
  float _4242;
  float _4243;
  float _4244;
  float _4245;
  float _4256;
  float _4261;
  float _4262;
  float _4263;
  float _4265;
  float _4266;
  float _4267;
  float _4268;
  bool _4269;
  float _4282;
  float _4292;
  float _4293;
  float _4294;
  float _4295;
  int _4296;
  bool _4297;
  bool _4300;
  float _4314;
  float _4323;
  float _4324;
  bool _4326;
  float _4328;
  float _4329;
  float _4330;
  bool _4331;
  bool _4333;
  int _4334;
  float _4373;
  float _4388;
  float _4389;
  float _4390;
  float _4391;
  float _4392;
  float _4393;
  float _4394;
  float _4396;
  float _4397;
  float _4398;
  float _4399;
  float _4400;
  float _4401;
  float _4403;
  float _4405;
  float _4406;
  float _4408;
  bool _4409;
  bool _4410;
  bool _4411;
  float _4446;
  float _4450;
  float4 _4455;
  float _4459;
  float _4460;
  float _4461;
  float _4462;
  float _4473;
  float _4474;
  float _4480;
  float _4484;
  float _4485;
  float _4486;
  float _4490;
  float _4491;
  float _4492;
  float _4499;
  float _4503;
  float _4510;
  float _4511;
  float _4512;
  float _4513;
  float _4514;
  float _4515;
  float _4517;
  float _4531;
  float _4532;
  float _4539;
  float _4548;
  float _4553;
  float _4559;
  float _4560;
  float _4564;
  float _4565;
  float _4570;
  float _4571;
  float _4572;
  float _4573;
  float _4585;
  float _4589;
  float _4599;
  float _4600;
  float _4604;
  float _4606;
  float _4607;
  float _4620;
  float _4627;
  float _4628;
  float _4638;
  float _4649;
  float _4654;
  float _4673;
  float _4675;
  float _4677;
  float _4679;
  float _4686;
  float _4687;
  float _4688;
  float _4695;
  float _4696;
  float _4697;
  bool _4709;
  float _4724;
  float _4730;
  float _4731;
  float _4732;
  float _4733;
  float _4734;
  float _4735;
  float _4736;
  float _4743;
  float _4756;
  float _4759;
  float _4760;
  float _4762;
  float _4765;
  float _4766;
  float _4767;
  float _4771;
  float _4772;
  float _4773;
  float _4774;
  float _4775;
  float _4776;
  float _4788;
  float _4792;
  float _4796;
  float _4797;
  float _4798;
  float _4799;
  float _4811;
  float _4815;
  float _4831;
  float _4836;
  float _4837;
  float _4847;
  float _4872;
  float _4888;
  float _4889;
  float _4890;
  float _4891;
  float _4894;
  float _4895;
  float _4896;
  float _4901;
  float _4902;
  float _4929;
  float _4932;
  float _4933;
  float _4935;
  float _4938;
  float _4939;
  float _4943;
  float _4944;
  float _4945;
  float _4947;
  float _4948;
  float _4960;
  float _4964;
  bool _4978;
  float _4985;
  float _4997;
  float _5001;
  float _5008;
  float _5021;
  float _5030;
  float _5053;
  float _5054;
  float _5055;
  float _5056;
  float _5057;
  float _5058;
  bool _5060;
  float _5103;
  float _5104;
  float _5105;
  float _5106;
  float _5107;
  float _5108;
  float _5129;
  float _5141;
  float _5145;
  float _5146;
  float _5148;
  float _5153;
  float _5161;
  float _5167;
  float _5169;
  float _5174;
  float _5188;
  float _5198;
  float _5201;
  float _5203;
  float _5219;
  float _5220;
  float _5221;
  float _5228;
  float2 _5237;
  float2 _5240;
  float2 _5243;
  float _5252;
  float _5253;
  float _5254;
  float _5255;
  float _5256;
  float _5257;
  float _5258;
  float _5259;
  float _5260;
  float _5261;
  float _5262;
  float _5263;
  float _5264;
  float _5265;
  float _5266;
  float _5267;
  float _5268;
  float _5269;
  float _5279;
  float _5280;
  float _5281;
  float _5282;
  float _5283;
  float _5284;
  float _5292;
  float _5293;
  float _5294;
  float _5295;
  float _5297;
  float _5298;
  float _5299;
  float _5300;
  float _5301;
  float _5302;
  float _5306;
  float _5307;
  float _5317;
  float _5340;
  float _5344;
  float _5348;
  float _5366;
  float _5373;
  float _5374;
  float _5375;
  float _5379;
  float _5386;
  float _5393;
  float _5403;
  float _5424;
  float _5456;
  float _5466;
  float _5490;
  float _5491;
  float _5492;
  float _5494;
  float _5496;
  float _5498;
  float _5519;
  float _5521;
  float _5528;
  float _5531;
  float _5532;
  float _5534;
  float _5540;
  float _5541;
  float4 _5546;
  float _5550;
  float _5551;
  float _5552;
  float _5554;
  float _5558;
  float _5559;
  float _5560;
  float _5562;
  float _5563;
  float _5564;
  float _5565;
  float _5577;
  float _5578;
  float _5581;
  float _5582;
  float _5596;
  float _5598;
  float _5600;
  float _5601;
  float _5603;
  float _5619;
  float _5626;
  float _5631;
  float _5660;
  float _5661;
  float _5662;
  uint _5665;
  bool _5680;
  float _5712;
  float _5716;
  float _5717;
  float _5718;
  float _5721;
  half _5728;
  half _5729;
  half _5730;
  bool _5750;
  half _5751;
  float _5752;
  float _5753;
  float _5754;
  float _5762;
  float _5768;
  float _5775;
  float _5776;
  float _5777;
  float _5778;
  float _5779;
  float _5780;
  float2 _5789;
  float _5798;
  float _5799;
  float _5800;
  float _5802;
  float _5809;
  float _5810;
  float _5811;
  float _5828;
  float _5829;
  float _5830;
  float _5831;
  float _5842;
  half _5852;
  half _5853;
  half _5854;
  float _5856;
  float _5857;
  float _5858;
  float _5862;
  float _5870;
  float _5893;
  float _5894;
  float _5895;
  float _5924;
  float _5925;
  float _5926;
  float _5927;
  float _5940;
  float _5941;
  float _5942;
  float _5954;
  float _5955;
  float _5956;
  float _5978;
  float _5979;
  float _5980;
  float _5985;
  float _6048;
  float _6052;
  float _6066;
  float _6067;
  float _6068;
  float _6072;
  float _6073;
  float _6074;
  float _6090;
  float _6091;
  float _6095;
  int _56[4];
  _70 = (int)(SV_GroupID.x) & 15;
  _71 = (uint)(_70) >> 2;
  _79 = asint(__3__35__0__0__TileConstantBuffer_raw_uint[((int)((uint)(SV_GroupID.x) >> 7))]);
  _56[0] = _79.x;
  _56[1] = _79.y;
  _56[2] = _79.z;
  _56[3] = _79.w;
  _89 = _56[min((uint)((((uint)(SV_GroupID.x) >> 5) & 3)), 3u)];
  _93 = select((((int)(SV_GroupID.x) & 16) == 0), _89, ((uint)(_89) >> 16));
  _99 = (((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)(_93 << 5)) & 8160));
  _101 = (((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)(_93) >> 3) & 8160));
  _102 = (float)((uint)_99);
  _103 = (float)((uint)_101);
  _104 = _102 + 0.5f;
  _105 = _103 + 0.5f;
  _109 = _bufferSizeAndInvSize.z * _104;
  _110 = _105 * _bufferSizeAndInvSize.w;
  _112 = __3__36__0__0__g_depth.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_depth_load]
  _115 = __3__36__0__0__g_stencil.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_stencil_load]
  _117 = _115.x & 127;  // [sem: _3__36__0__0__g_stencil_load_derived]
  _120 = max(1.0000000116860974e-07f, _112.x);  // [sem: _3__36__0__0__g_depth_load_derived]
  _121 = _nearFarProj.x / _120;
  // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
  // Description: Crimson Desert 1.11 changed RenderDiffuseTiled to evaluate partially valid 2x2 quads while preserving the original per-pixel invalid predicate for full-resolution scene-color writes. This block computes the per-pixel invalid flag and quad-lane validity flags used by the 1.11 half-resolution history fallback.
  bool _rndx_invalidPixel = (((_112.x < 1.0000000116860974e-07f) || (_112.x == 1.0f)) || (_117 == 10));
  float _rndx_invalidPixelF = (float)((bool)_rndx_invalidPixel);
  bool _rndx_quadInvalid0 = !(QuadReadLaneAt(_rndx_invalidPixelF, 0) == 0.0f);
  bool _rndx_quadInvalid1 = !(QuadReadLaneAt(_rndx_invalidPixelF, 1) == 0.0f);
  bool _rndx_quadInvalid2 = !(QuadReadLaneAt(_rndx_invalidPixelF, 2) == 0.0f);
  bool _rndx_quadInvalid3 = !(QuadReadLaneAt(_rndx_invalidPixelF, 3) == 0.0f);
  // RenoDX: <<< [Patch: Native111InvalidLaneParity]
  if (!(((_rndx_quadInvalid0 && _rndx_quadInvalid1) && _rndx_quadInvalid2) && _rndx_quadInvalid3)) {
    _129 = __3__36__0__0__g_baseColor.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_baseColor_load]
    _135 = __3__36__0__0__g_normal.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_normal_load]
    _144 = half(((float)((uint)((uint)(((uint)((uint)(_129.x)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _148 = half(((float)((uint)((uint)(_129.x & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _153 = half(((float)((uint)((uint)(((uint)((uint)(_129.y)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _157 = half(((float)((uint)((uint)(_129.y & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _162 = half(((float)((uint)((uint)(((uint)((uint)(_129.z)) >> 8) & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _166 = half(((float)((uint)((uint)(_129.z & 255)))) * 0.003921568859368563f);  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _178 = uint((_135.w * 3.0f) + 0.5f);  // [sem: _3__36__0__0__g_normal_load_derived]
    _179 = (_178 == 1);
    _180 = (_178 == 3);
    _190 = (saturate(_135.x * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _191 = (saturate(_135.y * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _192 = (saturate(_135.z * 1.0009784698486328f) * 2.0f) + -1.0f;  // [sem: _3__36__0__0__g_normal_load_derived]
    _194 = rsqrt(dot(float3(_190, _191, _192), float3(_190, _191, _192)));  // [sem: invLength]
    _198 = half(_194 * _190);
    _199 = half(_194 * _191);
    _200 = half(_192 * _194);
  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _203 = ((half)((half)(half(((float)((uint)((uint)(((uint)((uint)(_129.w)) >> 8) & 255)))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;
    _204 = ((half)((half)(half(((float)((uint)((uint)(_129.w & 255)))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;  // [sem: _3__36__0__0__g_baseColor_load_derived]
    _209 = float(_203 + _204) * 0.5f;
    _210 = float(_203 - _204) * 0.5f;
    _214 = (1.0f - abs(_209)) - abs(_210);
    _216 = rsqrt(dot(float3(_209, _210, _214), float3(_209, _210, _214)));  // [sem: invLength]
    _223 = float(_198);
    _224 = float(_199);
    _225 = float(_200);
    _227 = select((_200 >= 0.0h), 1.0f, -1.0f);
    _230 = -0.0f - (1.0f / (_227 + _225));
    _231 = _224 * _230;
    _232 = _231 * _223;
    _233 = _227 * _223;
    _239 = -0.0f - _224;
    _240 = float(half(_216 * _209));
    _241 = float(half(_216 * _210));
    _242 = float(half(_216 * _214));
    _254 = half(mad(_242, _223, mad(_241, _232, (_240 * (((_233 * _223) * _230) + 1.0f)))));
    _255 = half(mad(_242, _224, mad(_241, ((_231 * _224) + _227), ((_240 * _227) * _232))));
    _256 = half(mad(_242, _225, mad(_241, _239, (-0.0f - (_233 * _240)))));
    _258 = rsqrt((half)(dot(half3(_254, _255, _256), half3(_254, _255, _256))));  // [sem: invLength]
    _259 = _258 * _254;
    _260 = _258 * _255;
    _261 = _258 * _256;
    _265 = saturate((half)(_144 * _144));  // [sem: expr_sat]
    _266 = saturate((half)(_148 * _148));  // [sem: expr_sat]
    _267 = saturate((half)(_153 * _153));  // [sem: expr_sat]
  // [sem: expr_sat]
    _283 = saturate((half)(((half)(((half)(_266 * 0.3395996h)) + ((half)(_265 * 0.61328125h)))) + ((half)(_267 * 0.04736328h))));
  // [sem: expr_sat]
    _284 = saturate((half)(((half)(((half)(_266 * 0.9165039h)) + ((half)(_265 * 0.07019043h)))) + ((half)(_267 * 0.013450623h))));
  // [sem: expr_sat]
    _285 = saturate((half)(((half)(((half)(_266 * 0.109558105h)) + ((half)(_265 * 0.020614624h)))) + ((half)(_267 * 0.8696289h))));
    if ((uint)(_117 + -65) < (uint)2) {
      _482 = _157;
      _483 = _198;
      _484 = _199;
      _485 = _200;
      _493 = _482;
      _494 = _483;
      _495 = _484;
      _496 = _485;
      _497 = ((int)((int)((uint)(max((int)(1), (int)(_99))) + (uint)(-1))) >> 1);
      _498 = ((int)((int)((uint)(max((int)(1), (int)(_101))) + (uint)(-1))) >> 1);
      _499 = _109;
      _500 = _110;
    } else {
      _290 = (_117 == 29);
      _292 = select(((_117 == 24) || _290), 0.0f, _157);
      if (_290) {
        _309 = ((uint)((((int)((_frameNumber.x << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_bufferSizeAndInvSize.x * float((int)(_101))) + float((int)(_99)));
        _317 = ((uint)((((int)((_309 << 4) + (uint)(-1383041155))) ^ ((int)(_309 + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(_309) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x);
        _325 = ((uint)((((int)((_317 << 4) + (uint)(-1556008596))) ^ ((int)(_317 + 1013904242u))) ^ (((uint)(_317) >> 5) + -939442524))) + _309;
        _333 = ((uint)((((int)((_325 << 4) + (uint)(-1383041155))) ^ ((int)(_325 + 1013904242u))) ^ ((int)(((uint)((uint)(_325) >> 5)) + 2123724318u)))) + _317;
        _341 = ((uint)((((int)((_333 << 4) + (uint)(-1556008596))) ^ ((int)(_333 + (uint)(-626627285)))) ^ (((uint)(_333) >> 5) + -939442524))) + _325;
        _349 = ((uint)((((int)((_341 << 4) + (uint)(-1383041155))) ^ ((int)(_341 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_341) >> 5)) + 2123724318u)))) + _333;
        _357 = ((uint)((((int)((_349 << 4) + (uint)(-1556008596))) ^ ((int)(_349 + 2027808484u))) ^ (((uint)(_349) >> 5) + -939442524))) + _341;
        _365 = ((uint)((((int)((_357 << 4) + (uint)(-1383041155))) ^ ((int)(_357 + 2027808484u))) ^ ((int)(((uint)((uint)(_357) >> 5)) + 2123724318u)))) + _349;
        _373 = ((uint)((((int)((_365 << 4) + (uint)(-1556008596))) ^ ((int)(_365 + 387276957u))) ^ (((uint)(_365) >> 5) + -939442524))) + _357;
        _381 = ((uint)((((int)((_373 << 4) + (uint)(-1383041155))) ^ ((int)(_373 + 387276957u))) ^ ((int)(((uint)((uint)(_373) >> 5)) + 2123724318u)))) + _365;
        _389 = ((uint)((((int)((_381 << 4) + (uint)(-1556008596))) ^ ((int)(_381 + (uint)(-1253254570)))) ^ (((uint)(_381) >> 5) + -939442524))) + _373;
        _397 = ((uint)((((int)((_389 << 4) + (uint)(-1383041155))) ^ ((int)(_389 + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(_389) >> 5)) + 2123724318u)))) + _381;
        _405 = ((uint)((((int)((_397 << 4) + (uint)(-1556008596))) ^ ((int)(_397 + 1401181199u))) ^ (((uint)(_397) >> 5) + -939442524))) + _389;
        _413 = ((uint)((((int)((_405 << 4) + (uint)(-1383041155))) ^ ((int)(_405 + 1401181199u))) ^ ((int)(((uint)((uint)(_405) >> 5)) + 2123724318u)))) + _397;
        _421 = ((uint)((((int)((_413 << 4) + (uint)(-1556008596))) ^ ((int)(_413 + (uint)(-239350328)))) ^ (((uint)(_413) >> 5) + -939442524))) + _405;
        _429 = ((uint)((((int)((_421 << 4) + (uint)(-1383041155))) ^ ((int)(_421 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_421) >> 5)) + 2123724318u)))) + _413;
        if ((_421 & 16777215) == 0) {
          _442 = ((int)(((uint)((((int)((_429 << 4) + (uint)(-1556008596))) ^ ((int)(_429 + (uint)(-1879881855)))) ^ (((uint)(_429) >> 5) + -939442524))) + _421));
        } else {
          _442 = _421;
        }
        _471 = int(min(max(((((saturate(1.0f - (_121 * 0.015625f)) * 4.0f) * ((((float)((uint)((uint)(((int)(_442 * 48271)) & 16777215)))) * 1.1920928955078125e-07f) + -1.0f)) + float((int)((int)((uint)(max((int)(1), (int)(_99))) + (uint)(-1))))) * 0.5f), 0.0f), ((_bufferSizeAndInvSize.x * 0.5f) + -2.0f)));
        _472 = int(min(max((float((int)((int)((uint)(max((int)(1), (int)(_101))) + (uint)(-1)))) * 0.5f), 0.0f), ((_bufferSizeAndInvSize.y * 0.5f) + -2.0f)));
        _493 = _292;
        _494 = _259;
        _495 = _260;
        _496 = _261;
        _497 = _471;
        _498 = _472;
        _499 = ((_bufferSizeAndInvSize.z * 2.0f) * (float((int)(_471)) + 0.5f));
        _500 = ((_bufferSizeAndInvSize.w * 2.0f) * (float((int)(_472)) + 0.5f));
      } else {
        _482 = _292;
        _483 = _259;
        _484 = _260;
        _485 = _261;
        _493 = _482;
        _494 = _483;
        _495 = _484;
        _496 = _485;
        _497 = ((int)((int)((uint)(max((int)(1), (int)(_99))) + (uint)(-1))) >> 1);
        _498 = ((int)((int)((uint)(max((int)(1), (int)(_101))) + (uint)(-1))) >> 1);
        _499 = _109;
        _500 = _110;
      }
    }
    _503 = __3__36__0__0__g_normalDepthHalf.GatherGreen(__3__40__0__0__g_samplerPoint, float2(_499, _500));  // [sem: _3__36__0__0__g_normalDepthHalf_gather]
    _508 = (uint)((uint)(_503.w)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _512 = (uint)((uint)(_503.z)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _516 = (uint)((uint)(_503.x)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _520 = (uint)((uint)(_503.y)) >> 24;  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _545 = (max(0.0f, (_121 + -1.0f)) * 0.05000000074505806f) * _temporalReprojectionParams.y;
    _550 = max(0.0f, (abs(_121 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_503.w & 16777215)))) * 5.960465188081798e-08f)))) - _545));
    _551 = max(0.0f, (abs(_121 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_503.z & 16777215)))) * 5.960465188081798e-08f)))) - _545));
    _552 = max(0.0f, (abs(_121 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_503.x & 16777215)))) * 5.960465188081798e-08f)))) - _545));
    _553 = max(0.0f, (abs(_121 - (_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_503.y & 16777215)))) * 5.960465188081798e-08f)))) - _545));
    _554 = _508 & 127;
    _555 = _512 & 127;
    _556 = _516 & 127;
    _557 = _520 & 127;
    if ((uint)_117 > (uint)11) {
      if (!(((uint)_117 < (uint)21) || (_117 == 107))) {
        _595 = (_117 == 7);
      } else {
        _595 = true;
      }
    } else {
      if (!(_117 == 6)) {
        _595 = (_117 == 7);
      } else {
        _595 = true;
      }
    }
    _597 = _121 * _121;
    _602 = select(_595, -7.213475227355957f, -72.13475036621094f) * (1.0f / ((select(_595, 0.05000000074505806f, 0.009999999776482582f) * _597) + 1.0f));
    _615 = _115.x & 126;  // [sem: _3__36__0__0__g_stencil_load_derived]
    _618 = (_615 == 66) || (_117 == 54);
    _647 = __3__36__0__0__g_normalDepthHalf.GatherRed(__3__40__0__0__g_samplerPoint, float2(_499, _500));  // [sem: _3__36__0__0__g_normalDepthHalf_gather]
    _666 = min(1.0f, ((((float)((uint)((uint)(_647.w & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _667 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_647.w)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _668 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_647.w)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _670 = rsqrt(dot(float3(_666, _667, _668), float3(_666, _667, _668)));  // [sem: invLength]
    _674 = float(_494);
    _675 = float(_495);
    _676 = float(_496);
    _692 = min(1.0f, ((((float)((uint)((uint)(_647.z & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _693 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_647.z)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _694 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_647.z)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _696 = rsqrt(dot(float3(_692, _693, _694), float3(_692, _693, _694)));  // [sem: invLength]
    _715 = min(1.0f, ((((float)((uint)((uint)(_647.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _716 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_647.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _717 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_647.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _719 = rsqrt(dot(float3(_715, _716, _717), float3(_715, _716, _717)));  // [sem: invLength]
    _738 = min(1.0f, ((((float)((uint)((uint)(_647.y & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _739 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_647.y)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_normalDepthHalf_gather_derived]
    _740 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_647.y)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _742 = rsqrt(dot(float3(_738, _739, _740), float3(_738, _739, _740)));  // [sem: invLength]
    _747 = (_117 == 29);
    _748 = select(_747, 8192.0f, 256.0f);
    _761 = exp2(log2(saturate(dot(float3(_674, _675, _676), float3((_670 * _666), (_670 * _667), (_670 * _668))))) * _748);
    _762 = exp2(log2(saturate(dot(float3(_674, _675, _676), float3((_696 * _692), (_696 * _693), (_696 * _694))))) * _748);
    _763 = exp2(log2(saturate(dot(float3(_674, _675, _676), float3((_719 * _715), (_719 * _716), (_719 * _717))))) * _748);
    _764 = exp2(log2(saturate(dot(float3(_674, _675, _676), float3((_742 * _738), (_742 * _739), (_742 * _740))))) * _748);
    _769 = 1.0f / max(9.999999974752427e-07f, (((_762 + _761) + _763) + _764));
    _772 = ((exp2((_550 * _550) * _602) * ((float)((bool)((uint)(!(_618 ^ (((_508 & 126) == 66) || (_554 == 54)))))))) * _761) * _769;
    _775 = ((exp2((_551 * _551) * _602) * ((float)((bool)((uint)(!(_618 ^ (((_512 & 126) == 66) || (_555 == 54)))))))) * _762) * _769;
    _778 = ((exp2((_552 * _552) * _602) * ((float)((bool)((uint)(!(_618 ^ (((_516 & 126) == 66) || (_556 == 54)))))))) * _763) * _769;
    _781 = ((exp2((_553 * _553) * _602) * ((float)((bool)((uint)(!(_618 ^ (((_520 & 126) == 66) || (_557 == 54)))))))) * _764) * _769;
    if (_747) {
      _812 = abs(((float((int)(_99)) * 0.5f) + -0.25f) - float((int)(_497)));
      _813 = abs(((float((int)(_101)) * 0.5f) + -0.25f) - float((int)(_498)));
    } else {
      _812 = (((float)((uint)((_99 - (_497 << 1)) - ((uint)(_frameNumber.x & 1))))) * 0.5f);
      _813 = (((float)((uint)((_101 - (_498 << 1)) - ((uint)(((uint)((uint)(_frameNumber.x)) >> 1) & 1))))) * 0.5f);
    }
    _814 = saturate(_812);  // [sem: _812_sat]
    _815 = saturate(_813);  // [sem: _813_sat]
    _816 = 1.0f - _814;
    _817 = 1.0f - _815;
    _818 = _817 * _816;
    _819 = _817 * _814;
    _820 = _816 * _815;
    _821 = _815 * _814;
    _830 = (_117 != 29) && ((_781 == 0.0f) && ((_778 == 0.0f) && ((_772 == 0.0f) && (_775 == 0.0f))));
    _839 = saturate(_818 * select(_830, 1.0f, _772));  // [sem: expr_sat]
    _840 = saturate(_819 * select(_830, 1.0f, _775));  // [sem: expr_sat]
    _841 = saturate(_820 * select(_830, 1.0f, _778));  // [sem: expr_sat]
    _842 = saturate(_821 * select(_830, 1.0f, _781));  // [sem: expr_sat]
    _843 = dot(float4(_839, _840, _841, _842), float4(1.0f, 1.0f, 1.0f, 1.0f));
    _844 = max(0.0f, _843);
    _849 = saturate(_839 / _844);  // [sem: expr_sat]
    _850 = saturate(_840 / _844);  // [sem: expr_sat]
    _851 = saturate(_841 / _844);  // [sem: expr_sat]
    _852 = saturate(_842 / _844);  // [sem: expr_sat]
    _856 = (float)((bool)((uint)(((((_557 == 6) || ((_557 == 107) || ((uint)(_557 + -12) < (uint)9))) || (((_556 == 6) || ((_556 == 107) || ((uint)(_556 + -12) < (uint)9))) || (((_554 == 6) || ((_554 == 107) || ((uint)(_554 + -12) < (uint)9))) || ((_555 == 6) || ((_555 == 107) || ((uint)(_555 + -12) < (uint)9)))))) || _595) && (_843 < 9.999999747378752e-05f))));
    _865 = ((_818 - _849) * _856) + _849;
    _866 = ((_819 - _850) * _856) + _850;
    _867 = ((_820 - _851) * _856) + _851;
    _868 = ((_821 - _852) * _856) + _852;
    half4 _870 = __3__36__0__0__g_diffuseResult.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _880 = _497 + 1u;
    half4 _881 = __3__36__0__0__g_diffuseResult.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _894 = _498 + 1u;
    half4 _895 = __3__36__0__0__g_diffuseResult.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    half4 _908 = __3__36__0__0__g_diffuseResult.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_diffuseResult_load]
    _918 = (((float(_881.x) * _866) + (float(_870.x) * _865)) + (float(_895.x) * _867)) + (float(_908.x) * _868);
    _919 = (((float(_881.y) * _866) + (float(_870.y) * _865)) + (float(_895.y) * _867)) + (float(_908.y) * _868);
    _920 = (((float(_881.z) * _866) + (float(_870.z) * _865)) + (float(_895.z) * _867)) + (float(_908.z) * _868);
    _922 = __3__36__0__0__g_specularResult.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _929 = __3__36__0__0__g_specularResult.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _939 = __3__36__0__0__g_specularResult.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _949 = __3__36__0__0__g_specularResult.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_specularResult_load]
    _968 = (_117 == 38) || (((uint)(_117 + -27) < (uint)2) || ((_117 == 26) || (((uint)(_117 + -105) < (uint)2) || _180)));
    _970 = (_109 * 2.0f) + -1.0f;
    _972 = 1.0f - (_110 * 2.0f);
    _1008 = mad((_invViewProjRelative[2].w), _120, mad((_invViewProjRelative[1].w), _972, ((_invViewProjRelative[0].w) * _970))) + (_invViewProjRelative[3].w);
    _1009 = (mad((_invViewProjRelative[2].x), _120, mad((_invViewProjRelative[1].x), _972, ((_invViewProjRelative[0].x) * _970))) + (_invViewProjRelative[3].x)) / _1008;
    _1010 = (mad((_invViewProjRelative[2].y), _120, mad((_invViewProjRelative[1].y), _972, ((_invViewProjRelative[0].y) * _970))) + (_invViewProjRelative[3].y)) / _1008;
    _1011 = (mad((_invViewProjRelative[2].z), _120, mad((_invViewProjRelative[1].z), _972, ((_invViewProjRelative[0].z) * _970))) + (_invViewProjRelative[3].z)) / _1008;
    _1013 = rsqrt(dot(float3(_1009, _1010, _1011), float3(_1009, _1010, _1011)));  // [sem: invLength]
    _1014 = _1013 * _1009;
    _1015 = _1013 * _1010;
    _1016 = _1013 * _1011;
    _1017 = (_117 == 33);
    _1019 = (_117 == 55);
    if ((_615 == 64) || ((_1017 || _618) || (_1019 || _968))) {
      _1026 = __3__36__0__0__g_character.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_character_load]
      _1032 = _1026.x;  // [sem: _3__36__0__0__g_character_load_derived]
      _1033 = _1026.y;  // [sem: _3__36__0__0__g_character_load_derived]
      _1034 = _1026.z;  // [sem: _3__36__0__0__g_character_load_derived]
      _1035 = _1026.w;  // [sem: _3__36__0__0__g_character_load_derived]
    } else {
      _1032 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _1033 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _1034 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
      _1035 = 0.0f;  // [sem: _3__36__0__0__g_character_load_derived]
    }
    if (_1017) {
      _1042 = uint((_1034 * 255.0f) + 0.5f);
      _1044 = ((uint)(_1042) >> 4) & 7;
      if (!(_1044 == 0)) {
        _1051 = __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((int)(_1044 + 1))];
        _1057 = 1.0f;
        _1058 = min((1.0f - _1051.y), _1051.x);
        _1059 = (((float)((uint)((uint)(_1042 & 15)))) * 0.06666667014360428f);
        _1060 = _1051.y;
        _1061 = _1051.x;
      } else {
        _1057 = 0.0f;
        _1058 = 0.0f;
        _1059 = 0.0f;
        _1060 = 0.0f;
        _1061 = 0.0f;
      }
      _1067 = _117;
      _1068 = (half)(half(_effectiveMetallicForVelvet * _1061));
      _1069 = _1057;
      _1070 = _1058;
      _1071 = _1059;
      _1072 = _1060;
      _1073 = _1061;
    } else {
      if (_1019) {
        if (!(_1034 < 0.0010000000474974513f)) {
          _1042 = uint((_1034 * 255.0f) + 0.5f);
          _1044 = ((uint)(_1042) >> 4) & 7;
          if (!(_1044 == 0)) {
            _1051 = __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((int)(_1044 + 1))];
            _1057 = 1.0f;
            _1058 = min((1.0f - _1051.y), _1051.x);
            _1059 = (((float)((uint)((uint)(_1042 & 15)))) * 0.06666667014360428f);
            _1060 = _1051.y;
            _1061 = _1051.x;
          } else {
            _1057 = 0.0f;
            _1058 = 0.0f;
            _1059 = 0.0f;
            _1060 = 0.0f;
            _1061 = 0.0f;
          }
          _1067 = _117;
          _1068 = (half)(half(_effectiveMetallicForVelvet * _1061));
          _1069 = _1057;
          _1070 = _1058;
          _1071 = _1059;
          _1072 = _1060;
          _1073 = _1061;
        } else {
          _1067 = 53;
          _1068 = _493;
          _1069 = 0.0f;
          _1070 = 0.0f;
          _1071 = 0.0f;
          _1072 = 0.0f;
          _1073 = 0.0f;
        }
      } else {
        _1067 = _117;
        _1068 = _493;
        _1069 = 0.0f;
        _1070 = 0.0f;
        _1071 = 0.0f;
        _1072 = 0.0f;
        _1073 = 0.0f;
      }
    }
    if (_1067 == 66) {
      _1105 = float(_1068);
      _1139 = _1105;
      _1140 = ((_1032 * 2.0f) + -1.0f);
      _1141 = ((_1033 * 2.0f) + -1.0f);
      _1142 = ((_1034 * 2.0f) + -1.0f);
      _1143 = 0.0h;
      if ((_1067 == 54) || ((_1067 & 126) == 66)) {
        _1149 = _1139;
        _1150 = _1140;
        _1151 = _1141;
        _1152 = _1142;
        _1153 = _1143;
        _1155 = __3__36__0__0__g_bentCone.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
        _1162 = __3__36__0__0__g_bentCone.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
        _1172 = __3__36__0__0__g_bentCone.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
        _1182 = __3__36__0__0__g_bentCone.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
        _1195 = (((((_1162.x * _866) + (_1155.x * _865)) + (_1172.x * _867)) + (_1182.x * _868)) * 2.0f) + -1.0f;
        _1196 = (((((_1162.y * _866) + (_1155.y * _865)) + (_1172.y * _867)) + (_1182.y * _868)) * 2.0f) + -1.0f;
        _1197 = (((((_1162.z * _866) + (_1155.z * _865)) + (_1172.z * _867)) + (_1182.z * _868)) * 2.0f) + -1.0f;
        _1199 = rsqrt(dot(float3(_1195, _1196, _1197), float3(_1195, _1196, _1197)));  // [sem: invLength]
        _1200 = _1195 * _1199;
        _1201 = _1196 * _1199;
        _1202 = _1197 * _1199;
        if (!(_renderParams.z > 0.0f)) {
          if (!(_renderParams2.y > 0.0f)) {
            _1214 = (half)(saturate((half)(_162 + 0.15002441h)));
          } else {
            _1214 = _162;
          }
        } else {
          _1214 = _162;
        }
        _1215 = float(_1214);
        if (_1067 == 54) {
          _1231 = (((asfloat(_globalLightParams.z) * _1215) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
        } else {
          _1231 = _bevelParams.y;
        }
        _1232 = float(_283);
        _1233 = float(_284);
        _1234 = float(_285);
        _1235 = dot(float3(_1150, _1151, _1152), float3(_1200, _1201, _1202));
        _1236 = -0.0f - _1014;
        _1237 = -0.0f - _1015;
        _1238 = -0.0f - _1016;
        _1239 = dot(float3(_1150, _1151, _1152), float3(_1236, _1237, _1238));
        _1245 = cos(abs(asin(_1239) - asin(_1235)) * 0.5f);
        _1249 = _1200 - (_1235 * _1150);
        _1250 = _1201 - (_1235 * _1151);
        _1251 = _1202 - (_1235 * _1152);
        _1255 = _1236 - (_1239 * _1150);
        _1256 = _1237 - (_1239 * _1151);
        _1257 = _1238 - (_1239 * _1152);
  // [sem: invLength]
        _1264 = rsqrt((dot(float3(_1255, _1256, _1257), float3(_1255, _1256, _1257)) * dot(float3(_1249, _1250, _1251), float3(_1249, _1250, _1251))) + 9.999999747378752e-05f) * dot(float3(_1249, _1250, _1251), float3(_1255, _1256, _1257));
        _1274 = min(max(_1215, 0.09803921729326248f), 1.0f);
        _1275 = _1274 * _1274;
        _1276 = _1275 * 0.5f;
        _1277 = _1275 * 2.0f;
        _1278 = _1239 + _1235;
        _1279 = _1278 - _1231;
        _1288 = 1.0f / ((1.190000057220459f / _1245) + (_1245 * 0.36000001430511475f));
        _1293 = ((_1288 * (0.6000000238418579f - (_1264 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1264 * 0.5f) + 0.5f));
        _1299 = 1.0f - (sqrt(saturate(1.0f - (_1293 * _1293))) * _1245);
        _1300 = _1299 * _1299;
        _1304 = 0.9534794092178345f - ((_1300 * _1300) * (_1299 * 0.9534794092178345f));
        _1305 = _1288 * _1293;
        _1310 = (sqrt(1.0f - (_1305 * _1305)) * 0.5f) / _1245;
        _1311 = log2(_1232);
        _1312 = log2(_1233);
        _1313 = log2(_1234);
        _1325 = ((_1304 * _1304) * (exp2((((_1279 * _1279) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1275 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1264 * 5.2658371925354f));
        _1329 = _1278 - (_1231 * 4.0f);
        _1339 = 1.0f - (_1245 * 0.5f);
        _1340 = _1339 * _1339;
        _1344 = (_1340 * _1340) * (0.9534794092178345f - (_1245 * 0.47673970460891724f));
        _1346 = 0.9534794092178345f - _1344;
        _1347 = 0.800000011920929f / _1245;
        _1360 = (((_1346 * _1346) * (_1344 + 0.04652056470513344f)) * (exp2((((_1329 * _1329) * -0.5f) / (_1277 * _1277)) * 1.4426950216293335f) / (_1275 * 5.013256549835205f))) * exp2((_1264 * 24.525815963745117f) + -24.208423614501953f);
        _1370 = min(0.0f, (-0.0f - ((_1325 * exp2(_1311 * _1310)) + (_1360 * exp2(_1347 * _1311)))));
        _1371 = min(0.0f, (-0.0f - ((_1325 * exp2(_1312 * _1310)) + (_1360 * exp2(_1347 * _1312)))));
        _1372 = min(0.0f, (-0.0f - ((_1325 * exp2(_1313 * _1310)) + (_1360 * exp2(_1347 * _1313)))));
        _1381 = saturate(abs(dot(float3(_1200, _1201, _1202), float3(_1150, _1151, _1152))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _1390 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _1393 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _1396 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1313 * 1.5f)))), 0.0f);
        _1403 = min(0.9900000095367432f, _1390.x);
        _1404 = min(0.9900000095367432f, _1393.x);
        _1405 = min(0.9900000095367432f, _1396.x);
        _1406 = min(0.9900000095367432f, _1390.y);
        _1407 = min(0.9900000095367432f, _1393.y);
        _1408 = min(0.9900000095367432f, _1396.y);
        _1409 = _1403 * _1403;
        _1410 = _1404 * _1404;
        _1411 = _1405 * _1405;
        _1412 = _1406 * _1406;
        _1413 = _1407 * _1407;
        _1414 = _1408 * _1408;
        _1415 = _1412 * _1406;
        _1416 = _1413 * _1407;
        _1417 = _1414 * _1408;
        _1418 = 1.0f - _1409;
        _1419 = 1.0f - _1410;
        _1420 = 1.0f - _1411;
        _1430 = _1418 * _1418;
        _1431 = _1419 * _1419;
        _1432 = _1420 * _1420;
        _1433 = _1430 * _1418;
        _1434 = _1431 * _1419;
        _1435 = _1432 * _1420;
        _1443 = min(max(_1215, 0.18000000715255737f), 0.6000000238418579f);
        _1444 = _1443 * _1443;
        _1445 = _1444 * 0.25f;
        _1446 = _1444 * 4.0f;
        _1448 = (_1404 + _1403) + _1405;
        _1449 = _1403 / _1448;
        _1450 = _1404 / _1448;
        _1451 = _1405 / _1448;
        _1452 = dot(float3(_1444, _1445, _1446), float3(_1449, _1450, _1451));
        _1453 = _1452 * _1452;
        _1456 = asin(min(max(_1239, -1.0f), 1.0f)) + asin(min(max(_1235, -1.0f), 1.0f));
        _1457 = _1456 * 0.5f;
        _1458 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1449, _1450, _1451));
        _1468 = _1458 * _1458;
        _1491 = (_1407 + _1406) + _1408;
        _1495 = dot(float3(_1444, _1445, _1446), float3((_1406 / _1491), (_1407 / _1491), (_1408 / _1491)));
        _1499 = sqrt((_1495 * _1495) + (_1453 * 2.0f));
        _1517 = (_1495 * 3.0f) + (_1452 * 2.0f);
        _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1415) + _1406);
        _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1416) + _1407);
        _1526 = (((_1417 + _1408) * ((_1411 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1417) + _1408);
        _1535 = _1457 - (((_1468 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
        _1542 = _1457 - (((_1468 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
        _1549 = _1457 - (((_1468 * (((_1411 * 4.0f) * _1414) + (_1432 * 2.0f))) * (1.0f - ((_1414 * 2.0f) / _1432))) / _1435);
        _1577 = exp2((((_1456 * -0.25f) * _1457) / _1453) * 1.4426950216293335f) * 1.399999976158142f;
        _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1535 * _1535) * -0.5f) / ((_1524 * _1524) + _1453)) * 1.4426950216293335f)) + ((((_1390.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1577;
        _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1542 * _1542) * -0.5f) / ((_1525 * _1525) + _1453)) * 1.4426950216293335f)) + ((((_1393.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1577;
        _1580 = ((((((_1417 * _1411) / _1435) + ((_1408 * _1411) / _1420)) * 4.398229598999023f) * exp2((((_1549 * _1549) * -0.5f) / ((_1526 * _1526) + _1453)) * 1.4426950216293335f)) + ((((_1396.x + _1372) * 0.25f) - _1372) * 6.2831854820251465f)) * _1577;
        _1581 = max(0.125f, _1149);
        _1591 = max(0.009999999776482582f, ((_1581 * (_1232 - _1578)) + _1578));
        _1592 = max(0.009999999776482582f, (lerp(_1579, _1233, _1581)));
        _1593 = max(0.009999999776482582f, (lerp(_1580, _1234, _1581)));
        _1595 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
        _1602 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
        _1612 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
        _1622 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
        _1647 = _1149;
        _1648 = _1153;
        _1649 = _1150;
        _1650 = _1151;
        _1651 = _1152;
        _1652 = _1067;
        _1653 = (min(30000.0f, (_exposure4.x * (((((_1602.x * _866) + (_1595.x * _865)) + (_1612.x * _867)) + (_1622.x * _868)) / _1591))) + _918);
        _1654 = (min(30000.0f, (_exposure4.x * (((((_1602.y * _866) + (_1595.y * _865)) + (_1612.y * _867)) + (_1622.y * _868)) / _1592))) + _919);
        _1655 = (min(30000.0f, (_exposure4.x * (((((_1602.z * _866) + (_1595.z * _865)) + (_1612.z * _867)) + (_1622.z * _868)) / _1593))) + _920);
        _1656 = _1591;
        _1657 = _1592;
        _1658 = _1593;
      } else {
        _1647 = _1139;
        _1648 = _1143;
        _1649 = _1140;
        _1650 = _1141;
        _1651 = _1142;
        _1652 = _1067;
        _1653 = _918;
        _1654 = _919;
        _1655 = _920;
        _1656 = 0.0f;
        _1657 = 0.0f;
        _1658 = 0.0f;
      }
    } else {
      _1077 = (_1067 == 54);
      if ((_1067 == 67) || _1077) {
        _1084 = (float)((uint)((uint)(((int)(_frameNumber.x * 73)) & 127)));
        if (!(float(_1068) > (frac(frac(dot(float2(((_1084 * 32.665000915527344f) + _102), ((_1084 * 11.8149995803833f) + _103)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) * 0.20000000298023224f))) {
          if ((_1067 & 126) == 66) {
            _1105 = 1.0f;
            _1139 = _1105;
            _1140 = ((_1032 * 2.0f) + -1.0f);
            _1141 = ((_1033 * 2.0f) + -1.0f);
            _1142 = ((_1034 * 2.0f) + -1.0f);
            _1143 = 0.0h;
            if ((_1067 == 54) || ((_1067 & 126) == 66)) {
              _1149 = _1139;
              _1150 = _1140;
              _1151 = _1141;
              _1152 = _1142;
              _1153 = _1143;
              _1155 = __3__36__0__0__g_bentCone.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1162 = __3__36__0__0__g_bentCone.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1172 = __3__36__0__0__g_bentCone.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1182 = __3__36__0__0__g_bentCone.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1195 = (((((_1162.x * _866) + (_1155.x * _865)) + (_1172.x * _867)) + (_1182.x * _868)) * 2.0f) + -1.0f;
              _1196 = (((((_1162.y * _866) + (_1155.y * _865)) + (_1172.y * _867)) + (_1182.y * _868)) * 2.0f) + -1.0f;
              _1197 = (((((_1162.z * _866) + (_1155.z * _865)) + (_1172.z * _867)) + (_1182.z * _868)) * 2.0f) + -1.0f;
              _1199 = rsqrt(dot(float3(_1195, _1196, _1197), float3(_1195, _1196, _1197)));  // [sem: invLength]
              _1200 = _1195 * _1199;
              _1201 = _1196 * _1199;
              _1202 = _1197 * _1199;
              if (!(_renderParams.z > 0.0f)) {
                if (!(_renderParams2.y > 0.0f)) {
                  _1214 = (half)(saturate((half)(_162 + 0.15002441h)));
                } else {
                  _1214 = _162;
                }
              } else {
                _1214 = _162;
              }
              _1215 = float(_1214);
              if (_1067 == 54) {
                _1231 = (((asfloat(_globalLightParams.z) * _1215) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
              } else {
                _1231 = _bevelParams.y;
              }
              _1232 = float(_283);
              _1233 = float(_284);
              _1234 = float(_285);
              _1235 = dot(float3(_1150, _1151, _1152), float3(_1200, _1201, _1202));
              _1236 = -0.0f - _1014;
              _1237 = -0.0f - _1015;
              _1238 = -0.0f - _1016;
              _1239 = dot(float3(_1150, _1151, _1152), float3(_1236, _1237, _1238));
              _1245 = cos(abs(asin(_1239) - asin(_1235)) * 0.5f);
              _1249 = _1200 - (_1235 * _1150);
              _1250 = _1201 - (_1235 * _1151);
              _1251 = _1202 - (_1235 * _1152);
              _1255 = _1236 - (_1239 * _1150);
              _1256 = _1237 - (_1239 * _1151);
              _1257 = _1238 - (_1239 * _1152);
  // [sem: invLength]
              _1264 = rsqrt((dot(float3(_1255, _1256, _1257), float3(_1255, _1256, _1257)) * dot(float3(_1249, _1250, _1251), float3(_1249, _1250, _1251))) + 9.999999747378752e-05f) * dot(float3(_1249, _1250, _1251), float3(_1255, _1256, _1257));
              _1274 = min(max(_1215, 0.09803921729326248f), 1.0f);
              _1275 = _1274 * _1274;
              _1276 = _1275 * 0.5f;
              _1277 = _1275 * 2.0f;
              _1278 = _1239 + _1235;
              _1279 = _1278 - _1231;
              _1288 = 1.0f / ((1.190000057220459f / _1245) + (_1245 * 0.36000001430511475f));
              _1293 = ((_1288 * (0.6000000238418579f - (_1264 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1264 * 0.5f) + 0.5f));
              _1299 = 1.0f - (sqrt(saturate(1.0f - (_1293 * _1293))) * _1245);
              _1300 = _1299 * _1299;
              _1304 = 0.9534794092178345f - ((_1300 * _1300) * (_1299 * 0.9534794092178345f));
              _1305 = _1288 * _1293;
              _1310 = (sqrt(1.0f - (_1305 * _1305)) * 0.5f) / _1245;
              _1311 = log2(_1232);
              _1312 = log2(_1233);
              _1313 = log2(_1234);
              _1325 = ((_1304 * _1304) * (exp2((((_1279 * _1279) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1275 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1264 * 5.2658371925354f));
              _1329 = _1278 - (_1231 * 4.0f);
              _1339 = 1.0f - (_1245 * 0.5f);
              _1340 = _1339 * _1339;
              _1344 = (_1340 * _1340) * (0.9534794092178345f - (_1245 * 0.47673970460891724f));
              _1346 = 0.9534794092178345f - _1344;
              _1347 = 0.800000011920929f / _1245;
              _1360 = (((_1346 * _1346) * (_1344 + 0.04652056470513344f)) * (exp2((((_1329 * _1329) * -0.5f) / (_1277 * _1277)) * 1.4426950216293335f) / (_1275 * 5.013256549835205f))) * exp2((_1264 * 24.525815963745117f) + -24.208423614501953f);
              _1370 = min(0.0f, (-0.0f - ((_1325 * exp2(_1311 * _1310)) + (_1360 * exp2(_1347 * _1311)))));
              _1371 = min(0.0f, (-0.0f - ((_1325 * exp2(_1312 * _1310)) + (_1360 * exp2(_1347 * _1312)))));
              _1372 = min(0.0f, (-0.0f - ((_1325 * exp2(_1313 * _1310)) + (_1360 * exp2(_1347 * _1313)))));
              _1381 = saturate(abs(dot(float3(_1200, _1201, _1202), float3(_1150, _1151, _1152))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1390 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1393 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1396 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1313 * 1.5f)))), 0.0f);
              _1403 = min(0.9900000095367432f, _1390.x);
              _1404 = min(0.9900000095367432f, _1393.x);
              _1405 = min(0.9900000095367432f, _1396.x);
              _1406 = min(0.9900000095367432f, _1390.y);
              _1407 = min(0.9900000095367432f, _1393.y);
              _1408 = min(0.9900000095367432f, _1396.y);
              _1409 = _1403 * _1403;
              _1410 = _1404 * _1404;
              _1411 = _1405 * _1405;
              _1412 = _1406 * _1406;
              _1413 = _1407 * _1407;
              _1414 = _1408 * _1408;
              _1415 = _1412 * _1406;
              _1416 = _1413 * _1407;
              _1417 = _1414 * _1408;
              _1418 = 1.0f - _1409;
              _1419 = 1.0f - _1410;
              _1420 = 1.0f - _1411;
              _1430 = _1418 * _1418;
              _1431 = _1419 * _1419;
              _1432 = _1420 * _1420;
              _1433 = _1430 * _1418;
              _1434 = _1431 * _1419;
              _1435 = _1432 * _1420;
              _1443 = min(max(_1215, 0.18000000715255737f), 0.6000000238418579f);
              _1444 = _1443 * _1443;
              _1445 = _1444 * 0.25f;
              _1446 = _1444 * 4.0f;
              _1448 = (_1404 + _1403) + _1405;
              _1449 = _1403 / _1448;
              _1450 = _1404 / _1448;
              _1451 = _1405 / _1448;
              _1452 = dot(float3(_1444, _1445, _1446), float3(_1449, _1450, _1451));
              _1453 = _1452 * _1452;
              _1456 = asin(min(max(_1239, -1.0f), 1.0f)) + asin(min(max(_1235, -1.0f), 1.0f));
              _1457 = _1456 * 0.5f;
              _1458 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1449, _1450, _1451));
              _1468 = _1458 * _1458;
              _1491 = (_1407 + _1406) + _1408;
              _1495 = dot(float3(_1444, _1445, _1446), float3((_1406 / _1491), (_1407 / _1491), (_1408 / _1491)));
              _1499 = sqrt((_1495 * _1495) + (_1453 * 2.0f));
              _1517 = (_1495 * 3.0f) + (_1452 * 2.0f);
              _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1415) + _1406);
              _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1416) + _1407);
              _1526 = (((_1417 + _1408) * ((_1411 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1417) + _1408);
              _1535 = _1457 - (((_1468 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
              _1542 = _1457 - (((_1468 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
              _1549 = _1457 - (((_1468 * (((_1411 * 4.0f) * _1414) + (_1432 * 2.0f))) * (1.0f - ((_1414 * 2.0f) / _1432))) / _1435);
              _1577 = exp2((((_1456 * -0.25f) * _1457) / _1453) * 1.4426950216293335f) * 1.399999976158142f;
              _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1535 * _1535) * -0.5f) / ((_1524 * _1524) + _1453)) * 1.4426950216293335f)) + ((((_1390.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1577;
              _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1542 * _1542) * -0.5f) / ((_1525 * _1525) + _1453)) * 1.4426950216293335f)) + ((((_1393.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1577;
              _1580 = ((((((_1417 * _1411) / _1435) + ((_1408 * _1411) / _1420)) * 4.398229598999023f) * exp2((((_1549 * _1549) * -0.5f) / ((_1526 * _1526) + _1453)) * 1.4426950216293335f)) + ((((_1396.x + _1372) * 0.25f) - _1372) * 6.2831854820251465f)) * _1577;
              _1581 = max(0.125f, _1149);
              _1591 = max(0.009999999776482582f, ((_1581 * (_1232 - _1578)) + _1578));
              _1592 = max(0.009999999776482582f, (lerp(_1579, _1233, _1581)));
              _1593 = max(0.009999999776482582f, (lerp(_1580, _1234, _1581)));
              _1595 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
              _1602 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
              _1612 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
              _1622 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
              _1647 = _1149;
              _1648 = _1153;
              _1649 = _1150;
              _1650 = _1151;
              _1651 = _1152;
              _1652 = _1067;
              _1653 = (min(30000.0f, (_exposure4.x * (((((_1602.x * _866) + (_1595.x * _865)) + (_1612.x * _867)) + (_1622.x * _868)) / _1591))) + _918);
              _1654 = (min(30000.0f, (_exposure4.x * (((((_1602.y * _866) + (_1595.y * _865)) + (_1612.y * _867)) + (_1622.y * _868)) / _1592))) + _919);
              _1655 = (min(30000.0f, (_exposure4.x * (((((_1602.z * _866) + (_1595.z * _865)) + (_1612.z * _867)) + (_1622.z * _868)) / _1593))) + _920);
              _1656 = _1591;
              _1657 = _1592;
              _1658 = _1593;
            } else {
              _1647 = _1139;
              _1648 = _1143;
              _1649 = _1140;
              _1650 = _1141;
              _1651 = _1142;
              _1652 = _1067;
              _1653 = _918;
              _1654 = _919;
              _1655 = _920;
              _1656 = 0.0f;
              _1657 = 0.0f;
              _1658 = 0.0f;
            }
          } else {
            _1102 = 1.0f;
            _1103 = 0.0h;
            if (_1077) {
              _1115 = (_1032 * 2.0f) + -1.0f;
              _1116 = (_1033 * 2.0f) + -1.0f;
              _1118 = 1.0f - abs(_1115);
              _1119 = abs(_1116);
              _1120 = _1118 - _1119;
              if (!(_1120 >= 0.0f)) {
                _1131 = ((1.0f - _1119) * select((_1115 >= 0.0f), 1.0f, -1.0f));
                _1132 = (_1118 * select((_1116 >= 0.0f), 1.0f, -1.0f));
              } else {
                _1131 = _1115;
                _1132 = _1116;
              }
              _1134 = rsqrt(dot(float3(_1131, _1132, _1120), float3(_1131, _1132, _1120)));  // [sem: invLength]
              _1149 = _1102;
              _1150 = (_1134 * _1131);
              _1151 = (_1134 * _1132);
              _1152 = (_1134 * _1120);
              _1153 = 0.0h;
              _1155 = __3__36__0__0__g_bentCone.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1162 = __3__36__0__0__g_bentCone.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1172 = __3__36__0__0__g_bentCone.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1182 = __3__36__0__0__g_bentCone.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
              _1195 = (((((_1162.x * _866) + (_1155.x * _865)) + (_1172.x * _867)) + (_1182.x * _868)) * 2.0f) + -1.0f;
              _1196 = (((((_1162.y * _866) + (_1155.y * _865)) + (_1172.y * _867)) + (_1182.y * _868)) * 2.0f) + -1.0f;
              _1197 = (((((_1162.z * _866) + (_1155.z * _865)) + (_1172.z * _867)) + (_1182.z * _868)) * 2.0f) + -1.0f;
              _1199 = rsqrt(dot(float3(_1195, _1196, _1197), float3(_1195, _1196, _1197)));  // [sem: invLength]
              _1200 = _1195 * _1199;
              _1201 = _1196 * _1199;
              _1202 = _1197 * _1199;
              if (!(_renderParams.z > 0.0f)) {
                if (!(_renderParams2.y > 0.0f)) {
                  _1214 = (half)(saturate((half)(_162 + 0.15002441h)));
                } else {
                  _1214 = _162;
                }
              } else {
                _1214 = _162;
              }
              _1215 = float(_1214);
              if (_1067 == 54) {
                _1231 = (((asfloat(_globalLightParams.z) * _1215) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
              } else {
                _1231 = _bevelParams.y;
              }
              _1232 = float(_283);
              _1233 = float(_284);
              _1234 = float(_285);
              _1235 = dot(float3(_1150, _1151, _1152), float3(_1200, _1201, _1202));
              _1236 = -0.0f - _1014;
              _1237 = -0.0f - _1015;
              _1238 = -0.0f - _1016;
              _1239 = dot(float3(_1150, _1151, _1152), float3(_1236, _1237, _1238));
              _1245 = cos(abs(asin(_1239) - asin(_1235)) * 0.5f);
              _1249 = _1200 - (_1235 * _1150);
              _1250 = _1201 - (_1235 * _1151);
              _1251 = _1202 - (_1235 * _1152);
              _1255 = _1236 - (_1239 * _1150);
              _1256 = _1237 - (_1239 * _1151);
              _1257 = _1238 - (_1239 * _1152);
  // [sem: invLength]
              _1264 = rsqrt((dot(float3(_1255, _1256, _1257), float3(_1255, _1256, _1257)) * dot(float3(_1249, _1250, _1251), float3(_1249, _1250, _1251))) + 9.999999747378752e-05f) * dot(float3(_1249, _1250, _1251), float3(_1255, _1256, _1257));
              _1274 = min(max(_1215, 0.09803921729326248f), 1.0f);
              _1275 = _1274 * _1274;
              _1276 = _1275 * 0.5f;
              _1277 = _1275 * 2.0f;
              _1278 = _1239 + _1235;
              _1279 = _1278 - _1231;
              _1288 = 1.0f / ((1.190000057220459f / _1245) + (_1245 * 0.36000001430511475f));
              _1293 = ((_1288 * (0.6000000238418579f - (_1264 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1264 * 0.5f) + 0.5f));
              _1299 = 1.0f - (sqrt(saturate(1.0f - (_1293 * _1293))) * _1245);
              _1300 = _1299 * _1299;
              _1304 = 0.9534794092178345f - ((_1300 * _1300) * (_1299 * 0.9534794092178345f));
              _1305 = _1288 * _1293;
              _1310 = (sqrt(1.0f - (_1305 * _1305)) * 0.5f) / _1245;
              _1311 = log2(_1232);
              _1312 = log2(_1233);
              _1313 = log2(_1234);
              _1325 = ((_1304 * _1304) * (exp2((((_1279 * _1279) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1275 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1264 * 5.2658371925354f));
              _1329 = _1278 - (_1231 * 4.0f);
              _1339 = 1.0f - (_1245 * 0.5f);
              _1340 = _1339 * _1339;
              _1344 = (_1340 * _1340) * (0.9534794092178345f - (_1245 * 0.47673970460891724f));
              _1346 = 0.9534794092178345f - _1344;
              _1347 = 0.800000011920929f / _1245;
              _1360 = (((_1346 * _1346) * (_1344 + 0.04652056470513344f)) * (exp2((((_1329 * _1329) * -0.5f) / (_1277 * _1277)) * 1.4426950216293335f) / (_1275 * 5.013256549835205f))) * exp2((_1264 * 24.525815963745117f) + -24.208423614501953f);
              _1370 = min(0.0f, (-0.0f - ((_1325 * exp2(_1311 * _1310)) + (_1360 * exp2(_1347 * _1311)))));
              _1371 = min(0.0f, (-0.0f - ((_1325 * exp2(_1312 * _1310)) + (_1360 * exp2(_1347 * _1312)))));
              _1372 = min(0.0f, (-0.0f - ((_1325 * exp2(_1313 * _1310)) + (_1360 * exp2(_1347 * _1313)))));
              _1381 = saturate(abs(dot(float3(_1200, _1201, _1202), float3(_1150, _1151, _1152))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1390 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1393 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
              _1396 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1313 * 1.5f)))), 0.0f);
              _1403 = min(0.9900000095367432f, _1390.x);
              _1404 = min(0.9900000095367432f, _1393.x);
              _1405 = min(0.9900000095367432f, _1396.x);
              _1406 = min(0.9900000095367432f, _1390.y);
              _1407 = min(0.9900000095367432f, _1393.y);
              _1408 = min(0.9900000095367432f, _1396.y);
              _1409 = _1403 * _1403;
              _1410 = _1404 * _1404;
              _1411 = _1405 * _1405;
              _1412 = _1406 * _1406;
              _1413 = _1407 * _1407;
              _1414 = _1408 * _1408;
              _1415 = _1412 * _1406;
              _1416 = _1413 * _1407;
              _1417 = _1414 * _1408;
              _1418 = 1.0f - _1409;
              _1419 = 1.0f - _1410;
              _1420 = 1.0f - _1411;
              _1430 = _1418 * _1418;
              _1431 = _1419 * _1419;
              _1432 = _1420 * _1420;
              _1433 = _1430 * _1418;
              _1434 = _1431 * _1419;
              _1435 = _1432 * _1420;
              _1443 = min(max(_1215, 0.18000000715255737f), 0.6000000238418579f);
              _1444 = _1443 * _1443;
              _1445 = _1444 * 0.25f;
              _1446 = _1444 * 4.0f;
              _1448 = (_1404 + _1403) + _1405;
              _1449 = _1403 / _1448;
              _1450 = _1404 / _1448;
              _1451 = _1405 / _1448;
              _1452 = dot(float3(_1444, _1445, _1446), float3(_1449, _1450, _1451));
              _1453 = _1452 * _1452;
              _1456 = asin(min(max(_1239, -1.0f), 1.0f)) + asin(min(max(_1235, -1.0f), 1.0f));
              _1457 = _1456 * 0.5f;
              _1458 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1449, _1450, _1451));
              _1468 = _1458 * _1458;
              _1491 = (_1407 + _1406) + _1408;
              _1495 = dot(float3(_1444, _1445, _1446), float3((_1406 / _1491), (_1407 / _1491), (_1408 / _1491)));
              _1499 = sqrt((_1495 * _1495) + (_1453 * 2.0f));
              _1517 = (_1495 * 3.0f) + (_1452 * 2.0f);
              _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1415) + _1406);
              _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1416) + _1407);
              _1526 = (((_1417 + _1408) * ((_1411 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1417) + _1408);
              _1535 = _1457 - (((_1468 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
              _1542 = _1457 - (((_1468 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
              _1549 = _1457 - (((_1468 * (((_1411 * 4.0f) * _1414) + (_1432 * 2.0f))) * (1.0f - ((_1414 * 2.0f) / _1432))) / _1435);
              _1577 = exp2((((_1456 * -0.25f) * _1457) / _1453) * 1.4426950216293335f) * 1.399999976158142f;
              _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1535 * _1535) * -0.5f) / ((_1524 * _1524) + _1453)) * 1.4426950216293335f)) + ((((_1390.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1577;
              _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1542 * _1542) * -0.5f) / ((_1525 * _1525) + _1453)) * 1.4426950216293335f)) + ((((_1393.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1577;
              _1580 = ((((((_1417 * _1411) / _1435) + ((_1408 * _1411) / _1420)) * 4.398229598999023f) * exp2((((_1549 * _1549) * -0.5f) / ((_1526 * _1526) + _1453)) * 1.4426950216293335f)) + ((((_1396.x + _1372) * 0.25f) - _1372) * 6.2831854820251465f)) * _1577;
              _1581 = max(0.125f, _1149);
              _1591 = max(0.009999999776482582f, ((_1581 * (_1232 - _1578)) + _1578));
              _1592 = max(0.009999999776482582f, (lerp(_1579, _1233, _1581)));
              _1593 = max(0.009999999776482582f, (lerp(_1580, _1234, _1581)));
              _1595 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
              _1602 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
              _1612 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
              _1622 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
              _1647 = _1149;
              _1648 = _1153;
              _1649 = _1150;
              _1650 = _1151;
              _1651 = _1152;
              _1652 = _1067;
              _1653 = (min(30000.0f, (_exposure4.x * (((((_1602.x * _866) + (_1595.x * _865)) + (_1612.x * _867)) + (_1622.x * _868)) / _1591))) + _918);
              _1654 = (min(30000.0f, (_exposure4.x * (((((_1602.y * _866) + (_1595.y * _865)) + (_1612.y * _867)) + (_1622.y * _868)) / _1592))) + _919);
              _1655 = (min(30000.0f, (_exposure4.x * (((((_1602.z * _866) + (_1595.z * _865)) + (_1612.z * _867)) + (_1622.z * _868)) / _1593))) + _920);
              _1656 = _1591;
              _1657 = _1592;
              _1658 = _1593;
            } else {
              _1139 = _1102;
              _1140 = _674;
              _1141 = _675;
              _1142 = _676;
              _1143 = _1103;
              if ((_1067 == 54) || ((_1067 & 126) == 66)) {
                _1149 = _1139;
                _1150 = _1140;
                _1151 = _1141;
                _1152 = _1142;
                _1153 = _1143;
                _1155 = __3__36__0__0__g_bentCone.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
                _1162 = __3__36__0__0__g_bentCone.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
                _1172 = __3__36__0__0__g_bentCone.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
                _1182 = __3__36__0__0__g_bentCone.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
                _1195 = (((((_1162.x * _866) + (_1155.x * _865)) + (_1172.x * _867)) + (_1182.x * _868)) * 2.0f) + -1.0f;
                _1196 = (((((_1162.y * _866) + (_1155.y * _865)) + (_1172.y * _867)) + (_1182.y * _868)) * 2.0f) + -1.0f;
                _1197 = (((((_1162.z * _866) + (_1155.z * _865)) + (_1172.z * _867)) + (_1182.z * _868)) * 2.0f) + -1.0f;
                _1199 = rsqrt(dot(float3(_1195, _1196, _1197), float3(_1195, _1196, _1197)));  // [sem: invLength]
                _1200 = _1195 * _1199;
                _1201 = _1196 * _1199;
                _1202 = _1197 * _1199;
                if (!(_renderParams.z > 0.0f)) {
                  if (!(_renderParams2.y > 0.0f)) {
                    _1214 = (half)(saturate((half)(_162 + 0.15002441h)));
                  } else {
                    _1214 = _162;
                  }
                } else {
                  _1214 = _162;
                }
                _1215 = float(_1214);
                if (_1067 == 54) {
                  _1231 = (((asfloat(_globalLightParams.z) * _1215) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
                } else {
                  _1231 = _bevelParams.y;
                }
                _1232 = float(_283);
                _1233 = float(_284);
                _1234 = float(_285);
                _1235 = dot(float3(_1150, _1151, _1152), float3(_1200, _1201, _1202));
                _1236 = -0.0f - _1014;
                _1237 = -0.0f - _1015;
                _1238 = -0.0f - _1016;
                _1239 = dot(float3(_1150, _1151, _1152), float3(_1236, _1237, _1238));
                _1245 = cos(abs(asin(_1239) - asin(_1235)) * 0.5f);
                _1249 = _1200 - (_1235 * _1150);
                _1250 = _1201 - (_1235 * _1151);
                _1251 = _1202 - (_1235 * _1152);
                _1255 = _1236 - (_1239 * _1150);
                _1256 = _1237 - (_1239 * _1151);
                _1257 = _1238 - (_1239 * _1152);
  // [sem: invLength]
                _1264 = rsqrt((dot(float3(_1255, _1256, _1257), float3(_1255, _1256, _1257)) * dot(float3(_1249, _1250, _1251), float3(_1249, _1250, _1251))) + 9.999999747378752e-05f) * dot(float3(_1249, _1250, _1251), float3(_1255, _1256, _1257));
                _1274 = min(max(_1215, 0.09803921729326248f), 1.0f);
                _1275 = _1274 * _1274;
                _1276 = _1275 * 0.5f;
                _1277 = _1275 * 2.0f;
                _1278 = _1239 + _1235;
                _1279 = _1278 - _1231;
                _1288 = 1.0f / ((1.190000057220459f / _1245) + (_1245 * 0.36000001430511475f));
                _1293 = ((_1288 * (0.6000000238418579f - (_1264 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1264 * 0.5f) + 0.5f));
                _1299 = 1.0f - (sqrt(saturate(1.0f - (_1293 * _1293))) * _1245);
                _1300 = _1299 * _1299;
                _1304 = 0.9534794092178345f - ((_1300 * _1300) * (_1299 * 0.9534794092178345f));
                _1305 = _1288 * _1293;
                _1310 = (sqrt(1.0f - (_1305 * _1305)) * 0.5f) / _1245;
                _1311 = log2(_1232);
                _1312 = log2(_1233);
                _1313 = log2(_1234);
                _1325 = ((_1304 * _1304) * (exp2((((_1279 * _1279) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1275 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1264 * 5.2658371925354f));
                _1329 = _1278 - (_1231 * 4.0f);
                _1339 = 1.0f - (_1245 * 0.5f);
                _1340 = _1339 * _1339;
                _1344 = (_1340 * _1340) * (0.9534794092178345f - (_1245 * 0.47673970460891724f));
                _1346 = 0.9534794092178345f - _1344;
                _1347 = 0.800000011920929f / _1245;
                _1360 = (((_1346 * _1346) * (_1344 + 0.04652056470513344f)) * (exp2((((_1329 * _1329) * -0.5f) / (_1277 * _1277)) * 1.4426950216293335f) / (_1275 * 5.013256549835205f))) * exp2((_1264 * 24.525815963745117f) + -24.208423614501953f);
                _1370 = min(0.0f, (-0.0f - ((_1325 * exp2(_1311 * _1310)) + (_1360 * exp2(_1347 * _1311)))));
                _1371 = min(0.0f, (-0.0f - ((_1325 * exp2(_1312 * _1310)) + (_1360 * exp2(_1347 * _1312)))));
                _1372 = min(0.0f, (-0.0f - ((_1325 * exp2(_1313 * _1310)) + (_1360 * exp2(_1347 * _1313)))));
                _1381 = saturate(abs(dot(float3(_1200, _1201, _1202), float3(_1150, _1151, _1152))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
                _1390 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
                _1393 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
                _1396 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1313 * 1.5f)))), 0.0f);
                _1403 = min(0.9900000095367432f, _1390.x);
                _1404 = min(0.9900000095367432f, _1393.x);
                _1405 = min(0.9900000095367432f, _1396.x);
                _1406 = min(0.9900000095367432f, _1390.y);
                _1407 = min(0.9900000095367432f, _1393.y);
                _1408 = min(0.9900000095367432f, _1396.y);
                _1409 = _1403 * _1403;
                _1410 = _1404 * _1404;
                _1411 = _1405 * _1405;
                _1412 = _1406 * _1406;
                _1413 = _1407 * _1407;
                _1414 = _1408 * _1408;
                _1415 = _1412 * _1406;
                _1416 = _1413 * _1407;
                _1417 = _1414 * _1408;
                _1418 = 1.0f - _1409;
                _1419 = 1.0f - _1410;
                _1420 = 1.0f - _1411;
                _1430 = _1418 * _1418;
                _1431 = _1419 * _1419;
                _1432 = _1420 * _1420;
                _1433 = _1430 * _1418;
                _1434 = _1431 * _1419;
                _1435 = _1432 * _1420;
                _1443 = min(max(_1215, 0.18000000715255737f), 0.6000000238418579f);
                _1444 = _1443 * _1443;
                _1445 = _1444 * 0.25f;
                _1446 = _1444 * 4.0f;
                _1448 = (_1404 + _1403) + _1405;
                _1449 = _1403 / _1448;
                _1450 = _1404 / _1448;
                _1451 = _1405 / _1448;
                _1452 = dot(float3(_1444, _1445, _1446), float3(_1449, _1450, _1451));
                _1453 = _1452 * _1452;
                _1456 = asin(min(max(_1239, -1.0f), 1.0f)) + asin(min(max(_1235, -1.0f), 1.0f));
                _1457 = _1456 * 0.5f;
                _1458 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1449, _1450, _1451));
                _1468 = _1458 * _1458;
                _1491 = (_1407 + _1406) + _1408;
                _1495 = dot(float3(_1444, _1445, _1446), float3((_1406 / _1491), (_1407 / _1491), (_1408 / _1491)));
                _1499 = sqrt((_1495 * _1495) + (_1453 * 2.0f));
                _1517 = (_1495 * 3.0f) + (_1452 * 2.0f);
                _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1415) + _1406);
                _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1416) + _1407);
                _1526 = (((_1417 + _1408) * ((_1411 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1417) + _1408);
                _1535 = _1457 - (((_1468 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
                _1542 = _1457 - (((_1468 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
                _1549 = _1457 - (((_1468 * (((_1411 * 4.0f) * _1414) + (_1432 * 2.0f))) * (1.0f - ((_1414 * 2.0f) / _1432))) / _1435);
                _1577 = exp2((((_1456 * -0.25f) * _1457) / _1453) * 1.4426950216293335f) * 1.399999976158142f;
                _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1535 * _1535) * -0.5f) / ((_1524 * _1524) + _1453)) * 1.4426950216293335f)) + ((((_1390.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1577;
                _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1542 * _1542) * -0.5f) / ((_1525 * _1525) + _1453)) * 1.4426950216293335f)) + ((((_1393.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1577;
                _1580 = ((((((_1417 * _1411) / _1435) + ((_1408 * _1411) / _1420)) * 4.398229598999023f) * exp2((((_1549 * _1549) * -0.5f) / ((_1526 * _1526) + _1453)) * 1.4426950216293335f)) + ((((_1396.x + _1372) * 0.25f) - _1372) * 6.2831854820251465f)) * _1577;
                _1581 = max(0.125f, _1149);
                _1591 = max(0.009999999776482582f, ((_1581 * (_1232 - _1578)) + _1578));
                _1592 = max(0.009999999776482582f, (lerp(_1579, _1233, _1581)));
                _1593 = max(0.009999999776482582f, (lerp(_1580, _1234, _1581)));
                _1595 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
                _1602 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
                _1612 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
                _1622 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
                _1647 = _1149;
                _1648 = _1153;
                _1649 = _1150;
                _1650 = _1151;
                _1651 = _1152;
                _1652 = _1067;
                _1653 = (min(30000.0f, (_exposure4.x * (((((_1602.x * _866) + (_1595.x * _865)) + (_1612.x * _867)) + (_1622.x * _868)) / _1591))) + _918);
                _1654 = (min(30000.0f, (_exposure4.x * (((((_1602.y * _866) + (_1595.y * _865)) + (_1612.y * _867)) + (_1622.y * _868)) / _1592))) + _919);
                _1655 = (min(30000.0f, (_exposure4.x * (((((_1602.z * _866) + (_1595.z * _865)) + (_1612.z * _867)) + (_1622.z * _868)) / _1593))) + _920);
                _1656 = _1591;
                _1657 = _1592;
                _1658 = _1593;
              } else {
                _1647 = _1139;
                _1648 = _1143;
                _1649 = _1140;
                _1650 = _1141;
                _1651 = _1142;
                _1652 = _1067;
                _1653 = _918;
                _1654 = _919;
                _1655 = _920;
                _1656 = 0.0f;
                _1657 = 0.0f;
                _1658 = 0.0f;
              }
            }
          }
        } else {
          _1647 = 1.0f;
          _1648 = 0.0h;
          _1649 = _674;
          _1650 = _675;
          _1651 = _676;
          _1652 = 53;
          _1653 = _918;
          _1654 = _919;
          _1655 = _920;
          _1656 = 0.0f;
          _1657 = 0.0f;
          _1658 = 0.0f;
        }
      } else {
        _1102 = 0.0f;
        _1103 = _1068;
        if (_1077) {
          _1115 = (_1032 * 2.0f) + -1.0f;
          _1116 = (_1033 * 2.0f) + -1.0f;
          _1118 = 1.0f - abs(_1115);
          _1119 = abs(_1116);
          _1120 = _1118 - _1119;
          if (!(_1120 >= 0.0f)) {
            _1131 = ((1.0f - _1119) * select((_1115 >= 0.0f), 1.0f, -1.0f));
            _1132 = (_1118 * select((_1116 >= 0.0f), 1.0f, -1.0f));
          } else {
            _1131 = _1115;
            _1132 = _1116;
          }
          _1134 = rsqrt(dot(float3(_1131, _1132, _1120), float3(_1131, _1132, _1120)));  // [sem: invLength]
          _1149 = _1102;
          _1150 = (_1134 * _1131);
          _1151 = (_1134 * _1132);
          _1152 = (_1134 * _1120);
          _1153 = 0.0h;
          _1155 = __3__36__0__0__g_bentCone.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
          _1162 = __3__36__0__0__g_bentCone.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
          _1172 = __3__36__0__0__g_bentCone.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
          _1182 = __3__36__0__0__g_bentCone.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
          _1195 = (((((_1162.x * _866) + (_1155.x * _865)) + (_1172.x * _867)) + (_1182.x * _868)) * 2.0f) + -1.0f;
          _1196 = (((((_1162.y * _866) + (_1155.y * _865)) + (_1172.y * _867)) + (_1182.y * _868)) * 2.0f) + -1.0f;
          _1197 = (((((_1162.z * _866) + (_1155.z * _865)) + (_1172.z * _867)) + (_1182.z * _868)) * 2.0f) + -1.0f;
          _1199 = rsqrt(dot(float3(_1195, _1196, _1197), float3(_1195, _1196, _1197)));  // [sem: invLength]
          _1200 = _1195 * _1199;
          _1201 = _1196 * _1199;
          _1202 = _1197 * _1199;
          if (!(_renderParams.z > 0.0f)) {
            if (!(_renderParams2.y > 0.0f)) {
              _1214 = (half)(saturate((half)(_162 + 0.15002441h)));
            } else {
              _1214 = _162;
            }
          } else {
            _1214 = _162;
          }
          _1215 = float(_1214);
          if (_1067 == 54) {
            _1231 = (((asfloat(_globalLightParams.z) * _1215) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
          } else {
            _1231 = _bevelParams.y;
          }
          _1232 = float(_283);
          _1233 = float(_284);
          _1234 = float(_285);
          _1235 = dot(float3(_1150, _1151, _1152), float3(_1200, _1201, _1202));
          _1236 = -0.0f - _1014;
          _1237 = -0.0f - _1015;
          _1238 = -0.0f - _1016;
          _1239 = dot(float3(_1150, _1151, _1152), float3(_1236, _1237, _1238));
          _1245 = cos(abs(asin(_1239) - asin(_1235)) * 0.5f);
          _1249 = _1200 - (_1235 * _1150);
          _1250 = _1201 - (_1235 * _1151);
          _1251 = _1202 - (_1235 * _1152);
          _1255 = _1236 - (_1239 * _1150);
          _1256 = _1237 - (_1239 * _1151);
          _1257 = _1238 - (_1239 * _1152);
  // [sem: invLength]
          _1264 = rsqrt((dot(float3(_1255, _1256, _1257), float3(_1255, _1256, _1257)) * dot(float3(_1249, _1250, _1251), float3(_1249, _1250, _1251))) + 9.999999747378752e-05f) * dot(float3(_1249, _1250, _1251), float3(_1255, _1256, _1257));
          _1274 = min(max(_1215, 0.09803921729326248f), 1.0f);
          _1275 = _1274 * _1274;
          _1276 = _1275 * 0.5f;
          _1277 = _1275 * 2.0f;
          _1278 = _1239 + _1235;
          _1279 = _1278 - _1231;
          _1288 = 1.0f / ((1.190000057220459f / _1245) + (_1245 * 0.36000001430511475f));
          _1293 = ((_1288 * (0.6000000238418579f - (_1264 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1264 * 0.5f) + 0.5f));
          _1299 = 1.0f - (sqrt(saturate(1.0f - (_1293 * _1293))) * _1245);
          _1300 = _1299 * _1299;
          _1304 = 0.9534794092178345f - ((_1300 * _1300) * (_1299 * 0.9534794092178345f));
          _1305 = _1288 * _1293;
          _1310 = (sqrt(1.0f - (_1305 * _1305)) * 0.5f) / _1245;
          _1311 = log2(_1232);
          _1312 = log2(_1233);
          _1313 = log2(_1234);
          _1325 = ((_1304 * _1304) * (exp2((((_1279 * _1279) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1275 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1264 * 5.2658371925354f));
          _1329 = _1278 - (_1231 * 4.0f);
          _1339 = 1.0f - (_1245 * 0.5f);
          _1340 = _1339 * _1339;
          _1344 = (_1340 * _1340) * (0.9534794092178345f - (_1245 * 0.47673970460891724f));
          _1346 = 0.9534794092178345f - _1344;
          _1347 = 0.800000011920929f / _1245;
          _1360 = (((_1346 * _1346) * (_1344 + 0.04652056470513344f)) * (exp2((((_1329 * _1329) * -0.5f) / (_1277 * _1277)) * 1.4426950216293335f) / (_1275 * 5.013256549835205f))) * exp2((_1264 * 24.525815963745117f) + -24.208423614501953f);
          _1370 = min(0.0f, (-0.0f - ((_1325 * exp2(_1311 * _1310)) + (_1360 * exp2(_1347 * _1311)))));
          _1371 = min(0.0f, (-0.0f - ((_1325 * exp2(_1312 * _1310)) + (_1360 * exp2(_1347 * _1312)))));
          _1372 = min(0.0f, (-0.0f - ((_1325 * exp2(_1313 * _1310)) + (_1360 * exp2(_1347 * _1313)))));
          _1381 = saturate(abs(dot(float3(_1200, _1201, _1202), float3(_1150, _1151, _1152))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
          _1390 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
          _1393 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
          _1396 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1313 * 1.5f)))), 0.0f);
          _1403 = min(0.9900000095367432f, _1390.x);
          _1404 = min(0.9900000095367432f, _1393.x);
          _1405 = min(0.9900000095367432f, _1396.x);
          _1406 = min(0.9900000095367432f, _1390.y);
          _1407 = min(0.9900000095367432f, _1393.y);
          _1408 = min(0.9900000095367432f, _1396.y);
          _1409 = _1403 * _1403;
          _1410 = _1404 * _1404;
          _1411 = _1405 * _1405;
          _1412 = _1406 * _1406;
          _1413 = _1407 * _1407;
          _1414 = _1408 * _1408;
          _1415 = _1412 * _1406;
          _1416 = _1413 * _1407;
          _1417 = _1414 * _1408;
          _1418 = 1.0f - _1409;
          _1419 = 1.0f - _1410;
          _1420 = 1.0f - _1411;
          _1430 = _1418 * _1418;
          _1431 = _1419 * _1419;
          _1432 = _1420 * _1420;
          _1433 = _1430 * _1418;
          _1434 = _1431 * _1419;
          _1435 = _1432 * _1420;
          _1443 = min(max(_1215, 0.18000000715255737f), 0.6000000238418579f);
          _1444 = _1443 * _1443;
          _1445 = _1444 * 0.25f;
          _1446 = _1444 * 4.0f;
          _1448 = (_1404 + _1403) + _1405;
          _1449 = _1403 / _1448;
          _1450 = _1404 / _1448;
          _1451 = _1405 / _1448;
          _1452 = dot(float3(_1444, _1445, _1446), float3(_1449, _1450, _1451));
          _1453 = _1452 * _1452;
          _1456 = asin(min(max(_1239, -1.0f), 1.0f)) + asin(min(max(_1235, -1.0f), 1.0f));
          _1457 = _1456 * 0.5f;
          _1458 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1449, _1450, _1451));
          _1468 = _1458 * _1458;
          _1491 = (_1407 + _1406) + _1408;
          _1495 = dot(float3(_1444, _1445, _1446), float3((_1406 / _1491), (_1407 / _1491), (_1408 / _1491)));
          _1499 = sqrt((_1495 * _1495) + (_1453 * 2.0f));
          _1517 = (_1495 * 3.0f) + (_1452 * 2.0f);
          _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1415) + _1406);
          _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1416) + _1407);
          _1526 = (((_1417 + _1408) * ((_1411 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1417) + _1408);
          _1535 = _1457 - (((_1468 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
          _1542 = _1457 - (((_1468 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
          _1549 = _1457 - (((_1468 * (((_1411 * 4.0f) * _1414) + (_1432 * 2.0f))) * (1.0f - ((_1414 * 2.0f) / _1432))) / _1435);
          _1577 = exp2((((_1456 * -0.25f) * _1457) / _1453) * 1.4426950216293335f) * 1.399999976158142f;
          _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1535 * _1535) * -0.5f) / ((_1524 * _1524) + _1453)) * 1.4426950216293335f)) + ((((_1390.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1577;
          _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1542 * _1542) * -0.5f) / ((_1525 * _1525) + _1453)) * 1.4426950216293335f)) + ((((_1393.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1577;
          _1580 = ((((((_1417 * _1411) / _1435) + ((_1408 * _1411) / _1420)) * 4.398229598999023f) * exp2((((_1549 * _1549) * -0.5f) / ((_1526 * _1526) + _1453)) * 1.4426950216293335f)) + ((((_1396.x + _1372) * 0.25f) - _1372) * 6.2831854820251465f)) * _1577;
          _1581 = max(0.125f, _1149);
          _1591 = max(0.009999999776482582f, ((_1581 * (_1232 - _1578)) + _1578));
          _1592 = max(0.009999999776482582f, (lerp(_1579, _1233, _1581)));
          _1593 = max(0.009999999776482582f, (lerp(_1580, _1234, _1581)));
          _1595 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
          _1602 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
          _1612 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
          _1622 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
          _1647 = _1149;
          _1648 = _1153;
          _1649 = _1150;
          _1650 = _1151;
          _1651 = _1152;
          _1652 = _1067;
          _1653 = (min(30000.0f, (_exposure4.x * (((((_1602.x * _866) + (_1595.x * _865)) + (_1612.x * _867)) + (_1622.x * _868)) / _1591))) + _918);
          _1654 = (min(30000.0f, (_exposure4.x * (((((_1602.y * _866) + (_1595.y * _865)) + (_1612.y * _867)) + (_1622.y * _868)) / _1592))) + _919);
          _1655 = (min(30000.0f, (_exposure4.x * (((((_1602.z * _866) + (_1595.z * _865)) + (_1612.z * _867)) + (_1622.z * _868)) / _1593))) + _920);
          _1656 = _1591;
          _1657 = _1592;
          _1658 = _1593;
        } else {
          _1139 = _1102;
          _1140 = _674;
          _1141 = _675;
          _1142 = _676;
          _1143 = _1103;
          if ((_1067 == 54) || ((_1067 & 126) == 66)) {
            _1149 = _1139;
            _1150 = _1140;
            _1151 = _1141;
            _1152 = _1142;
            _1153 = _1143;
            _1155 = __3__36__0__0__g_bentCone.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
            _1162 = __3__36__0__0__g_bentCone.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_bentCone_load]
            _1172 = __3__36__0__0__g_bentCone.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
            _1182 = __3__36__0__0__g_bentCone.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_bentCone_load]
            _1195 = (((((_1162.x * _866) + (_1155.x * _865)) + (_1172.x * _867)) + (_1182.x * _868)) * 2.0f) + -1.0f;
            _1196 = (((((_1162.y * _866) + (_1155.y * _865)) + (_1172.y * _867)) + (_1182.y * _868)) * 2.0f) + -1.0f;
            _1197 = (((((_1162.z * _866) + (_1155.z * _865)) + (_1172.z * _867)) + (_1182.z * _868)) * 2.0f) + -1.0f;
            _1199 = rsqrt(dot(float3(_1195, _1196, _1197), float3(_1195, _1196, _1197)));  // [sem: invLength]
            _1200 = _1195 * _1199;
            _1201 = _1196 * _1199;
            _1202 = _1197 * _1199;
            if (!(_renderParams.z > 0.0f)) {
              if (!(_renderParams2.y > 0.0f)) {
                _1214 = (half)(saturate((half)(_162 + 0.15002441h)));
              } else {
                _1214 = _162;
              }
            } else {
              _1214 = _162;
            }
            _1215 = float(_1214);
            if (_1067 == 54) {
              _1231 = (((asfloat(_globalLightParams.z) * _1215) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
            } else {
              _1231 = _bevelParams.y;
            }
            _1232 = float(_283);
            _1233 = float(_284);
            _1234 = float(_285);
            _1235 = dot(float3(_1150, _1151, _1152), float3(_1200, _1201, _1202));
            _1236 = -0.0f - _1014;
            _1237 = -0.0f - _1015;
            _1238 = -0.0f - _1016;
            _1239 = dot(float3(_1150, _1151, _1152), float3(_1236, _1237, _1238));
            _1245 = cos(abs(asin(_1239) - asin(_1235)) * 0.5f);
            _1249 = _1200 - (_1235 * _1150);
            _1250 = _1201 - (_1235 * _1151);
            _1251 = _1202 - (_1235 * _1152);
            _1255 = _1236 - (_1239 * _1150);
            _1256 = _1237 - (_1239 * _1151);
            _1257 = _1238 - (_1239 * _1152);
  // [sem: invLength]
            _1264 = rsqrt((dot(float3(_1255, _1256, _1257), float3(_1255, _1256, _1257)) * dot(float3(_1249, _1250, _1251), float3(_1249, _1250, _1251))) + 9.999999747378752e-05f) * dot(float3(_1249, _1250, _1251), float3(_1255, _1256, _1257));
            _1274 = min(max(_1215, 0.09803921729326248f), 1.0f);
            _1275 = _1274 * _1274;
            _1276 = _1275 * 0.5f;
            _1277 = _1275 * 2.0f;
            _1278 = _1239 + _1235;
            _1279 = _1278 - _1231;
            _1288 = 1.0f / ((1.190000057220459f / _1245) + (_1245 * 0.36000001430511475f));
            _1293 = ((_1288 * (0.6000000238418579f - (_1264 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_1264 * 0.5f) + 0.5f));
            _1299 = 1.0f - (sqrt(saturate(1.0f - (_1293 * _1293))) * _1245);
            _1300 = _1299 * _1299;
            _1304 = 0.9534794092178345f - ((_1300 * _1300) * (_1299 * 0.9534794092178345f));
            _1305 = _1288 * _1293;
            _1310 = (sqrt(1.0f - (_1305 * _1305)) * 0.5f) / _1245;
            _1311 = log2(_1232);
            _1312 = log2(_1233);
            _1313 = log2(_1234);
            _1325 = ((_1304 * _1304) * (exp2((((_1279 * _1279) * -0.5f) / (_1276 * _1276)) * 1.4426950216293335f) / (_1275 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_1264 * 5.2658371925354f));
            _1329 = _1278 - (_1231 * 4.0f);
            _1339 = 1.0f - (_1245 * 0.5f);
            _1340 = _1339 * _1339;
            _1344 = (_1340 * _1340) * (0.9534794092178345f - (_1245 * 0.47673970460891724f));
            _1346 = 0.9534794092178345f - _1344;
            _1347 = 0.800000011920929f / _1245;
            _1360 = (((_1346 * _1346) * (_1344 + 0.04652056470513344f)) * (exp2((((_1329 * _1329) * -0.5f) / (_1277 * _1277)) * 1.4426950216293335f) / (_1275 * 5.013256549835205f))) * exp2((_1264 * 24.525815963745117f) + -24.208423614501953f);
            _1370 = min(0.0f, (-0.0f - ((_1325 * exp2(_1311 * _1310)) + (_1360 * exp2(_1347 * _1311)))));
            _1371 = min(0.0f, (-0.0f - ((_1325 * exp2(_1312 * _1310)) + (_1360 * exp2(_1347 * _1312)))));
            _1372 = min(0.0f, (-0.0f - ((_1325 * exp2(_1313 * _1310)) + (_1360 * exp2(_1347 * _1313)))));
            _1381 = saturate(abs(dot(float3(_1200, _1201, _1202), float3(_1150, _1151, _1152))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
            _1390 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1311 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
            _1393 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1312 * 1.5f)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
            _1396 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_1381, _1215, saturate(sqrt(exp2(_1313 * 1.5f)))), 0.0f);
            _1403 = min(0.9900000095367432f, _1390.x);
            _1404 = min(0.9900000095367432f, _1393.x);
            _1405 = min(0.9900000095367432f, _1396.x);
            _1406 = min(0.9900000095367432f, _1390.y);
            _1407 = min(0.9900000095367432f, _1393.y);
            _1408 = min(0.9900000095367432f, _1396.y);
            _1409 = _1403 * _1403;
            _1410 = _1404 * _1404;
            _1411 = _1405 * _1405;
            _1412 = _1406 * _1406;
            _1413 = _1407 * _1407;
            _1414 = _1408 * _1408;
            _1415 = _1412 * _1406;
            _1416 = _1413 * _1407;
            _1417 = _1414 * _1408;
            _1418 = 1.0f - _1409;
            _1419 = 1.0f - _1410;
            _1420 = 1.0f - _1411;
            _1430 = _1418 * _1418;
            _1431 = _1419 * _1419;
            _1432 = _1420 * _1420;
            _1433 = _1430 * _1418;
            _1434 = _1431 * _1419;
            _1435 = _1432 * _1420;
            _1443 = min(max(_1215, 0.18000000715255737f), 0.6000000238418579f);
            _1444 = _1443 * _1443;
            _1445 = _1444 * 0.25f;
            _1446 = _1444 * 4.0f;
            _1448 = (_1404 + _1403) + _1405;
            _1449 = _1403 / _1448;
            _1450 = _1404 / _1448;
            _1451 = _1405 / _1448;
            _1452 = dot(float3(_1444, _1445, _1446), float3(_1449, _1450, _1451));
            _1453 = _1452 * _1452;
            _1456 = asin(min(max(_1239, -1.0f), 1.0f)) + asin(min(max(_1235, -1.0f), 1.0f));
            _1457 = _1456 * 0.5f;
            _1458 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_1449, _1450, _1451));
            _1468 = _1458 * _1458;
            _1491 = (_1407 + _1406) + _1408;
            _1495 = dot(float3(_1444, _1445, _1446), float3((_1406 / _1491), (_1407 / _1491), (_1408 / _1491)));
            _1499 = sqrt((_1495 * _1495) + (_1453 * 2.0f));
            _1517 = (_1495 * 3.0f) + (_1452 * 2.0f);
            _1524 = (((_1415 + _1406) * ((_1409 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1415) + _1406);
            _1525 = (((_1416 + _1407) * ((_1410 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1416) + _1407);
            _1526 = (((_1417 + _1408) * ((_1411 * 0.699999988079071f) + 1.0f)) * _1499) / ((_1517 * _1417) + _1408);
            _1535 = _1457 - (((_1468 * (((_1409 * 4.0f) * _1412) + (_1430 * 2.0f))) * (1.0f - ((_1412 * 2.0f) / _1430))) / _1433);
            _1542 = _1457 - (((_1468 * (((_1410 * 4.0f) * _1413) + (_1431 * 2.0f))) * (1.0f - ((_1413 * 2.0f) / _1431))) / _1434);
            _1549 = _1457 - (((_1468 * (((_1411 * 4.0f) * _1414) + (_1432 * 2.0f))) * (1.0f - ((_1414 * 2.0f) / _1432))) / _1435);
            _1577 = exp2((((_1456 * -0.25f) * _1457) / _1453) * 1.4426950216293335f) * 1.399999976158142f;
            _1578 = ((((((_1415 * _1409) / _1433) + ((_1406 * _1409) / _1418)) * 4.398229598999023f) * exp2((((_1535 * _1535) * -0.5f) / ((_1524 * _1524) + _1453)) * 1.4426950216293335f)) + ((((_1390.x + _1370) * 0.25f) - _1370) * 6.2831854820251465f)) * _1577;
            _1579 = ((((((_1416 * _1410) / _1434) + ((_1407 * _1410) / _1419)) * 4.398229598999023f) * exp2((((_1542 * _1542) * -0.5f) / ((_1525 * _1525) + _1453)) * 1.4426950216293335f)) + ((((_1393.x + _1371) * 0.25f) - _1371) * 6.2831854820251465f)) * _1577;
            _1580 = ((((((_1417 * _1411) / _1435) + ((_1408 * _1411) / _1420)) * 4.398229598999023f) * exp2((((_1549 * _1549) * -0.5f) / ((_1526 * _1526) + _1453)) * 1.4426950216293335f)) + ((((_1396.x + _1372) * 0.25f) - _1372) * 6.2831854820251465f)) * _1577;
            _1581 = max(0.125f, _1149);
            _1591 = max(0.009999999776482582f, ((_1581 * (_1232 - _1578)) + _1578));
            _1592 = max(0.009999999776482582f, (lerp(_1579, _1233, _1581)));
            _1593 = max(0.009999999776482582f, (lerp(_1580, _1234, _1581)));
            _1595 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
            _1602 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
            _1612 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
            _1622 = __3__36__0__0__g_sceneSpecularHalf.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_sceneSpecularHalf_load]
            _1647 = _1149;
            _1648 = _1153;
            _1649 = _1150;
            _1650 = _1151;
            _1651 = _1152;
            _1652 = _1067;
            _1653 = (min(30000.0f, (_exposure4.x * (((((_1602.x * _866) + (_1595.x * _865)) + (_1612.x * _867)) + (_1622.x * _868)) / _1591))) + _918);
            _1654 = (min(30000.0f, (_exposure4.x * (((((_1602.y * _866) + (_1595.y * _865)) + (_1612.y * _867)) + (_1622.y * _868)) / _1592))) + _919);
            _1655 = (min(30000.0f, (_exposure4.x * (((((_1602.z * _866) + (_1595.z * _865)) + (_1612.z * _867)) + (_1622.z * _868)) / _1593))) + _920);
            _1656 = _1591;
            _1657 = _1592;
            _1658 = _1593;
          } else {
            _1647 = _1139;
            _1648 = _1143;
            _1649 = _1140;
            _1650 = _1141;
            _1651 = _1142;
            _1652 = _1067;
            _1653 = _918;
            _1654 = _919;
            _1655 = _920;
            _1656 = 0.0f;
            _1657 = 0.0f;
            _1658 = 0.0f;
          }
        }
      }
    }
    _1665 = -0.0f - min(0.0f, (-0.0f - _1653));
    _1666 = -0.0f - min(0.0f, (-0.0f - _1654));
    _1667 = -0.0f - min(0.0f, (-0.0f - _1655));
    half2 _1669 = __3__36__0__0__g_sceneAO.Load(int3(_497, _498, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _1676 = __3__36__0__0__g_sceneAO.Load(int3(_880, _498, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _1685 = __3__36__0__0__g_sceneAO.Load(int3(_497, _894, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    half2 _1694 = __3__36__0__0__g_sceneAO.Load(int3(_880, _894, 0));  // [sem: _3__36__0__0__g_sceneAO_load]
    _1701 = (((float(_1676.x) * _866) + (float(_1669.x) * _865)) + (float(_1685.x) * _867)) + (float(_1694.x) * _868);
    if ((uint)_1652 > (uint)11) {
      _1708 = ((uint)_1652 < (uint)19);
      if (!((uint)_1652 < (uint)20)) {
        _1711 = _1708;
        _1714 = _1711;
        _1715 = (_1652 == 107);
      } else {
        _1714 = _1708;
        _1715 = true;
      }
    } else {
      if (!((uint)_1652 > (uint)10)) {
        _1711 = false;
        _1714 = _1711;
        _1715 = (_1652 == 107);
      } else {
        _1714 = false;
        _1715 = true;
      }
    }
    _1720 = (_1652 == 65);
    _1721 = _1720 || (_1714 || ((_1652 == 96) || _1715));
    _1723 = select(_1721, float(_1648), 0.0f);
    _1726 = ((uint)(_1652 & 24) > (uint)23);
    if (_1726) {
      _1728 = (_1652 == 29);
      if (_1728) {
        _1733 = float(saturate(_162));
      } else {
        _1733 = 0.0f;
      }
      _1735 = uint((half)(_166 * 255.0h));
      if (_179) {
        _1744 = select(((_1735 & 128) != 0), 1.0f, 0.0f);
        _1745 = (((float)((uint)((uint)(_1735 & 127)))) * 0.007874015718698502f);
      } else {
        _1744 = 0.0f;
        _1745 = 0.0f;
      }
      _1746 = half(_1745);
      _1750 = (_1746 > 0.99902344h);
      _1755 = _1744;
      _1756 = _1733;
      _1757 = _1746;
      _1758 = (half)(select(((_1652 == 24) || _1728), 0.010002136f, _162));
      _1759 = (half)(select(_1750, 1.0f, _283));
      _1760 = (half)(select(_1750, 1.0f, _284));
      _1761 = (half)(select(_1750, 1.0f, _285));
    } else {
      _1755 = 0.0f;
      _1756 = 0.0f;
      _1757 = (half)(select(_1721, 0.0f, _1648));
      _1758 = _162;
      _1759 = _283;
      _1760 = _284;
      _1761 = _285;
    }
    // RenoDX: >>> [Patch: FoliageColorCorrect] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x973D36C7 applies AO+ foliage color shaping to foliage stencil materials after vanilla resolves the direct diffuse base color, using g_sceneShadowColor visibility so shadowed foliage does not receive the fully sunlit color-shaping path.
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_117 - 12) < 7u)) {
      float3 _rndx_fcBaseColor = float3(float(_1759), float(_1760), float(_1761));
      half4 _rndx_fcShadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_99, _101, 0));
      float _rndx_fcShadowVis = saturate(dot(float3(_rndx_fcShadow.xyz), float3(0.2126f, 0.7152f, 0.0722f)));
      float3 _rndx_fcCorrected = FoliageColorCorrect(_rndx_fcBaseColor, _sunDirection.xyz, _rndx_fcShadowVis, float3(1.0f, 1.0f, 1.0f));
      float3 _rndx_fscColor = FoliageSelectiveColor(_rndx_fcCorrected);
      _1759 = half(_rndx_fscColor.x);
      _1760 = half(_rndx_fscColor.y);
      _1761 = half(_rndx_fscColor.z);
    }
    // RenoDX: <<< [Patch: FoliageColorCorrect]
    _1762 = _1652 & -2;
    _1763 = (_1762 == 66);
    _1764 = (_1652 == 54);
    _1765 = _1764 || _1763;
    _1766 = -0.0f - _1014;
    _1767 = -0.0f - _1015;
    _1768 = -0.0f - _1016;
    _1769 = dot(float3(_1766, _1767, _1768), float3(_674, _675, _676));
    if (_1765) {
      _1773 = abs(_1769);
    } else {
      _1773 = _1769;
    }
    _1774 = saturate(_1773);  // [sem: _1773_sat]
    _1776 = ((_115.x & 128) == 0);  // [sem: _3__36__0__0__g_stencil_load_derived]
    if (_1776) {
      if ((uint)_117 > (uint)52) {
        if (!(((_115.x & 125) == 105) || ((uint)_117 < (uint)68))) {
          _1796 = (_117 == 98);
        } else {
          _1796 = true;
        }
      } else {
        if ((uint)_117 > (uint)10) {
          if ((uint)_117 < (uint)20) {
            if (_615 == 14) {
              _1796 = (_117 == 98);
            } else {
              _1796 = true;
            }
          } else {
            if (!((_115.x & 125) == 105)) {
              _1796 = (_117 == 98);
            } else {
              _1796 = true;
            }
          }
        } else {
          _1796 = (_117 == 98);
        }
      }
    } else {
      _1796 = true;
    }
    [branch]
    if (_1726) {
      _1805 = (((float)((uint)((uint)((((uint)(__3__36__0__0__g_depthOpaque.Load(int3(_99, _101, 0)))).x) & 16777215)))) * 5.960465188081798e-08f);
    } else {
      _1805 = _112.x;
    }
    _1833 = mad((_projToPrevProj[2].w), _1805, mad((_projToPrevProj[1].w), _972, ((_projToPrevProj[0].w) * _970))) + (_projToPrevProj[3].w);
    if (_1796) {
      _1840 = __3__36__0__0__g_velocity.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_velocity_load]
      _1846 = (_1840.x * 2.0f);
      _1847 = (_1840.y * 2.0f);
    } else {
      _1846 = (((mad((_projToPrevProj[2].x), _1805, mad((_projToPrevProj[1].x), _972, ((_projToPrevProj[0].x) * _970))) + (_projToPrevProj[3].x)) / _1833) - _970);
      _1847 = (((mad((_projToPrevProj[2].y), _1805, mad((_projToPrevProj[1].y), _972, ((_projToPrevProj[0].y) * _970))) + (_projToPrevProj[3].y)) / _1833) - _972);
    }
    _1849 = _nearFarProj.x / max(1.0000000116860974e-07f, _1805);
    _1852 = (_1846 * 0.5f) + _109;
    _1853 = _110 - (_1847 * 0.5f);
    _1861 = select((((_1852 < 0.0f) || (_1852 > 1.0f)) || ((_1853 < 0.0f) || (_1853 > 1.0f))), 1.0f, 0.0f);
    _1866 = (_1852 * _bufferSizeAndInvSize.x) + -0.5f;
    _1867 = (_1853 * _bufferSizeAndInvSize.y) + -0.5f;
    _1870 = int(floor(_1866));
    _1871 = int(floor(_1867));
    _1872 = float((int)(_1870));
    _1873 = float((int)(_1871));
    _1876 = (_1872 + 0.5f) * _bufferSizeAndInvSize.z;
    _1877 = (_1873 + 0.5f) * _bufferSizeAndInvSize.w;
    _1879 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1876, _1877));  // [sem: _3__36__0__0__g_depthOpaquePrev_gather]
    _1902 = mad(((uint)((uint)(_1879.w)) >> 24), 16777216, mad(((uint)((uint)(_1879.z)) >> 24), 65536, mad(((uint)((uint)(_1879.y)) >> 24), 256, ((uint)((uint)(_1879.x)) >> 24))));
    if (_1776) {
      if ((uint)_117 > (uint)52) {
        if (!((_117 == 98) || (((_115.x & 125) == 105) || ((uint)_117 < (uint)68)))) {
          _1932 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _1932 = 0.0f;
        }
      } else {
        if ((uint)_117 > (uint)10) {
          if ((uint)_117 < (uint)20) {
            if (_615 == 14) {
              _1932 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1932 = 0.0f;
            }
          } else {
            if (!((_115.x & 125) == 105)) {
              _1932 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1932 = 0.0f;
            }
          }
        } else {
          _1932 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _1932 = 0.0f;
    }
    _1940 = _screenPercentage.x * 2.0f;
    _1941 = _1940 * abs(_109 + -0.5f);
    _1942 = _screenPercentage.y * 2.0f;
    _1943 = _1942 * abs(_110 + -0.5f);
    _1947 = sqrt(dot(float2(_1941, _1943), float2(_1941, _1943)) + 1.0f) * _1849;
    _1964 = _1940 * abs(_1852 + -0.5f);
    _1965 = _1942 * abs(_1853 + -0.5f);
    _1968 = sqrt(dot(float2(_1964, _1965), float2(_1964, _1965)) + 1.0f);
    _1983 = _595 || ((uint)(_1652 + -97) < (uint)2);
    _1985 = _1849 * _1849;
    _1987 = (_1985 * select(_1983, 0.5f, 0.20000000298023224f)) + 1.0f;
    _1991 = ((uint)(_1652 + -53) < (uint)15);
    if (_1991) {
      _2010 = (1000.0f - (saturate((float)((bool)(uint)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _2010 = 50.0f;
    }
    _2018 = select(((_1652 == 57) || _1991), 0.0f, ((_temporalReprojectionParams.y * 0.10000000149011612f) * max(0.0f, (_1849 + -1.0f))));
    _2023 = max(0.0f, (abs(_1947 - (_1968 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1879.x & 16777215)))) * 5.960465188081798e-08f))) - _1932))) - _2018));
    _2024 = max(0.0f, (abs(_1947 - (_1968 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1879.y & 16777215)))) * 5.960465188081798e-08f))) - _1932))) - _2018));
    _2025 = max(0.0f, (abs(_1947 - (_1968 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1879.z & 16777215)))) * 5.960465188081798e-08f))) - _1932))) - _2018));
    _2026 = max(0.0f, (abs(_1947 - (_1968 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (((float)((uint)((uint)(_1879.w & 16777215)))) * 5.960465188081798e-08f))) - _1932))) - _2018));
    _2027 = _2023 * _2023;
    _2028 = _2024 * _2024;
    _2029 = _2025 * _2025;
    _2030 = _2026 * _2026;
    _2032 = (-1.4426950216293335f / ((_1985 * 0.10000000149011612f) + 1.0f)) * select(_1983, 0.20000000298023224f, _2010);
    _2045 = select((_2027 > _1987), 0.0f, exp2(_2032 * _2027));
    _2046 = select((_2028 > _1987), 0.0f, exp2(_2028 * _2032));
    _2047 = select((_2029 > _1987), 0.0f, exp2(_2029 * _2032));
    _2048 = select((_2030 > _1987), 0.0f, exp2(_2030 * _2032));
    if (!_1726) {
      _2050 = _1902 & 127;
      _2051 = _1902 & 32512;
      _2052 = _1902 & 8323072;
      _2053 = _1902 & 2130706432;
      _2092 = (_2050 == 57) || ((uint)(_2050 + -53) < (uint)15);
      _2093 = (_2051 == 14592) || ((uint)((((uint)(_1902) >> 8) & 127) + -53) < (uint)15);
      _2094 = (_2052 == 3735552) || ((uint)((((uint)(_1902) >> 16) & 127) + -53) < (uint)15);
      _2095 = (_2053 == 956301312) || ((uint)((((uint)(_1902) >> 24) & 127) + -53) < (uint)15);
      _2107 = _117 + -53;
      if (_1776) {
        _2113 = ((_117 == 57) || ((uint)_2107 < (uint)15));
      } else {
        _2113 = true;
      }
      _2122 = (_1652 == 6);
      _2144 = ((uint)(_1652 + -105) < (uint)3);
      _2151 = (_117 == 57) || ((uint)_2107 < (uint)15);
      _2185 = (((float)((bool)((uint)((_618 || ((_2050 != 54) && ((_1902 & 126) != 66))) && (!(((((_1902 & 128) != 0) || _2092) ^ _2113) || ((_2122 ^ (_2050 == 6)) || ((_2144 ^ ((_2050 == 107) || ((uint)(_2050 + -105) < (uint)2))) || (_2092 ^ _2151))))))))) * _2045);
      _2186 = (((float)((bool)((uint)((_618 || ((_2051 != 13824) && ((_1902 & 32256) != 16896))) && (!(((((_1902 & 32768) != 0) || _2093) ^ _2113) || ((_2122 ^ (_2051 == 1536)) || ((_2144 ^ (((_1902 & 32000) == 26880) || (_2051 == 27136))) || (_2093 ^ _2151))))))))) * _2046);
      _2187 = (((float)((bool)((uint)((_618 || ((_2052 != 3538944) && ((_1902 & 8257536) != 4325376))) && (!(((((_1902 & 8388608) != 0) || _2094) ^ _2113) || ((_2122 ^ (_2052 == 393216)) || ((_2144 ^ (((_1902 & 8192000) == 6881280) || (_2052 == 6946816))) || (_2094 ^ _2151))))))))) * _2047);
      _2188 = (((float)((bool)((uint)((_618 || ((_2053 != 905969664) && ((_1902 & 2113929216) != 1107296256))) && (!(((((int)_1902 < (int)0) || _2095) ^ _2113) || ((_2122 ^ (_2053 == 100663296)) || ((_2144 ^ (((_1902 & 2097152000) == 1761607680) || (_2053 == 1778384896))) || (_2095 ^ _2151))))))))) * _2048);
    } else {
      _2185 = _2045;
      _2186 = _2046;
      _2187 = _2047;
      _2188 = _2048;
    }
    _2190 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1876, _1877));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather]
    _2209 = min(1.0f, ((((float)((uint)((uint)(_2190.w & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2210 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2190.w)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2211 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2190.w)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _2213 = rsqrt(dot(float3(_2209, _2210, _2211), float3(_2209, _2210, _2211)));  // [sem: invLength]
    _2218 = saturate(dot(float3(_674, _675, _676), float3((_2213 * _2209), (_2213 * _2210), (_2213 * _2211))));  // [sem: expr_sat]
    _2233 = min(1.0f, ((((float)((uint)((uint)(_2190.z & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2234 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2190.z)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2235 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2190.z)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _2237 = rsqrt(dot(float3(_2233, _2234, _2235), float3(_2233, _2234, _2235)));  // [sem: invLength]
    _2242 = saturate(dot(float3(_674, _675, _676), float3((_2237 * _2233), (_2237 * _2234), (_2237 * _2235))));  // [sem: expr_sat]
    _2257 = min(1.0f, ((((float)((uint)((uint)(_2190.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2258 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2190.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2259 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2190.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _2261 = rsqrt(dot(float3(_2257, _2258, _2259), float3(_2257, _2258, _2259)));  // [sem: invLength]
    _2266 = saturate(dot(float3(_674, _675, _676), float3((_2261 * _2257), (_2261 * _2258), (_2261 * _2259))));  // [sem: expr_sat]
    _2281 = min(1.0f, ((((float)((uint)((uint)(_2190.y & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2282 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2190.y)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormalPrev_gather_derived]
    _2283 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_2190.y)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
    _2285 = rsqrt(dot(float3(_2281, _2282, _2283), float3(_2281, _2282, _2283)));  // [sem: invLength]
    _2290 = saturate(dot(float3(_674, _675, _676), float3((_2285 * _2281), (_2285 * _2282), (_2285 * _2283))));  // [sem: expr_sat]
    _2293 = select((_1764 || (_1763 || _1983)), 0.009999999776482582f, 1.0f);
    _2310 = _1866 - _1872;
    _2311 = _1867 - _1873;
    _2312 = 1.0f - _2310;
    _2313 = 1.0f - _2311;
    _2318 = (_2312 * _2311) * _2185;
    _2320 = (_2311 * _2310) * _2186;
    _2322 = (_2313 * _2310) * _2187;
    _2324 = (_2313 * _2312) * _2188;
    _2326 = saturate(select(_1726, 1.0f, (pow(_2266, _2293))) * _2318);  // [sem: expr_sat]
    _2327 = saturate(select(_1726, 1.0f, (pow(_2290, _2293))) * _2320);  // [sem: expr_sat]
    _2328 = saturate(select(_1726, 1.0f, (pow(_2242, _2293))) * _2322);  // [sem: expr_sat]
    _2329 = saturate(select(_1726, 1.0f, (pow(_2218, _2293))) * _2324);  // [sem: expr_sat]
    _2332 = asint(__3__37__0__0__g_structureCounterBuffer.Load(8));
    _2333 = WaveReadLaneFirst(_2332);
    [branch]
    if (!(_2333 == 0)) {
      _2341 = (((uint)(__3__36__0__0__g_tiledManyLightsMasks.Load(int3(((int)(_99) >> 5), ((int)(_101) >> 5), 0)))).x) & 4;
      _2343 = (uint)(_2341) >> 2;
      if (!(_2341 == 0)) {
        _2351 = max((saturate(dot(float3(_1665, _1666, _1667), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _1861);
        _2352 = _2343;
      } else {
        _2351 = _1861;
        _2352 = _2343;
      }
    } else {
      _2351 = _1861;
      _2352 = 0;
    }
  // [sem: expr_sat]
    _2362 = saturate(max(_2351, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    _2363 = _1871 + 1u;
    half4 _2365 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1870, _2363, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    _2370 = _1870 + 1u;
    half4 _2371 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_2370, _2363, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    half4 _2376 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_2370, _1871, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    half4 _2381 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1870, _1871, 0));  // [sem: _3__36__0__0__g_diffuseResultPrev_load]
    _2386 = dot(float4(_2326, _2327, _2328, _2329), float4(1.0f, 1.0f, 1.0f, 1.0f));
  // [sem: expr_sat]
    _2395 = saturate(dot(float4(_2326, _2327, _2328, _2329), float4(float(_2365.w), float(_2371.w), float(_2376.w), float(_2381.w))) * (1.0f / max(1.0f, _2386)));
    _2400 = sqrt((_1847 * _1847) + (_1846 * _1846)) * 50.0f;
    if (_1991) {
      _2409 = saturate(1.0f - _2400);  // [sem: expr_sat]
    } else {
      _2409 = (1.0f - (saturate(_2400) * 0.5f));  // [sem: expr_sat]
    }
    _2413 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    _2416 = min(31.0f, ((_2409 * 15.0f) * _2413));
    _2417 = (_1652 == 29);
    if (_2417) {
      _2421 = min(2.0f, _2416);
    } else {
      _2421 = _2416;
    }
    _2422 = (_1652 == 24);
    _2423 = select(_2422, 1.0f, _2395);
    _2425 = (_2423 * _2423) * 4.0f;
    _2436 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_109, _110), 0.0f);  // [sem: _3__36__0__0__g_manyLightsMoments_sampleLod]
    _2441 = saturate(_2436.w);  // [sem: expr_sat]
    _2443 = 1.0f / max(9.999999974752427e-07f, _2386);
    _2444 = _2443 * _2326;
    _2445 = _2443 * _2327;
    _2446 = _2443 * _2328;
    _2447 = _2443 * _2329;
    _2448 = saturate(saturate(max(_2362, (1.0f / ((saturate(_2425) * _2421) + 1.0f))) + _renderParams.z));  // [sem: expr_sat]
    _2490 = 1.0f / _exposure4.x;
    _2507 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_2447 * float(_2381.x)) + ((_2446 * float(_2376.x)) + ((_2444 * float(_2365.x)) + (_2445 * float(_2371.x))))))) * _exposure4.y)))));
    _2508 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_2447 * float(_2381.y)) + ((_2446 * float(_2376.y)) + ((_2444 * float(_2365.y)) + (_2445 * float(_2371.y))))))) * _exposure4.y)))));
    _2509 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_2447 * float(_2381.z)) + ((_2446 * float(_2376.z)) + ((_2444 * float(_2365.z)) + (_2445 * float(_2371.z))))))) * _exposure4.y)))));
    if (_renderParams.y == 0.0f) {
      if (_1763) {
        _2539 = _2507;
        _2540 = _2508;
        _2541 = _2509;
        _2542 = _2448;
        _2546 = _2539;
        _2547 = _2540;
        _2548 = _2541;
        _2549 = _2542;
        _2550 = saturate(_2395 + 0.0625f);  // [sem: expr_sat]
      } else {
        if (!_1764) {
          _2514 = dot(float3(_2507, _2508, _2509), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
          _2529 = ((min(_2514, _2436.y) / max(9.999999974752427e-07f, _2514)) * _2441) + saturate(1.0f - _2441);
  // [sem: expr_sat]
          _2534 = saturate((saturate(((_2436.x - _2514) * 5.0f) / max(9.999999974752427e-07f, _2436.x)) * 0.5f) + _2448);
          _2535 = (_2529 * _2507);
          _2536 = (_2529 * _2508);
          _2537 = (_2529 * _2509);
        } else {
          _2534 = _2448;  // [sem: expr_sat]
          _2535 = _2507;
          _2536 = _2508;
          _2537 = _2509;
        }
        if (!_2422) {
          _2539 = _2535;
          _2540 = _2536;
          _2541 = _2537;
          _2542 = _2534;
          _2546 = _2539;
          _2547 = _2540;
          _2548 = _2541;
          _2549 = _2542;
          _2550 = saturate(_2395 + 0.0625f);  // [sem: expr_sat]
        } else {
          _2546 = _2535;
          _2547 = _2536;
          _2548 = _2537;
          _2549 = _2534;
          _2550 = 0.0f;  // [sem: expr_sat]
        }
      }
    } else {
      _2534 = _2448;  // [sem: expr_sat]
      _2535 = _2507;
      _2536 = _2508;
      _2537 = _2509;
      if (!_2422) {
        _2539 = _2535;
        _2540 = _2536;
        _2541 = _2537;
        _2542 = _2534;
        _2546 = _2539;
        _2547 = _2540;
        _2548 = _2541;
        _2549 = _2542;
        _2550 = saturate(_2395 + 0.0625f);  // [sem: expr_sat]
      } else {
        _2546 = _2535;
        _2547 = _2536;
        _2548 = _2537;
        _2549 = _2534;
        _2550 = 0.0f;  // [sem: expr_sat]
      }
    }
    _2557 = (_2549 * (_1665 - _2546)) + _2546;
    _2558 = (_2549 * (_1666 - _2547)) + _2547;
    _2559 = (_2549 * (_1667 - _2548)) + _2548;
    __3__38__0__1__g_diffuseResultUAV[int2(_99, _101)] = float4((half)(half(_2557)), (half)(half(_2558)), (half)(half(_2559)), (half)(half(_2550)));
    _2566 = float(_1759);
    _2567 = float(_1760);
    _2568 = float(_1761);
    if (_1652 == 53) {
      _2575 = saturate(((_2567 + _2566) + _2568) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _2575 = 1.0f;  // [sem: expr_sat]
    }
    _2576 = float(_1757);
    _2582 = (0.699999988079071f / min(max(max(max(_2566, _2567), _2568), 0.009999999776482582f), 0.699999988079071f)) * _2575;
    _2592 = (((_2582 * _2566) + -0.03999999910593033f) * _2576) + 0.03999999910593033f;
    _2593 = (((_2582 * _2567) + -0.03999999910593033f) * _2576) + 0.03999999910593033f;
    _2594 = (((_2582 * _2568) + -0.03999999910593033f) * _2576) + 0.03999999910593033f;
    if (!_1726) {
      _2599 = saturate(1.0f - _1701);  // [sem: expr_sat]
    } else {
      _2599 = 1.0f;  // [sem: expr_sat]
    }
    _2602 = (_1652 == 98) || (_1762 == 96);
    if (!_2602) {
      bool __branch_chain_2603;
      if ((uint)(_1652 + -105) < (uint)2) {
        _2610 = _179;
        __branch_chain_2603 = true;
      } else {
        if (!((uint)(_1652 + -11) < (uint)9)) {
          _2610 = false;
          __branch_chain_2603 = true;
        } else {
          _2640 = 0.0h;
          _2641 = _1652;
          _2642 = 0.0f;
          _2643 = 0.0f;
          _2644 = 0.0f;
          __branch_chain_2603 = false;
        }
      }
      if (__branch_chain_2603) {
        _2612 = (_1652 == 107) || _2610;
        _2615 = select(_2612, 0.0f, _1757);
        if (_2612 || (!_1720)) {
          if (_1652 == 33) {
            _2625 = uint((_1034 * 255.0f) + 0.5f);
            _2627 = ((uint)(_2625) >> 4) & 7;
            if (!(_2627 == 0)) {
              _2634 = __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((int)(_2627 + 1))];
              _2640 = _2615;
              _2641 = _1652;
              _2642 = min((1.0f - _2634.y), _2634.x);
              _2643 = (((float)((uint)((uint)(_2625 & 15)))) * 0.06666667014360428f);
              _2644 = _2634.x;
            } else {
              _2640 = _2615;
              _2641 = _1652;
              _2642 = 0.0f;
              _2643 = 0.0f;
              _2644 = 0.0f;
            }
          } else {
            if (_1652 == 55) {
              if (!(_1034 < 0.0010000000474974513f)) {
                _2625 = uint((_1034 * 255.0f) + 0.5f);
                _2627 = ((uint)(_2625) >> 4) & 7;
                if (!(_2627 == 0)) {
                  _2634 = __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((int)(_2627 + 1))];
                  _2640 = _2615;
                  _2641 = _1652;
                  _2642 = min((1.0f - _2634.y), _2634.x);
                  _2643 = (((float)((uint)((uint)(_2625 & 15)))) * 0.06666667014360428f);
                  _2644 = _2634.x;
                } else {
                  _2640 = _2615;
                  _2641 = _1652;
                  _2642 = 0.0f;
                  _2643 = 0.0f;
                  _2644 = 0.0f;
                }
              } else {
                _2640 = _2615;
                _2641 = 53;
                _2642 = 0.0f;
                _2643 = 0.0f;
                _2644 = 0.0f;
              }
            } else {
              _2640 = _2615;
              _2641 = _1652;
              _2642 = 0.0f;
              _2643 = 0.0f;
              _2644 = 0.0f;
            }
          }
        } else {
          _2640 = 0.0h;
          _2641 = 65;
          _2642 = 0.0f;
          _2643 = 0.0f;
          _2644 = 0.0f;
        }
      }
    } else {
      _2640 = 0.0h;
      _2641 = _1652;
      _2642 = 0.0f;
      _2643 = 0.0f;
      _2644 = 0.0f;
    }
    _2646 = dot(float3(_1014, _1015, _1016), float3(_674, _675, _676)) * 2.0f;
    _2650 = _1014 - (_2646 * _674);
    _2651 = _1015 - (_2646 * _675);
    _2652 = _1016 - (_2646 * _676);
    _2654 = rsqrt(dot(float3(_2650, _2651, _2652), float3(_2650, _2651, _2652)));  // [sem: invLength]
    _2655 = _2650 * _2654;
    _2656 = _2651 * _2654;
    _2657 = _2652 * _2654;
    _2662 = float(_1758);
    _2664 = select((_2662 < 0.800000011920929f), ((__3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110), 0.0f)).x), 0.0f);
    _2665 = _2664 * _2655;
    _2666 = _2664 * _2656;
    _2667 = _2664 * _2657;
    _2672 = dot(float3(_2665, _2666, _2667), float3((-0.0f - _674), (-0.0f - _675), (-0.0f - _676))) * 2.0f;
    _2677 = ((_2672 * _674) + _1009) + _2665;
    _2679 = ((_2672 * _675) + _1010) + _2666;
    _2681 = ((_2672 * _676) + _1011) + _2667;
    _2705 = mad((_viewProjRelative[2].x), _2681, mad((_viewProjRelative[1].x), _2679, (_2677 * (_viewProjRelative[0].x)))) + (_viewProjRelative[3].x);
    _2709 = mad((_viewProjRelative[2].y), _2681, mad((_viewProjRelative[1].y), _2679, (_2677 * (_viewProjRelative[0].y)))) + (_viewProjRelative[3].y);
    _2713 = mad((_viewProjRelative[2].z), _2681, mad((_viewProjRelative[1].z), _2679, (_2677 * (_viewProjRelative[0].z)))) + (_viewProjRelative[3].z);
    _2717 = mad((_viewProjRelative[2].w), _2681, mad((_viewProjRelative[1].w), _2679, (_2677 * (_viewProjRelative[0].w)))) + (_viewProjRelative[3].w);
    _2755 = mad((_projToPrevProj[3].w), _2717, mad((_projToPrevProj[2].w), _2713, mad((_projToPrevProj[1].w), _2709, ((_projToPrevProj[0].w) * _2705))));
    _2756 = mad((_projToPrevProj[3].x), _2717, mad((_projToPrevProj[2].x), _2713, mad((_projToPrevProj[1].x), _2709, ((_projToPrevProj[0].x) * _2705)))) / _2755;
    _2757 = mad((_projToPrevProj[3].y), _2717, mad((_projToPrevProj[2].y), _2713, mad((_projToPrevProj[1].y), _2709, ((_projToPrevProj[0].y) * _2705)))) / _2755;
    _2761 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[3].z), _2717, mad((_projToPrevProj[2].z), _2713, mad((_projToPrevProj[1].z), _2709, ((_projToPrevProj[0].z) * _2705)))) / _2755));
    _2797 = mad((_invViewProjRelativePrev[2].w), _2761, mad((_invViewProjRelativePrev[1].w), _2757, ((_invViewProjRelativePrev[0].w) * _2756))) + (_invViewProjRelativePrev[3].w);
    _2808 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[2].x), _2761, mad((_invViewProjRelativePrev[1].x), _2757, ((_invViewProjRelativePrev[0].x) * _2756))) + (_invViewProjRelativePrev[3].x)) / _2797) - _2677);
    _2809 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[2].y), _2761, mad((_invViewProjRelativePrev[1].y), _2757, ((_invViewProjRelativePrev[0].y) * _2756))) + (_invViewProjRelativePrev[3].y)) / _2797) - _2679);
    _2810 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _2761, mad((_invViewProjRelativePrev[1].z), _2757, ((_invViewProjRelativePrev[0].z) * _2756))) + (_invViewProjRelativePrev[3].z)) / _2797) - _2681);
    _2811 = dot(float3(_2808, _2809, _2810), float3(_2655, _2656, _2657));
    _2815 = _2808 - (_2811 * _2655);
    _2816 = _2809 - (_2811 * _2656);
    _2817 = _2810 - (_2811 * _2657);
    _2833 = (saturate(_2664 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_2815 * _2815) + (_2816 * _2816)) + (_2817 * _2817)) / max(0.0010000000474974513f, _2664))) + -1.0f)) + 1.0f;
    _2834 = _2833 * _2833;
    _2835 = _2834 * _2834;
    _2836 = _2835 * _2266;
    _2837 = _2835 * _2290;
    _2838 = _2835 * _2242;
    _2839 = _2835 * _2218;
    _2842 = (_renderParams.z > 0.0f);
    _2844 = float(1.0h - _1758);
    _2848 = (_2756 - (_2705 / _2717)) - _1846;
    _2849 = (_2757 - (_2709 / _2717)) - _1847;
    _2853 = sqrt((_2849 * _2849) + (_2848 * _2848));
  // [sem: expr_sat]
    _2858 = saturate((((_2844 * _2844) * (1.0f - (_1774 * 0.8999999761581421f))) * _2853) * select(_2842, 2000.0f, 500.0f));
    _2864 = _2641 & -2;
    _2867 = (_2641 == 29);
    _2870 = select(((_1726 || _2867) || ((_2864 == 24) || (_renderParams.y > 0.0f))), 1.0f, ((((float(_1676.y) * _866) + (float(_1669.y) * _865)) + (float(_1685.y) * _867)) + (float(_1694.y) * _868)));
    _2874 = float(_2640);
    _2879 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
  // [sem: expr_sat]
    _2905 = saturate(saturate(1.0f - (((_2874 * _121) / max(0.0010000000474974513f, _1774)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_2879 * 0.07500000298023224f)) + max(0.019999999552965164f, _2662)) + (saturate(_121 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_121 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_2874) * 0.75f)));
    if (_2641 == 64) {
      _2914 = ((saturate(_121 * 0.25f) * (_2905 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _2914 = _2905;
    }
    _2916 = (_2879 * 16.0f) + 16.0f;
    _2922 = select((_2879 > 1.0f), 0.0f, saturate((1.0f / _2916) * (_121 - _2916)));
    if (_2641 == 105) {
      _2933 = 1.0f;
      _2937 = select((_2641 == 65), 0.0f, _2933);
    } else {
      if (!((uint)(_2641 & 24) > (uint)23)) {
        _2933 = select((_2641 == 107), 1.0f, ((_2922 + _2914) - (_2922 * _2914)));
        _2937 = select((_2641 == 65), 0.0f, _2933);
      } else {
        _2937 = 0.0f;
      }
    }
    _2946 = select(((_2641 == 57) || ((uint)((int)(_2641 + (uint)(-53))) < (uint)15)), 31.0f, 63.0f);
    if (!_2867) {
      _2959 = (saturate((2000.0f - (saturate(float(_2640 * 0.5h) + (_121 * 0.0625f)) * 1500.0f)) * _2853) * (7.0f - _2946)) + _2946;
      if ((uint)((int)(_2641 + (uint)(-12))) < (uint)9) {
        _2969 = ((saturate(_121 * 0.004999999888241291f) * (_2959 + -2.0f)) + 2.0f);
      } else {
        _2969 = _2959;
      }
    } else {
      _2969 = _2946;
    }
    _2972 = max(0.040008545h, _1758);
  // [sem: expr_sat]
    _2990 = saturate(max(max(_2362, select(_2842, (_2858 + 0.125f), 0.0f)), (1.0f / (((saturate((_2413 * _2413) * _2425) * min(64.0f, (_2969 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _2937) + (_121 * 0.0078125f)) + float(((half)(_2972 * _2972)) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    if ((uint)_2641 > (uint)52) {
      if ((uint)_2641 < (uint)68) {
        if (_2864 == 66) {
          _3023 = _2836;
          _3024 = _2837;
          _3025 = _2838;
          _3026 = _2839;
          _3029 = _3023;
          _3030 = _3024;
          _3031 = _3025;
          _3032 = _3026;
          _3033 = (half)(max(0.89990234h, _1758));
        } else {
          if (!(_2641 == 54)) {
            _3001 = _2836 * _2836;
            _3002 = _2837 * _2837;
            _3003 = _2838 * _2838;
            _3004 = _2839 * _2839;
            _3005 = _3001 * _3001;
            _3006 = _3002 * _3002;
            _3007 = _3003 * _3003;
            _3008 = _3004 * _3004;
            _3014 = (_3005 * _3005);
            _3015 = (_3006 * _3006);
            _3016 = (_3007 * _3007);
            _3017 = (_3008 * _3008);
          } else {
            _3014 = _2836;
            _3015 = _2837;
            _3016 = _2838;
            _3017 = _2839;
          }
          if ((_2641 == 54) || (_2864 == 66)) {
            _3023 = _3014;
            _3024 = _3015;
            _3025 = _3016;
            _3026 = _3017;
            _3029 = _3023;
            _3030 = _3024;
            _3031 = _3025;
            _3032 = _3026;
            _3033 = (half)(max(0.89990234h, _1758));
          } else {
            _3029 = _3014;
            _3030 = _3015;
            _3031 = _3016;
            _3032 = _3017;
            _3033 = (half)(max(0.099975586h, _1758));
          }
        }
      } else {
        _3029 = _2836;
        _3030 = _2837;
        _3031 = _2838;
        _3032 = _2839;
        _3033 = (half)(max(0.099975586h, _1758));
      }
    } else {
      _3014 = _2836;
      _3015 = _2837;
      _3016 = _2838;
      _3017 = _2839;
      if ((_2641 == 54) || (_2864 == 66)) {
        _3023 = _3014;
        _3024 = _3015;
        _3025 = _3016;
        _3026 = _3017;
        _3029 = _3023;
        _3030 = _3024;
        _3031 = _3025;
        _3032 = _3026;
        _3033 = (half)(max(0.89990234h, _1758));
      } else {
        _3029 = _3014;
        _3030 = _3015;
        _3031 = _3016;
        _3032 = _3017;
        _3033 = (half)(max(0.099975586h, _1758));
      }
    }
    _3034 = float(_3033);
    _3035 = _3034 * _3034;
    _3036 = _3035 * _3035;
    _3049 = (((_3036 * _3029) - _3029) * _3029) + 1.0f;
    _3050 = (((_3036 * _3030) - _3030) * _3030) + 1.0f;
    _3051 = (((_3036 * _3031) - _3031) * _3031) + 1.0f;
    _3052 = (((_3036 * _3032) - _3032) * _3032) + 1.0f;
    _3077 = saturate(select(_2867, 1.0f, saturate((_3036 / (_3049 * _3049)) * _3029)) * _2318);  // [sem: expr_sat]
    _3078 = saturate(select(_2867, 1.0f, saturate((_3036 / (_3050 * _3050)) * _3030)) * _2320);  // [sem: expr_sat]
    _3079 = saturate(select(_2867, 1.0f, saturate((_3036 / (_3051 * _3051)) * _3031)) * _2322);  // [sem: expr_sat]
    _3080 = saturate(select(_2867, 1.0f, saturate((_3036 / (_3052 * _3052)) * _3032)) * _2324);  // [sem: expr_sat]
    _3082 = ((uint)(_2641 & 24) > (uint)23);
    [branch]
    if (_3082) {
      _3095 = mad((_projToPrevProj[2].w), _112.x, mad((_projToPrevProj[1].w), _972, ((_projToPrevProj[0].w) * _970))) + (_projToPrevProj[3].w);
      _3098 = ((mad((_projToPrevProj[2].x), _112.x, mad((_projToPrevProj[1].x), _972, ((_projToPrevProj[0].x) * _970))) + (_projToPrevProj[3].x)) / _3095) - _970;
      _3099 = ((mad((_projToPrevProj[2].y), _112.x, mad((_projToPrevProj[1].y), _972, ((_projToPrevProj[0].y) * _970))) + (_projToPrevProj[3].y)) / _3095) - _972;
      _3109 = (((_3098 * 0.5f) + _109) * _bufferSizeAndInvSize.x) + -0.5f;
      _3110 = ((_110 - (_3099 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
      _3113 = int(floor(_3109));
      _3114 = int(floor(_3110));
      _3115 = float((int)(_3113));
      _3116 = float((int)(_3114));
      [branch]
      if (_2867) {
  // [sem: _3__36__0__0__g_stencilPrev_gather]
        _3126 = __3__36__0__0__g_stencilPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(((_3115 + 0.5f) * _bufferSizeAndInvSize.z), ((_3116 + 0.5f) * _bufferSizeAndInvSize.w)));
        _3133 = mad(_3126.w, 16777216, mad(_3126.z, 65536, mad(_3126.y, 256, _3126.x)));
        _3150 = saturate(((float)((bool)(uint)((uint)(_3133 & 24) > (uint)23))) * _3077);  // [sem: expr_sat]
        _3151 = saturate(((float)((bool)(uint)((uint)(_3133 & 6144) > (uint)5888))) * _3078);  // [sem: expr_sat]
        _3152 = saturate(((float)((bool)(uint)((uint)(_3133 & 1572864) > (uint)1507328))) * _3079);  // [sem: expr_sat]
        _3153 = saturate(((float)((bool)(uint)((uint)(_3133 & 402653184) > (uint)385875968))) * _3080);  // [sem: expr_sat]
        _3185 = max(saturate(min(max(((_1756 / ((_597 * 0.004999999888241291f) + 1.0f)) + (_2858 * 0.5f)), 0.03125f), 0.5f) + _2990), saturate(1.0f - dot(float4(_3150, _3151, _3152, _3153), float4(1.0f, 1.0f, 1.0f, 1.0f))));
        _3186 = _3113;
        _3187 = _3114;
        _3188 = _3150;
        _3189 = _3151;
        _3190 = _3152;
        _3191 = _3153;
      } else {
        _3168 = _3109 - _3115;
        _3169 = _3110 - _3116;
        _3170 = 1.0f - _3168;
        _3171 = 1.0f - _3169;
        _3185 = (saturate((sqrt((_3099 * _3099) + (_3098 * _3098)) * 50.0f) + 0.125f) * 0.875f);
        _3186 = _3113;
        _3187 = _3114;
        _3188 = (_3170 * _3169);
        _3189 = (_3169 * _3168);
        _3190 = (_3171 * _3168);
        _3191 = (_3171 * _3170);
      }
    } else {
      _3185 = _2990;
      _3186 = _1870;
      _3187 = _1871;
      _3188 = _3077;
      _3189 = _3078;
      _3190 = _3079;
      _3191 = _3080;
    }
    _3192 = (_2874 > 0.20000000298023224f);
    _3193 = _3187 + 1u;
    half4 _3195 = __3__36__0__0__g_specularResultPrev.Load(int3(_3186, _3193, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _3208 = ((float)((bool)((uint)(!(_3192 ^ ((half)(_3195.w) < 0.0h)))))) * _3188;
    _3214 = _3186 + 1u;
    half4 _3215 = __3__36__0__0__g_specularResultPrev.Load(int3(_3214, _3193, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _3228 = ((float)((bool)((uint)(!(_3192 ^ ((half)(_3215.w) < 0.0h)))))) * _3189;
    half4 _3238 = __3__36__0__0__g_specularResultPrev.Load(int3(_3214, _3187, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _3251 = ((float)((bool)((uint)(!(_3192 ^ ((half)(_3238.w) < 0.0h)))))) * _3190;
    half4 _3261 = __3__36__0__0__g_specularResultPrev.Load(int3(_3186, _3187, 0));  // [sem: _3__36__0__0__g_specularResultPrev_load]
    _3274 = ((float)((bool)((uint)(!(_3192 ^ ((half)(_3261.w) < 0.0h)))))) * _3191;
    _3298 = 1.0f / max(((saturate(_121 * 0.0625f) * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_3208, _3228, _3251, _3274), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    _3300 = -0.0f - (min(0.0f, (-0.0f - ((((_3208 * float(_3195.x)) + (_3228 * float(_3215.x))) + (_3251 * float(_3238.x))) + (_3274 * float(_3261.x))))) * _3298);
    _3302 = -0.0f - (min(0.0f, (-0.0f - ((((_3208 * float(_3195.y)) + (_3228 * float(_3215.y))) + (_3251 * float(_3238.y))) + (_3274 * float(_3261.y))))) * _3298);
    _3304 = -0.0f - (min(0.0f, (-0.0f - ((((_3208 * float(_3195.z)) + (_3228 * float(_3215.z))) + (_3251 * float(_3238.z))) + (_3274 * float(_3261.z))))) * _3298);
    _3305 = _3298 * min(0.0f, (-0.0f - ((((_3208 * abs(float(_3195.w))) + (_3228 * abs(float(_3215.w)))) + (_3251 * abs(float(_3238.w)))) + (_3274 * abs(float(_3261.w))))));
    if ((_2641 != 54) && ((_2864 != 66) && (_renderParams.y == 0.0f))) {
      _3312 = dot(float3(_3300, _3302, _3304), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _3319 = ((min(_3312, _2436.z) / max(9.999999717180685e-10f, _3312)) * _2441) + saturate(1.0f - _2441);
      _3324 = (_3319 * _3300);
      _3325 = (_3319 * _3302);
      _3326 = (_3319 * _3304);
    } else {
      _3324 = _3300;
      _3325 = _3302;
      _3326 = _3304;
    }
    _3327 = _3324 * _exposure4.y;
    _3328 = _3325 * _exposure4.y;
    _3329 = _3326 * _exposure4.y;
    _3342 = ((max(0.0010000000474974513f, _2599) + _3305) * _3185) - _3305;
    _3352 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2870 * ((((_929.x * _866) + (_922.x * _865)) + (_939.x * _867)) + (_949.x * _868))) - _3327) * _3185) + _3327))));
    _3353 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2870 * ((((_929.y * _866) + (_922.y * _865)) + (_939.y * _867)) + (_949.y * _868))) - _3328) * _3185) + _3328))));
    _3354 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2870 * ((((_929.z * _866) + (_922.z * _865)) + (_939.z * _867)) + (_949.z * _868))) - _3329) * _3185) + _3329))));
    __3__38__0__1__g_specularResultUAV[int2(_99, _101)] = float4((half)(half(_3352)), (half)(half(_3353)), (half)(half(_3354)), (half)(half(select(_3192, (-0.0f - _3342), _3342))));
    _3362 = select(_3082, 0.0f, _3342);
    _3367 = float(half(lerp(_3362, 1.0f, _2662)));
    _3368 = (_2864 == 64);
    _3370 = ((int)(uint)(_180)) ^ 1;
    if ((((int)(uint)(_3368)) & _3370) == 0) {
      _3387 = saturate(exp2((_3367 * _3367) * (_121 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _3387 = select((_cavityParams.z > 0.0f), select(_180, 0.0f, _1033), 1.0f);  // [sem: expr_sat]
    }
    _3390 = (_cavityParams.x == 0.0f);
    _3391 = select(_3390, 1.0f, _3387);
    if (_3368) {
      _3397 = (_3391 * _2592);
      _3398 = (_3391 * _2593);
      _3399 = (_3391 * _2594);
    } else {
      _3397 = _2592;
      _3398 = _2593;
      _3399 = _2594;
    }
    if ((_2641 == 54) || (_2864 == 66)) {
  // [sem: _3__36__0__0__g_hairBrdfLookup_sampleLod]
      _3414 = __3__36__0__0__g_hairBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, (1.0f - saturate(abs(dot(float3(_1649, _1650, _1651), float3(_1014, _1015, _1016)))))), (1.0f - max(0.75f, (_3367 * 2.0f)))), 0.0f);
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
      _3420 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1774), (1.0f - _3367)), 0.0f);
      _3427 = ((_3420.x - _3414.x) * _1647) + _3414.x;
      _3428 = ((_3420.y - _3414.y) * _1647) + _3414.y;
      _3430 = (_3427 * 0.009999999776482582f) + _3428;
      _3594 = _3427;
      _3595 = _3428;
      _3596 = _3430;
      _3597 = _3430;
      _3598 = _3430;
    } else {
      if ((uint)((int)(_2641 + (uint)(-97))) < (uint)2) {
        if (!(abs(_224) > 0.9900000095367432f)) {
          _3438 = -0.0f - _225;
          _3440 = rsqrt(dot(float3(_3438, 0.0f, _223), float3(_3438, 0.0f, _223)));  // [sem: invLength]
          _3444 = (_3440 * _3438);
          _3445 = (_3440 * _223);
        } else {
          _3444 = 1.0f;
          _3445 = 0.0f;
        }
        _3447 = -0.0f - (_224 * _3445);
        _3450 = (_3445 * _223) - (_3444 * _225);
        _3451 = _3444 * _224;
        _3453 = rsqrt(dot(float3(_3447, _3450, _3451), float3(_3447, _3450, _3451)));  // [sem: invLength]
        _3461 = _viewPos.x + _1009;
        _3462 = _viewPos.y + _1010;
        _3463 = _viewPos.z + _1011;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
        _3468 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_3444, 0.0f, _3445), float3(_3461, _3462, _3463)), dot(float3((_3453 * _3447), (_3450 * _3453), (_3453 * _3451)), float3(_3461, _3462, _3463))), 0.0f);
        _3472 = _3468.x + -0.5f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
        _3473 = _3468.y + -0.5f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
        _3474 = _3468.z + -0.5f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
        _3476 = rsqrt(dot(float3(_3472, _3473, _3474), float3(_3472, _3473, _3474)));  // [sem: invLength]
        _3480 = (_3472 * _3476) + _674;
        _3481 = (_3473 * _3476) + _675;
        _3482 = (_3474 * _3476) + _676;
        _3484 = rsqrt(dot(float3(_3480, _3481, _3482), float3(_3480, _3481, _3482)));  // [sem: invLength]
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
        _3497 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1774), (1.0f - _3367)), 0.0f);
        _3504 = _3497.y + (exp2(log2(saturate(dot(float3(_1766, _1767, _1768), float3((_3480 * _3484), (_3481 * _3484), (_3482 * _3484))))) * 512.0f) * 20.0f);
        _3594 = _3497.x;
        _3595 = _3497.y;
        _3596 = (_3504 + (_3497.x * _3397));
        _3597 = (_3504 + (_3497.x * _3398));
        _3598 = (_3504 + (_3497.x * _3399));
      } else {
        if (_3368) {
          if (_2641 == 65) {
            _3577 = _3397;
            _3578 = _3398;
            _3579 = _3399;
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
            _3584 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1774), (1.0f - _3367)), 0.0f);
            _3594 = _3584.x;
            _3595 = _3584.y;
            _3596 = ((_3584.x * _3577) + _3584.y);
            _3597 = ((_3584.x * _3578) + _3584.y);
            _3598 = ((_3584.x * _3579) + _3584.y);
          } else {
            _3514 = min(0.9900000095367432f, _1774);
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
            _3519 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_3514, saturate(1.0f - (_3367 * 1.3300000429153442f))), 0.0f);
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
            _3524 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_3514, saturate(1.0f - (_3367 * 0.47998046875f))), 0.0f);
            _3528 = (_3524.x + _3519.x) * 0.5f;
            _3530 = (_3524.y + _3519.y) * 0.5f;
            _3594 = _3528;
            _3595 = _3530;
            _3596 = ((_3528 * _3397) + _3530);
            _3597 = ((_3528 * _3398) + _3530);
            _3598 = ((_3528 * _3399) + _3530);
          }
        } else {
          if ((_2641 == 33) || (_2641 == 55)) {
            _3547 = max(dot(float3(_2566, _2567, _2568), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
            _3551 = sqrt(_2566) - _3547;
            _3552 = sqrt(_2567) - _3547;
            _3553 = sqrt(_2568) - _3547;
            _3560 = saturate(1.0f - (pow(_1774, 4.0f)));  // [sem: expr_sat]
            _3577 = ((((_3551 * _2642) + _3547) + (_3560 * (_3551 * (_2644 - _2642)))) * _2643);
            _3578 = ((((_3552 * _2642) + _3547) + ((_3552 * (_2644 - _2642)) * _3560)) * _2643);
            _3579 = ((((_3553 * _2642) + _3547) + ((_3553 * (_2644 - _2642)) * _3560)) * _2643);
          } else {
            _3577 = _3397;
            _3578 = _3398;
            _3579 = _3399;
          }
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
          _3584 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1774), (1.0f - _3367)), 0.0f);
          _3594 = _3584.x;
          _3595 = _3584.y;
          _3596 = ((_3584.x * _3577) + _3584.y);
          _3597 = ((_3584.x * _3578) + _3584.y);
          _3598 = ((_3584.x * _3579) + _3584.y);
        }
      }
    }
    _3601 = select((_3368 || _3082), 1.0f, _3391) * _2490;
    _3608 = _2557 * _2490;
    _3609 = _2558 * _2490;
    _3610 = _2559 * _2490;
    if ((uint)_1652 > (uint)52) {
      if (((uint)_1652 < (uint)68) || _1726) {
        _3868 = _1757;
        _3869 = _1758;
        _3870 = _1759;
        _3871 = _1760;
        _3872 = _1761;
        _3873 = _3362;
        if (_1765) {
          _3879 = _3873;
          _3880 = _3870;
          _3881 = _3871;
          _3882 = _3872;
          _3883 = _3869;
          _3884 = _3868;
          _3885 = 0.0f;
          _3886 = 0.0f;
          _3887 = 0.0f;
          _3888 = (_3608 * _1656);
          _3889 = (_3609 * _1657);
          _3890 = (_3610 * _1658);
        } else {
          _3879 = _3873;
          _3880 = _3870;
          _3881 = _3871;
          _3882 = _3872;
          _3883 = _3869;
          _3884 = _3868;
          _3885 = _3608;
          _3886 = _3609;
          _3887 = _3610;
          _3888 = 0.0f;
          _3889 = 0.0f;
          _3890 = 0.0f;
        }
      } else {
        if (!((_1652 == 6) || ((_1762 == 106) || (((uint)(_1652 + -27) < (uint)2) || ((_1652 == 105) || (_1652 == 26)))))) {
          if (!(_1652 == 7)) {
            _3635 = exp2(log2(_3362) * (saturate(_121 * 0.03125f) + 1.0f));
  // [sem: _3__36__0__0__g_puddleMask_sampleLod]
            _3645 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110), 0.0f);
            bool __branch_chain_3629;
            if ((_1652 == 15) || ((_1762 == 12) || ((_1652 & -4) == 16))) {
              _3664 = false;
              _3665 = true;
              __branch_chain_3629 = true;
            } else {
              if (!((uint)_1652 > (uint)10)) {
                _3664 = true;
                _3665 = false;
                __branch_chain_3629 = true;
              } else {
                if ((uint)_1652 < (uint)20) {
                  _3664 = false;
                  _3665 = false;
                  __branch_chain_3629 = true;
                } else {
                  if (!(_1652 == 97)) {
                    _3664 = (_1652 != 107);
                    _3665 = false;
                    __branch_chain_3629 = true;
                  } else {
                    _3857 = _2576;
                    _3858 = _2662;
                    _3859 = _2566;
                    _3860 = _2567;
                    _3861 = _2568;
                    __branch_chain_3629 = false;
                  }
                }
              }
            }
            if (__branch_chain_3629) {
              if (_3645.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  _3675 = (_1652 == 36);
                  if (!_3675) {
  // [sem: _3__36__0__0__g_climateSandTex_sampleLod]
                    _3695 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _1009) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x) >> 1))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _1011) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y) >> 1))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _3701 = _3695.x;
                    _3702 = _3695.y;
                    _3703 = _3695.z;
                    _3704 = _3695.w;
                  } else {
                    _3701 = 0.11999999731779099f;
                    _3702 = 0.11999999731779099f;
                    _3703 = 0.10000000149011612f;
                    _3704 = 0.5f;
                  }
                  _3711 = 1.0f - saturate(((_viewPos.y + _1010) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (!(_3711 <= 0.0f)) {
                    _3714 = saturate(_3635);  // [sem: _3635_sat]
                    _3727 = ((_3702 * 0.3395099937915802f) + (_3701 * 0.6131200194358826f)) + (_3703 * 0.047370001673698425f);
                    _3728 = ((_3702 * 0.9163600206375122f) + (_3701 * 0.07020000368356705f)) + (_3703 * 0.013450000435113907f);
                    _3729 = ((_3702 * 0.10958000272512436f) + (_3701 * 0.02061999961733818f)) + (_3703 * 0.8697999715805054f);
                    _3734 = select(_3665, 1.0f, ((float)((bool)(uint)(saturate(dot(float3(_674, _675, _676), float3(0.0f, 1.0f, 0.0f))) > 0.5f))));
                    if (_enableSandAO == 1) {
                      _3739 = 1.0f - _3645.x;
                      if (_3675) {
                        _3770 = ((((_3739 * 10.0f) * _3704) * _3711) * _3714);
                        _3773 = _3727;
                        _3774 = _3728;
                        _3775 = _3729;
                        _3776 = saturate(_3770);  // [sem: _3770_sat]
                      } else {
                        _3750 = saturate(_3704 + -0.5f);  // [sem: expr_sat]
                        _3773 = _3727;
                        _3774 = _3728;
                        _3775 = _3729;
  // [sem: _3770_sat]
                        _3776 = ((((_3750 * 2.0f) * max((_3734 * _3645.x), min((_3714 * ((_3645.x * 7.0f) + 3.0f)), (_3750 * 40.0f)))) + (((_3739 * 10.0f) * _3714) * saturate((0.5f - _3704) * 2.0f))) * _3711);
                      }
                    } else {
                      _3768 = ((_3711 * _3704) * _3645.x) * _3734;
                      if (_3675) {
                        _3770 = _3768;
                        _3773 = _3727;
                        _3774 = _3728;
                        _3775 = _3729;
                        _3776 = saturate(_3770);  // [sem: _3770_sat]
                      } else {
                        _3773 = _3727;
                        _3774 = _3728;
                        _3775 = _3729;
                        _3776 = _3768;  // [sem: _3770_sat]
                      }
                    }
                  } else {
                    _3773 = 0.0f;
                    _3774 = 0.0f;
                    _3775 = 0.0f;
                    _3776 = 0.0f;  // [sem: _3770_sat]
                  }
                  _3780 = ((1.0f - _3645.w) * (1.0f - _3645.y)) * _3776;
                  _3781 = (_3780 > 9.999999747378752e-05f);
                  if (_3781) {
                    if (_3665) {
                      _3784 = saturate(_3780);  // [sem: _3780_sat]
                      _3811 = (((sqrt(_3773 * _2566) - _2566) * _3784) + _2566);
                      _3812 = (((sqrt(_3774 * _2567) - _2567) * _3784) + _2567);
                      _3813 = (((sqrt(_3775 * _2568) - _2568) * _3784) + _2568);
                    } else {
                      _3811 = ((_3780 * (_3773 - _2566)) + _2566);
                      _3812 = ((_3780 * (_3774 - _2567)) + _2567);
                      _3813 = ((_3780 * (_3775 - _2568)) + _2568);
                    }
                  } else {
                    _3811 = _2566;
                    _3812 = _2567;
                    _3813 = _2568;
                  }
                  if (_3675 && _3781) {
                    if (_3665) {
                      _3828 = (((sqrt(_2662 * 0.25f) - _2662) * saturate(_3780)) + _2662);
                    } else {
                      _3828 = ((_3780 * (0.25f - _2662)) + _2662);
                    }
                  } else {
                    _3828 = _2662;
                  }
                  _3829 = saturate(_3811);  // [sem: _3811_sat]
                  _3830 = saturate(_3812);  // [sem: _3812_sat]
                  _3831 = saturate(_3813);  // [sem: _3813_sat]
                  _3836 = (_3828 * (1.0f - _3635)) + _3635;
                  _3839 = ((_3828 - _3836) * _3645.y) + _3836;
                  _3846 = (((_3635 * _3635) * _3645.z) * ((float)((bool)_3664))) * saturate(dot(float3(_674, _675, _676), float3(0.0f, 1.0f, 0.0f)));
                  _3847 = _3846 * -0.5f;
                  _3857 = (_2576 - (_3635 * _2576));
                  _3858 = (_3839 - (_3846 * _3839));
                  _3859 = ((_3847 * _3829) + _3829);
                  _3860 = ((_3847 * _3830) + _3830);
                  _3861 = ((_3847 * _3831) + _3831);
                } else {
                  _3857 = _2576;
                  _3858 = _2662;
                  _3859 = _2566;
                  _3860 = _2567;
                  _3861 = _2568;
                }
              } else {
                _3857 = _2576;
                _3858 = _2662;
                _3859 = _2566;
                _3860 = _2567;
                _3861 = _2568;
              }
            }
            _3868 = (half)(half(_3857));
            _3869 = (half)(half(_3858));
            _3870 = (half)(half(_3859));
            _3871 = (half)(half(_3860));
            _3872 = (half)(half(_3861));
            _3873 = _3635;
          } else {
            _3868 = _1757;
            _3869 = _1758;
            _3870 = _1759;
            _3871 = _1760;
            _3872 = _1761;
            _3873 = _3362;
          }
          if (_1765) {
            _3879 = _3873;
            _3880 = _3870;
            _3881 = _3871;
            _3882 = _3872;
            _3883 = _3869;
            _3884 = _3868;
            _3885 = 0.0f;
            _3886 = 0.0f;
            _3887 = 0.0f;
            _3888 = (_3608 * _1656);
            _3889 = (_3609 * _1657);
            _3890 = (_3610 * _1658);
          } else {
            _3879 = _3873;
            _3880 = _3870;
            _3881 = _3871;
            _3882 = _3872;
            _3883 = _3869;
            _3884 = _3868;
            _3885 = _3608;
            _3886 = _3609;
            _3887 = _3610;
            _3888 = 0.0f;
            _3889 = 0.0f;
            _3890 = 0.0f;
          }
        } else {
          _3879 = _3362;
          _3880 = _1759;
          _3881 = _1760;
          _3882 = _1761;
          _3883 = _1758;
          _3884 = _1757;
          _3885 = _3608;
          _3886 = _3609;
          _3887 = _3610;
          _3888 = 0.0f;
          _3889 = 0.0f;
          _3890 = 0.0f;
        }
      }
    } else {
      if (_1726) {
        _3868 = _1757;
        _3869 = _1758;
        _3870 = _1759;
        _3871 = _1760;
        _3872 = _1761;
        _3873 = _3362;
        if (_1765) {
          _3879 = _3873;
          _3880 = _3870;
          _3881 = _3871;
          _3882 = _3872;
          _3883 = _3869;
          _3884 = _3868;
          _3885 = 0.0f;
          _3886 = 0.0f;
          _3887 = 0.0f;
          _3888 = (_3608 * _1656);
          _3889 = (_3609 * _1657);
          _3890 = (_3610 * _1658);
        } else {
          _3879 = _3873;
          _3880 = _3870;
          _3881 = _3871;
          _3882 = _3872;
          _3883 = _3869;
          _3884 = _3868;
          _3885 = _3608;
          _3886 = _3609;
          _3887 = _3610;
          _3888 = 0.0f;
          _3889 = 0.0f;
          _3890 = 0.0f;
        }
      } else {
        if (!((_1652 == 6) || ((_1762 == 106) || (((uint)(_1652 + -27) < (uint)2) || ((_1652 == 105) || (_1652 == 26)))))) {
          if (!(_1652 == 7)) {
            _3635 = exp2(log2(_3362) * (saturate(_121 * 0.03125f) + 1.0f));
  // [sem: _3__36__0__0__g_puddleMask_sampleLod]
            _3645 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110), 0.0f);
            bool __branch_chain_3629;
            if ((_1652 == 15) || ((_1762 == 12) || ((_1652 & -4) == 16))) {
              _3664 = false;
              _3665 = true;
              __branch_chain_3629 = true;
            } else {
              if (!((uint)_1652 > (uint)10)) {
                _3664 = true;
                _3665 = false;
                __branch_chain_3629 = true;
              } else {
                if ((uint)_1652 < (uint)20) {
                  _3664 = false;
                  _3665 = false;
                  __branch_chain_3629 = true;
                } else {
                  if (!(_1652 == 97)) {
                    _3664 = (_1652 != 107);
                    _3665 = false;
                    __branch_chain_3629 = true;
                  } else {
                    _3857 = _2576;
                    _3858 = _2662;
                    _3859 = _2566;
                    _3860 = _2567;
                    _3861 = _2568;
                    __branch_chain_3629 = false;
                  }
                }
              }
            }
            if (__branch_chain_3629) {
              if (_3645.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  _3675 = (_1652 == 36);
                  if (!_3675) {
  // [sem: _3__36__0__0__g_climateSandTex_sampleLod]
                    _3695 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _1009) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x) >> 1))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _1011) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y) >> 1))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _3701 = _3695.x;
                    _3702 = _3695.y;
                    _3703 = _3695.z;
                    _3704 = _3695.w;
                  } else {
                    _3701 = 0.11999999731779099f;
                    _3702 = 0.11999999731779099f;
                    _3703 = 0.10000000149011612f;
                    _3704 = 0.5f;
                  }
                  _3711 = 1.0f - saturate(((_viewPos.y + _1010) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (!(_3711 <= 0.0f)) {
                    _3714 = saturate(_3635);  // [sem: _3635_sat]
                    _3727 = ((_3702 * 0.3395099937915802f) + (_3701 * 0.6131200194358826f)) + (_3703 * 0.047370001673698425f);
                    _3728 = ((_3702 * 0.9163600206375122f) + (_3701 * 0.07020000368356705f)) + (_3703 * 0.013450000435113907f);
                    _3729 = ((_3702 * 0.10958000272512436f) + (_3701 * 0.02061999961733818f)) + (_3703 * 0.8697999715805054f);
                    _3734 = select(_3665, 1.0f, ((float)((bool)(uint)(saturate(dot(float3(_674, _675, _676), float3(0.0f, 1.0f, 0.0f))) > 0.5f))));
                    if (_enableSandAO == 1) {
                      _3739 = 1.0f - _3645.x;
                      if (_3675) {
                        _3770 = ((((_3739 * 10.0f) * _3704) * _3711) * _3714);
                        _3773 = _3727;
                        _3774 = _3728;
                        _3775 = _3729;
                        _3776 = saturate(_3770);  // [sem: _3770_sat]
                      } else {
                        _3750 = saturate(_3704 + -0.5f);  // [sem: expr_sat]
                        _3773 = _3727;
                        _3774 = _3728;
                        _3775 = _3729;
  // [sem: _3770_sat]
                        _3776 = ((((_3750 * 2.0f) * max((_3734 * _3645.x), min((_3714 * ((_3645.x * 7.0f) + 3.0f)), (_3750 * 40.0f)))) + (((_3739 * 10.0f) * _3714) * saturate((0.5f - _3704) * 2.0f))) * _3711);
                      }
                    } else {
                      _3768 = ((_3711 * _3704) * _3645.x) * _3734;
                      if (_3675) {
                        _3770 = _3768;
                        _3773 = _3727;
                        _3774 = _3728;
                        _3775 = _3729;
                        _3776 = saturate(_3770);  // [sem: _3770_sat]
                      } else {
                        _3773 = _3727;
                        _3774 = _3728;
                        _3775 = _3729;
                        _3776 = _3768;  // [sem: _3770_sat]
                      }
                    }
                  } else {
                    _3773 = 0.0f;
                    _3774 = 0.0f;
                    _3775 = 0.0f;
                    _3776 = 0.0f;  // [sem: _3770_sat]
                  }
                  _3780 = ((1.0f - _3645.w) * (1.0f - _3645.y)) * _3776;
                  _3781 = (_3780 > 9.999999747378752e-05f);
                  if (_3781) {
                    if (_3665) {
                      _3784 = saturate(_3780);  // [sem: _3780_sat]
                      _3811 = (((sqrt(_3773 * _2566) - _2566) * _3784) + _2566);
                      _3812 = (((sqrt(_3774 * _2567) - _2567) * _3784) + _2567);
                      _3813 = (((sqrt(_3775 * _2568) - _2568) * _3784) + _2568);
                    } else {
                      _3811 = ((_3780 * (_3773 - _2566)) + _2566);
                      _3812 = ((_3780 * (_3774 - _2567)) + _2567);
                      _3813 = ((_3780 * (_3775 - _2568)) + _2568);
                    }
                  } else {
                    _3811 = _2566;
                    _3812 = _2567;
                    _3813 = _2568;
                  }
                  if (_3675 && _3781) {
                    if (_3665) {
                      _3828 = (((sqrt(_2662 * 0.25f) - _2662) * saturate(_3780)) + _2662);
                    } else {
                      _3828 = ((_3780 * (0.25f - _2662)) + _2662);
                    }
                  } else {
                    _3828 = _2662;
                  }
                  _3829 = saturate(_3811);  // [sem: _3811_sat]
                  _3830 = saturate(_3812);  // [sem: _3812_sat]
                  _3831 = saturate(_3813);  // [sem: _3813_sat]
                  _3836 = (_3828 * (1.0f - _3635)) + _3635;
                  _3839 = ((_3828 - _3836) * _3645.y) + _3836;
                  _3846 = (((_3635 * _3635) * _3645.z) * ((float)((bool)_3664))) * saturate(dot(float3(_674, _675, _676), float3(0.0f, 1.0f, 0.0f)));
                  _3847 = _3846 * -0.5f;
                  _3857 = (_2576 - (_3635 * _2576));
                  _3858 = (_3839 - (_3846 * _3839));
                  _3859 = ((_3847 * _3829) + _3829);
                  _3860 = ((_3847 * _3830) + _3830);
                  _3861 = ((_3847 * _3831) + _3831);
                } else {
                  _3857 = _2576;
                  _3858 = _2662;
                  _3859 = _2566;
                  _3860 = _2567;
                  _3861 = _2568;
                }
              } else {
                _3857 = _2576;
                _3858 = _2662;
                _3859 = _2566;
                _3860 = _2567;
                _3861 = _2568;
              }
            }
            _3868 = (half)(half(_3857));
            _3869 = (half)(half(_3858));
            _3870 = (half)(half(_3859));
            _3871 = (half)(half(_3860));
            _3872 = (half)(half(_3861));
            _3873 = _3635;
          } else {
            _3868 = _1757;
            _3869 = _1758;
            _3870 = _1759;
            _3871 = _1760;
            _3872 = _1761;
            _3873 = _3362;
          }
          if (_1765) {
            _3879 = _3873;
            _3880 = _3870;
            _3881 = _3871;
            _3882 = _3872;
            _3883 = _3869;
            _3884 = _3868;
            _3885 = 0.0f;
            _3886 = 0.0f;
            _3887 = 0.0f;
            _3888 = (_3608 * _1656);
            _3889 = (_3609 * _1657);
            _3890 = (_3610 * _1658);
          } else {
            _3879 = _3873;
            _3880 = _3870;
            _3881 = _3871;
            _3882 = _3872;
            _3883 = _3869;
            _3884 = _3868;
            _3885 = _3608;
            _3886 = _3609;
            _3887 = _3610;
            _3888 = 0.0f;
            _3889 = 0.0f;
            _3890 = 0.0f;
          }
        } else {
          _3879 = _3362;
          _3880 = _1759;
          _3881 = _1760;
          _3882 = _1761;
          _3883 = _1758;
          _3884 = _1757;
          _3885 = _3608;
          _3886 = _3609;
          _3887 = _3610;
          _3888 = 0.0f;
          _3889 = 0.0f;
          _3890 = 0.0f;
        }
      }
    }
    half4 _3892 = __3__36__0__0__g_sceneShadowColor.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_sceneShadowColor_load]
    _3897 = float(_3892.x);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    _3898 = float(_3892.y);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    _3899 = float(_3892.z);  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    [branch]
    if (_1726) {
      _3903 = __3__36__0__0__g_sceneNormal.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_sceneNormal_load]
      _3919 = min(1.0f, ((((float)((uint)((uint)(_3903.x & 1023)))) * 0.001956947147846222f) + -1.0f));  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
      _3920 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_3903.x)) >> 10) & 1023)))) * 0.001956947147846222f) + -1.0f));
  // [sem: _3__36__0__0__g_sceneNormal_load_derived]
      _3921 = min(1.0f, ((((float)((uint)((uint)(((uint)((uint)(_3903.x)) >> 20) & 1023)))) * 0.001956947147846222f) + -1.0f));
      _3923 = rsqrt(dot(float3(_3919, _3920, _3921), float3(_3919, _3920, _3921)));  // [sem: invLength]
      _3931 = (half)(half(_3923 * _3919));
      _3932 = (half)(half(_3923 * _3920));
      _3933 = (half)(half(_3923 * _3921));
    } else {
      _3931 = _494;
      _3932 = _495;
      _3933 = _496;
    }
    _3936 = (_sunDirection.y > 0.0f);
    if ((_3936) || ((!(_3936)) && (_sunDirection.y > _moonDirection.y))) {
      _3948 = _sunDirection.x;
      _3949 = _sunDirection.y;
      _3950 = _sunDirection.z;
    } else {
      _3948 = _moonDirection.x;
      _3949 = _moonDirection.y;
      _3950 = _moonDirection.z;
    }
    if ((_3936) || ((!(_3936)) && (_sunDirection.y > _moonDirection.y))) {
      _3970 = _precomputedAmbient7.y;
    } else {
      _3970 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    _3975 = _viewPos.y + _1010;
    _3976 = _3975 + _earthRadius;
    _3980 = (_1011 * _1011) + (_1009 * _1009);
    _3982 = sqrt((_3976 * _3976) + _3980);
    _3987 = dot(float3((_1009 / _3982), (_3976 / _3982), (_1011 / _3982)), float3(_3948, _3949, _3950));
    _3992 = min(max(((_3982 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    _4000 = max(_3992, 0.0f);
    _4007 = (-0.0f - sqrt((_4000 + (_earthRadius * 2.0f)) * _4000)) / (_4000 + _earthRadius);
    if (_3987 > _4007) {
      _4030 = ((exp2(log2(saturate((_3987 - _4007) / (1.0f - _4007))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _4030 = ((exp2(log2(saturate((_4007 - _3987) / (_4007 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
  // [sem: _3__36__0__0__g_texNetDensity_sampleLod]
    _4035 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_3992 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _4030), 0.0f);
    _4057 = ((_4035.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);  // [sem: _3__36__0__0__g_texNetDensity_sampleLod_derived]
    _4075 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _4035.x) + _4057) * -1.4426950216293335f);
    _4076 = exp2(((((((float)((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255)))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _4035.x) + _4057) * -1.4426950216293335f);
    _4077 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (((float)((uint)((uint)(_rayleighScatteringColor & 255)))) * 1.960784317134312e-07f)) * _4035.x) + _4057) * -1.4426950216293335f);
    _4093 = sqrt(_3980);
    _4101 = (_cloudAltitude - (max(((_4093 * _4093) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    _4113 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_3949 > 0.0f))) - ((int)(uint)((int)(_3949 < 0.0f))))) * 0.5f))) + _4101;
    if (_1010 < _4101) {
      _4116 = dot(float3(0.0f, 1.0f, 0.0f), float3(_3948, _3949, _3950));
      _4122 = select((abs(_4116) < 9.99999993922529e-09f), 1e+08f, ((_4113 - dot(float3(0.0f, 1.0f, 0.0f), float3(_1009, _1010, _1011))) / _4116));
      _4128 = ((_4122 * _3948) + _1009);
      _4129 = _4113;
      _4130 = ((_4122 * _3950) + _1011);
    } else {
      _4128 = _1009;
      _4129 = _1010;
      _4130 = _1011;
    }
    _4150 = saturate(abs(_3949) * 4.0f);  // [sem: expr_sat]
    _4152 = (_4150 * _4150) * exp2(((_distanceScale * -1.4426950216293335f) * ((__3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_4128 * 4.999999873689376e-05f) + 0.5f), ((_4129 - _4101) / _cloudThickness), ((_4130 * 4.999999873689376e-05f) + 0.5f)), 0.0f)).x)) * (_cloudScatteringCoefficient / _distanceScale));
    _4159 = ((1.0f - _4152) * saturate(((_1010 - _cloudThickness) - _4101) * 0.10000000149011612f)) + _4152;
    _4160 = _4159 * (((_4076 * 0.3395099937915802f) + (_4075 * 0.6131200194358826f)) + (_4077 * 0.047370001673698425f));
    _4161 = _4159 * (((_4076 * 0.9163600206375122f) + (_4075 * 0.07020000368356705f)) + (_4077 * 0.013450000435113907f));
    _4162 = _4159 * (((_4076 * 0.10958000272512436f) + (_4075 * 0.02061999961733818f)) + (_4077 * 0.8697999715805054f));
    _4182 = float(_3880);
    _4183 = float(_3881);
    _4184 = float(_3882);
    if (!_2602) {
      _4190 = (_179 && ((uint)(_1652 + -105) < (uint)2));
    } else {
      _4190 = true;
    }
    _4192 = float(max(0.010002136h, _3883));
    _4193 = float(_3884);
    _4196 = (_1652 == 107);
    _4199 = _1720 || (((uint)(_1652 + -11) < (uint)9) || (_4196 || _4190));
    _4200 = select(_4199, 0.0f, _4193);
    if ((_1762 == 26) || ((_1652 == 105) || (_1652 == 28))) {
      _4211 = true;
      _4213 = _4211;
      _4214 = _4196;
    } else {
      _4208 = (_1652 == 106);
      if (!(_1652 == 19)) {
        _4211 = _4208;
        _4213 = _4211;
        _4214 = _4196;
      } else {
        _4213 = _4208;
        _4214 = true;
      }
    }
    _4215 = float(_3931);
    _4216 = float(_3932);
    _4217 = float(_3933);
    _4219 = __3__36__0__0__g_sceneDecalMask.Load(int3(_99, _101, 0));  // [sem: _3__36__0__0__g_sceneDecalMask_load]
    if (_1652 == 97) {
      _4231 = (((float)((uint16_t)((uint)((uint16_t)((uint)(_4219.x)) >> 2)))) * 0.01587301678955555f);
      _4232 = (((uint)((uint)((int)(min16uint)((int)((int)(_4219.x) & 2)))) >> 1) + 97);
      _4233 = 0.0f;
      _4234 = 0.0f;
      _4235 = 0.0f;
      _4236 = 0.0f;
      _4237 = 0.0f;
    } else {
      _4231 = select(_4199, _4193, 0.0f);
      _4232 = _1652;
      _4233 = _1069;
      _4234 = _1070;
      _4235 = _1071;
      _4236 = _1072;
      _4237 = _1073;
    }
    _4242 = float(saturate(_199));
    _4243 = _4242 * _4242;
    _4244 = _4243 * _4243;
    _4245 = _4244 * _4244;
    _4256 = ((_4245 * _4245) * select((_2417 || (_4213 || _4214)), 0.0f, 1.0f)) * (((float4)(__3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _104), (_bufferSizeAndInvSize.w * _105)), 0.0f))).y);
    _4261 = _4215 - (_4256 * _4215);
    _4262 = (_4256 * (1.0f - _4216)) + _4216;
    _4263 = _4217 - (_4256 * _4217);
    _4265 = rsqrt(dot(float3(_4261, _4262, _4263), float3(_4261, _4262, _4263)));  // [sem: invLength]
    _4266 = _4261 * _4265;
    _4267 = _4262 * _4265;
    _4268 = _4263 * _4265;
    _4269 = (_4232 == 53);
    if (_4269) {
      _4276 = saturate(((_4183 + _4182) + _4184) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _4276 = 1.0f;  // [sem: expr_sat]
    }
    _4282 = (0.699999988079071f / min(max(max(max(_4182, _4183), _4184), 0.009999999776482582f), 0.699999988079071f)) * _4276;
    _4292 = (((_4282 * _4182) + -0.03999999910593033f) * _4200) + 0.03999999910593033f;
    _4293 = (((_4282 * _4183) + -0.03999999910593033f) * _4200) + 0.03999999910593033f;
    _4294 = (((_4282 * _4184) + -0.03999999910593033f) * _4200) + 0.03999999910593033f;
    _4295 = float(_3883);
    _4296 = _4232 & -2;
    _4297 = (_4296 == 64);
    _4300 = ((((int)(uint)(_4297)) & _3370) == 0);
    if (_4300) {
      _4313 = saturate(exp2((_4295 * _4295) * (_121 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _4313 = select((_cavityParams.z > 0.0f), select(_180, 0.0f, _1033), 1.0f);  // [sem: expr_sat]
    }
    _4314 = select(_3390, 1.0f, _4313);
    if (_4297) {
      _4320 = (_4314 * _4292);
      _4321 = (_4314 * _4293);
      _4322 = (_4314 * _4294);
    } else {
      _4320 = _4292;
      _4321 = _4293;
      _4322 = _4294;
    }
    _4323 = _4192 * _4192;
    _4324 = _4323 * _4323;
    _4326 = ((uint)(_4232 + -97) < (uint)2);
    _4328 = select(_4326, 0.5f, (_4192 * 0.60009765625f));
    _4329 = _4328 * _4328;
    _4330 = _4329 * _4329;
    _4331 = (_4232 == 33);
    if (!_4331) {
      _4333 = (_4232 == 55);
      _4334 = (int)(uint)(_4333);
      if ((_4232 == 98) || (_4296 == 96)) {
        _4343 = true;
        if (_4333) {
          _4345 = _4343;
          _4349 = _4345;
          _4350 = ((int)(uint)((int)(_4233 > 0.0f)));
          _4351 = _4233;
        } else {
          _4349 = _4343;
          _4350 = _4334;
          _4351 = 0.0f;
        }
        if ((uint)_4232 > (uint)11) {
          if (!(((uint)_4232 < (uint)21) || (_4232 == 107))) {
            _4360 = _4349;
            _4361 = _4350;
            _4362 = _4351;
            _4365 = _4362;
            _4366 = _4361;
            _4367 = _4360;
            _4368 = (_4232 == 7);
          } else {
            _4365 = _4351;
            _4366 = _4350;
            _4367 = _4349;
            _4368 = true;
          }
        } else {
          if (!(_4232 == 6)) {
            _4360 = _4349;
            _4361 = _4350;
            _4362 = _4351;
            _4365 = _4362;
            _4366 = _4361;
            _4367 = _4360;
            _4368 = (_4232 == 7);
          } else {
            _4365 = _4351;
            _4366 = _4350;
            _4367 = _4349;
            _4368 = true;
          }
        }
      } else {
        if ((uint)(_4232 + -105) < (uint)2) {
          if (_4333) {
            _4345 = _179;
            _4349 = _4345;
            _4350 = ((int)(uint)((int)(_4233 > 0.0f)));
            _4351 = _4233;
            if ((uint)_4232 > (uint)11) {
              if (!(((uint)_4232 < (uint)21) || (_4232 == 107))) {
                _4360 = _4349;
                _4361 = _4350;
                _4362 = _4351;
                _4365 = _4362;
                _4366 = _4361;
                _4367 = _4360;
                _4368 = (_4232 == 7);
              } else {
                _4365 = _4351;
                _4366 = _4350;
                _4367 = _4349;
                _4368 = true;
              }
            } else {
              if (!(_4232 == 6)) {
                _4360 = _4349;
                _4361 = _4350;
                _4362 = _4351;
                _4365 = _4362;
                _4366 = _4361;
                _4367 = _4360;
                _4368 = (_4232 == 7);
              } else {
                _4365 = _4351;
                _4366 = _4350;
                _4367 = _4349;
                _4368 = true;
              }
            }
          } else {
            _4360 = _179;
            _4361 = _4334;
            _4362 = 0.0f;
            _4365 = _4362;
            _4366 = _4361;
            _4367 = _4360;
            _4368 = (_4232 == 7);
          }
        } else {
          _4343 = false;
          if (_4333) {
            _4345 = _4343;
            _4349 = _4345;
            _4350 = ((int)(uint)((int)(_4233 > 0.0f)));
            _4351 = _4233;
          } else {
            _4349 = _4343;
            _4350 = _4334;
            _4351 = 0.0f;
          }
          if ((uint)_4232 > (uint)11) {
            if (!(((uint)_4232 < (uint)21) || (_4232 == 107))) {
              _4360 = _4349;
              _4361 = _4350;
              _4362 = _4351;
              _4365 = _4362;
              _4366 = _4361;
              _4367 = _4360;
              _4368 = (_4232 == 7);
            } else {
              _4365 = _4351;
              _4366 = _4350;
              _4367 = _4349;
              _4368 = true;
            }
          } else {
            if (!(_4232 == 6)) {
              _4360 = _4349;
              _4361 = _4350;
              _4362 = _4351;
              _4365 = _4362;
              _4366 = _4361;
              _4367 = _4360;
              _4368 = (_4232 == 7);
            } else {
              _4365 = _4351;
              _4366 = _4350;
              _4367 = _4349;
              _4368 = true;
            }
          }
        }
      }
    } else {
      _4345 = false;
      _4349 = _4345;
      _4350 = ((int)(uint)((int)(_4233 > 0.0f)));
      _4351 = _4233;
      if ((uint)_4232 > (uint)11) {
        if (!(((uint)_4232 < (uint)21) || (_4232 == 107))) {
          _4360 = _4349;
          _4361 = _4350;
          _4362 = _4351;
          _4365 = _4362;
          _4366 = _4361;
          _4367 = _4360;
          _4368 = (_4232 == 7);
        } else {
          _4365 = _4351;
          _4366 = _4350;
          _4367 = _4349;
          _4368 = true;
        }
      } else {
        if (!(_4232 == 6)) {
          _4360 = _4349;
          _4361 = _4350;
          _4362 = _4351;
          _4365 = _4362;
          _4366 = _4361;
          _4367 = _4360;
          _4368 = (_4232 == 7);
        } else {
          _4365 = _4351;
          _4366 = _4350;
          _4367 = _4349;
          _4368 = true;
        }
      }
    }
    _4373 = exp2(log2(float(_3892.w)) * 2.200000047683716f) * 1000.0f;  // [sem: _3__36__0__0__g_sceneShadowColor_load_derived]
    if ((_3936) || ((!(_3936)) && (_sunDirection.y > _moonDirection.y))) {
      _4385 = _sunDirection.x;
      _4386 = _sunDirection.y;
      _4387 = _sunDirection.z;
    } else {
      _4385 = _moonDirection.x;
      _4386 = _moonDirection.y;
      _4387 = _moonDirection.z;
    }
    _4388 = _lightingParams.x * _3970;
    _4389 = (((_4160 * 0.6131200194358826f) + (_4161 * 0.3395099937915802f)) + (_4162 * 0.047370001673698425f)) * _4388;
    _4390 = (((_4160 * 0.07020000368356705f) + (_4161 * 0.9163600206375122f)) + (_4162 * 0.013450000435113907f)) * _4388;
    _4391 = (((_4160 * 0.02061999961733818f) + (_4161 * 0.10958000272512436f)) + (_4162 * 0.8697999715805054f)) * _4388;
    _4392 = _4385 - _1014;
    _4393 = _4386 - _1015;
    _4394 = _4387 - _1016;
    _4396 = rsqrt(dot(float3(_4392, _4393, _4394), float3(_4392, _4393, _4394)));  // [sem: invLength]
    _4397 = _4396 * _4392;
    _4398 = _4396 * _4393;
    _4399 = _4396 * _4394;
    _4400 = dot(float3(_4215, _4216, _4217), float3(_4385, _4386, _4387));
    _4401 = dot(float3(_4266, _4267, _4268), float3(_4385, _4386, _4387));
    _4403 = saturate(dot(float3(_4215, _4216, _4217), float3(_1766, _1767, _1768)));  // [sem: expr_sat]
    _4405 = saturate(dot(float3(_4266, _4267, _4268), float3(_4397, _4398, _4399)));  // [sem: expr_sat]
    _4406 = dot(float3(_1766, _1767, _1768), float3(_4397, _4398, _4399));
    _4408 = saturate(dot(float3(_4385, _4386, _4387), float3(_4397, _4398, _4399)));  // [sem: expr_sat]
    _4409 = (_4296 == 66);
    _4410 = (_4232 == 54);
    _4411 = _4410 || _4409;
    // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x973D36C7 initializes foliage transmission accumulators once before the preserved direct-light branch fanout; exactly one foliage branch contributes transmission before final diffuse-light add-back.
    float _rndx_foliageTransR = 0.0f;
    float _rndx_foliageTransG = 0.0f;
    float _rndx_foliageTransB = 0.0f;
    bool _rndx_isFoliage = ((uint)(_117 - 12) < 7u);
    // RenoDX: <<< [Patch: FoliageTransmission]
    if (_4411) {
      if (_4410) {
        _4428 = (((asfloat(_globalLightParams.z) * _4192) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
      } else {
        _4428 = _bevelParams.y;
      }
      _4446 = (sqrt(_3980 + (_1010 * _1010)) * 2.0f) + 1.0f;
      _4450 = (_1647 * 7.0f) + 1.0f;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
      _4455 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2((((dot(float3(_1009, _1010, _1011), float3(((_1651 * _224) - (_1650 * _225)), ((_1649 * _225) - (_1651 * _223)), ((_1650 * _223) - (_1649 * _224)))) * 2.0f) / _4446) * _4450), (((dot(float3(_1009, _1010, _1011), float3(_1649, _1650, _1651)) * 0.5f) / _4446) * _4450)), 0.0f);
      _4459 = _1647 * 0.5f;
      _4460 = _4455.x * 2.0f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
      _4461 = _4455.y * 2.0f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
      _4462 = _4455.z * 2.0f;  // [sem: _3__36__0__0__g_blueNoise_sampleLod_derived]
      _4473 = dot(float3(_1649, _1650, _1651), float3(_4385, _4386, _4387));
      _4474 = dot(float3(_1649, _1650, _1651), float3(_1766, _1767, _1768));
      _4480 = cos(abs(asin(_4474) - asin(_4473)) * 0.5f);
      _4484 = _4385 - (_4473 * _1649);
      _4485 = _4386 - (_4473 * _1650);
      _4486 = _4387 - (_4473 * _1651);
      _4490 = _1766 - (_4474 * _1649);
      _4491 = _1767 - (_4474 * _1650);
      _4492 = _1768 - (_4474 * _1651);
  // [sem: invLength]
      _4499 = rsqrt((dot(float3(_4490, _4491, _4492), float3(_4490, _4491, _4492)) * dot(float3(_4484, _4485, _4486), float3(_4484, _4485, _4486))) + 9.999999747378752e-05f) * dot(float3(_4484, _4485, _4486), float3(_4490, _4491, _4492));
      _4503 = sqrt(saturate((_4499 * 0.5f) + 0.5f));
      _4510 = min(max(max(0.05000000074505806f, _4192), 0.09803921729326248f), 1.0f);
      _4511 = _4510 * _4510;
      _4512 = _4511 * 0.5f;
      _4513 = _4511 * 2.0f;
      _4514 = _4474 + _4473;
      _4515 = _4514 + (_4428 * 2.0f);
      _4517 = (_4503 * 1.4142135381698608f) * _4511;
      _4531 = 1.0f - sqrt(saturate((dot(float3(_1766, _1767, _1768), float3(_4385, _4386, _4387)) * 0.5f) + 0.5f));
      _4532 = _4531 * _4531;
      _4539 = _4514 - _4428;
      _4548 = 1.0f / ((1.190000057220459f / _4480) + (_4480 * 0.36000001430511475f));
      _4553 = ((_4548 * (0.6000000238418579f - (_4499 * 0.800000011920929f))) + 1.0f) * _4503;
      _4559 = 1.0f - (sqrt(saturate(1.0f - (_4553 * _4553))) * _4480);
      _4560 = _4559 * _4559;
      _4564 = 0.9534794092178345f - ((_4560 * _4560) * (_4559 * 0.9534794092178345f));
      _4565 = _4548 * _4553;
      _4570 = (sqrt(1.0f - (_4565 * _4565)) * 0.5f) / _4480;
      _4571 = log2(_4182);
      _4572 = log2(_4183);
      _4573 = log2(_4184);
      _4585 = ((_4564 * _4564) * (exp2((((_4539 * _4539) * -0.5f) / (_4512 * _4512)) * 1.4426950216293335f) / (_4511 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_4499 * 5.2658371925354f));
      _4589 = _4514 - (_4428 * 4.0f);
      _4599 = 1.0f - (_4480 * 0.5f);
      _4600 = _4599 * _4599;
      _4604 = (_4600 * _4600) * (0.9534794092178345f - (_4480 * 0.47673970460891724f));
      _4606 = 0.9534794092178345f - _4604;
      _4607 = 0.800000011920929f / _4480;
      _4620 = (((_4606 * _4606) * (_4604 + 0.04652056470513344f)) * (exp2((((_4589 * _4589) * -0.5f) / (_4513 * _4513)) * 1.4426950216293335f) / (_4511 * 5.013256549835205f))) * exp2((_4499 * 24.525815963745117f) + -24.208423614501953f);
      _4627 = saturate(_4401);  // [sem: _4401_sat]
      _4628 = (((_4503 * 0.25f) * (exp2((((_4515 * _4515) * -0.5f) / (_4517 * _4517)) * 1.4426950216293335f) / (_4517 * 2.5066282749176025f))) * (((_4532 * _4532) * (_4531 * 0.9534794092178345f)) + 0.04652056470513344f)) * _4627;
      _4638 = -0.0f - _4627;
      _4649 = saturate((_4401 + 1.0f) * 0.25f);  // [sem: expr_sat]
      _4654 = max(0.0010000000474974513f, dot(float3(_4182, _4183, _4184), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f)));
      _4673 = ((((1.0f - abs(_4401)) - _4649) * 0.33000001311302185f) + _4649) * 0.07957746833562851f;
      _4675 = (exp2(log2(_4182 / _4654) * (1.0f - _3897)) * _4673) * sqrt(_4182);
      _4677 = (exp2(log2(_4183 / _4654) * (1.0f - _3898)) * _4673) * sqrt(_4183);
      _4679 = (exp2(log2(_4184 / _4654) * (1.0f - _3899)) * _4673) * sqrt(_4184);
      _4686 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_4620 * exp2(_4607 * _4571)) + (_4585 * exp2(_4571 * _4570))) * _4638)))));
      _4687 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_4620 * exp2(_4607 * _4572)) + (_4585 * exp2(_4572 * _4570))) * _4638)))));
      _4688 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_4620 * exp2(_4607 * _4573)) + (_4585 * exp2(_4573 * _4570))) * _4638)))));
      _4695 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_4460, 1.0f, _4459)) * _4628))) * _3897));
      _4696 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_4461, 1.0f, _4459)) * _4628))) * _3898));
      _4697 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_4462, 1.0f, _4459)) * _4628))) * _3899));
      if (!_4409) {
        _4699 = _4686;
        _4700 = _4687;
        _4701 = _4688;
        _4702 = _4695;
        _4703 = _4696;
        _4704 = _4697;
        _4705 = _4675;
        _4706 = _4677;
        _4707 = _4679;
        if (!_4410) {
          _4709 = (_4366 == 0);
          if (_4709) {
            if ((_4400 > 0.0f) || (_4401 > 0.0f)) {
              _4877 = 0.0f;
              _4878 = 0.0f;
              _4879 = 0.0f;
              _4880 = 0.0f;
              _4881 = 0.0f;
              _4882 = 0.0f;
              _4883 = 0.0f;
              _4884 = 0.0f;
              _4885 = 0.0f;
              if (!(_4233 > 0.9900000095367432f)) {
                _4888 = saturate(_4400);  // [sem: _4400_sat]
                _4889 = 1.0f - _4324;
                _4890 = 1.0f - _4408;
                _4891 = _4890 * _4890;
                _4894 = ((_4891 * _4891) * _4890) + _4408;
                _4895 = 1.0f - _4888;
                _4896 = _4895 * _4895;
                _4901 = 1.0f - _4403;
                _4902 = _4901 * _4901;
                _4929 = (_4888 * 0.31830987334251404f) * ((((_4408 * ((((_4889 * 34.5f) + -59.0f) * _4889) + 24.5f)) * exp2(-0.0f - (max(((_4889 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_4405)))) + _4894) + ((((1.0f - ((_4896 * _4896) * (_4895 * 0.75f))) * (1.0f - ((_4902 * _4902) * (_4901 * 0.75f)))) - _4894) * saturate((_4889 * 2.200000047683716f) + -0.5f)));
                _4932 = saturate(1.0f - saturate(_4406));  // [sem: expr_sat]
                _4933 = _4932 * _4932;
                _4935 = (_4933 * _4933) * _4932;
                _4938 = _4935 * saturate(_4321 * 50.0f);
                _4939 = 1.0f - _4935;
                _4943 = (_4939 * _4320) + _4938;
                _4944 = (_4939 * _4321) + _4938;
                _4945 = (_4939 * _4322) + _4938;
                if (!(_4232 == 29)) {
                  _4947 = saturate(_4401);  // [sem: _4401_sat]
                  _4948 = 1.0f - _4323;
                  _4960 = (((_4405 * _4324) - _4405) * _4405) + 1.0f;
                  _4964 = (_4324 / ((_4960 * _4960) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4948) + _4323) * _4401) + (_4403 * ((_4401 * _4948) + _4323))));
                  _4975 = (max((_4964 * _4943), 0.0f) * _4947);
                  _4976 = (max((_4964 * _4944), 0.0f) * _4947);
                  _4977 = (max((_4964 * _4945), 0.0f) * _4947);
                } else {
                  _4975 = 0.0f;
                  _4976 = 0.0f;
                  _4977 = 0.0f;
                }
                // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
                // Description: RenderDiffuseTiledCS 0x973D36C7 adds AO+ foliage transmission to this vanilla direct-light branch without enabling the broader material-table direct-light patches on this sibling.
                if (FOLIAGE_TRANSMISSION > 0.0f && _rndx_isFoliage) {
                  FoliageTransmissionResult _rndx_ftResult = FoliageTransmission(
                      float3(_1766, _1767, _1768),
                      float3(_4385, _4386, _4387),
                      float3(_4215, _4216, _4217),
                      _4400,
                      float3(_4182, _4183, _4184),
                      float3(_4160, _4161, _4162),
                      float3(_4389, _4390, _4391),
                      FOLIAGE_TRANSMISSION_THICKNESS);
                  _rndx_foliageTransR = _rndx_ftResult.transmission.x;
                  _rndx_foliageTransG = _rndx_ftResult.transmission.y;
                  _rndx_foliageTransB = _rndx_ftResult.transmission.z;
                  if (_rndx_ftResult.diffuseScale > 0.0f) {
                    _4929 *= _rndx_ftResult.diffuseScale;
                  } else {
                    float _rndx_wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
                    _4929 = max(0.0f, (_4400 + _rndx_wrap) / (1.0f + _rndx_wrap)) * 0.31830987334251404f * 0.75f;
                  }
                }
                // RenoDX: <<< [Patch: FoliageTransmission]
                _4978 = (_4232 == 65);
                if (_4297) {
                  if (_4978) {
                    _5021 = max(9.999999974752427e-07f, _exposure2.x);
                    _5030 = ((_4888 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4266, _4267, _4268), float3(_1766, _1767, _1768)))) * 16.0f)) / (((_5021 * _5021) * 1e+06f) + 1.0f);
                    _5044 = _4975;
                    _5045 = _4976;
                    _5046 = _4977;
                    _5047 = ((((_5030 * _4182) - _4929) * _4231) + _4929);
                    _5048 = ((((_5030 * _4183) - _4929) * _4231) + _4929);
                    _5049 = ((((_5030 * _4184) - _4929) * _4231) + _4929);
                  } else {
                    _4985 = 1.0f - _4329;
                    _4997 = (((_4405 * _4330) - _4405) * _4405) + 1.0f;
                    _5001 = (_4330 / ((_4997 * _4997) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4985) + _4329) * _4401) + (_4403 * ((_4401 * _4985) + _4329))));
                    _5008 = saturate(_4401) * 0.39990234375f;
                    _5044 = ((max((_5001 * _4943), 0.0f) * _5008) + (_4975 * 0.60009765625f));
                    _5045 = ((max((_5001 * _4944), 0.0f) * _5008) + (_4976 * 0.60009765625f));
                    _5046 = ((max((_5001 * _4945), 0.0f) * _5008) + (_4977 * 0.60009765625f));
                    _5047 = _4929;
                    _5048 = _4929;
                    _5049 = _4929;
                  }
                } else {
                  if (_4978) {
                    _5021 = max(9.999999974752427e-07f, _exposure2.x);
                    _5030 = ((_4888 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4266, _4267, _4268), float3(_1766, _1767, _1768)))) * 16.0f)) / (((_5021 * _5021) * 1e+06f) + 1.0f);
                    _5044 = _4975;
                    _5045 = _4976;
                    _5046 = _4977;
                    _5047 = ((((_5030 * _4182) - _4929) * _4231) + _4929);
                    _5048 = ((((_5030 * _4183) - _4929) * _4231) + _4929);
                    _5049 = ((((_5030 * _4184) - _4929) * _4231) + _4929);
                  } else {
                    _5044 = _4975;
                    _5045 = _4976;
                    _5046 = _4977;
                    _5047 = _4929;
                    _5048 = _4929;
                    _5049 = _4929;
                  }
                }
              } else {
                _5044 = _4702;
                _5045 = _4703;
                _5046 = _4704;
                _5047 = _4705;
                _5048 = _4706;
                _5049 = _4707;
              }
              _5053 = min(-0.0f, (-0.0f - _5047));
              _5054 = min(-0.0f, (-0.0f - _5048));
              _5055 = min(-0.0f, (-0.0f - _5049));
              _5056 = -0.0f - _5053;
              _5057 = -0.0f - _5054;
              _5058 = -0.0f - _5055;
              _5117 = _4699;
              _5118 = _4700;
              _5119 = _4701;
              _5120 = (_5044 * _3897);
              _5121 = (_5045 * _3898);
              _5122 = (_5046 * _3899);
              _5123 = (_3897 * _5056);
              _5124 = (_3898 * _5057);
              _5125 = (_3899 * _5058);
            } else {
              _5117 = _4699;
              _5118 = _4700;
              _5119 = _4701;
              _5120 = _4702;
              _5121 = _4703;
              _5122 = _4704;
              _5123 = _4705;
              _5124 = _4706;
              _5125 = _4707;
            }
          } else {
            _4724 = (saturate(_4400) * 0.31830987334251404f) * (((saturate(1.0f - _effectiveMetallicForVelvet) + -1.0f) * _4237) + 1.0f);
            _4730 = max(dot(float3(_4182, _4183, _4184), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
            _4731 = sqrt(_4182);
            _4732 = sqrt(_4183);
            _4733 = sqrt(_4184);
            _4734 = _4731 - _4730;
            _4735 = _4732 - _4730;
            _4736 = _4733 - _4730;
            _4743 = saturate(1.0f - (pow(_4403, 4.0f)));  // [sem: expr_sat]
            _4756 = (((_4735 * _4234) + _4730) + ((_4735 * (_4237 - _4234)) * _4743)) * _4235;
            _4759 = saturate(1.0f - saturate(_4406));  // [sem: expr_sat]
            _4760 = _4759 * _4759;
            _4762 = (_4760 * _4760) * _4759;
            _4765 = _4762 * saturate(_4756 * 50.0f);
            _4766 = 1.0f - _4762;
            _4767 = _4766 * _4235;
            _4771 = (_4767 * (((_4734 * _4234) + _4730) + (_4743 * (_4734 * (_4237 - _4234))))) + _4765;
            _4772 = (_4766 * _4756) + _4765;
            _4773 = (_4767 * (((_4736 * _4234) + _4730) + ((_4736 * (_4237 - _4234)) * _4743))) + _4765;
            _4774 = min(_4405, 0.9998999834060669f);
            _4775 = _4774 * _4774;
            _4776 = 1.0f - _4775;
            _4788 = (((exp2(((-0.0f - _4775) / (_4776 * _4324)) * 1.4426950216293335f) * 4.0f) / (_4776 * _4776)) + 1.0f) / ((_4324 * 12.566370964050293f) + 3.1415927410125732f);
            _4792 = ((_4403 + _4401) - (_4403 * _4401)) * 4.0f;
            _4796 = (_4771 * _4788) / _4792;
            _4797 = (_4772 * _4788) / _4792;
            _4798 = (_4773 * _4788) / _4792;
            _4799 = 1.0f - _4323;
            _4811 = (((_4405 * _4324) - _4405) * _4405) + 1.0f;
            _4815 = (_4324 / ((_4811 * _4811) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4799) + _4323) * _4400) + (_4403 * ((_4400 * _4799) + _4323))));
            _4831 = saturate(_4401);  // [sem: _4401_sat]
            _4836 = (_4236 * 1.5f) + 2.5f;
            _4837 = _4836 * _4836;
            _4847 = (max(0.0f, (0.30000001192092896f - _4400)) * 0.25f) * ((exp2(_4837 * -0.48089835047721863f) * 3.0f) + exp2(_4837 * -1.4426950216293335f));
            _4872 = (((1.0f - _4237) * 0.47746479511260986f) * saturate(_4236)) * saturate((pow(_4405, 4.0f)) * exp2(log2(saturate(1.0f - abs(_4400))) * 3.0f));
            _4877 = (_4872 * _4731);
            _4878 = (_4872 * _4732);
            _4879 = (_4872 * _4733);
            _4880 = ((((max((_4815 * _4771), 0.0f) - _4796) * _4234) + _4796) * _4831);
            _4881 = ((((max((_4815 * _4772), 0.0f) - _4797) * _4234) + _4797) * _4831);
            _4882 = ((((max((_4815 * _4773), 0.0f) - _4798) * _4234) + _4798) * _4831);
            _4883 = (((_4731 * _3897) * _4847) + _4724);
            _4884 = (((_4732 * _3898) * _4847) + _4724);
            _4885 = (((_4733 * _3899) * _4847) + _4724);
            if (!(_4233 > 0.9900000095367432f)) {
              _4888 = saturate(_4400);  // [sem: _4400_sat]
              _4889 = 1.0f - _4324;
              _4890 = 1.0f - _4408;
              _4891 = _4890 * _4890;
              _4894 = ((_4891 * _4891) * _4890) + _4408;
              _4895 = 1.0f - _4888;
              _4896 = _4895 * _4895;
              _4901 = 1.0f - _4403;
              _4902 = _4901 * _4901;
              _4929 = (_4888 * 0.31830987334251404f) * ((((_4408 * ((((_4889 * 34.5f) + -59.0f) * _4889) + 24.5f)) * exp2(-0.0f - (max(((_4889 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_4405)))) + _4894) + ((((1.0f - ((_4896 * _4896) * (_4895 * 0.75f))) * (1.0f - ((_4902 * _4902) * (_4901 * 0.75f)))) - _4894) * saturate((_4889 * 2.200000047683716f) + -0.5f)));
              _4932 = saturate(1.0f - saturate(_4406));  // [sem: expr_sat]
              _4933 = _4932 * _4932;
              _4935 = (_4933 * _4933) * _4932;
              _4938 = _4935 * saturate(_4321 * 50.0f);
              _4939 = 1.0f - _4935;
              _4943 = (_4939 * _4320) + _4938;
              _4944 = (_4939 * _4321) + _4938;
              _4945 = (_4939 * _4322) + _4938;
              if (!(_4232 == 29)) {
                _4947 = saturate(_4401);  // [sem: _4401_sat]
                _4948 = 1.0f - _4323;
                _4960 = (((_4405 * _4324) - _4405) * _4405) + 1.0f;
                _4964 = (_4324 / ((_4960 * _4960) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4948) + _4323) * _4401) + (_4403 * ((_4401 * _4948) + _4323))));
                _4975 = (max((_4964 * _4943), 0.0f) * _4947);
                _4976 = (max((_4964 * _4944), 0.0f) * _4947);
                _4977 = (max((_4964 * _4945), 0.0f) * _4947);
              } else {
                _4975 = 0.0f;
                _4976 = 0.0f;
                _4977 = 0.0f;
              }
              // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
              // Description: RenderDiffuseTiledCS 0x973D36C7 adds AO+ foliage transmission to this vanilla direct-light branch without enabling the broader material-table direct-light patches on this sibling.
              if (FOLIAGE_TRANSMISSION > 0.0f && _rndx_isFoliage) {
                FoliageTransmissionResult _rndx_ftResult = FoliageTransmission(
                    float3(_1766, _1767, _1768),
                    float3(_4385, _4386, _4387),
                    float3(_4215, _4216, _4217),
                    _4400,
                    float3(_4182, _4183, _4184),
                    float3(_4160, _4161, _4162),
                    float3(_4389, _4390, _4391),
                    FOLIAGE_TRANSMISSION_THICKNESS);
                _rndx_foliageTransR = _rndx_ftResult.transmission.x;
                _rndx_foliageTransG = _rndx_ftResult.transmission.y;
                _rndx_foliageTransB = _rndx_ftResult.transmission.z;
                if (_rndx_ftResult.diffuseScale > 0.0f) {
                  _4929 *= _rndx_ftResult.diffuseScale;
                } else {
                  float _rndx_wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
                  _4929 = max(0.0f, (_4400 + _rndx_wrap) / (1.0f + _rndx_wrap)) * 0.31830987334251404f * 0.75f;
                }
              }
              // RenoDX: <<< [Patch: FoliageTransmission]
              _4978 = (_4232 == 65);
              if (_4297) {
                if (_4978) {
                  _5021 = max(9.999999974752427e-07f, _exposure2.x);
                  _5030 = ((_4888 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4266, _4267, _4268), float3(_1766, _1767, _1768)))) * 16.0f)) / (((_5021 * _5021) * 1e+06f) + 1.0f);
                  _5044 = _4975;
                  _5045 = _4976;
                  _5046 = _4977;
                  _5047 = ((((_5030 * _4182) - _4929) * _4231) + _4929);
                  _5048 = ((((_5030 * _4183) - _4929) * _4231) + _4929);
                  _5049 = ((((_5030 * _4184) - _4929) * _4231) + _4929);
                } else {
                  _4985 = 1.0f - _4329;
                  _4997 = (((_4405 * _4330) - _4405) * _4405) + 1.0f;
                  _5001 = (_4330 / ((_4997 * _4997) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4985) + _4329) * _4401) + (_4403 * ((_4401 * _4985) + _4329))));
                  _5008 = saturate(_4401) * 0.39990234375f;
                  _5044 = ((max((_5001 * _4943), 0.0f) * _5008) + (_4975 * 0.60009765625f));
                  _5045 = ((max((_5001 * _4944), 0.0f) * _5008) + (_4976 * 0.60009765625f));
                  _5046 = ((max((_5001 * _4945), 0.0f) * _5008) + (_4977 * 0.60009765625f));
                  _5047 = _4929;
                  _5048 = _4929;
                  _5049 = _4929;
                }
              } else {
                if (_4978) {
                  _5021 = max(9.999999974752427e-07f, _exposure2.x);
                  _5030 = ((_4888 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4266, _4267, _4268), float3(_1766, _1767, _1768)))) * 16.0f)) / (((_5021 * _5021) * 1e+06f) + 1.0f);
                  _5044 = _4975;
                  _5045 = _4976;
                  _5046 = _4977;
                  _5047 = ((((_5030 * _4182) - _4929) * _4231) + _4929);
                  _5048 = ((((_5030 * _4183) - _4929) * _4231) + _4929);
                  _5049 = ((((_5030 * _4184) - _4929) * _4231) + _4929);
                } else {
                  _5044 = _4975;
                  _5045 = _4976;
                  _5046 = _4977;
                  _5047 = _4929;
                  _5048 = _4929;
                  _5049 = _4929;
                }
              }
            } else {
              _5044 = _4702;
              _5045 = _4703;
              _5046 = _4704;
              _5047 = _4705;
              _5048 = _4706;
              _5049 = _4707;
            }
            _5053 = min(-0.0f, (-0.0f - _5047));
            _5054 = min(-0.0f, (-0.0f - _5048));
            _5055 = min(-0.0f, (-0.0f - _5049));
            _5056 = -0.0f - _5053;
            _5057 = -0.0f - _5054;
            _5058 = -0.0f - _5055;
            _5060 = (_4233 > 0.0f);
            if (_5060) {
              _5094 = (_4699 - (_4699 * _4365));
              _5095 = (_4700 - (_4700 * _4365));
              _5096 = (_4701 - (_4701 * _4365));
              _5097 = (lerp(_5044, _4880, _4365));  // [sem: blended]
              _5098 = (lerp(_5045, _4881, _4365));  // [sem: blended]
              _5099 = (lerp(_5046, _4882, _4365));  // [sem: blended]
              _5100 = (((_5053 + _4883) * _4365) - _5053);
              _5101 = (((_5054 + _4884) * _4365) - _5054);
              _5102 = (((_5055 + _4885) * _4365) - _5055);
            } else {
              _5094 = _4699;
              _5095 = _4700;
              _5096 = _4701;
              _5097 = _5044;  // [sem: blended]
              _5098 = _5045;  // [sem: blended]
              _5099 = _5046;  // [sem: blended]
              _5100 = _5056;
              _5101 = _5057;
              _5102 = _5058;
            }
            _5103 = _5100 * _3897;
            _5104 = _5101 * _3898;
            _5105 = _5102 * _3899;
            _5106 = _5097 * _3897;
            _5107 = _5098 * _3898;
            _5108 = _5099 * _3899;
            if (_5060) {
              _5117 = _5094;
              _5118 = _5095;
              _5119 = _5096;
              _5120 = (_5106 + (_4877 * _4365));
              _5121 = (_5107 + (_4878 * _4365));
              _5122 = (_5108 + (_4879 * _4365));
              _5123 = _5103;
              _5124 = _5104;
              _5125 = _5105;
            } else {
              _5117 = _5094;
              _5118 = _5095;
              _5119 = _5096;
              _5120 = _5106;
              _5121 = _5107;
              _5122 = _5108;
              _5123 = _5103;
              _5124 = _5104;
              _5125 = _5105;
            }
          }
        } else {
          _5117 = _4699;
          _5118 = _4700;
          _5119 = _4701;
          _5120 = _4702;
          _5121 = _4703;
          _5122 = _4704;
          _5123 = _4705;
          _5124 = _4706;
          _5125 = _4707;
        }
      } else {
        _5117 = _4686;
        _5118 = _4687;
        _5119 = _4688;
        _5120 = _4695;
        _5121 = _4696;
        _5122 = _4697;
        _5123 = _4675;
        _5124 = _4677;
        _5125 = _4679;
      }
    } else {
      _4699 = 0.0f;
      _4700 = 0.0f;
      _4701 = 0.0f;
      _4702 = 0.0f;
      _4703 = 0.0f;
      _4704 = 0.0f;
      _4705 = 0.0f;
      _4706 = 0.0f;
      _4707 = 0.0f;
      if (!_4410) {
        _4709 = (_4366 == 0);
        if (_4709) {
          if ((_4400 > 0.0f) || (_4401 > 0.0f)) {
            _4877 = 0.0f;
            _4878 = 0.0f;
            _4879 = 0.0f;
            _4880 = 0.0f;
            _4881 = 0.0f;
            _4882 = 0.0f;
            _4883 = 0.0f;
            _4884 = 0.0f;
            _4885 = 0.0f;
            if (!(_4233 > 0.9900000095367432f)) {
              _4888 = saturate(_4400);  // [sem: _4400_sat]
              _4889 = 1.0f - _4324;
              _4890 = 1.0f - _4408;
              _4891 = _4890 * _4890;
              _4894 = ((_4891 * _4891) * _4890) + _4408;
              _4895 = 1.0f - _4888;
              _4896 = _4895 * _4895;
              _4901 = 1.0f - _4403;
              _4902 = _4901 * _4901;
              _4929 = (_4888 * 0.31830987334251404f) * ((((_4408 * ((((_4889 * 34.5f) + -59.0f) * _4889) + 24.5f)) * exp2(-0.0f - (max(((_4889 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_4405)))) + _4894) + ((((1.0f - ((_4896 * _4896) * (_4895 * 0.75f))) * (1.0f - ((_4902 * _4902) * (_4901 * 0.75f)))) - _4894) * saturate((_4889 * 2.200000047683716f) + -0.5f)));
              _4932 = saturate(1.0f - saturate(_4406));  // [sem: expr_sat]
              _4933 = _4932 * _4932;
              _4935 = (_4933 * _4933) * _4932;
              _4938 = _4935 * saturate(_4321 * 50.0f);
              _4939 = 1.0f - _4935;
              _4943 = (_4939 * _4320) + _4938;
              _4944 = (_4939 * _4321) + _4938;
              _4945 = (_4939 * _4322) + _4938;
              if (!(_4232 == 29)) {
                _4947 = saturate(_4401);  // [sem: _4401_sat]
                _4948 = 1.0f - _4323;
                _4960 = (((_4405 * _4324) - _4405) * _4405) + 1.0f;
                _4964 = (_4324 / ((_4960 * _4960) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4948) + _4323) * _4401) + (_4403 * ((_4401 * _4948) + _4323))));
                _4975 = (max((_4964 * _4943), 0.0f) * _4947);
                _4976 = (max((_4964 * _4944), 0.0f) * _4947);
                _4977 = (max((_4964 * _4945), 0.0f) * _4947);
              } else {
                _4975 = 0.0f;
                _4976 = 0.0f;
                _4977 = 0.0f;
              }
              // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
              // Description: RenderDiffuseTiledCS 0x973D36C7 adds AO+ foliage transmission to this vanilla direct-light branch without enabling the broader material-table direct-light patches on this sibling.
              if (FOLIAGE_TRANSMISSION > 0.0f && _rndx_isFoliage) {
                FoliageTransmissionResult _rndx_ftResult = FoliageTransmission(
                    float3(_1766, _1767, _1768),
                    float3(_4385, _4386, _4387),
                    float3(_4215, _4216, _4217),
                    _4400,
                    float3(_4182, _4183, _4184),
                    float3(_4160, _4161, _4162),
                    float3(_4389, _4390, _4391),
                    FOLIAGE_TRANSMISSION_THICKNESS);
                _rndx_foliageTransR = _rndx_ftResult.transmission.x;
                _rndx_foliageTransG = _rndx_ftResult.transmission.y;
                _rndx_foliageTransB = _rndx_ftResult.transmission.z;
                if (_rndx_ftResult.diffuseScale > 0.0f) {
                  _4929 *= _rndx_ftResult.diffuseScale;
                } else {
                  float _rndx_wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
                  _4929 = max(0.0f, (_4400 + _rndx_wrap) / (1.0f + _rndx_wrap)) * 0.31830987334251404f * 0.75f;
                }
              }
              // RenoDX: <<< [Patch: FoliageTransmission]
              _4978 = (_4232 == 65);
              if (_4297) {
                if (_4978) {
                  _5021 = max(9.999999974752427e-07f, _exposure2.x);
                  _5030 = ((_4888 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4266, _4267, _4268), float3(_1766, _1767, _1768)))) * 16.0f)) / (((_5021 * _5021) * 1e+06f) + 1.0f);
                  _5044 = _4975;
                  _5045 = _4976;
                  _5046 = _4977;
                  _5047 = ((((_5030 * _4182) - _4929) * _4231) + _4929);
                  _5048 = ((((_5030 * _4183) - _4929) * _4231) + _4929);
                  _5049 = ((((_5030 * _4184) - _4929) * _4231) + _4929);
                } else {
                  _4985 = 1.0f - _4329;
                  _4997 = (((_4405 * _4330) - _4405) * _4405) + 1.0f;
                  _5001 = (_4330 / ((_4997 * _4997) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4985) + _4329) * _4401) + (_4403 * ((_4401 * _4985) + _4329))));
                  _5008 = saturate(_4401) * 0.39990234375f;
                  _5044 = ((max((_5001 * _4943), 0.0f) * _5008) + (_4975 * 0.60009765625f));
                  _5045 = ((max((_5001 * _4944), 0.0f) * _5008) + (_4976 * 0.60009765625f));
                  _5046 = ((max((_5001 * _4945), 0.0f) * _5008) + (_4977 * 0.60009765625f));
                  _5047 = _4929;
                  _5048 = _4929;
                  _5049 = _4929;
                }
              } else {
                if (_4978) {
                  _5021 = max(9.999999974752427e-07f, _exposure2.x);
                  _5030 = ((_4888 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4266, _4267, _4268), float3(_1766, _1767, _1768)))) * 16.0f)) / (((_5021 * _5021) * 1e+06f) + 1.0f);
                  _5044 = _4975;
                  _5045 = _4976;
                  _5046 = _4977;
                  _5047 = ((((_5030 * _4182) - _4929) * _4231) + _4929);
                  _5048 = ((((_5030 * _4183) - _4929) * _4231) + _4929);
                  _5049 = ((((_5030 * _4184) - _4929) * _4231) + _4929);
                } else {
                  _5044 = _4975;
                  _5045 = _4976;
                  _5046 = _4977;
                  _5047 = _4929;
                  _5048 = _4929;
                  _5049 = _4929;
                }
              }
            } else {
              _5044 = _4702;
              _5045 = _4703;
              _5046 = _4704;
              _5047 = _4705;
              _5048 = _4706;
              _5049 = _4707;
            }
            _5053 = min(-0.0f, (-0.0f - _5047));
            _5054 = min(-0.0f, (-0.0f - _5048));
            _5055 = min(-0.0f, (-0.0f - _5049));
            _5056 = -0.0f - _5053;
            _5057 = -0.0f - _5054;
            _5058 = -0.0f - _5055;
            _5117 = _4699;
            _5118 = _4700;
            _5119 = _4701;
            _5120 = (_5044 * _3897);
            _5121 = (_5045 * _3898);
            _5122 = (_5046 * _3899);
            _5123 = (_3897 * _5056);
            _5124 = (_3898 * _5057);
            _5125 = (_3899 * _5058);
          } else {
            _5117 = _4699;
            _5118 = _4700;
            _5119 = _4701;
            _5120 = _4702;
            _5121 = _4703;
            _5122 = _4704;
            _5123 = _4705;
            _5124 = _4706;
            _5125 = _4707;
          }
        } else {
          _4724 = (saturate(_4400) * 0.31830987334251404f) * (((saturate(1.0f - _effectiveMetallicForVelvet) + -1.0f) * _4237) + 1.0f);
          _4730 = max(dot(float3(_4182, _4183, _4184), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
          _4731 = sqrt(_4182);
          _4732 = sqrt(_4183);
          _4733 = sqrt(_4184);
          _4734 = _4731 - _4730;
          _4735 = _4732 - _4730;
          _4736 = _4733 - _4730;
          _4743 = saturate(1.0f - (pow(_4403, 4.0f)));  // [sem: expr_sat]
          _4756 = (((_4735 * _4234) + _4730) + ((_4735 * (_4237 - _4234)) * _4743)) * _4235;
          _4759 = saturate(1.0f - saturate(_4406));  // [sem: expr_sat]
          _4760 = _4759 * _4759;
          _4762 = (_4760 * _4760) * _4759;
          _4765 = _4762 * saturate(_4756 * 50.0f);
          _4766 = 1.0f - _4762;
          _4767 = _4766 * _4235;
          _4771 = (_4767 * (((_4734 * _4234) + _4730) + (_4743 * (_4734 * (_4237 - _4234))))) + _4765;
          _4772 = (_4766 * _4756) + _4765;
          _4773 = (_4767 * (((_4736 * _4234) + _4730) + ((_4736 * (_4237 - _4234)) * _4743))) + _4765;
          _4774 = min(_4405, 0.9998999834060669f);
          _4775 = _4774 * _4774;
          _4776 = 1.0f - _4775;
          _4788 = (((exp2(((-0.0f - _4775) / (_4776 * _4324)) * 1.4426950216293335f) * 4.0f) / (_4776 * _4776)) + 1.0f) / ((_4324 * 12.566370964050293f) + 3.1415927410125732f);
          _4792 = ((_4403 + _4401) - (_4403 * _4401)) * 4.0f;
          _4796 = (_4771 * _4788) / _4792;
          _4797 = (_4772 * _4788) / _4792;
          _4798 = (_4773 * _4788) / _4792;
          _4799 = 1.0f - _4323;
          _4811 = (((_4405 * _4324) - _4405) * _4405) + 1.0f;
          _4815 = (_4324 / ((_4811 * _4811) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4799) + _4323) * _4400) + (_4403 * ((_4400 * _4799) + _4323))));
          _4831 = saturate(_4401);  // [sem: _4401_sat]
          _4836 = (_4236 * 1.5f) + 2.5f;
          _4837 = _4836 * _4836;
          _4847 = (max(0.0f, (0.30000001192092896f - _4400)) * 0.25f) * ((exp2(_4837 * -0.48089835047721863f) * 3.0f) + exp2(_4837 * -1.4426950216293335f));
          _4872 = (((1.0f - _4237) * 0.47746479511260986f) * saturate(_4236)) * saturate((pow(_4405, 4.0f)) * exp2(log2(saturate(1.0f - abs(_4400))) * 3.0f));
          _4877 = (_4872 * _4731);
          _4878 = (_4872 * _4732);
          _4879 = (_4872 * _4733);
          _4880 = ((((max((_4815 * _4771), 0.0f) - _4796) * _4234) + _4796) * _4831);
          _4881 = ((((max((_4815 * _4772), 0.0f) - _4797) * _4234) + _4797) * _4831);
          _4882 = ((((max((_4815 * _4773), 0.0f) - _4798) * _4234) + _4798) * _4831);
          _4883 = (((_4731 * _3897) * _4847) + _4724);
          _4884 = (((_4732 * _3898) * _4847) + _4724);
          _4885 = (((_4733 * _3899) * _4847) + _4724);
          if (!(_4233 > 0.9900000095367432f)) {
            _4888 = saturate(_4400);  // [sem: _4400_sat]
            _4889 = 1.0f - _4324;
            _4890 = 1.0f - _4408;
            _4891 = _4890 * _4890;
            _4894 = ((_4891 * _4891) * _4890) + _4408;
            _4895 = 1.0f - _4888;
            _4896 = _4895 * _4895;
            _4901 = 1.0f - _4403;
            _4902 = _4901 * _4901;
            _4929 = (_4888 * 0.31830987334251404f) * ((((_4408 * ((((_4889 * 34.5f) + -59.0f) * _4889) + 24.5f)) * exp2(-0.0f - (max(((_4889 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_4405)))) + _4894) + ((((1.0f - ((_4896 * _4896) * (_4895 * 0.75f))) * (1.0f - ((_4902 * _4902) * (_4901 * 0.75f)))) - _4894) * saturate((_4889 * 2.200000047683716f) + -0.5f)));
            _4932 = saturate(1.0f - saturate(_4406));  // [sem: expr_sat]
            _4933 = _4932 * _4932;
            _4935 = (_4933 * _4933) * _4932;
            _4938 = _4935 * saturate(_4321 * 50.0f);
            _4939 = 1.0f - _4935;
            _4943 = (_4939 * _4320) + _4938;
            _4944 = (_4939 * _4321) + _4938;
            _4945 = (_4939 * _4322) + _4938;
            if (!(_4232 == 29)) {
              _4947 = saturate(_4401);  // [sem: _4401_sat]
              _4948 = 1.0f - _4323;
              _4960 = (((_4405 * _4324) - _4405) * _4405) + 1.0f;
              _4964 = (_4324 / ((_4960 * _4960) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4948) + _4323) * _4401) + (_4403 * ((_4401 * _4948) + _4323))));
              _4975 = (max((_4964 * _4943), 0.0f) * _4947);
              _4976 = (max((_4964 * _4944), 0.0f) * _4947);
              _4977 = (max((_4964 * _4945), 0.0f) * _4947);
            } else {
              _4975 = 0.0f;
              _4976 = 0.0f;
              _4977 = 0.0f;
            }
            // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
            // Description: RenderDiffuseTiledCS 0x973D36C7 adds AO+ foliage transmission to this vanilla direct-light branch without enabling the broader material-table direct-light patches on this sibling.
            if (FOLIAGE_TRANSMISSION > 0.0f && _rndx_isFoliage) {
              FoliageTransmissionResult _rndx_ftResult = FoliageTransmission(
                  float3(_1766, _1767, _1768),
                  float3(_4385, _4386, _4387),
                  float3(_4215, _4216, _4217),
                  _4400,
                  float3(_4182, _4183, _4184),
                  float3(_4160, _4161, _4162),
                  float3(_4389, _4390, _4391),
                  FOLIAGE_TRANSMISSION_THICKNESS);
              _rndx_foliageTransR = _rndx_ftResult.transmission.x;
              _rndx_foliageTransG = _rndx_ftResult.transmission.y;
              _rndx_foliageTransB = _rndx_ftResult.transmission.z;
              if (_rndx_ftResult.diffuseScale > 0.0f) {
                _4929 *= _rndx_ftResult.diffuseScale;
              } else {
                float _rndx_wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
                _4929 = max(0.0f, (_4400 + _rndx_wrap) / (1.0f + _rndx_wrap)) * 0.31830987334251404f * 0.75f;
              }
            }
            // RenoDX: <<< [Patch: FoliageTransmission]
            _4978 = (_4232 == 65);
            if (_4297) {
              if (_4978) {
                _5021 = max(9.999999974752427e-07f, _exposure2.x);
                _5030 = ((_4888 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4266, _4267, _4268), float3(_1766, _1767, _1768)))) * 16.0f)) / (((_5021 * _5021) * 1e+06f) + 1.0f);
                _5044 = _4975;
                _5045 = _4976;
                _5046 = _4977;
                _5047 = ((((_5030 * _4182) - _4929) * _4231) + _4929);
                _5048 = ((((_5030 * _4183) - _4929) * _4231) + _4929);
                _5049 = ((((_5030 * _4184) - _4929) * _4231) + _4929);
              } else {
                _4985 = 1.0f - _4329;
                _4997 = (((_4405 * _4330) - _4405) * _4405) + 1.0f;
                _5001 = (_4330 / ((_4997 * _4997) * 3.1415927410125732f)) * (0.5f / ((((_4403 * _4985) + _4329) * _4401) + (_4403 * ((_4401 * _4985) + _4329))));
                _5008 = saturate(_4401) * 0.39990234375f;
                _5044 = ((max((_5001 * _4943), 0.0f) * _5008) + (_4975 * 0.60009765625f));
                _5045 = ((max((_5001 * _4944), 0.0f) * _5008) + (_4976 * 0.60009765625f));
                _5046 = ((max((_5001 * _4945), 0.0f) * _5008) + (_4977 * 0.60009765625f));
                _5047 = _4929;
                _5048 = _4929;
                _5049 = _4929;
              }
            } else {
              if (_4978) {
                _5021 = max(9.999999974752427e-07f, _exposure2.x);
                _5030 = ((_4888 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_4266, _4267, _4268), float3(_1766, _1767, _1768)))) * 16.0f)) / (((_5021 * _5021) * 1e+06f) + 1.0f);
                _5044 = _4975;
                _5045 = _4976;
                _5046 = _4977;
                _5047 = ((((_5030 * _4182) - _4929) * _4231) + _4929);
                _5048 = ((((_5030 * _4183) - _4929) * _4231) + _4929);
                _5049 = ((((_5030 * _4184) - _4929) * _4231) + _4929);
              } else {
                _5044 = _4975;
                _5045 = _4976;
                _5046 = _4977;
                _5047 = _4929;
                _5048 = _4929;
                _5049 = _4929;
              }
            }
          } else {
            _5044 = _4702;
            _5045 = _4703;
            _5046 = _4704;
            _5047 = _4705;
            _5048 = _4706;
            _5049 = _4707;
          }
          _5053 = min(-0.0f, (-0.0f - _5047));
          _5054 = min(-0.0f, (-0.0f - _5048));
          _5055 = min(-0.0f, (-0.0f - _5049));
          _5056 = -0.0f - _5053;
          _5057 = -0.0f - _5054;
          _5058 = -0.0f - _5055;
          _5060 = (_4233 > 0.0f);
          if (_5060) {
            _5094 = (_4699 - (_4699 * _4365));
            _5095 = (_4700 - (_4700 * _4365));
            _5096 = (_4701 - (_4701 * _4365));
            _5097 = (lerp(_5044, _4880, _4365));  // [sem: blended]
            _5098 = (lerp(_5045, _4881, _4365));  // [sem: blended]
            _5099 = (lerp(_5046, _4882, _4365));  // [sem: blended]
            _5100 = (((_5053 + _4883) * _4365) - _5053);
            _5101 = (((_5054 + _4884) * _4365) - _5054);
            _5102 = (((_5055 + _4885) * _4365) - _5055);
          } else {
            _5094 = _4699;
            _5095 = _4700;
            _5096 = _4701;
            _5097 = _5044;  // [sem: blended]
            _5098 = _5045;  // [sem: blended]
            _5099 = _5046;  // [sem: blended]
            _5100 = _5056;
            _5101 = _5057;
            _5102 = _5058;
          }
          _5103 = _5100 * _3897;
          _5104 = _5101 * _3898;
          _5105 = _5102 * _3899;
          _5106 = _5097 * _3897;
          _5107 = _5098 * _3898;
          _5108 = _5099 * _3899;
          if (_5060) {
            _5117 = _5094;
            _5118 = _5095;
            _5119 = _5096;
            _5120 = (_5106 + (_4877 * _4365));
            _5121 = (_5107 + (_4878 * _4365));
            _5122 = (_5108 + (_4879 * _4365));
            _5123 = _5103;
            _5124 = _5104;
            _5125 = _5105;
          } else {
            _5117 = _5094;
            _5118 = _5095;
            _5119 = _5096;
            _5120 = _5106;
            _5121 = _5107;
            _5122 = _5108;
            _5123 = _5103;
            _5124 = _5104;
            _5125 = _5105;
          }
        }
      } else {
        _5117 = _4699;
        _5118 = _4700;
        _5119 = _4701;
        _5120 = _4702;
        _5121 = _4703;
        _5122 = _4704;
        _5123 = _4705;
        _5124 = _4706;
        _5125 = _4707;
      }
    }
    if (_4368) {
      _5129 = max(0.0f, (0.30000001192092896f - _4400)) * 0.23190687596797943f;
      _5137 = ((_5129 * _3897) + _5123);
      _5138 = ((_5129 * _3898) + _5124);
      _5139 = ((_5129 * _3899) + _5125);
    } else {
      _5137 = _5123;
      _5138 = _5124;
      _5139 = _5125;
    }
    _5141 = 1.0f - (_4406 * 0.8500000238418579f);
    if (_4297) {
      _5145 = max(4.0f, _4373);
      _5146 = _5145 * _5145;
      _5148 = exp2(_5146 * -225.4210968017578f);
      _5153 = exp2(_5146 * -29.807748794555664f);
      _5161 = exp2(_5146 * -7.714946269989014f);
      _5167 = exp2(_5146 * -2.544435739517212f);
      _5169 = _5167 * 0.007000000216066837f;
      _5174 = exp2(_5146 * -0.7249723672866821f);
      _5188 = saturate(dot(float3(_4385, _4386, _4387), float3((-0.0f - _223), _239, (-0.0f - _225))) + 0.30000001192092896f) * 0.31830987334251404f;
      _5481 = _3897;
      _5482 = _3898;
      _5483 = _3899;
      _5484 = _5117;
      _5485 = _5118;
      _5486 = _5119;
      _5487 = ((_5188 * ((((((_5153 * 0.10000000149011612f) + (_5148 * 0.2329999953508377f)) + (_5161 * 0.11800000071525574f)) + (_5167 * 0.11299999803304672f)) + (_5174 * 0.3580000102519989f)) + (exp2(_5146 * -0.19469568133354187f) * 0.07800000160932541f))) + _5137);
      _5488 = ((_5188 * (((((_5153 * 0.335999995470047f) + (_5148 * 0.45500001311302185f)) + (_5161 * 0.1979999989271164f)) + _5169) + (_5174 * 0.004000000189989805f))) + _5138);
      _5489 = ((_5188 * (((_5153 * 0.3440000116825104f) + (_5148 * 0.6489999890327454f)) + _5169)) + _5139);
      _5490 = _5487 * _4389;
      _5491 = _5488 * _4390;
      _5492 = _5489 * _4391;
      _5494 = (_5120 * _4389) * _5481;
      _5496 = (_5121 * _4390) * _5482;
      _5498 = (_5122 * _4391) * _5483;
      if (_4326) {
        _5500 = _5494;
        _5501 = _5496;
        _5502 = _5498;
        _5503 = _5490;
        _5504 = _5491;
        _5505 = _5492;
        _5506 = _5484;
        _5507 = _5485;
        _5508 = _5486;
        _5509 = _5481;
        _5510 = _5482;
        _5511 = _5483;
        if ((_121 < 1000.0f) && (_3884 == 0.0h)) {
          if (!(abs(_224) > 0.9900000095367432f)) {
            _5519 = -0.0f - _225;
            _5521 = rsqrt(dot(float3(_5519, 0.0f, _223), float3(_5519, 0.0f, _223)));  // [sem: invLength]
            _5525 = (_5521 * _5519);
            _5526 = (_5521 * _223);
          } else {
            _5525 = 1.0f;
            _5526 = 0.0f;
          }
          _5528 = -0.0f - (_224 * _5526);
          _5531 = (_5526 * _223) - (_5525 * _225);
          _5532 = _5525 * _224;
          _5534 = rsqrt(dot(float3(_5528, _5531, _5532), float3(_5528, _5531, _5532)));  // [sem: invLength]
          _5540 = _viewPos.x + _1009;
          _5541 = _viewPos.z + _1011;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
          _5546 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5525, 0.0f, _5526), float3(_5540, _3975, _5541)), dot(float3((_5534 * _5528), (_5531 * _5534), (_5534 * _5532)), float3(_5540, _3975, _5541))), 0.0f);
          _5550 = _5546.x + -0.5f;
          _5551 = _5546.y + -0.5f;
          _5552 = _5546.z + -0.5f;
          _5554 = rsqrt(dot(float3(_5550, _5551, _5552), float3(_5550, _5551, _5552)));  // [sem: invLength]
          _5558 = (_5550 * _5554) + _4266;
          _5559 = (_5551 * _5554) + _4267;
          _5560 = (_5552 * _5554) + _4268;
          _5562 = rsqrt(dot(float3(_5558, _5559, _5560), float3(_5558, _5559, _5560)));  // [sem: invLength]
          _5563 = _5558 * _5562;
          _5564 = _5559 * _5562;
          _5565 = _5560 * _5562;
          _5577 = abs(((_102 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
          _5578 = abs(1.0f - ((_103 * 2.0f) * _bufferSizeAndInvSize.w));
          _5581 = saturate(_5577 * _5577);  // [sem: expr_sat]
          _5582 = saturate(_5578 * _5578);  // [sem: expr_sat]
          _5596 = dot(float3((-0.0f - _5563), (-0.0f - _5564), (-0.0f - _5565)), float3(_4385, _4386, _4387));
          _5598 = saturate(dot(float3(_5563, _5564, _5565), float3(_1766, _1767, _1768)));  // [sem: expr_sat]
          _5600 = saturate(1.0f - _4406);  // [sem: expr_sat]
          _5601 = _5600 * _5600;
          _5603 = (_5601 * _5601) * _5600;
          _5619 = 1.0f - ((_4405 * _4405) * 0.9998999834060669f);
          _5626 = (max((((3.18309866997879e-05f / (_5619 * _5619)) * (0.5f / ((((_5598 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5596) + (_5598 * ((_5596 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5603, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5596)) + (exp2(log2(saturate(dot(float3(_1766, _1767, _1768), float3(_5563, _5564, _5565)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
          _5631 = saturate(1.0f - (_121 * 0.0010000000474974513f)) * ((1.0f - ((_5582 * _5582) * (3.0f - (_5582 * 2.0f)))) * (1.0f - ((_5581 * _5581) * (3.0f - (_5581 * 2.0f)))));
          _5645 = _5503;
          _5646 = _5504;
          _5647 = _5505;
          _5648 = _5506;
          _5649 = _5507;
          _5650 = _5508;
          _5651 = ((((_5631 * _4389) * _5509) * _5626) + _5500);
          _5652 = ((((_5631 * _4390) * _5510) * _5626) + _5501);
          _5653 = ((((_5631 * _4391) * _5511) * _5626) + _5502);
        } else {
          _5645 = _5503;
          _5646 = _5504;
          _5647 = _5505;
          _5648 = _5506;
          _5649 = _5507;
          _5650 = _5508;
          _5651 = _5500;
          _5652 = _5501;
          _5653 = _5502;
        }
      } else {
        _5645 = _5490;
        _5646 = _5491;
        _5647 = _5492;
        _5648 = _5484;
        _5649 = _5485;
        _5650 = _5486;
        _5651 = _5494;
        _5652 = _5496;
        _5653 = _5498;
      }
    } else {
      if (_4411) {
        _5198 = dot(float3(_4182, _4183, _4184), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * _renderParams2.w;
        _5201 = _5198 + (_1701 - (_5198 * _1701));
        _5203 = saturate(_121 + -7.0f);  // [sem: expr_sat]
        _5219 = (((pow(_3897, 1.2000000476837158f)) - _3897) * _5203) + _3897;
        _5220 = (((pow(_3898, 1.2000000476837158f)) - _3898) * _5203) + _3898;
        _5221 = (((pow(_3899, 1.2000000476837158f)) - _3899) * _5203) + _3899;
        _5228 = saturate(abs(dot(float3(_4385, _4386, _4387), float3(_1649, _1650, _1651))));  // [sem: expr_sat]
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _5237 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_5228, _4192, saturate(sqrt(sqrt(_4182)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _5240 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_5228, _4192, saturate(sqrt(sqrt(_4183)))), 0.0f);
  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod]
        _5243 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_5228, _4192, saturate(sqrt(sqrt(_4184)))), 0.0f);
        _5252 = min(0.9900000095367432f, _5237.x);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5253 = min(0.9900000095367432f, _5240.x);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5254 = min(0.9900000095367432f, _5243.x);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5255 = min(0.9900000095367432f, _5237.y);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5256 = min(0.9900000095367432f, _5240.y);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5257 = min(0.9900000095367432f, _5243.y);  // [sem: _3__36__0__0__g_hairDualScatteringLUT_sampleLod_derived]
        _5258 = _5252 * _5252;
        _5259 = _5253 * _5253;
        _5260 = _5254 * _5254;
        _5261 = _5255 * _5255;
        _5262 = _5256 * _5256;
        _5263 = _5257 * _5257;
        _5264 = _5261 * _5255;
        _5265 = _5262 * _5256;
        _5266 = _5263 * _5257;
        _5267 = 1.0f - _5258;
        _5268 = 1.0f - _5259;
        _5269 = 1.0f - _5260;
        _5279 = _5267 * _5267;
        _5280 = _5268 * _5268;
        _5281 = _5269 * _5269;
        _5282 = _5279 * _5267;
        _5283 = _5280 * _5268;
        _5284 = _5281 * _5269;
        _5292 = min(max(_4192, 0.18000000715255737f), 0.6000000238418579f);
        _5293 = _5292 * _5292;
        _5294 = _5293 * 0.25f;
        _5295 = _5293 * 4.0f;
        _5297 = (_5253 + _5252) + _5254;
        _5298 = _5252 / _5297;
        _5299 = _5253 / _5297;
        _5300 = _5254 / _5297;
        _5301 = dot(float3(_5293, _5294, _5295), float3(_5298, _5299, _5300));
        _5302 = _5301 * _5301;
        _5306 = (asin(min(max(dot(float3(_1649, _1650, _1651), float3(_1766, _1767, _1768)), -1.0f), 1.0f)) + asin(min(max(dot(float3(_1649, _1650, _1651), float3(_4385, _4386, _4387)), -1.0f), 1.0f))) * 0.5f;
        _5307 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_5298, _5299, _5300));
        _5317 = _5307 * _5307;
        _5340 = (_5256 + _5255) + _5257;
        _5344 = dot(float3(_5293, _5294, _5295), float3((_5255 / _5340), (_5256 / _5340), (_5257 / _5340)));
        _5348 = sqrt((_5344 * _5344) + (_5302 * 2.0f));
        _5366 = (_5344 * 3.0f) + (_5301 * 2.0f);
        _5373 = (((_5264 + _5255) * ((_5258 * 0.699999988079071f) + 1.0f)) * _5348) / ((_5366 * _5264) + _5255);
        _5374 = (((_5265 + _5256) * ((_5259 * 0.699999988079071f) + 1.0f)) * _5348) / ((_5366 * _5265) + _5256);
        _5375 = (((_5266 + _5257) * ((_5260 * 0.699999988079071f) + 1.0f)) * _5348) / ((_5366 * _5266) + _5257);
        _5379 = _5306 - (((_5317 * (((_5258 * 4.0f) * _5261) + (_5279 * 2.0f))) * (1.0f - ((_5261 * 2.0f) / _5279))) / _5282);
        _5386 = _5306 - (((_5317 * (((_5259 * 4.0f) * _5262) + (_5280 * 2.0f))) * (1.0f - ((_5262 * 2.0f) / _5280))) / _5283);
        _5393 = _5306 - (((_5317 * (((_5260 * 4.0f) * _5263) + (_5281 * 2.0f))) * (1.0f - ((_5263 * 2.0f) / _5281))) / _5284);
        _5403 = ((1.0f - _1647) * 2.0999999046325684f) * ((_5203 * 0.75f) + 0.25f);
        _5424 = (_1647 * 0.31830987334251404f) * saturate(_4400);
        _5481 = _5219;
        _5482 = _5220;
        _5483 = _5221;
        _5484 = (((_5201 * _4389) * _5219) * ((((((_5264 * _5258) / _5282) + ((_5255 * _5258) / _5267)) * _5403) * exp2((((_5379 * _5379) * -0.5f) / ((_5373 * _5373) + _5302)) * 1.4426950216293335f)) + _5117));
        _5485 = (((_5201 * _4390) * _5220) * ((((((_5265 * _5259) / _5283) + ((_5256 * _5259) / _5268)) * _5403) * exp2((((_5386 * _5386) * -0.5f) / ((_5374 * _5374) + _5302)) * 1.4426950216293335f)) + _5118));
        _5486 = (((_5201 * _4391) * _5221) * ((((((_5266 * _5260) / _5284) + ((_5257 * _5260) / _5269)) * _5403) * exp2((((_5393 * _5393) * -0.5f) / ((_5375 * _5375) + _5302)) * 1.4426950216293335f)) + _5119));
        _5487 = (_5424 * _5219);
        _5488 = (_5424 * _5220);
        _5489 = (_5424 * _5221);
        _5490 = _5487 * _4389;
        _5491 = _5488 * _4390;
        _5492 = _5489 * _4391;
        _5494 = (_5120 * _4389) * _5481;
        _5496 = (_5121 * _4390) * _5482;
        _5498 = (_5122 * _4391) * _5483;
        if (_4326) {
          _5500 = _5494;
          _5501 = _5496;
          _5502 = _5498;
          _5503 = _5490;
          _5504 = _5491;
          _5505 = _5492;
          _5506 = _5484;
          _5507 = _5485;
          _5508 = _5486;
          _5509 = _5481;
          _5510 = _5482;
          _5511 = _5483;
          if ((_121 < 1000.0f) && (_3884 == 0.0h)) {
            if (!(abs(_224) > 0.9900000095367432f)) {
              _5519 = -0.0f - _225;
              _5521 = rsqrt(dot(float3(_5519, 0.0f, _223), float3(_5519, 0.0f, _223)));  // [sem: invLength]
              _5525 = (_5521 * _5519);
              _5526 = (_5521 * _223);
            } else {
              _5525 = 1.0f;
              _5526 = 0.0f;
            }
            _5528 = -0.0f - (_224 * _5526);
            _5531 = (_5526 * _223) - (_5525 * _225);
            _5532 = _5525 * _224;
            _5534 = rsqrt(dot(float3(_5528, _5531, _5532), float3(_5528, _5531, _5532)));  // [sem: invLength]
            _5540 = _viewPos.x + _1009;
            _5541 = _viewPos.z + _1011;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
            _5546 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5525, 0.0f, _5526), float3(_5540, _3975, _5541)), dot(float3((_5534 * _5528), (_5531 * _5534), (_5534 * _5532)), float3(_5540, _3975, _5541))), 0.0f);
            _5550 = _5546.x + -0.5f;
            _5551 = _5546.y + -0.5f;
            _5552 = _5546.z + -0.5f;
            _5554 = rsqrt(dot(float3(_5550, _5551, _5552), float3(_5550, _5551, _5552)));  // [sem: invLength]
            _5558 = (_5550 * _5554) + _4266;
            _5559 = (_5551 * _5554) + _4267;
            _5560 = (_5552 * _5554) + _4268;
            _5562 = rsqrt(dot(float3(_5558, _5559, _5560), float3(_5558, _5559, _5560)));  // [sem: invLength]
            _5563 = _5558 * _5562;
            _5564 = _5559 * _5562;
            _5565 = _5560 * _5562;
            _5577 = abs(((_102 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
            _5578 = abs(1.0f - ((_103 * 2.0f) * _bufferSizeAndInvSize.w));
            _5581 = saturate(_5577 * _5577);  // [sem: expr_sat]
            _5582 = saturate(_5578 * _5578);  // [sem: expr_sat]
            _5596 = dot(float3((-0.0f - _5563), (-0.0f - _5564), (-0.0f - _5565)), float3(_4385, _4386, _4387));
            _5598 = saturate(dot(float3(_5563, _5564, _5565), float3(_1766, _1767, _1768)));  // [sem: expr_sat]
            _5600 = saturate(1.0f - _4406);  // [sem: expr_sat]
            _5601 = _5600 * _5600;
            _5603 = (_5601 * _5601) * _5600;
            _5619 = 1.0f - ((_4405 * _4405) * 0.9998999834060669f);
            _5626 = (max((((3.18309866997879e-05f / (_5619 * _5619)) * (0.5f / ((((_5598 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5596) + (_5598 * ((_5596 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5603, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5596)) + (exp2(log2(saturate(dot(float3(_1766, _1767, _1768), float3(_5563, _5564, _5565)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
            _5631 = saturate(1.0f - (_121 * 0.0010000000474974513f)) * ((1.0f - ((_5582 * _5582) * (3.0f - (_5582 * 2.0f)))) * (1.0f - ((_5581 * _5581) * (3.0f - (_5581 * 2.0f)))));
            _5645 = _5503;
            _5646 = _5504;
            _5647 = _5505;
            _5648 = _5506;
            _5649 = _5507;
            _5650 = _5508;
            _5651 = ((((_5631 * _4389) * _5509) * _5626) + _5500);
            _5652 = ((((_5631 * _4390) * _5510) * _5626) + _5501);
            _5653 = ((((_5631 * _4391) * _5511) * _5626) + _5502);
          } else {
            _5645 = _5503;
            _5646 = _5504;
            _5647 = _5505;
            _5648 = _5506;
            _5649 = _5507;
            _5650 = _5508;
            _5651 = _5500;
            _5652 = _5501;
            _5653 = _5502;
          }
        } else {
          _5645 = _5490;
          _5646 = _5491;
          _5647 = _5492;
          _5648 = _5484;
          _5649 = _5485;
          _5650 = _5486;
          _5651 = _5494;
          _5652 = _5496;
          _5653 = _5498;
        }
      } else {
        if (_4367) {
          if (_4232 == 97) {
            _5500 = ((_5120 * _4389) * _3897);
            _5501 = ((_5121 * _4390) * _3898);
            _5502 = ((_5122 * _4391) * _3899);
            _5503 = (_5137 * _4389);
            _5504 = (_5138 * _4390);
            _5505 = (_5139 * _4391);
            _5506 = _5117;
            _5507 = _5118;
            _5508 = _5119;
            _5509 = _3897;
            _5510 = _3898;
            _5511 = _3899;
            if ((_121 < 1000.0f) && (_3884 == 0.0h)) {
              if (!(abs(_224) > 0.9900000095367432f)) {
                _5519 = -0.0f - _225;
                _5521 = rsqrt(dot(float3(_5519, 0.0f, _223), float3(_5519, 0.0f, _223)));  // [sem: invLength]
                _5525 = (_5521 * _5519);
                _5526 = (_5521 * _223);
              } else {
                _5525 = 1.0f;
                _5526 = 0.0f;
              }
              _5528 = -0.0f - (_224 * _5526);
              _5531 = (_5526 * _223) - (_5525 * _225);
              _5532 = _5525 * _224;
              _5534 = rsqrt(dot(float3(_5528, _5531, _5532), float3(_5528, _5531, _5532)));  // [sem: invLength]
              _5540 = _viewPos.x + _1009;
              _5541 = _viewPos.z + _1011;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
              _5546 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5525, 0.0f, _5526), float3(_5540, _3975, _5541)), dot(float3((_5534 * _5528), (_5531 * _5534), (_5534 * _5532)), float3(_5540, _3975, _5541))), 0.0f);
              _5550 = _5546.x + -0.5f;
              _5551 = _5546.y + -0.5f;
              _5552 = _5546.z + -0.5f;
              _5554 = rsqrt(dot(float3(_5550, _5551, _5552), float3(_5550, _5551, _5552)));  // [sem: invLength]
              _5558 = (_5550 * _5554) + _4266;
              _5559 = (_5551 * _5554) + _4267;
              _5560 = (_5552 * _5554) + _4268;
              _5562 = rsqrt(dot(float3(_5558, _5559, _5560), float3(_5558, _5559, _5560)));  // [sem: invLength]
              _5563 = _5558 * _5562;
              _5564 = _5559 * _5562;
              _5565 = _5560 * _5562;
              _5577 = abs(((_102 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
              _5578 = abs(1.0f - ((_103 * 2.0f) * _bufferSizeAndInvSize.w));
              _5581 = saturate(_5577 * _5577);  // [sem: expr_sat]
              _5582 = saturate(_5578 * _5578);  // [sem: expr_sat]
              _5596 = dot(float3((-0.0f - _5563), (-0.0f - _5564), (-0.0f - _5565)), float3(_4385, _4386, _4387));
              _5598 = saturate(dot(float3(_5563, _5564, _5565), float3(_1766, _1767, _1768)));  // [sem: expr_sat]
              _5600 = saturate(1.0f - _4406);  // [sem: expr_sat]
              _5601 = _5600 * _5600;
              _5603 = (_5601 * _5601) * _5600;
              _5619 = 1.0f - ((_4405 * _4405) * 0.9998999834060669f);
              _5626 = (max((((3.18309866997879e-05f / (_5619 * _5619)) * (0.5f / ((((_5598 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5596) + (_5598 * ((_5596 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5603, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5596)) + (exp2(log2(saturate(dot(float3(_1766, _1767, _1768), float3(_5563, _5564, _5565)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
              _5631 = saturate(1.0f - (_121 * 0.0010000000474974513f)) * ((1.0f - ((_5582 * _5582) * (3.0f - (_5582 * 2.0f)))) * (1.0f - ((_5581 * _5581) * (3.0f - (_5581 * 2.0f)))));
              _5645 = _5503;
              _5646 = _5504;
              _5647 = _5505;
              _5648 = _5506;
              _5649 = _5507;
              _5650 = _5508;
              _5651 = ((((_5631 * _4389) * _5509) * _5626) + _5500);
              _5652 = ((((_5631 * _4390) * _5510) * _5626) + _5501);
              _5653 = ((((_5631 * _4391) * _5511) * _5626) + _5502);
            } else {
              _5645 = _5503;
              _5646 = _5504;
              _5647 = _5505;
              _5648 = _5506;
              _5649 = _5507;
              _5650 = _5508;
              _5651 = _5500;
              _5652 = _5501;
              _5653 = _5502;
            }
          } else {
            if ((uint)(_4232 + -105) < (uint)2) {
              _5645 = (_5137 * _4389);
              _5646 = (_5138 * _4390);
              _5647 = (_5139 * _4391);
              _5648 = _5117;
              _5649 = _5118;
              _5650 = _5119;
              _5651 = ((_5120 * _4389) * _3897);
              _5652 = ((_5121 * _4390) * _3898);
              _5653 = ((_5122 * _4391) * _3899);
            } else {
              if (!(_4373 >= 999.9000244140625f)) {
                _5455 = ((max(0.0020000000949949026f, _4373) * 0.4000000059604645f) / ((_4231 * 100.0f) + 0.10000000149011612f));
              } else {
                _5455 = 1000.0f;
              }
              _5456 = _5455 * _5455;
              _5466 = (((_4231 * 0.25f) * (0.022082746028900146f / (_5141 * _5141))) * max(0.0f, (0.30000001192092896f - _4400))) * ((exp2(_5456 * -0.48089835047721863f) * 3.0f) + exp2(_5456 * -1.4426950216293335f));
              _5481 = _3897;
              _5482 = _3898;
              _5483 = _3899;
              _5484 = _5117;
              _5485 = _5118;
              _5486 = _5119;
              _5487 = (_5466 + _5137);
              _5488 = (_5466 + _5138);
              _5489 = (_5466 + _5139);
              _5490 = _5487 * _4389;
              _5491 = _5488 * _4390;
              _5492 = _5489 * _4391;
              _5494 = (_5120 * _4389) * _5481;
              _5496 = (_5121 * _4390) * _5482;
              _5498 = (_5122 * _4391) * _5483;
              if (_4326) {
                _5500 = _5494;
                _5501 = _5496;
                _5502 = _5498;
                _5503 = _5490;
                _5504 = _5491;
                _5505 = _5492;
                _5506 = _5484;
                _5507 = _5485;
                _5508 = _5486;
                _5509 = _5481;
                _5510 = _5482;
                _5511 = _5483;
                if ((_121 < 1000.0f) && (_3884 == 0.0h)) {
                  if (!(abs(_224) > 0.9900000095367432f)) {
                    _5519 = -0.0f - _225;
                    _5521 = rsqrt(dot(float3(_5519, 0.0f, _223), float3(_5519, 0.0f, _223)));  // [sem: invLength]
                    _5525 = (_5521 * _5519);
                    _5526 = (_5521 * _223);
                  } else {
                    _5525 = 1.0f;
                    _5526 = 0.0f;
                  }
                  _5528 = -0.0f - (_224 * _5526);
                  _5531 = (_5526 * _223) - (_5525 * _225);
                  _5532 = _5525 * _224;
                  _5534 = rsqrt(dot(float3(_5528, _5531, _5532), float3(_5528, _5531, _5532)));  // [sem: invLength]
                  _5540 = _viewPos.x + _1009;
                  _5541 = _viewPos.z + _1011;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
                  _5546 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5525, 0.0f, _5526), float3(_5540, _3975, _5541)), dot(float3((_5534 * _5528), (_5531 * _5534), (_5534 * _5532)), float3(_5540, _3975, _5541))), 0.0f);
                  _5550 = _5546.x + -0.5f;
                  _5551 = _5546.y + -0.5f;
                  _5552 = _5546.z + -0.5f;
                  _5554 = rsqrt(dot(float3(_5550, _5551, _5552), float3(_5550, _5551, _5552)));  // [sem: invLength]
                  _5558 = (_5550 * _5554) + _4266;
                  _5559 = (_5551 * _5554) + _4267;
                  _5560 = (_5552 * _5554) + _4268;
                  _5562 = rsqrt(dot(float3(_5558, _5559, _5560), float3(_5558, _5559, _5560)));  // [sem: invLength]
                  _5563 = _5558 * _5562;
                  _5564 = _5559 * _5562;
                  _5565 = _5560 * _5562;
                  _5577 = abs(((_102 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
                  _5578 = abs(1.0f - ((_103 * 2.0f) * _bufferSizeAndInvSize.w));
                  _5581 = saturate(_5577 * _5577);  // [sem: expr_sat]
                  _5582 = saturate(_5578 * _5578);  // [sem: expr_sat]
                  _5596 = dot(float3((-0.0f - _5563), (-0.0f - _5564), (-0.0f - _5565)), float3(_4385, _4386, _4387));
                  _5598 = saturate(dot(float3(_5563, _5564, _5565), float3(_1766, _1767, _1768)));  // [sem: expr_sat]
                  _5600 = saturate(1.0f - _4406);  // [sem: expr_sat]
                  _5601 = _5600 * _5600;
                  _5603 = (_5601 * _5601) * _5600;
                  _5619 = 1.0f - ((_4405 * _4405) * 0.9998999834060669f);
                  _5626 = (max((((3.18309866997879e-05f / (_5619 * _5619)) * (0.5f / ((((_5598 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5596) + (_5598 * ((_5596 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5603, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5596)) + (exp2(log2(saturate(dot(float3(_1766, _1767, _1768), float3(_5563, _5564, _5565)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
                  _5631 = saturate(1.0f - (_121 * 0.0010000000474974513f)) * ((1.0f - ((_5582 * _5582) * (3.0f - (_5582 * 2.0f)))) * (1.0f - ((_5581 * _5581) * (3.0f - (_5581 * 2.0f)))));
                  _5645 = _5503;
                  _5646 = _5504;
                  _5647 = _5505;
                  _5648 = _5506;
                  _5649 = _5507;
                  _5650 = _5508;
                  _5651 = ((((_5631 * _4389) * _5509) * _5626) + _5500);
                  _5652 = ((((_5631 * _4390) * _5510) * _5626) + _5501);
                  _5653 = ((((_5631 * _4391) * _5511) * _5626) + _5502);
                } else {
                  _5645 = _5503;
                  _5646 = _5504;
                  _5647 = _5505;
                  _5648 = _5506;
                  _5649 = _5507;
                  _5650 = _5508;
                  _5651 = _5500;
                  _5652 = _5501;
                  _5653 = _5502;
                }
              } else {
                _5645 = _5490;
                _5646 = _5491;
                _5647 = _5492;
                _5648 = _5484;
                _5649 = _5485;
                _5650 = _5486;
                _5651 = _5494;
                _5652 = _5496;
                _5653 = _5498;
              }
            }
          }
        } else {
          _5481 = _3897;
          _5482 = _3898;
          _5483 = _3899;
          _5484 = _5117;
          _5485 = _5118;
          _5486 = _5119;
          _5487 = _5137;
          _5488 = _5138;
          _5489 = _5139;
          _5490 = _5487 * _4389;
          _5491 = _5488 * _4390;
          _5492 = _5489 * _4391;
          _5494 = (_5120 * _4389) * _5481;
          _5496 = (_5121 * _4390) * _5482;
          _5498 = (_5122 * _4391) * _5483;
          if (_4326) {
            _5500 = _5494;
            _5501 = _5496;
            _5502 = _5498;
            _5503 = _5490;
            _5504 = _5491;
            _5505 = _5492;
            _5506 = _5484;
            _5507 = _5485;
            _5508 = _5486;
            _5509 = _5481;
            _5510 = _5482;
            _5511 = _5483;
            if ((_121 < 1000.0f) && (_3884 == 0.0h)) {
              if (!(abs(_224) > 0.9900000095367432f)) {
                _5519 = -0.0f - _225;
                _5521 = rsqrt(dot(float3(_5519, 0.0f, _223), float3(_5519, 0.0f, _223)));  // [sem: invLength]
                _5525 = (_5521 * _5519);
                _5526 = (_5521 * _223);
              } else {
                _5525 = 1.0f;
                _5526 = 0.0f;
              }
              _5528 = -0.0f - (_224 * _5526);
              _5531 = (_5526 * _223) - (_5525 * _225);
              _5532 = _5525 * _224;
              _5534 = rsqrt(dot(float3(_5528, _5531, _5532), float3(_5528, _5531, _5532)));  // [sem: invLength]
              _5540 = _viewPos.x + _1009;
              _5541 = _viewPos.z + _1011;
  // [sem: _3__36__0__0__g_blueNoise_sampleLod]
              _5546 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_5525, 0.0f, _5526), float3(_5540, _3975, _5541)), dot(float3((_5534 * _5528), (_5531 * _5534), (_5534 * _5532)), float3(_5540, _3975, _5541))), 0.0f);
              _5550 = _5546.x + -0.5f;
              _5551 = _5546.y + -0.5f;
              _5552 = _5546.z + -0.5f;
              _5554 = rsqrt(dot(float3(_5550, _5551, _5552), float3(_5550, _5551, _5552)));  // [sem: invLength]
              _5558 = (_5550 * _5554) + _4266;
              _5559 = (_5551 * _5554) + _4267;
              _5560 = (_5552 * _5554) + _4268;
              _5562 = rsqrt(dot(float3(_5558, _5559, _5560), float3(_5558, _5559, _5560)));  // [sem: invLength]
              _5563 = _5558 * _5562;
              _5564 = _5559 * _5562;
              _5565 = _5560 * _5562;
              _5577 = abs(((_102 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
              _5578 = abs(1.0f - ((_103 * 2.0f) * _bufferSizeAndInvSize.w));
              _5581 = saturate(_5577 * _5577);  // [sem: expr_sat]
              _5582 = saturate(_5578 * _5578);  // [sem: expr_sat]
              _5596 = dot(float3((-0.0f - _5563), (-0.0f - _5564), (-0.0f - _5565)), float3(_4385, _4386, _4387));
              _5598 = saturate(dot(float3(_5563, _5564, _5565), float3(_1766, _1767, _1768)));  // [sem: expr_sat]
              _5600 = saturate(1.0f - _4406);  // [sem: expr_sat]
              _5601 = _5600 * _5600;
              _5603 = (_5601 * _5601) * _5600;
              _5619 = 1.0f - ((_4405 * _4405) * 0.9998999834060669f);
              _5626 = (max((((3.18309866997879e-05f / (_5619 * _5619)) * (0.5f / ((((_5598 * 0.9998999834060669f) + 9.999999747378752e-05f) * _5596) + (_5598 * ((_5596 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_5603, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_5596)) + (exp2(log2(saturate(dot(float3(_1766, _1767, _1768), float3(_5563, _5564, _5565)))) * 1024.0f) * 50.0f);
  // [sem: expr_sat]
              _5631 = saturate(1.0f - (_121 * 0.0010000000474974513f)) * ((1.0f - ((_5582 * _5582) * (3.0f - (_5582 * 2.0f)))) * (1.0f - ((_5581 * _5581) * (3.0f - (_5581 * 2.0f)))));
              _5645 = _5503;
              _5646 = _5504;
              _5647 = _5505;
              _5648 = _5506;
              _5649 = _5507;
              _5650 = _5508;
              _5651 = ((((_5631 * _4389) * _5509) * _5626) + _5500);
              _5652 = ((((_5631 * _4390) * _5510) * _5626) + _5501);
              _5653 = ((((_5631 * _4391) * _5511) * _5626) + _5502);
            } else {
              _5645 = _5503;
              _5646 = _5504;
              _5647 = _5505;
              _5648 = _5506;
              _5649 = _5507;
              _5650 = _5508;
              _5651 = _5500;
              _5652 = _5501;
              _5653 = _5502;
            }
          } else {
            _5645 = _5490;
            _5646 = _5491;
            _5647 = _5492;
            _5648 = _5484;
            _5649 = _5485;
            _5650 = _5486;
            _5651 = _5494;
            _5652 = _5496;
            _5653 = _5498;
          }
        }
      }
    }
    // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x973D36C7 adds the branch-local AO+ foliage transmission contribution into resolved direct diffuse lighting before vanilla AWB sampling and final scene color composition.
    _5660 = _5645 + _3885 + _rndx_foliageTransR;
    _5661 = _5646 + _3886 + _rndx_foliageTransG;
    _5662 = _5647 + _3887 + _rndx_foliageTransB;
    // RenoDX: <<< [Patch: FoliageTransmission]
    _5665 = _frameNumber.x * 13;
    [branch]
    if (((((int)(_5665 + _99)) | ((int)(_5665 + _101))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((int)(_99) >> 5), ((int)(_101) >> 5))] = float4((half)(half(_5660)), (half)(half(_5661)), (half)(half(_5662)), 1.0f);
    }
    _5680 = ((uint)(_4232 & 24) > (uint)23);
    if (_4300) {
      _5697 = saturate(exp2((_4295 * _4295) * (_121 * -0.005770780146121979f)));  // [sem: expr_sat]
    } else {
      _5697 = select((_cavityParams.z > 0.0f), select(_180, 0.0f, _1755), 1.0f);  // [sem: expr_sat]
    }
    _5712 = select(_4297, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _5697) * select((_179 && _5680), (1.0f - _1755), 1.0f)));
    _5716 = min(60000.0f, (_5712 * (((_3596 * _3352) * _3601) - min(0.0f, (-0.0f - _5651)))));
    _5717 = min(60000.0f, (_5712 * (((_3597 * _3353) * _3601) - min(0.0f, (-0.0f - _5652)))));
    _5718 = min(60000.0f, (_5712 * (((_3598 * _3354) * _3601) - min(0.0f, (-0.0f - _5653)))));
    _5721 = 1.0f - _renderParams.x;
    _5728 = half((_renderParams.x * _4182) + _5721);
    _5729 = half((_renderParams.x * _4183) + _5721);
    _5730 = half((_renderParams.x * _4184) + _5721);
    if (_4297 && (_renderParams2.x == 0.0f)) {
      _5746 = (half)(exp2((half)((half)(log2(_5728)) * 0.5h)));
      _5747 = (half)(exp2((half)((half)(log2(_5729)) * 0.5h)));
      _5748 = (half)(exp2((half)((half)(log2(_5730)) * 0.5h)));
    } else {
      _5746 = _5728;
      _5747 = _5729;
      _5748 = _5730;
    }
    _5750 = _4331 || (_4232 == 55);
    _5751 = select(_5750, 0.0f, _3884);
    _5752 = float(_5746);
    _5753 = float(_5747);
    _5754 = float(_5748);
    if (_4269) {
      _5761 = saturate(((_5753 + _5752) + _5754) * 1.2000000476837158f);  // [sem: expr_sat]
    } else {
      _5761 = 1.0f;  // [sem: expr_sat]
    }
    _5762 = float(_5751);
    _5768 = (0.699999988079071f / min(max(max(max(_5752, _5753), _5754), 0.009999999776482582f), 0.699999988079071f)) * _5761;
    _5775 = ((_5768 * _5752) + -0.03999999910593033f) * _5762;
    _5776 = ((_5768 * _5753) + -0.03999999910593033f) * _5762;
    _5777 = ((_5768 * _5754) + -0.03999999910593033f) * _5762;
    _5778 = _5775 + 0.03999999910593033f;
    _5779 = _5776 + 0.03999999910593033f;
    _5780 = _5777 + 0.03999999910593033f;
    if (_4326 || (_4410 || (_4409 || _5750))) {
  // [sem: _3__36__0__0__g_iblBrdfLookup_sampleLod]
      _5789 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__3__40__0__0__g_samplerClamp, float2(min(0.9900000095367432f, _1774), (1.0f - max(0.019999999552965164f, float(_162)))), 0.0f);
      _5793 = _5789.x;
      _5794 = _5789.y;
    } else {
      _5793 = _3594;
      _5794 = _3595;
    }
    _5798 = (_5793 * _5778) + _5794;
    _5799 = (_5793 * _5779) + _5794;
    _5800 = (_5793 * _5780) + _5794;
    _5802 = (1.0f - _5793) - _5794;
    _5809 = ((0.9599999785423279f - _5775) * 0.0476190485060215f) + _5778;
    _5810 = ((0.9599999785423279f - _5776) * 0.0476190485060215f) + _5779;
    _5811 = ((0.9599999785423279f - _5777) * 0.0476190485060215f) + _5780;
    _5828 = saturate(1.0f - _3879);  // [sem: expr_sat]
    _5829 = (((_5798 * _5809) / (1.0f - (_5802 * _5809))) * _5802) * _5828;
    _5830 = (((_5799 * _5810) / (1.0f - (_5802 * _5810))) * _5802) * _5828;
    _5831 = (((_5800 * _5811) / (1.0f - (_5802 * _5811))) * _5802) * _5828;
    _5842 = float(1.0h - _5751);
    _5852 = half(((_5752 * _5842) * saturate((1.0f - _5798) - _5829)) + _5829);
    _5853 = half(((_5753 * _5842) * saturate((1.0f - _5799) - _5830)) + _5830);
    _5854 = half(((_5754 * _5842) * saturate((1.0f - _5800) - _5831)) + _5831);
    _5856 = float(_5852);
    _5857 = float(_5853);
    _5858 = float(_5854);
    if (_4232 == 65) {
      _5862 = max(9.999999974752427e-07f, _exposure2.x);
      _5870 = ((pow(_4403, 16.0f)) * 50.26548385620117f) / (((_5862 * _5862) * 1e+06f) + 1.0f);
      _5887 = (((((_5856 * _5660) * _5870) - _5660) * _1723) + _5660);
      _5888 = (((((_5857 * _5661) * _5870) - _5661) * _1723) + _5661);
      _5889 = (((((_5858 * _5662) * _5870) - _5662) * _1723) + _5662);
    } else {
      _5887 = _5660;
      _5888 = _5661;
      _5889 = _5662;
    }
    _5893 = (min(65535.0f, _5648) + _3888) + (_5887 * _5856);
    _5894 = (min(65535.0f, _5649) + _3889) + (_5888 * _5857);
    _5895 = (min(65535.0f, _5650) + _3890) + (_5889 * _5858);
    _5924 = exp2((saturate(_1035) * 20.0f) + -8.0f) + -0.00390625f;
    _5925 = _5924 * select((_1032 < 0.040449999272823334f), (_1032 * 0.07739938050508499f), exp2(log2((_1032 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5926 = _5924 * select((_1033 < 0.040449999272823334f), (_1033 * 0.07739938050508499f), exp2(log2((_1033 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5927 = _5924 * select((_1034 < 0.040449999272823334f), (_1034 * 0.07739938050508499f), exp2(log2((_1034 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5940 = ((_5925 * 0.6131200194358826f) + (_5926 * 0.3395099937915802f)) + (_5927 * 0.047370001673698425f);
    _5941 = ((_5925 * 0.07020000368356705f) + (_5926 * 0.9163600206375122f)) + (_5927 * 0.013450000435113907f);
    _5942 = ((_5925 * 0.02061999961733818f) + (_5926 * 0.10958000272512436f)) + (_5927 * 0.8697999715805054f);
    if (_968) {
      _5948 = (_5940 + _5893);
      _5949 = (_5941 + _5894);
      _5950 = (_5942 + _5895);
    } else {
      _5948 = _5893;
      _5949 = _5894;
      _5950 = _5895;
    }
    _5954 = _5948 + (_5716 * _5762);
    _5955 = _5949 + (_5717 * _5762);
    _5956 = _5950 + (_5718 * _5762);
    // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
    // Description: Crimson Desert 1.11 avoids averaging half-resolution history across a 2x2 quad that contains any invalid lane. This preserves the current lane value for mixed valid/invalid quads instead of blending in invalid neighbors.
    if (!(((_rndx_quadInvalid0 || _rndx_quadInvalid1) || _rndx_quadInvalid2) || _rndx_quadInvalid3)) {
      _5978 = ((((QuadReadLaneAt(_5954, 1) + QuadReadLaneAt(_5954, 0)) + QuadReadLaneAt(_5954, 2)) + QuadReadLaneAt(_5954, 3)) * 0.25f);
      _5979 = ((((QuadReadLaneAt(_5955, 1) + QuadReadLaneAt(_5955, 0)) + QuadReadLaneAt(_5955, 2)) + QuadReadLaneAt(_5955, 3)) * 0.25f);
      _5980 = ((((QuadReadLaneAt(_5956, 1) + QuadReadLaneAt(_5956, 0)) + QuadReadLaneAt(_5956, 2)) + QuadReadLaneAt(_5956, 3)) * 0.25f);
    } else {
      _5978 = _5954;
      _5979 = _5955;
      _5980 = _5956;
    }
    // RenoDX: <<< [Patch: Native111InvalidLaneParity]
    [branch]
    if (((_101 | _99) & 1) == 0) {
      _5985 = dot(float3(_5978, _5979, _5980), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((int)(_99) >> 1), ((int)(_101) >> 1))] = float4(min(60000.0f, _5978), min(60000.0f, _5979), min(60000.0f, _5980), min(60000.0f, select((_2352 != 0), (-0.0f - _5985), _5985)));
    }
    if (_5680) {
      _6007 = ((_5751 == 0.0h) && (!(((!(_5852 == 0.0h)) && (!(_5853 == 0.0h))) && (!(_5854 == 0.0h)))));
    } else {
      _6007 = false;
    }
    if ((_5680 || ((_4232 == 96) || (_4410 || ((_4232 & -4) == 64)))) || ((_121 <= 10.0f) && _4326)) {
      __3__38__0__1__g_sceneSpecularUAV[int2(_99, _101)] = float4(((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _5716)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _5717)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _5718)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _3362)))))));
      _6040 = _5948;
      _6041 = _5949;
      _6042 = _5950;
    } else {
      _6040 = (_5948 + _5716);
      _6041 = (_5949 + _5717);
      _6042 = (_5950 + _5718);
    }
    if (!(((uint)(_4232 + -53) < (uint)15) || (!_968))) {
      _6048 = dot(float3(_5940, _5941, _5942), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _6052 = max((max(_6048, 1.0f) / max(_6048, 0.10000000149011612f)), 0.0f);
      _6063 = ((_6040 - _5940) + (_6052 * _5940));
      _6064 = ((_6041 - _5941) + (_6052 * _5941));
      _6065 = ((_6042 - _5942) + (_6052 * _5942));
    } else {
      _6063 = _6040;
      _6064 = _6041;
      _6065 = _6042;
    }
    _6066 = min(60000.0f, _6063);
    _6067 = min(60000.0f, _6064);
    _6068 = min(60000.0f, _6065);
    // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
    // Description: Because the 1.11 RenderDiffuseTiled body can run for invalid lanes in partially valid quads, this guard preserves vanilla 1.11 behavior by preventing invalid pixels from reading, accumulating, or storing full-resolution scene color.
    if (!_rndx_invalidPixel) {
    [branch]
    if (_6007) {
      _6072 = __3__38__0__1__g_sceneColorUAV[int2(_99, _101)].x;
      _6073 = __3__38__0__1__g_sceneColorUAV[int2(_99, _101)].y;
      _6074 = __3__38__0__1__g_sceneColorUAV[int2(_99, _101)].z;
      _6079 = (_6072 + _6066);
      _6080 = (_6073 + _6067);
      _6081 = (_6074 + _6068);
    } else {
      _6079 = _6066;
      _6080 = _6067;
      _6081 = _6068;
    }
    if (!(_renderParams.y == 0.0f)) {
      _6090 = dot(float3(_6079, _6080, _6081), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _6091 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _6090);
      _6095 = max(9.999999717180685e-10f, _6090);
      _6100 = ((_6091 * _6079) / _6095);
      _6101 = ((_6091 * _6080) / _6095);
      _6102 = ((_6091 * _6081) / _6095);
    } else {
      _6100 = _6079;
      _6101 = _6080;
      _6102 = _6081;
    }
    // RenoDX: >>> [Patch: FoliageFinalAO] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x973D36C7 applies RenoDX foliage AO darkening to the final direct-lit scene color for foliage stencil materials, using vanilla blended scene AO and shadow visibility so direct light remains naturally occluded.
    if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_117 - 12) < 7u)) {
      half4 _rndx_shadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_99, _101, 0));
      float _rndx_directRatio = saturate(dot(float3(_rndx_shadow.xyz), float3(0.333f, 0.333f, 0.333f)));
      float _rndx_ao = lerp(1.0f, saturate(_1701), _rndx_directRatio * FOLIAGE_AO_STRENGTH);
      _6100 *= _rndx_ao;
      _6101 *= _rndx_ao;
      _6102 *= _rndx_ao;
    }
    // RenoDX: <<< [Patch: FoliageFinalAO]
    __3__38__0__1__g_sceneColorUAV[int2(_99, _101)] = float4(_6100, _6101, _6102, 1.0f);
    }
    // RenoDX: <<< [Patch: Native111InvalidLaneParity]
  }
}
