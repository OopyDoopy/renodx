#include "../shared.h"
#include "../sky-atmospheric/sky_dawn_dusk_common.hlsli"
#include "diffuse_brdf.hlsli"
#include "foliage_common.hlsli"

Texture2D<float4> __3__36__0__0__g_puddleMask : register(t87, space36);

Texture2D<float4> __3__36__0__0__g_climateSandTex : register(t165, space36);

Texture2D<uint16_t> __3__36__0__0__g_sceneDecalMask : register(t166, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t19, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t195, space36);

Texture3D<float2> __3__36__0__0__g_hairDualScatteringLUT : register(t214, space36);

Texture2D<float4> __3__36__0__0__g_blueNoise : register(t88, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t0, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t152, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t79, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t91, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t92, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t39, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t49, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t94, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t50, space36);

Texture2D<float4> __3__36__0__0__g_bentCone : register(t25, space36);

Texture2D<float4> __3__36__0__0__g_character : register(t76, space36);

Texture2D<float4> __3__36__0__0__g_specularResult : register(t97, space36);

Texture2D<float> __3__36__0__0__g_specularRayHitDistance : register(t180, space36);

Texture2D<float4> __3__36__0__0__g_manyLightsMoments : register(t160, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t98, space36);

Texture2D<float2> __3__36__0__0__g_hairBrdfLookup : register(t100, space36);

