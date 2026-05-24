#include "../shared.h"

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

Texture2D<half4> __3__36__0__0__g_sceneDiffuse : register(t177, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResult : register(t178, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResultPrev : register(t179, space36);

Texture2D<half4> __3__36__0__0__g_specularResultPrev : register(t180, space36);

Texture2D<half2> __3__36__0__0__g_sceneAO : register(t51, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t15, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t16, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t17, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t18, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t63, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t42, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t52, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t66, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t45, space36);

Texture2D<float4> __3__36__0__0__g_manyLightsMoments : register(t53, space36);

Texture2D<float> __3__36__0__0__g_specularRayHitDistance : register(t67, space36);

Texture2D<float> __3__36__0__0__g_caustic : register(t54, space36);

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
  column_major float4x4 _viewProj;
  column_major float4x4 _viewProjNoJitter;
  column_major float4x4 _viewProjRelative;
  column_major float4x4 _viewProjRelativeNoJitter;
  column_major float4x4 _invViewProj;
  column_major float4x4 _invViewProjRelative;
  column_major float4x4 _invViewProjRelativeNoJitter;
  column_major float4x4 _viewProjRelativeOrtho;
  float4 _sunDirection;
  float4 _moonDirection;
  float4 _moonRight;
  float4 _moonUp;
  float4 _ssaoRandomDirection[16];
  column_major float4x4 _view;
  column_major float4x4 _viewRelative;
  column_major float4x4 _viewRelativePrev;
  column_major float4x4 _proj;
  column_major float4x4 _projNoJitter;
  float4 _viewPosPrev;
  column_major float4x4 _viewProjNoJitterPrev;
  column_major float4x4 _viewProjRelativePrev;
  column_major float4x4 _viewProjRelativeNoJitterPrev;
  column_major float4x4 _invViewProjPrev;
  column_major float4x4 _invViewProjRelativePrev;
  column_major float4x4 _projToPrevProj;
  column_major float4x4 _projToPrevProjNoTranslation;
  column_major float4x4 _viewProjectionTexScale;
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
  half4 _debugBaseColor16;
  half4 _debugNormal16;
  half4 _debugMaterial16;
  half4 _debugMultiplier16;
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
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__35__0__0__EnvironmentLightingHistoryConstantBuffer : register(b46, space35) {
  float4 _environmentLightingHistory[4] : packoffset(c000.x);
};

cbuffer __3__35__0__0__MaterialParameterPresetTableConstantBuffer : register(b40, space35) {
  float4 _clothLightingCategory : packoffset(c000.x);
  float4 _clothLightingParameter[8] : packoffset(c001.x);
  float4 _colorPresetInfo : packoffset(c009.x);
  uint4 _colorPresetParameter[16] : packoffset(c010.x);
  float4 _debugOption : packoffset(c026.x);
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

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _56[4];
  int _70 = (int)(SV_GroupID.x) & 15;
  int _71 = (uint)((uint)(_70)) >> 2;
  _56[0] = ((g_tileIndex[(SV_GroupID.x) >> 7]).x);
  _56[1] = ((g_tileIndex[(SV_GroupID.x) >> 7]).y);
  _56[2] = ((g_tileIndex[(SV_GroupID.x) >> 7]).z);
  _56[3] = ((g_tileIndex[(SV_GroupID.x) >> 7]).w);
  int _89 = _56[(((uint)(SV_GroupID.x) >> 5) & 3)];
  int _93 = select((((int)(SV_GroupID.x) & 16) == 0), _89, ((uint)((uint)(_89)) >> 16));
  float _102 = float((uint)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160))));
  float _103 = float((uint)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160))));
  float _104 = _102 + 0.5f;
  float _105 = _103 + 0.5f;
  float _109 = _bufferSizeAndInvSize.z * _104;
  float _110 = _105 * _bufferSizeAndInvSize.w;
  float _112 = __3__36__0__0__g_depth.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
  uint2 _115 = __3__36__0__0__g_stencil.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
  int _117 = _115.x & 127;
  float _120 = max(1.0000000116860974e-07f, _112.x);
  float _121 = _nearFarProj.x / _120;
  half _294;
  half _295;
  half _296;
  half _297;
  float _322;
  float _323;
  float _324;
  bool _340;
  float _421;
  float _422;
  float _423;
  float _424;
  float _446;
  float _447;
  float _448;
  float _449;
  float _450;
  int _456;
  half _457;
  float _458;
  float _459;
  float _460;
  float _461;
  float _462;
  float _491;
  half _492;
  float _494;
  float _520;
  float _521;
  float _528;
  float _529;
  float _530;
  float _531;
  half _532;
  float _538;
  float _539;
  float _540;
  float _541;
  half _542;
  half _567;
  float _584;
  float _948;
  half _949;
  float _950;
  float _951;
  float _952;
  int _953;
  float _954;
  float _955;
  float _956;
  bool _978;
  bool _981;
  bool _982;
  float _1000;
  float _1011;
  float _1012;
  float _1022;
  float _1023;
  half _1024;
  half _1025;
  half _1026;
  half _1027;
  half _1028;
  float _1040;
  bool _1063;
  float _1072;
  float _1113;
  float _1114;
  float _1200;
  float _1278;
  bool _1383;
  float _1455;
  float _1456;
  float _1457;
  float _1458;
  float _1621;
  int _1622;
  float _1679;
  float _1799;
  float _1800;
  float _1801;
  float _1802;
  float _1804;
  float _1805;
  float _1806;
  float _1807;
  float _1811;
  float _1812;
  float _1813;
  float _1814;
  float _1815;
  float _1840;
  half _1865;
  bool _1877;
  half _1907;
  int _1908;
  float _1909;
  float _1910;
  float _1911;
  float _2181;
  float _2200;
  float _2204;
  float _2236;
  float _2281;
  float _2282;
  float _2283;
  float _2284;
  float _2290;
  float _2291;
  float _2292;
  float _2293;
  float _2296;
  float _2297;
  float _2298;
  float _2299;
  half _2300;
  float _2453;
  int _2454;
  int _2455;
  float _2456;
  float _2457;
  float _2458;
  float _2459;
  float _2592;
  float _2593;
  float _2594;
  float _2655;
  float _2665;
  float _2666;
  float _2667;
  float _2712;
  float _2713;
  float _2845;
  float _2846;
  float _2847;
  float _2862;
  float _2863;
  float _2864;
  float _2865;
  float _2866;
  bool _2932;
  bool _2933;
  float _2969;
  float _2970;
  float _2971;
  float _2972;
  float _3038;
  float _3041;
  float _3042;
  float _3043;
  float _3044;
  float _3079;
  float _3080;
  float _3081;
  float _3096;
  float _3125;
  float _3126;
  float _3127;
  float _3128;
  float _3129;
  half _3136;
  half _3137;
  half _3138;
  half _3139;
  half _3140;
  float _3141;
  float _3147;
  half _3148;
  half _3149;
  half _3150;
  half _3151;
  half _3152;
  float _3153;
  float _3154;
  float _3155;
  float _3156;
  float _3157;
  float _3158;
  half _3195;
  half _3196;
  half _3197;
  float _3212;
  float _3213;
  float _3214;
  float _3234;
  float _3294;
  float _3392;
  float _3393;
  float _3394;
  bool _3462;
  bool _3484;
  bool _3486;
  bool _3487;
  float _3504;
  int _3505;
  float _3506;
  float _3507;
  float _3508;
  float _3509;
  float _3510;
  float _3549;
  float _3586;
  float _3593;
  float _3594;
  float _3595;
  bool _3616;
  bool _3618;
  bool _3622;
  int _3623;
  float _3624;
  bool _3633;
  int _3634;
  float _3635;
  float _3638;
  int _3639;
  bool _3640;
  bool _3641;
  float _3658;
  float _3659;
  float _3660;
  float _3700;
  float _3971;
  float _3972;
  float _3973;
  float _3974;
  float _3975;
  float _3976;
  float _3977;
  float _3978;
  float _3979;
  float _4149;
  float _4150;
  float _4151;
  float _4152;
  float _4153;
  float _4154;
  float _4155;
  float _4156;
  float _4157;
  float _4247;
  float _4248;
  float _4249;
  float _4316;
  float _4317;
  float _4318;
  float _4319;
  float _4320;
  float _4321;
  float _4366;
  float _4367;
  float _4368;
  float _4369;
  float _4370;
  float _4371;
  float _4372;
  float _4373;
  float _4374;
  float _4389;
  float _4390;
  float _4391;
  float _4392;
  float _4393;
  float _4394;
  float _4395;
  float _4396;
  float _4397;
  float _4409;
  float _4410;
  float _4411;
  float _4713;
  float _4729;
  float _4730;
  float _4731;
  float _4732;
  float _4733;
  float _4734;
  float _4735;
  float _4736;
  float _4737;
  float _4748;
  float _4749;
  float _4750;
  float _4762;
  float _4763;
  float _4764;
  float _4765;
  float _4766;
  float _4767;
  float _4768;
  float _4769;
  float _4770;
  float _4771;
  float _4772;
  float _4773;
  float _4776;
  float _4777;
  float _4778;
  float _4779;
  float _4780;
  float _4781;
  float _4782;
  float _4783;
  float _4784;
  float _4785;
  float _4786;
  float _4787;
  float _4801;
  float _4802;
  float _4921;
  float _4922;
  float _4923;
  float _4924;
  float _4925;
  float _4926;
  float _4927;
  float _4928;
  float _4929;
  float _4973;
  half _5022;
  half _5023;
  half _5024;
  float _5037;
  float _5069;
  float _5070;
  float _5163;
  float _5164;
  float _5165;
  float _5235;
  float _5236;
  float _5237;
  bool _5294;
  float _5327;
  float _5328;
  float _5329;
  float _5350;
  float _5351;
  float _5352;
  float _5366;
  float _5367;
  float _5368;
  float _5387;
  float _5388;
  float _5389;
  if (!(((((_112.x < 1.0000000116860974e-07f)) || ((_112.x == 1.0f)))) || ((_117 == 10)))) {
    uint4 _129 = __3__36__0__0__g_baseColor.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
    float4 _135 = __3__36__0__0__g_normal.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
    half _144 = half(float((uint)((uint)(((uint)((uint)(_129.x)) >> 8) & 255))) * 0.003921568859368563f);
    half _148 = half(float((uint)((uint)(_129.x & 255))) * 0.003921568859368563f);
    half _153 = half(float((uint)((uint)(((uint)((uint)(_129.y)) >> 8) & 255))) * 0.003921568859368563f);
    half _157 = half(float((uint)((uint)(_129.y & 255))) * 0.003921568859368563f);
    half _162 = half(float((uint)((uint)(((uint)((uint)(_129.z)) >> 8) & 255))) * 0.003921568859368563f);
    half _166 = half(float((uint)((uint)(_129.z & 255))) * 0.003921568859368563f);
    uint _178 = uint((_135.w * 3.0f) + 0.5f);
    bool _179 = ((int)(_178) == 1);
    bool _180 = ((int)(_178) == 3);
    float _190 = (saturate(_135.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _191 = (saturate(_135.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _192 = (saturate(_135.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _194 = rsqrt(dot(float3(_190, _191, _192), float3(_190, _191, _192)));
    half _198 = half(_194 * _190);
    half _199 = half(_194 * _191);
    half _200 = half(_192 * _194);
    half _203 = (half(float((uint)((uint)(((uint)((uint)(_129.w)) >> 8) & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
    half _204 = (half(float((uint)((uint)(_129.w & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
    float _209 = float(_203 + _204) * 0.5f;
    float _210 = float(_203 - _204) * 0.5f;
    float _214 = (1.0f - abs(_209)) - abs(_210);
    float _216 = rsqrt(dot(float3(_209, _210, _214), float3(_209, _210, _214)));
    float _223 = float(_198);
    float _224 = float(_199);
    float _225 = float(_200);
    float _227 = select((_200 >= 0.0h), 1.0f, -1.0f);
    float _230 = -0.0f - (1.0f / (_227 + _225));
    float _231 = _224 * _230;
    float _232 = _231 * _223;
    float _233 = _227 * _223;
    float _239 = -0.0f - _224;
    float _240 = float(half(_216 * _209));
    float _241 = float(half(_216 * _210));
    float _242 = float(half(_216 * _214));
    half _254 = half(mad(_242, _223, mad(_241, _232, (_240 * (((_233 * _223) * _230) + 1.0f)))));
    half _255 = half(mad(_242, _224, mad(_241, ((_231 * _224) + _227), ((_240 * _227) * _232))));
    half _256 = half(mad(_242, _225, mad(_241, _239, (-0.0f - (_233 * _240)))));
    half _258 = rsqrt(dot(half3(_254, _255, _256), half3(_254, _255, _256)));
    half _262 = saturate(_144 * _144);
    half _263 = saturate(_148 * _148);
    half _264 = saturate(_153 * _153);
    half _280 = saturate(((_263 * 0.3395996h) + (_262 * 0.61328125h)) + (_264 * 0.04736328h));
    half _281 = saturate(((_263 * 0.9165039h) + (_262 * 0.07019043h)) + (_264 * 0.013450623h));
    half _282 = saturate(((_263 * 0.109558105h) + (_262 * 0.020614624h)) + (_264 * 0.8696289h));
    if (!((uint)(_117 + -65) < (uint)2)) {
      _294 = (_258 * _254);
      _295 = (_258 * _255);
      _296 = (_258 * _256);
      _297 = select((((_117 == 24)) || ((_117 == 29))), 0.0h, _157);
    } else {
      _294 = _198;
      _295 = _199;
      _296 = _200;
      _297 = _157;
    }
    half4 _299 = __3__36__0__0__g_diffuseResult.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
    float _303 = float(_299.x);
    float _304 = float(_299.y);
    float _305 = float(_299.z);
    bool _308 = (_renderParams2.y > 0.0f);
    [branch]
    if (_308) {
      half4 _311 = __3__36__0__0__g_sceneDiffuse.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
      _322 = (float(_311.x) + _303);
      _323 = (float(_311.y) + _304);
      _324 = (float(_311.z) + _305);
    } else {
      _322 = _303;
      _323 = _304;
      _324 = _305;
    }
    float4 _326 = __3__36__0__0__g_specularResult.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
    if ((uint)_117 > (uint)11) {
      if (!((((uint)_117 < (uint)21)) || ((_117 == 107)))) {
        _340 = (_117 == 7);
      } else {
        _340 = true;
      }
    } else {
      if (!(_117 == 6)) {
        _340 = (_117 == 7);
      } else {
        _340 = true;
      }
    }
    bool _350 = ((_117 == 38)) || (((((uint)(_117 + -27) < (uint)2)) || ((((_117 == 26)) || (((((uint)(_117 + -105) < (uint)2)) || (_180)))))));
    float _351 = float(_294);
    float _352 = float(_295);
    float _353 = float(_296);
    float _355 = (_109 * 2.0f) + -1.0f;
    float _357 = 1.0f - (_110 * 2.0f);
    float _393 = mad((_invViewProjRelative[3].z), _120, mad((_invViewProjRelative[3].y), _357, ((_invViewProjRelative[3].x) * _355))) + (_invViewProjRelative[3].w);
    float _394 = (mad((_invViewProjRelative[0].z), _120, mad((_invViewProjRelative[0].y), _357, ((_invViewProjRelative[0].x) * _355))) + (_invViewProjRelative[0].w)) / _393;
    float _395 = (mad((_invViewProjRelative[1].z), _120, mad((_invViewProjRelative[1].y), _357, ((_invViewProjRelative[1].x) * _355))) + (_invViewProjRelative[1].w)) / _393;
    float _396 = (mad((_invViewProjRelative[2].z), _120, mad((_invViewProjRelative[2].y), _357, ((_invViewProjRelative[2].x) * _355))) + (_invViewProjRelative[2].w)) / _393;
    float _398 = rsqrt(dot(float3(_394, _395, _396), float3(_394, _395, _396)));
    float _399 = _398 * _394;
    float _400 = _398 * _395;
    float _401 = _398 * _396;
    int _402 = _115.x & 126;
    bool _405 = ((_402 == 66)) || ((_117 == 54));
    bool _406 = (_117 == 33);
    bool _408 = (_117 == 55);
    if (((_402 == 64)) || (((((_406) || (_405))) || (((_408) || (_350)))))) {
      float4 _415 = __3__36__0__0__g_character.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
      _421 = _415.x;
      _422 = _415.y;
      _423 = _415.z;
      _424 = _415.w;
    } else {
      _421 = 0.0f;
      _422 = 0.0f;
      _423 = 0.0f;
      _424 = 0.0f;
    }
    if (_406) {
      uint _431 = uint((_423 * 255.0f) + 0.5f);
      int _433 = ((uint)(_431) >> 4) & 7;
      if (!(_433 == 0)) {
        _446 = 1.0f;
        _447 = min((1.0f - ((_clothLightingParameter[_433]).y)), ((_clothLightingParameter[_433]).x));
        _448 = (float((uint)((uint)((int)(_431) & 15))) * 0.06666667014360428f);
        _449 = ((_clothLightingParameter[_433]).y);
        _450 = ((_clothLightingParameter[_433]).x);
      } else {
        _446 = 0.0f;
        _447 = 0.0f;
        _448 = 0.0f;
        _449 = 0.0f;
        _450 = 0.0f;
      }
      _456 = _117;
      _457 = half(_effectiveMetallicForVelvet * _450);
      _458 = _446;
      _459 = _447;
      _460 = _448;
      _461 = _449;
      _462 = _450;
    } else {
      if (_408) {
        if (!(_423 < 0.0010000000474974513f)) {
          uint _431 = uint((_423 * 255.0f) + 0.5f);
          int _433 = ((uint)(_431) >> 4) & 7;
          if (!(_433 == 0)) {
            _446 = 1.0f;
            _447 = min((1.0f - ((_clothLightingParameter[_433]).y)), ((_clothLightingParameter[_433]).x));
            _448 = (float((uint)((uint)((int)(_431) & 15))) * 0.06666667014360428f);
            _449 = ((_clothLightingParameter[_433]).y);
            _450 = ((_clothLightingParameter[_433]).x);
          } else {
            _446 = 0.0f;
            _447 = 0.0f;
            _448 = 0.0f;
            _449 = 0.0f;
            _450 = 0.0f;
          }
          _456 = _117;
          _457 = half(_effectiveMetallicForVelvet * _450);
          _458 = _446;
          _459 = _447;
          _460 = _448;
          _461 = _449;
          _462 = _450;
        } else {
          _456 = 53;
          _457 = _297;
          _458 = 0.0f;
          _459 = 0.0f;
          _460 = 0.0f;
          _461 = 0.0f;
          _462 = 0.0f;
        }
      } else {
        _456 = _117;
        _457 = _297;
        _458 = 0.0f;
        _459 = 0.0f;
        _460 = 0.0f;
        _461 = 0.0f;
        _462 = 0.0f;
      }
    }
    bool __defer_455_493 = false;
    if (_456 == 66) {
      _494 = float(_457);
      __defer_455_493 = true;
    } else {
      bool _466 = (_456 == 54);
      bool __defer_464_490 = false;
      if (((_456 == 67)) || (_466)) {
        float _473 = float((uint)((uint)(((int)(_frameNumber.x * 73)) & 127)));
        if (!(float(_457) > (frac(frac(dot(float2(((_473 * 32.665000915527344f) + _102), ((_473 * 11.8149995803833f) + _103)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) * 0.20000000298023224f))) {
          if ((_456 & 126) == 66) {
            _494 = 1.0f;
            __defer_455_493 = true;
          } else {
            _491 = 1.0f;
            _492 = 0.0h;
            __defer_464_490 = true;
          }
        } else {
          _948 = 1.0f;
          _949 = 0.0h;
          _950 = _351;
          _951 = _352;
          _952 = _353;
          _953 = 53;
          _954 = 0.0f;
          _955 = 0.0f;
          _956 = 0.0f;
        }
      } else {
        _491 = 0.0f;
        _492 = _457;
        __defer_464_490 = true;
      }
      if (__defer_464_490) {
        if (_466) {
          float _504 = (_421 * 2.0f) + -1.0f;
          float _505 = (_422 * 2.0f) + -1.0f;
          float _507 = 1.0f - abs(_504);
          float _508 = abs(_505);
          float _509 = _507 - _508;
          if (!(_509 >= 0.0f)) {
            _520 = ((1.0f - _508) * select((_504 >= 0.0f), 1.0f, -1.0f));
            _521 = (_507 * select((_505 >= 0.0f), 1.0f, -1.0f));
          } else {
            _520 = _504;
            _521 = _505;
          }
          float _523 = rsqrt(dot(float3(_520, _521, _509), float3(_520, _521, _509)));
          _538 = _491;
          _539 = (_523 * _520);
          _540 = (_523 * _521);
          _541 = (_523 * _509);
          _542 = 0.0h;
          float4 _544 = __3__36__0__0__g_bentCone.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
          float _551 = (_544.x * 2.0f) + -1.0f;
          float _552 = (_544.y * 2.0f) + -1.0f;
          float _553 = (_544.z * 2.0f) + -1.0f;
          float _555 = rsqrt(dot(float3(_551, _552, _553), float3(_551, _552, _553)));
          float _556 = _551 * _555;
          float _557 = _552 * _555;
          float _558 = _553 * _555;
          if (!(((_renderParams.z > 0.0f)) || (_308))) {
            _567 = saturate(_162 + 0.15002441h);
          } else {
            _567 = _162;
          }
          float _568 = float(_567);
          if (_456 == 54) {
            _584 = (((asfloat(_globalLightParams.z) * _568) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
          } else {
            _584 = _bevelParams.y;
          }
          float _585 = float(_280);
          float _586 = float(_281);
          float _587 = float(_282);
          float _588 = dot(float3(_539, _540, _541), float3(_556, _557, _558));
          float _589 = -0.0f - _399;
          float _590 = -0.0f - _400;
          float _591 = -0.0f - _401;
          float _592 = dot(float3(_539, _540, _541), float3(_589, _590, _591));
          float _598 = cos(abs(asin(_592) - asin(_588)) * 0.5f);
          float _602 = _556 - (_588 * _539);
          float _603 = _557 - (_588 * _540);
          float _604 = _558 - (_588 * _541);
          float _608 = _589 - (_592 * _539);
          float _609 = _590 - (_592 * _540);
          float _610 = _591 - (_592 * _541);
          float _617 = rsqrt((dot(float3(_608, _609, _610), float3(_608, _609, _610)) * dot(float3(_602, _603, _604), float3(_602, _603, _604))) + 9.999999747378752e-05f) * dot(float3(_602, _603, _604), float3(_608, _609, _610));
          float _627 = min(max(_568, 0.09803921729326248f), 1.0f);
          float _628 = _627 * _627;
          float _629 = _628 * 0.5f;
          float _630 = _628 * 2.0f;
          float _631 = _592 + _588;
          float _632 = _631 - _584;
          float _641 = 1.0f / ((1.190000057220459f / _598) + (_598 * 0.36000001430511475f));
          float _646 = ((_641 * (0.6000000238418579f - (_617 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_617 * 0.5f) + 0.5f));
          float _652 = 1.0f - (sqrt(saturate(1.0f - (_646 * _646))) * _598);
          float _653 = _652 * _652;
          float _657 = 0.9534794092178345f - ((_653 * _653) * (_652 * 0.9534794092178345f));
          float _658 = _641 * _646;
          float _663 = (sqrt(1.0f - (_658 * _658)) * 0.5f) / _598;
          float _664 = log2(_585);
          float _665 = log2(_586);
          float _666 = log2(_587);
          float _678 = ((_657 * _657) * (exp2((((_632 * _632) * -0.5f) / (_629 * _629)) * 1.4426950216293335f) / (_628 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_617 * 5.2658371925354f));
          float _682 = _631 - (_584 * 4.0f);
          float _692 = 1.0f - (_598 * 0.5f);
          float _693 = _692 * _692;
          float _697 = (_693 * _693) * (0.9534794092178345f - (_598 * 0.47673970460891724f));
          float _699 = 0.9534794092178345f - _697;
          float _700 = 0.800000011920929f / _598;
          float _713 = (((_699 * _699) * (_697 + 0.04652056470513344f)) * (exp2((((_682 * _682) * -0.5f) / (_630 * _630)) * 1.4426950216293335f) / (_628 * 5.013256549835205f))) * exp2((_617 * 24.525815963745117f) + -24.208423614501953f);
          float _723 = min(0.0f, (-0.0f - ((_678 * exp2(_664 * _663)) + (_713 * exp2(_700 * _664)))));
          float _724 = min(0.0f, (-0.0f - ((_678 * exp2(_665 * _663)) + (_713 * exp2(_700 * _665)))));
          float _725 = min(0.0f, (-0.0f - ((_678 * exp2(_666 * _663)) + (_713 * exp2(_700 * _666)))));
          float _734 = saturate(abs(dot(float3(_556, _557, _558), float3(_539, _540, _541))));
          float2 _743 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_664 * 1.5f)))), 0.0f);
          float2 _746 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_665 * 1.5f)))), 0.0f);
          float2 _749 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_666 * 1.5f)))), 0.0f);
          float _756 = min(0.9900000095367432f, _743.x);
          float _757 = min(0.9900000095367432f, _746.x);
          float _758 = min(0.9900000095367432f, _749.x);
          float _759 = min(0.9900000095367432f, _743.y);
          float _760 = min(0.9900000095367432f, _746.y);
          float _761 = min(0.9900000095367432f, _749.y);
          float _762 = _756 * _756;
          float _763 = _757 * _757;
          float _764 = _758 * _758;
          float _765 = _759 * _759;
          float _766 = _760 * _760;
          float _767 = _761 * _761;
          float _768 = _765 * _759;
          float _769 = _766 * _760;
          float _770 = _767 * _761;
          float _771 = 1.0f - _762;
          float _772 = 1.0f - _763;
          float _773 = 1.0f - _764;
          float _783 = _771 * _771;
          float _784 = _772 * _772;
          float _785 = _773 * _773;
          float _786 = _783 * _771;
          float _787 = _784 * _772;
          float _788 = _785 * _773;
          float _796 = min(max(_568, 0.18000000715255737f), 0.6000000238418579f);
          float _797 = _796 * _796;
          float _798 = _797 * 0.25f;
          float _799 = _797 * 4.0f;
          float _801 = (_757 + _756) + _758;
          float _802 = _756 / _801;
          float _803 = _757 / _801;
          float _804 = _758 / _801;
          float _805 = dot(float3(_797, _798, _799), float3(_802, _803, _804));
          float _806 = _805 * _805;
          float _809 = asin(min(max(_592, -1.0f), 1.0f)) + asin(min(max(_588, -1.0f), 1.0f));
          float _810 = _809 * 0.5f;
          float _811 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_802, _803, _804));
          float _821 = _811 * _811;
          float _844 = (_760 + _759) + _761;
          float _848 = dot(float3(_797, _798, _799), float3((_759 / _844), (_760 / _844), (_761 / _844)));
          float _852 = sqrt((_848 * _848) + (_806 * 2.0f));
          float _870 = (_848 * 3.0f) + (_805 * 2.0f);
          float _877 = (((_768 + _759) * ((_762 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _768) + _759);
          float _878 = (((_769 + _760) * ((_763 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _769) + _760);
          float _879 = (((_770 + _761) * ((_764 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _770) + _761);
          float _888 = _810 - (((_821 * (((_762 * 4.0f) * _765) + (_783 * 2.0f))) * (1.0f - ((_765 * 2.0f) / _783))) / _786);
          float _895 = _810 - (((_821 * (((_763 * 4.0f) * _766) + (_784 * 2.0f))) * (1.0f - ((_766 * 2.0f) / _784))) / _787);
          float _902 = _810 - (((_821 * (((_764 * 4.0f) * _767) + (_785 * 2.0f))) * (1.0f - ((_767 * 2.0f) / _785))) / _788);
          float _930 = exp2((((_809 * -0.25f) * _810) / _806) * 1.4426950216293335f) * 1.399999976158142f;
          float _931 = ((((((_768 * _762) / _786) + ((_759 * _762) / _771)) * 4.398229598999023f) * exp2((((_888 * _888) * -0.5f) / ((_877 * _877) + _806)) * 1.4426950216293335f)) + ((((_743.x + _723) * 0.25f) - _723) * 6.2831854820251465f)) * _930;
          float _932 = ((((((_769 * _763) / _787) + ((_760 * _763) / _772)) * 4.398229598999023f) * exp2((((_895 * _895) * -0.5f) / ((_878 * _878) + _806)) * 1.4426950216293335f)) + ((((_746.x + _724) * 0.25f) - _724) * 6.2831854820251465f)) * _930;
          float _933 = ((((((_770 * _764) / _788) + ((_761 * _764) / _773)) * 4.398229598999023f) * exp2((((_902 * _902) * -0.5f) / ((_879 * _879) + _806)) * 1.4426950216293335f)) + ((((_749.x + _725) * 0.25f) - _725) * 6.2831854820251465f)) * _930;
          float _934 = max(0.125f, _538);
          _948 = _538;
          _949 = _542;
          _950 = _539;
          _951 = _540;
          _952 = _541;
          _953 = _456;
          _954 = max(0.009999999776482582f, ((_934 * (_585 - _931)) + _931));
          _955 = max(0.009999999776482582f, (lerp(_932, _586, _934)));
          _956 = max(0.009999999776482582f, (lerp(_933, _587, _934)));
        } else {
          _528 = _491;
          _529 = _351;
          _530 = _352;
          _531 = _353;
          _532 = _492;
          if (((_456 == 54)) || (((_456 & 126) == 66))) {
            _538 = _528;
            _539 = _529;
            _540 = _530;
            _541 = _531;
            _542 = _532;
            float4 _544 = __3__36__0__0__g_bentCone.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
            float _551 = (_544.x * 2.0f) + -1.0f;
            float _552 = (_544.y * 2.0f) + -1.0f;
            float _553 = (_544.z * 2.0f) + -1.0f;
            float _555 = rsqrt(dot(float3(_551, _552, _553), float3(_551, _552, _553)));
            float _556 = _551 * _555;
            float _557 = _552 * _555;
            float _558 = _553 * _555;
            if (!(((_renderParams.z > 0.0f)) || (_308))) {
              _567 = saturate(_162 + 0.15002441h);
            } else {
              _567 = _162;
            }
            float _568 = float(_567);
            if (_456 == 54) {
              _584 = (((asfloat(_globalLightParams.z) * _568) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
            } else {
              _584 = _bevelParams.y;
            }
            float _585 = float(_280);
            float _586 = float(_281);
            float _587 = float(_282);
            float _588 = dot(float3(_539, _540, _541), float3(_556, _557, _558));
            float _589 = -0.0f - _399;
            float _590 = -0.0f - _400;
            float _591 = -0.0f - _401;
            float _592 = dot(float3(_539, _540, _541), float3(_589, _590, _591));
            float _598 = cos(abs(asin(_592) - asin(_588)) * 0.5f);
            float _602 = _556 - (_588 * _539);
            float _603 = _557 - (_588 * _540);
            float _604 = _558 - (_588 * _541);
            float _608 = _589 - (_592 * _539);
            float _609 = _590 - (_592 * _540);
            float _610 = _591 - (_592 * _541);
            float _617 = rsqrt((dot(float3(_608, _609, _610), float3(_608, _609, _610)) * dot(float3(_602, _603, _604), float3(_602, _603, _604))) + 9.999999747378752e-05f) * dot(float3(_602, _603, _604), float3(_608, _609, _610));
            float _627 = min(max(_568, 0.09803921729326248f), 1.0f);
            float _628 = _627 * _627;
            float _629 = _628 * 0.5f;
            float _630 = _628 * 2.0f;
            float _631 = _592 + _588;
            float _632 = _631 - _584;
            float _641 = 1.0f / ((1.190000057220459f / _598) + (_598 * 0.36000001430511475f));
            float _646 = ((_641 * (0.6000000238418579f - (_617 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_617 * 0.5f) + 0.5f));
            float _652 = 1.0f - (sqrt(saturate(1.0f - (_646 * _646))) * _598);
            float _653 = _652 * _652;
            float _657 = 0.9534794092178345f - ((_653 * _653) * (_652 * 0.9534794092178345f));
            float _658 = _641 * _646;
            float _663 = (sqrt(1.0f - (_658 * _658)) * 0.5f) / _598;
            float _664 = log2(_585);
            float _665 = log2(_586);
            float _666 = log2(_587);
            float _678 = ((_657 * _657) * (exp2((((_632 * _632) * -0.5f) / (_629 * _629)) * 1.4426950216293335f) / (_628 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_617 * 5.2658371925354f));
            float _682 = _631 - (_584 * 4.0f);
            float _692 = 1.0f - (_598 * 0.5f);
            float _693 = _692 * _692;
            float _697 = (_693 * _693) * (0.9534794092178345f - (_598 * 0.47673970460891724f));
            float _699 = 0.9534794092178345f - _697;
            float _700 = 0.800000011920929f / _598;
            float _713 = (((_699 * _699) * (_697 + 0.04652056470513344f)) * (exp2((((_682 * _682) * -0.5f) / (_630 * _630)) * 1.4426950216293335f) / (_628 * 5.013256549835205f))) * exp2((_617 * 24.525815963745117f) + -24.208423614501953f);
            float _723 = min(0.0f, (-0.0f - ((_678 * exp2(_664 * _663)) + (_713 * exp2(_700 * _664)))));
            float _724 = min(0.0f, (-0.0f - ((_678 * exp2(_665 * _663)) + (_713 * exp2(_700 * _665)))));
            float _725 = min(0.0f, (-0.0f - ((_678 * exp2(_666 * _663)) + (_713 * exp2(_700 * _666)))));
            float _734 = saturate(abs(dot(float3(_556, _557, _558), float3(_539, _540, _541))));
            float2 _743 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_664 * 1.5f)))), 0.0f);
            float2 _746 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_665 * 1.5f)))), 0.0f);
            float2 _749 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_666 * 1.5f)))), 0.0f);
            float _756 = min(0.9900000095367432f, _743.x);
            float _757 = min(0.9900000095367432f, _746.x);
            float _758 = min(0.9900000095367432f, _749.x);
            float _759 = min(0.9900000095367432f, _743.y);
            float _760 = min(0.9900000095367432f, _746.y);
            float _761 = min(0.9900000095367432f, _749.y);
            float _762 = _756 * _756;
            float _763 = _757 * _757;
            float _764 = _758 * _758;
            float _765 = _759 * _759;
            float _766 = _760 * _760;
            float _767 = _761 * _761;
            float _768 = _765 * _759;
            float _769 = _766 * _760;
            float _770 = _767 * _761;
            float _771 = 1.0f - _762;
            float _772 = 1.0f - _763;
            float _773 = 1.0f - _764;
            float _783 = _771 * _771;
            float _784 = _772 * _772;
            float _785 = _773 * _773;
            float _786 = _783 * _771;
            float _787 = _784 * _772;
            float _788 = _785 * _773;
            float _796 = min(max(_568, 0.18000000715255737f), 0.6000000238418579f);
            float _797 = _796 * _796;
            float _798 = _797 * 0.25f;
            float _799 = _797 * 4.0f;
            float _801 = (_757 + _756) + _758;
            float _802 = _756 / _801;
            float _803 = _757 / _801;
            float _804 = _758 / _801;
            float _805 = dot(float3(_797, _798, _799), float3(_802, _803, _804));
            float _806 = _805 * _805;
            float _809 = asin(min(max(_592, -1.0f), 1.0f)) + asin(min(max(_588, -1.0f), 1.0f));
            float _810 = _809 * 0.5f;
            float _811 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_802, _803, _804));
            float _821 = _811 * _811;
            float _844 = (_760 + _759) + _761;
            float _848 = dot(float3(_797, _798, _799), float3((_759 / _844), (_760 / _844), (_761 / _844)));
            float _852 = sqrt((_848 * _848) + (_806 * 2.0f));
            float _870 = (_848 * 3.0f) + (_805 * 2.0f);
            float _877 = (((_768 + _759) * ((_762 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _768) + _759);
            float _878 = (((_769 + _760) * ((_763 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _769) + _760);
            float _879 = (((_770 + _761) * ((_764 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _770) + _761);
            float _888 = _810 - (((_821 * (((_762 * 4.0f) * _765) + (_783 * 2.0f))) * (1.0f - ((_765 * 2.0f) / _783))) / _786);
            float _895 = _810 - (((_821 * (((_763 * 4.0f) * _766) + (_784 * 2.0f))) * (1.0f - ((_766 * 2.0f) / _784))) / _787);
            float _902 = _810 - (((_821 * (((_764 * 4.0f) * _767) + (_785 * 2.0f))) * (1.0f - ((_767 * 2.0f) / _785))) / _788);
            float _930 = exp2((((_809 * -0.25f) * _810) / _806) * 1.4426950216293335f) * 1.399999976158142f;
            float _931 = ((((((_768 * _762) / _786) + ((_759 * _762) / _771)) * 4.398229598999023f) * exp2((((_888 * _888) * -0.5f) / ((_877 * _877) + _806)) * 1.4426950216293335f)) + ((((_743.x + _723) * 0.25f) - _723) * 6.2831854820251465f)) * _930;
            float _932 = ((((((_769 * _763) / _787) + ((_760 * _763) / _772)) * 4.398229598999023f) * exp2((((_895 * _895) * -0.5f) / ((_878 * _878) + _806)) * 1.4426950216293335f)) + ((((_746.x + _724) * 0.25f) - _724) * 6.2831854820251465f)) * _930;
            float _933 = ((((((_770 * _764) / _788) + ((_761 * _764) / _773)) * 4.398229598999023f) * exp2((((_902 * _902) * -0.5f) / ((_879 * _879) + _806)) * 1.4426950216293335f)) + ((((_749.x + _725) * 0.25f) - _725) * 6.2831854820251465f)) * _930;
            float _934 = max(0.125f, _538);
            _948 = _538;
            _949 = _542;
            _950 = _539;
            _951 = _540;
            _952 = _541;
            _953 = _456;
            _954 = max(0.009999999776482582f, ((_934 * (_585 - _931)) + _931));
            _955 = max(0.009999999776482582f, (lerp(_932, _586, _934)));
            _956 = max(0.009999999776482582f, (lerp(_933, _587, _934)));
          } else {
            _948 = _528;
            _949 = _532;
            _950 = _529;
            _951 = _530;
            _952 = _531;
            _953 = _456;
            _954 = 0.0f;
            _955 = 0.0f;
            _956 = 0.0f;
          }
        }
      }
    }
    if (__defer_455_493) {
      _528 = _494;
      _529 = ((_421 * 2.0f) + -1.0f);
      _530 = ((_422 * 2.0f) + -1.0f);
      _531 = ((_423 * 2.0f) + -1.0f);
      _532 = 0.0h;
      if (((_456 == 54)) || (((_456 & 126) == 66))) {
        _538 = _528;
        _539 = _529;
        _540 = _530;
        _541 = _531;
        _542 = _532;
        float4 _544 = __3__36__0__0__g_bentCone.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
        float _551 = (_544.x * 2.0f) + -1.0f;
        float _552 = (_544.y * 2.0f) + -1.0f;
        float _553 = (_544.z * 2.0f) + -1.0f;
        float _555 = rsqrt(dot(float3(_551, _552, _553), float3(_551, _552, _553)));
        float _556 = _551 * _555;
        float _557 = _552 * _555;
        float _558 = _553 * _555;
        if (!(((_renderParams.z > 0.0f)) || (_308))) {
          _567 = saturate(_162 + 0.15002441h);
        } else {
          _567 = _162;
        }
        float _568 = float(_567);
        if (_456 == 54) {
          _584 = (((asfloat(_globalLightParams.z) * _568) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
        } else {
          _584 = _bevelParams.y;
        }
        float _585 = float(_280);
        float _586 = float(_281);
        float _587 = float(_282);
        float _588 = dot(float3(_539, _540, _541), float3(_556, _557, _558));
        float _589 = -0.0f - _399;
        float _590 = -0.0f - _400;
        float _591 = -0.0f - _401;
        float _592 = dot(float3(_539, _540, _541), float3(_589, _590, _591));
        float _598 = cos(abs(asin(_592) - asin(_588)) * 0.5f);
        float _602 = _556 - (_588 * _539);
        float _603 = _557 - (_588 * _540);
        float _604 = _558 - (_588 * _541);
        float _608 = _589 - (_592 * _539);
        float _609 = _590 - (_592 * _540);
        float _610 = _591 - (_592 * _541);
        float _617 = rsqrt((dot(float3(_608, _609, _610), float3(_608, _609, _610)) * dot(float3(_602, _603, _604), float3(_602, _603, _604))) + 9.999999747378752e-05f) * dot(float3(_602, _603, _604), float3(_608, _609, _610));
        float _627 = min(max(_568, 0.09803921729326248f), 1.0f);
        float _628 = _627 * _627;
        float _629 = _628 * 0.5f;
        float _630 = _628 * 2.0f;
        float _631 = _592 + _588;
        float _632 = _631 - _584;
        float _641 = 1.0f / ((1.190000057220459f / _598) + (_598 * 0.36000001430511475f));
        float _646 = ((_641 * (0.6000000238418579f - (_617 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_617 * 0.5f) + 0.5f));
        float _652 = 1.0f - (sqrt(saturate(1.0f - (_646 * _646))) * _598);
        float _653 = _652 * _652;
        float _657 = 0.9534794092178345f - ((_653 * _653) * (_652 * 0.9534794092178345f));
        float _658 = _641 * _646;
        float _663 = (sqrt(1.0f - (_658 * _658)) * 0.5f) / _598;
        float _664 = log2(_585);
        float _665 = log2(_586);
        float _666 = log2(_587);
        float _678 = ((_657 * _657) * (exp2((((_632 * _632) * -0.5f) / (_629 * _629)) * 1.4426950216293335f) / (_628 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_617 * 5.2658371925354f));
        float _682 = _631 - (_584 * 4.0f);
        float _692 = 1.0f - (_598 * 0.5f);
        float _693 = _692 * _692;
        float _697 = (_693 * _693) * (0.9534794092178345f - (_598 * 0.47673970460891724f));
        float _699 = 0.9534794092178345f - _697;
        float _700 = 0.800000011920929f / _598;
        float _713 = (((_699 * _699) * (_697 + 0.04652056470513344f)) * (exp2((((_682 * _682) * -0.5f) / (_630 * _630)) * 1.4426950216293335f) / (_628 * 5.013256549835205f))) * exp2((_617 * 24.525815963745117f) + -24.208423614501953f);
        float _723 = min(0.0f, (-0.0f - ((_678 * exp2(_664 * _663)) + (_713 * exp2(_700 * _664)))));
        float _724 = min(0.0f, (-0.0f - ((_678 * exp2(_665 * _663)) + (_713 * exp2(_700 * _665)))));
        float _725 = min(0.0f, (-0.0f - ((_678 * exp2(_666 * _663)) + (_713 * exp2(_700 * _666)))));
        float _734 = saturate(abs(dot(float3(_556, _557, _558), float3(_539, _540, _541))));
        float2 _743 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_664 * 1.5f)))), 0.0f);
        float2 _746 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_665 * 1.5f)))), 0.0f);
        float2 _749 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_734, _568, saturate(sqrt(exp2(_666 * 1.5f)))), 0.0f);
        float _756 = min(0.9900000095367432f, _743.x);
        float _757 = min(0.9900000095367432f, _746.x);
        float _758 = min(0.9900000095367432f, _749.x);
        float _759 = min(0.9900000095367432f, _743.y);
        float _760 = min(0.9900000095367432f, _746.y);
        float _761 = min(0.9900000095367432f, _749.y);
        float _762 = _756 * _756;
        float _763 = _757 * _757;
        float _764 = _758 * _758;
        float _765 = _759 * _759;
        float _766 = _760 * _760;
        float _767 = _761 * _761;
        float _768 = _765 * _759;
        float _769 = _766 * _760;
        float _770 = _767 * _761;
        float _771 = 1.0f - _762;
        float _772 = 1.0f - _763;
        float _773 = 1.0f - _764;
        float _783 = _771 * _771;
        float _784 = _772 * _772;
        float _785 = _773 * _773;
        float _786 = _783 * _771;
        float _787 = _784 * _772;
        float _788 = _785 * _773;
        float _796 = min(max(_568, 0.18000000715255737f), 0.6000000238418579f);
        float _797 = _796 * _796;
        float _798 = _797 * 0.25f;
        float _799 = _797 * 4.0f;
        float _801 = (_757 + _756) + _758;
        float _802 = _756 / _801;
        float _803 = _757 / _801;
        float _804 = _758 / _801;
        float _805 = dot(float3(_797, _798, _799), float3(_802, _803, _804));
        float _806 = _805 * _805;
        float _809 = asin(min(max(_592, -1.0f), 1.0f)) + asin(min(max(_588, -1.0f), 1.0f));
        float _810 = _809 * 0.5f;
        float _811 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_802, _803, _804));
        float _821 = _811 * _811;
        float _844 = (_760 + _759) + _761;
        float _848 = dot(float3(_797, _798, _799), float3((_759 / _844), (_760 / _844), (_761 / _844)));
        float _852 = sqrt((_848 * _848) + (_806 * 2.0f));
        float _870 = (_848 * 3.0f) + (_805 * 2.0f);
        float _877 = (((_768 + _759) * ((_762 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _768) + _759);
        float _878 = (((_769 + _760) * ((_763 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _769) + _760);
        float _879 = (((_770 + _761) * ((_764 * 0.699999988079071f) + 1.0f)) * _852) / ((_870 * _770) + _761);
        float _888 = _810 - (((_821 * (((_762 * 4.0f) * _765) + (_783 * 2.0f))) * (1.0f - ((_765 * 2.0f) / _783))) / _786);
        float _895 = _810 - (((_821 * (((_763 * 4.0f) * _766) + (_784 * 2.0f))) * (1.0f - ((_766 * 2.0f) / _784))) / _787);
        float _902 = _810 - (((_821 * (((_764 * 4.0f) * _767) + (_785 * 2.0f))) * (1.0f - ((_767 * 2.0f) / _785))) / _788);
        float _930 = exp2((((_809 * -0.25f) * _810) / _806) * 1.4426950216293335f) * 1.399999976158142f;
        float _931 = ((((((_768 * _762) / _786) + ((_759 * _762) / _771)) * 4.398229598999023f) * exp2((((_888 * _888) * -0.5f) / ((_877 * _877) + _806)) * 1.4426950216293335f)) + ((((_743.x + _723) * 0.25f) - _723) * 6.2831854820251465f)) * _930;
        float _932 = ((((((_769 * _763) / _787) + ((_760 * _763) / _772)) * 4.398229598999023f) * exp2((((_895 * _895) * -0.5f) / ((_878 * _878) + _806)) * 1.4426950216293335f)) + ((((_746.x + _724) * 0.25f) - _724) * 6.2831854820251465f)) * _930;
        float _933 = ((((((_770 * _764) / _788) + ((_761 * _764) / _773)) * 4.398229598999023f) * exp2((((_902 * _902) * -0.5f) / ((_879 * _879) + _806)) * 1.4426950216293335f)) + ((((_749.x + _725) * 0.25f) - _725) * 6.2831854820251465f)) * _930;
        float _934 = max(0.125f, _538);
        _948 = _538;
        _949 = _542;
        _950 = _539;
        _951 = _540;
        _952 = _541;
        _953 = _456;
        _954 = max(0.009999999776482582f, ((_934 * (_585 - _931)) + _931));
        _955 = max(0.009999999776482582f, (lerp(_932, _586, _934)));
        _956 = max(0.009999999776482582f, (lerp(_933, _587, _934)));
      } else {
        _948 = _528;
        _949 = _532;
        _950 = _529;
        _951 = _530;
        _952 = _531;
        _953 = _456;
        _954 = 0.0f;
        _955 = 0.0f;
        _956 = 0.0f;
      }
    }
    float _963 = -0.0f - min(0.0f, (-0.0f - _322));
    float _964 = -0.0f - min(0.0f, (-0.0f - _323));
    float _965 = -0.0f - min(0.0f, (-0.0f - _324));
    half2 _967 = __3__36__0__0__g_sceneAO.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
    if ((uint)_953 > (uint)11) {
      bool _975 = ((uint)_953 < (uint)19);
      if (!((uint)_953 < (uint)20)) {
        _978 = _975;
        _981 = _978;
        _982 = (_953 == 107);
      } else {
        _981 = _975;
        _982 = true;
      }
    } else {
      if (!((uint)_953 > (uint)10)) {
        _978 = false;
        _981 = _978;
        _982 = (_953 == 107);
      } else {
        _981 = false;
        _982 = true;
      }
    }
    bool _987 = (_953 == 65);
    bool _988 = (_987) || (((_981) || ((((_953 == 96)) || (_982)))));
    float _990 = select(_988, float(_949), 0.0f);
    bool _993 = ((uint)(_953 & 24) > (uint)23);
    if (_993) {
      bool _995 = (_953 == 29);
      if (_995) {
        _1000 = float(saturate(_162));
      } else {
        _1000 = 0.0f;
      }
      uint _1002 = uint((float)(_166 * 255.0h));
      if (_179) {
        _1011 = select((((int)(_1002) & 128) != 0), 1.0f, 0.0f);
        _1012 = (float((uint)((uint)((int)(_1002) & 127))) * 0.007874015718698502f);
      } else {
        _1011 = 0.0f;
        _1012 = 0.0f;
      }
      half _1013 = half(_1012);
      bool _1017 = (_1013 > 0.99902344h);
      _1022 = _1011;
      _1023 = _1000;
      _1024 = _1013;
      _1025 = select((((_953 == 24)) || (_995)), 0.010002136h, _162);
      _1026 = select(_1017, 1.0h, _280);
      _1027 = select(_1017, 1.0h, _281);
      _1028 = select(_1017, 1.0h, _282);
    } else {
      _1022 = 0.0f;
      _1023 = 0.0f;
      _1024 = select(_988, 0.0h, _949);
      _1025 = _162;
      _1026 = _280;
      _1027 = _281;
      _1028 = _282;
    }
    int _1029 = _953 & -2;
    bool _1030 = (_1029 == 66);
    bool _1031 = (_953 == 54);
    bool _1032 = (_1031) || (_1030);
    float _1033 = -0.0f - _399;
    float _1034 = -0.0f - _400;
    float _1035 = -0.0f - _401;
    float _1036 = dot(float3(_1033, _1034, _1035), float3(_351, _352, _353));
    if (_1032) {
      _1040 = abs(_1036);
    } else {
      _1040 = _1036;
    }
    float _1041 = saturate(_1040);
    bool _1043 = ((_115.x & 128) == 0);
    if (_1043) {
      if ((uint)_117 > (uint)52) {
        if (!((((_115.x & 125) == 105)) || (((uint)_117 < (uint)68)))) {
          _1063 = (_117 == 98);
        } else {
          _1063 = true;
        }
      } else {
        if ((uint)_117 > (uint)10) {
          if ((uint)_117 < (uint)20) {
            if (_402 == 14) {
              _1063 = (_117 == 98);
            } else {
              _1063 = true;
            }
          } else {
            if (!((_115.x & 125) == 105)) {
              _1063 = (_117 == 98);
            } else {
              _1063 = true;
            }
          }
        } else {
          _1063 = (_117 == 98);
        }
      }
    } else {
      _1063 = true;
    }
    [branch]
    if (_993) {
      uint _1066 = __3__36__0__0__g_depthOpaque.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
      _1072 = (float((uint)((uint)(_1066.x & 16777215))) * 5.960465188081798e-08f);
    } else {
      _1072 = _112.x;
    }
    float _1100 = mad((_projToPrevProj[3].z), _1072, mad((_projToPrevProj[3].y), _357, ((_projToPrevProj[3].x) * _355))) + (_projToPrevProj[3].w);
    if (_1063) {
      float2 _1107 = __3__36__0__0__g_velocity.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
      _1113 = (_1107.x * 2.0f);
      _1114 = (_1107.y * 2.0f);
    } else {
      _1113 = (((mad((_projToPrevProj[0].z), _1072, mad((_projToPrevProj[0].y), _357, ((_projToPrevProj[0].x) * _355))) + (_projToPrevProj[0].w)) / _1100) - _355);
      _1114 = (((mad((_projToPrevProj[1].z), _1072, mad((_projToPrevProj[1].y), _357, ((_projToPrevProj[1].x) * _355))) + (_projToPrevProj[1].w)) / _1100) - _357);
    }
    float _1116 = _nearFarProj.x / max(1.0000000116860974e-07f, _1072);
    float _1119 = (_1113 * 0.5f) + _109;
    float _1120 = _110 - (_1114 * 0.5f);
    float _1128 = select((((((_1119 < 0.0f)) || ((_1119 > 1.0f)))) || ((((_1120 < 0.0f)) || ((_1120 > 1.0f))))), 1.0f, 0.0f);
    float _1133 = (_1119 * _bufferSizeAndInvSize.x) + -0.5f;
    float _1134 = (_1120 * _bufferSizeAndInvSize.y) + -0.5f;
    int _1137 = int(floor(_1133));
    int _1138 = int(floor(_1134));
    float _1139 = float((int)(_1137));
    float _1140 = float((int)(_1138));
    float _1143 = (_1139 + 0.5f) * _bufferSizeAndInvSize.z;
    float _1144 = (_1140 + 0.5f) * _bufferSizeAndInvSize.w;
    int4 _1147 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1143, _1144));
    int _1170 = asint(((((uint)((uint)((uint)(_1147.w)) >> 24))) * (16777216u)) + ((uint)(asint(((((uint)((uint)((uint)(_1147.z)) >> 24))) * (65536u)) + ((uint)(asint(((((uint)((uint)((uint)(_1147.y)) >> 24))) * (256u)) + (((uint)((uint)((uint)(_1147.x)) >> 24))))))))));
    if (_1043) {
      if ((uint)_117 > (uint)52) {
        if (!(((_117 == 98)) || (((((_115.x & 125) == 105)) || (((uint)_117 < (uint)68)))))) {
          _1200 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _1200 = 0.0f;
        }
      } else {
        if ((uint)_117 > (uint)10) {
          if ((uint)_117 < (uint)20) {
            if (_402 == 14) {
              _1200 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1200 = 0.0f;
            }
          } else {
            if (!((_115.x & 125) == 105)) {
              _1200 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1200 = 0.0f;
            }
          }
        } else {
          _1200 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _1200 = 0.0f;
    }
    float _1208 = _screenPercentage.x * 2.0f;
    float _1209 = _1208 * abs(_109 + -0.5f);
    float _1210 = _screenPercentage.y * 2.0f;
    float _1211 = _1210 * abs(_110 + -0.5f);
    float _1215 = sqrt(dot(float2(_1209, _1211), float2(_1209, _1211)) + 1.0f) * _1116;
    float _1232 = _1208 * abs(_1119 + -0.5f);
    float _1233 = _1210 * abs(_1120 + -0.5f);
    float _1236 = sqrt(dot(float2(_1232, _1233), float2(_1232, _1233)) + 1.0f);
    bool _1251 = (_340) || (((uint)(_953 + -97) < (uint)2));
    float _1253 = _1116 * _1116;
    float _1255 = (_1253 * select(_1251, 0.5f, 0.20000000298023224f)) + 1.0f;
    bool _1259 = ((uint)(_953 + -53) < (uint)15);
    if (_1259) {
      _1278 = (1000.0f - (saturate(float((bool)(uint)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _1278 = 50.0f;
    }
    float _1288 = select((((_953 == 57)) || (_1259)), 0.0f, ((max(0.0f, (_1116 + -1.0f)) * 0.10000000149011612f) * _temporalReprojectionParams.y));
    float _1293 = max(0.0f, (abs(_1215 - (_1236 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_1147.x & 16777215))) * 5.960465188081798e-08f))) - _1200))) - _1288));
    float _1294 = max(0.0f, (abs(_1215 - (_1236 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_1147.y & 16777215))) * 5.960465188081798e-08f))) - _1200))) - _1288));
    float _1295 = max(0.0f, (abs(_1215 - (_1236 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_1147.z & 16777215))) * 5.960465188081798e-08f))) - _1200))) - _1288));
    float _1296 = max(0.0f, (abs(_1215 - (_1236 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_1147.w & 16777215))) * 5.960465188081798e-08f))) - _1200))) - _1288));
    float _1297 = _1293 * _1293;
    float _1298 = _1294 * _1294;
    float _1299 = _1295 * _1295;
    float _1300 = _1296 * _1296;
    float _1302 = (-1.4426950216293335f / ((_1253 * 0.10000000149011612f) + 1.0f)) * select(_1251, 0.20000000298023224f, _1278);
    float _1315 = select((_1297 > _1255), 0.0f, exp2(_1297 * _1302));
    float _1316 = select((_1298 > _1255), 0.0f, exp2(_1298 * _1302));
    float _1317 = select((_1299 > _1255), 0.0f, exp2(_1299 * _1302));
    float _1318 = select((_1300 > _1255), 0.0f, exp2(_1300 * _1302));
    if (!_993) {
      int _1320 = _1170 & 127;
      int _1321 = _1170 & 32512;
      int _1322 = _1170 & 8323072;
      int _1323 = _1170 & 2130706432;
      bool _1362 = ((_1320 == 57)) || (((uint)(_1320 + -53) < (uint)15));
      bool _1363 = ((_1321 == 14592)) || (((uint)((((uint)((uint)(_1170)) >> 8) & 127) + -53) < (uint)15));
      bool _1364 = ((_1322 == 3735552)) || (((uint)((((uint)((uint)(_1170)) >> 16) & 127) + -53) < (uint)15));
      bool _1365 = ((_1323 == 956301312)) || (((uint)((((uint)((uint)(_1170)) >> 24) & 127) + -53) < (uint)15));
      if (_1043) {
        _1383 = (((_117 == 57)) || (((uint)(_117 + -53) < (uint)15)));
      } else {
        _1383 = true;
      }
      bool _1392 = (_953 == 6);
      bool _1414 = ((uint)(_953 + -105) < (uint)3);
      bool _1421 = ((_117 == 57)) || (((uint)(_117 + -53) < (uint)15));
      _1455 = (float((bool)((uint)((((_405) || ((((_1320 != 54)) && (((_1170 & 126) != 66)))))) && ((!(((((((_1170 & 128) != 0)) || (_1362)) ^ _1383)) || ((((_1392 ^ (_1320 == 6))) || ((((_1414 ^ (((_1320 == 107)) || (((uint)(_1320 + -105) < (uint)2))))) || ((_1362 ^ _1421)))))))))))) * _1315);
      _1456 = (float((bool)((uint)((((_405) || ((((_1321 != 13824)) && (((_1170 & 32256) != 16896)))))) && ((!(((((((_1170 & 32768) != 0)) || (_1363)) ^ _1383)) || ((((_1392 ^ (_1321 == 1536))) || ((((_1414 ^ ((((_1170 & 32000) == 26880)) || ((_1321 == 27136))))) || ((_1363 ^ _1421)))))))))))) * _1316);
      _1457 = (float((bool)((uint)((((_405) || ((((_1322 != 3538944)) && (((_1170 & 8257536) != 4325376)))))) && ((!(((((((_1170 & 8388608) != 0)) || (_1364)) ^ _1383)) || ((((_1392 ^ (_1322 == 393216))) || ((((_1414 ^ ((((_1170 & 8192000) == 6881280)) || ((_1322 == 6946816))))) || ((_1364 ^ _1421)))))))))))) * _1317);
      _1458 = (float((bool)((uint)((((_405) || ((((_1323 != 905969664)) && (((_1170 & 2113929216) != 1107296256)))))) && ((!(((((((int)_1170 < (int)0)) || (_1365)) ^ _1383)) || ((((_1392 ^ (_1323 == 100663296))) || ((((_1414 ^ ((((_1170 & 2097152000) == 1761607680)) || ((_1323 == 1778384896))))) || ((_1365 ^ _1421)))))))))))) * _1318);
    } else {
      _1455 = _1315;
      _1456 = _1316;
      _1457 = _1317;
      _1458 = _1318;
    }
    int4 _1460 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1143, _1144));
    float _1479 = min(1.0f, ((float((uint)((uint)(_1460.w & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1480 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1460.w)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1481 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1460.w)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1483 = rsqrt(dot(float3(_1479, _1480, _1481), float3(_1479, _1480, _1481)));
    float _1488 = saturate(dot(float3(_351, _352, _353), float3((_1483 * _1479), (_1483 * _1480), (_1483 * _1481))));
    float _1503 = min(1.0f, ((float((uint)((uint)(_1460.z & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1504 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1460.z)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1505 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1460.z)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1507 = rsqrt(dot(float3(_1503, _1504, _1505), float3(_1503, _1504, _1505)));
    float _1512 = saturate(dot(float3(_351, _352, _353), float3((_1507 * _1503), (_1507 * _1504), (_1507 * _1505))));
    float _1527 = min(1.0f, ((float((uint)((uint)(_1460.x & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1528 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1460.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1529 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1460.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1531 = rsqrt(dot(float3(_1527, _1528, _1529), float3(_1527, _1528, _1529)));
    float _1536 = saturate(dot(float3(_351, _352, _353), float3((_1531 * _1527), (_1531 * _1528), (_1531 * _1529))));
    float _1551 = min(1.0f, ((float((uint)((uint)(_1460.y & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1552 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1460.y)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1553 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1460.y)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1555 = rsqrt(dot(float3(_1551, _1552, _1553), float3(_1551, _1552, _1553)));
    float _1560 = saturate(dot(float3(_351, _352, _353), float3((_1555 * _1551), (_1555 * _1552), (_1555 * _1553))));
    float _1563 = select(((_1031) || (((_1030) || (_1251)))), 0.009999999776482582f, 1.0f);
    float _1580 = _1133 - _1139;
    float _1581 = _1134 - _1140;
    float _1582 = 1.0f - _1580;
    float _1583 = 1.0f - _1581;
    float _1588 = (_1582 * _1581) * _1455;
    float _1590 = (_1581 * _1580) * _1456;
    float _1592 = (_1583 * _1580) * _1457;
    float _1594 = (_1583 * _1582) * _1458;
    float _1596 = saturate(select(_993, 1.0f, (pow(_1536, _1563))) * _1588);
    float _1597 = saturate(select(_993, 1.0f, (pow(_1560, _1563))) * _1590);
    float _1598 = saturate(select(_993, 1.0f, (pow(_1512, _1563))) * _1592);
    float _1599 = saturate(select(_993, 1.0f, (pow(_1488, _1563))) * _1594);
    int4 _1601 = asint(__3__37__0__0__g_structureCounterBuffer.Load4(8));
    [branch]
    if (!(WaveReadLaneFirst(_1601.x) == 0)) {
      uint _1609 = __3__36__0__0__g_tiledManyLightsMasks.Load(int3(((int)(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))) >> 5)), ((int)(((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))) >> 5)), 0));
      int _1611 = _1609.x & 4;
      int _1613 = (uint)((uint)(_1611)) >> 2;
      if (!(_1611 == 0)) {
        _1621 = max((saturate(dot(float3(_963, _964, _965), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _1128);
        _1622 = _1613;
      } else {
        _1621 = _1128;
        _1622 = _1613;
      }
    } else {
      _1621 = _1128;
      _1622 = 0;
    }
    float _1632 = saturate(max(_1621, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    half4 _1635 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1137, ((int)((uint)(_1138) + 1u)), 0));
    half4 _1641 = __3__36__0__0__g_diffuseResultPrev.Load(int3(((int)((uint)(_1137) + 1u)), ((int)((uint)(_1138) + 1u)), 0));
    half4 _1646 = __3__36__0__0__g_diffuseResultPrev.Load(int3(((int)((uint)(_1137) + 1u)), _1138, 0));
    half4 _1651 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1137, _1138, 0));
    float _1656 = dot(float4(_1596, _1597, _1598, _1599), float4(1.0f, 1.0f, 1.0f, 1.0f));
    float _1665 = saturate(dot(float4(_1596, _1597, _1598, _1599), float4(float(_1635.w), float(_1641.w), float(_1646.w), float(_1651.w))) * (1.0f / max(1.0f, _1656)));
    float _1670 = sqrt((_1114 * _1114) + (_1113 * _1113)) * 50.0f;
    if (_1259) {
      _1679 = saturate(1.0f - _1670);
    } else {
      _1679 = (1.0f - (saturate(_1670) * 0.5f));
    }
    float _1683 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    bool _1687 = (_953 == 24);
    float _1688 = select(_1687, 1.0f, _1665);
    float _1690 = (_1688 * _1688) * 4.0f;
    float4 _1701 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_109, _110), 0.0f);
    float _1706 = saturate(_1701.w);
    float _1708 = 1.0f / max(9.999999974752427e-07f, _1656);
    float _1709 = _1708 * _1596;
    float _1710 = _1708 * _1597;
    float _1711 = _1708 * _1598;
    float _1712 = _1708 * _1599;
    float _1713 = saturate(saturate(max(_1632, (1.0f / ((saturate(_1690) * min(31.0f, ((_1679 * 15.0f) * _1683))) + 1.0f))) + _renderParams.z));
    float _1755 = 1.0f / _exposure4.x;
    float _1772 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1712 * float(_1651.x)) + ((_1711 * float(_1646.x)) + ((_1709 * float(_1635.x)) + (_1710 * float(_1641.x))))))) * _exposure4.y)))));
    float _1773 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1712 * float(_1651.y)) + ((_1711 * float(_1646.y)) + ((_1709 * float(_1635.y)) + (_1710 * float(_1641.y))))))) * _exposure4.y)))));
    float _1774 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1712 * float(_1651.z)) + ((_1711 * float(_1646.z)) + ((_1709 * float(_1635.z)) + (_1710 * float(_1641.z))))))) * _exposure4.y)))));
    bool __defer_1678_1798 = false;
    if (_renderParams.y == 0.0f) {
      if (_1030) {
        _1804 = _1772;
        _1805 = _1773;
        _1806 = _1774;
        _1807 = _1713;
        _1811 = _1804;
        _1812 = _1805;
        _1813 = _1806;
        _1814 = _1807;
        _1815 = saturate(_1665 + 0.0625f);
      } else {
        if (!_1031) {
          float _1779 = dot(float3(_1772, _1773, _1774), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
          float _1794 = ((min(_1779, _1701.y) / max(9.999999974752427e-07f, _1779)) * _1706) + saturate(1.0f - _1706);
          _1799 = saturate((saturate(((_1701.x - _1779) * 5.0f) / max(9.999999974752427e-07f, _1701.x)) * 0.5f) + _1713);
          _1800 = (_1794 * _1772);
          _1801 = (_1794 * _1773);
          _1802 = (_1794 * _1774);
        } else {
          _1799 = _1713;
          _1800 = _1772;
          _1801 = _1773;
          _1802 = _1774;
        }
        __defer_1678_1798 = true;
      }
    } else {
      _1799 = _1713;
      _1800 = _1772;
      _1801 = _1773;
      _1802 = _1774;
      __defer_1678_1798 = true;
    }
    if (__defer_1678_1798) {
      if (!_1687) {
        _1804 = _1800;
        _1805 = _1801;
        _1806 = _1802;
        _1807 = _1799;
        _1811 = _1804;
        _1812 = _1805;
        _1813 = _1806;
        _1814 = _1807;
        _1815 = saturate(_1665 + 0.0625f);
      } else {
        _1811 = _1800;
        _1812 = _1801;
        _1813 = _1802;
        _1814 = _1799;
        _1815 = 0.0f;
      }
    }
    float _1822 = (_1814 * (_963 - _1811)) + _1811;
    float _1823 = (_1814 * (_964 - _1812)) + _1812;
    float _1824 = (_1814 * (_965 - _1813)) + _1813;
    __3__38__0__1__g_diffuseResultUAV[int2(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))))] = half4(half(_1822), half(_1823), half(_1824), half(_1815));
    float _1831 = float(_1026);
    float _1832 = float(_1027);
    float _1833 = float(_1028);
    if (_953 == 53) {
      _1840 = saturate(((_1832 + _1831) + _1833) * 1.2000000476837158f);
    } else {
      _1840 = 1.0f;
    }
    float _1841 = float(_1024);
    float _1847 = (0.699999988079071f / min(max(max(max(_1831, _1832), _1833), 0.009999999776482582f), 0.699999988079071f)) * _1840;
    float _1857 = (((_1847 * _1831) + -0.03999999910593033f) * _1841) + 0.03999999910593033f;
    float _1858 = (((_1847 * _1832) + -0.03999999910593033f) * _1841) + 0.03999999910593033f;
    float _1859 = (((_1847 * _1833) + -0.03999999910593033f) * _1841) + 0.03999999910593033f;
    if (!_993) {
      _1865 = saturate(1.0h - _967.x);
    } else {
      _1865 = 1.0h;
    }
    bool _1869 = ((_953 == 98)) || ((_1029 == 96));
    if (!_1869) {
      bool __branch_chain_1870;
      if ((uint)(_953 + -105) < (uint)2) {
        _1877 = _179;
        __branch_chain_1870 = true;
      } else {
        if (!((uint)(_953 + -11) < (uint)9)) {
          _1877 = false;
          __branch_chain_1870 = true;
        } else {
          _1907 = 0.0h;
          _1908 = _953;
          _1909 = 0.0f;
          _1910 = 0.0f;
          _1911 = 0.0f;
          __branch_chain_1870 = false;
        }
      }
      if (__branch_chain_1870) {
        _1877 = _179;
      }
      bool _1879 = ((_953 == 107)) || (_1877);
      half _1882 = select(_1879, 0.0h, _1024);
      if ((_1879) || ((!_987))) {
        if (_953 == 33) {
          uint _1892 = uint((_423 * 255.0f) + 0.5f);
          int _1894 = ((uint)(_1892) >> 4) & 7;
          if (!(_1894 == 0)) {
            _1907 = _1882;
            _1908 = _953;
            _1909 = min((1.0f - ((_clothLightingParameter[_1894]).y)), ((_clothLightingParameter[_1894]).x));
            _1910 = (float((uint)((uint)((int)(_1892) & 15))) * 0.06666667014360428f);
            _1911 = ((_clothLightingParameter[_1894]).x);
          } else {
            _1907 = _1882;
            _1908 = _953;
            _1909 = 0.0f;
            _1910 = 0.0f;
            _1911 = 0.0f;
          }
        } else {
          if (_953 == 55) {
            if (!(_423 < 0.0010000000474974513f)) {
              uint _1892 = uint((_423 * 255.0f) + 0.5f);
              int _1894 = ((uint)(_1892) >> 4) & 7;
              if (!(_1894 == 0)) {
                _1907 = _1882;
                _1908 = _953;
                _1909 = min((1.0f - ((_clothLightingParameter[_1894]).y)), ((_clothLightingParameter[_1894]).x));
                _1910 = (float((uint)((uint)((int)(_1892) & 15))) * 0.06666667014360428f);
                _1911 = ((_clothLightingParameter[_1894]).x);
              } else {
                _1907 = _1882;
                _1908 = _953;
                _1909 = 0.0f;
                _1910 = 0.0f;
                _1911 = 0.0f;
              }
            } else {
              _1907 = _1882;
              _1908 = 53;
              _1909 = 0.0f;
              _1910 = 0.0f;
              _1911 = 0.0f;
            }
          } else {
            _1907 = _1882;
            _1908 = _953;
            _1909 = 0.0f;
            _1910 = 0.0f;
            _1911 = 0.0f;
          }
        }
      } else {
        _1907 = 0.0h;
        _1908 = 65;
        _1909 = 0.0f;
        _1910 = 0.0f;
        _1911 = 0.0f;
      }
    } else {
      _1907 = 0.0h;
      _1908 = _953;
      _1909 = 0.0f;
      _1910 = 0.0f;
      _1911 = 0.0f;
    }
    float _1913 = dot(float3(_399, _400, _401), float3(_351, _352, _353)) * 2.0f;
    float _1917 = _399 - (_1913 * _351);
    float _1918 = _400 - (_1913 * _352);
    float _1919 = _401 - (_1913 * _353);
    float _1921 = rsqrt(dot(float3(_1917, _1918, _1919), float3(_1917, _1918, _1919)));
    float _1922 = _1917 * _1921;
    float _1923 = _1918 * _1921;
    float _1924 = _1919 * _1921;
    float _1927 = __3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110), 0.0f);
    float _1929 = float(_1025);
    float _1931 = select((_1929 < 0.800000011920929f), _1927.x, 0.0f);
    float _1932 = _1931 * _1922;
    float _1933 = _1931 * _1923;
    float _1934 = _1931 * _1924;
    float _1939 = dot(float3(_1932, _1933, _1934), float3((-0.0f - _351), (-0.0f - _352), (-0.0f - _353))) * 2.0f;
    float _1944 = ((_1939 * _351) + _394) + _1932;
    float _1946 = ((_1939 * _352) + _395) + _1933;
    float _1948 = ((_1939 * _353) + _396) + _1934;
    float _1972 = mad((_viewProjRelative[0].z), _1948, mad((_viewProjRelative[0].y), _1946, (_1944 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w);
    float _1976 = mad((_viewProjRelative[1].z), _1948, mad((_viewProjRelative[1].y), _1946, (_1944 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w);
    float _1980 = mad((_viewProjRelative[2].z), _1948, mad((_viewProjRelative[2].y), _1946, (_1944 * (_viewProjRelative[2].x)))) + (_viewProjRelative[2].w);
    float _1984 = mad((_viewProjRelative[3].z), _1948, mad((_viewProjRelative[3].y), _1946, (_1944 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
    float _2022 = mad((_projToPrevProj[3].w), _1984, mad((_projToPrevProj[3].z), _1980, mad((_projToPrevProj[3].y), _1976, ((_projToPrevProj[3].x) * _1972))));
    float _2023 = mad((_projToPrevProj[0].w), _1984, mad((_projToPrevProj[0].z), _1980, mad((_projToPrevProj[0].y), _1976, ((_projToPrevProj[0].x) * _1972)))) / _2022;
    float _2024 = mad((_projToPrevProj[1].w), _1984, mad((_projToPrevProj[1].z), _1980, mad((_projToPrevProj[1].y), _1976, ((_projToPrevProj[1].x) * _1972)))) / _2022;
    float _2028 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[2].w), _1984, mad((_projToPrevProj[2].z), _1980, mad((_projToPrevProj[2].y), _1976, ((_projToPrevProj[2].x) * _1972)))) / _2022));
    float _2064 = mad((_invViewProjRelativePrev[3].z), _2028, mad((_invViewProjRelativePrev[3].y), _2024, ((_invViewProjRelativePrev[3].x) * _2023))) + (_invViewProjRelativePrev[3].w);
    float _2075 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[0].z), _2028, mad((_invViewProjRelativePrev[0].y), _2024, ((_invViewProjRelativePrev[0].x) * _2023))) + (_invViewProjRelativePrev[0].w)) / _2064) - _1944);
    float _2076 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[1].z), _2028, mad((_invViewProjRelativePrev[1].y), _2024, ((_invViewProjRelativePrev[1].x) * _2023))) + (_invViewProjRelativePrev[1].w)) / _2064) - _1946);
    float _2077 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _2028, mad((_invViewProjRelativePrev[2].y), _2024, ((_invViewProjRelativePrev[2].x) * _2023))) + (_invViewProjRelativePrev[2].w)) / _2064) - _1948);
    float _2078 = dot(float3(_2075, _2076, _2077), float3(_1922, _1923, _1924));
    float _2082 = _2075 - (_2078 * _1922);
    float _2083 = _2076 - (_2078 * _1923);
    float _2084 = _2077 - (_2078 * _1924);
    float _2100 = (saturate(_1931 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_2082 * _2082) + (_2083 * _2083)) + (_2084 * _2084)) / max(0.0010000000474974513f, _1931))) + -1.0f)) + 1.0f;
    float _2101 = _2100 * _2100;
    float _2102 = _2101 * _2101;
    float _2103 = _2102 * _1536;
    float _2104 = _2102 * _1560;
    float _2105 = _2102 * _1512;
    float _2106 = _2102 * _1488;
    bool _2109 = (_renderParams.z > 0.0f);
    float _2111 = float(1.0h - _1025);
    float _2115 = (_2023 - (_1972 / _1984)) - _1113;
    float _2116 = (_2024 - (_1976 / _1984)) - _1114;
    float _2120 = sqrt((_2116 * _2116) + (_2115 * _2115));
    float _2125 = saturate((((_2111 * _2111) * (1.0f - (_1041 * 0.8999999761581421f))) * _2120) * select(_2109, 2000.0f, 500.0f));
    int _2131 = _1908 & -2;
    bool _2134 = (_1908 == 29);
    float _2137 = select(((((_993) || (_2134))) || ((((_2131 == 24)) || ((_renderParams.y > 0.0f))))), 1.0f, float(_967.y));
    float _2141 = float(_1907);
    float _2146 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
    float _2172 = saturate(saturate(1.0f - (((_2141 * _121) / max(0.0010000000474974513f, _1041)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_2146 * 0.07500000298023224f)) + max(0.019999999552965164f, _1929)) + (saturate(_121 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_121 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_2141) * 0.75f)));
    if (_1908 == 64) {
      _2181 = ((saturate(_121 * 0.25f) * (_2172 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _2181 = _2172;
    }
    float _2183 = (_2146 * 16.0f) + 16.0f;
    float _2189 = select((_2146 > 1.0f), 0.0f, saturate((1.0f / _2183) * (_121 - _2183)));
    if (_1908 == 105) {
      _2200 = 1.0f;
      _2204 = select((_1908 == 65), 0.0f, _2200);
    } else {
      if (!((uint)(_1908 & 24) > (uint)23)) {
        _2200 = select((_1908 == 107), 1.0f, ((_2189 + _2181) - (_2189 * _2181)));
        _2204 = select((_1908 == 65), 0.0f, _2200);
      } else {
        _2204 = 0.0f;
      }
    }
    float _2213 = select((((_1908 == 57)) || (((uint)((int)((uint)(_1908) + (uint)(-53))) < (uint)15))), 31.0f, 63.0f);
    if (!_2134) {
      float _2226 = (saturate((2000.0f - (saturate(float(_1907 * 0.5h) + (_121 * 0.0625f)) * 1500.0f)) * _2120) * (7.0f - _2213)) + _2213;
      if ((uint)((int)((uint)(_1908) + (uint)(-12))) < (uint)9) {
        _2236 = ((saturate(_121 * 0.004999999888241291f) * (_2226 + -2.0f)) + 2.0f);
      } else {
        _2236 = _2226;
      }
    } else {
      _2236 = _2213;
    }
    half _2239 = max(0.040008545h, _1025);
    float _2257 = saturate(max(max(_1632, select(_2109, (_2125 + 0.125f), 0.0f)), (1.0f / (((saturate((_1683 * _1683) * _1690) * min(64.0f, (_2236 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _2204) + (_121 * 0.0078125f)) + float((_2239 * _2239) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    bool __defer_2235_2280 = false;
    if ((uint)_1908 > (uint)52) {
      if ((uint)_1908 < (uint)68) {
        if (_2131 == 66) {
          _2290 = _2103;
          _2291 = _2104;
          _2292 = _2105;
          _2293 = _2106;
          _2296 = _2290;
          _2297 = _2291;
          _2298 = _2292;
          _2299 = _2293;
          _2300 = max(0.89990234h, _1025);
        } else {
          if (!(_1908 == 54)) {
            float _2268 = _2103 * _2103;
            float _2269 = _2104 * _2104;
            float _2270 = _2105 * _2105;
            float _2271 = _2106 * _2106;
            float _2272 = _2268 * _2268;
            float _2273 = _2269 * _2269;
            float _2274 = _2270 * _2270;
            float _2275 = _2271 * _2271;
            _2281 = (_2272 * _2272);
            _2282 = (_2273 * _2273);
            _2283 = (_2274 * _2274);
            _2284 = (_2275 * _2275);
          } else {
            _2281 = _2103;
            _2282 = _2104;
            _2283 = _2105;
            _2284 = _2106;
          }
          __defer_2235_2280 = true;
        }
      } else {
        _2296 = _2103;
        _2297 = _2104;
        _2298 = _2105;
        _2299 = _2106;
        _2300 = max(0.099975586h, _1025);
      }
    } else {
      _2281 = _2103;
      _2282 = _2104;
      _2283 = _2105;
      _2284 = _2106;
      __defer_2235_2280 = true;
    }
    if (__defer_2235_2280) {
      if (((_1908 == 54)) || ((_2131 == 66))) {
        _2290 = _2281;
        _2291 = _2282;
        _2292 = _2283;
        _2293 = _2284;
        _2296 = _2290;
        _2297 = _2291;
        _2298 = _2292;
        _2299 = _2293;
        _2300 = max(0.89990234h, _1025);
      } else {
        _2296 = _2281;
        _2297 = _2282;
        _2298 = _2283;
        _2299 = _2284;
        _2300 = max(0.099975586h, _1025);
      }
    }
    float _2301 = float(_2300);
    float _2302 = _2301 * _2301;
    float _2303 = _2302 * _2302;
    float _2316 = (((_2303 * _2296) - _2296) * _2296) + 1.0f;
    float _2317 = (((_2303 * _2297) - _2297) * _2297) + 1.0f;
    float _2318 = (((_2303 * _2298) - _2298) * _2298) + 1.0f;
    float _2319 = (((_2303 * _2299) - _2299) * _2299) + 1.0f;
    float _2344 = saturate(select(_2134, 1.0f, saturate((_2303 / (_2316 * _2316)) * _2296)) * _1588);
    float _2345 = saturate(select(_2134, 1.0f, saturate((_2303 / (_2317 * _2317)) * _2297)) * _1590);
    float _2346 = saturate(select(_2134, 1.0f, saturate((_2303 / (_2318 * _2318)) * _2298)) * _1592);
    float _2347 = saturate(select(_2134, 1.0f, saturate((_2303 / (_2319 * _2319)) * _2299)) * _1594);
    bool _2349 = ((uint)(_1908 & 24) > (uint)23);
    [branch]
    if (_2349) {
      float _2362 = mad((_projToPrevProj[3].z), _112.x, mad((_projToPrevProj[3].y), _357, ((_projToPrevProj[3].x) * _355))) + (_projToPrevProj[3].w);
      float _2365 = ((mad((_projToPrevProj[0].z), _112.x, mad((_projToPrevProj[0].y), _357, ((_projToPrevProj[0].x) * _355))) + (_projToPrevProj[0].w)) / _2362) - _355;
      float _2366 = ((mad((_projToPrevProj[1].z), _112.x, mad((_projToPrevProj[1].y), _357, ((_projToPrevProj[1].x) * _355))) + (_projToPrevProj[1].w)) / _2362) - _357;
      float _2376 = (((_2365 * 0.5f) + _109) * _bufferSizeAndInvSize.x) + -0.5f;
      float _2377 = ((_110 - (_2366 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
      int _2380 = int(floor(_2376));
      int _2381 = int(floor(_2377));
      float _2382 = float((int)(_2380));
      float _2383 = float((int)(_2381));
      [branch]
      if (_2134) {
        int4 _2393 = __3__36__0__0__g_stencilPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(((_2382 + 0.5f) * _bufferSizeAndInvSize.z), ((_2383 + 0.5f) * _bufferSizeAndInvSize.w)));
        int _2400 = asint((((uint)(_2393.w)) * (16777216u)) + ((uint)(asint((((uint)(_2393.z)) * (65536u)) + ((uint)(asint((((uint)(_2393.y)) * (256u)) + ((uint)(_2393.x)))))))));
        float _2417 = saturate(float((bool)(uint)((uint)(_2400 & 24) > (uint)23)) * _2344);
        float _2418 = saturate(float((bool)(uint)((uint)(_2400 & 6144) > (uint)5888)) * _2345);
        float _2419 = saturate(float((bool)(uint)((uint)(_2400 & 1572864) > (uint)1507328)) * _2346);
        float _2420 = saturate(float((bool)(uint)((uint)(_2400 & 402653184) > (uint)385875968)) * _2347);
        _2453 = max(saturate(min(max(((_1023 / (((_121 * _121) * 0.004999999888241291f) + 1.0f)) + (_2125 * 0.5f)), 0.03125f), 0.5f) + _2257), saturate(1.0f - dot(float4(_2417, _2418, _2419, _2420), float4(1.0f, 1.0f, 1.0f, 1.0f))));
        _2454 = _2380;
        _2455 = _2381;
        _2456 = _2417;
        _2457 = _2418;
        _2458 = _2419;
        _2459 = _2420;
      } else {
        float _2436 = _2376 - _2382;
        float _2437 = _2377 - _2383;
        float _2438 = 1.0f - _2436;
        float _2439 = 1.0f - _2437;
        _2453 = (saturate((sqrt((_2366 * _2366) + (_2365 * _2365)) * 50.0f) + 0.125f) * 0.875f);
        _2454 = _2380;
        _2455 = _2381;
        _2456 = (_2438 * _2437);
        _2457 = (_2437 * _2436);
        _2458 = (_2439 * _2436);
        _2459 = (_2439 * _2438);
      }
    } else {
      _2453 = _2257;
      _2454 = _1137;
      _2455 = _1138;
      _2456 = _2344;
      _2457 = _2345;
      _2458 = _2346;
      _2459 = _2347;
    }
    bool _2460 = (_2141 > 0.20000000298023224f);
    half4 _2463 = __3__36__0__0__g_specularResultPrev.Load(int3(_2454, ((int)((uint)(_2455) + 1u)), 0));
    float _2476 = float((bool)((uint)(!(_2460 ^ (_2463.w < 0.0h))))) * _2456;
    half4 _2483 = __3__36__0__0__g_specularResultPrev.Load(int3(((int)((uint)(_2454) + 1u)), ((int)((uint)(_2455) + 1u)), 0));
    float _2496 = float((bool)((uint)(!(_2460 ^ (_2483.w < 0.0h))))) * _2457;
    half4 _2506 = __3__36__0__0__g_specularResultPrev.Load(int3(((int)((uint)(_2454) + 1u)), _2455, 0));
    float _2519 = float((bool)((uint)(!(_2460 ^ (_2506.w < 0.0h))))) * _2458;
    half4 _2529 = __3__36__0__0__g_specularResultPrev.Load(int3(_2454, _2455, 0));
    float _2542 = float((bool)((uint)(!(_2460 ^ (_2529.w < 0.0h))))) * _2459;
    float _2566 = 1.0f / max(((saturate(_121 * 0.0625f) * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_2476, _2496, _2519, _2542), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    float _2568 = -0.0f - (min(0.0f, (-0.0f - ((((_2476 * float(_2463.x)) + (_2496 * float(_2483.x))) + (_2519 * float(_2506.x))) + (_2542 * float(_2529.x))))) * _2566);
    float _2570 = -0.0f - (min(0.0f, (-0.0f - ((((_2476 * float(_2463.y)) + (_2496 * float(_2483.y))) + (_2519 * float(_2506.y))) + (_2542 * float(_2529.y))))) * _2566);
    float _2572 = -0.0f - (min(0.0f, (-0.0f - ((((_2476 * float(_2463.z)) + (_2496 * float(_2483.z))) + (_2519 * float(_2506.z))) + (_2542 * float(_2529.z))))) * _2566);
    float _2573 = _2566 * min(0.0f, (-0.0f - ((((_2476 * abs(float(_2463.w))) + (_2496 * abs(float(_2483.w)))) + (_2519 * abs(float(_2506.w)))) + (_2542 * abs(float(_2529.w))))));
    if (((_1908 != 54)) && ((((_2131 != 66)) && ((_renderParams.y == 0.0f))))) {
      float _2580 = dot(float3(_2568, _2570, _2572), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _2587 = ((min(_2580, _1701.z) / max(9.999999717180685e-10f, _2580)) * _1706) + saturate(1.0f - _1706);
      _2592 = (_2587 * _2568);
      _2593 = (_2587 * _2570);
      _2594 = (_2587 * _2572);
    } else {
      _2592 = _2568;
      _2593 = _2570;
      _2594 = _2572;
    }
    float _2595 = _2592 * _exposure4.y;
    float _2596 = _2593 * _exposure4.y;
    float _2597 = _2594 * _exposure4.y;
    float _2610 = ((max(0.0010000000474974513f, float(_1865)) + _2573) * _2453) - _2573;
    float _2620 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2137 * _326.x) - _2595) * _2453) + _2595))));
    float _2621 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2137 * _326.y) - _2596) * _2453) + _2596))));
    float _2622 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2137 * _326.z) - _2597) * _2453) + _2597))));
    __3__38__0__1__g_specularResultUAV[int2(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))))] = half4(half(_2620), half(_2621), half(_2622), half(select(_2460, (-0.0f - _2610), _2610)));
    float _2630 = select(_2349, 0.0f, _2610);
    float _2635 = float(half(lerp(_2630, 1.0f, _1929)));
    bool _2636 = (_2131 == 64);
    int _2638 = ((int)(uint)((int)(_180))) ^ 1;
    if ((((int)(uint)((int)(_2636))) & _2638) == 0) {
      _2655 = saturate(exp2((_2635 * _2635) * (_121 * -0.005770780146121979f)));
    } else {
      _2655 = select((_cavityParams.z > 0.0f), select(_180, 0.0f, _422), 1.0f);
    }
    bool _2658 = (_cavityParams.x == 0.0f);
    float _2659 = select(_2658, 1.0f, _2655);
    if (_2636) {
      _2665 = (_2659 * _1857);
      _2666 = (_2659 * _1858);
      _2667 = (_2659 * _1859);
    } else {
      _2665 = _1857;
      _2666 = _1858;
      _2667 = _1859;
    }
    if (((_1908 == 54)) || ((_2131 == 66))) {
      float2 _2682 = __3__36__0__0__g_hairBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, (1.0f - saturate(abs(dot(float3(_950, _951, _952), float3(_399, _400, _401)))))), (1.0f - max(0.75f, (_2635 * 2.0f)))), 0.0f);
      float2 _2688 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1041), (1.0f - _2635)), 0.0f);
      float _2695 = ((_2688.x - _2682.x) * _948) + _2682.x;
      float _2696 = ((_2688.y - _2682.y) * _948) + _2682.y;
      float _2698 = (_2695 * 0.009999999776482582f) + _2696;
      _2862 = _2695;
      _2863 = _2696;
      _2864 = _2698;
      _2865 = _2698;
      _2866 = _2698;
    } else {
      if ((uint)((int)((uint)(_1908) + (uint)(-97))) < (uint)2) {
        if (!(abs(_224) > 0.9900000095367432f)) {
          float _2706 = -0.0f - _225;
          float _2708 = rsqrt(dot(float3(_2706, 0.0f, _223), float3(_2706, 0.0f, _223)));
          _2712 = (_2708 * _2706);
          _2713 = (_2708 * _223);
        } else {
          _2712 = 1.0f;
          _2713 = 0.0f;
        }
        float _2715 = -0.0f - (_224 * _2713);
        float _2718 = (_2713 * _223) - (_2712 * _225);
        float _2719 = _2712 * _224;
        float _2721 = rsqrt(dot(float3(_2715, _2718, _2719), float3(_2715, _2718, _2719)));
        float _2729 = _viewPos.x + _394;
        float _2730 = _viewPos.y + _395;
        float _2731 = _viewPos.z + _396;
        float4 _2736 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_2712, 0.0f, _2713), float3(_2729, _2730, _2731)), dot(float3((_2721 * _2715), (_2718 * _2721), (_2721 * _2719)), float3(_2729, _2730, _2731))), 0.0f);
        float _2740 = _2736.x + -0.5f;
        float _2741 = _2736.y + -0.5f;
        float _2742 = _2736.z + -0.5f;
        float _2744 = rsqrt(dot(float3(_2740, _2741, _2742), float3(_2740, _2741, _2742)));
        float _2748 = (_2740 * _2744) + _351;
        float _2749 = (_2741 * _2744) + _352;
        float _2750 = (_2742 * _2744) + _353;
        float _2752 = rsqrt(dot(float3(_2748, _2749, _2750), float3(_2748, _2749, _2750)));
        float2 _2765 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1041), (1.0f - _2635)), 0.0f);
        float _2772 = _2765.y + (exp2(log2(saturate(dot(float3(_1033, _1034, _1035), float3((_2748 * _2752), (_2749 * _2752), (_2750 * _2752))))) * 512.0f) * 20.0f);
        _2862 = _2765.x;
        _2863 = _2765.y;
        _2864 = (_2772 + (_2765.x * _2665));
        _2865 = (_2772 + (_2765.x * _2666));
        _2866 = (_2772 + (_2765.x * _2667));
      } else {
        if (_2636) {
          if (_1908 == 65) {
            _2845 = _2665;
            _2846 = _2666;
            _2847 = _2667;
            float2 _2852 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1041), (1.0f - _2635)), 0.0f);
            _2862 = _2852.x;
            _2863 = _2852.y;
            _2864 = ((_2852.x * _2845) + _2852.y);
            _2865 = ((_2852.x * _2846) + _2852.y);
            _2866 = ((_2852.x * _2847) + _2852.y);
          } else {
            float _2782 = min(0.9900000095367432f, _1041);
            float2 _2787 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_2782, saturate(1.0f - (_2635 * 1.3300000429153442f))), 0.0f);
            float2 _2792 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_2782, saturate(1.0f - (_2635 * 0.47998046875f))), 0.0f);
            float _2796 = (_2792.x + _2787.x) * 0.5f;
            float _2798 = (_2792.y + _2787.y) * 0.5f;
            _2862 = _2796;
            _2863 = _2798;
            _2864 = ((_2796 * _2665) + _2798);
            _2865 = ((_2796 * _2666) + _2798);
            _2866 = ((_2796 * _2667) + _2798);
          }
        } else {
          if (((_1908 == 33)) || ((_1908 == 55))) {
            float _2815 = max(dot(float3(_1831, _1832, _1833), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
            float _2819 = sqrt(_1831) - _2815;
            float _2820 = sqrt(_1832) - _2815;
            float _2821 = sqrt(_1833) - _2815;
            float _2828 = saturate(1.0f - (pow(_1041, 4.0f)));
            _2845 = ((((_2819 * _1909) + _2815) + (_2828 * (_2819 * (_1911 - _1909)))) * _1910);
            _2846 = ((((_2820 * _1909) + _2815) + ((_2820 * (_1911 - _1909)) * _2828)) * _1910);
            _2847 = ((((_2821 * _1909) + _2815) + ((_2821 * (_1911 - _1909)) * _2828)) * _1910);
          } else {
            _2845 = _2665;
            _2846 = _2666;
            _2847 = _2667;
          }
          float2 _2852 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1041), (1.0f - _2635)), 0.0f);
          _2862 = _2852.x;
          _2863 = _2852.y;
          _2864 = ((_2852.x * _2845) + _2852.y);
          _2865 = ((_2852.x * _2846) + _2852.y);
          _2866 = ((_2852.x * _2847) + _2852.y);
        }
      }
    }
    float _2869 = select(((_2636) || (_2349)), 1.0f, _2659) * _1755;
    float _2876 = _1822 * _1755;
    float _2877 = _1823 * _1755;
    float _2878 = _1824 * _1755;
    bool __defer_2861_3135 = false;
    if ((uint)_953 > (uint)52) {
      if ((((uint)_953 < (uint)68)) || (_993)) {
        _3136 = _1024;
        _3137 = _1025;
        _3138 = _1026;
        _3139 = _1027;
        _3140 = _1028;
        _3141 = _2630;
        __defer_2861_3135 = true;
      } else {
        if (!(((_953 == 6)) || ((((_1029 == 106)) || (((((uint)(_953 + -27) < (uint)2)) || ((((_953 == 105)) || ((_953 == 26)))))))))) {
          if (!(_953 == 7)) {
            float _2903 = exp2(log2(_2630) * (saturate(_121 * 0.03125f) + 1.0f));
            float4 _2913 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110), 0.0f);
            bool __defer_2897_2931 = false;
            bool __branch_chain_2897;
            if (((_953 == 15)) || ((((_1029 == 12)) || (((_953 & -4) == 16))))) {
              _2932 = false;
              _2933 = true;
              __branch_chain_2897 = true;
            } else {
              if (!((uint)_953 > (uint)10)) {
                _2932 = true;
                _2933 = false;
                __branch_chain_2897 = true;
              } else {
                if ((uint)_953 < (uint)20) {
                  _2932 = false;
                  _2933 = false;
                  __branch_chain_2897 = true;
                } else {
                  if (!(_953 == 97)) {
                    _2932 = (_953 != 107);
                    _2933 = false;
                    __branch_chain_2897 = true;
                  } else {
                    _3125 = _1841;
                    _3126 = _1929;
                    _3127 = _1831;
                    _3128 = _1832;
                    _3129 = _1833;
                    __branch_chain_2897 = false;
                  }
                }
              }
            }
            if (__branch_chain_2897) {
              __defer_2897_2931 = true;
            }
            if (__defer_2897_2931) {
              if (_2913.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  bool _2943 = (_953 == 36);
                  if (!_2943) {
                    float4 _2963 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _394) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _396) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _2969 = _2963.x;
                    _2970 = _2963.y;
                    _2971 = _2963.z;
                    _2972 = _2963.w;
                  } else {
                    _2969 = 0.11999999731779099f;
                    _2970 = 0.11999999731779099f;
                    _2971 = 0.10000000149011612f;
                    _2972 = 0.5f;
                  }
                  float _2979 = 1.0f - saturate(((_viewPos.y + _395) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (!(_2979 <= 0.0f)) {
                    float _2982 = saturate(_2903);
                    float _2995 = ((_2970 * 0.3395099937915802f) + (_2969 * 0.6131200194358826f)) + (_2971 * 0.047370001673698425f);
                    float _2996 = ((_2970 * 0.9163600206375122f) + (_2969 * 0.07020000368356705f)) + (_2971 * 0.013450000435113907f);
                    float _2997 = ((_2970 * 0.10958000272512436f) + (_2969 * 0.02061999961733818f)) + (_2971 * 0.8697999715805054f);
                    float _3002 = select(_2933, 1.0f, float((bool)(uint)(saturate(dot(float3(_351, _352, _353), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                    if (_enableSandAO == 1) {
                      float _3007 = 1.0f - _2913.x;
                      if (_2943) {
                        _3038 = ((((_3007 * 10.0f) * _2972) * _2979) * _2982);
                        _3041 = _2995;
                        _3042 = _2996;
                        _3043 = _2997;
                        _3044 = saturate(_3038);
                      } else {
                        float _3018 = saturate(_2972 + -0.5f);
                        _3041 = _2995;
                        _3042 = _2996;
                        _3043 = _2997;
                        _3044 = ((((_3018 * 2.0f) * max((_3002 * _2913.x), min((_2982 * ((_2913.x * 7.0f) + 3.0f)), (_3018 * 40.0f)))) + (((_3007 * 10.0f) * _2982) * saturate((0.5f - _2972) * 2.0f))) * _2979);
                      }
                    } else {
                      float _3036 = ((_2979 * _2972) * _2913.x) * _3002;
                      if (_2943) {
                        _3038 = _3036;
                        _3041 = _2995;
                        _3042 = _2996;
                        _3043 = _2997;
                        _3044 = saturate(_3038);
                      } else {
                        _3041 = _2995;
                        _3042 = _2996;
                        _3043 = _2997;
                        _3044 = _3036;
                      }
                    }
                  } else {
                    _3041 = 0.0f;
                    _3042 = 0.0f;
                    _3043 = 0.0f;
                    _3044 = 0.0f;
                  }
                  float _3048 = ((1.0f - _2913.w) * (1.0f - _2913.y)) * _3044;
                  bool _3049 = (_3048 > 9.999999747378752e-05f);
                  if (_3049) {
                    if (_2933) {
                      float _3052 = saturate(_3048);
                      _3079 = (((sqrt(_3041 * _1831) - _1831) * _3052) + _1831);
                      _3080 = (((sqrt(_3042 * _1832) - _1832) * _3052) + _1832);
                      _3081 = (((sqrt(_3043 * _1833) - _1833) * _3052) + _1833);
                    } else {
                      _3079 = ((_3048 * (_3041 - _1831)) + _1831);
                      _3080 = ((_3048 * (_3042 - _1832)) + _1832);
                      _3081 = ((_3048 * (_3043 - _1833)) + _1833);
                    }
                  } else {
                    _3079 = _1831;
                    _3080 = _1832;
                    _3081 = _1833;
                  }
                  if ((_2943) && (_3049)) {
                    if (_2933) {
                      _3096 = (((sqrt(_1929 * 0.25f) - _1929) * saturate(_3048)) + _1929);
                    } else {
                      _3096 = ((_3048 * (0.25f - _1929)) + _1929);
                    }
                  } else {
                    _3096 = _1929;
                  }
                  float _3097 = saturate(_3079);
                  float _3098 = saturate(_3080);
                  float _3099 = saturate(_3081);
                  float _3104 = (_3096 * (1.0f - _2903)) + _2903;
                  float _3107 = ((_3096 - _3104) * _2913.y) + _3104;
                  float _3114 = (((_2903 * _2903) * _2913.z) * float((bool)(uint)(_2932))) * saturate(dot(float3(_351, _352, _353), float3(0.0f, 1.0f, 0.0f)));
                  float _3115 = _3114 * -0.5f;
                  _3125 = (_1841 - (_2903 * _1841));
                  _3126 = (_3107 - (_3114 * _3107));
                  _3127 = ((_3115 * _3097) + _3097);
                  _3128 = ((_3115 * _3098) + _3098);
                  _3129 = ((_3115 * _3099) + _3099);
                } else {
                  _3125 = _1841;
                  _3126 = _1929;
                  _3127 = _1831;
                  _3128 = _1832;
                  _3129 = _1833;
                }
              } else {
                _3125 = _1841;
                _3126 = _1929;
                _3127 = _1831;
                _3128 = _1832;
                _3129 = _1833;
              }
            }
            _3136 = half(_3125);
            _3137 = half(_3126);
            _3138 = half(_3127);
            _3139 = half(_3128);
            _3140 = half(_3129);
            _3141 = _2903;
          } else {
            _3136 = _1024;
            _3137 = _1025;
            _3138 = _1026;
            _3139 = _1027;
            _3140 = _1028;
            _3141 = _2630;
          }
          __defer_2861_3135 = true;
        } else {
          _3147 = _2630;
          _3148 = _1026;
          _3149 = _1027;
          _3150 = _1028;
          _3151 = _1025;
          _3152 = _1024;
          _3153 = _2876;
          _3154 = _2877;
          _3155 = _2878;
          _3156 = 0.0f;
          _3157 = 0.0f;
          _3158 = 0.0f;
        }
      }
    } else {
      if (_993) {
        _3136 = _1024;
        _3137 = _1025;
        _3138 = _1026;
        _3139 = _1027;
        _3140 = _1028;
        _3141 = _2630;
        __defer_2861_3135 = true;
      } else {
        if (!(((_953 == 6)) || ((((_1029 == 106)) || (((((uint)(_953 + -27) < (uint)2)) || ((((_953 == 105)) || ((_953 == 26)))))))))) {
          if (!(_953 == 7)) {
            float _2903 = exp2(log2(_2630) * (saturate(_121 * 0.03125f) + 1.0f));
            float4 _2913 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110), 0.0f);
            bool __defer_2897_2931 = false;
            bool __branch_chain_2897;
            if (((_953 == 15)) || ((((_1029 == 12)) || (((_953 & -4) == 16))))) {
              _2932 = false;
              _2933 = true;
              __branch_chain_2897 = true;
            } else {
              if (!((uint)_953 > (uint)10)) {
                _2932 = true;
                _2933 = false;
                __branch_chain_2897 = true;
              } else {
                if ((uint)_953 < (uint)20) {
                  _2932 = false;
                  _2933 = false;
                  __branch_chain_2897 = true;
                } else {
                  if (!(_953 == 97)) {
                    _2932 = (_953 != 107);
                    _2933 = false;
                    __branch_chain_2897 = true;
                  } else {
                    _3125 = _1841;
                    _3126 = _1929;
                    _3127 = _1831;
                    _3128 = _1832;
                    _3129 = _1833;
                    __branch_chain_2897 = false;
                  }
                }
              }
            }
            if (__branch_chain_2897) {
              __defer_2897_2931 = true;
            }
            if (__defer_2897_2931) {
              if (_2913.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  bool _2943 = (_953 == 36);
                  if (!_2943) {
                    float4 _2963 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _394) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _396) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _2969 = _2963.x;
                    _2970 = _2963.y;
                    _2971 = _2963.z;
                    _2972 = _2963.w;
                  } else {
                    _2969 = 0.11999999731779099f;
                    _2970 = 0.11999999731779099f;
                    _2971 = 0.10000000149011612f;
                    _2972 = 0.5f;
                  }
                  float _2979 = 1.0f - saturate(((_viewPos.y + _395) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (!(_2979 <= 0.0f)) {
                    float _2982 = saturate(_2903);
                    float _2995 = ((_2970 * 0.3395099937915802f) + (_2969 * 0.6131200194358826f)) + (_2971 * 0.047370001673698425f);
                    float _2996 = ((_2970 * 0.9163600206375122f) + (_2969 * 0.07020000368356705f)) + (_2971 * 0.013450000435113907f);
                    float _2997 = ((_2970 * 0.10958000272512436f) + (_2969 * 0.02061999961733818f)) + (_2971 * 0.8697999715805054f);
                    float _3002 = select(_2933, 1.0f, float((bool)(uint)(saturate(dot(float3(_351, _352, _353), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                    if (_enableSandAO == 1) {
                      float _3007 = 1.0f - _2913.x;
                      if (_2943) {
                        _3038 = ((((_3007 * 10.0f) * _2972) * _2979) * _2982);
                        _3041 = _2995;
                        _3042 = _2996;
                        _3043 = _2997;
                        _3044 = saturate(_3038);
                      } else {
                        float _3018 = saturate(_2972 + -0.5f);
                        _3041 = _2995;
                        _3042 = _2996;
                        _3043 = _2997;
                        _3044 = ((((_3018 * 2.0f) * max((_3002 * _2913.x), min((_2982 * ((_2913.x * 7.0f) + 3.0f)), (_3018 * 40.0f)))) + (((_3007 * 10.0f) * _2982) * saturate((0.5f - _2972) * 2.0f))) * _2979);
                      }
                    } else {
                      float _3036 = ((_2979 * _2972) * _2913.x) * _3002;
                      if (_2943) {
                        _3038 = _3036;
                        _3041 = _2995;
                        _3042 = _2996;
                        _3043 = _2997;
                        _3044 = saturate(_3038);
                      } else {
                        _3041 = _2995;
                        _3042 = _2996;
                        _3043 = _2997;
                        _3044 = _3036;
                      }
                    }
                  } else {
                    _3041 = 0.0f;
                    _3042 = 0.0f;
                    _3043 = 0.0f;
                    _3044 = 0.0f;
                  }
                  float _3048 = ((1.0f - _2913.w) * (1.0f - _2913.y)) * _3044;
                  bool _3049 = (_3048 > 9.999999747378752e-05f);
                  if (_3049) {
                    if (_2933) {
                      float _3052 = saturate(_3048);
                      _3079 = (((sqrt(_3041 * _1831) - _1831) * _3052) + _1831);
                      _3080 = (((sqrt(_3042 * _1832) - _1832) * _3052) + _1832);
                      _3081 = (((sqrt(_3043 * _1833) - _1833) * _3052) + _1833);
                    } else {
                      _3079 = ((_3048 * (_3041 - _1831)) + _1831);
                      _3080 = ((_3048 * (_3042 - _1832)) + _1832);
                      _3081 = ((_3048 * (_3043 - _1833)) + _1833);
                    }
                  } else {
                    _3079 = _1831;
                    _3080 = _1832;
                    _3081 = _1833;
                  }
                  if ((_2943) && (_3049)) {
                    if (_2933) {
                      _3096 = (((sqrt(_1929 * 0.25f) - _1929) * saturate(_3048)) + _1929);
                    } else {
                      _3096 = ((_3048 * (0.25f - _1929)) + _1929);
                    }
                  } else {
                    _3096 = _1929;
                  }
                  float _3097 = saturate(_3079);
                  float _3098 = saturate(_3080);
                  float _3099 = saturate(_3081);
                  float _3104 = (_3096 * (1.0f - _2903)) + _2903;
                  float _3107 = ((_3096 - _3104) * _2913.y) + _3104;
                  float _3114 = (((_2903 * _2903) * _2913.z) * float((bool)(uint)(_2932))) * saturate(dot(float3(_351, _352, _353), float3(0.0f, 1.0f, 0.0f)));
                  float _3115 = _3114 * -0.5f;
                  _3125 = (_1841 - (_2903 * _1841));
                  _3126 = (_3107 - (_3114 * _3107));
                  _3127 = ((_3115 * _3097) + _3097);
                  _3128 = ((_3115 * _3098) + _3098);
                  _3129 = ((_3115 * _3099) + _3099);
                } else {
                  _3125 = _1841;
                  _3126 = _1929;
                  _3127 = _1831;
                  _3128 = _1832;
                  _3129 = _1833;
                }
              } else {
                _3125 = _1841;
                _3126 = _1929;
                _3127 = _1831;
                _3128 = _1832;
                _3129 = _1833;
              }
            }
            _3136 = half(_3125);
            _3137 = half(_3126);
            _3138 = half(_3127);
            _3139 = half(_3128);
            _3140 = half(_3129);
            _3141 = _2903;
          } else {
            _3136 = _1024;
            _3137 = _1025;
            _3138 = _1026;
            _3139 = _1027;
            _3140 = _1028;
            _3141 = _2630;
          }
          __defer_2861_3135 = true;
        } else {
          _3147 = _2630;
          _3148 = _1026;
          _3149 = _1027;
          _3150 = _1028;
          _3151 = _1025;
          _3152 = _1024;
          _3153 = _2876;
          _3154 = _2877;
          _3155 = _2878;
          _3156 = 0.0f;
          _3157 = 0.0f;
          _3158 = 0.0f;
        }
      }
    }
    if (__defer_2861_3135) {
      if (_1032) {
        _3147 = _3141;
        _3148 = _3138;
        _3149 = _3139;
        _3150 = _3140;
        _3151 = _3137;
        _3152 = _3136;
        _3153 = 0.0f;
        _3154 = 0.0f;
        _3155 = 0.0f;
        _3156 = (_2876 * _954);
        _3157 = (_2877 * _955);
        _3158 = (_2878 * _956);
      } else {
        _3147 = _3141;
        _3148 = _3138;
        _3149 = _3139;
        _3150 = _3140;
        _3151 = _3137;
        _3152 = _3136;
        _3153 = _2876;
        _3154 = _2877;
        _3155 = _2878;
        _3156 = 0.0f;
        _3157 = 0.0f;
        _3158 = 0.0f;
      }
    }
    half4 _3160 = __3__36__0__0__g_sceneShadowColor.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
    [branch]
    if (_993) {
      uint _3167 = __3__36__0__0__g_sceneNormal.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
      float _3183 = min(1.0f, ((float((uint)((uint)(_3167.x & 1023))) * 0.001956947147846222f) + -1.0f));
      float _3184 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_3167.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _3185 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_3167.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _3187 = rsqrt(dot(float3(_3183, _3184, _3185), float3(_3183, _3184, _3185)));
      _3195 = half(_3187 * _3183);
      _3196 = half(_3187 * _3184);
      _3197 = half(_3187 * _3185);
    } else {
      _3195 = _294;
      _3196 = _295;
      _3197 = _296;
    }
    bool _3200 = (_sunDirection.y > 0.0f);
    if ((_3200) || ((!(_3200)) && (_sunDirection.y > _moonDirection.y))) {
      _3212 = _sunDirection.x;
      _3213 = _sunDirection.y;
      _3214 = _sunDirection.z;
    } else {
      _3212 = _moonDirection.x;
      _3213 = _moonDirection.y;
      _3214 = _moonDirection.z;
    }
    if ((_3200) || ((!(_3200)) && (_sunDirection.y > _moonDirection.y))) {
      _3234 = _precomputedAmbient7.y;
    } else {
      _3234 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    float _3239 = _viewPos.y + _395;
    float _3240 = _3239 + _earthRadius;
    float _3244 = (_396 * _396) + (_394 * _394);
    float _3246 = sqrt((_3240 * _3240) + _3244);
    float _3251 = dot(float3((_394 / _3246), (_3240 / _3246), (_396 / _3246)), float3(_3212, _3213, _3214));
    float _3256 = min(max(((_3246 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    float _3264 = max(_3256, 0.0f);
    float _3271 = (-0.0f - sqrt((_3264 + (_earthRadius * 2.0f)) * _3264)) / (_3264 + _earthRadius);
    if (_3251 > _3271) {
      _3294 = ((exp2(log2(saturate((_3251 - _3271) / (1.0f - _3271))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _3294 = ((exp2(log2(saturate((_3271 - _3251) / (_3271 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
    float2 _3299 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_3256 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _3294), 0.0f);
    float _3321 = ((_3299.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
    float _3339 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _3299.x) + _3321) * -1.4426950216293335f);
    float _3340 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _3299.x) + _3321) * -1.4426950216293335f);
    float _3341 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((uint)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _3299.x) + _3321) * -1.4426950216293335f);
    float _3357 = sqrt(_3244);
    float _3365 = (_cloudAltitude - (max(((_3357 * _3357) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    float _3377 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_3213 > 0.0f))) - ((int)(uint)((int)(_3213 < 0.0f))))) * 0.5f))) + _3365;
    if (_395 < _3365) {
      float _3380 = dot(float3(0.0f, 1.0f, 0.0f), float3(_3212, _3213, _3214));
      float _3386 = select((abs(_3380) < 9.99999993922529e-09f), 1e+08f, ((_3377 - dot(float3(0.0f, 1.0f, 0.0f), float3(_394, _395, _396))) / _3380));
      _3392 = ((_3386 * _3212) + _394);
      _3393 = _3377;
      _3394 = ((_3386 * _3214) + _396);
    } else {
      _3392 = _394;
      _3393 = _395;
      _3394 = _396;
    }
    float _3403 = __3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_3392 * 4.999999873689376e-05f) + 0.5f), ((_3393 - _3365) / _cloudThickness), ((_3394 * 4.999999873689376e-05f) + 0.5f)), 0.0f);
    float _3414 = saturate(abs(_3213) * 4.0f);
    float _3416 = (_3414 * _3414) * exp2(((_distanceScale * -1.4426950216293335f) * _3403.x) * (_cloudScatteringCoefficient / _distanceScale));
    float _3423 = ((1.0f - _3416) * saturate(((_395 - _cloudThickness) - _3365) * 0.10000000149011612f)) + _3416;
    float _3424 = _3423 * (((_3340 * 0.3395099937915802f) + (_3339 * 0.6131200194358826f)) + (_3341 * 0.047370001673698425f));
    float _3425 = _3423 * (((_3340 * 0.9163600206375122f) + (_3339 * 0.07020000368356705f)) + (_3341 * 0.013450000435113907f));
    float _3426 = _3423 * (((_3340 * 0.10958000272512436f) + (_3339 * 0.02061999961733818f)) + (_3341 * 0.8697999715805054f));
    float _3442 = (((_3424 * 0.6131200194358826f) + (_3425 * 0.3395099937915802f)) + (_3426 * 0.047370001673698425f)) * _3234;
    float _3443 = (((_3424 * 0.07020000368356705f) + (_3425 * 0.9163600206375122f)) + (_3426 * 0.013450000435113907f)) * _3234;
    float _3444 = (((_3424 * 0.02061999961733818f) + (_3425 * 0.10958000272512436f)) + (_3426 * 0.8697999715805054f)) * _3234;
    float _3450 = float(_967.x);
    float _3451 = float(_3160.x);
    float _3452 = float(_3160.y);
    float _3453 = float(_3160.z);
    float _3454 = float(_3148);
    float _3455 = float(_3149);
    float _3456 = float(_3150);
    if (!_1869) {
      _3462 = ((_179) && (((uint)(_953 + -105) < (uint)2)));
    } else {
      _3462 = true;
    }
    float _3464 = float(max(0.010002136h, _3151));
    float _3465 = float(_3152);
    bool _3468 = (_953 == 107);
    bool _3471 = (_987) || (((((uint)(_953 + -11) < (uint)9)) || (((_3468) || (_3462)))));
    float _3472 = select(_3471, 0.0f, _3465);
    if (((_1029 == 26)) || ((((_953 == 105)) || ((_953 == 28))))) {
      _3484 = true;
      _3486 = _3484;
      _3487 = _3468;
    } else {
      bool _3481 = (_953 == 106);
      if (!(_953 == 19)) {
        _3484 = _3481;
        _3486 = _3484;
        _3487 = _3468;
      } else {
        _3486 = _3481;
        _3487 = true;
      }
    }
    float _3488 = float(_3195);
    float _3489 = float(_3196);
    float _3490 = float(_3197);
    uint16_t _3492 = __3__36__0__0__g_sceneDecalMask.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
    if (_953 == 97) {
      _3504 = (float((uint16_t)((uint)((uint16_t)((uint)(_3492.x)) >> 2))) * 0.01587301678955555f);
      _3505 = (((uint)((uint)((int)(min16uint)((int)((int)(_3492.x) & 2)))) >> 1) + 97);
      _3506 = 0.0f;
      _3507 = 0.0f;
      _3508 = 0.0f;
      _3509 = 0.0f;
      _3510 = 0.0f;
    } else {
      _3504 = select(_3471, _3465, 0.0f);
      _3505 = _953;
      _3506 = _458;
      _3507 = _459;
      _3508 = _460;
      _3509 = _461;
      _3510 = _462;
    }
    float _3515 = float(saturate(_199));
    float _3516 = _3515 * _3515;
    float _3517 = _3516 * _3516;
    float _3518 = _3517 * _3517;
    float4 _3525 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _104), (_bufferSizeAndInvSize.w * _105)), 0.0f);
    float _3529 = ((_3518 * _3518) * select((((_953 == 29)) || (((_3486) || (_3487)))), 0.0f, 1.0f)) * _3525.y;
    float _3534 = _3488 - (_3529 * _3488);
    float _3535 = (_3529 * (1.0f - _3489)) + _3489;
    float _3536 = _3490 - (_3529 * _3490);
    float _3538 = rsqrt(dot(float3(_3534, _3535, _3536), float3(_3534, _3535, _3536)));
    float _3539 = _3534 * _3538;
    float _3540 = _3535 * _3538;
    float _3541 = _3536 * _3538;
    bool _3542 = (_3505 == 53);
    if (_3542) {
      _3549 = saturate(((_3455 + _3454) + _3456) * 1.2000000476837158f);
    } else {
      _3549 = 1.0f;
    }
    float _3555 = (0.699999988079071f / min(max(max(max(_3454, _3455), _3456), 0.009999999776482582f), 0.699999988079071f)) * _3549;
    float _3565 = (((_3555 * _3454) + -0.03999999910593033f) * _3472) + 0.03999999910593033f;
    float _3566 = (((_3555 * _3455) + -0.03999999910593033f) * _3472) + 0.03999999910593033f;
    float _3567 = (((_3555 * _3456) + -0.03999999910593033f) * _3472) + 0.03999999910593033f;
    float _3568 = float(_3151);
    int _3569 = _3505 & -2;
    bool _3570 = (_3569 == 64);
    bool _3573 = ((((int)(uint)((int)(_3570))) & _2638) == 0);
    if (_3573) {
      _3586 = saturate(exp2((_3568 * _3568) * (_121 * -0.005770780146121979f)));
    } else {
      _3586 = select((_cavityParams.z > 0.0f), select(_180, 0.0f, _422), 1.0f);
    }
    float _3587 = select(_2658, 1.0f, _3586);
    if (_3570) {
      _3593 = (_3587 * _3565);
      _3594 = (_3587 * _3566);
      _3595 = (_3587 * _3567);
    } else {
      _3593 = _3565;
      _3594 = _3566;
      _3595 = _3567;
    }
    float _3596 = _3464 * _3464;
    float _3597 = _3596 * _3596;
    bool _3599 = ((uint)(_3505 + -97) < (uint)2);
    float _3601 = select(_3599, 0.5f, (_3464 * 0.60009765625f));
    float _3602 = _3601 * _3601;
    float _3603 = _3602 * _3602;
    bool _3604 = (_3505 == 33);
    bool __defer_3592_3617 = false;
    if (!_3604) {
      bool _3606 = (_3505 == 55);
      int _3607 = (int)(uint)((int)(_3606));
      bool __defer_3605_3615 = false;
      if (((_3505 == 98)) || ((_3569 == 96))) {
        _3616 = true;
        __defer_3605_3615 = true;
      } else {
        if ((uint)(_3505 + -105) < (uint)2) {
          if (_3606) {
            _3618 = _179;
            __defer_3592_3617 = true;
          } else {
            _3633 = _179;
            _3634 = _3607;
            _3635 = 0.0f;
            _3638 = _3635;
            _3639 = _3634;
            _3640 = _3633;
            _3641 = (_3505 == 7);
          }
        } else {
          _3616 = false;
          __defer_3605_3615 = true;
        }
      }
      if (__defer_3605_3615) {
        if (_3606) {
          _3618 = _3616;
          __defer_3592_3617 = true;
        } else {
          _3622 = _3616;
          _3623 = _3607;
          _3624 = 0.0f;
        }
        if ((uint)_3505 > (uint)11) {
          if (!((((uint)_3505 < (uint)21)) || ((_3505 == 107)))) {
            _3633 = _3622;
            _3634 = _3623;
            _3635 = _3624;
            _3638 = _3635;
            _3639 = _3634;
            _3640 = _3633;
            _3641 = (_3505 == 7);
          } else {
            _3638 = _3624;
            _3639 = _3623;
            _3640 = _3622;
            _3641 = true;
          }
        } else {
          if (!(_3505 == 6)) {
            _3633 = _3622;
            _3634 = _3623;
            _3635 = _3624;
            _3638 = _3635;
            _3639 = _3634;
            _3640 = _3633;
            _3641 = (_3505 == 7);
          } else {
            _3638 = _3624;
            _3639 = _3623;
            _3640 = _3622;
            _3641 = true;
          }
        }
      }
    } else {
      _3618 = false;
      __defer_3592_3617 = true;
    }
    if (__defer_3592_3617) {
      _3622 = _3618;
      _3623 = ((int)(uint)((int)(_3506 > 0.0f)));
      _3624 = _3506;
      if ((uint)_3505 > (uint)11) {
        if (!((((uint)_3505 < (uint)21)) || ((_3505 == 107)))) {
          _3633 = _3622;
          _3634 = _3623;
          _3635 = _3624;
          _3638 = _3635;
          _3639 = _3634;
          _3640 = _3633;
          _3641 = (_3505 == 7);
        } else {
          _3638 = _3624;
          _3639 = _3623;
          _3640 = _3622;
          _3641 = true;
        }
      } else {
        if (!(_3505 == 6)) {
          _3633 = _3622;
          _3634 = _3623;
          _3635 = _3624;
          _3638 = _3635;
          _3639 = _3634;
          _3640 = _3633;
          _3641 = (_3505 == 7);
        } else {
          _3638 = _3624;
          _3639 = _3623;
          _3640 = _3622;
          _3641 = true;
        }
      }
    }
    float _3646 = exp2(log2(float(_3160.w)) * 2.200000047683716f) * 1000.0f;
    if ((_3200) || ((!(_3200)) && (_sunDirection.y > _moonDirection.y))) {
      _3658 = _sunDirection.x;
      _3659 = _sunDirection.y;
      _3660 = _sunDirection.z;
    } else {
      _3658 = _moonDirection.x;
      _3659 = _moonDirection.y;
      _3660 = _moonDirection.z;
    }
    float _3661 = _3442 * _lightingParams.x;
    float _3662 = _3443 * _lightingParams.x;
    float _3663 = _3444 * _lightingParams.x;
    float _3664 = _3658 - _399;
    float _3665 = _3659 - _400;
    float _3666 = _3660 - _401;
    float _3668 = rsqrt(dot(float3(_3664, _3665, _3666), float3(_3664, _3665, _3666)));
    float _3669 = _3668 * _3664;
    float _3670 = _3668 * _3665;
    float _3671 = _3668 * _3666;
    float _3672 = dot(float3(_3488, _3489, _3490), float3(_3658, _3659, _3660));
    float _3673 = dot(float3(_3539, _3540, _3541), float3(_3658, _3659, _3660));
    float _3675 = saturate(dot(float3(_3488, _3489, _3490), float3(_1033, _1034, _1035)));
    float _3677 = saturate(dot(float3(_3539, _3540, _3541), float3(_3669, _3670, _3671)));
    float _3678 = dot(float3(_1033, _1034, _1035), float3(_3669, _3670, _3671));
    float _3680 = saturate(dot(float3(_3658, _3659, _3660), float3(_3669, _3670, _3671)));
    bool _3681 = (_3569 == 66);
    bool _3682 = (_3505 == 54);
    bool _3683 = (_3682) || (_3681);
    if (_3683) {
      if (_3682) {
        _3700 = (((asfloat(_globalLightParams.z) * _3464) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_166)));
      } else {
        _3700 = _bevelParams.y;
      }
      float _3718 = (sqrt(_3244 + (_395 * _395)) * 2.0f) + 1.0f;
      float _3722 = (_948 * 7.0f) + 1.0f;
      float4 _3727 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2((((dot(float3(_394, _395, _396), float3(((_952 * _224) - (_951 * _225)), ((_950 * _225) - (_952 * _223)), ((_951 * _223) - (_950 * _224)))) * 2.0f) / _3718) * _3722), (((dot(float3(_394, _395, _396), float3(_950, _951, _952)) * 0.5f) / _3718) * _3722)), 0.0f);
      float _3731 = _948 * 0.5f;
      float _3732 = _3727.x * 2.0f;
      float _3733 = _3727.y * 2.0f;
      float _3734 = _3727.z * 2.0f;
      float _3745 = dot(float3(_950, _951, _952), float3(_3658, _3659, _3660));
      float _3746 = dot(float3(_950, _951, _952), float3(_1033, _1034, _1035));
      float _3752 = cos(abs(asin(_3746) - asin(_3745)) * 0.5f);
      float _3756 = _3658 - (_3745 * _950);
      float _3757 = _3659 - (_3745 * _951);
      float _3758 = _3660 - (_3745 * _952);
      float _3762 = _1033 - (_3746 * _950);
      float _3763 = _1034 - (_3746 * _951);
      float _3764 = _1035 - (_3746 * _952);
      float _3771 = rsqrt((dot(float3(_3762, _3763, _3764), float3(_3762, _3763, _3764)) * dot(float3(_3756, _3757, _3758), float3(_3756, _3757, _3758))) + 9.999999747378752e-05f) * dot(float3(_3756, _3757, _3758), float3(_3762, _3763, _3764));
      float _3775 = sqrt(saturate((_3771 * 0.5f) + 0.5f));
      float _3782 = min(max(max(0.05000000074505806f, _3464), 0.09803921729326248f), 1.0f);
      float _3783 = _3782 * _3782;
      float _3784 = _3783 * 0.5f;
      float _3785 = _3783 * 2.0f;
      float _3786 = _3746 + _3745;
      float _3787 = _3786 + (_3700 * 2.0f);
      float _3789 = (_3775 * 1.4142135381698608f) * _3783;
      float _3803 = 1.0f - sqrt(saturate((dot(float3(_1033, _1034, _1035), float3(_3658, _3659, _3660)) * 0.5f) + 0.5f));
      float _3804 = _3803 * _3803;
      float _3811 = _3786 - _3700;
      float _3820 = 1.0f / ((1.190000057220459f / _3752) + (_3752 * 0.36000001430511475f));
      float _3825 = ((_3820 * (0.6000000238418579f - (_3771 * 0.800000011920929f))) + 1.0f) * _3775;
      float _3831 = 1.0f - (sqrt(saturate(1.0f - (_3825 * _3825))) * _3752);
      float _3832 = _3831 * _3831;
      float _3836 = 0.9534794092178345f - ((_3832 * _3832) * (_3831 * 0.9534794092178345f));
      float _3837 = _3820 * _3825;
      float _3842 = (sqrt(1.0f - (_3837 * _3837)) * 0.5f) / _3752;
      float _3843 = log2(_3454);
      float _3844 = log2(_3455);
      float _3845 = log2(_3456);
      float _3857 = ((_3836 * _3836) * (exp2((((_3811 * _3811) * -0.5f) / (_3784 * _3784)) * 1.4426950216293335f) / (_3783 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_3771 * 5.2658371925354f));
      float _3861 = _3786 - (_3700 * 4.0f);
      float _3871 = 1.0f - (_3752 * 0.5f);
      float _3872 = _3871 * _3871;
      float _3876 = (_3872 * _3872) * (0.9534794092178345f - (_3752 * 0.47673970460891724f));
      float _3878 = 0.9534794092178345f - _3876;
      float _3879 = 0.800000011920929f / _3752;
      float _3892 = (((_3878 * _3878) * (_3876 + 0.04652056470513344f)) * (exp2((((_3861 * _3861) * -0.5f) / (_3785 * _3785)) * 1.4426950216293335f) / (_3783 * 5.013256549835205f))) * exp2((_3771 * 24.525815963745117f) + -24.208423614501953f);
      float _3899 = saturate(_3673);
      float _3900 = (((_3775 * 0.25f) * (exp2((((_3787 * _3787) * -0.5f) / (_3789 * _3789)) * 1.4426950216293335f) / (_3789 * 2.5066282749176025f))) * (((_3804 * _3804) * (_3803 * 0.9534794092178345f)) + 0.04652056470513344f)) * _3899;
      float _3910 = -0.0f - _3899;
      float _3921 = saturate((_3673 + 1.0f) * 0.25f);
      float _3926 = max(0.0010000000474974513f, dot(float3(_3454, _3455, _3456), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f)));
      float _3945 = ((((1.0f - abs(_3673)) - _3921) * 0.33000001311302185f) + _3921) * 0.07957746833562851f;
      float _3947 = (exp2(log2(_3454 / _3926) * (1.0f - _3451)) * _3945) * sqrt(_3454);
      float _3949 = (exp2(log2(_3455 / _3926) * (1.0f - _3452)) * _3945) * sqrt(_3455);
      float _3951 = (exp2(log2(_3456 / _3926) * (1.0f - _3453)) * _3945) * sqrt(_3456);
      float _3958 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3892 * exp2(_3879 * _3843)) + (_3857 * exp2(_3843 * _3842))) * _3910)))));
      float _3959 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3892 * exp2(_3879 * _3844)) + (_3857 * exp2(_3844 * _3842))) * _3910)))));
      float _3960 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3892 * exp2(_3879 * _3845)) + (_3857 * exp2(_3845 * _3842))) * _3910)))));
      float _3967 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3732, 1.0f, _3731)) * _3900))) * _3451));
      float _3968 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3733, 1.0f, _3731)) * _3900))) * _3452));
      float _3969 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3734, 1.0f, _3731)) * _3900))) * _3453));
      if (!_3681) {
        _3971 = _3958;
        _3972 = _3959;
        _3973 = _3960;
        _3974 = _3967;
        _3975 = _3968;
        _3976 = _3969;
        _3977 = _3947;
        _3978 = _3949;
        _3979 = _3951;
      } else {
        _4389 = _3958;
        _4390 = _3959;
        _4391 = _3960;
        _4392 = _3967;
        _4393 = _3968;
        _4394 = _3969;
        _4395 = _3947;
        _4396 = _3949;
        _4397 = _3951;
      }
    } else {
      _3971 = 0.0f;
      _3972 = 0.0f;
      _3973 = 0.0f;
      _3974 = 0.0f;
      _3975 = 0.0f;
      _3976 = 0.0f;
      _3977 = 0.0f;
      _3978 = 0.0f;
      _3979 = 0.0f;
    }
    if (!_3682) {
      bool _3981 = (_3639 == 0);
      bool __defer_3980_4148 = false;
      if (_3981) {
        if (((_3672 > 0.0f)) || ((_3673 > 0.0f))) {
          _4149 = 0.0f;
          _4150 = 0.0f;
          _4151 = 0.0f;
          _4152 = 0.0f;
          _4153 = 0.0f;
          _4154 = 0.0f;
          _4155 = 0.0f;
          _4156 = 0.0f;
          _4157 = 0.0f;
          __defer_3980_4148 = true;
        } else {
          _4389 = _3971;
          _4390 = _3972;
          _4391 = _3973;
          _4392 = _3974;
          _4393 = _3975;
          _4394 = _3976;
          _4395 = _3977;
          _4396 = _3978;
          _4397 = _3979;
        }
      } else {
        float _3996 = (saturate(_3672) * 0.31830987334251404f) * (((saturate(1.0f - _effectiveMetallicForVelvet) + -1.0f) * _3510) + 1.0f);
        float _4002 = max(dot(float3(_3454, _3455, _3456), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
        float _4003 = sqrt(_3454);
        float _4004 = sqrt(_3455);
        float _4005 = sqrt(_3456);
        float _4006 = _4003 - _4002;
        float _4007 = _4004 - _4002;
        float _4008 = _4005 - _4002;
        float _4015 = saturate(1.0f - (pow(_3675, 4.0f)));
        float _4028 = (((_4007 * _3507) + _4002) + ((_4007 * (_3510 - _3507)) * _4015)) * _3508;
        float _4031 = saturate(1.0f - saturate(_3678));
        float _4032 = _4031 * _4031;
        float _4034 = (_4032 * _4032) * _4031;
        float _4037 = _4034 * saturate(_4028 * 50.0f);
        float _4038 = 1.0f - _4034;
        float _4039 = _4038 * _3508;
        float _4043 = (_4039 * (((_4006 * _3507) + _4002) + (_4015 * (_4006 * (_3510 - _3507))))) + _4037;
        float _4044 = (_4038 * _4028) + _4037;
        float _4045 = (_4039 * (((_4008 * _3507) + _4002) + ((_4008 * (_3510 - _3507)) * _4015))) + _4037;
        float _4046 = min(_3677, 0.9998999834060669f);
        float _4047 = _4046 * _4046;
        float _4048 = 1.0f - _4047;
        float _4060 = (((exp2(((-0.0f - _4047) / (_4048 * _3597)) * 1.4426950216293335f) * 4.0f) / (_4048 * _4048)) + 1.0f) / ((_3597 * 12.566370964050293f) + 3.1415927410125732f);
        float _4064 = ((_3675 + _3673) - (_3675 * _3673)) * 4.0f;
        float _4068 = (_4043 * _4060) / _4064;
        float _4069 = (_4044 * _4060) / _4064;
        float _4070 = (_4045 * _4060) / _4064;
        float _4071 = 1.0f - _3596;
        float _4083 = (((_3677 * _3597) - _3677) * _3677) + 1.0f;
        float _4087 = (_3597 / ((_4083 * _4083) * 3.1415927410125732f)) * (0.5f / ((((_3675 * _4071) + _3596) * _3672) + (_3675 * ((_3672 * _4071) + _3596))));
        float _4103 = saturate(_3673);
        float _4108 = (_3509 * 1.5f) + 2.5f;
        float _4109 = _4108 * _4108;
        float _4119 = (max(0.0f, (0.30000001192092896f - _3672)) * 0.25f) * ((exp2(_4109 * -0.48089835047721863f) * 3.0f) + exp2(_4109 * -1.4426950216293335f));
        float _4144 = (((1.0f - _3510) * 0.47746479511260986f) * saturate(_3509)) * saturate((pow(_3677, 4.0f)) * exp2(log2(saturate(1.0f - abs(_3672))) * 3.0f));
        _4149 = (_4144 * _4003);
        _4150 = (_4144 * _4004);
        _4151 = (_4144 * _4005);
        _4152 = ((((max((_4087 * _4043), 0.0f) - _4068) * _3507) + _4068) * _4103);
        _4153 = ((((max((_4087 * _4044), 0.0f) - _4069) * _3507) + _4069) * _4103);
        _4154 = ((((max((_4087 * _4045), 0.0f) - _4070) * _3507) + _4070) * _4103);
        _4155 = (((_4003 * _3451) * _4119) + _3996);
        _4156 = (((_4004 * _3452) * _4119) + _3996);
        _4157 = (((_4005 * _3453) * _4119) + _3996);
        __defer_3980_4148 = true;
      }
      if (__defer_3980_4148) {
        if (!(_3506 > 0.9900000095367432f)) {
          float _4160 = saturate(_3672);
          float _4161 = 1.0f - _3597;
          float _4162 = 1.0f - _3680;
          float _4163 = _4162 * _4162;
          float _4166 = ((_4163 * _4163) * _4162) + _3680;
          float _4167 = 1.0f - _4160;
          float _4168 = _4167 * _4167;
          float _4173 = 1.0f - _3675;
          float _4174 = _4173 * _4173;
          float _4201 = (_4160 * 0.31830987334251404f) * ((((_3680 * ((((_4161 * 34.5f) + -59.0f) * _4161) + 24.5f)) * exp2(-0.0f - (max(((_4161 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_3677)))) + _4166) + ((((1.0f - ((_4168 * _4168) * (_4167 * 0.75f))) * (1.0f - ((_4174 * _4174) * (_4173 * 0.75f)))) - _4166) * saturate((_4161 * 2.200000047683716f) + -0.5f)));
          float _4204 = saturate(1.0f - saturate(_3678));
          float _4205 = _4204 * _4204;
          float _4207 = (_4205 * _4205) * _4204;
          float _4210 = _4207 * saturate(_3594 * 50.0f);
          float _4211 = 1.0f - _4207;
          float _4215 = (_4211 * _3593) + _4210;
          float _4216 = (_4211 * _3594) + _4210;
          float _4217 = (_4211 * _3595) + _4210;
          if (!(_3505 == 29)) {
            float _4219 = saturate(_3673);
            float _4220 = 1.0f - _3596;
            float _4232 = (((_3677 * _3597) - _3677) * _3677) + 1.0f;
            float _4236 = (_3597 / ((_4232 * _4232) * 3.1415927410125732f)) * (0.5f / ((((_3675 * _4220) + _3596) * _3673) + (_3675 * ((_3673 * _4220) + _3596))));
            _4247 = (max((_4236 * _4215), 0.0f) * _4219);
            _4248 = (max((_4236 * _4216), 0.0f) * _4219);
            _4249 = (max((_4236 * _4217), 0.0f) * _4219);
          } else {
            _4247 = 0.0f;
            _4248 = 0.0f;
            _4249 = 0.0f;
          }
          bool _4250 = (_3505 == 65);
          if (_3570) {
            if (_4250) {
              float _4293 = max(9.999999974752427e-07f, _exposure2.x);
              float _4302 = ((_4160 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_3539, _3540, _3541), float3(_1033, _1034, _1035)))) * 16.0f)) / (((_4293 * _4293) * 1e+06f) + 1.0f);
              _4316 = _4247;
              _4317 = _4248;
              _4318 = _4249;
              _4319 = ((((_4302 * _3454) - _4201) * _3504) + _4201);
              _4320 = ((((_4302 * _3455) - _4201) * _3504) + _4201);
              _4321 = ((((_4302 * _3456) - _4201) * _3504) + _4201);
            } else {
              float _4257 = 1.0f - _3602;
              float _4269 = (((_3677 * _3603) - _3677) * _3677) + 1.0f;
              float _4273 = (_3603 / ((_4269 * _4269) * 3.1415927410125732f)) * (0.5f / ((((_3675 * _4257) + _3602) * _3673) + (_3675 * ((_3673 * _4257) + _3602))));
              float _4280 = saturate(_3673) * 0.39990234375f;
              _4316 = ((max((_4273 * _4215), 0.0f) * _4280) + (_4247 * 0.60009765625f));
              _4317 = ((max((_4273 * _4216), 0.0f) * _4280) + (_4248 * 0.60009765625f));
              _4318 = ((max((_4273 * _4217), 0.0f) * _4280) + (_4249 * 0.60009765625f));
              _4319 = _4201;
              _4320 = _4201;
              _4321 = _4201;
            }
          } else {
            if (_4250) {
              float _4293 = max(9.999999974752427e-07f, _exposure2.x);
              float _4302 = ((_4160 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_3539, _3540, _3541), float3(_1033, _1034, _1035)))) * 16.0f)) / (((_4293 * _4293) * 1e+06f) + 1.0f);
              _4316 = _4247;
              _4317 = _4248;
              _4318 = _4249;
              _4319 = ((((_4302 * _3454) - _4201) * _3504) + _4201);
              _4320 = ((((_4302 * _3455) - _4201) * _3504) + _4201);
              _4321 = ((((_4302 * _3456) - _4201) * _3504) + _4201);
            } else {
              _4316 = _4247;
              _4317 = _4248;
              _4318 = _4249;
              _4319 = _4201;
              _4320 = _4201;
              _4321 = _4201;
            }
          }
        } else {
          _4316 = _3974;
          _4317 = _3975;
          _4318 = _3976;
          _4319 = _3977;
          _4320 = _3978;
          _4321 = _3979;
        }
        float _4325 = min(-0.0f, (-0.0f - _4319));
        float _4326 = min(-0.0f, (-0.0f - _4320));
        float _4327 = min(-0.0f, (-0.0f - _4321));
        float _4328 = -0.0f - _4325;
        float _4329 = -0.0f - _4326;
        float _4330 = -0.0f - _4327;
        if (_3981) {
          _4389 = _3971;
          _4390 = _3972;
          _4391 = _3973;
          _4392 = (_4316 * _3451);
          _4393 = (_4317 * _3452);
          _4394 = (_4318 * _3453);
          _4395 = (_3451 * _4328);
          _4396 = (_3452 * _4329);
          _4397 = (_3453 * _4330);
        } else {
          bool _4332 = (_3506 > 0.0f);
          if (_4332) {
            _4366 = (_3971 - (_3971 * _3638));
            _4367 = (_3972 - (_3972 * _3638));
            _4368 = (_3973 - (_3973 * _3638));
            _4369 = (lerp(_4316, _4152, _3638));
            _4370 = (lerp(_4317, _4153, _3638));
            _4371 = (lerp(_4318, _4154, _3638));
            _4372 = (((_4325 + _4155) * _3638) - _4325);
            _4373 = (((_4326 + _4156) * _3638) - _4326);
            _4374 = (((_4327 + _4157) * _3638) - _4327);
          } else {
            _4366 = _3971;
            _4367 = _3972;
            _4368 = _3973;
            _4369 = _4316;
            _4370 = _4317;
            _4371 = _4318;
            _4372 = _4328;
            _4373 = _4329;
            _4374 = _4330;
          }
          float _4375 = _4372 * _3451;
          float _4376 = _4373 * _3452;
          float _4377 = _4374 * _3453;
          float _4378 = _4369 * _3451;
          float _4379 = _4370 * _3452;
          float _4380 = _4371 * _3453;
          if (_4332) {
            _4389 = _4366;
            _4390 = _4367;
            _4391 = _4368;
            _4392 = (_4378 + (_4149 * _3638));
            _4393 = (_4379 + (_4150 * _3638));
            _4394 = (_4380 + (_4151 * _3638));
            _4395 = _4375;
            _4396 = _4376;
            _4397 = _4377;
          } else {
            _4389 = _4366;
            _4390 = _4367;
            _4391 = _4368;
            _4392 = _4378;
            _4393 = _4379;
            _4394 = _4380;
            _4395 = _4375;
            _4396 = _4376;
            _4397 = _4377;
          }
        }
      }
    } else {
      _4389 = _3971;
      _4390 = _3972;
      _4391 = _3973;
      _4392 = _3974;
      _4393 = _3975;
      _4394 = _3976;
      _4395 = _3977;
      _4396 = _3978;
      _4397 = _3979;
    }
    if (_3641) {
      float _4401 = max(0.0f, (0.30000001192092896f - _3672)) * 0.23190687596797943f;
      _4409 = ((_4401 * _3451) + _4395);
      _4410 = ((_4401 * _3452) + _4396);
      _4411 = ((_4401 * _3453) + _4397);
    } else {
      _4409 = _4395;
      _4410 = _4396;
      _4411 = _4397;
    }
    float _4413 = 1.0f - (_3678 * 0.8500000238418579f);
    bool __defer_4408_4747 = false;
    if (_3570) {
      float _4417 = max(4.0f, _3646);
      float _4418 = _4417 * _4417;
      float _4420 = exp2(_4418 * -225.4210968017578f);
      float _4425 = exp2(_4418 * -29.807748794555664f);
      float _4433 = exp2(_4418 * -7.714946269989014f);
      float _4439 = exp2(_4418 * -2.544435739517212f);
      float _4441 = _4439 * 0.007000000216066837f;
      float _4446 = exp2(_4418 * -0.7249723672866821f);
      float _4460 = saturate(dot(float3(_3658, _3659, _3660), float3((-0.0f - _223), _239, (-0.0f - _225))) + 0.30000001192092896f) * 0.31830987334251404f;
      _4748 = ((_4460 * ((((((_4425 * 0.10000000149011612f) + (_4420 * 0.2329999953508377f)) + (_4433 * 0.11800000071525574f)) + (_4439 * 0.11299999803304672f)) + (_4446 * 0.3580000102519989f)) + (exp2(_4418 * -0.19469568133354187f) * 0.07800000160932541f))) + _4409);
      _4749 = ((_4460 * (((((_4425 * 0.335999995470047f) + (_4420 * 0.45500001311302185f)) + (_4433 * 0.1979999989271164f)) + _4441) + (_4446 * 0.004000000189989805f))) + _4410);
      _4750 = ((_4460 * (((_4425 * 0.3440000116825104f) + (_4420 * 0.6489999890327454f)) + _4441)) + _4411);
      __defer_4408_4747 = true;
    } else {
      bool __defer_4467_4728 = false;
      if (_3683) {
        float _4470 = dot(float3(_3454, _3455, _3456), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * _renderParams2.w;
        float _4473 = _4470 + (_3450 - (_4470 * _3450));
        float _4480 = (pow(_3451, 1.2000000476837158f));
        float _4481 = (pow(_3452, 1.2000000476837158f));
        float _4482 = (pow(_3453, 1.2000000476837158f));
        float _4488 = saturate(abs(dot(float3(_3658, _3659, _3660), float3(_950, _951, _952))));
        float2 _4497 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4488, _3464, saturate(sqrt(sqrt(_3454)))), 0.0f);
        float2 _4500 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4488, _3464, saturate(sqrt(sqrt(_3455)))), 0.0f);
        float2 _4503 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4488, _3464, saturate(sqrt(sqrt(_3456)))), 0.0f);
        float _4512 = min(0.9900000095367432f, _4497.x);
        float _4513 = min(0.9900000095367432f, _4500.x);
        float _4514 = min(0.9900000095367432f, _4503.x);
        float _4515 = min(0.9900000095367432f, _4497.y);
        float _4516 = min(0.9900000095367432f, _4500.y);
        float _4517 = min(0.9900000095367432f, _4503.y);
        float _4518 = _4512 * _4512;
        float _4519 = _4513 * _4513;
        float _4520 = _4514 * _4514;
        float _4521 = _4515 * _4515;
        float _4522 = _4516 * _4516;
        float _4523 = _4517 * _4517;
        float _4524 = _4521 * _4515;
        float _4525 = _4522 * _4516;
        float _4526 = _4523 * _4517;
        float _4527 = 1.0f - _4518;
        float _4528 = 1.0f - _4519;
        float _4529 = 1.0f - _4520;
        float _4539 = _4527 * _4527;
        float _4540 = _4528 * _4528;
        float _4541 = _4529 * _4529;
        float _4542 = _4539 * _4527;
        float _4543 = _4540 * _4528;
        float _4544 = _4541 * _4529;
        float _4552 = min(max(_3464, 0.18000000715255737f), 0.6000000238418579f);
        float _4553 = _4552 * _4552;
        float _4554 = _4553 * 0.25f;
        float _4555 = _4553 * 4.0f;
        float _4557 = (_4513 + _4512) + _4514;
        float _4558 = _4512 / _4557;
        float _4559 = _4513 / _4557;
        float _4560 = _4514 / _4557;
        float _4561 = dot(float3(_4553, _4554, _4555), float3(_4558, _4559, _4560));
        float _4562 = _4561 * _4561;
        float _4566 = (asin(min(max(dot(float3(_950, _951, _952), float3(_1033, _1034, _1035)), -1.0f), 1.0f)) + asin(min(max(dot(float3(_950, _951, _952), float3(_3658, _3659, _3660)), -1.0f), 1.0f))) * 0.5f;
        float _4567 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_4558, _4559, _4560));
        float _4577 = _4567 * _4567;
        float _4600 = (_4516 + _4515) + _4517;
        float _4604 = dot(float3(_4553, _4554, _4555), float3((_4515 / _4600), (_4516 / _4600), (_4517 / _4600)));
        float _4608 = sqrt((_4604 * _4604) + (_4562 * 2.0f));
        float _4626 = (_4604 * 3.0f) + (_4561 * 2.0f);
        float _4633 = (((_4524 + _4515) * ((_4518 * 0.699999988079071f) + 1.0f)) * _4608) / ((_4626 * _4524) + _4515);
        float _4634 = (((_4525 + _4516) * ((_4519 * 0.699999988079071f) + 1.0f)) * _4608) / ((_4626 * _4525) + _4516);
        float _4635 = (((_4526 + _4517) * ((_4520 * 0.699999988079071f) + 1.0f)) * _4608) / ((_4626 * _4526) + _4517);
        float _4639 = _4566 - (((_4577 * (((_4518 * 4.0f) * _4521) + (_4539 * 2.0f))) * (1.0f - ((_4521 * 2.0f) / _4539))) / _4542);
        float _4646 = _4566 - (((_4577 * (((_4519 * 4.0f) * _4522) + (_4540 * 2.0f))) * (1.0f - ((_4522 * 2.0f) / _4540))) / _4543);
        float _4653 = _4566 - (((_4577 * (((_4520 * 4.0f) * _4523) + (_4541 * 2.0f))) * (1.0f - ((_4523 * 2.0f) / _4541))) / _4544);
        float _4661 = (1.0f - _948) * 2.0999999046325684f;
        float _4682 = (_948 * 0.31830987334251404f) * saturate(_3672);
        _4729 = _4480;
        _4730 = _4481;
        _4731 = _4482;
        _4732 = (((_4473 * _3661) * _4480) * ((((((_4524 * _4518) / _4542) + ((_4515 * _4518) / _4527)) * _4661) * exp2((((_4639 * _4639) * -0.5f) / ((_4633 * _4633) + _4562)) * 1.4426950216293335f)) + _4389));
        _4733 = (((_4473 * _3662) * _4481) * ((((((_4525 * _4519) / _4543) + ((_4516 * _4519) / _4528)) * _4661) * exp2((((_4646 * _4646) * -0.5f) / ((_4634 * _4634) + _4562)) * 1.4426950216293335f)) + _4390));
        _4734 = (((_4473 * _3663) * _4482) * ((((((_4526 * _4520) / _4544) + ((_4517 * _4520) / _4529)) * _4661) * exp2((((_4653 * _4653) * -0.5f) / ((_4635 * _4635) + _4562)) * 1.4426950216293335f)) + _4391));
        _4735 = (_4682 * _4480);
        _4736 = (_4682 * _4481);
        _4737 = (_4682 * _4482);
        __defer_4467_4728 = true;
      } else {
        if (_3640) {
          if (_3505 == 97) {
            _4776 = ((_4392 * _3661) * _3451);
            _4777 = ((_4393 * _3662) * _3452);
            _4778 = ((_4394 * _3663) * _3453);
            _4779 = (_4409 * _3661);
            _4780 = (_4410 * _3662);
            _4781 = (_4411 * _3663);
            _4782 = _4389;
            _4783 = _4390;
            _4784 = _4391;
            _4785 = _3451;
            _4786 = _3452;
            _4787 = _3453;
            if (((_121 < 1000.0f)) && ((_3152 == 0.0h))) {
              if (!(abs(_224) > 0.9900000095367432f)) {
                float _4795 = -0.0f - _225;
                float _4797 = rsqrt(dot(float3(_4795, 0.0f, _223), float3(_4795, 0.0f, _223)));
                _4801 = (_4797 * _4795);
                _4802 = (_4797 * _223);
              } else {
                _4801 = 1.0f;
                _4802 = 0.0f;
              }
              float _4804 = -0.0f - (_224 * _4802);
              float _4807 = (_4802 * _223) - (_4801 * _225);
              float _4808 = _4801 * _224;
              float _4810 = rsqrt(dot(float3(_4804, _4807, _4808), float3(_4804, _4807, _4808)));
              float _4816 = _viewPos.x + _394;
              float _4817 = _viewPos.z + _396;
              float4 _4822 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4801, 0.0f, _4802), float3(_4816, _3239, _4817)), dot(float3((_4810 * _4804), (_4807 * _4810), (_4810 * _4808)), float3(_4816, _3239, _4817))), 0.0f);
              float _4826 = _4822.x + -0.5f;
              float _4827 = _4822.y + -0.5f;
              float _4828 = _4822.z + -0.5f;
              float _4830 = rsqrt(dot(float3(_4826, _4827, _4828), float3(_4826, _4827, _4828)));
              float _4834 = (_4826 * _4830) + _3539;
              float _4835 = (_4827 * _4830) + _3540;
              float _4836 = (_4828 * _4830) + _3541;
              float _4838 = rsqrt(dot(float3(_4834, _4835, _4836), float3(_4834, _4835, _4836)));
              float _4839 = _4834 * _4838;
              float _4840 = _4835 * _4838;
              float _4841 = _4836 * _4838;
              float _4853 = abs(((_102 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
              float _4854 = abs(1.0f - ((_103 * 2.0f) * _bufferSizeAndInvSize.w));
              float _4857 = saturate(_4853 * _4853);
              float _4858 = saturate(_4854 * _4854);
              float _4872 = dot(float3((-0.0f - _4839), (-0.0f - _4840), (-0.0f - _4841)), float3(_3658, _3659, _3660));
              float _4874 = saturate(dot(float3(_4839, _4840, _4841), float3(_1033, _1034, _1035)));
              float _4876 = saturate(1.0f - _3678);
              float _4877 = _4876 * _4876;
              float _4879 = (_4877 * _4877) * _4876;
              float _4895 = 1.0f - ((_3677 * _3677) * 0.9998999834060669f);
              float _4902 = (max((((3.18309866997879e-05f / (_4895 * _4895)) * (0.5f / ((((_4874 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4872) + (_4874 * ((_4872 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4879, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4872)) + (exp2(log2(saturate(dot(float3(_1033, _1034, _1035), float3(_4839, _4840, _4841)))) * 1024.0f) * 50.0f);
              float _4907 = saturate(1.0f - (_121 * 0.0010000000474974513f)) * ((1.0f - ((_4858 * _4858) * (3.0f - (_4858 * 2.0f)))) * (1.0f - ((_4857 * _4857) * (3.0f - (_4857 * 2.0f)))));
              _4921 = _4779;
              _4922 = _4780;
              _4923 = _4781;
              _4924 = _4782;
              _4925 = _4783;
              _4926 = _4784;
              _4927 = ((((_4907 * _3661) * _4785) * _4902) + _4776);
              _4928 = ((((_4907 * _3662) * _4786) * _4902) + _4777);
              _4929 = ((((_4907 * _3663) * _4787) * _4902) + _4778);
            } else {
              _4921 = _4779;
              _4922 = _4780;
              _4923 = _4781;
              _4924 = _4782;
              _4925 = _4783;
              _4926 = _4784;
              _4927 = _4776;
              _4928 = _4777;
              _4929 = _4778;
            }
          } else {
            if ((uint)(_3505 + -105) < (uint)2) {
              _4729 = _3451;
              _4730 = _3452;
              _4731 = _3453;
              _4732 = _4389;
              _4733 = _4390;
              _4734 = _4391;
              _4735 = _4409;
              _4736 = _4410;
              _4737 = _4411;
              __defer_4467_4728 = true;
            } else {
              if (!(_3646 >= 999.9000244140625f)) {
                _4713 = ((max(0.0020000000949949026f, _3646) * 0.4000000059604645f) / ((_3504 * 100.0f) + 0.10000000149011612f));
              } else {
                _4713 = 1000.0f;
              }
              float _4714 = _4713 * _4713;
              float _4724 = (((_3504 * 0.25f) * (0.022082746028900146f / (_4413 * _4413))) * max(0.0f, (0.30000001192092896f - _3672))) * ((exp2(_4714 * -0.48089835047721863f) * 3.0f) + exp2(_4714 * -1.4426950216293335f));
              _4748 = (_4724 + _4409);
              _4749 = (_4724 + _4410);
              _4750 = (_4724 + _4411);
              __defer_4408_4747 = true;
            }
          }
        } else {
          _4748 = _4409;
          _4749 = _4410;
          _4750 = _4411;
          __defer_4408_4747 = true;
        }
      }
      if (__defer_4467_4728) {
        _4762 = ((_4392 * _3661) * _4729);
        _4763 = ((_4393 * _3662) * _4730);
        _4764 = ((_4394 * _3663) * _4731);
        _4765 = (_4735 * _3661);
        _4766 = (_4736 * _3662);
        _4767 = (_4737 * _3663);
        _4768 = _4732;
        _4769 = _4733;
        _4770 = _4734;
        _4771 = _4729;
        _4772 = _4730;
        _4773 = _4731;
        if (_3505 == 98) {
          _4776 = _4762;
          _4777 = _4763;
          _4778 = _4764;
          _4779 = _4765;
          _4780 = _4766;
          _4781 = _4767;
          _4782 = _4768;
          _4783 = _4769;
          _4784 = _4770;
          _4785 = _4771;
          _4786 = _4772;
          _4787 = _4773;
          if (((_121 < 1000.0f)) && ((_3152 == 0.0h))) {
            if (!(abs(_224) > 0.9900000095367432f)) {
              float _4795 = -0.0f - _225;
              float _4797 = rsqrt(dot(float3(_4795, 0.0f, _223), float3(_4795, 0.0f, _223)));
              _4801 = (_4797 * _4795);
              _4802 = (_4797 * _223);
            } else {
              _4801 = 1.0f;
              _4802 = 0.0f;
            }
            float _4804 = -0.0f - (_224 * _4802);
            float _4807 = (_4802 * _223) - (_4801 * _225);
            float _4808 = _4801 * _224;
            float _4810 = rsqrt(dot(float3(_4804, _4807, _4808), float3(_4804, _4807, _4808)));
            float _4816 = _viewPos.x + _394;
            float _4817 = _viewPos.z + _396;
            float4 _4822 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4801, 0.0f, _4802), float3(_4816, _3239, _4817)), dot(float3((_4810 * _4804), (_4807 * _4810), (_4810 * _4808)), float3(_4816, _3239, _4817))), 0.0f);
            float _4826 = _4822.x + -0.5f;
            float _4827 = _4822.y + -0.5f;
            float _4828 = _4822.z + -0.5f;
            float _4830 = rsqrt(dot(float3(_4826, _4827, _4828), float3(_4826, _4827, _4828)));
            float _4834 = (_4826 * _4830) + _3539;
            float _4835 = (_4827 * _4830) + _3540;
            float _4836 = (_4828 * _4830) + _3541;
            float _4838 = rsqrt(dot(float3(_4834, _4835, _4836), float3(_4834, _4835, _4836)));
            float _4839 = _4834 * _4838;
            float _4840 = _4835 * _4838;
            float _4841 = _4836 * _4838;
            float _4853 = abs(((_102 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
            float _4854 = abs(1.0f - ((_103 * 2.0f) * _bufferSizeAndInvSize.w));
            float _4857 = saturate(_4853 * _4853);
            float _4858 = saturate(_4854 * _4854);
            float _4872 = dot(float3((-0.0f - _4839), (-0.0f - _4840), (-0.0f - _4841)), float3(_3658, _3659, _3660));
            float _4874 = saturate(dot(float3(_4839, _4840, _4841), float3(_1033, _1034, _1035)));
            float _4876 = saturate(1.0f - _3678);
            float _4877 = _4876 * _4876;
            float _4879 = (_4877 * _4877) * _4876;
            float _4895 = 1.0f - ((_3677 * _3677) * 0.9998999834060669f);
            float _4902 = (max((((3.18309866997879e-05f / (_4895 * _4895)) * (0.5f / ((((_4874 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4872) + (_4874 * ((_4872 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4879, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4872)) + (exp2(log2(saturate(dot(float3(_1033, _1034, _1035), float3(_4839, _4840, _4841)))) * 1024.0f) * 50.0f);
            float _4907 = saturate(1.0f - (_121 * 0.0010000000474974513f)) * ((1.0f - ((_4858 * _4858) * (3.0f - (_4858 * 2.0f)))) * (1.0f - ((_4857 * _4857) * (3.0f - (_4857 * 2.0f)))));
            _4921 = _4779;
            _4922 = _4780;
            _4923 = _4781;
            _4924 = _4782;
            _4925 = _4783;
            _4926 = _4784;
            _4927 = ((((_4907 * _3661) * _4785) * _4902) + _4776);
            _4928 = ((((_4907 * _3662) * _4786) * _4902) + _4777);
            _4929 = ((((_4907 * _3663) * _4787) * _4902) + _4778);
          } else {
            _4921 = _4779;
            _4922 = _4780;
            _4923 = _4781;
            _4924 = _4782;
            _4925 = _4783;
            _4926 = _4784;
            _4927 = _4776;
            _4928 = _4777;
            _4929 = _4778;
          }
        } else {
          _4921 = _4765;
          _4922 = _4766;
          _4923 = _4767;
          _4924 = _4768;
          _4925 = _4769;
          _4926 = _4770;
          _4927 = _4762;
          _4928 = _4763;
          _4929 = _4764;
        }
      }
    }
    if (__defer_4408_4747) {
      float _4751 = _4748 * _3661;
      float _4752 = _4749 * _3662;
      float _4753 = _4750 * _3663;
      float _4755 = (_4392 * _3661) * _3451;
      float _4757 = (_4393 * _3662) * _3452;
      float _4759 = (_4394 * _3663) * _3453;
      bool __branch_chain_4747;
      if (_3505 == 97) {
        _4776 = _4755;
        _4777 = _4757;
        _4778 = _4759;
        _4779 = _4751;
        _4780 = _4752;
        _4781 = _4753;
        _4782 = _4389;
        _4783 = _4390;
        _4784 = _4391;
        _4785 = _3451;
        _4786 = _3452;
        _4787 = _3453;
        __branch_chain_4747 = true;
      } else {
        _4762 = _4755;
        _4763 = _4757;
        _4764 = _4759;
        _4765 = _4751;
        _4766 = _4752;
        _4767 = _4753;
        _4768 = _4389;
        _4769 = _4390;
        _4770 = _4391;
        _4771 = _3451;
        _4772 = _3452;
        _4773 = _3453;
        if (_3505 == 98) {
          _4776 = _4762;
          _4777 = _4763;
          _4778 = _4764;
          _4779 = _4765;
          _4780 = _4766;
          _4781 = _4767;
          _4782 = _4768;
          _4783 = _4769;
          _4784 = _4770;
          _4785 = _4771;
          _4786 = _4772;
          _4787 = _4773;
          __branch_chain_4747 = true;
        } else {
          _4921 = _4765;
          _4922 = _4766;
          _4923 = _4767;
          _4924 = _4768;
          _4925 = _4769;
          _4926 = _4770;
          _4927 = _4762;
          _4928 = _4763;
          _4929 = _4764;
          __branch_chain_4747 = false;
        }
      }
      if (__branch_chain_4747) {
        if (((_121 < 1000.0f)) && ((_3152 == 0.0h))) {
          if (!(abs(_224) > 0.9900000095367432f)) {
            float _4795 = -0.0f - _225;
            float _4797 = rsqrt(dot(float3(_4795, 0.0f, _223), float3(_4795, 0.0f, _223)));
            _4801 = (_4797 * _4795);
            _4802 = (_4797 * _223);
          } else {
            _4801 = 1.0f;
            _4802 = 0.0f;
          }
          float _4804 = -0.0f - (_224 * _4802);
          float _4807 = (_4802 * _223) - (_4801 * _225);
          float _4808 = _4801 * _224;
          float _4810 = rsqrt(dot(float3(_4804, _4807, _4808), float3(_4804, _4807, _4808)));
          float _4816 = _viewPos.x + _394;
          float _4817 = _viewPos.z + _396;
          float4 _4822 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4801, 0.0f, _4802), float3(_4816, _3239, _4817)), dot(float3((_4810 * _4804), (_4807 * _4810), (_4810 * _4808)), float3(_4816, _3239, _4817))), 0.0f);
          float _4826 = _4822.x + -0.5f;
          float _4827 = _4822.y + -0.5f;
          float _4828 = _4822.z + -0.5f;
          float _4830 = rsqrt(dot(float3(_4826, _4827, _4828), float3(_4826, _4827, _4828)));
          float _4834 = (_4826 * _4830) + _3539;
          float _4835 = (_4827 * _4830) + _3540;
          float _4836 = (_4828 * _4830) + _3541;
          float _4838 = rsqrt(dot(float3(_4834, _4835, _4836), float3(_4834, _4835, _4836)));
          float _4839 = _4834 * _4838;
          float _4840 = _4835 * _4838;
          float _4841 = _4836 * _4838;
          float _4853 = abs(((_102 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
          float _4854 = abs(1.0f - ((_103 * 2.0f) * _bufferSizeAndInvSize.w));
          float _4857 = saturate(_4853 * _4853);
          float _4858 = saturate(_4854 * _4854);
          float _4872 = dot(float3((-0.0f - _4839), (-0.0f - _4840), (-0.0f - _4841)), float3(_3658, _3659, _3660));
          float _4874 = saturate(dot(float3(_4839, _4840, _4841), float3(_1033, _1034, _1035)));
          float _4876 = saturate(1.0f - _3678);
          float _4877 = _4876 * _4876;
          float _4879 = (_4877 * _4877) * _4876;
          float _4895 = 1.0f - ((_3677 * _3677) * 0.9998999834060669f);
          float _4902 = (max((((3.18309866997879e-05f / (_4895 * _4895)) * (0.5f / ((((_4874 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4872) + (_4874 * ((_4872 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4879, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4872)) + (exp2(log2(saturate(dot(float3(_1033, _1034, _1035), float3(_4839, _4840, _4841)))) * 1024.0f) * 50.0f);
          float _4907 = saturate(1.0f - (_121 * 0.0010000000474974513f)) * ((1.0f - ((_4858 * _4858) * (3.0f - (_4858 * 2.0f)))) * (1.0f - ((_4857 * _4857) * (3.0f - (_4857 * 2.0f)))));
          _4921 = _4779;
          _4922 = _4780;
          _4923 = _4781;
          _4924 = _4782;
          _4925 = _4783;
          _4926 = _4784;
          _4927 = ((((_4907 * _3661) * _4785) * _4902) + _4776);
          _4928 = ((((_4907 * _3662) * _4786) * _4902) + _4777);
          _4929 = ((((_4907 * _3663) * _4787) * _4902) + _4778);
        } else {
          _4921 = _4779;
          _4922 = _4780;
          _4923 = _4781;
          _4924 = _4782;
          _4925 = _4783;
          _4926 = _4784;
          _4927 = _4776;
          _4928 = _4777;
          _4929 = _4778;
        }
      }
    }
    float _4936 = _4921 + _3153;
    float _4937 = _4922 + _3154;
    float _4938 = _4923 + _3155;
    uint _4941 = _frameNumber.x * 13;
    [branch]
    if (((((int)(_4941 + ((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160))))) | ((int)(_4941 + ((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((int)(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))) >> 5)), ((int)(((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))) >> 5)))] = half4(half(_4936), half(_4937), half(_4938), 1.0h);
    }
    bool _4956 = ((uint)(_3505 & 24) > (uint)23);
    if (_3573) {
      _4973 = saturate(exp2((_3568 * _3568) * (_121 * -0.005770780146121979f)));
    } else {
      _4973 = select((_cavityParams.z > 0.0f), select(_180, 0.0f, _1022), 1.0f);
    }
    float _4988 = select(_3570, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _4973) * select(((_179) && (_4956)), (1.0f - _1022), 1.0f)));
    float _4992 = min(60000.0f, (_4988 * (((_2864 * _2620) * _2869) - min(0.0f, (-0.0f - _4927)))));
    float _4993 = min(60000.0f, (_4988 * (((_2865 * _2621) * _2869) - min(0.0f, (-0.0f - _4928)))));
    float _4994 = min(60000.0f, (_4988 * (((_2866 * _2622) * _2869) - min(0.0f, (-0.0f - _4929)))));
    float _4997 = 1.0f - _renderParams.x;
    half _5004 = half((_renderParams.x * _3454) + _4997);
    half _5005 = half((_renderParams.x * _3455) + _4997);
    half _5006 = half((_renderParams.x * _3456) + _4997);
    if ((_3570) && ((_renderParams2.x == 0.0f))) {
      _5022 = (pow(_5004, 0.5h));
      _5023 = (pow(_5005, 0.5h));
      _5024 = (pow(_5006, 0.5h));
    } else {
      _5022 = _5004;
      _5023 = _5005;
      _5024 = _5006;
    }
    bool _5026 = (_3604) || ((_3505 == 55));
    half _5027 = select(_5026, 0.0h, _3152);
    float _5028 = float(_5022);
    float _5029 = float(_5023);
    float _5030 = float(_5024);
    if (_3542) {
      _5037 = saturate(((_5029 + _5028) + _5030) * 1.2000000476837158f);
    } else {
      _5037 = 1.0f;
    }
    float _5038 = float(_5027);
    float _5044 = (0.699999988079071f / min(max(max(max(_5028, _5029), _5030), 0.009999999776482582f), 0.699999988079071f)) * _5037;
    float _5051 = ((_5044 * _5028) + -0.03999999910593033f) * _5038;
    float _5052 = ((_5044 * _5029) + -0.03999999910593033f) * _5038;
    float _5053 = ((_5044 * _5030) + -0.03999999910593033f) * _5038;
    float _5054 = _5051 + 0.03999999910593033f;
    float _5055 = _5052 + 0.03999999910593033f;
    float _5056 = _5053 + 0.03999999910593033f;
    if ((_3599) || (((_3682) || (((_3681) || (_5026)))))) {
      float2 _5065 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__3__40__0__0__g_samplerClamp, float2(min(0.9900000095367432f, _1041), (1.0f - max(0.019999999552965164f, float(_162)))), 0.0f);
      _5069 = _5065.x;
      _5070 = _5065.y;
    } else {
      _5069 = _2862;
      _5070 = _2863;
    }
    float _5074 = (_5069 * _5054) + _5070;
    float _5075 = (_5069 * _5055) + _5070;
    float _5076 = (_5069 * _5056) + _5070;
    float _5078 = (1.0f - _5069) - _5070;
    float _5085 = ((0.9599999785423279f - _5051) * 0.0476190485060215f) + _5054;
    float _5086 = ((0.9599999785423279f - _5052) * 0.0476190485060215f) + _5055;
    float _5087 = ((0.9599999785423279f - _5053) * 0.0476190485060215f) + _5056;
    float _5104 = saturate(1.0f - _3147);
    float _5105 = (((_5074 * _5085) / (1.0f - (_5078 * _5085))) * _5078) * _5104;
    float _5106 = (((_5075 * _5086) / (1.0f - (_5078 * _5086))) * _5078) * _5104;
    float _5107 = (((_5076 * _5087) / (1.0f - (_5078 * _5087))) * _5078) * _5104;
    float _5118 = float(1.0h - _5027);
    half _5128 = half(((_5028 * _5118) * saturate((1.0f - _5074) - _5105)) + _5105);
    half _5129 = half(((_5029 * _5118) * saturate((1.0f - _5075) - _5106)) + _5106);
    half _5130 = half(((_5030 * _5118) * saturate((1.0f - _5076) - _5107)) + _5107);
    float _5132 = float(_5128);
    float _5133 = float(_5129);
    float _5134 = float(_5130);
    if (_3505 == 65) {
      float _5138 = max(9.999999974752427e-07f, _exposure2.x);
      float _5146 = ((pow(_3675, 16.0f)) * 50.26548385620117f) / (((_5138 * _5138) * 1e+06f) + 1.0f);
      _5163 = (((((_5132 * _4936) * _5146) - _4936) * _990) + _4936);
      _5164 = (((((_5133 * _4937) * _5146) - _4937) * _990) + _4937);
      _5165 = (((((_5134 * _4938) * _5146) - _4938) * _990) + _4938);
    } else {
      _5163 = _4936;
      _5164 = _4937;
      _5165 = _4938;
    }
    float _5168 = __3__36__0__0__g_caustic.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_109, _110), 0.0f);
    float _5170 = _5168.x * 0.31830987334251404f;
    float _5180 = (min(65535.0f, _4924) + _3156) + (((_5170 * _3442) + _5163) * _5132);
    float _5181 = (min(65535.0f, _4925) + _3157) + (((_5170 * _3443) + _5164) * _5133);
    float _5182 = (min(65535.0f, _4926) + _3158) + (((_5170 * _3444) + _5165) * _5134);
    float _5211 = exp2((saturate(_424) * 20.0f) + -8.0f) + -0.00390625f;
    float _5212 = _5211 * select((_421 < 0.040449999272823334f), (_421 * 0.07739938050508499f), exp2(log2((_421 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _5213 = _5211 * select((_422 < 0.040449999272823334f), (_422 * 0.07739938050508499f), exp2(log2((_422 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _5214 = _5211 * select((_423 < 0.040449999272823334f), (_423 * 0.07739938050508499f), exp2(log2((_423 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _5227 = ((_5212 * 0.6131200194358826f) + (_5213 * 0.3395099937915802f)) + (_5214 * 0.047370001673698425f);
    float _5228 = ((_5212 * 0.07020000368356705f) + (_5213 * 0.9163600206375122f)) + (_5214 * 0.013450000435113907f);
    float _5229 = ((_5212 * 0.02061999961733818f) + (_5213 * 0.10958000272512436f)) + (_5214 * 0.8697999715805054f);
    if (_350) {
      _5235 = (_5227 + _5180);
      _5236 = (_5228 + _5181);
      _5237 = (_5229 + _5182);
    } else {
      _5235 = _5180;
      _5236 = _5181;
      _5237 = _5182;
    }
    float _5241 = _5235 + (_4992 * _5038);
    float _5242 = _5236 + (_4993 * _5038);
    float _5243 = _5237 + (_4994 * _5038);
    float _5265 = (((QuadReadLaneAt(_5241,1) + QuadReadLaneAt(_5241,0)) + QuadReadLaneAt(_5241,2)) + QuadReadLaneAt(_5241,3)) * 0.25f;
    float _5266 = (((QuadReadLaneAt(_5242,1) + QuadReadLaneAt(_5242,0)) + QuadReadLaneAt(_5242,2)) + QuadReadLaneAt(_5242,3)) * 0.25f;
    float _5267 = (((QuadReadLaneAt(_5243,1) + QuadReadLaneAt(_5243,0)) + QuadReadLaneAt(_5243,2)) + QuadReadLaneAt(_5243,3)) * 0.25f;
    [branch]
    if (((((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))) | ((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160))))) & 1) == 0) {
      float _5272 = dot(float3(_5265, _5266, _5267), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((int)(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))) >> 1)), ((int)(((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))) >> 1)))] = float4(min(60000.0f, _5265), min(60000.0f, _5266), min(60000.0f, _5267), min(60000.0f, select((_1622 != 0), (-0.0f - _5272), _5272)));
    }
    if (_4956) {
      _5294 = (((_5027 == 0.0h)) && ((!(((((!(_5128 == 0.0h))) && ((!(_5129 == 0.0h))))) && ((!(_5130 == 0.0h)))))));
    } else {
      _5294 = false;
    }
    if ((((_4956) || ((((_3505 == 96)) || (((_3682) || (((_3505 & -4) == 64)))))))) || ((((_121 <= 10.0f)) && (_3599)))) {
      __3__38__0__1__g_sceneSpecularUAV[int2(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))))] = half4((-0.0h - half(min(0.0f, (-0.0f - _4992)))), (-0.0h - half(min(0.0f, (-0.0f - _4993)))), (-0.0h - half(min(0.0f, (-0.0f - _4994)))), (-0.0h - half(min(0.0f, (-0.0f - _2630)))));
      _5327 = _5235;
      _5328 = _5236;
      _5329 = _5237;
    } else {
      _5327 = (_5235 + _4992);
      _5328 = (_5236 + _4993);
      _5329 = (_5237 + _4994);
    }
    if (!((((uint)(_3505 + -53) < (uint)15)) || ((!_350)))) {
      float _5335 = dot(float3(_5227, _5228, _5229), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _5339 = max((max(_5335, 1.0f) / max(_5335, 0.10000000149011612f)), 0.0f);
      _5350 = ((_5327 - _5227) + (_5339 * _5227));
      _5351 = ((_5328 - _5228) + (_5339 * _5228));
      _5352 = ((_5329 - _5229) + (_5339 * _5229));
    } else {
      _5350 = _5327;
      _5351 = _5328;
      _5352 = _5329;
    }
    float _5353 = min(60000.0f, _5350);
    float _5354 = min(60000.0f, _5351);
    float _5355 = min(60000.0f, _5352);
    [branch]
    if (_5294) {
      float4 _5358 = __3__38__0__1__g_sceneColorUAV.Load(int2(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160))))));
      _5366 = (_5358.x + _5353);
      _5367 = (_5358.y + _5354);
      _5368 = (_5358.z + _5355);
    } else {
      _5366 = _5353;
      _5367 = _5354;
      _5368 = _5355;
    }
    if (!(_renderParams.y == 0.0f)) {
      float _5377 = dot(float3(_5366, _5367, _5368), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _5378 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _5377);
      float _5382 = max(9.999999717180685e-10f, _5377);
      _5387 = ((_5378 * _5366) / _5382);
      _5388 = ((_5378 * _5367) / _5382);
      _5389 = ((_5378 * _5368) / _5382);
    } else {
      _5387 = _5366;
      _5388 = _5367;
      _5389 = _5368;
    }
    // RenoDX: Apply foliage AO to direct-lit pixels at final output.
    if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_117 - 12) < 7u)) {
      half4 _rndx_shadow = __3__36__0__0__g_sceneShadowColor.Load(int3(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))), 0));
      float _rndx_directRatio = saturate(dot(float3(_rndx_shadow.xyz), float3(0.333f, 0.333f, 0.333f)));
      float _rndx_ao = lerp(1.0f, float(_967.x), _rndx_directRatio * FOLIAGE_AO_STRENGTH);
      _5387 *= _rndx_ao;
      _5388 *= _rndx_ao;
      _5389 *= _rndx_ao;
    }
    __3__38__0__1__g_sceneColorUAV[int2(((int)((((uint)((_70 - (_71 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_93) << 5)) & 8160)))), ((int)((((uint)(_71 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_93)) >> 3) & 8160)))))] = float4(_5387, _5388, _5389, 1.0f);
  }
}