Texture2D<half4> __3__36__0__0__g_sceneDiffuse : register(t156, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResult : register(t26, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResultPrev : register(t168, space36);

Texture2D<half4> __3__36__0__0__g_specularResultPrev : register(t27, space36);

Texture2D<half2> __3__36__0__0__g_sceneAO : register(t28, space36);

Texture2D<float> __3__36__0__0__g_caustic : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_tiledManyLightsMasks : register(t53, space36);

ByteAddressBuffer __3__37__0__0__g_structureCounterBuffer : register(t27, space37);

Texture2D<half4> __3__36__0__0__g_sceneShadowColor : register(t22, space36);

RWTexture2D<float4> __3__38__0__1__g_diffuseHalfPrevUAV : register(u40, space38);

RWTexture2D<float4> __3__38__0__1__g_sceneColorUAV : register(u10, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneSpecularUAV : register(u11, space38);

RWTexture2D<half4> __3__38__0__1__g_diffuseResultUAV : register(u12, space38);

RWTexture2D<half4> __3__38__0__1__g_specularResultUAV : register(u13, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV : register(u18, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b20, space35) {
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
  uint _isAllowBlood;
};

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b34, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__WeatherConstantBuffer : register(b49, space35) {
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

cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b30, space35) {
  float _sunLightIntensity : packoffset(c000.x);
  float _sunLightPreset : packoffset(c000.y);
  float _sunSizeAngle : packoffset(c000.z);
  float _sunDirX : packoffset(c000.w);
  float _sunDirY : packoffset(c001.x);
  float _moonLightIntensity : packoffset(c001.y);
  float _moonLightPreset : packoffset(c001.z);
  float _moonSizeAngle : packoffset(c001.w);
  float _moonDirX : packoffset(c002.x);
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

cbuffer __3__35__0__0__PrecomputedAmbientConstantBuffer : register(b31, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b33, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__35__0__0__EnvironmentLightingHistoryConstantBuffer : register(b0, space35) {
  float4 _environmentLightingHistory[4] : packoffset(c000.x);
};

cbuffer __3__35__0__0__MaterialParameterPresetTableConstantBuffer : register(b42, space35) {
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
  int _55[4];
  int _69 = (int)(SV_GroupID.x) & 15;
  int _70 = (uint)((uint)(_69)) >> 2;
  _55[0] = ((g_tileIndex[(SV_GroupID.x) >> 6]).x);
  _55[1] = ((g_tileIndex[(SV_GroupID.x) >> 6]).y);
  _55[2] = ((g_tileIndex[(SV_GroupID.x) >> 6]).z);
  _55[3] = ((g_tileIndex[(SV_GroupID.x) >> 6]).w);
  int _88 = _55[(((uint)(SV_GroupID.x) >> 4) & 3)];
  float _97 = float((uint)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3))));
  float _98 = float((uint)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5))));
  float _99 = _97 + 0.5f;
  float _100 = _98 + 0.5f;
  float _104 = _bufferSizeAndInvSize.z * _99;
  float _105 = _100 * _bufferSizeAndInvSize.w;
  float _107 = __3__36__0__0__g_depth.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
  uint2 _110 = __3__36__0__0__g_stencil.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
  int _112 = _110.x & 127;
  float _115 = max(1.0000000116860974e-07f, _107.x);
  float _116 = _nearFarProj.x / _115;
  half _289;
  half _290;
  half _291;
  half _292;
  float _317;
  float _318;
  float _319;
  bool _335;
  float _416;
  float _417;
  float _418;
  float _419;
  float _442;
  float _443;
  float _444;
  float _445;
  float _446;
  int _452;
  half _453;
  float _454;
  float _455;
  float _456;
  float _457;
  float _458;
  float _487;
  half _488;
  float _490;
  float _503;
  float _504;
  float _505;
  float _506;
  half _507;
  float _547;
  half _911;
  float _912;
  float _913;
  float _914;
  int _915;
  float _916;
  float _917;
  float _918;
  float _919;
  bool _941;
  bool _944;
  bool _945;
  float _963;
  float _974;
  float _975;
  half _985;
  half _986;
  half _987;
  half _988;
  half _989;
  float _990;
  float _991;
  float _1003;
  bool _1026;
  float _1035;
  float _1076;
  float _1077;
  float _1163;
  float _1241;
  bool _1346;
  float _1418;
  float _1419;
  float _1420;
  float _1421;
  float _1584;
  int _1585;
  float _1642;
  float _1762;
  float _1763;
  float _1764;
  float _1765;
  float _1792;
  half _1817;
  bool _1829;
  half _1860;
  int _1861;
  float _1862;
  float _1863;
  float _1864;
  float _2133;
  float _2152;
  float _2156;
  float _2189;
  float _2234;
  float _2235;
  float _2236;
  float _2237;
  float _2243;
  float _2244;
  float _2245;
  float _2246;
  float _2249;
  float _2250;
  float _2251;
  float _2252;
  half _2253;
  float _2365;
  int _2366;
  int _2367;
  float _2368;
  float _2369;
  float _2370;
  float _2371;
  float _2502;
  float _2503;
  float _2504;
  float _2567;
  float _2577;
  float _2578;
  float _2579;
  float _2624;
  float _2625;
  float _2757;
  float _2758;
  float _2759;
  float _2774;
  float _2775;
  float _2776;
  float _2777;
  float _2778;
  bool _2844;
  bool _2845;
  float _2881;
  float _2882;
  float _2883;
  float _2884;
  float _2950;
  float _2953;
  float _2954;
  float _2955;
  float _2956;
  float _2991;
  float _2992;
  float _2993;
  float _3008;
  float _3037;
  float _3038;
  float _3039;
  float _3040;
  float _3041;
  half _3048;
  half _3049;
  half _3050;
  half _3051;
  half _3052;
  float _3053;
  float _3059;
  half _3060;
  half _3061;
  half _3062;
  half _3063;
  half _3064;
  float _3065;
  float _3066;
  float _3067;
  float _3068;
  float _3069;
  float _3070;
  half _3107;
  half _3108;
  half _3109;
  float _3124;
  float _3125;
  float _3126;
  float _3146;
  float _3206;
  float _3304;
  float _3305;
  float _3306;
  bool _3374;
  bool _3396;
  bool _3398;
  bool _3399;
  float _3416;
  int _3417;
  float _3418;
  float _3419;
  float _3420;
  float _3421;
  float _3422;
  float _3461;
  float _3498;
  float _3505;
  float _3506;
  float _3507;
  bool _3528;
  bool _3530;
  bool _3534;
  int _3535;
  float _3536;
  bool _3545;
  int _3546;
  float _3547;
  float _3550;
  int _3551;
  bool _3552;
  bool _3553;
  float _3570;
  float _3571;
  float _3572;
  float _3612;
  float _3883;
  float _3884;
  float _3885;
  float _3886;
  float _3887;
  float _3888;
  float _3889;
  float _3890;
  float _3891;
  float _4061;
  float _4062;
  float _4063;
  float _4064;
  float _4065;
  float _4066;
  float _4067;
  float _4068;
  float _4069;
  float _4159;
  float _4160;
  float _4161;
  float _4228;
  float _4229;
  float _4230;
  float _4231;
  float _4232;
  float _4233;
  float _4278;
  float _4279;
  float _4280;
  float _4281;
  float _4282;
  float _4283;
  float _4284;
  float _4285;
  float _4286;
  float _4301;
  float _4302;
  float _4303;
  float _4304;
  float _4305;
  float _4306;
  float _4307;
  float _4308;
  float _4309;
  float _4321;
  float _4322;
  float _4323;
  float _4639;
  float _4665;
  float _4666;
  float _4667;
  float _4668;
  float _4669;
  float _4670;
  float _4671;
  float _4672;
  float _4673;
  float _4684;
  float _4685;
  float _4686;
  float _4687;
  float _4688;
  float _4689;
  float _4690;
  float _4691;
  float _4692;
  float _4693;
  float _4694;
  float _4695;
  float _4709;
  float _4710;
  float _4829;
  float _4830;
  float _4831;
  float _4832;
  float _4833;
  float _4834;
  float _4835;
  float _4836;
  float _4837;
  float _4881;
  half _4930;
  half _4931;
  half _4932;
  float _4945;
  float _4977;
  float _4978;
  float _5071;
  float _5072;
  float _5073;
  float _5143;
  float _5144;
  float _5145;
  bool _5202;
  float _5235;
  float _5236;
  float _5237;
  float _5258;
  float _5259;
  float _5260;
  float _5274;
  float _5275;
  float _5276;
  float _5295;
  float _5296;
  float _5297;
  // RenoDX: Foliage transmission accumulator
  float foliageTransR = 0.0f;
  float foliageTransG = 0.0f;
  float foliageTransB = 0.0f;
  if (!(((((_107.x < 1.0000000116860974e-07f)) || ((_107.x == 1.0f)))) || ((_112 == 10)))) {
    uint4 _124 = __3__36__0__0__g_baseColor.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
    float4 _130 = __3__36__0__0__g_normal.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
    half _139 = half(float((uint)((uint)(((uint)((uint)(_124.x)) >> 8) & 255))) * 0.003921568859368563f);
    half _143 = half(float((uint)((uint)(_124.x & 255))) * 0.003921568859368563f);
    half _148 = half(float((uint)((uint)(((uint)((uint)(_124.y)) >> 8) & 255))) * 0.003921568859368563f);
    half _152 = half(float((uint)((uint)(_124.y & 255))) * 0.003921568859368563f);
    half _157 = half(float((uint)((uint)(((uint)((uint)(_124.z)) >> 8) & 255))) * 0.003921568859368563f);
    half _161 = half(float((uint)((uint)(_124.z & 255))) * 0.003921568859368563f);
    uint _173 = uint((_130.w * 3.0f) + 0.5f);
    bool _174 = ((int)(_173) == 1);
    bool _175 = ((int)(_173) == 3);
    float _185 = (saturate(_130.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _186 = (saturate(_130.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _187 = (saturate(_130.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _189 = rsqrt(dot(float3(_185, _186, _187), float3(_185, _186, _187)));
    half _193 = half(_189 * _185);
    half _194 = half(_189 * _186);
    half _195 = half(_187 * _189);
    half _198 = (half(float((uint)((uint)(((uint)((uint)(_124.w)) >> 8) & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
    half _199 = (half(float((uint)((uint)(_124.w & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
    float _204 = float(_198 + _199) * 0.5f;
    float _205 = float(_198 - _199) * 0.5f;
    float _209 = (1.0f - abs(_204)) - abs(_205);
    float _211 = rsqrt(dot(float3(_204, _205, _209), float3(_204, _205, _209)));
    float _218 = float(_193);
    float _219 = float(_194);
    float _220 = float(_195);
    float _222 = select((_195 >= 0.0h), 1.0f, -1.0f);
    float _225 = -0.0f - (1.0f / (_222 + _220));
    float _226 = _219 * _225;
    float _227 = _226 * _218;
    float _228 = _222 * _218;
    float _234 = -0.0f - _219;
    float _235 = float(half(_211 * _204));
    float _236 = float(half(_211 * _205));
    float _237 = float(half(_211 * _209));
    half _249 = half(mad(_237, _218, mad(_236, _227, (_235 * (((_228 * _218) * _225) + 1.0f)))));
    half _250 = half(mad(_237, _219, mad(_236, ((_226 * _219) + _222), ((_235 * _222) * _227))));
    half _251 = half(mad(_237, _220, mad(_236, _234, (-0.0f - (_228 * _235)))));
    half _253 = rsqrt(dot(half3(_249, _250, _251), half3(_249, _250, _251)));
    half _257 = saturate(_139 * _139);
    half _258 = saturate(_143 * _143);
    half _259 = saturate(_148 * _148);
    half _275 = saturate(((_258 * 0.3395996h) + (_257 * 0.61328125h)) + (_259 * 0.04736328h));
    half _276 = saturate(((_258 * 0.9165039h) + (_257 * 0.07019043h)) + (_259 * 0.013450623h));
    half _277 = saturate(((_258 * 0.109558105h) + (_257 * 0.020614624h)) + (_259 * 0.8696289h));
    if (!((uint)(_112 + -65) < (uint)2)) {
      _289 = (_253 * _249);
      _290 = (_253 * _250);
      _291 = (_253 * _251);
      _292 = select((((_112 == 24)) || ((_112 == 29))), 0.0h, _152);
    } else {
      _289 = _193;
      _290 = _194;
      _291 = _195;
      _292 = _152;
    }
    half4 _294 = __3__36__0__0__g_diffuseResult.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
    float _298 = float(_294.x);
    float _299 = float(_294.y);
    float _300 = float(_294.z);
    [branch]
    if (_renderParams2.y > 0.0f) {
      half4 _306 = __3__36__0__0__g_sceneDiffuse.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
      _317 = (float(_306.x) + _298);
      _318 = (float(_306.y) + _299);
      _319 = (float(_306.z) + _300);
    } else {
      _317 = _298;
      _318 = _299;
      _319 = _300;
    }
    float4 _321 = __3__36__0__0__g_specularResult.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
    if ((uint)_112 > (uint)11) {
      if (!((((uint)_112 < (uint)21)) || ((_112 == 107)))) {
        _335 = (_112 == 7);
      } else {
        _335 = true;
      }
    } else {
      if (!(_112 == 6)) {
        _335 = (_112 == 7);
      } else {
        _335 = true;
      }
    }
    bool _345 = ((_112 == 38)) || (((((uint)(_112 + -27) < (uint)2)) || ((((_112 == 26)) || (((((uint)(_112 + -105) < (uint)2)) || (_175)))))));
    float _346 = float(_289);
    float _347 = float(_290);
    float _348 = float(_291);
    float _350 = (_104 * 2.0f) + -1.0f;
    float _352 = 1.0f - (_105 * 2.0f);
    float _388 = mad((_invViewProjRelative[3].z), _115, mad((_invViewProjRelative[3].y), _352, ((_invViewProjRelative[3].x) * _350))) + (_invViewProjRelative[3].w);
    float _389 = (mad((_invViewProjRelative[0].z), _115, mad((_invViewProjRelative[0].y), _352, ((_invViewProjRelative[0].x) * _350))) + (_invViewProjRelative[0].w)) / _388;
    float _390 = (mad((_invViewProjRelative[1].z), _115, mad((_invViewProjRelative[1].y), _352, ((_invViewProjRelative[1].x) * _350))) + (_invViewProjRelative[1].w)) / _388;
    float _391 = (mad((_invViewProjRelative[2].z), _115, mad((_invViewProjRelative[2].y), _352, ((_invViewProjRelative[2].x) * _350))) + (_invViewProjRelative[2].w)) / _388;
    float _393 = rsqrt(dot(float3(_389, _390, _391), float3(_389, _390, _391)));
    float _394 = _393 * _389;
    float _395 = _393 * _390;
    float _396 = _393 * _391;
    int _397 = _110.x & 126;
    bool _400 = ((_397 == 66)) || ((_112 == 54));
    bool _401 = (_112 == 33);
    bool _403 = (_112 == 55);
    if (((_397 == 64)) || (((((_401) || (_400))) || (((_403) || (_345)))))) {
      float4 _410 = __3__36__0__0__g_character.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
      _416 = _410.x;
      _417 = _410.y;
      _418 = _410.z;
      _419 = _410.w;
    } else {
      _416 = 0.0f;
      _417 = 0.0f;
      _418 = 0.0f;
      _419 = 0.0f;
    }
    if (_401) {
      uint _428 = uint((_clothLightingCategory.x * _416) + 0.5f);
      if (((_418 > 0.0f)) && (((uint)(int)(_428) < (uint)(int)(uint(_clothLightingCategory.x))))) {
        _442 = _418;
        _443 = min((1.0f - ((_clothLightingParameter[_428]).y)), ((_clothLightingParameter[_428]).x));
        _444 = saturate(_417);
        _445 = ((_clothLightingParameter[_428]).y);
        _446 = ((_clothLightingParameter[_428]).x);
      } else {
        _442 = 0.0f;
        _443 = 0.0f;
        _444 = 0.0f;
        _445 = 0.0f;
        _446 = 0.0f;
      }
      _452 = _112;
      _453 = half(_effectiveMetallicForVelvet * _446);
      _454 = _442;
      _455 = _443;
      _456 = _444;
      _457 = _445;
      _458 = _446;
    } else {
      if (_403) {
        if (!(_418 < 0.0010000000474974513f)) {
          uint _428 = uint((_clothLightingCategory.x * _416) + 0.5f);
          if (((_418 > 0.0f)) && (((uint)(int)(_428) < (uint)(int)(uint(_clothLightingCategory.x))))) {
            _442 = _418;
            _443 = min((1.0f - ((_clothLightingParameter[_428]).y)), ((_clothLightingParameter[_428]).x));
            _444 = saturate(_417);
            _445 = ((_clothLightingParameter[_428]).y);
            _446 = ((_clothLightingParameter[_428]).x);
          } else {
            _442 = 0.0f;
            _443 = 0.0f;
            _444 = 0.0f;
            _445 = 0.0f;
            _446 = 0.0f;
          }
          _452 = _112;
          _453 = half(_effectiveMetallicForVelvet * _446);
          _454 = _442;
          _455 = _443;
          _456 = _444;
          _457 = _445;
          _458 = _446;
        } else {
          _452 = 53;
          _453 = _292;
          _454 = 0.0f;
          _455 = 0.0f;
          _456 = 0.0f;
          _457 = 0.0f;
          _458 = 0.0f;
        }
      } else {
        _452 = _112;
        _453 = _292;
        _454 = 0.0f;
        _455 = 0.0f;
        _456 = 0.0f;
        _457 = 0.0f;
        _458 = 0.0f;
      }
    }
    bool __defer_451_489 = false;
    if (_452 == 66) {
      _490 = float(_453);
      __defer_451_489 = true;
    } else {
      bool _462 = (_452 == 54);
      bool __defer_460_486 = false;
      if (((_452 == 67)) || (_462)) {
        float _469 = float((uint)((uint)(((int)(_frameNumber.x * 73)) & 127)));
        if (!(float(_453) > (frac(frac(dot(float2(((_469 * 32.665000915527344f) + _97), ((_469 * 11.8149995803833f) + _98)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) * 0.20000000298023224f))) {
          bool __branch_chain_483;
          if ((_452 & 126) == 66) {
            _490 = 1.0f;
            __branch_chain_483 = true;
          } else {
            _487 = 1.0f;
            _488 = 0.0h;
            if (_462) {
              _490 = _487;
              __branch_chain_483 = true;
            } else {
              _503 = _487;
              _504 = _346;
              _505 = _347;
              _506 = _348;
              _507 = _488;
              __branch_chain_483 = false;
            }
          }
          if (__branch_chain_483) {
            __defer_451_489 = true;
          }
          bool _510 = (_452 == 54);
          if ((_510) || (((_452 & 126) == 66))) {
            float4 _514 = __3__36__0__0__g_bentCone.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
            float _521 = (_514.x * 2.0f) + -1.0f;
            float _522 = (_514.y * 2.0f) + -1.0f;
            float _523 = (_514.z * 2.0f) + -1.0f;
            float _525 = rsqrt(dot(float3(_521, _522, _523), float3(_521, _522, _523)));
            float _526 = _521 * _525;
            float _527 = _522 * _525;
            float _528 = _523 * _525;
            float _532 = float(saturate((_157 * 1.25h) + 0.25h));
            if (_510) {
              _547 = (((asfloat(_globalLightParams.z) * _532) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_161)));
            } else {
              _547 = _bevelParams.y;
            }
            float _548 = float(_275);
            float _549 = float(_276);
            float _550 = float(_277);
            float _551 = dot(float3(_504, _505, _506), float3(_526, _527, _528));
            float _552 = -0.0f - _394;
            float _553 = -0.0f - _395;
            float _554 = -0.0f - _396;
            float _555 = dot(float3(_504, _505, _506), float3(_552, _553, _554));
            float _561 = cos(abs(asin(_555) - asin(_551)) * 0.5f);
            float _565 = _526 - (_551 * _504);
            float _566 = _527 - (_551 * _505);
            float _567 = _528 - (_551 * _506);
            float _571 = _552 - (_555 * _504);
            float _572 = _553 - (_555 * _505);
            float _573 = _554 - (_555 * _506);
            float _580 = rsqrt((dot(float3(_571, _572, _573), float3(_571, _572, _573)) * dot(float3(_565, _566, _567), float3(_565, _566, _567))) + 9.999999747378752e-05f) * dot(float3(_565, _566, _567), float3(_571, _572, _573));
            float _590 = min(max(_532, 0.09803921729326248f), 1.0f);
            float _591 = _590 * _590;
            float _592 = _591 * 0.5f;
            float _593 = _591 * 2.0f;
            float _594 = _555 + _551;
            float _595 = _594 - _547;
            float _604 = 1.0f / ((1.190000057220459f / _561) + (_561 * 0.36000001430511475f));
            float _609 = ((_604 * (0.6000000238418579f - (_580 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_580 * 0.5f) + 0.5f));
            float _615 = 1.0f - (sqrt(saturate(1.0f - (_609 * _609))) * _561);
            float _616 = _615 * _615;
            float _620 = 0.9534794092178345f - ((_616 * _616) * (_615 * 0.9534794092178345f));
            float _621 = _604 * _609;
            float _626 = (sqrt(1.0f - (_621 * _621)) * 0.5f) / _561;
            float _627 = log2(_548);
            float _628 = log2(_549);
            float _629 = log2(_550);
            float _641 = ((_620 * _620) * (exp2((((_595 * _595) * -0.5f) / (_592 * _592)) * 1.4426950216293335f) / (_591 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_580 * 5.2658371925354f));
            float _645 = _594 - (_547 * 4.0f);
            float _655 = 1.0f - (_561 * 0.5f);
            float _656 = _655 * _655;
            float _660 = (_656 * _656) * (0.9534794092178345f - (_561 * 0.47673970460891724f));
            float _662 = 0.9534794092178345f - _660;
            float _663 = 0.800000011920929f / _561;
            float _676 = (((_662 * _662) * (_660 + 0.04652056470513344f)) * (exp2((((_645 * _645) * -0.5f) / (_593 * _593)) * 1.4426950216293335f) / (_591 * 5.013256549835205f))) * exp2((_580 * 24.525815963745117f) + -24.208423614501953f);
            float _686 = min(0.0f, (-0.0f - ((_641 * exp2(_627 * _626)) + (_676 * exp2(_663 * _627)))));
            float _687 = min(0.0f, (-0.0f - ((_641 * exp2(_628 * _626)) + (_676 * exp2(_663 * _628)))));
            float _688 = min(0.0f, (-0.0f - ((_641 * exp2(_629 * _626)) + (_676 * exp2(_663 * _629)))));
            float _697 = saturate(abs(dot(float3(_526, _527, _528), float3(_504, _505, _506))));
            float2 _706 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_627 * 1.5f)))), 0.0f);
            float2 _709 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_628 * 1.5f)))), 0.0f);
            float2 _712 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_629 * 1.5f)))), 0.0f);
            float _719 = min(0.9900000095367432f, _706.x);
            float _720 = min(0.9900000095367432f, _709.x);
            float _721 = min(0.9900000095367432f, _712.x);
            float _722 = min(0.9900000095367432f, _706.y);
            float _723 = min(0.9900000095367432f, _709.y);
            float _724 = min(0.9900000095367432f, _712.y);
            float _725 = _719 * _719;
            float _726 = _720 * _720;
            float _727 = _721 * _721;
            float _728 = _722 * _722;
            float _729 = _723 * _723;
            float _730 = _724 * _724;
            float _731 = _728 * _722;
            float _732 = _729 * _723;
            float _733 = _730 * _724;
            float _734 = 1.0f - _725;
            float _735 = 1.0f - _726;
            float _736 = 1.0f - _727;
            float _746 = _734 * _734;
            float _747 = _735 * _735;
            float _748 = _736 * _736;
            float _749 = _746 * _734;
            float _750 = _747 * _735;
            float _751 = _748 * _736;
            float _759 = min(max(_532, 0.18000000715255737f), 0.6000000238418579f);
            float _760 = _759 * _759;
            float _761 = _760 * 0.25f;
            float _762 = _760 * 4.0f;
            float _764 = (_720 + _719) + _721;
            float _765 = _719 / _764;
            float _766 = _720 / _764;
            float _767 = _721 / _764;
            float _768 = dot(float3(_760, _761, _762), float3(_765, _766, _767));
            float _769 = _768 * _768;
            float _772 = asin(min(max(_555, -1.0f), 1.0f)) + asin(min(max(_551, -1.0f), 1.0f));
            float _773 = _772 * 0.5f;
            float _774 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_765, _766, _767));
            float _784 = _774 * _774;
            float _807 = (_723 + _722) + _724;
            float _811 = dot(float3(_760, _761, _762), float3((_722 / _807), (_723 / _807), (_724 / _807)));
            float _815 = sqrt((_811 * _811) + (_769 * 2.0f));
            float _833 = (_811 * 3.0f) + (_768 * 2.0f);
            float _840 = (((_731 + _722) * ((_725 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _731) + _722);
            float _841 = (((_732 + _723) * ((_726 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _732) + _723);
            float _842 = (((_733 + _724) * ((_727 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _733) + _724);
            float _851 = _773 - (((_784 * (((_725 * 4.0f) * _728) + (_746 * 2.0f))) * (1.0f - ((_728 * 2.0f) / _746))) / _749);
            float _858 = _773 - (((_784 * (((_726 * 4.0f) * _729) + (_747 * 2.0f))) * (1.0f - ((_729 * 2.0f) / _747))) / _750);
            float _865 = _773 - (((_784 * (((_727 * 4.0f) * _730) + (_748 * 2.0f))) * (1.0f - ((_730 * 2.0f) / _748))) / _751);
            float _893 = exp2((((_772 * -0.25f) * _773) / _769) * 1.4426950216293335f) * 1.399999976158142f;
            float _894 = ((((((_731 * _725) / _749) + ((_722 * _725) / _734)) * 4.398229598999023f) * exp2((((_851 * _851) * -0.5f) / ((_840 * _840) + _769)) * 1.4426950216293335f)) + ((((_706.x + _686) * 0.25f) - _686) * 6.2831854820251465f)) * _893;
            float _895 = ((((((_732 * _726) / _750) + ((_723 * _726) / _735)) * 4.398229598999023f) * exp2((((_858 * _858) * -0.5f) / ((_841 * _841) + _769)) * 1.4426950216293335f)) + ((((_709.x + _687) * 0.25f) - _687) * 6.2831854820251465f)) * _893;
            float _896 = ((((((_733 * _727) / _751) + ((_724 * _727) / _736)) * 4.398229598999023f) * exp2((((_865 * _865) * -0.5f) / ((_842 * _842) + _769)) * 1.4426950216293335f)) + ((((_712.x + _688) * 0.25f) - _688) * 6.2831854820251465f)) * _893;
            float _897 = max(0.125f, _503);
            _911 = _507;
            _912 = _504;
            _913 = _505;
            _914 = _506;
            _915 = _452;
            _916 = _503;
            _917 = max(0.009999999776482582f, ((_897 * (_548 - _894)) + _894));
            _918 = max(0.009999999776482582f, (lerp(_895, _549, _897)));
            _919 = max(0.009999999776482582f, (lerp(_896, _550, _897)));
          } else {
            _911 = _507;
            _912 = _504;
            _913 = _505;
            _914 = _506;
            _915 = _452;
            _916 = _503;
            _917 = 0.0f;
            _918 = 0.0f;
            _919 = 0.0f;
          }
        } else {
          _911 = 0.0h;
          _912 = _346;
          _913 = _347;
          _914 = _348;
          _915 = 53;
          _916 = 1.0f;
          _917 = 0.0f;
          _918 = 0.0f;
          _919 = 0.0f;
        }
      } else {
        _487 = 0.0f;
        _488 = _453;
        __defer_460_486 = true;
      }
      if (__defer_460_486) {
        if (_462) {
          _490 = _487;
          __defer_451_489 = true;
        } else {
          _503 = _487;
          _504 = _346;
          _505 = _347;
          _506 = _348;
          _507 = _488;
        }
        bool _510 = (_452 == 54);
        if ((_510) || (((_452 & 126) == 66))) {
          float4 _514 = __3__36__0__0__g_bentCone.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
          float _521 = (_514.x * 2.0f) + -1.0f;
          float _522 = (_514.y * 2.0f) + -1.0f;
          float _523 = (_514.z * 2.0f) + -1.0f;
          float _525 = rsqrt(dot(float3(_521, _522, _523), float3(_521, _522, _523)));
          float _526 = _521 * _525;
          float _527 = _522 * _525;
          float _528 = _523 * _525;
          float _532 = float(saturate((_157 * 1.25h) + 0.25h));
          if (_510) {
            _547 = (((asfloat(_globalLightParams.z) * _532) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_161)));
          } else {
            _547 = _bevelParams.y;
          }
          float _548 = float(_275);
          float _549 = float(_276);
          float _550 = float(_277);
          float _551 = dot(float3(_504, _505, _506), float3(_526, _527, _528));
          float _552 = -0.0f - _394;
          float _553 = -0.0f - _395;
          float _554 = -0.0f - _396;
          float _555 = dot(float3(_504, _505, _506), float3(_552, _553, _554));
          float _561 = cos(abs(asin(_555) - asin(_551)) * 0.5f);
          float _565 = _526 - (_551 * _504);
          float _566 = _527 - (_551 * _505);
          float _567 = _528 - (_551 * _506);
          float _571 = _552 - (_555 * _504);
          float _572 = _553 - (_555 * _505);
          float _573 = _554 - (_555 * _506);
          float _580 = rsqrt((dot(float3(_571, _572, _573), float3(_571, _572, _573)) * dot(float3(_565, _566, _567), float3(_565, _566, _567))) + 9.999999747378752e-05f) * dot(float3(_565, _566, _567), float3(_571, _572, _573));
          float _590 = min(max(_532, 0.09803921729326248f), 1.0f);
          float _591 = _590 * _590;
          float _592 = _591 * 0.5f;
          float _593 = _591 * 2.0f;
          float _594 = _555 + _551;
          float _595 = _594 - _547;
          float _604 = 1.0f / ((1.190000057220459f / _561) + (_561 * 0.36000001430511475f));
          float _609 = ((_604 * (0.6000000238418579f - (_580 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_580 * 0.5f) + 0.5f));
          float _615 = 1.0f - (sqrt(saturate(1.0f - (_609 * _609))) * _561);
          float _616 = _615 * _615;
          float _620 = 0.9534794092178345f - ((_616 * _616) * (_615 * 0.9534794092178345f));
          float _621 = _604 * _609;
          float _626 = (sqrt(1.0f - (_621 * _621)) * 0.5f) / _561;
          float _627 = log2(_548);
          float _628 = log2(_549);
          float _629 = log2(_550);
          float _641 = ((_620 * _620) * (exp2((((_595 * _595) * -0.5f) / (_592 * _592)) * 1.4426950216293335f) / (_591 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_580 * 5.2658371925354f));
          float _645 = _594 - (_547 * 4.0f);
          float _655 = 1.0f - (_561 * 0.5f);
          float _656 = _655 * _655;
          float _660 = (_656 * _656) * (0.9534794092178345f - (_561 * 0.47673970460891724f));
          float _662 = 0.9534794092178345f - _660;
          float _663 = 0.800000011920929f / _561;
          float _676 = (((_662 * _662) * (_660 + 0.04652056470513344f)) * (exp2((((_645 * _645) * -0.5f) / (_593 * _593)) * 1.4426950216293335f) / (_591 * 5.013256549835205f))) * exp2((_580 * 24.525815963745117f) + -24.208423614501953f);
          float _686 = min(0.0f, (-0.0f - ((_641 * exp2(_627 * _626)) + (_676 * exp2(_663 * _627)))));
          float _687 = min(0.0f, (-0.0f - ((_641 * exp2(_628 * _626)) + (_676 * exp2(_663 * _628)))));
          float _688 = min(0.0f, (-0.0f - ((_641 * exp2(_629 * _626)) + (_676 * exp2(_663 * _629)))));
          float _697 = saturate(abs(dot(float3(_526, _527, _528), float3(_504, _505, _506))));
          float2 _706 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_627 * 1.5f)))), 0.0f);
          float2 _709 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_628 * 1.5f)))), 0.0f);
          float2 _712 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_629 * 1.5f)))), 0.0f);
          float _719 = min(0.9900000095367432f, _706.x);
          float _720 = min(0.9900000095367432f, _709.x);
          float _721 = min(0.9900000095367432f, _712.x);
          float _722 = min(0.9900000095367432f, _706.y);
          float _723 = min(0.9900000095367432f, _709.y);
          float _724 = min(0.9900000095367432f, _712.y);
          float _725 = _719 * _719;
          float _726 = _720 * _720;
          float _727 = _721 * _721;
          float _728 = _722 * _722;
          float _729 = _723 * _723;
          float _730 = _724 * _724;
          float _731 = _728 * _722;
          float _732 = _729 * _723;
          float _733 = _730 * _724;
          float _734 = 1.0f - _725;
          float _735 = 1.0f - _726;
          float _736 = 1.0f - _727;
          float _746 = _734 * _734;
          float _747 = _735 * _735;
          float _748 = _736 * _736;
          float _749 = _746 * _734;
          float _750 = _747 * _735;
          float _751 = _748 * _736;
          float _759 = min(max(_532, 0.18000000715255737f), 0.6000000238418579f);
          float _760 = _759 * _759;
          float _761 = _760 * 0.25f;
          float _762 = _760 * 4.0f;
          float _764 = (_720 + _719) + _721;
          float _765 = _719 / _764;
          float _766 = _720 / _764;
          float _767 = _721 / _764;
          float _768 = dot(float3(_760, _761, _762), float3(_765, _766, _767));
          float _769 = _768 * _768;
          float _772 = asin(min(max(_555, -1.0f), 1.0f)) + asin(min(max(_551, -1.0f), 1.0f));
          float _773 = _772 * 0.5f;
          float _774 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_765, _766, _767));
          float _784 = _774 * _774;
          float _807 = (_723 + _722) + _724;
          float _811 = dot(float3(_760, _761, _762), float3((_722 / _807), (_723 / _807), (_724 / _807)));
          float _815 = sqrt((_811 * _811) + (_769 * 2.0f));
          float _833 = (_811 * 3.0f) + (_768 * 2.0f);
          float _840 = (((_731 + _722) * ((_725 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _731) + _722);
          float _841 = (((_732 + _723) * ((_726 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _732) + _723);
          float _842 = (((_733 + _724) * ((_727 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _733) + _724);
          float _851 = _773 - (((_784 * (((_725 * 4.0f) * _728) + (_746 * 2.0f))) * (1.0f - ((_728 * 2.0f) / _746))) / _749);
          float _858 = _773 - (((_784 * (((_726 * 4.0f) * _729) + (_747 * 2.0f))) * (1.0f - ((_729 * 2.0f) / _747))) / _750);
          float _865 = _773 - (((_784 * (((_727 * 4.0f) * _730) + (_748 * 2.0f))) * (1.0f - ((_730 * 2.0f) / _748))) / _751);
          float _893 = exp2((((_772 * -0.25f) * _773) / _769) * 1.4426950216293335f) * 1.399999976158142f;
          float _894 = ((((((_731 * _725) / _749) + ((_722 * _725) / _734)) * 4.398229598999023f) * exp2((((_851 * _851) * -0.5f) / ((_840 * _840) + _769)) * 1.4426950216293335f)) + ((((_706.x + _686) * 0.25f) - _686) * 6.2831854820251465f)) * _893;
          float _895 = ((((((_732 * _726) / _750) + ((_723 * _726) / _735)) * 4.398229598999023f) * exp2((((_858 * _858) * -0.5f) / ((_841 * _841) + _769)) * 1.4426950216293335f)) + ((((_709.x + _687) * 0.25f) - _687) * 6.2831854820251465f)) * _893;
          float _896 = ((((((_733 * _727) / _751) + ((_724 * _727) / _736)) * 4.398229598999023f) * exp2((((_865 * _865) * -0.5f) / ((_842 * _842) + _769)) * 1.4426950216293335f)) + ((((_712.x + _688) * 0.25f) - _688) * 6.2831854820251465f)) * _893;
          float _897 = max(0.125f, _503);
          _911 = _507;
          _912 = _504;
          _913 = _505;
          _914 = _506;
          _915 = _452;
          _916 = _503;
          _917 = max(0.009999999776482582f, ((_897 * (_548 - _894)) + _894));
          _918 = max(0.009999999776482582f, (lerp(_895, _549, _897)));
          _919 = max(0.009999999776482582f, (lerp(_896, _550, _897)));
        } else {
          _911 = _507;
          _912 = _504;
          _913 = _505;
          _914 = _506;
          _915 = _452;
          _916 = _503;
          _917 = 0.0f;
          _918 = 0.0f;
          _919 = 0.0f;
        }
      }
    }
    if (__defer_451_489) {
      float _494 = (_416 * 2.0f) + -1.0f;
      float _495 = (_417 * 2.0f) + -1.0f;
      float _496 = (_418 * 2.0f) + -1.0f;
      float _498 = rsqrt(dot(float3(_494, _495, _496), float3(_494, _495, _496)));
      _503 = _490;
      _504 = (_498 * _494);
      _505 = (_498 * _495);
      _506 = (_498 * _496);
      _507 = 0.0h;
      bool _510 = (_452 == 54);
      if ((_510) || (((_452 & 126) == 66))) {
        float4 _514 = __3__36__0__0__g_bentCone.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
        float _521 = (_514.x * 2.0f) + -1.0f;
        float _522 = (_514.y * 2.0f) + -1.0f;
        float _523 = (_514.z * 2.0f) + -1.0f;
        float _525 = rsqrt(dot(float3(_521, _522, _523), float3(_521, _522, _523)));
        float _526 = _521 * _525;
        float _527 = _522 * _525;
        float _528 = _523 * _525;
        float _532 = float(saturate((_157 * 1.25h) + 0.25h));
        if (_510) {
          _547 = (((asfloat(_globalLightParams.z) * _532) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_161)));
        } else {
          _547 = _bevelParams.y;
        }
        float _548 = float(_275);
        float _549 = float(_276);
        float _550 = float(_277);
        float _551 = dot(float3(_504, _505, _506), float3(_526, _527, _528));
        float _552 = -0.0f - _394;
        float _553 = -0.0f - _395;
        float _554 = -0.0f - _396;
        float _555 = dot(float3(_504, _505, _506), float3(_552, _553, _554));
        float _561 = cos(abs(asin(_555) - asin(_551)) * 0.5f);
        float _565 = _526 - (_551 * _504);
        float _566 = _527 - (_551 * _505);
        float _567 = _528 - (_551 * _506);
        float _571 = _552 - (_555 * _504);
        float _572 = _553 - (_555 * _505);
        float _573 = _554 - (_555 * _506);
        float _580 = rsqrt((dot(float3(_571, _572, _573), float3(_571, _572, _573)) * dot(float3(_565, _566, _567), float3(_565, _566, _567))) + 9.999999747378752e-05f) * dot(float3(_565, _566, _567), float3(_571, _572, _573));
        float _590 = min(max(_532, 0.09803921729326248f), 1.0f);
        float _591 = _590 * _590;
        float _592 = _591 * 0.5f;
        float _593 = _591 * 2.0f;
        float _594 = _555 + _551;
        float _595 = _594 - _547;
        float _604 = 1.0f / ((1.190000057220459f / _561) + (_561 * 0.36000001430511475f));
        float _609 = ((_604 * (0.6000000238418579f - (_580 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_580 * 0.5f) + 0.5f));
        float _615 = 1.0f - (sqrt(saturate(1.0f - (_609 * _609))) * _561);
        float _616 = _615 * _615;
        float _620 = 0.9534794092178345f - ((_616 * _616) * (_615 * 0.9534794092178345f));
        float _621 = _604 * _609;
        float _626 = (sqrt(1.0f - (_621 * _621)) * 0.5f) / _561;
        float _627 = log2(_548);
        float _628 = log2(_549);
        float _629 = log2(_550);
        float _641 = ((_620 * _620) * (exp2((((_595 * _595) * -0.5f) / (_592 * _592)) * 1.4426950216293335f) / (_591 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_580 * 5.2658371925354f));
        float _645 = _594 - (_547 * 4.0f);
        float _655 = 1.0f - (_561 * 0.5f);
        float _656 = _655 * _655;
        float _660 = (_656 * _656) * (0.9534794092178345f - (_561 * 0.47673970460891724f));
        float _662 = 0.9534794092178345f - _660;
        float _663 = 0.800000011920929f / _561;
        float _676 = (((_662 * _662) * (_660 + 0.04652056470513344f)) * (exp2((((_645 * _645) * -0.5f) / (_593 * _593)) * 1.4426950216293335f) / (_591 * 5.013256549835205f))) * exp2((_580 * 24.525815963745117f) + -24.208423614501953f);
        float _686 = min(0.0f, (-0.0f - ((_641 * exp2(_627 * _626)) + (_676 * exp2(_663 * _627)))));
        float _687 = min(0.0f, (-0.0f - ((_641 * exp2(_628 * _626)) + (_676 * exp2(_663 * _628)))));
        float _688 = min(0.0f, (-0.0f - ((_641 * exp2(_629 * _626)) + (_676 * exp2(_663 * _629)))));
        float _697 = saturate(abs(dot(float3(_526, _527, _528), float3(_504, _505, _506))));
        float2 _706 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_627 * 1.5f)))), 0.0f);
        float2 _709 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_628 * 1.5f)))), 0.0f);
        float2 _712 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_697, _532, saturate(sqrt(exp2(_629 * 1.5f)))), 0.0f);
        float _719 = min(0.9900000095367432f, _706.x);
        float _720 = min(0.9900000095367432f, _709.x);
        float _721 = min(0.9900000095367432f, _712.x);
        float _722 = min(0.9900000095367432f, _706.y);
        float _723 = min(0.9900000095367432f, _709.y);
        float _724 = min(0.9900000095367432f, _712.y);
        float _725 = _719 * _719;
        float _726 = _720 * _720;
        float _727 = _721 * _721;
        float _728 = _722 * _722;
        float _729 = _723 * _723;
        float _730 = _724 * _724;
        float _731 = _728 * _722;
        float _732 = _729 * _723;
        float _733 = _730 * _724;
        float _734 = 1.0f - _725;
        float _735 = 1.0f - _726;
        float _736 = 1.0f - _727;
        float _746 = _734 * _734;
        float _747 = _735 * _735;
        float _748 = _736 * _736;
        float _749 = _746 * _734;
        float _750 = _747 * _735;
        float _751 = _748 * _736;
        float _759 = min(max(_532, 0.18000000715255737f), 0.6000000238418579f);
        float _760 = _759 * _759;
        float _761 = _760 * 0.25f;
        float _762 = _760 * 4.0f;
        float _764 = (_720 + _719) + _721;
        float _765 = _719 / _764;
        float _766 = _720 / _764;
        float _767 = _721 / _764;
        float _768 = dot(float3(_760, _761, _762), float3(_765, _766, _767));
        float _769 = _768 * _768;
        float _772 = asin(min(max(_555, -1.0f), 1.0f)) + asin(min(max(_551, -1.0f), 1.0f));
        float _773 = _772 * 0.5f;
        float _774 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_765, _766, _767));
        float _784 = _774 * _774;
        float _807 = (_723 + _722) + _724;
        float _811 = dot(float3(_760, _761, _762), float3((_722 / _807), (_723 / _807), (_724 / _807)));
        float _815 = sqrt((_811 * _811) + (_769 * 2.0f));
        float _833 = (_811 * 3.0f) + (_768 * 2.0f);
        float _840 = (((_731 + _722) * ((_725 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _731) + _722);
        float _841 = (((_732 + _723) * ((_726 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _732) + _723);
        float _842 = (((_733 + _724) * ((_727 * 0.699999988079071f) + 1.0f)) * _815) / ((_833 * _733) + _724);
        float _851 = _773 - (((_784 * (((_725 * 4.0f) * _728) + (_746 * 2.0f))) * (1.0f - ((_728 * 2.0f) / _746))) / _749);
        float _858 = _773 - (((_784 * (((_726 * 4.0f) * _729) + (_747 * 2.0f))) * (1.0f - ((_729 * 2.0f) / _747))) / _750);
        float _865 = _773 - (((_784 * (((_727 * 4.0f) * _730) + (_748 * 2.0f))) * (1.0f - ((_730 * 2.0f) / _748))) / _751);
        float _893 = exp2((((_772 * -0.25f) * _773) / _769) * 1.4426950216293335f) * 1.399999976158142f;
        float _894 = ((((((_731 * _725) / _749) + ((_722 * _725) / _734)) * 4.398229598999023f) * exp2((((_851 * _851) * -0.5f) / ((_840 * _840) + _769)) * 1.4426950216293335f)) + ((((_706.x + _686) * 0.25f) - _686) * 6.2831854820251465f)) * _893;
        float _895 = ((((((_732 * _726) / _750) + ((_723 * _726) / _735)) * 4.398229598999023f) * exp2((((_858 * _858) * -0.5f) / ((_841 * _841) + _769)) * 1.4426950216293335f)) + ((((_709.x + _687) * 0.25f) - _687) * 6.2831854820251465f)) * _893;
        float _896 = ((((((_733 * _727) / _751) + ((_724 * _727) / _736)) * 4.398229598999023f) * exp2((((_865 * _865) * -0.5f) / ((_842 * _842) + _769)) * 1.4426950216293335f)) + ((((_712.x + _688) * 0.25f) - _688) * 6.2831854820251465f)) * _893;
        float _897 = max(0.125f, _503);
        _911 = _507;
        _912 = _504;
        _913 = _505;
        _914 = _506;
        _915 = _452;
        _916 = _503;
        _917 = max(0.009999999776482582f, ((_897 * (_548 - _894)) + _894));
        _918 = max(0.009999999776482582f, (lerp(_895, _549, _897)));
        _919 = max(0.009999999776482582f, (lerp(_896, _550, _897)));
      } else {
        _911 = _507;
        _912 = _504;
        _913 = _505;
        _914 = _506;
        _915 = _452;
        _916 = _503;
        _917 = 0.0f;
        _918 = 0.0f;
        _919 = 0.0f;
      }
    }
    float _926 = -0.0f - min(0.0f, (-0.0f - _317));
    float _927 = -0.0f - min(0.0f, (-0.0f - _318));
    float _928 = -0.0f - min(0.0f, (-0.0f - _319));
    half2 _930 = __3__36__0__0__g_sceneAO.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
    if ((uint)_915 > (uint)11) {
      bool _938 = ((uint)_915 < (uint)19);
      if (!((uint)_915 < (uint)20)) {
        _941 = _938;
        _944 = _941;
        _945 = (_915 == 107);
      } else {
        _944 = _938;
        _945 = true;
      }
    } else {
      if (!((uint)_915 > (uint)10)) {
        _941 = false;
        _944 = _941;
        _945 = (_915 == 107);
      } else {
        _944 = false;
        _945 = true;
      }
    }
    bool _950 = (_915 == 65);
    bool _951 = (_950) || (((_944) || ((((_915 == 96)) || (_945)))));
    float _954 = select(_951, float(_911), 0.0f);
    bool _956 = ((uint)(_915 & 24) > (uint)23);
    if (_956) {
      bool _958 = (_915 == 29);
      if (_958) {
        _963 = float(saturate(_157));
      } else {
        _963 = 0.0f;
      }
      uint _965 = uint((float)(_161 * 255.0h));
      if (_174) {
        _974 = select((((int)(_965) & 128) != 0), 1.0f, 0.0f);
        _975 = (float((uint)((uint)((int)(_965) & 127))) * 0.007874015718698502f);
      } else {
        _974 = 0.0f;
        _975 = 0.0f;
      }
      half _976 = half(_975);
      bool _980 = (_976 > 0.99902344h);
      _985 = _976;
      _986 = select((((_915 == 24)) || (_958)), 0.010002136h, _157);
      _987 = select(_980, 1.0h, _275);
      _988 = select(_980, 1.0h, _276);
      _989 = select(_980, 1.0h, _277);
      _990 = _974;
      _991 = _963;
    } else {
      _985 = select(_951, 0.0h, _911);
      _986 = _157;
      _987 = _275;
      _988 = _276;
      _989 = _277;
      _990 = 0.0f;
      _991 = 0.0f;
    }
    // RenoDX: Dynamic foliage colour correction
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_112 - 12) < 7u)) {
      float3 _fcBaseColor = float3(float(_987), float(_988), float(_989));
      float3 _fcCorrected = FoliageColorCorrect(_fcBaseColor, _sunDirection.xyz, 1.0f, float3(1.0f, 1.0f, 1.0f));
      _987 = half(_fcCorrected.x);
      _988 = half(_fcCorrected.y);
      _989 = half(_fcCorrected.z);
    }
    // RenoDX: Foliage selective colour
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_112 - 12) < 7u)) {
      float3 _fscColor = FoliageSelectiveColor(float3(float(_987), float(_988), float(_989)));
      _987 = half(_fscColor.x);
      _988 = half(_fscColor.y);
      _989 = half(_fscColor.z);
    }
    int _992 = _915 & -2;
    bool _993 = (_992 == 66);
    bool _994 = (_915 == 54);
    bool _995 = (_994) || (_993);
    float _996 = -0.0f - _394;
    float _997 = -0.0f - _395;
    float _998 = -0.0f - _396;
    float _999 = dot(float3(_996, _997, _998), float3(_346, _347, _348));
    if (_995) {
      _1003 = abs(_999);
    } else {
      _1003 = _999;
    }
    float _1004 = saturate(_1003);
    bool _1006 = ((_110.x & 128) == 0);
    if (_1006) {
      if ((uint)_112 > (uint)52) {
        if (!((((_110.x & 125) == 105)) || (((uint)_112 < (uint)68)))) {
          _1026 = (_112 == 98);
        } else {
          _1026 = true;
        }
      } else {
        if ((uint)_112 > (uint)10) {
          if ((uint)_112 < (uint)20) {
            if (_397 == 14) {
              _1026 = (_112 == 98);
            } else {
              _1026 = true;
            }
          } else {
            if (!((_110.x & 125) == 105)) {
              _1026 = (_112 == 98);
            } else {
              _1026 = true;
            }
          }
        } else {
          _1026 = (_112 == 98);
        }
      }
    } else {
      _1026 = true;
    }
    [branch]
    if (_956) {
      uint _1029 = __3__36__0__0__g_depthOpaque.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
      _1035 = (float((uint)((uint)(_1029.x & 16777215))) * 5.960465188081798e-08f);
    } else {
      _1035 = _107.x;
    }
    float _1063 = mad((_projToPrevProj[3].z), _1035, mad((_projToPrevProj[3].y), _352, ((_projToPrevProj[3].x) * _350))) + (_projToPrevProj[3].w);
    if (_1026) {
      float2 _1070 = __3__36__0__0__g_velocity.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
      _1076 = (_1070.x * 2.0f);
      _1077 = (_1070.y * 2.0f);
    } else {
      _1076 = (((mad((_projToPrevProj[0].z), _1035, mad((_projToPrevProj[0].y), _352, ((_projToPrevProj[0].x) * _350))) + (_projToPrevProj[0].w)) / _1063) - _350);
      _1077 = (((mad((_projToPrevProj[1].z), _1035, mad((_projToPrevProj[1].y), _352, ((_projToPrevProj[1].x) * _350))) + (_projToPrevProj[1].w)) / _1063) - _352);
    }
    float _1079 = _nearFarProj.x / max(1.0000000116860974e-07f, _1035);
    float _1082 = (_1076 * 0.5f) + _104;
    float _1083 = _105 - (_1077 * 0.5f);
    float _1091 = select((((((_1082 < 0.0f)) || ((_1082 > 1.0f)))) || ((((_1083 < 0.0f)) || ((_1083 > 1.0f))))), 1.0f, 0.0f);
    float _1096 = (_1082 * _bufferSizeAndInvSize.x) + -0.5f;
    float _1097 = (_1083 * _bufferSizeAndInvSize.y) + -0.5f;
    int _1100 = int(floor(_1096));
    int _1101 = int(floor(_1097));
    float _1102 = float((int)(_1100));
    float _1103 = float((int)(_1101));
    float _1106 = (_1102 + 0.5f) * _bufferSizeAndInvSize.z;
    float _1107 = (_1103 + 0.5f) * _bufferSizeAndInvSize.w;
    int4 _1110 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1106, _1107));
    int _1133 = asint(((((uint)((uint)((uint)(_1110.w)) >> 24))) * (16777216u)) + ((uint)(asint(((((uint)((uint)((uint)(_1110.z)) >> 24))) * (65536u)) + ((uint)(asint(((((uint)((uint)((uint)(_1110.y)) >> 24))) * (256u)) + (((uint)((uint)((uint)(_1110.x)) >> 24))))))))));
    if (_1006) {
      if ((uint)_112 > (uint)52) {
        if (!(((_112 == 98)) || (((((_110.x & 125) == 105)) || (((uint)_112 < (uint)68)))))) {
          _1163 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _1163 = 0.0f;
        }
      } else {
        if ((uint)_112 > (uint)10) {
          if ((uint)_112 < (uint)20) {
            if (_397 == 14) {
              _1163 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1163 = 0.0f;
            }
          } else {
            if (!((_110.x & 125) == 105)) {
              _1163 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1163 = 0.0f;
            }
          }
        } else {
          _1163 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _1163 = 0.0f;
    }
    float _1171 = _screenPercentage.x * 2.0f;
    float _1172 = _1171 * abs(_104 + -0.5f);
    float _1173 = _screenPercentage.y * 2.0f;
    float _1174 = _1173 * abs(_105 + -0.5f);
    float _1178 = sqrt(dot(float2(_1172, _1174), float2(_1172, _1174)) + 1.0f) * _1079;
    float _1195 = _1171 * abs(_1082 + -0.5f);
    float _1196 = _1173 * abs(_1083 + -0.5f);
    float _1199 = sqrt(dot(float2(_1195, _1196), float2(_1195, _1196)) + 1.0f);
    bool _1214 = (_335) || (((uint)(_915 + -97) < (uint)2));
    float _1216 = _1079 * _1079;
    float _1218 = (_1216 * select(_1214, 0.5f, 0.20000000298023224f)) + 1.0f;
    bool _1222 = ((uint)(_915 + -53) < (uint)15);
    if (_1222) {
      _1241 = (1000.0f - (saturate(float((bool)(uint)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _1241 = 50.0f;
    }
    float _1251 = select((((_915 == 57)) || (_1222)), 0.0f, ((max(0.0f, (_1079 + -1.0f)) * 0.10000000149011612f) * _temporalReprojectionParams.y));
    float _1256 = max(0.0f, (abs(_1178 - (_1199 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_1110.x & 16777215))) * 5.960465188081798e-08f))) - _1163))) - _1251));
    float _1257 = max(0.0f, (abs(_1178 - (_1199 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_1110.y & 16777215))) * 5.960465188081798e-08f))) - _1163))) - _1251));
    float _1258 = max(0.0f, (abs(_1178 - (_1199 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_1110.z & 16777215))) * 5.960465188081798e-08f))) - _1163))) - _1251));
    float _1259 = max(0.0f, (abs(_1178 - (_1199 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_1110.w & 16777215))) * 5.960465188081798e-08f))) - _1163))) - _1251));
    float _1260 = _1256 * _1256;
    float _1261 = _1257 * _1257;
    float _1262 = _1258 * _1258;
    float _1263 = _1259 * _1259;
    float _1265 = (-1.4426950216293335f / ((_1216 * 0.10000000149011612f) + 1.0f)) * select(_1214, 0.20000000298023224f, _1241);
    float _1278 = select((_1260 > _1218), 0.0f, exp2(_1260 * _1265));
    float _1279 = select((_1261 > _1218), 0.0f, exp2(_1261 * _1265));
    float _1280 = select((_1262 > _1218), 0.0f, exp2(_1262 * _1265));
    float _1281 = select((_1263 > _1218), 0.0f, exp2(_1263 * _1265));
    if (!_956) {
      int _1283 = _1133 & 127;
      int _1284 = _1133 & 32512;
      int _1285 = _1133 & 8323072;
      int _1286 = _1133 & 2130706432;
      bool _1325 = ((_1283 == 57)) || (((uint)(_1283 + -53) < (uint)15));
      bool _1326 = ((_1284 == 14592)) || (((uint)((((uint)((uint)(_1133)) >> 8) & 127) + -53) < (uint)15));
      bool _1327 = ((_1285 == 3735552)) || (((uint)((((uint)((uint)(_1133)) >> 16) & 127) + -53) < (uint)15));
      bool _1328 = ((_1286 == 956301312)) || (((uint)((((uint)((uint)(_1133)) >> 24) & 127) + -53) < (uint)15));
      if (_1006) {
        _1346 = (((_112 == 57)) || (((uint)(_112 + -53) < (uint)15)));
      } else {
        _1346 = true;
      }
      bool _1355 = (_915 == 6);
      bool _1377 = ((uint)(_915 + -105) < (uint)3);
      bool _1384 = ((_112 == 57)) || (((uint)(_112 + -53) < (uint)15));
      _1418 = (float((bool)((uint)((((_400) || ((((_1283 != 54)) && (((_1133 & 126) != 66)))))) && ((!(((((((_1133 & 128) != 0)) || (_1325)) ^ _1346)) || ((((_1355 ^ (_1283 == 6))) || ((((_1377 ^ (((_1283 == 107)) || (((uint)(_1283 + -105) < (uint)2))))) || ((_1325 ^ _1384)))))))))))) * _1278);
      _1419 = (float((bool)((uint)((((_400) || ((((_1284 != 13824)) && (((_1133 & 32256) != 16896)))))) && ((!(((((((_1133 & 32768) != 0)) || (_1326)) ^ _1346)) || ((((_1355 ^ (_1284 == 1536))) || ((((_1377 ^ ((((_1133 & 32000) == 26880)) || ((_1284 == 27136))))) || ((_1326 ^ _1384)))))))))))) * _1279);
      _1420 = (float((bool)((uint)((((_400) || ((((_1285 != 3538944)) && (((_1133 & 8257536) != 4325376)))))) && ((!(((((((_1133 & 8388608) != 0)) || (_1327)) ^ _1346)) || ((((_1355 ^ (_1285 == 393216))) || ((((_1377 ^ ((((_1133 & 8192000) == 6881280)) || ((_1285 == 6946816))))) || ((_1327 ^ _1384)))))))))))) * _1280);
      _1421 = (float((bool)((uint)((((_400) || ((((_1286 != 905969664)) && (((_1133 & 2113929216) != 1107296256)))))) && ((!(((((((int)_1133 < (int)0)) || (_1328)) ^ _1346)) || ((((_1355 ^ (_1286 == 100663296))) || ((((_1377 ^ ((((_1133 & 2097152000) == 1761607680)) || ((_1286 == 1778384896))))) || ((_1328 ^ _1384)))))))))))) * _1281);
    } else {
      _1418 = _1278;
      _1419 = _1279;
      _1420 = _1280;
      _1421 = _1281;
    }
    int4 _1423 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1106, _1107));
    float _1442 = min(1.0f, ((float((uint)((uint)(_1423.w & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1443 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1423.w)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1444 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1423.w)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1446 = rsqrt(dot(float3(_1442, _1443, _1444), float3(_1442, _1443, _1444)));
    float _1451 = saturate(dot(float3(_346, _347, _348), float3((_1446 * _1442), (_1446 * _1443), (_1446 * _1444))));
    float _1466 = min(1.0f, ((float((uint)((uint)(_1423.z & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1467 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1423.z)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1468 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1423.z)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1470 = rsqrt(dot(float3(_1466, _1467, _1468), float3(_1466, _1467, _1468)));
    float _1475 = saturate(dot(float3(_346, _347, _348), float3((_1470 * _1466), (_1470 * _1467), (_1470 * _1468))));
    float _1490 = min(1.0f, ((float((uint)((uint)(_1423.x & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1491 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1423.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1492 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1423.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1494 = rsqrt(dot(float3(_1490, _1491, _1492), float3(_1490, _1491, _1492)));
    float _1499 = saturate(dot(float3(_346, _347, _348), float3((_1494 * _1490), (_1494 * _1491), (_1494 * _1492))));
    float _1514 = min(1.0f, ((float((uint)((uint)(_1423.y & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1515 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1423.y)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1516 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1423.y)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _1518 = rsqrt(dot(float3(_1514, _1515, _1516), float3(_1514, _1515, _1516)));
    float _1523 = saturate(dot(float3(_346, _347, _348), float3((_1518 * _1514), (_1518 * _1515), (_1518 * _1516))));
    float _1526 = select(((_994) || (((_993) || (_1214)))), 0.009999999776482582f, 1.0f);
    float _1543 = _1096 - _1102;
    float _1544 = _1097 - _1103;
    float _1545 = 1.0f - _1543;
    float _1546 = 1.0f - _1544;
    float _1551 = (_1545 * _1544) * _1418;
    float _1553 = (_1544 * _1543) * _1419;
    float _1555 = (_1546 * _1543) * _1420;
    float _1557 = (_1546 * _1545) * _1421;
    float _1559 = saturate(select(_956, 1.0f, (pow(_1499, _1526))) * _1551);
    float _1560 = saturate(select(_956, 1.0f, (pow(_1523, _1526))) * _1553);
    float _1561 = saturate(select(_956, 1.0f, (pow(_1475, _1526))) * _1555);
    float _1562 = saturate(select(_956, 1.0f, (pow(_1451, _1526))) * _1557);
    int4 _1564 = asint(__3__37__0__0__g_structureCounterBuffer.Load4(8));
    [branch]
    if (!(WaveReadLaneFirst(_1564.x) == 0)) {
      uint _1572 = __3__36__0__0__g_tiledManyLightsMasks.Load(int3(((int)(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))) >> 5)), ((int)(((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))) >> 5)), 0));
      int _1574 = _1572.x & 4;
      int _1576 = (uint)((uint)(_1574)) >> 2;
      if (!(_1574 == 0)) {
        _1584 = max((saturate(dot(float3(_926, _927, _928), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _1091);
        _1585 = _1576;
      } else {
        _1584 = _1091;
        _1585 = _1576;
      }
    } else {
      _1584 = _1091;
      _1585 = 0;
    }
    float _1595 = saturate(max(_1584, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    half4 _1598 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1100, ((int)((uint)(_1101) + 1u)), 0));
    half4 _1604 = __3__36__0__0__g_diffuseResultPrev.Load(int3(((int)((uint)(_1100) + 1u)), ((int)((uint)(_1101) + 1u)), 0));
    half4 _1609 = __3__36__0__0__g_diffuseResultPrev.Load(int3(((int)((uint)(_1100) + 1u)), _1101, 0));
    half4 _1614 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1100, _1101, 0));
    float _1619 = dot(float4(_1559, _1560, _1561, _1562), float4(1.0f, 1.0f, 1.0f, 1.0f));
    float _1628 = saturate(dot(float4(_1559, _1560, _1561, _1562), float4(float(_1598.w), float(_1604.w), float(_1609.w), float(_1614.w))) * (1.0f / max(1.0f, _1619)));
    float _1633 = sqrt((_1077 * _1077) + (_1076 * _1076)) * 50.0f;
    if (_1222) {
      _1642 = saturate(1.0f - _1633);
    } else {
      _1642 = (1.0f - (saturate(_1633) * 0.5f));
    }
    float _1646 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    float _1651 = (_1628 * _1628) * 4.0f;
    float4 _1662 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_104, _105), 0.0f);
    float _1666 = saturate(_1662.w);
    float _1668 = 1.0f / max(9.999999974752427e-07f, _1619);
    float _1669 = _1668 * _1559;
    float _1670 = _1668 * _1560;
    float _1671 = _1668 * _1561;
    float _1672 = _1668 * _1562;
    float _1673 = saturate(saturate(max(_1595, (1.0f / ((saturate(_1651) * min(31.0f, ((_1642 * 15.0f) * _1646))) + 1.0f))) + _renderParams.z));
    float _1715 = 1.0f / _exposure4.x;
    float _1732 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1672 * float(_1614.x)) + ((_1671 * float(_1609.x)) + ((_1669 * float(_1598.x)) + (_1670 * float(_1604.x))))))) * _exposure4.y)))));
    float _1733 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1672 * float(_1614.y)) + ((_1671 * float(_1609.y)) + ((_1669 * float(_1598.y)) + (_1670 * float(_1604.y))))))) * _exposure4.y)))));
    float _1734 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1672 * float(_1614.z)) + ((_1671 * float(_1609.z)) + ((_1669 * float(_1598.z)) + (_1670 * float(_1604.z))))))) * _exposure4.y)))));
    if (((_915 != 54)) && ((((_992 != 66)) && ((_renderParams.y == 0.0f))))) {
      float _1742 = dot(float3(_1732, _1733, _1734), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _1757 = ((min(_1742, _1662.y) / max(9.999999974752427e-07f, _1742)) * _1666) + saturate(1.0f - _1666);
      _1762 = saturate((saturate(((_1662.x - _1742) * 5.0f) / max(9.999999974752427e-07f, _1662.x)) * 0.5f) + _1673);
      _1763 = (_1757 * _1732);
      _1764 = (_1757 * _1733);
      _1765 = (_1757 * _1734);
    } else {
      _1762 = _1673;
      _1763 = _1732;
      _1764 = _1733;
      _1765 = _1734;
    }
    float _1774 = ((_926 - _1763) * _1762) + _1763;
    float _1775 = ((_927 - _1764) * _1762) + _1764;
    float _1776 = ((_928 - _1765) * _1762) + _1765;
    __3__38__0__1__g_diffuseResultUAV[int2(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))))] = half4(half(_1774), half(_1775), half(_1776), half(saturate(_1628 + 0.0625f)));
    float _1783 = float(_987);
    float _1784 = float(_988);
    float _1785 = float(_989);
    if (_915 == 53) {
      _1792 = saturate(((_1784 + _1783) + _1785) * 1.2000000476837158f);
    } else {
      _1792 = 1.0f;
    }
    float _1793 = float(_985);
    float _1799 = (0.699999988079071f / min(max(max(max(_1783, _1784), _1785), 0.009999999776482582f), 0.699999988079071f)) * _1792;
    float _1809 = (((_1799 * _1783) + -0.03999999910593033f) * _1793) + 0.03999999910593033f;
    float _1810 = (((_1799 * _1784) + -0.03999999910593033f) * _1793) + 0.03999999910593033f;
    float _1811 = (((_1799 * _1785) + -0.03999999910593033f) * _1793) + 0.03999999910593033f;
    if (!_956) {
      _1817 = saturate(1.0h - _930.x);
    } else {
      _1817 = 1.0h;
    }
    // RenoDX: Foliage AO for stencils 12-18.
    half _foliageAoMask = half(select(((uint)(_112 - 12) < 7u), FOLIAGE_AO_STRENGTH, 0.0f));
    _1817 = lerp(_1817, saturate(1.0h - _930.x), _foliageAoMask);
    bool _1821 = ((_915 == 98)) || ((_992 == 96));
    if (!_1821) {
      bool __branch_chain_1822;
      if ((uint)(_915 + -105) < (uint)2) {
        _1829 = _174;
        __branch_chain_1822 = true;
      } else {
        if (!((uint)(_915 + -11) < (uint)9)) {
          _1829 = false;
          __branch_chain_1822 = true;
        } else {
          _1860 = 0.0h;
          _1861 = _915;
          _1862 = 0.0f;
          _1863 = 0.0f;
          _1864 = 0.0f;
          __branch_chain_1822 = false;
        }
      }
      if (__branch_chain_1822) {
        _1829 = _174;
      }
      bool _1831 = ((_915 == 107)) || (_1829);
      half _1834 = select(_1831, 0.0h, _985);
      if ((_1831) || ((!_950))) {
        if (_915 == 33) {
          uint _1846 = uint((_clothLightingCategory.x * _416) + 0.5f);
          if (((_418 > 0.0f)) && (((uint)(int)(_1846) < (uint)(int)(uint(_clothLightingCategory.x))))) {
            _1860 = _1834;
            _1861 = _915;
            _1862 = min((1.0f - ((_clothLightingParameter[_1846]).y)), ((_clothLightingParameter[_1846]).x));
            _1863 = saturate(_417);
            _1864 = ((_clothLightingParameter[_1846]).x);
          } else {
            _1860 = _1834;
            _1861 = _915;
            _1862 = 0.0f;
            _1863 = 0.0f;
            _1864 = 0.0f;
          }
        } else {
          if (_915 == 55) {
            if (!(_418 < 0.0010000000474974513f)) {
              uint _1846 = uint((_clothLightingCategory.x * _416) + 0.5f);
              if (((_418 > 0.0f)) && (((uint)(int)(_1846) < (uint)(int)(uint(_clothLightingCategory.x))))) {
                _1860 = _1834;
                _1861 = _915;
                _1862 = min((1.0f - ((_clothLightingParameter[_1846]).y)), ((_clothLightingParameter[_1846]).x));
                _1863 = saturate(_417);
                _1864 = ((_clothLightingParameter[_1846]).x);
              } else {
                _1860 = _1834;
                _1861 = _915;
                _1862 = 0.0f;
                _1863 = 0.0f;
                _1864 = 0.0f;
              }
            } else {
              _1860 = _1834;
              _1861 = 53;
              _1862 = 0.0f;
              _1863 = 0.0f;
              _1864 = 0.0f;
            }
          } else {
            _1860 = _1834;
            _1861 = _915;
            _1862 = 0.0f;
            _1863 = 0.0f;
            _1864 = 0.0f;
          }
        }
      } else {
        _1860 = 0.0h;
        _1861 = 65;
        _1862 = 0.0f;
        _1863 = 0.0f;
        _1864 = 0.0f;
      }
    } else {
      _1860 = 0.0h;
      _1861 = _915;
      _1862 = 0.0f;
      _1863 = 0.0f;
      _1864 = 0.0f;
    }
    float _1866 = dot(float3(_394, _395, _396), float3(_346, _347, _348)) * 2.0f;
    float _1870 = _394 - (_1866 * _346);
    float _1871 = _395 - (_1866 * _347);
    float _1872 = _396 - (_1866 * _348);
    float _1874 = rsqrt(dot(float3(_1870, _1871, _1872), float3(_1870, _1871, _1872)));
    float _1875 = _1870 * _1874;
    float _1876 = _1871 * _1874;
    float _1877 = _1872 * _1874;
    float _1880 = __3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_104, _105), 0.0f);
    float _1882 = float(_986);
    float _1884 = select((_1882 < 0.800000011920929f), _1880.x, 0.0f);
    float _1885 = _1884 * _1875;
    float _1886 = _1884 * _1876;
    float _1887 = _1884 * _1877;
    float _1892 = dot(float3(_1885, _1886, _1887), float3((-0.0f - _346), (-0.0f - _347), (-0.0f - _348))) * 2.0f;
    float _1897 = ((_1892 * _346) + _389) + _1885;
    float _1899 = ((_1892 * _347) + _390) + _1886;
    float _1901 = ((_1892 * _348) + _391) + _1887;
    float _1925 = mad((_viewProjRelative[0].z), _1901, mad((_viewProjRelative[0].y), _1899, (_1897 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w);
    float _1929 = mad((_viewProjRelative[1].z), _1901, mad((_viewProjRelative[1].y), _1899, (_1897 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w);
    float _1933 = mad((_viewProjRelative[2].z), _1901, mad((_viewProjRelative[2].y), _1899, (_1897 * (_viewProjRelative[2].x)))) + (_viewProjRelative[2].w);
    float _1937 = mad((_viewProjRelative[3].z), _1901, mad((_viewProjRelative[3].y), _1899, (_1897 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
    float _1975 = mad((_projToPrevProj[3].w), _1937, mad((_projToPrevProj[3].z), _1933, mad((_projToPrevProj[3].y), _1929, ((_projToPrevProj[3].x) * _1925))));
    float _1976 = mad((_projToPrevProj[0].w), _1937, mad((_projToPrevProj[0].z), _1933, mad((_projToPrevProj[0].y), _1929, ((_projToPrevProj[0].x) * _1925)))) / _1975;
    float _1977 = mad((_projToPrevProj[1].w), _1937, mad((_projToPrevProj[1].z), _1933, mad((_projToPrevProj[1].y), _1929, ((_projToPrevProj[1].x) * _1925)))) / _1975;
    float _1981 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[2].w), _1937, mad((_projToPrevProj[2].z), _1933, mad((_projToPrevProj[2].y), _1929, ((_projToPrevProj[2].x) * _1925)))) / _1975));
    float _2017 = mad((_invViewProjRelativePrev[3].z), _1981, mad((_invViewProjRelativePrev[3].y), _1977, ((_invViewProjRelativePrev[3].x) * _1976))) + (_invViewProjRelativePrev[3].w);
    float _2028 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[0].z), _1981, mad((_invViewProjRelativePrev[0].y), _1977, ((_invViewProjRelativePrev[0].x) * _1976))) + (_invViewProjRelativePrev[0].w)) / _2017) - _1897);
    float _2029 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[1].z), _1981, mad((_invViewProjRelativePrev[1].y), _1977, ((_invViewProjRelativePrev[1].x) * _1976))) + (_invViewProjRelativePrev[1].w)) / _2017) - _1899);
    float _2030 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _1981, mad((_invViewProjRelativePrev[2].y), _1977, ((_invViewProjRelativePrev[2].x) * _1976))) + (_invViewProjRelativePrev[2].w)) / _2017) - _1901);
    float _2031 = dot(float3(_2028, _2029, _2030), float3(_1875, _1876, _1877));
    float _2035 = _2028 - (_2031 * _1875);
    float _2036 = _2029 - (_2031 * _1876);
    float _2037 = _2030 - (_2031 * _1877);
    float _2053 = (saturate(_1884 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_2035 * _2035) + (_2036 * _2036)) + (_2037 * _2037)) / max(0.0010000000474974513f, _1884))) + -1.0f)) + 1.0f;
    float _2054 = _2053 * _2053;
    float _2055 = _2054 * _2054;
    float _2056 = _2055 * _1499;
    float _2057 = _2055 * _1523;
    float _2058 = _2055 * _1475;
    float _2059 = _2055 * _1451;
    bool _2062 = (_renderParams.z > 0.0f);
    float _2064 = float(1.0h - _986);
    float _2068 = (_1976 - (_1925 / _1937)) - _1076;
    float _2069 = (_1977 - (_1929 / _1937)) - _1077;
    float _2073 = sqrt((_2069 * _2069) + (_2068 * _2068));
    float _2078 = saturate((((_2064 * _2064) * (1.0f - (_1004 * 0.8999999761581421f))) * _2073) * select(_2062, 2000.0f, 500.0f));
    int _2083 = _1861 & -2;
    bool _2086 = (_1861 == 29);
    float _2089 = select(((((_956) || (_2086))) || ((((_2083 == 24)) || ((_renderParams.y > 0.0f))))), 1.0f, float(_930.y));
    // RenoDX: Foliage specular AO.
    _2089 = lerp(_2089, float(_930.y), select(((uint)(_112 - 12) < 7u), FOLIAGE_AO_STRENGTH, 0.0f));
    float _2093 = float(_1860);
    float _2098 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
    float _2124 = saturate(saturate(1.0f - (((_2093 * _116) / max(0.0010000000474974513f, _1004)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_2098 * 0.07500000298023224f)) + max(0.019999999552965164f, _1882)) + (saturate(_116 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_116 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_2093) * 0.75f)));
    if (_1861 == 64) {
      _2133 = ((saturate(_116 * 0.25f) * (_2124 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _2133 = _2124;
    }
    float _2135 = (_2098 * 16.0f) + 16.0f;
    float _2141 = select((_2098 > 1.0f), 0.0f, saturate((1.0f / _2135) * (_116 - _2135)));
    do {
    if (_1861 == 105) {
      _2152 = 1.0f;
      _2156 = select((_1861 == 65), 0.0f, _2152);
      break;
    } else {
      if (!((uint)(_1861 & 24) > (uint)23)) {
        _2152 = select((_1861 == 107), 1.0f, ((_2141 + _2133) - (_2141 * _2133)));
        _2156 = select((_1861 == 65), 0.0f, _2152);
        break;
      } else {
        _2156 = 0.0f;
      }
    }
    } while(false);
    float _2162 = saturate(_116 * 0.0625f);
    float _2173 = select((((_1861 == 57)) || (((uint)((int)((uint)(_1861) + (uint)(-53))) < (uint)15))), 31.0f, 63.0f);
    float _2179 = (saturate((float(saturate(_1860 + (_986 * 2.0h))) * _2073) * (2000.0f - (_2162 * 1500.0f))) * (7.0f - _2173)) + _2173;
    if ((uint)((int)((uint)(_1861) + (uint)(-12))) < (uint)9) {
      _2189 = ((saturate(_116 * 0.004999999888241291f) * (_2179 + -2.0f)) + 2.0f);
    } else {
      _2189 = _2179;
    }
    half _2192 = max(0.040008545h, _986);
    float _2210 = saturate(max(max(_1595, select(_2062, _2078, 0.0f)), (1.0f / (((saturate((_1646 * _1646) * _1651) * min(64.0f, (_2189 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _2156) + (_116 * 0.0078125f)) + float((_2192 * _2192) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    bool __defer_2188_2233 = false;
    if ((uint)_1861 > (uint)52) {
      if ((uint)_1861 < (uint)68) {
        if (_2083 == 66) {
          _2243 = _2056;
          _2244 = _2057;
          _2245 = _2058;
          _2246 = _2059;
          _2249 = _2243;
          _2250 = _2244;
          _2251 = _2245;
          _2252 = _2246;
          _2253 = max(0.89990234h, _986);
        } else {
          if (!(_1861 == 54)) {
            float _2221 = _2056 * _2056;
            float _2222 = _2057 * _2057;
            float _2223 = _2058 * _2058;
            float _2224 = _2059 * _2059;
            float _2225 = _2221 * _2221;
            float _2226 = _2222 * _2222;
            float _2227 = _2223 * _2223;
            float _2228 = _2224 * _2224;
            _2234 = (_2225 * _2225);
            _2235 = (_2226 * _2226);
            _2236 = (_2227 * _2227);
            _2237 = (_2228 * _2228);
          } else {
            _2234 = _2056;
            _2235 = _2057;
            _2236 = _2058;
            _2237 = _2059;
          }
          __defer_2188_2233 = true;
        }
      } else {
        _2249 = _2056;
        _2250 = _2057;
        _2251 = _2058;
        _2252 = _2059;
        _2253 = max(0.099975586h, _986);
      }
    } else {
      _2234 = _2056;
      _2235 = _2057;
      _2236 = _2058;
      _2237 = _2059;
      __defer_2188_2233 = true;
    }
    if (__defer_2188_2233) {
      if (((_1861 == 54)) || ((_2083 == 66))) {
        _2243 = _2234;
        _2244 = _2235;
        _2245 = _2236;
        _2246 = _2237;
        _2249 = _2243;
        _2250 = _2244;
        _2251 = _2245;
        _2252 = _2246;
        _2253 = max(0.89990234h, _986);
      } else {
        _2249 = _2234;
        _2250 = _2235;
        _2251 = _2236;
        _2252 = _2237;
        _2253 = max(0.099975586h, _986);
      }
    }
    float _2254 = float(_2253);
    float _2255 = _2254 * _2254;
    float _2256 = _2255 * _2255;
    float _2269 = (((_2256 * _2249) - _2249) * _2249) + 1.0f;
    float _2270 = (((_2256 * _2250) - _2250) * _2250) + 1.0f;
    float _2271 = (((_2256 * _2251) - _2251) * _2251) + 1.0f;
    float _2272 = (((_2256 * _2252) - _2252) * _2252) + 1.0f;
    float _2297 = saturate(select(_2086, 1.0f, saturate((_2256 / (_2269 * _2269)) * _2249)) * _1551);
    float _2298 = saturate(select(_2086, 1.0f, saturate((_2256 / (_2270 * _2270)) * _2250)) * _1553);
    float _2299 = saturate(select(_2086, 1.0f, saturate((_2256 / (_2271 * _2271)) * _2251)) * _1555);
    float _2300 = saturate(select(_2086, 1.0f, saturate((_2256 / (_2272 * _2272)) * _2252)) * _1557);
    bool _2302 = ((uint)(_1861 & 24) > (uint)23);
    if (_2302) {
      [branch]
      if (_2086) {
        _2365 = saturate((_2210 + (_2078 * 0.5f)) + min(0.5f, (_991 / (((_116 * _116) * 0.004999999888241291f) + 1.0f))));
        _2366 = _1100;
        _2367 = _1101;
        _2368 = _2297;
        _2369 = _2298;
        _2370 = _2299;
        _2371 = _2300;
      } else {
        float _2316 = mad((_projToPrevProj[3].z), _107.x, mad((_projToPrevProj[3].y), _352, ((_projToPrevProj[3].x) * _350))) + (_projToPrevProj[3].w);
        float _2319 = ((mad((_projToPrevProj[0].z), _107.x, mad((_projToPrevProj[0].y), _352, ((_projToPrevProj[0].x) * _350))) + (_projToPrevProj[0].w)) / _2316) - _350;
        float _2320 = ((mad((_projToPrevProj[1].z), _107.x, mad((_projToPrevProj[1].y), _352, ((_projToPrevProj[1].x) * _350))) + (_projToPrevProj[1].w)) / _2316) - _352;
        float _2330 = (((_2319 * 0.5f) + _104) * _bufferSizeAndInvSize.x) + -0.5f;
        float _2331 = ((_105 - (_2320 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
        int _2334 = int(floor(_2330));
        int _2335 = int(floor(_2331));
        float _2338 = _2330 - float((int)(_2334));
        float _2339 = _2331 - float((int)(_2335));
        float _2340 = 1.0f - _2338;
        float _2341 = 1.0f - _2339;
        _2365 = saturate((sqrt((_2320 * _2320) + (_2319 * _2319)) * 100.0f) + 0.125f);
        _2366 = _2334;
        _2367 = _2335;
        _2368 = (_2340 * _2339);
        _2369 = (_2339 * _2338);
        _2370 = (_2341 * _2338);
        _2371 = (_2341 * _2340);
      }
    } else {
      if (_2086) {
        _2365 = saturate((_2210 + (_2078 * 0.5f)) + min(0.5f, (_991 / (((_116 * _116) * 0.004999999888241291f) + 1.0f))));
        _2366 = _1100;
        _2367 = _1101;
        _2368 = _2297;
        _2369 = _2298;
        _2370 = _2299;
        _2371 = _2300;
      } else {
        _2365 = _2210;
        _2366 = _1100;
        _2367 = _1101;
        _2368 = _2297;
        _2369 = _2298;
        _2370 = _2299;
        _2371 = _2300;
      }
    }
    bool _2372 = (_2093 > 0.20000000298023224f);
    half4 _2375 = __3__36__0__0__g_specularResultPrev.Load(int3(_2366, ((int)((uint)(_2367) + 1u)), 0));
    float _2388 = float((bool)((uint)(!(_2372 ^ (_2375.w < 0.0h))))) * _2368;
    half4 _2395 = __3__36__0__0__g_specularResultPrev.Load(int3(((int)((uint)(_2366) + 1u)), ((int)((uint)(_2367) + 1u)), 0));
    float _2408 = float((bool)((uint)(!(_2372 ^ (_2395.w < 0.0h))))) * _2369;
    half4 _2418 = __3__36__0__0__g_specularResultPrev.Load(int3(((int)((uint)(_2366) + 1u)), _2367, 0));
    float _2431 = float((bool)((uint)(!(_2372 ^ (_2418.w < 0.0h))))) * _2370;
    half4 _2441 = __3__36__0__0__g_specularResultPrev.Load(int3(_2366, _2367, 0));
    float _2454 = float((bool)((uint)(!(_2372 ^ (_2441.w < 0.0h))))) * _2371;
    float _2476 = 1.0f / max(((_2162 * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_2388, _2408, _2431, _2454), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    float _2478 = -0.0f - (min(0.0f, (-0.0f - ((((_2388 * float(_2375.x)) + (_2408 * float(_2395.x))) + (_2431 * float(_2418.x))) + (_2454 * float(_2441.x))))) * _2476);
    float _2480 = -0.0f - (min(0.0f, (-0.0f - ((((_2388 * float(_2375.y)) + (_2408 * float(_2395.y))) + (_2431 * float(_2418.y))) + (_2454 * float(_2441.y))))) * _2476);
    float _2482 = -0.0f - (min(0.0f, (-0.0f - ((((_2388 * float(_2375.z)) + (_2408 * float(_2395.z))) + (_2431 * float(_2418.z))) + (_2454 * float(_2441.z))))) * _2476);
    float _2483 = _2476 * min(0.0f, (-0.0f - ((((_2388 * abs(float(_2375.w))) + (_2408 * abs(float(_2395.w)))) + (_2431 * abs(float(_2418.w)))) + (_2454 * abs(float(_2441.w))))));
    if (((_1861 != 54)) && ((((_2083 != 66)) && ((_renderParams.y == 0.0f))))) {
      float _2490 = dot(float3(_2478, _2480, _2482), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _2497 = ((min(_2490, _1662.z) / max(9.999999717180685e-10f, _2490)) * _1666) + saturate(1.0f - _1666);
      _2502 = (_2497 * _2478);
      _2503 = (_2497 * _2480);
      _2504 = (_2497 * _2482);
    } else {
      _2502 = _2478;
      _2503 = _2480;
      _2504 = _2482;
    }
    float _2505 = _2502 * _exposure4.y;
    float _2506 = _2503 * _exposure4.y;
    float _2507 = _2504 * _exposure4.y;
    float _2510 = saturate(_2365 + _renderParams.z);
    float _2522 = ((max(0.0010000000474974513f, float(_1817)) + _2483) * _2365) - _2483;
    float _2532 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((_2510 * ((_2089 * _321.x) - _2505)) + _2505))));
    float _2533 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((_2510 * ((_2089 * _321.y) - _2506)) + _2506))));
    float _2534 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((_2510 * ((_2089 * _321.z) - _2507)) + _2507))));
    __3__38__0__1__g_specularResultUAV[int2(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))))] = half4(half(_2532), half(_2533), half(_2534), half(select(_2372, (-0.0f - _2522), _2522)));
    float _2542 = select(_2302, 0.0f, _2522);
    float _2547 = float(half(lerp(_2542, 1.0f, _1882)));
    bool _2548 = (_2083 == 64);
    int _2550 = ((int)(uint)((int)(_175))) ^ 1;
    if ((((int)(uint)((int)(_2548))) & _2550) == 0) {
      _2567 = saturate(exp2((_2547 * _2547) * (_116 * -0.005770780146121979f)));
    } else {
      _2567 = select((_cavityParams.z > 0.0f), select(_175, 0.0f, _417), 1.0f);
    }
    bool _2570 = (_cavityParams.x == 0.0f);
    float _2571 = select(_2570, 1.0f, _2567);
    if (_2548) {
      _2577 = (_2571 * _1809);
      _2578 = (_2571 * _1810);
      _2579 = (_2571 * _1811);
    } else {
      _2577 = _1809;
      _2578 = _1810;
      _2579 = _1811;
    }
    if (((_1861 == 54)) || ((_2083 == 66))) {
      float2 _2594 = __3__36__0__0__g_hairBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, (1.0f - saturate(abs(dot(float3(_912, _913, _914), float3(_394, _395, _396)))))), (1.0f - max(0.75f, (_2547 * 2.0f)))), 0.0f);
      float2 _2600 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1004), (1.0f - _2547)), 0.0f);
      float _2607 = ((_2600.x - _2594.x) * _916) + _2594.x;
      float _2608 = ((_2600.y - _2594.y) * _916) + _2594.y;
      float _2610 = (_2607 * 0.009999999776482582f) + _2608;
      _2774 = _2607;
      _2775 = _2608;
      _2776 = _2610;
      _2777 = _2610;
      _2778 = _2610;
    } else {
      if ((uint)((int)((uint)(_1861) + (uint)(-97))) < (uint)2) {
        if (!(abs(_219) > 0.9900000095367432f)) {
          float _2618 = -0.0f - _220;
          float _2620 = rsqrt(dot(float3(_2618, 0.0f, _218), float3(_2618, 0.0f, _218)));
          _2624 = (_2620 * _2618);
          _2625 = (_2620 * _218);
        } else {
          _2624 = 1.0f;
          _2625 = 0.0f;
        }
        float _2627 = -0.0f - (_219 * _2625);
        float _2630 = (_2625 * _218) - (_2624 * _220);
        float _2631 = _2624 * _219;
        float _2633 = rsqrt(dot(float3(_2627, _2630, _2631), float3(_2627, _2630, _2631)));
        float _2641 = _viewPos.x + _389;
        float _2642 = _viewPos.y + _390;
        float _2643 = _viewPos.z + _391;
        float4 _2648 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_2624, 0.0f, _2625), float3(_2641, _2642, _2643)), dot(float3((_2633 * _2627), (_2630 * _2633), (_2633 * _2631)), float3(_2641, _2642, _2643))), 0.0f);
        float _2652 = _2648.x + -0.5f;
        float _2653 = _2648.y + -0.5f;
        float _2654 = _2648.z + -0.5f;
        float _2656 = rsqrt(dot(float3(_2652, _2653, _2654), float3(_2652, _2653, _2654)));
        float _2660 = (_2652 * _2656) + _346;
        float _2661 = (_2653 * _2656) + _347;
        float _2662 = (_2654 * _2656) + _348;
        float _2664 = rsqrt(dot(float3(_2660, _2661, _2662), float3(_2660, _2661, _2662)));
        float2 _2677 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1004), (1.0f - _2547)), 0.0f);
        float _2684 = _2677.y + (exp2(log2(saturate(dot(float3(_996, _997, _998), float3((_2660 * _2664), (_2661 * _2664), (_2662 * _2664))))) * 512.0f) * 20.0f);
        _2774 = _2677.x;
        _2775 = _2677.y;
        _2776 = (_2684 + (_2677.x * _2577));
        _2777 = (_2684 + (_2677.x * _2578));
        _2778 = (_2684 + (_2677.x * _2579));
      } else {
        if (_2548) {
          if (_1861 == 65) {
            _2757 = _2577;
            _2758 = _2578;
            _2759 = _2579;
            float2 _2764 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1004), (1.0f - _2547)), 0.0f);
            _2774 = _2764.x;
            _2775 = _2764.y;
            _2776 = ((_2764.x * _2757) + _2764.y);
            _2777 = ((_2764.x * _2758) + _2764.y);
            _2778 = ((_2764.x * _2759) + _2764.y);
          } else {
            float _2694 = min(0.9900000095367432f, _1004);
            float2 _2699 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_2694, saturate(1.0f - (_2547 * 1.3300000429153442f))), 0.0f);
            float2 _2704 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_2694, saturate(1.0f - (_2547 * 0.47998046875f))), 0.0f);
            float _2708 = (_2704.x + _2699.x) * 0.5f;
            float _2710 = (_2704.y + _2699.y) * 0.5f;
            _2774 = _2708;
            _2775 = _2710;
            _2776 = ((_2708 * _2577) + _2710);
            _2777 = ((_2708 * _2578) + _2710);
            _2778 = ((_2708 * _2579) + _2710);
          }
        } else {
          if (((_1861 == 33)) || ((_1861 == 55))) {
            float _2727 = max(dot(float3(_1783, _1784, _1785), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
            float _2731 = sqrt(_1783) - _2727;
            float _2732 = sqrt(_1784) - _2727;
            float _2733 = sqrt(_1785) - _2727;
            float _2740 = saturate(1.0f - (pow(_1004, 4.0f)));
            _2757 = ((((_2731 * _1862) + _2727) + (_2740 * (_2731 * (_1864 - _1862)))) * _1863);
            _2758 = ((((_2732 * _1862) + _2727) + ((_2732 * (_1864 - _1862)) * _2740)) * _1863);
            _2759 = ((((_2733 * _1862) + _2727) + ((_2733 * (_1864 - _1862)) * _2740)) * _1863);
          } else {
            _2757 = _2577;
            _2758 = _2578;
            _2759 = _2579;
          }
          float2 _2764 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1004), (1.0f - _2547)), 0.0f);
          _2774 = _2764.x;
          _2775 = _2764.y;
          _2776 = ((_2764.x * _2757) + _2764.y);
          _2777 = ((_2764.x * _2758) + _2764.y);
          _2778 = ((_2764.x * _2759) + _2764.y);
        }
      }
    }
    float _2781 = select(((_2548) || (_2302)), 1.0f, _2571) * _1715;
    float _2788 = _1774 * _1715;
    float _2789 = _1775 * _1715;
    float _2790 = _1776 * _1715;
    bool __defer_2773_3047 = false;
    if ((uint)_915 > (uint)52) {
      if ((((uint)_915 < (uint)68)) || (_956)) {
        _3048 = _985;
        _3049 = _986;
        _3050 = _987;
        _3051 = _988;
        _3052 = _989;
        _3053 = _2542;
        __defer_2773_3047 = true;
      } else {
        if (!(((_915 == 6)) || ((((_992 == 106)) || (((((uint)(_915 + -27) < (uint)2)) || ((((_915 == 105)) || ((_915 == 26)))))))))) {
          if (!(_915 == 7)) {
            float _2815 = exp2(log2(_2542) * (saturate(_116 * 0.03125f) + 1.0f));
            float4 _2825 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_104, _105), 0.0f);
            bool __defer_2809_2843 = false;
            bool __branch_chain_2809;
            if (((_915 == 15)) || ((((_992 == 12)) || (((_915 & -4) == 16))))) {
              _2844 = false;
              _2845 = true;
              __branch_chain_2809 = true;
            } else {
              if (!((uint)_915 > (uint)10)) {
                _2844 = true;
                _2845 = false;
                __branch_chain_2809 = true;
              } else {
                if ((uint)_915 < (uint)20) {
                  _2844 = false;
                  _2845 = false;
                  __branch_chain_2809 = true;
                } else {
                  if (!(_915 == 97)) {
                    _2844 = (_915 != 107);
                    _2845 = false;
                    __branch_chain_2809 = true;
                  } else {
                    _3037 = _1793;
                    _3038 = _1882;
                    _3039 = _1783;
                    _3040 = _1784;
                    _3041 = _1785;
                    __branch_chain_2809 = false;
                  }
                }
              }
            }
            if (__branch_chain_2809) {
              __defer_2809_2843 = true;
            }
            if (__defer_2809_2843) {
              if (_2825.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  bool _2855 = (_915 == 36);
                  if (!_2855) {
                    float4 _2875 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _389) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _391) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _2881 = _2875.x;
                    _2882 = _2875.y;
                    _2883 = _2875.z;
                    _2884 = _2875.w;
                  } else {
                    _2881 = 0.11999999731779099f;
                    _2882 = 0.11999999731779099f;
                    _2883 = 0.10000000149011612f;
                    _2884 = 0.5f;
                  }
                  float _2891 = 1.0f - saturate(((_viewPos.y + _390) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (!(_2891 <= 0.0f)) {
                    float _2894 = saturate(_2815);
                    float _2907 = ((_2882 * 0.3395099937915802f) + (_2881 * 0.6131200194358826f)) + (_2883 * 0.047370001673698425f);
                    float _2908 = ((_2882 * 0.9163600206375122f) + (_2881 * 0.07020000368356705f)) + (_2883 * 0.013450000435113907f);
                    float _2909 = ((_2882 * 0.10958000272512436f) + (_2881 * 0.02061999961733818f)) + (_2883 * 0.8697999715805054f);
                    float _2914 = select(_2845, 1.0f, float((bool)(uint)(saturate(dot(float3(_346, _347, _348), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                    if (_enableSandAO == 1) {
                      float _2919 = 1.0f - _2825.x;
                      if (_2855) {
                        _2950 = ((((_2919 * 10.0f) * _2884) * _2891) * _2894);
                        _2953 = _2907;
                        _2954 = _2908;
                        _2955 = _2909;
                        _2956 = saturate(_2950);
                      } else {
                        float _2930 = saturate(_2884 + -0.5f);
                        _2953 = _2907;
                        _2954 = _2908;
                        _2955 = _2909;
                        _2956 = ((((_2930 * 2.0f) * max((_2914 * _2825.x), min((_2894 * ((_2825.x * 7.0f) + 3.0f)), (_2930 * 40.0f)))) + (((_2919 * 10.0f) * _2894) * saturate((0.5f - _2884) * 2.0f))) * _2891);
                      }
                    } else {
                      float _2948 = ((_2891 * _2884) * _2825.x) * _2914;
                      if (_2855) {
                        _2950 = _2948;
                        _2953 = _2907;
                        _2954 = _2908;
                        _2955 = _2909;
                        _2956 = saturate(_2950);
                      } else {
                        _2953 = _2907;
                        _2954 = _2908;
                        _2955 = _2909;
                        _2956 = _2948;
                      }
                    }
                  } else {
                    _2953 = 0.0f;
                    _2954 = 0.0f;
                    _2955 = 0.0f;
                    _2956 = 0.0f;
                  }
                  float _2960 = ((1.0f - _2825.w) * (1.0f - _2825.y)) * _2956;
                  bool _2961 = (_2960 > 9.999999747378752e-05f);
                  if (_2961) {
                    if (_2845) {
                      float _2964 = saturate(_2960);
                      _2991 = (((sqrt(_2953 * _1783) - _1783) * _2964) + _1783);
                      _2992 = (((sqrt(_2954 * _1784) - _1784) * _2964) + _1784);
                      _2993 = (((sqrt(_2955 * _1785) - _1785) * _2964) + _1785);
                    } else {
                      _2991 = ((_2960 * (_2953 - _1783)) + _1783);
                      _2992 = ((_2960 * (_2954 - _1784)) + _1784);
                      _2993 = ((_2960 * (_2955 - _1785)) + _1785);
                    }
                  } else {
                    _2991 = _1783;
                    _2992 = _1784;
                    _2993 = _1785;
                  }
                  if ((_2855) && (_2961)) {
                    if (_2845) {
                      _3008 = (((sqrt(_1882 * 0.25f) - _1882) * saturate(_2960)) + _1882);
                    } else {
                      _3008 = ((_2960 * (0.25f - _1882)) + _1882);
                    }
                  } else {
                    _3008 = _1882;
                  }
                  float _3009 = saturate(_2991);
                  float _3010 = saturate(_2992);
                  float _3011 = saturate(_2993);
                  float _3016 = (_3008 * (1.0f - _2815)) + _2815;
                  float _3019 = ((_3008 - _3016) * _2825.y) + _3016;
                  float _3026 = (((_2815 * _2815) * _2825.z) * float((bool)(uint)(_2844))) * saturate(dot(float3(_346, _347, _348), float3(0.0f, 1.0f, 0.0f)));
                  float _3027 = _3026 * -0.5f;
                  _3037 = (_1793 - (_2815 * _1793));
                  _3038 = (_3019 - (_3026 * _3019));
                  _3039 = ((_3027 * _3009) + _3009);
                  _3040 = ((_3027 * _3010) + _3010);
                  _3041 = ((_3027 * _3011) + _3011);
                } else {
                  _3037 = _1793;
                  _3038 = _1882;
                  _3039 = _1783;
                  _3040 = _1784;
                  _3041 = _1785;
                }
              } else {
                _3037 = _1793;
                _3038 = _1882;
                _3039 = _1783;
                _3040 = _1784;
                _3041 = _1785;
              }
            }
            _3048 = half(_3037);
            _3049 = half(_3038);
            _3050 = half(_3039);
            _3051 = half(_3040);
            _3052 = half(_3041);
            _3053 = _2815;
          } else {
            _3048 = _985;
            _3049 = _986;
            _3050 = _987;
            _3051 = _988;
            _3052 = _989;
            _3053 = _2542;
          }
          __defer_2773_3047 = true;
        } else {
          _3059 = _2542;
          _3060 = _987;
          _3061 = _988;
          _3062 = _989;
          _3063 = _986;
          _3064 = _985;
          _3065 = _2788;
          _3066 = _2789;
          _3067 = _2790;
          _3068 = 0.0f;
          _3069 = 0.0f;
          _3070 = 0.0f;
        }
      }
    } else {
      if (_956) {
        _3048 = _985;
        _3049 = _986;
        _3050 = _987;
        _3051 = _988;
        _3052 = _989;
        _3053 = _2542;
        __defer_2773_3047 = true;
      } else {
        if (!(((_915 == 6)) || ((((_992 == 106)) || (((((uint)(_915 + -27) < (uint)2)) || ((((_915 == 105)) || ((_915 == 26)))))))))) {
          if (!(_915 == 7)) {
            float _2815 = exp2(log2(_2542) * (saturate(_116 * 0.03125f) + 1.0f));
            float4 _2825 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_104, _105), 0.0f);
            bool __defer_2809_2843 = false;
            bool __branch_chain_2809;
            if (((_915 == 15)) || ((((_992 == 12)) || (((_915 & -4) == 16))))) {
              _2844 = false;
              _2845 = true;
              __branch_chain_2809 = true;
            } else {
              if (!((uint)_915 > (uint)10)) {
                _2844 = true;
                _2845 = false;
                __branch_chain_2809 = true;
              } else {
                if ((uint)_915 < (uint)20) {
                  _2844 = false;
                  _2845 = false;
                  __branch_chain_2809 = true;
                } else {
                  if (!(_915 == 97)) {
                    _2844 = (_915 != 107);
                    _2845 = false;
                    __branch_chain_2809 = true;
                  } else {
                    _3037 = _1793;
                    _3038 = _1882;
                    _3039 = _1783;
                    _3040 = _1784;
                    _3041 = _1785;
                    __branch_chain_2809 = false;
                  }
                }
              }
            }
            if (__branch_chain_2809) {
              __defer_2809_2843 = true;
            }
            if (__defer_2809_2843) {
              if (_2825.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  bool _2855 = (_915 == 36);
                  if (!_2855) {
                    float4 _2875 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _389) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _391) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _2881 = _2875.x;
                    _2882 = _2875.y;
                    _2883 = _2875.z;
                    _2884 = _2875.w;
                  } else {
                    _2881 = 0.11999999731779099f;
                    _2882 = 0.11999999731779099f;
                    _2883 = 0.10000000149011612f;
                    _2884 = 0.5f;
                  }
                  float _2891 = 1.0f - saturate(((_viewPos.y + _390) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (!(_2891 <= 0.0f)) {
                    float _2894 = saturate(_2815);
                    float _2907 = ((_2882 * 0.3395099937915802f) + (_2881 * 0.6131200194358826f)) + (_2883 * 0.047370001673698425f);
                    float _2908 = ((_2882 * 0.9163600206375122f) + (_2881 * 0.07020000368356705f)) + (_2883 * 0.013450000435113907f);
                    float _2909 = ((_2882 * 0.10958000272512436f) + (_2881 * 0.02061999961733818f)) + (_2883 * 0.8697999715805054f);
                    float _2914 = select(_2845, 1.0f, float((bool)(uint)(saturate(dot(float3(_346, _347, _348), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                    if (_enableSandAO == 1) {
                      float _2919 = 1.0f - _2825.x;
                      if (_2855) {
                        _2950 = ((((_2919 * 10.0f) * _2884) * _2891) * _2894);
                        _2953 = _2907;
                        _2954 = _2908;
                        _2955 = _2909;
                        _2956 = saturate(_2950);
                      } else {
                        float _2930 = saturate(_2884 + -0.5f);
                        _2953 = _2907;
                        _2954 = _2908;
                        _2955 = _2909;
                        _2956 = ((((_2930 * 2.0f) * max((_2914 * _2825.x), min((_2894 * ((_2825.x * 7.0f) + 3.0f)), (_2930 * 40.0f)))) + (((_2919 * 10.0f) * _2894) * saturate((0.5f - _2884) * 2.0f))) * _2891);
                      }
                    } else {
                      float _2948 = ((_2891 * _2884) * _2825.x) * _2914;
                      if (_2855) {
                        _2950 = _2948;
                        _2953 = _2907;
                        _2954 = _2908;
                        _2955 = _2909;
                        _2956 = saturate(_2950);
                      } else {
                        _2953 = _2907;
                        _2954 = _2908;
                        _2955 = _2909;
                        _2956 = _2948;
                      }
                    }
                  } else {
                    _2953 = 0.0f;
                    _2954 = 0.0f;
                    _2955 = 0.0f;
                    _2956 = 0.0f;
                  }
                  float _2960 = ((1.0f - _2825.w) * (1.0f - _2825.y)) * _2956;
                  bool _2961 = (_2960 > 9.999999747378752e-05f);
                  if (_2961) {
                    if (_2845) {
                      float _2964 = saturate(_2960);
                      _2991 = (((sqrt(_2953 * _1783) - _1783) * _2964) + _1783);
                      _2992 = (((sqrt(_2954 * _1784) - _1784) * _2964) + _1784);
                      _2993 = (((sqrt(_2955 * _1785) - _1785) * _2964) + _1785);
                    } else {
                      _2991 = ((_2960 * (_2953 - _1783)) + _1783);
                      _2992 = ((_2960 * (_2954 - _1784)) + _1784);
                      _2993 = ((_2960 * (_2955 - _1785)) + _1785);
                    }
                  } else {
                    _2991 = _1783;
                    _2992 = _1784;
                    _2993 = _1785;
                  }
                  if ((_2855) && (_2961)) {
                    if (_2845) {
                      _3008 = (((sqrt(_1882 * 0.25f) - _1882) * saturate(_2960)) + _1882);
                    } else {
                      _3008 = ((_2960 * (0.25f - _1882)) + _1882);
                    }
                  } else {
                    _3008 = _1882;
                  }
                  float _3009 = saturate(_2991);
                  float _3010 = saturate(_2992);
                  float _3011 = saturate(_2993);
                  float _3016 = (_3008 * (1.0f - _2815)) + _2815;
                  float _3019 = ((_3008 - _3016) * _2825.y) + _3016;
                  float _3026 = (((_2815 * _2815) * _2825.z) * float((bool)(uint)(_2844))) * saturate(dot(float3(_346, _347, _348), float3(0.0f, 1.0f, 0.0f)));
                  float _3027 = _3026 * -0.5f;
                  _3037 = (_1793 - (_2815 * _1793));
                  _3038 = (_3019 - (_3026 * _3019));
                  _3039 = ((_3027 * _3009) + _3009);
                  _3040 = ((_3027 * _3010) + _3010);
                  _3041 = ((_3027 * _3011) + _3011);
                } else {
                  _3037 = _1793;
                  _3038 = _1882;
                  _3039 = _1783;
                  _3040 = _1784;
                  _3041 = _1785;
                }
              } else {
                _3037 = _1793;
                _3038 = _1882;
                _3039 = _1783;
                _3040 = _1784;
                _3041 = _1785;
              }
            }
            _3048 = half(_3037);
            _3049 = half(_3038);
            _3050 = half(_3039);
            _3051 = half(_3040);
            _3052 = half(_3041);
            _3053 = _2815;
          } else {
            _3048 = _985;
            _3049 = _986;
            _3050 = _987;
            _3051 = _988;
            _3052 = _989;
            _3053 = _2542;
          }
          __defer_2773_3047 = true;
        } else {
          _3059 = _2542;
          _3060 = _987;
          _3061 = _988;
          _3062 = _989;
          _3063 = _986;
          _3064 = _985;
          _3065 = _2788;
          _3066 = _2789;
          _3067 = _2790;
          _3068 = 0.0f;
          _3069 = 0.0f;
          _3070 = 0.0f;
        }
      }
    }
    if (__defer_2773_3047) {
      if (_995) {
        _3059 = _3053;
        _3060 = _3050;
        _3061 = _3051;
        _3062 = _3052;
        _3063 = _3049;
        _3064 = _3048;
        _3065 = 0.0f;
        _3066 = 0.0f;
        _3067 = 0.0f;
        _3068 = (_2788 * _917);
        _3069 = (_2789 * _918);
        _3070 = (_2790 * _919);
      } else {
        _3059 = _3053;
        _3060 = _3050;
        _3061 = _3051;
        _3062 = _3052;
        _3063 = _3049;
        _3064 = _3048;
        _3065 = _2788;
        _3066 = _2789;
        _3067 = _2790;
        _3068 = 0.0f;
        _3069 = 0.0f;
        _3070 = 0.0f;
      }
    }
    half4 _3072 = __3__36__0__0__g_sceneShadowColor.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
    // RenoDX: Foliage AO on direct light
    half _directAoMask = half(select(((uint)(_112 - 12) < 7u), FOLIAGE_AO_STRENGTH, 0.0f));
    _3072.xyz *= lerp(1.0h, _930.x, _directAoMask);
    [branch]
    if (_956) {
      uint _3079 = __3__36__0__0__g_sceneNormal.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
      float _3095 = min(1.0f, ((float((uint)((uint)(_3079.x & 1023))) * 0.001956947147846222f) + -1.0f));
      float _3096 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_3079.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _3097 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_3079.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _3099 = rsqrt(dot(float3(_3095, _3096, _3097), float3(_3095, _3096, _3097)));
      _3107 = half(_3099 * _3095);
      _3108 = half(_3099 * _3096);
      _3109 = half(_3099 * _3097);
    } else {
      _3107 = _289;
      _3108 = _290;
      _3109 = _291;
    }
    bool _3112 = (_sunDirection.y > 0.0f);
    if ((_3112) || ((!(_3112)) && (_sunDirection.y > _moonDirection.y))) {
      _3124 = _sunDirection.x;
      _3125 = _sunDirection.y;
      _3126 = _sunDirection.z;
    } else {
      _3124 = _moonDirection.x;
      _3125 = _moonDirection.y;
      _3126 = _moonDirection.z;
    }
    if ((_3112) || ((!(_3112)) && (_sunDirection.y > _moonDirection.y))) {
      _3146 = _precomputedAmbient7.y;
    } else {
      _3146 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    float _3151 = _viewPos.y + _390;
    float _3152 = _3151 + _earthRadius;
    float _3156 = (_391 * _391) + (_389 * _389);
    float _3158 = sqrt((_3152 * _3152) + _3156);
    float _3163 = dot(float3((_389 / _3158), (_3152 / _3158), (_391 / _3158)), float3(_3124, _3125, _3126));
    float _3168 = min(max(((_3158 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    float _3176 = max(_3168, 0.0f);
    float _3183 = (-0.0f - sqrt((_3176 + (_earthRadius * 2.0f)) * _3176)) / (_3176 + _earthRadius);
    if (_3163 > _3183) {
      _3206 = ((exp2(log2(saturate((_3163 - _3183) / (1.0f - _3183))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _3206 = ((exp2(log2(saturate((_3183 - _3163) / (_3183 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
    float2 _3211 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_3168 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _3206), 0.0f);
    float _3233 = ((_3211.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
    float _3251 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _3211.x) + _3233) * -1.4426950216293335f);
    float _3252 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _3211.x) + _3233) * -1.4426950216293335f);
    float _3253 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((uint)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _3211.x) + _3233) * -1.4426950216293335f);
    float _3269 = sqrt(_3156);
    float _3277 = (_cloudAltitude - (max(((_3269 * _3269) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    float _3289 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_3125 > 0.0f))) - ((int)(uint)((int)(_3125 < 0.0f))))) * 0.5f))) + _3277;
    if (_390 < _3277) {
      float _3292 = dot(float3(0.0f, 1.0f, 0.0f), float3(_3124, _3125, _3126));
      float _3298 = select((abs(_3292) < 9.99999993922529e-09f), 1e+08f, ((_3289 - dot(float3(0.0f, 1.0f, 0.0f), float3(_389, _390, _391))) / _3292));
      _3304 = ((_3298 * _3124) + _389);
      _3305 = _3289;
      _3306 = ((_3298 * _3126) + _391);
    } else {
      _3304 = _389;
      _3305 = _390;
      _3306 = _391;
    }
    float _3315 = __3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_3304 * 4.999999873689376e-05f) + 0.5f), ((_3305 - _3277) / _cloudThickness), ((_3306 * 4.999999873689376e-05f) + 0.5f)), 0.0f);
    float _3326 = saturate(abs(_3125) * 4.0f);
    float _3328 = (_3326 * _3326) * exp2(((_distanceScale * -1.4426950216293335f) * _3315.x) * (_cloudScatteringCoefficient / _distanceScale));
    float _3335 = ((1.0f - _3328) * saturate(((_390 - _cloudThickness) - _3277) * 0.10000000149011612f)) + _3328;
    float _3336 = _3335 * (((_3252 * 0.3395099937915802f) + (_3251 * 0.6131200194358826f)) + (_3253 * 0.047370001673698425f));
    float _3337 = _3335 * (((_3252 * 0.9163600206375122f) + (_3251 * 0.07020000368356705f)) + (_3253 * 0.013450000435113907f));
    float _3338 = _3335 * (((_3252 * 0.10958000272512436f) + (_3251 * 0.02061999961733818f)) + (_3253 * 0.8697999715805054f));
    float _3354 = (((_3336 * 0.6131200194358826f) + (_3337 * 0.3395099937915802f)) + (_3338 * 0.047370001673698425f)) * _3146;
    float _3355 = (((_3336 * 0.07020000368356705f) + (_3337 * 0.9163600206375122f)) + (_3338 * 0.013450000435113907f)) * _3146;
    float _3356 = (((_3336 * 0.02061999961733818f) + (_3337 * 0.10958000272512436f)) + (_3338 * 0.8697999715805054f)) * _3146;
    // [DAWN_DUSK_GI] SH ambient directional boost
    if (DAWN_DUSK_IMPROVEMENTS == 1.f) {
      float _ddFactor = DawnDuskFactor(_sunDirection.y);
      float3 _ddAmbient = DawnDuskAmbientBoost(
        float3(_3354, _3355, _3356),
        float3(float(_3107), float(_3108), float(_3109)),
        _sunDirection.xyz,
        _ddFactor,
        _precomputedAmbient0.xyz);
      _3354 = _ddAmbient.x;
      _3355 = _ddAmbient.y;
      _3356 = _ddAmbient.z;
    }
    float _3362 = float(_930.x);
    float _3363 = float(_3072.x);
    float _3364 = float(_3072.y);
    float _3365 = float(_3072.z);
    float _3366 = float(_3060);
    float _3367 = float(_3061);
    float _3368 = float(_3062);
    if (!_1821) {
      _3374 = ((_174) && (((uint)(_915 + -105) < (uint)2)));
    } else {
      _3374 = true;
    }
    float _3376 = float(max(0.010002136h, _3063));
    float _3377 = float(_3064);
    bool _3380 = (_915 == 107);
    bool _3383 = (_950) || (((((uint)(_915 + -11) < (uint)9)) || (((_3380) || (_3374)))));
    float _3384 = select(_3383, 0.0f, _3377);
    do {
    if (((_992 == 26)) || ((((_915 == 105)) || ((_915 == 28))))) {
      _3396 = true;
      _3398 = _3396;
      _3399 = _3380;
      break;
    } else {
      bool _3393 = (_915 == 106);
      if (!(_915 == 19)) {
        _3396 = _3393;
        _3398 = _3396;
        _3399 = _3380;
        break;
      } else {
        _3398 = _3393;
        _3399 = true;
      }
    }
    } while(false);
    float _3400 = float(_3107);
    float _3401 = float(_3108);
    float _3402 = float(_3109);
    uint16_t _3404 = __3__36__0__0__g_sceneDecalMask.Load(int3(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))), 0));
    if (_915 == 97) {
      _3416 = (float((uint16_t)((uint)((uint16_t)((uint)(_3404.x)) >> 3))) * 0.032258063554763794f);
      _3417 = (((uint)((uint)((int)(min16uint)((int)((int)(_3404.x) & 4)))) >> 2) + 97);
      _3418 = 0.0f;
      _3419 = 0.0f;
      _3420 = 0.0f;
      _3421 = 0.0f;
      _3422 = 0.0f;
    } else {
      _3416 = select(_3383, _3377, 0.0f);
      _3417 = _915;
      _3418 = _454;
      _3419 = _455;
      _3420 = _456;
      _3421 = _457;
      _3422 = _458;
    }
    float _3427 = float(saturate(_194));
    float _3428 = _3427 * _3427;
    float _3429 = _3428 * _3428;
    float _3430 = _3429 * _3429;
    float4 _3437 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _99), (_bufferSizeAndInvSize.w * _100)), 0.0f);
    float _3441 = ((_3430 * _3430) * select((((_915 == 29)) || (((_3398) || (_3399)))), 0.0f, 1.0f)) * _3437.y;
    float _3446 = _3400 - (_3441 * _3400);
    float _3447 = (_3441 * (1.0f - _3401)) + _3401;
    float _3448 = _3402 - (_3441 * _3402);
    float _3450 = rsqrt(dot(float3(_3446, _3447, _3448), float3(_3446, _3447, _3448)));
    float _3451 = _3446 * _3450;
    float _3452 = _3447 * _3450;
    float _3453 = _3448 * _3450;
    bool _3454 = (_3417 == 53);
    if (_3454) {
      _3461 = saturate(((_3367 + _3366) + _3368) * 1.2000000476837158f);
    } else {
      _3461 = 1.0f;
    }
    float _3467 = (0.699999988079071f / min(max(max(max(_3366, _3367), _3368), 0.009999999776482582f), 0.699999988079071f)) * _3461;
    float _3477 = (((_3467 * _3366) + -0.03999999910593033f) * _3384) + 0.03999999910593033f;
    float _3478 = (((_3467 * _3367) + -0.03999999910593033f) * _3384) + 0.03999999910593033f;
    float _3479 = (((_3467 * _3368) + -0.03999999910593033f) * _3384) + 0.03999999910593033f;
    float _3480 = float(_3063);
    int _3481 = _3417 & -2;
    bool _3482 = (_3481 == 64);
    bool _3485 = ((((int)(uint)((int)(_3482))) & _2550) == 0);
    if (_3485) {
      _3498 = saturate(exp2((_3480 * _3480) * (_116 * -0.005770780146121979f)));
    } else {
      _3498 = select((_cavityParams.z > 0.0f), select(_175, 0.0f, _417), 1.0f);
    }
    float _3499 = select(_2570, 1.0f, _3498);
    if (_3482) {
      _3505 = (_3499 * _3477);
      _3506 = (_3499 * _3478);
      _3507 = (_3499 * _3479);
    } else {
      _3505 = _3477;
      _3506 = _3478;
      _3507 = _3479;
    }
    // RenoDX: Geometric Specular AA
    float _rndx_spec_rough = _3376;
    if (SPECULAR_AA > 0.0f) {
      _rndx_spec_rough = NDFFilterRoughnessCS(float3(_3451, _3452, _3453), _3376, SPECULAR_AA);
    }
    float _3508 = _rndx_spec_rough * _rndx_spec_rough;
    float _3509 = _3508 * _3508;
    bool _3511 = ((uint)(_3417 + -97) < (uint)2);
    float _3513 = select(_3511, 0.5f, (_3376 * 0.60009765625f));
    float _3514 = _3513 * _3513;
    float _3515 = _3514 * _3514;
    bool _3516 = (_3417 == 33);
    bool __defer_3504_3529 = false;
    if (!_3516) {
      bool _3518 = (_3417 == 55);
      int _3519 = (int)(uint)((int)(_3518));
      bool __defer_3517_3527 = false;
      if (((_3417 == 98)) || ((_3481 == 96))) {
        _3528 = true;
        __defer_3517_3527 = true;
      } else {
        if ((uint)(_3417 + -105) < (uint)2) {
          if (_3518) {
            _3530 = _174;
            __defer_3504_3529 = true;
          } else {
            _3545 = _174;
            _3546 = _3519;
            _3547 = 0.0f;
            _3550 = _3547;
            _3551 = _3546;
            _3552 = _3545;
            _3553 = (_3417 == 7);
          }
        } else {
          _3528 = false;
          __defer_3517_3527 = true;
        }
      }
      if (__defer_3517_3527) {
        if (_3518) {
          _3530 = _3528;
          __defer_3504_3529 = true;
        } else {
          _3534 = _3528;
          _3535 = _3519;
          _3536 = 0.0f;
        }
        if ((uint)_3417 > (uint)11) {
          if (!((((uint)_3417 < (uint)21)) || ((_3417 == 107)))) {
            _3545 = _3534;
            _3546 = _3535;
            _3547 = _3536;
            _3550 = _3547;
            _3551 = _3546;
            _3552 = _3545;
            _3553 = (_3417 == 7);
          } else {
            _3550 = _3536;
            _3551 = _3535;
            _3552 = _3534;
            _3553 = true;
          }
        } else {
          if (!(_3417 == 6)) {
            _3545 = _3534;
            _3546 = _3535;
            _3547 = _3536;
            _3550 = _3547;
            _3551 = _3546;
            _3552 = _3545;
            _3553 = (_3417 == 7);
          } else {
            _3550 = _3536;
            _3551 = _3535;
            _3552 = _3534;
            _3553 = true;
          }
        }
      }
    } else {
      _3530 = false;
      __defer_3504_3529 = true;
    }
    if (__defer_3504_3529) {
      _3534 = _3530;
      _3535 = ((int)(uint)((int)(_3418 > 0.0f)));
      _3536 = _3418;
      if ((uint)_3417 > (uint)11) {
        if (!((((uint)_3417 < (uint)21)) || ((_3417 == 107)))) {
          _3545 = _3534;
          _3546 = _3535;
          _3547 = _3536;
          _3550 = _3547;
          _3551 = _3546;
          _3552 = _3545;
          _3553 = (_3417 == 7);
        } else {
          _3550 = _3536;
          _3551 = _3535;
          _3552 = _3534;
          _3553 = true;
        }
      } else {
        if (!(_3417 == 6)) {
          _3545 = _3534;
          _3546 = _3535;
          _3547 = _3536;
          _3550 = _3547;
          _3551 = _3546;
          _3552 = _3545;
          _3553 = (_3417 == 7);
        } else {
          _3550 = _3536;
          _3551 = _3535;
          _3552 = _3534;
          _3553 = true;
        }
      }
    }
    float _3558 = exp2(log2(float(_3072.w)) * 2.200000047683716f) * 1000.0f;
    if ((_3112) || ((!(_3112)) && (_sunDirection.y > _moonDirection.y))) {
      _3570 = _sunDirection.x;
      _3571 = _sunDirection.y;
      _3572 = _sunDirection.z;
    } else {
      _3570 = _moonDirection.x;
      _3571 = _moonDirection.y;
      _3572 = _moonDirection.z;
    }
    float _3573 = _3354 * _lightingParams.x;
    float _3574 = _3355 * _lightingParams.x;
    float _3575 = _3356 * _lightingParams.x;
    float _3576 = _3570 - _394;
    float _3577 = _3571 - _395;
    float _3578 = _3572 - _396;
    float _3580 = rsqrt(dot(float3(_3576, _3577, _3578), float3(_3576, _3577, _3578)));
    float _3581 = _3580 * _3576;
    float _3582 = _3580 * _3577;
    float _3583 = _3580 * _3578;
    float _3584 = dot(float3(_3400, _3401, _3402), float3(_3570, _3571, _3572));
    float _3585 = dot(float3(_3451, _3452, _3453), float3(_3570, _3571, _3572));
    float _3587 = saturate(dot(float3(_3400, _3401, _3402), float3(_996, _997, _998)));
    float _3589 = saturate(dot(float3(_3451, _3452, _3453), float3(_3581, _3582, _3583)));
    float _3590 = dot(float3(_996, _997, _998), float3(_3581, _3582, _3583));
    float _3592 = saturate(dot(float3(_3570, _3571, _3572), float3(_3581, _3582, _3583)));
    bool _3593 = (_3481 == 66);
    bool _3594 = (_3417 == 54);
    bool _3595 = (_3594) || (_3593);
    if (_3595) {
      if (_3594) {
        _3612 = (((asfloat(_globalLightParams.z) * _3376) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_161)));
      } else {
        _3612 = _bevelParams.y;
      }
      float _3630 = (sqrt(_3156 + (_390 * _390)) * 2.0f) + 1.0f;
      float _3634 = (_916 * 7.0f) + 1.0f;
      float4 _3639 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2((((dot(float3(_389, _390, _391), float3(((_914 * _219) - (_913 * _220)), ((_912 * _220) - (_914 * _218)), ((_913 * _218) - (_912 * _219)))) * 2.0f) / _3630) * _3634), (((dot(float3(_389, _390, _391), float3(_912, _913, _914)) * 0.5f) / _3630) * _3634)), 0.0f);
      float _3643 = _916 * 0.5f;
      float _3644 = _3639.x * 2.0f;
      float _3645 = _3639.y * 2.0f;
      float _3646 = _3639.z * 2.0f;
      float _3657 = dot(float3(_912, _913, _914), float3(_3570, _3571, _3572));
      float _3658 = dot(float3(_912, _913, _914), float3(_996, _997, _998));
      float _3664 = cos(abs(asin(_3658) - asin(_3657)) * 0.5f);
      float _3668 = _3570 - (_3657 * _912);
      float _3669 = _3571 - (_3657 * _913);
      float _3670 = _3572 - (_3657 * _914);
      float _3674 = _996 - (_3658 * _912);
      float _3675 = _997 - (_3658 * _913);
      float _3676 = _998 - (_3658 * _914);
      float _3683 = rsqrt((dot(float3(_3674, _3675, _3676), float3(_3674, _3675, _3676)) * dot(float3(_3668, _3669, _3670), float3(_3668, _3669, _3670))) + 9.999999747378752e-05f) * dot(float3(_3668, _3669, _3670), float3(_3674, _3675, _3676));
      float _3687 = sqrt(saturate((_3683 * 0.5f) + 0.5f));
      float _3694 = min(max(max(0.05000000074505806f, _3376), 0.09803921729326248f), 1.0f);
      float _3695 = _3694 * _3694;
      float _3696 = _3695 * 0.5f;
      float _3697 = _3695 * 2.0f;
      float _3698 = _3658 + _3657;
      float _3699 = _3698 + (_3612 * 2.0f);
      float _3701 = (_3687 * 1.4142135381698608f) * _3695;
      float _3715 = 1.0f - sqrt(saturate((dot(float3(_996, _997, _998), float3(_3570, _3571, _3572)) * 0.5f) + 0.5f));
      float _3716 = _3715 * _3715;
      float _3723 = _3698 - _3612;
      float _3732 = 1.0f / ((1.190000057220459f / _3664) + (_3664 * 0.36000001430511475f));
      float _3737 = ((_3732 * (0.6000000238418579f - (_3683 * 0.800000011920929f))) + 1.0f) * _3687;
      float _3743 = 1.0f - (sqrt(saturate(1.0f - (_3737 * _3737))) * _3664);
      float _3744 = _3743 * _3743;
      float _3748 = 0.9534794092178345f - ((_3744 * _3744) * (_3743 * 0.9534794092178345f));
      float _3749 = _3732 * _3737;
      float _3754 = (sqrt(1.0f - (_3749 * _3749)) * 0.5f) / _3664;
      float _3755 = log2(_3366);
      float _3756 = log2(_3367);
      float _3757 = log2(_3368);
      float _3769 = ((_3748 * _3748) * (exp2((((_3723 * _3723) * -0.5f) / (_3696 * _3696)) * 1.4426950216293335f) / (_3695 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_3683 * 5.2658371925354f));
      float _3773 = _3698 - (_3612 * 4.0f);
      float _3783 = 1.0f - (_3664 * 0.5f);
      float _3784 = _3783 * _3783;
      float _3788 = (_3784 * _3784) * (0.9534794092178345f - (_3664 * 0.47673970460891724f));
      float _3790 = 0.9534794092178345f - _3788;
      float _3791 = 0.800000011920929f / _3664;
      float _3804 = (((_3790 * _3790) * (_3788 + 0.04652056470513344f)) * (exp2((((_3773 * _3773) * -0.5f) / (_3697 * _3697)) * 1.4426950216293335f) / (_3695 * 5.013256549835205f))) * exp2((_3683 * 24.525815963745117f) + -24.208423614501953f);
      float _3811 = saturate(_3585);
      float _3812 = (((_3687 * 0.25f) * (exp2((((_3699 * _3699) * -0.5f) / (_3701 * _3701)) * 1.4426950216293335f) / (_3701 * 2.5066282749176025f))) * (((_3716 * _3716) * (_3715 * 0.9534794092178345f)) + 0.04652056470513344f)) * _3811;
      float _3822 = -0.0f - _3811;
      float _3833 = saturate((_3585 + 1.0f) * 0.25f);
      float _3838 = max(0.0010000000474974513f, dot(float3(_3366, _3367, _3368), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f)));
      float _3857 = ((((1.0f - abs(_3585)) - _3833) * 0.33000001311302185f) + _3833) * 0.07957746833562851f;
      float _3859 = (exp2(log2(_3366 / _3838) * (1.0f - _3363)) * _3857) * sqrt(_3366);
      float _3861 = (exp2(log2(_3367 / _3838) * (1.0f - _3364)) * _3857) * sqrt(_3367);
      float _3863 = (exp2(log2(_3368 / _3838) * (1.0f - _3365)) * _3857) * sqrt(_3368);
      float _3870 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3804 * exp2(_3791 * _3755)) + (_3769 * exp2(_3755 * _3754))) * _3822)))));
      float _3871 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3804 * exp2(_3791 * _3756)) + (_3769 * exp2(_3756 * _3754))) * _3822)))));
      float _3872 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3804 * exp2(_3791 * _3757)) + (_3769 * exp2(_3757 * _3754))) * _3822)))));
      float _3879 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3644, 1.0f, _3643)) * _3812))) * _3363));
      float _3880 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3645, 1.0f, _3643)) * _3812))) * _3364));
      float _3881 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3646, 1.0f, _3643)) * _3812))) * _3365));
      if (!_3593) {
        _3883 = _3870;
        _3884 = _3871;
        _3885 = _3872;
        _3886 = _3879;
        _3887 = _3880;
        _3888 = _3881;
        _3889 = _3859;
        _3890 = _3861;
        _3891 = _3863;
      } else {
        _4301 = _3870;
        _4302 = _3871;
        _4303 = _3872;
        _4304 = _3879;
        _4305 = _3880;
        _4306 = _3881;
        _4307 = _3859;
        _4308 = _3861;
        _4309 = _3863;
      }
    } else {
      _3883 = 0.0f;
      _3884 = 0.0f;
      _3885 = 0.0f;
      _3886 = 0.0f;
      _3887 = 0.0f;
      _3888 = 0.0f;
      _3889 = 0.0f;
      _3890 = 0.0f;
      _3891 = 0.0f;
    }
    if (!_3594) {
      // RenoDX: Foliage stencil detection (stencil 12..18 inclusive)
      bool isFoliage = ((uint)(_112 - 12) < 7u);
      bool _3893 = (_3551 == 0);
      bool __defer_3892_4060 = false;
      if (_3893) {
        if (((_3584 > 0.0f)) || ((_3585 > 0.0f))) {
          _4061 = 0.0f;
          _4062 = 0.0f;
          _4063 = 0.0f;
          _4064 = 0.0f;
          _4065 = 0.0f;
          _4066 = 0.0f;
          _4067 = 0.0f;
          _4068 = 0.0f;
          _4069 = 0.0f;
          __defer_3892_4060 = true;
        } else {
          _4301 = _3883;
          _4302 = _3884;
          _4303 = _3885;
          _4304 = _3886;
          _4305 = _3887;
          _4306 = _3888;
          _4307 = _3889;
          _4308 = _3890;
          _4309 = _3891;
        }
      } else {
        float _3908 = (saturate(_3584) * 0.31830987334251404f) * (((saturate(1.0f - _effectiveMetallicForVelvet) + -1.0f) * _3422) + 1.0f);
        float _3914 = max(dot(float3(_3366, _3367, _3368), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
        float _3915 = sqrt(_3366);
        float _3916 = sqrt(_3367);
        float _3917 = sqrt(_3368);
        float _3918 = _3915 - _3914;
        float _3919 = _3916 - _3914;
        float _3920 = _3917 - _3914;
        float _3927 = saturate(1.0f - (pow(_3587, 4.0f)));
        float _3940 = (((_3919 * _3419) + _3914) + ((_3919 * (_3422 - _3419)) * _3927)) * _3420;
        float _3943 = saturate(1.0f - saturate(_3590));
        float _3944 = _3943 * _3943;
        float _3946 = (_3944 * _3944) * _3943;
        float _3949 = _3946 * saturate(_3940 * 50.0f);
        float _3950 = 1.0f - _3946;
        float _3951 = _3950 * _3420;
        float _3955 = (_3951 * (((_3918 * _3419) + _3914) + (_3927 * (_3918 * (_3422 - _3419))))) + _3949;
        float _3956 = (_3950 * _3940) + _3949;
        float _3957 = (_3951 * (((_3920 * _3419) + _3914) + ((_3920 * (_3422 - _3419)) * _3927))) + _3949;
        float _3958 = min(_3589, 0.9998999834060669f);
        float _3959 = _3958 * _3958;
        float _3960 = 1.0f - _3959;
        float _3972 = (((exp2(((-0.0f - _3959) / (_3960 * _3509)) * 1.4426950216293335f) * 4.0f) / (_3960 * _3960)) + 1.0f) / ((_3509 * 12.566370964050293f) + 3.1415927410125732f);
        float _3976 = ((_3587 + _3585) - (_3587 * _3585)) * 4.0f;
        float _3980 = (_3955 * _3972) / _3976;
        float _3981 = (_3956 * _3972) / _3976;
        float _3982 = (_3957 * _3972) / _3976;
        float _3983 = 1.0f - _3508;
        float _3995 = (((_3589 * _3509) - _3589) * _3589) + 1.0f;
        float _3999 = (_3509 / ((_3995 * _3995) * 3.1415927410125732f)) * (0.5f / ((((_3587 * _3983) + _3508) * _3584) + (_3587 * ((_3584 * _3983) + _3508))));
        float _4015 = saturate(_3585);
        float _4020 = (_3421 * 1.5f) + 2.5f;
        float _4021 = _4020 * _4020;
        float _4031 = (max(0.0f, (0.30000001192092896f - _3584)) * 0.25f) * ((exp2(_4021 * -0.48089835047721863f) * 3.0f) + exp2(_4021 * -1.4426950216293335f));
        float _4056 = (((1.0f - _3422) * 0.47746479511260986f) * saturate(_3421)) * saturate((pow(_3589, 4.0f)) * exp2(log2(saturate(1.0f - abs(_3584))) * 3.0f));
        _4061 = (_4056 * _3915);
        _4062 = (_4056 * _3916);
        _4063 = (_4056 * _3917);
        _4064 = ((((max((_3999 * _3955), 0.0f) - _3980) * _3419) + _3980) * _4015);
        _4065 = ((((max((_3999 * _3956), 0.0f) - _3981) * _3419) + _3981) * _4015);
        _4066 = ((((max((_3999 * _3957), 0.0f) - _3982) * _3419) + _3982) * _4015);
        _4067 = (((_3915 * _3363) * _4031) + _3908);
        _4068 = (((_3916 * _3364) * _4031) + _3908);
        _4069 = (((_3917 * _3365) * _4031) + _3908);
        __defer_3892_4060 = true;
      }
      if (__defer_3892_4060) {
        if (!(_3418 > 0.9900000095367432f)) {
          float _4072 = saturate(_3584);
          float _4073 = 1.0f - _3509;
          float _4074 = 1.0f - _3592;
          float _4075 = _4074 * _4074;
          float _4078 = ((_4075 * _4075) * _4074) + _3592;
          float _4079 = 1.0f - _4072;
          float _4080 = _4079 * _4079;
          float _4085 = 1.0f - _3587;
          float _4086 = _4085 * _4085;
          float _4113;
          if (DIFFUSE_BRDF_MODE >= 1.0f) {
            // EON Diffuse
            float _eon_LdotV = dot(float3(_3570, _3571, _3572), float3(_996, _997, _998));
            _4113 = _4072 * EON_DiffuseScalar(_4072, _3587, _eon_LdotV, _3376);
          } else {
            // Vanilla Burley Diffuse
            _4113 = (_4072 * 0.31830987334251404f) * ((((_3592 * ((((_4073 * 34.5f) + -59.0f) * _4073) + 24.5f)) * exp2(-0.0f - (max(((_4073 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_3589)))) + _4078) + ((((1.0f - ((_4080 * _4080) * (_4079 * 0.75f))) * (1.0f - ((_4086 * _4086) * (_4085 * 0.75f)))) - _4078) * saturate((_4073 * 2.200000047683716f) + -0.5f)));
          }
          float _4116 = saturate(1.0f - saturate(_3590));
          float _4117 = _4116 * _4116;
          float _4119 = (_4117 * _4117) * _4116;
          float _4122 = _4119 * saturate(_3506 * 50.0f);
          float _4123 = 1.0f - _4119;
          float _4127 = (_4123 * _3505) + _4122;
          float _4128 = (_4123 * _3506) + _4122;
          float _4129 = (_4123 * _3507) + _4122;
          if (!(_3417 == 29)) {
            float _4131 = saturate(_3585);
            float _4132 = 1.0f - _3508;
            float _4144 = (((_3589 * _3509) - _3589) * _3589) + 1.0f;
            float _4148 = (_3509 / ((_4144 * _4144) * 3.1415927410125732f)) * (0.5f / ((((_3587 * _4132) + _3508) * _3585) + (_3587 * ((_3585 * _4132) + _3508))));
            _4159 = (max((_4148 * _4127), 0.0f) * _4131);
            _4160 = (max((_4148 * _4128), 0.0f) * _4131);
            _4161 = (max((_4148 * _4129), 0.0f) * _4131);
          } else {
            _4159 = 0.0f;
            _4160 = 0.0f;
            _4161 = 0.0f;
          }
          // RenoDX: Diffraction on Rough Surfaces
          if (DIFFRACTION > 0.0f && _3384 > 0.0f) {
            float3 _rndx_dShift = DiffractionShiftAndSpeckleCS(
              _3589, _3587, _rndx_spec_rough,
              float2(_104, _105), _116,
              float3(_3581, _3582, _3583),
              float3(_3451, _3452, _3453),
              float3(_3366, _3367, _3368)
            );
            float3 _rndx_dMod = lerp(1.0f, _rndx_dShift, DIFFRACTION * _3384);
            _4159 *= _rndx_dMod.x;
            _4160 *= _rndx_dMod.y;
            _4161 *= _rndx_dMod.z;
          }
          // RenoDX: Callisto Smooth Terminator
          if (SMOOTH_TERMINATOR > 0.0f) {
            float _rndx_c2 = CallistoSmoothTerminator(_4072, _3592, _3589, SMOOTH_TERMINATOR, 0.5f);
            _4113 *= _rndx_c2;
            _4159 *= _rndx_c2;
            _4160 *= _rndx_c2;
            _4161 *= _rndx_c2;
          }
          // RenoDX: Foliage Transmission
          if (FOLIAGE_TRANSMISSION > 0.0f && isFoliage) {
            FoliageTransmissionResult _ftResult = FoliageTransmission(
                float3(_996, _997, _998),                    // V (view dir toward camera)
                float3(_3570, _3571, _3572),                 // L (light dir)
                float3(_3400, _3401, _3402),                 // N (surface normal)
                _3584,                                       // NdotL (raw)
                float3(_3366, _3367, _3368),                 // baseColor
                float3(_3336, _3337, _3338),                 // shadowColor
                float3(_3573, _3574, _3575),                 // lightLum
                FOLIAGE_TRANSMISSION_THICKNESS);             // thickness

            foliageTransR = _ftResult.transmission.x;
            foliageTransG = _ftResult.transmission.y;
            foliageTransB = _ftResult.transmission.z;

            if (_ftResult.diffuseScale > 0.0f) {
              _4113 *= _ftResult.diffuseScale;
            } else {
              float wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
              _4113 = max(0.0f, (_3584 + wrap) / (1.0f + wrap)) * 0.31830987334251404f * 0.75f;
            }
          }
          bool _4162 = (_3417 == 65);
          if (_3482) {
            if (_4162) {
              float _4205 = max(9.999999974752427e-07f, _exposure2.x);
              float _4214 = ((_4072 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_3451, _3452, _3453), float3(_996, _997, _998)))) * 16.0f)) / (((_4205 * _4205) * 1e+06f) + 1.0f);
              _4228 = _4159;
              _4229 = _4160;
              _4230 = _4161;
              _4231 = ((((_4214 * _3366) - _4113) * _3416) + _4113);
              _4232 = ((((_4214 * _3367) - _4113) * _3416) + _4113);
              _4233 = ((((_4214 * _3368) - _4113) * _3416) + _4113);
            } else {
              float _4169 = 1.0f - _3514;
              float _4181 = (((_3589 * _3515) - _3589) * _3589) + 1.0f;
              float _4185 = (_3515 / ((_4181 * _4181) * 3.1415927410125732f)) * (0.5f / ((((_3587 * _4169) + _3514) * _3585) + (_3587 * ((_3585 * _4169) + _3514))));
              float _4192 = saturate(_3585) * 0.39990234375f;
              _4228 = ((max((_4185 * _4127), 0.0f) * _4192) + (_4159 * 0.60009765625f));
              _4229 = ((max((_4185 * _4128), 0.0f) * _4192) + (_4160 * 0.60009765625f));
              _4230 = ((max((_4185 * _4129), 0.0f) * _4192) + (_4161 * 0.60009765625f));
              _4231 = _4113;
              _4232 = _4113;
              _4233 = _4113;
            }
          } else {
            if (_4162) {
              float _4205 = max(9.999999974752427e-07f, _exposure2.x);
              float _4214 = ((_4072 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_3451, _3452, _3453), float3(_996, _997, _998)))) * 16.0f)) / (((_4205 * _4205) * 1e+06f) + 1.0f);
              _4228 = _4159;
              _4229 = _4160;
              _4230 = _4161;
              _4231 = ((((_4214 * _3366) - _4113) * _3416) + _4113);
              _4232 = ((((_4214 * _3367) - _4113) * _3416) + _4113);
              _4233 = ((((_4214 * _3368) - _4113) * _3416) + _4113);
            } else {
              _4228 = _4159;
              _4229 = _4160;
              _4230 = _4161;
              _4231 = _4113;
              _4232 = _4113;
              _4233 = _4113;
            }
          }
        } else {
          _4228 = _3886;
          _4229 = _3887;
          _4230 = _3888;
          _4231 = _3889;
          _4232 = _3890;
          _4233 = _3891;
        }
        float _4237 = min(-0.0f, (-0.0f - _4231));
        float _4238 = min(-0.0f, (-0.0f - _4232));
        float _4239 = min(-0.0f, (-0.0f - _4233));
        float _4240 = -0.0f - _4237;
        float _4241 = -0.0f - _4238;
        float _4242 = -0.0f - _4239;
        if (_3893) {
          _4301 = _3883;
          _4302 = _3884;
          _4303 = _3885;
          _4304 = (_4228 * _3363);
          _4305 = (_4229 * _3364);
          _4306 = (_4230 * _3365);
          _4307 = (_3363 * _4240);
          _4308 = (_3364 * _4241);
          _4309 = (_3365 * _4242);
        } else {
          bool _4244 = (_3418 > 0.0f);
          if (_4244) {
            _4278 = (_3883 - (_3883 * _3550));
            _4279 = (_3884 - (_3884 * _3550));
            _4280 = (_3885 - (_3885 * _3550));
            _4281 = (lerp(_4228, _4064, _3550));
            _4282 = (lerp(_4229, _4065, _3550));
            _4283 = (lerp(_4230, _4066, _3550));
            _4284 = (((_4237 + _4067) * _3550) - _4237);
            _4285 = (((_4238 + _4068) * _3550) - _4238);
            _4286 = (((_4239 + _4069) * _3550) - _4239);
          } else {
            _4278 = _3883;
            _4279 = _3884;
            _4280 = _3885;
            _4281 = _4228;
            _4282 = _4229;
            _4283 = _4230;
            _4284 = _4240;
            _4285 = _4241;
            _4286 = _4242;
          }
          float _4287 = _4284 * _3363;
          float _4288 = _4285 * _3364;
          float _4289 = _4286 * _3365;
          float _4290 = _4281 * _3363;
          float _4291 = _4282 * _3364;
          float _4292 = _4283 * _3365;
          if (_4244) {
            _4301 = _4278;
            _4302 = _4279;
            _4303 = _4280;
            _4304 = (_4290 + (_4061 * _3550));
            _4305 = (_4291 + (_4062 * _3550));
            _4306 = (_4292 + (_4063 * _3550));
            _4307 = _4287;
            _4308 = _4288;
            _4309 = _4289;
          } else {
            _4301 = _4278;
            _4302 = _4279;
            _4303 = _4280;
            _4304 = _4290;
            _4305 = _4291;
            _4306 = _4292;
            _4307 = _4287;
            _4308 = _4288;
            _4309 = _4289;
          }
        }
      }
    } else {
      _4301 = _3883;
      _4302 = _3884;
      _4303 = _3885;
      _4304 = _3886;
      _4305 = _3887;
      _4306 = _3888;
      _4307 = _3889;
      _4308 = _3890;
      _4309 = _3891;
    }
    if (_3553) {
      float _4313 = max(0.0f, (0.30000001192092896f - _3584)) * 0.23190687596797943f;
      _4321 = ((_4313 * _3363) + _4307);
      _4322 = ((_4313 * _3364) + _4308);
      _4323 = ((_4313 * _3365) + _4309);
    } else {
      _4321 = _4307;
      _4322 = _4308;
      _4323 = _4309;
    }
    float _4325 = 1.0f - (_3590 * 0.8500000238418579f);
    bool __defer_4320_4664 = false;
    if (_3482) {
      float _4329 = max(4.0f, _3558);
      float _4330 = _4329 * _4329;
      float _4332 = exp2(_4330 * -225.4210968017578f);
      float _4337 = exp2(_4330 * -29.807748794555664f);
      float _4345 = exp2(_4330 * -7.714946269989014f);
      float _4351 = exp2(_4330 * -2.544435739517212f);
      float _4353 = _4351 * 0.007000000216066837f;
      float _4358 = exp2(_4330 * -0.7249723672866821f);
      float _4372 = saturate(dot(float3(_3570, _3571, _3572), float3((-0.0f - _218), _234, (-0.0f - _220))) + 0.30000001192092896f) * 0.31830987334251404f;
      _4665 = _3363;
      _4666 = _3364;
      _4667 = _3365;
      _4668 = _4301;
      _4669 = _4302;
      _4670 = _4303;
      _4671 = ((_4372 * ((((((_4337 * 0.10000000149011612f) + (_4332 * 0.2329999953508377f)) + (_4345 * 0.11800000071525574f)) + (_4351 * 0.11299999803304672f)) + (_4358 * 0.3580000102519989f)) + (exp2(_4330 * -0.19469568133354187f) * 0.07800000160932541f))) + _4321);
      _4672 = ((_4372 * (((((_4337 * 0.335999995470047f) + (_4332 * 0.45500001311302185f)) + (_4345 * 0.1979999989271164f)) + _4353) + (_4358 * 0.004000000189989805f))) + _4322);
      _4673 = ((_4372 * (((_4337 * 0.3440000116825104f) + (_4332 * 0.6489999890327454f)) + _4353)) + _4323);
      __defer_4320_4664 = true;
    } else {
      if (_3595) {
        float _4382 = dot(float3(_3366, _3367, _3368), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * _renderParams2.w;
        float _4385 = _4382 + (_3362 - (_4382 * _3362));
        float _4387 = saturate(_116 + -7.0f);
        float _4403 = (((pow(_3363, 1.2000000476837158f)) - _3363) * _4387) + _3363;
        float _4404 = (((pow(_3364, 1.2000000476837158f)) - _3364) * _4387) + _3364;
        float _4405 = (((pow(_3365, 1.2000000476837158f)) - _3365) * _4387) + _3365;
        float _4412 = saturate(abs(dot(float3(_3570, _3571, _3572), float3(_912, _913, _914))));
        float2 _4421 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4412, _3376, saturate(sqrt(sqrt(_3366)))), 0.0f);
        float2 _4424 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4412, _3376, saturate(sqrt(sqrt(_3367)))), 0.0f);
        float2 _4427 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4412, _3376, saturate(sqrt(sqrt(_3368)))), 0.0f);
        float _4436 = min(0.9900000095367432f, _4421.x);
        float _4437 = min(0.9900000095367432f, _4424.x);
        float _4438 = min(0.9900000095367432f, _4427.x);
        float _4439 = min(0.9900000095367432f, _4421.y);
        float _4440 = min(0.9900000095367432f, _4424.y);
        float _4441 = min(0.9900000095367432f, _4427.y);
        float _4442 = _4436 * _4436;
        float _4443 = _4437 * _4437;
        float _4444 = _4438 * _4438;
        float _4445 = _4439 * _4439;
        float _4446 = _4440 * _4440;
        float _4447 = _4441 * _4441;
        float _4448 = _4445 * _4439;
        float _4449 = _4446 * _4440;
        float _4450 = _4447 * _4441;
        float _4451 = 1.0f - _4442;
        float _4452 = 1.0f - _4443;
        float _4453 = 1.0f - _4444;
        float _4463 = _4451 * _4451;
        float _4464 = _4452 * _4452;
        float _4465 = _4453 * _4453;
        float _4466 = _4463 * _4451;
        float _4467 = _4464 * _4452;
        float _4468 = _4465 * _4453;
        float _4476 = min(max(_3376, 0.18000000715255737f), 0.6000000238418579f);
        float _4477 = _4476 * _4476;
        float _4478 = _4477 * 0.25f;
        float _4479 = _4477 * 4.0f;
        float _4481 = (_4437 + _4436) + _4438;
        float _4482 = _4436 / _4481;
        float _4483 = _4437 / _4481;
        float _4484 = _4438 / _4481;
        float _4485 = dot(float3(_4477, _4478, _4479), float3(_4482, _4483, _4484));
        float _4486 = _4485 * _4485;
        float _4490 = (asin(min(max(dot(float3(_912, _913, _914), float3(_996, _997, _998)), -1.0f), 1.0f)) + asin(min(max(dot(float3(_912, _913, _914), float3(_3570, _3571, _3572)), -1.0f), 1.0f))) * 0.5f;
        float _4491 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_4482, _4483, _4484));
        float _4501 = _4491 * _4491;
        float _4524 = (_4440 + _4439) + _4441;
        float _4528 = dot(float3(_4477, _4478, _4479), float3((_4439 / _4524), (_4440 / _4524), (_4441 / _4524)));
        float _4532 = sqrt((_4528 * _4528) + (_4486 * 2.0f));
        float _4550 = (_4528 * 3.0f) + (_4485 * 2.0f);
        float _4557 = (((_4448 + _4439) * ((_4442 * 0.699999988079071f) + 1.0f)) * _4532) / ((_4550 * _4448) + _4439);
        float _4558 = (((_4449 + _4440) * ((_4443 * 0.699999988079071f) + 1.0f)) * _4532) / ((_4550 * _4449) + _4440);
        float _4559 = (((_4450 + _4441) * ((_4444 * 0.699999988079071f) + 1.0f)) * _4532) / ((_4550 * _4450) + _4441);
        float _4563 = _4490 - (((_4501 * (((_4442 * 4.0f) * _4445) + (_4463 * 2.0f))) * (1.0f - ((_4445 * 2.0f) / _4463))) / _4466);
        float _4570 = _4490 - (((_4501 * (((_4443 * 4.0f) * _4446) + (_4464 * 2.0f))) * (1.0f - ((_4446 * 2.0f) / _4464))) / _4467);
        float _4577 = _4490 - (((_4501 * (((_4444 * 4.0f) * _4447) + (_4465 * 2.0f))) * (1.0f - ((_4447 * 2.0f) / _4465))) / _4468);
        float _4587 = ((1.0f - _916) * 2.0999999046325684f) * ((_4387 * 0.75f) + 0.25f);
        float _4608 = (_916 * 0.31830987334251404f) * saturate(_3584);
        _4665 = _4403;
        _4666 = _4404;
        _4667 = _4405;
        _4668 = (((_4385 * _3573) * _4403) * ((((((_4448 * _4442) / _4466) + ((_4439 * _4442) / _4451)) * _4587) * exp2((((_4563 * _4563) * -0.5f) / ((_4557 * _4557) + _4486)) * 1.4426950216293335f)) + _4301));
        _4669 = (((_4385 * _3574) * _4404) * ((((((_4449 * _4443) / _4467) + ((_4440 * _4443) / _4452)) * _4587) * exp2((((_4570 * _4570) * -0.5f) / ((_4558 * _4558) + _4486)) * 1.4426950216293335f)) + _4302));
        _4670 = (((_4385 * _3575) * _4405) * ((((((_4450 * _4444) / _4468) + ((_4441 * _4444) / _4453)) * _4587) * exp2((((_4577 * _4577) * -0.5f) / ((_4559 * _4559) + _4486)) * 1.4426950216293335f)) + _4303));
        _4671 = (_4608 * _4403);
        _4672 = (_4608 * _4404);
        _4673 = (_4608 * _4405);
        __defer_4320_4664 = true;
      } else {
        if (_3552) {
          if (_3417 == 97) {
            _4684 = ((_4304 * _3573) * _3363);
            _4685 = ((_4305 * _3574) * _3364);
            _4686 = ((_4306 * _3575) * _3365);
            _4687 = (_4321 * _3573);
            _4688 = (_4322 * _3574);
            _4689 = (_4323 * _3575);
            _4690 = _4301;
            _4691 = _4302;
            _4692 = _4303;
            _4693 = _3363;
            _4694 = _3364;
            _4695 = _3365;
            if (((_116 < 1000.0f)) && ((_3064 == 0.0h))) {
              if (!(abs(_219) > 0.9900000095367432f)) {
                float _4703 = -0.0f - _220;
                float _4705 = rsqrt(dot(float3(_4703, 0.0f, _218), float3(_4703, 0.0f, _218)));
                _4709 = (_4705 * _4703);
                _4710 = (_4705 * _218);
              } else {
                _4709 = 1.0f;
                _4710 = 0.0f;
              }
              float _4712 = -0.0f - (_219 * _4710);
              float _4715 = (_4710 * _218) - (_4709 * _220);
              float _4716 = _4709 * _219;
              float _4718 = rsqrt(dot(float3(_4712, _4715, _4716), float3(_4712, _4715, _4716)));
              float _4724 = _viewPos.x + _389;
              float _4725 = _viewPos.z + _391;
              float4 _4730 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4709, 0.0f, _4710), float3(_4724, _3151, _4725)), dot(float3((_4718 * _4712), (_4715 * _4718), (_4718 * _4716)), float3(_4724, _3151, _4725))), 0.0f);
              float _4734 = _4730.x + -0.5f;
              float _4735 = _4730.y + -0.5f;
              float _4736 = _4730.z + -0.5f;
              float _4738 = rsqrt(dot(float3(_4734, _4735, _4736), float3(_4734, _4735, _4736)));
              float _4742 = (_4734 * _4738) + _3451;
              float _4743 = (_4735 * _4738) + _3452;
              float _4744 = (_4736 * _4738) + _3453;
              float _4746 = rsqrt(dot(float3(_4742, _4743, _4744), float3(_4742, _4743, _4744)));
              float _4747 = _4742 * _4746;
              float _4748 = _4743 * _4746;
              float _4749 = _4744 * _4746;
              float _4761 = abs(((_97 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
              float _4762 = abs(1.0f - ((_98 * 2.0f) * _bufferSizeAndInvSize.w));
              float _4765 = saturate(_4761 * _4761);
              float _4766 = saturate(_4762 * _4762);
              float _4780 = dot(float3((-0.0f - _4747), (-0.0f - _4748), (-0.0f - _4749)), float3(_3570, _3571, _3572));
              float _4782 = saturate(dot(float3(_4747, _4748, _4749), float3(_996, _997, _998)));
              float _4784 = saturate(1.0f - _3590);
              float _4785 = _4784 * _4784;
              float _4787 = (_4785 * _4785) * _4784;
              float _4803 = 1.0f - ((_3589 * _3589) * 0.9998999834060669f);
              float _4810 = (max((((3.18309866997879e-05f / (_4803 * _4803)) * (0.5f / ((((_4782 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4780) + (_4782 * ((_4780 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4787, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4780)) + (exp2(log2(saturate(dot(float3(_996, _997, _998), float3(_4747, _4748, _4749)))) * 1024.0f) * 50.0f);
              float _4815 = saturate(1.0f - (_116 * 0.0010000000474974513f)) * ((1.0f - ((_4766 * _4766) * (3.0f - (_4766 * 2.0f)))) * (1.0f - ((_4765 * _4765) * (3.0f - (_4765 * 2.0f)))));
              _4829 = _4687;
              _4830 = _4688;
              _4831 = _4689;
              _4832 = _4690;
              _4833 = _4691;
              _4834 = _4692;
              _4835 = ((((_4815 * _3573) * _4693) * _4810) + _4684);
              _4836 = ((((_4815 * _3574) * _4694) * _4810) + _4685);
              _4837 = ((((_4815 * _3575) * _4695) * _4810) + _4686);
            } else {
              _4829 = _4687;
              _4830 = _4688;
              _4831 = _4689;
              _4832 = _4690;
              _4833 = _4691;
              _4834 = _4692;
              _4835 = _4684;
              _4836 = _4685;
              _4837 = _4686;
            }
          } else {
            if ((uint)(_3417 + -105) < (uint)2) {
              _4829 = (_4321 * _3573);
              _4830 = (_4322 * _3574);
              _4831 = (_4323 * _3575);
              _4832 = _4301;
              _4833 = _4302;
              _4834 = _4303;
              _4835 = ((_4304 * _3573) * _3363);
              _4836 = ((_4305 * _3574) * _3364);
              _4837 = ((_4306 * _3575) * _3365);
            } else {
              if (!(_3558 >= 999.9000244140625f)) {
                _4639 = ((max(0.0020000000949949026f, _3558) * 0.4000000059604645f) / ((_3416 * 100.0f) + 0.10000000149011612f));
              } else {
                _4639 = 1000.0f;
              }
              float _4640 = _4639 * _4639;
              float _4650 = (((_3416 * 0.25f) * (0.022082746028900146f / (_4325 * _4325))) * max(0.0f, (0.30000001192092896f - _3584))) * ((exp2(_4640 * -0.48089835047721863f) * 3.0f) + exp2(_4640 * -1.4426950216293335f));
              _4665 = _3363;
              _4666 = _3364;
              _4667 = _3365;
              _4668 = _4301;
              _4669 = _4302;
              _4670 = _4303;
              _4671 = (_4650 + _4321);
              _4672 = (_4650 + _4322);
              _4673 = (_4650 + _4323);
              __defer_4320_4664 = true;
            }
          }
        } else {
          _4665 = _3363;
          _4666 = _3364;
          _4667 = _3365;
          _4668 = _4301;
          _4669 = _4302;
          _4670 = _4303;
          _4671 = _4321;
          _4672 = _4322;
          _4673 = _4323;
          __defer_4320_4664 = true;
        }
      }
    }
    if (__defer_4320_4664) {
      float _4674 = _4671 * _3573;
      float _4675 = _4672 * _3574;
      float _4676 = _4673 * _3575;
      float _4678 = (_4304 * _3573) * _4665;
      float _4680 = (_4305 * _3574) * _4666;
      float _4682 = (_4306 * _3575) * _4667;
      if (_3511) {
        _4684 = _4678;
        _4685 = _4680;
        _4686 = _4682;
        _4687 = _4674;
        _4688 = _4675;
        _4689 = _4676;
        _4690 = _4668;
        _4691 = _4669;
        _4692 = _4670;
        _4693 = _4665;
        _4694 = _4666;
        _4695 = _4667;
        if (((_116 < 1000.0f)) && ((_3064 == 0.0h))) {
          if (!(abs(_219) > 0.9900000095367432f)) {
            float _4703 = -0.0f - _220;
            float _4705 = rsqrt(dot(float3(_4703, 0.0f, _218), float3(_4703, 0.0f, _218)));
            _4709 = (_4705 * _4703);
            _4710 = (_4705 * _218);
          } else {
            _4709 = 1.0f;
            _4710 = 0.0f;
          }
          float _4712 = -0.0f - (_219 * _4710);
          float _4715 = (_4710 * _218) - (_4709 * _220);
          float _4716 = _4709 * _219;
          float _4718 = rsqrt(dot(float3(_4712, _4715, _4716), float3(_4712, _4715, _4716)));
          float _4724 = _viewPos.x + _389;
          float _4725 = _viewPos.z + _391;
          float4 _4730 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4709, 0.0f, _4710), float3(_4724, _3151, _4725)), dot(float3((_4718 * _4712), (_4715 * _4718), (_4718 * _4716)), float3(_4724, _3151, _4725))), 0.0f);
          float _4734 = _4730.x + -0.5f;
          float _4735 = _4730.y + -0.5f;
          float _4736 = _4730.z + -0.5f;
          float _4738 = rsqrt(dot(float3(_4734, _4735, _4736), float3(_4734, _4735, _4736)));
          float _4742 = (_4734 * _4738) + _3451;
          float _4743 = (_4735 * _4738) + _3452;
          float _4744 = (_4736 * _4738) + _3453;
          float _4746 = rsqrt(dot(float3(_4742, _4743, _4744), float3(_4742, _4743, _4744)));
          float _4747 = _4742 * _4746;
          float _4748 = _4743 * _4746;
          float _4749 = _4744 * _4746;
          float _4761 = abs(((_97 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
          float _4762 = abs(1.0f - ((_98 * 2.0f) * _bufferSizeAndInvSize.w));
          float _4765 = saturate(_4761 * _4761);
          float _4766 = saturate(_4762 * _4762);
          float _4780 = dot(float3((-0.0f - _4747), (-0.0f - _4748), (-0.0f - _4749)), float3(_3570, _3571, _3572));
          float _4782 = saturate(dot(float3(_4747, _4748, _4749), float3(_996, _997, _998)));
          float _4784 = saturate(1.0f - _3590);
          float _4785 = _4784 * _4784;
          float _4787 = (_4785 * _4785) * _4784;
          float _4803 = 1.0f - ((_3589 * _3589) * 0.9998999834060669f);
          float _4810 = (max((((3.18309866997879e-05f / (_4803 * _4803)) * (0.5f / ((((_4782 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4780) + (_4782 * ((_4780 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4787, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4780)) + (exp2(log2(saturate(dot(float3(_996, _997, _998), float3(_4747, _4748, _4749)))) * 1024.0f) * 50.0f);
          float _4815 = saturate(1.0f - (_116 * 0.0010000000474974513f)) * ((1.0f - ((_4766 * _4766) * (3.0f - (_4766 * 2.0f)))) * (1.0f - ((_4765 * _4765) * (3.0f - (_4765 * 2.0f)))));
          _4829 = _4687;
          _4830 = _4688;
          _4831 = _4689;
          _4832 = _4690;
          _4833 = _4691;
          _4834 = _4692;
          _4835 = ((((_4815 * _3573) * _4693) * _4810) + _4684);
          _4836 = ((((_4815 * _3574) * _4694) * _4810) + _4685);
          _4837 = ((((_4815 * _3575) * _4695) * _4810) + _4686);
        } else {
          _4829 = _4687;
          _4830 = _4688;
          _4831 = _4689;
          _4832 = _4690;
          _4833 = _4691;
          _4834 = _4692;
          _4835 = _4684;
          _4836 = _4685;
          _4837 = _4686;
        }
      } else {
        _4829 = _4674;
        _4830 = _4675;
        _4831 = _4676;
        _4832 = _4668;
        _4833 = _4669;
        _4834 = _4670;
        _4835 = _4678;
        _4836 = _4680;
        _4837 = _4682;
      }
    }
    float _4844 = _4829 + _3065 + foliageTransR;
    float _4845 = _4830 + _3066 + foliageTransG;
    float _4846 = _4831 + _3067 + foliageTransB;
    uint _4849 = _frameNumber.x * 13;
    [branch]
    if (((((int)(_4849 + ((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3))))) | ((int)(_4849 + ((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((int)(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))) >> 5)), ((int)(((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))) >> 5)))] = half4(half(_4844), half(_4845), half(_4846), 1.0h);
    }
    bool _4864 = ((uint)(_3417 & 24) > (uint)23);
    if (_3485) {
      _4881 = saturate(exp2((_3480 * _3480) * (_116 * -0.005770780146121979f)));
    } else {
      _4881 = select((_cavityParams.z > 0.0f), select(_175, 0.0f, _990), 1.0f);
    }
    float _4896 = select(_3482, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _4881) * select(((_174) && (_4864)), (1.0f - _990), 1.0f)));
    float _4900 = min(60000.0f, (_4896 * (((_2776 * _2532) * _2781) - min(0.0f, (-0.0f - _4835)))));
    float _4901 = min(60000.0f, (_4896 * (((_2777 * _2533) * _2781) - min(0.0f, (-0.0f - _4836)))));
    float _4902 = min(60000.0f, (_4896 * (((_2778 * _2534) * _2781) - min(0.0f, (-0.0f - _4837)))));
    float _4905 = 1.0f - _renderParams.x;
    half _4912 = half((_renderParams.x * _3366) + _4905);
    half _4913 = half((_renderParams.x * _3367) + _4905);
    half _4914 = half((_renderParams.x * _3368) + _4905);
    if ((_3482) && ((_renderParams2.x == 0.0f))) {
      _4930 = (pow(_4912, 0.5h));
      _4931 = (pow(_4913, 0.5h));
      _4932 = (pow(_4914, 0.5h));
    } else {
      _4930 = _4912;
      _4931 = _4913;
      _4932 = _4914;
    }
    bool _4934 = (_3516) || ((_3417 == 55));
    half _4935 = select(_4934, 0.0h, _3064);
    float _4936 = float(_4930);
    float _4937 = float(_4931);
    float _4938 = float(_4932);
    if (_3454) {
      _4945 = saturate(((_4937 + _4936) + _4938) * 1.2000000476837158f);
    } else {
      _4945 = 1.0f;
    }
    float _4946 = float(_4935);
    float _4952 = (0.699999988079071f / min(max(max(max(_4936, _4937), _4938), 0.009999999776482582f), 0.699999988079071f)) * _4945;
    float _4959 = ((_4952 * _4936) + -0.03999999910593033f) * _4946;
    float _4960 = ((_4952 * _4937) + -0.03999999910593033f) * _4946;
    float _4961 = ((_4952 * _4938) + -0.03999999910593033f) * _4946;
    float _4962 = _4959 + 0.03999999910593033f;
    float _4963 = _4960 + 0.03999999910593033f;
    float _4964 = _4961 + 0.03999999910593033f;
    if ((_3511) || (((_3594) || (((_3593) || (_4934)))))) {
      float2 _4973 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__3__40__0__0__g_samplerClamp, float2(min(0.9900000095367432f, _1004), (1.0f - max(0.019999999552965164f, float(_157)))), 0.0f);
      _4977 = _4973.x;
      _4978 = _4973.y;
    } else {
      _4977 = _2774;
      _4978 = _2775;
    }
    float _4982 = (_4977 * _4962) + _4978;
    float _4983 = (_4977 * _4963) + _4978;
    float _4984 = (_4977 * _4964) + _4978;
    float _4986 = (1.0f - _4977) - _4978;
    float _4993 = ((0.9599999785423279f - _4959) * 0.0476190485060215f) + _4962;
    float _4994 = ((0.9599999785423279f - _4960) * 0.0476190485060215f) + _4963;
    float _4995 = ((0.9599999785423279f - _4961) * 0.0476190485060215f) + _4964;
    float _5012 = saturate(1.0f - _3059);
    float _5013 = (((_4982 * _4993) / (1.0f - (_4986 * _4993))) * _4986) * _5012;
    float _5014 = (((_4983 * _4994) / (1.0f - (_4986 * _4994))) * _4986) * _5012;
    float _5015 = (((_4984 * _4995) / (1.0f - (_4986 * _4995))) * _4986) * _5012;
    float _5026 = float(1.0h - _4935);
    half _5036 = half(((_4936 * _5026) * saturate((1.0f - _4982) - _5013)) + _5013);
    half _5037 = half(((_4937 * _5026) * saturate((1.0f - _4983) - _5014)) + _5014);
    half _5038 = half(((_4938 * _5026) * saturate((1.0f - _4984) - _5015)) + _5015);
    float _5040 = float(_5036);
    float _5041 = float(_5037);
    float _5042 = float(_5038);
    if (_3417 == 65) {
      float _5046 = max(9.999999974752427e-07f, _exposure2.x);
      float _5054 = ((pow(_3587, 16.0f)) * 50.26548385620117f) / (((_5046 * _5046) * 1e+06f) + 1.0f);
      _5071 = (((((_5040 * _4844) * _5054) - _4844) * _954) + _4844);
      _5072 = (((((_5041 * _4845) * _5054) - _4845) * _954) + _4845);
      _5073 = (((((_5042 * _4846) * _5054) - _4846) * _954) + _4846);
    } else {
      _5071 = _4844;
      _5072 = _4845;
      _5073 = _4846;
    }
    float _5076 = __3__36__0__0__g_caustic.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_104, _105), 0.0f);
    float _5078 = _5076.x * 0.31830987334251404f;
    float _5088 = (min(65535.0f, _4832) + _3068) + (((_5078 * _3354) + _5071) * _5040);
    float _5089 = (min(65535.0f, _4833) + _3069) + (((_5078 * _3355) + _5072) * _5041);
    float _5090 = (min(65535.0f, _4834) + _3070) + (((_5078 * _3356) + _5073) * _5042);
    float _5119 = exp2((saturate(_419) * 20.0f) + -8.0f) + -0.00390625f;
    float _5120 = _5119 * select((_416 < 0.040449999272823334f), (_416 * 0.07739938050508499f), exp2(log2((_416 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _5121 = _5119 * select((_417 < 0.040449999272823334f), (_417 * 0.07739938050508499f), exp2(log2((_417 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _5122 = _5119 * select((_418 < 0.040449999272823334f), (_418 * 0.07739938050508499f), exp2(log2((_418 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    float _5135 = ((_5120 * 0.6131200194358826f) + (_5121 * 0.3395099937915802f)) + (_5122 * 0.047370001673698425f);
    float _5136 = ((_5120 * 0.07020000368356705f) + (_5121 * 0.9163600206375122f)) + (_5122 * 0.013450000435113907f);
    float _5137 = ((_5120 * 0.02061999961733818f) + (_5121 * 0.10958000272512436f)) + (_5122 * 0.8697999715805054f);
    if (_345) {
      _5143 = (_5135 + _5088);
      _5144 = (_5136 + _5089);
      _5145 = (_5137 + _5090);
    } else {
      _5143 = _5088;
      _5144 = _5089;
      _5145 = _5090;
    }
    float _5149 = _5143 + (_4900 * _4946);
    float _5150 = _5144 + (_4901 * _4946);
    float _5151 = _5145 + (_4902 * _4946);
    float _5173 = (((QuadReadLaneAt(_5149,1) + QuadReadLaneAt(_5149,0)) + QuadReadLaneAt(_5149,2)) + QuadReadLaneAt(_5149,3)) * 0.25f;
    float _5174 = (((QuadReadLaneAt(_5150,1) + QuadReadLaneAt(_5150,0)) + QuadReadLaneAt(_5150,2)) + QuadReadLaneAt(_5150,3)) * 0.25f;
    float _5175 = (((QuadReadLaneAt(_5151,1) + QuadReadLaneAt(_5151,0)) + QuadReadLaneAt(_5151,2)) + QuadReadLaneAt(_5151,3)) * 0.25f;
    [branch]
    if (((((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))) | ((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3))))) & 1) == 0) {
      float _5180 = dot(float3(_5173, _5174, _5175), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((int)(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))) >> 1)), ((int)(((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))) >> 1)))] = float4(min(60000.0f, _5173), min(60000.0f, _5174), min(60000.0f, _5175), min(60000.0f, select((_1585 != 0), (-0.0f - _5180), _5180)));
    }
    if (_4864) {
      _5202 = (((_4935 == 0.0h)) && ((!(((((!(_5036 == 0.0h))) && ((!(_5037 == 0.0h))))) && ((!(_5038 == 0.0h)))))));
    } else {
      _5202 = false;
    }
    if ((((_4864) || ((((_3417 == 96)) || (((_3594) || (((_3417 & -4) == 64)))))))) || ((((_116 <= 10.0f)) && (_3511)))) {
      __3__38__0__1__g_sceneSpecularUAV[int2(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))))] = half4((-0.0h - half(min(0.0f, (-0.0f - _4900)))), (-0.0h - half(min(0.0f, (-0.0f - _4901)))), (-0.0h - half(min(0.0f, (-0.0f - _4902)))), (-0.0h - half(min(0.0f, (-0.0f - _2542)))));
      _5235 = _5143;
      _5236 = _5144;
      _5237 = _5145;
    } else {
      _5235 = (_5143 + _4900);
      _5236 = (_5144 + _4901);
      _5237 = (_5145 + _4902);
    }
    if (!((((uint)(_3417 + -53) < (uint)15)) || ((!_345)))) {
      float _5243 = dot(float3(_5135, _5136, _5137), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _5247 = max((max(_5243, 1.0f) / max(_5243, 0.10000000149011612f)), 0.0f);
      _5258 = ((_5235 - _5135) + (_5247 * _5135));
      _5259 = ((_5236 - _5136) + (_5247 * _5136));
      _5260 = ((_5237 - _5137) + (_5247 * _5137));
    } else {
      _5258 = _5235;
      _5259 = _5236;
      _5260 = _5237;
    }
    float _5261 = min(60000.0f, _5258);
    float _5262 = min(60000.0f, _5259);
    float _5263 = min(60000.0f, _5260);
    [branch]
    if (_5202) {
      float4 _5266 = __3__38__0__1__g_sceneColorUAV.Load(int2(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5))))));
      _5274 = (_5266.x + _5261);
      _5275 = (_5266.y + _5262);
      _5276 = (_5266.z + _5263);
    } else {
      _5274 = _5261;
      _5275 = _5262;
      _5276 = _5263;
    }
    if (!(_renderParams.y == 0.0f)) {
      float _5285 = dot(float3(_5274, _5275, _5276), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _5286 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _5285);
      float _5290 = max(9.999999717180685e-10f, _5285);
      _5295 = ((_5286 * _5274) / _5290);
      _5296 = ((_5286 * _5275) / _5290);
      _5297 = ((_5286 * _5276) / _5290);
    } else {
      _5295 = _5274;
      _5296 = _5275;
      _5297 = _5276;
    }
    __3__38__0__1__g_sceneColorUAV[int2(((int)((((uint)(((int)((uint)(_88) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_69 - (_70 << 2)) << 3)))), ((int)((((uint)(_70 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_88)) >> 16) << 5)))))] = float4(_5295, _5296, _5297, 1.0f);
  }
}