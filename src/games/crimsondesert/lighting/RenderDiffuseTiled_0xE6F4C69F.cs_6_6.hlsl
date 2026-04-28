#include "../shared.h"
#include "../sky-atmospheric/sky_dawn_dusk_common.hlsli"
#include "diffuse_brdf.hlsli"
#include "foliage_common.hlsli"

Texture2D<float4> __3__36__0__0__g_puddleMask : register(t83, space36);

Texture2D<float4> __3__36__0__0__g_climateSandTex : register(t162, space36);

Texture2D<uint16_t> __3__36__0__0__g_sceneDecalMask : register(t167, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t75, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t196, space36);

Texture3D<float2> __3__36__0__0__g_hairDualScatteringLUT : register(t215, space36);

Texture2D<float4> __3__36__0__0__g_blueNoise : register(t102, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t44, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t147, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t51, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t85, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t74, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t38, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t42, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t87, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t43, space36);

Texture2D<float4> __3__36__0__0__g_bentCone : register(t22, space36);

Texture2D<float4> __3__36__0__0__g_character : register(t70, space36);

Texture2D<float4> __3__36__0__0__g_specularResult : register(t178, space36);

Texture2D<float> __3__36__0__0__g_specularRayHitDistance : register(t88, space36);

Texture2D<float4> __3__36__0__0__g_manyLightsMoments : register(t47, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t89, space36);

Texture2D<float2> __3__36__0__0__g_hairBrdfLookup : register(t91, space36);

Texture2D<uint2> __3__36__0__0__g_stencilPrev : register(t153, space36);

Texture2D<half4> __3__36__0__0__g_sceneDiffuse : register(t154, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResult : register(t23, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResultPrev : register(t24, space36);

Texture2D<half4> __3__36__0__0__g_specularResultPrev : register(t8, space36);

Texture2D<half2> __3__36__0__0__g_sceneAO : register(t25, space36);

Texture2D<float> __3__36__0__0__g_caustic : register(t26, space36);

Texture2D<uint> __3__36__0__0__g_tiledManyLightsMasks : register(t6, space36);

ByteAddressBuffer __3__37__0__0__g_structureCounterBuffer : register(t27, space37);

Texture2D<half4> __3__36__0__0__g_sceneShadowColor : register(t19, space36);

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
  uint4 __3__35__0__0__TileConstantBuffer_raw[4096];
};

cbuffer __3__35__0__0__EnvironmentLightingHistoryConstantBuffer : register(b0, space35) {
  float4 _environmentLightingHistory[4] : packoffset(c000.x);
};

cbuffer __3__35__0__0__MaterialParameterPresetTableConstantBuffer : register(b42, space35) {
  uint4 __3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[27];
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
  uint _95;
  uint _97;
  float _98;
  float _99;
  float _100;
  float _101;
  float _105;
  float _106;
  float _108;
  uint2 _111;
  int _113;
  float _116;
  float _117;
  half _290;
  half _291;
  half _292;
  half _293;
  float _318;
  float _319;
  float _320;
  bool _336;
  float _417;
  float _418;
  float _419;
  float _420;
  float _443;
  float _444;
  float _445;
  float _446;
  float _447;
  int _453;
  half _454;
  float _455;
  float _456;
  float _457;
  float _458;
  float _459;
  float _488;
  half _489;
  float _491;
  float _504;
  float _505;
  float _506;
  float _507;
  half _508;
  half _538;
  float _554;
  half _918;
  float _919;
  float _920;
  float _921;
  float _922;
  int _923;
  float _924;
  float _925;
  float _926;
  bool _948;
  bool _951;
  bool _952;
  float _970;
  float _981;
  float _982;
  float _992;
  float _993;
  half _994;
  half _995;
  half _996;
  half _997;
  half _998;
  float _1010;
  bool _1033;
  float _1042;
  float _1083;
  float _1084;
  float _1170;
  float _1248;
  bool _1353;
  float _1425;
  float _1426;
  float _1427;
  float _1428;
  float _1591;
  int _1592;
  float _1649;
  float _1769;
  float _1770;
  float _1771;
  float _1772;
  float _1799;
  half _1824;
  bool _1836;
  half _1867;
  int _1868;
  float _1869;
  float _1870;
  float _1871;
  float _2141;
  float _2160;
  float _2164;
  float _2196;
  float _2241;
  float _2242;
  float _2243;
  float _2244;
  float _2250;
  float _2251;
  float _2252;
  float _2253;
  float _2256;
  float _2257;
  float _2258;
  float _2259;
  half _2260;
  float _2408;
  int _2409;
  int _2410;
  float _2411;
  float _2412;
  float _2413;
  float _2414;
  float _2547;
  float _2548;
  float _2549;
  float _2610;
  float _2620;
  float _2621;
  float _2622;
  float _2667;
  float _2668;
  float _2800;
  float _2801;
  float _2802;
  float _2817;
  float _2818;
  float _2819;
  float _2820;
  float _2821;
  bool _2887;
  bool _2888;
  float _2924;
  float _2925;
  float _2926;
  float _2927;
  float _2993;
  float _2996;
  float _2997;
  float _2998;
  float _2999;
  float _3034;
  float _3035;
  float _3036;
  float _3051;
  float _3080;
  float _3081;
  float _3082;
  float _3083;
  float _3084;
  half _3091;
  half _3092;
  half _3093;
  half _3094;
  half _3095;
  float _3096;
  float _3102;
  half _3103;
  half _3104;
  half _3105;
  half _3106;
  half _3107;
  float _3108;
  float _3109;
  float _3110;
  float _3111;
  float _3112;
  float _3113;
  half _3150;
  half _3151;
  half _3152;
  float _3167;
  float _3168;
  float _3169;
  float _3189;
  float _3249;
  float _3347;
  float _3348;
  float _3349;
  bool _3417;
  bool _3439;
  bool _3441;
  bool _3442;
  float _3459;
  int _3460;
  float _3461;
  float _3462;
  float _3463;
  float _3464;
  float _3465;
  float _3504;
  float _3541;
  float _3548;
  float _3549;
  float _3550;
  bool _3571;
  bool _3573;
  bool _3577;
  int _3578;
  float _3579;
  bool _3588;
  int _3589;
  float _3590;
  float _3593;
  int _3594;
  bool _3595;
  bool _3596;
  float _3613;
  float _3614;
  float _3615;
  float _3655;
  float _3926;
  float _3927;
  float _3928;
  float _3929;
  float _3930;
  float _3931;
  float _3932;
  float _3933;
  float _3934;
  float _4104;
  float _4105;
  float _4106;
  float _4107;
  float _4108;
  float _4109;
  float _4110;
  float _4111;
  float _4112;
  float _4202;
  float _4203;
  float _4204;
  float _4271;
  float _4272;
  float _4273;
  float _4274;
  float _4275;
  float _4276;
  float _4321;
  float _4322;
  float _4323;
  float _4324;
  float _4325;
  float _4326;
  float _4327;
  float _4328;
  float _4329;
  float _4344;
  float _4345;
  float _4346;
  float _4347;
  float _4348;
  float _4349;
  float _4350;
  float _4351;
  float _4352;
  float _4364;
  float _4365;
  float _4366;
  float _4668;
  float _4684;
  float _4685;
  float _4686;
  float _4687;
  float _4688;
  float _4689;
  float _4690;
  float _4691;
  float _4692;
  float _4703;
  float _4704;
  float _4705;
  float _4717;
  float _4718;
  float _4719;
  float _4720;
  float _4721;
  float _4722;
  float _4723;
  float _4724;
  float _4725;
  float _4726;
  float _4727;
  float _4728;
  float _4731;
  float _4732;
  float _4733;
  float _4734;
  float _4735;
  float _4736;
  float _4737;
  float _4738;
  float _4739;
  float _4740;
  float _4741;
  float _4742;
  float _4756;
  float _4757;
  float _4876;
  float _4877;
  float _4878;
  float _4879;
  float _4880;
  float _4881;
  float _4882;
  float _4883;
  float _4884;
  float _4928;
  // RenoDX: Foliage transmission accumulator
  float foliageTransR = 0.0f;
  float foliageTransG = 0.0f;
  float foliageTransB = 0.0f;
  half _4977;
  half _4978;
  half _4979;
  float _4992;
  float _5024;
  float _5025;
  float _5118;
  float _5119;
  float _5120;
  float _5190;
  float _5191;
  float _5192;
  bool _5249;
  float _5282;
  float _5283;
  float _5284;
  float _5305;
  float _5306;
  float _5307;
  float _5321;
  float _5322;
  float _5323;
  float _5342;
  float _5343;
  float _5344;
  uint4 _125;
  float4 _131;
  half _140;
  half _144;
  half _149;
  half _153;
  half _158;
  half _162;
  uint _174;
  bool _175;
  bool _176;
  float _186;
  float _187;
  float _188;
  float _190;
  half _194;
  half _195;
  half _196;
  half _199;
  half _200;
  float _205;
  float _206;
  float _210;
  float _212;
  float _219;
  float _220;
  float _221;
  float _223;
  float _226;
  float _227;
  float _228;
  float _229;
  float _235;
  float _236;
  float _237;
  float _238;
  half _250;
  half _251;
  half _252;
  half _254;
  half _258;
  half _259;
  half _260;
  half _276;
  half _277;
  half _278;
  float _299;
  float _300;
  float _301;
  bool _304;
  float4 _322;
  bool _346;
  float _347;
  float _348;
  float _349;
  float _351;
  float _353;
  float _389;
  float _390;
  float _391;
  float _392;
  float _394;
  float _395;
  float _396;
  float _397;
  int _398;
  bool _401;
  bool _402;
  bool _404;
  float4 _411;
  uint _429;
  float4 _436;
  bool _463;
  float _470;
  float _495;
  float _496;
  float _497;
  float _499;
  bool _511;
  float4 _515;
  float _522;
  float _523;
  float _524;
  float _526;
  float _527;
  float _528;
  float _529;
  float _539;
  float _555;
  float _556;
  float _557;
  float _558;
  float _559;
  float _560;
  float _561;
  float _562;
  float _568;
  float _572;
  float _573;
  float _574;
  float _578;
  float _579;
  float _580;
  float _587;
  float _597;
  float _598;
  float _599;
  float _600;
  float _601;
  float _602;
  float _611;
  float _616;
  float _622;
  float _623;
  float _627;
  float _628;
  float _633;
  float _634;
  float _635;
  float _636;
  float _648;
  float _652;
  float _662;
  float _663;
  float _667;
  float _669;
  float _670;
  float _683;
  float _693;
  float _694;
  float _695;
  float _704;
  float2 _713;
  float2 _716;
  float2 _719;
  float _726;
  float _727;
  float _728;
  float _729;
  float _730;
  float _731;
  float _732;
  float _733;
  float _734;
  float _735;
  float _736;
  float _737;
  float _738;
  float _739;
  float _740;
  float _741;
  float _742;
  float _743;
  float _753;
  float _754;
  float _755;
  float _756;
  float _757;
  float _758;
  float _766;
  float _767;
  float _768;
  float _769;
  float _771;
  float _772;
  float _773;
  float _774;
  float _775;
  float _776;
  float _779;
  float _780;
  float _781;
  float _791;
  float _814;
  float _818;
  float _822;
  float _840;
  float _847;
  float _848;
  float _849;
  float _858;
  float _865;
  float _872;
  float _900;
  float _901;
  float _902;
  float _903;
  float _904;
  float _933;
  float _934;
  float _935;
  bool _945;
  bool _957;
  bool _958;
  float _960;
  bool _963;
  bool _965;
  uint _972;
  half _983;
  bool _987;
  int _999;
  bool _1000;
  bool _1001;
  bool _1002;
  float _1003;
  float _1004;
  float _1005;
  float _1006;
  float _1011;
  bool _1013;
  uint _1036;
  float _1070;
  float2 _1077;
  float _1086;
  float _1089;
  float _1090;
  float _1098;
  float _1103;
  float _1104;
  int _1107;
  int _1108;
  float _1109;
  float _1110;
  float _1113;
  float _1114;
  int4 _1117;
  int _1140;
  float _1178;
  float _1179;
  float _1180;
  float _1181;
  float _1185;
  float _1202;
  float _1203;
  float _1206;
  bool _1221;
  float _1223;
  float _1225;
  bool _1229;
  float _1258;
  float _1263;
  float _1264;
  float _1265;
  float _1266;
  float _1267;
  float _1268;
  float _1269;
  float _1270;
  float _1272;
  float _1285;
  float _1286;
  float _1287;
  float _1288;
  int _1290;
  int _1291;
  int _1292;
  int _1293;
  bool _1332;
  bool _1333;
  bool _1334;
  bool _1335;
  int _1347;
  bool _1362;
  bool _1384;
  bool _1391;
  int4 _1430;
  float _1449;
  float _1450;
  float _1451;
  float _1453;
  float _1458;
  float _1473;
  float _1474;
  float _1475;
  float _1477;
  float _1482;
  float _1497;
  float _1498;
  float _1499;
  float _1501;
  float _1506;
  float _1521;
  float _1522;
  float _1523;
  float _1525;
  float _1530;
  float _1533;
  float _1550;
  float _1551;
  float _1552;
  float _1553;
  float _1558;
  float _1560;
  float _1562;
  float _1564;
  float _1566;
  float _1567;
  float _1568;
  float _1569;
  uint _1579;
  int _1581;
  int _1583;
  float _1602;
  uint _1603;
  uint _1610;
  float _1626;
  float _1635;
  float _1640;
  float _1653;
  float _1658;
  float4 _1669;
  float _1673;
  float _1675;
  float _1676;
  float _1677;
  float _1678;
  float _1679;
  float _1680;
  float _1722;
  float _1739;
  float _1740;
  float _1741;
  float _1749;
  float _1764;
  float _1781;
  float _1782;
  float _1783;
  float _1790;
  float _1791;
  float _1792;
  float _1800;
  float _1806;
  float _1816;
  float _1817;
  float _1818;
  bool _1828;
  bool _1838;
  half _1841;
  uint _1853;
  float4 _1860;
  float _1873;
  float _1877;
  float _1878;
  float _1879;
  float _1881;
  float _1882;
  float _1883;
  float _1884;
  float _1887;
  float _1889;
  float _1891;
  float _1892;
  float _1893;
  float _1894;
  float _1899;
  float _1904;
  float _1906;
  float _1908;
  float _1932;
  float _1936;
  float _1940;
  float _1944;
  float _1982;
  float _1983;
  float _1984;
  float _1988;
  float _2024;
  float _2035;
  float _2036;
  float _2037;
  float _2038;
  float _2042;
  float _2043;
  float _2044;
  float _2060;
  float _2061;
  float _2062;
  float _2063;
  float _2064;
  float _2065;
  float _2066;
  bool _2069;
  float _2071;
  float _2075;
  float _2076;
  float _2080;
  float _2085;
  int _2091;
  bool _2094;
  float _2097;
  float _2101;
  float _2106;
  float _2132;
  float _2143;
  float _2149;
  float _2173;
  float _2186;
  half _2199;
  float _2217;
  float _2228;
  float _2229;
  float _2230;
  float _2231;
  float _2232;
  float _2233;
  float _2234;
  float _2235;
  float _2261;
  float _2262;
  float _2263;
  float _2276;
  float _2277;
  float _2278;
  float _2279;
  float _2304;
  float _2305;
  float _2306;
  float _2307;
  bool _2309;
  float _2322;
  float _2325;
  float _2326;
  float _2336;
  float _2337;
  int _2340;
  int _2341;
  float _2342;
  float _2343;
  int4 _2353;
  int _2360;
  float _2392;
  float _2393;
  float _2394;
  float _2395;
  bool _2415;
  uint _2416;
  float _2431;
  uint _2437;
  float _2451;
  float _2474;
  float _2497;
  float _2521;
  float _2523;
  float _2525;
  float _2527;
  float _2528;
  float _2535;
  float _2542;
  float _2550;
  float _2551;
  float _2552;
  float _2565;
  float _2575;
  float _2576;
  float _2577;
  float _2585;
  float _2590;
  bool _2591;
  int _2593;
  bool _2613;
  float _2614;
  float2 _2637;
  float2 _2643;
  float _2650;
  float _2651;
  float _2653;
  float _2661;
  float _2663;
  float _2670;
  float _2673;
  float _2674;
  float _2676;
  float _2684;
  float _2685;
  float _2686;
  float4 _2691;
  float _2695;
  float _2696;
  float _2697;
  float _2699;
  float _2703;
  float _2704;
  float _2705;
  float _2707;
  float2 _2720;
  float _2727;
  float _2737;
  float2 _2742;
  float2 _2747;
  float _2751;
  float _2753;
  float _2770;
  float _2774;
  float _2775;
  float _2776;
  float _2783;
  float2 _2807;
  float _2824;
  float _2831;
  float _2832;
  float _2833;
  float _2858;
  float4 _2868;
  bool _2898;
  float4 _2918;
  float _2934;
  float _2937;
  float _2950;
  float _2951;
  float _2952;
  float _2957;
  float _2962;
  float _2973;
  float _2991;
  float _3003;
  bool _3004;
  float _3007;
  float _3052;
  float _3053;
  float _3054;
  float _3059;
  float _3062;
  float _3069;
  float _3070;
  uint _3122;
  float _3138;
  float _3139;
  float _3140;
  float _3142;
  bool _3155;
  float _3194;
  float _3195;
  float _3199;
  float _3201;
  float _3206;
  float _3211;
  float _3219;
  float _3226;
  float2 _3254;
  float _3276;
  float _3294;
  float _3295;
  float _3296;
  float _3312;
  float _3320;
  float _3332;
  float _3335;
  float _3341;
  float _3358;
  float _3369;
  float _3371;
  float _3378;
  float _3379;
  float _3380;
  float _3381;
  float _3397;
  float _3398;
  float _3399;
  float _3405;
  float _3406;
  float _3407;
  float _3408;
  float _3409;
  float _3410;
  float _3411;
  float _3419;
  float _3420;
  bool _3423;
  bool _3426;
  float _3427;
  bool _3436;
  float _3443;
  float _3444;
  float _3445;
  uint16_t _3447;
  float _3470;
  float _3471;
  float _3472;
  float _3473;
  float4 _3480;
  float _3484;
  float _3489;
  float _3490;
  float _3491;
  float _3493;
  float _3494;
  float _3495;
  float _3496;
  bool _3497;
  float _3510;
  float _3520;
  float _3521;
  float _3522;
  float _3523;
  int _3524;
  bool _3525;
  bool _3528;
  float _3542;
  float _3551;
  float _3552;
  bool _3554;
  float _3556;
  float _3557;
  float _3558;
  bool _3559;
  bool _3561;
  int _3562;
  float _3601;
  float _3616;
  float _3617;
  float _3618;
  float _3619;
  float _3620;
  float _3621;
  float _3623;
  float _3624;
  float _3625;
  float _3626;
  float _3627;
  float _3628;
  float _3630;
  float _3632;
  float _3633;
  float _3635;
  bool _3636;
  bool _3637;
  bool _3638;
  float _3673;
  float _3677;
  float4 _3682;
  float _3686;
  float _3687;
  float _3688;
  float _3689;
  float _3700;
  float _3701;
  float _3707;
  float _3711;
  float _3712;
  float _3713;
  float _3717;
  float _3718;
  float _3719;
  float _3726;
  float _3730;
  float _3737;
  float _3738;
  float _3739;
  float _3740;
  float _3741;
  float _3742;
  float _3744;
  float _3758;
  float _3759;
  float _3766;
  float _3775;
  float _3780;
  float _3786;
  float _3787;
  float _3791;
  float _3792;
  float _3797;
  float _3798;
  float _3799;
  float _3800;
  float _3812;
  float _3816;
  float _3826;
  float _3827;
  float _3831;
  float _3833;
  float _3834;
  float _3847;
  float _3854;
  float _3855;
  float _3865;
  float _3876;
  float _3881;
  float _3900;
  float _3902;
  float _3904;
  float _3906;
  float _3913;
  float _3914;
  float _3915;
  float _3922;
  float _3923;
  float _3924;
  bool _3936;
  float _3951;
  float _3957;
  float _3958;
  float _3959;
  float _3960;
  float _3961;
  float _3962;
  float _3963;
  float _3970;
  float _3983;
  float _3986;
  float _3987;
  float _3989;
  float _3992;
  float _3993;
  float _3994;
  float _3998;
  float _3999;
  float _4000;
  float _4001;
  float _4002;
  float _4003;
  float _4015;
  float _4019;
  float _4023;
  float _4024;
  float _4025;
  float _4026;
  float _4038;
  float _4042;
  float _4058;
  float _4063;
  float _4064;
  float _4074;
  float _4099;
  float _4115;
  float _4116;
  float _4117;
  float _4118;
  float _4121;
  float _4122;
  float _4123;
  float _4128;
  float _4129;
  float _4156;
  float _4159;
  float _4160;
  float _4162;
  float _4165;
  float _4166;
  float _4170;
  float _4171;
  float _4172;
  float _4174;
  float _4175;
  float _4187;
  float _4191;
  bool _4205;
  float _4212;
  float _4224;
  float _4228;
  float _4235;
  float _4248;
  float _4257;
  float _4280;
  float _4281;
  float _4282;
  float _4283;
  float _4284;
  float _4285;
  bool _4287;
  float _4330;
  float _4331;
  float _4332;
  float _4333;
  float _4334;
  float _4335;
  float _4356;
  float _4368;
  float _4372;
  float _4373;
  float _4375;
  float _4380;
  float _4388;
  float _4394;
  float _4396;
  float _4401;
  float _4415;
  float _4425;
  float _4428;
  float _4435;
  float _4436;
  float _4437;
  float _4443;
  float2 _4452;
  float2 _4455;
  float2 _4458;
  float _4467;
  float _4468;
  float _4469;
  float _4470;
  float _4471;
  float _4472;
  float _4473;
  float _4474;
  float _4475;
  float _4476;
  float _4477;
  float _4478;
  float _4479;
  float _4480;
  float _4481;
  float _4482;
  float _4483;
  float _4484;
  float _4494;
  float _4495;
  float _4496;
  float _4497;
  float _4498;
  float _4499;
  float _4507;
  float _4508;
  float _4509;
  float _4510;
  float _4512;
  float _4513;
  float _4514;
  float _4515;
  float _4516;
  float _4517;
  float _4521;
  float _4522;
  float _4532;
  float _4555;
  float _4559;
  float _4563;
  float _4581;
  float _4588;
  float _4589;
  float _4590;
  float _4594;
  float _4601;
  float _4608;
  float _4616;
  float _4637;
  float _4669;
  float _4679;
  float _4706;
  float _4707;
  float _4708;
  float _4710;
  float _4712;
  float _4714;
  float _4750;
  float _4752;
  float _4759;
  float _4762;
  float _4763;
  float _4765;
  float _4771;
  float _4772;
  float4 _4777;
  float _4781;
  float _4782;
  float _4783;
  float _4785;
  float _4789;
  float _4790;
  float _4791;
  float _4793;
  float _4794;
  float _4795;
  float _4796;
  float _4808;
  float _4809;
  float _4812;
  float _4813;
  float _4827;
  float _4829;
  float _4831;
  float _4832;
  float _4834;
  float _4850;
  float _4857;
  float _4862;
  float _4891;
  float _4892;
  float _4893;
  uint _4896;
  bool _4911;
  float _4943;
  float _4947;
  float _4948;
  float _4949;
  float _4952;
  half _4959;
  half _4960;
  half _4961;
  bool _4981;
  half _4982;
  float _4983;
  float _4984;
  float _4985;
  float _4993;
  float _4999;
  float _5006;
  float _5007;
  float _5008;
  float _5009;
  float _5010;
  float _5011;
  float2 _5020;
  float _5029;
  float _5030;
  float _5031;
  float _5033;
  float _5040;
  float _5041;
  float _5042;
  float _5059;
  float _5060;
  float _5061;
  float _5062;
  float _5073;
  half _5083;
  half _5084;
  half _5085;
  float _5087;
  float _5088;
  float _5089;
  float _5093;
  float _5101;
  float _5123;
  float _5125;
  float _5135;
  float _5136;
  float _5137;
  float _5166;
  float _5167;
  float _5168;
  float _5169;
  float _5182;
  float _5183;
  float _5184;
  float _5196;
  float _5197;
  float _5198;
  float _5220;
  float _5221;
  float _5222;
  float _5227;
  float _5290;
  float _5294;
  float _5308;
  float _5309;
  float _5310;
  float4 _5313;
  float _5332;
  float _5333;
  float _5337;
  int _56[4];
  _70 = (uint)(SV_GroupID.x) & 15;
  _71 = (uint)(_70) >> 2;
  _79 = asint(__3__35__0__0__TileConstantBuffer_raw[((int)((uint)(SV_GroupID.x) >> 6))]);
  _56[0] = (int)(_79.x);
  _56[1] = (int)(_79.y);
  _56[2] = (int)(_79.z);
  _56[3] = (int)(_79.w);
  _89 = _56[(((uint)(SV_GroupID.x) >> 4) & 3)];
  _95 = (((int)(((uint)(_89 << 5)) & 2097120)) + SV_GroupThreadID.x) + ((int)((_70 - (_71 << 2)) << 3));
  _97 = (((int)(_71 << 3)) + SV_GroupThreadID.y) + ((int)(((uint)(_89) >> 16) << 5));
  _98 = float((uint)_95);
  _99 = float((uint)_97);
  _100 = _98 + 0.5f;
  _101 = _99 + 0.5f;
  _105 = _bufferSizeAndInvSize.z * _100;
  _106 = _101 * _bufferSizeAndInvSize.w;
  _108 = __3__36__0__0__g_depth.Load(int3(_95, _97, 0));
  _111 = __3__36__0__0__g_stencil.Load(int3(_95, _97, 0));
  _113 = _111.x & 127;
  _116 = max(1.0000000116860974e-07f, _108.x);
  _117 = _nearFarProj.x / _116;
  if (!(((bool)((bool)(_108.x < 1.0000000116860974e-07f) || (bool)(_108.x == 1.0f))) || (bool)(_113 == 10))) {
    _125 = __3__36__0__0__g_baseColor.Load(int3(_95, _97, 0));
    _131 = __3__36__0__0__g_normal.Load(int3(_95, _97, 0));
    _140 = half(float((uint)((int)(((uint)((int)(_125.x)) >> 8) & 255))) * 0.003921568859368563f);
    _144 = half(float((uint)((int)(_125.x & 255))) * 0.003921568859368563f);
    _149 = half(float((uint)((int)(((uint)((int)(_125.y)) >> 8) & 255))) * 0.003921568859368563f);
    _153 = half(float((uint)((int)(_125.y & 255))) * 0.003921568859368563f);
    _158 = half(float((uint)((int)(((uint)((int)(_125.z)) >> 8) & 255))) * 0.003921568859368563f);
    _162 = half(float((uint)((int)(_125.z & 255))) * 0.003921568859368563f);
    _174 = uint((_131.w * 3.0f) + 0.5f);
    _175 = (_174 == 1);
    _176 = (_174 == 3);
    _186 = (saturate(_131.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    _187 = (saturate(_131.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    _188 = (saturate(_131.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    _190 = rsqrt(dot(float3(_186, _187, _188), float3(_186, _187, _188)));
    _194 = half(_190 * _186);
    _195 = half(_190 * _187);
    _196 = half(_188 * _190);
    _199 = ((half)((half)(half(float((uint)((int)(((uint)((int)(_125.w)) >> 8) & 255))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;
    _200 = ((half)((half)(half(float((uint)((int)(_125.w & 255))) * 0.003921568859368563f)) * 2.0h)) + -1.0h;
    _205 = float(_199 + _200) * 0.5f;
    _206 = float(_199 - _200) * 0.5f;
    _210 = (1.0f - abs(_205)) - abs(_206);
    _212 = rsqrt(dot(float3(_205, _206, _210), float3(_205, _206, _210)));
    _219 = float(_194);
    _220 = float(_195);
    _221 = float(_196);
    _223 = select((_196 >= 0.0h), 1.0f, -1.0f);
    _226 = -0.0f - (1.0f / (_223 + _221));
    _227 = _220 * _226;
    _228 = _227 * _219;
    _229 = _223 * _219;
    _235 = -0.0f - _220;
    _236 = float(half(_212 * _205));
    _237 = float(half(_212 * _206));
    _238 = float(half(_212 * _210));
    _250 = half(mad(_238, _219, mad(_237, _228, (_236 * (((_229 * _219) * _226) + 1.0f)))));
    _251 = half(mad(_238, _220, mad(_237, ((_227 * _220) + _223), ((_236 * _223) * _228))));
    _252 = half(mad(_238, _221, mad(_237, _235, (-0.0f - (_229 * _236)))));
    _254 = rsqrt((half)(dot(half3(_250, _251, _252), half3(_250, _251, _252))));
    _258 = saturate((half)(_140 * _140));
    _259 = saturate((half)(_144 * _144));
    _260 = saturate((half)(_149 * _149));
    _276 = saturate((half)(((half)(((half)(_259 * 0.3395996h)) + ((half)(_258 * 0.61328125h)))) + ((half)(_260 * 0.04736328h))));
    _277 = saturate((half)(((half)(((half)(_259 * 0.9165039h)) + ((half)(_258 * 0.07019043h)))) + ((half)(_260 * 0.013450623h))));
    _278 = saturate((half)(((half)(((half)(_259 * 0.109558105h)) + ((half)(_258 * 0.020614624h)))) + ((half)(_260 * 0.8696289h))));
    if (!((uint)(_113 + -65) < (uint)2)) {
      _290 = ((half)(_254 * _250));
      _291 = ((half)(_254 * _251));
      _292 = ((half)(_254 * _252));
      _293 = (half)(select(((bool)(_113 == 24) || (bool)(_113 == 29)), 0.0f, _153));
    } else {
      _290 = _194;
      _291 = _195;
      _292 = _196;
      _293 = _153;
    }
    half4 _295 = __3__36__0__0__g_diffuseResult.Load(int3(_95, _97, 0));
    _299 = float(_295.x);
    _300 = float(_295.y);
    _301 = float(_295.z);
    _304 = (_renderParams2.y > 0.0f);
    [branch]
    if (_304) {
      half4 _307 = __3__36__0__0__g_sceneDiffuse.Load(int3(_95, _97, 0));
      _318 = (float(_307.x) + _299);
      _319 = (float(_307.y) + _300);
      _320 = (float(_307.z) + _301);
    } else {
      _318 = _299;
      _319 = _300;
      _320 = _301;
    }
    _322 = __3__36__0__0__g_specularResult.Load(int3(_95, _97, 0));
    if ((uint)_113 > (uint)11) {
      if (!((bool)((uint)_113 < (uint)21) || (bool)(_113 == 107))) {
        _336 = (_113 == 7);
      } else {
        _336 = true;
      }
    } else {
      if (!(_113 == 6)) {
        _336 = (_113 == 7);
      } else {
        _336 = true;
      }
    }
    _346 = (bool)(_113 == 38) || ((bool)((bool)((uint)(_113 + -27) < (uint)2) || ((bool)((bool)(_113 == 26) || ((bool)((bool)((uint)(_113 + -105) < (uint)2) || _176))))));
    _347 = float(_290);
    _348 = float(_291);
    _349 = float(_292);
    _351 = (_105 * 2.0f) + -1.0f;
    _353 = 1.0f - (_106 * 2.0f);
    _389 = mad((_invViewProjRelative[2].w), _116, mad((_invViewProjRelative[1].w), _353, ((_invViewProjRelative[0].w) * _351))) + (_invViewProjRelative[3].w);
    _390 = (mad((_invViewProjRelative[2].x), _116, mad((_invViewProjRelative[1].x), _353, ((_invViewProjRelative[0].x) * _351))) + (_invViewProjRelative[3].x)) / _389;
    _391 = (mad((_invViewProjRelative[2].y), _116, mad((_invViewProjRelative[1].y), _353, ((_invViewProjRelative[0].y) * _351))) + (_invViewProjRelative[3].y)) / _389;
    _392 = (mad((_invViewProjRelative[2].z), _116, mad((_invViewProjRelative[1].z), _353, ((_invViewProjRelative[0].z) * _351))) + (_invViewProjRelative[3].z)) / _389;
    _394 = rsqrt(dot(float3(_390, _391, _392), float3(_390, _391, _392)));
    _395 = _394 * _390;
    _396 = _394 * _391;
    _397 = _394 * _392;
    _398 = _111.x & 126;
    _401 = (bool)(_398 == 66) || (bool)(_113 == 54);
    _402 = (_113 == 33);
    _404 = (_113 == 55);
    if ((bool)(_398 == 64) || ((bool)(((bool)(_402 || _401)) || ((bool)(_404 || _346))))) {
      _411 = __3__36__0__0__g_character.Load(int3(_95, _97, 0));
      _417 = _411.x;
      _418 = _411.y;
      _419 = _411.z;
      _420 = _411.w;
    } else {
      _417 = 0.0f;
      _418 = 0.0f;
      _419 = 0.0f;
      _420 = 0.0f;
    }
    if (_402) {
      _429 = uint((asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[0u].x) * _417) + 0.5f);
      if ((bool)(_419 > 0.0f) && (bool)((uint)_429 < (uint)(uint)(uint(asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[0u].x))))) {
        _436 = asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((uint)(_429 + 1u))]);
        _443 = _419;
        _444 = min((1.0f - _436.y), _436.x);
        _445 = saturate(_418);
        _446 = _436.y;
        _447 = _436.x;
      } else {
        _443 = 0.0f;
        _444 = 0.0f;
        _445 = 0.0f;
        _446 = 0.0f;
        _447 = 0.0f;
      }
      _453 = _113;
      _454 = (half)(half(_effectiveMetallicForVelvet * _447));
      _455 = _443;
      _456 = _444;
      _457 = _445;
      _458 = _446;
      _459 = _447;
    } else {
      if (_404) {
        if (!(_419 < 0.0010000000474974513f)) {
          _429 = uint((asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[0u].x) * _417) + 0.5f);
          if ((bool)(_419 > 0.0f) && (bool)((uint)_429 < (uint)(uint)(uint(asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[0u].x))))) {
            _436 = asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((uint)(_429 + 1u))]);
            _443 = _419;
            _444 = min((1.0f - _436.y), _436.x);
            _445 = saturate(_418);
            _446 = _436.y;
            _447 = _436.x;
          } else {
            _443 = 0.0f;
            _444 = 0.0f;
            _445 = 0.0f;
            _446 = 0.0f;
            _447 = 0.0f;
          }
          _453 = _113;
          _454 = (half)(half(_effectiveMetallicForVelvet * _447));
          _455 = _443;
          _456 = _444;
          _457 = _445;
          _458 = _446;
          _459 = _447;
        } else {
          _453 = 53;
          _454 = _293;
          _455 = 0.0f;
          _456 = 0.0f;
          _457 = 0.0f;
          _458 = 0.0f;
          _459 = 0.0f;
        }
      } else {
        _453 = _113;
        _454 = _293;
        _455 = 0.0f;
        _456 = 0.0f;
        _457 = 0.0f;
        _458 = 0.0f;
        _459 = 0.0f;
      }
    }
    if (_453 == 66) {
      _491 = float(_454);
      _495 = (_417 * 2.0f) + -1.0f;
      _496 = (_418 * 2.0f) + -1.0f;
      _497 = (_419 * 2.0f) + -1.0f;
      _499 = rsqrt(dot(float3(_495, _496, _497), float3(_495, _496, _497)));
      _504 = _491;
      _505 = (_499 * _495);
      _506 = (_499 * _496);
      _507 = (_499 * _497);
      _508 = 0.0h;
      _511 = (_453 == 54);
      if (_511 || (bool)((_453 & 126) == 66)) {
        _515 = __3__36__0__0__g_bentCone.Load(int3(_95, _97, 0));
        _522 = (_515.x * 2.0f) + -1.0f;
        _523 = (_515.y * 2.0f) + -1.0f;
        _524 = (_515.z * 2.0f) + -1.0f;
        _526 = rsqrt(dot(float3(_522, _523, _524), float3(_522, _523, _524)));
        _527 = _522 * _526;
        _528 = _523 * _526;
        _529 = _524 * _526;
        if (!((bool)(_renderParams.z > 0.0f) || _304)) {
          _538 = (half)(saturate((half)(_158 + 0.15002441h)));
        } else {
          _538 = _158;
        }
        _539 = float(_538);
        if (_511) {
          _554 = (((asfloat(_globalLightParams.z) * _539) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_162)));
        } else {
          _554 = _bevelParams.y;
        }
        _555 = float(_276);
        _556 = float(_277);
        _557 = float(_278);
        _558 = dot(float3(_505, _506, _507), float3(_527, _528, _529));
        _559 = -0.0f - _395;
        _560 = -0.0f - _396;
        _561 = -0.0f - _397;
        _562 = dot(float3(_505, _506, _507), float3(_559, _560, _561));
        _568 = cos(abs(asin(_562) - asin(_558)) * 0.5f);
        _572 = _527 - (_558 * _505);
        _573 = _528 - (_558 * _506);
        _574 = _529 - (_558 * _507);
        _578 = _559 - (_562 * _505);
        _579 = _560 - (_562 * _506);
        _580 = _561 - (_562 * _507);
        _587 = rsqrt((dot(float3(_578, _579, _580), float3(_578, _579, _580)) * dot(float3(_572, _573, _574), float3(_572, _573, _574))) + 9.999999747378752e-05f) * dot(float3(_572, _573, _574), float3(_578, _579, _580));
        _597 = min(max(_539, 0.09803921729326248f), 1.0f);
        _598 = _597 * _597;
        _599 = _598 * 0.5f;
        _600 = _598 * 2.0f;
        _601 = _562 + _558;
        _602 = _601 - _554;
        _611 = 1.0f / ((1.190000057220459f / _568) + (_568 * 0.36000001430511475f));
        _616 = ((_611 * (0.6000000238418579f - (_587 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_587 * 0.5f) + 0.5f));
        _622 = 1.0f - (sqrt(saturate(1.0f - (_616 * _616))) * _568);
        _623 = _622 * _622;
        _627 = 0.9534794092178345f - ((_623 * _623) * (_622 * 0.9534794092178345f));
        _628 = _611 * _616;
        _633 = (sqrt(1.0f - (_628 * _628)) * 0.5f) / _568;
        _634 = log2(_555);
        _635 = log2(_556);
        _636 = log2(_557);
        _648 = ((_627 * _627) * (exp2((((_602 * _602) * -0.5f) / (_599 * _599)) * 1.4426950216293335f) / (_598 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_587 * 5.2658371925354f));
        _652 = _601 - (_554 * 4.0f);
        _662 = 1.0f - (_568 * 0.5f);
        _663 = _662 * _662;
        _667 = (_663 * _663) * (0.9534794092178345f - (_568 * 0.47673970460891724f));
        _669 = 0.9534794092178345f - _667;
        _670 = 0.800000011920929f / _568;
        _683 = (((_669 * _669) * (_667 + 0.04652056470513344f)) * (exp2((((_652 * _652) * -0.5f) / (_600 * _600)) * 1.4426950216293335f) / (_598 * 5.013256549835205f))) * exp2((_587 * 24.525815963745117f) + -24.208423614501953f);
        _693 = min(0.0f, (-0.0f - ((_648 * exp2(_634 * _633)) + (_683 * exp2(_670 * _634)))));
        _694 = min(0.0f, (-0.0f - ((_648 * exp2(_635 * _633)) + (_683 * exp2(_670 * _635)))));
        _695 = min(0.0f, (-0.0f - ((_648 * exp2(_636 * _633)) + (_683 * exp2(_670 * _636)))));
        _704 = saturate(abs(dot(float3(_527, _528, _529), float3(_505, _506, _507))));
        _713 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_634 * 1.5f)))), 0.0f);
        _716 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_635 * 1.5f)))), 0.0f);
        _719 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_636 * 1.5f)))), 0.0f);
        _726 = min(0.9900000095367432f, _713.x);
        _727 = min(0.9900000095367432f, _716.x);
        _728 = min(0.9900000095367432f, _719.x);
        _729 = min(0.9900000095367432f, _713.y);
        _730 = min(0.9900000095367432f, _716.y);
        _731 = min(0.9900000095367432f, _719.y);
        _732 = _726 * _726;
        _733 = _727 * _727;
        _734 = _728 * _728;
        _735 = _729 * _729;
        _736 = _730 * _730;
        _737 = _731 * _731;
        _738 = _735 * _729;
        _739 = _736 * _730;
        _740 = _737 * _731;
        _741 = 1.0f - _732;
        _742 = 1.0f - _733;
        _743 = 1.0f - _734;
        _753 = _741 * _741;
        _754 = _742 * _742;
        _755 = _743 * _743;
        _756 = _753 * _741;
        _757 = _754 * _742;
        _758 = _755 * _743;
        _766 = min(max(_539, 0.18000000715255737f), 0.6000000238418579f);
        _767 = _766 * _766;
        _768 = _767 * 0.25f;
        _769 = _767 * 4.0f;
        _771 = (_727 + _726) + _728;
        _772 = _726 / _771;
        _773 = _727 / _771;
        _774 = _728 / _771;
        _775 = dot(float3(_767, _768, _769), float3(_772, _773, _774));
        _776 = _775 * _775;
        _779 = asin(min(max(_562, -1.0f), 1.0f)) + asin(min(max(_558, -1.0f), 1.0f));
        _780 = _779 * 0.5f;
        _781 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_772, _773, _774));
        _791 = _781 * _781;
        _814 = (_730 + _729) + _731;
        _818 = dot(float3(_767, _768, _769), float3((_729 / _814), (_730 / _814), (_731 / _814)));
        _822 = sqrt((_818 * _818) + (_776 * 2.0f));
        _840 = (_818 * 3.0f) + (_775 * 2.0f);
        _847 = (((_738 + _729) * ((_732 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _738) + _729);
        _848 = (((_739 + _730) * ((_733 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _739) + _730);
        _849 = (((_740 + _731) * ((_734 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _740) + _731);
        _858 = _780 - (((_791 * (((_732 * 4.0f) * _735) + (_753 * 2.0f))) * (1.0f - ((_735 * 2.0f) / _753))) / _756);
        _865 = _780 - (((_791 * (((_733 * 4.0f) * _736) + (_754 * 2.0f))) * (1.0f - ((_736 * 2.0f) / _754))) / _757);
        _872 = _780 - (((_791 * (((_734 * 4.0f) * _737) + (_755 * 2.0f))) * (1.0f - ((_737 * 2.0f) / _755))) / _758);
        _900 = exp2((((_779 * -0.25f) * _780) / _776) * 1.4426950216293335f) * 1.399999976158142f;
        _901 = ((((((_738 * _732) / _756) + ((_729 * _732) / _741)) * 4.398229598999023f) * exp2((((_858 * _858) * -0.5f) / ((_847 * _847) + _776)) * 1.4426950216293335f)) + ((((_713.x + _693) * 0.25f) - _693) * 6.2831854820251465f)) * _900;
        _902 = ((((((_739 * _733) / _757) + ((_730 * _733) / _742)) * 4.398229598999023f) * exp2((((_865 * _865) * -0.5f) / ((_848 * _848) + _776)) * 1.4426950216293335f)) + ((((_716.x + _694) * 0.25f) - _694) * 6.2831854820251465f)) * _900;
        _903 = ((((((_740 * _734) / _758) + ((_731 * _734) / _743)) * 4.398229598999023f) * exp2((((_872 * _872) * -0.5f) / ((_849 * _849) + _776)) * 1.4426950216293335f)) + ((((_719.x + _695) * 0.25f) - _695) * 6.2831854820251465f)) * _900;
        _904 = max(0.125f, _504);
        _918 = _508;
        _919 = _505;
        _920 = _506;
        _921 = _507;
        _922 = _504;
        _923 = _453;
        _924 = max(0.009999999776482582f, ((_904 * (_555 - _901)) + _901));
        _925 = max(0.009999999776482582f, (lerp(_902, _556, _904)));
        _926 = max(0.009999999776482582f, (lerp(_903, _557, _904)));
      } else {
        _918 = _508;
        _919 = _505;
        _920 = _506;
        _921 = _507;
        _922 = _504;
        _923 = _453;
        _924 = 0.0f;
        _925 = 0.0f;
        _926 = 0.0f;
      }
    } else {
      _463 = (_453 == 54);
      if ((bool)(_453 == 67) || _463) {
        _470 = float((uint)((int)(((uint)(_frameNumber.x * 73)) & 127)));
        if (!(float(_454) > (frac(frac(dot(float2(((_470 * 32.665000915527344f) + _98), ((_470 * 11.8149995803833f) + _99)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) * 0.20000000298023224f))) {
          bool __branch_chain_484;
          if ((_453 & 126) == 66) {
            _491 = 1.0f;
            __branch_chain_484 = true;
          } else {
            _488 = 1.0f;
            _489 = 0.0h;
            if (_463) {
              _491 = _488;
              __branch_chain_484 = true;
            } else {
              _504 = _488;
              _505 = _347;
              _506 = _348;
              _507 = _349;
              _508 = _489;
              __branch_chain_484 = false;
            }
          }
          if (__branch_chain_484) {
            _495 = (_417 * 2.0f) + -1.0f;
            _496 = (_418 * 2.0f) + -1.0f;
            _497 = (_419 * 2.0f) + -1.0f;
            _499 = rsqrt(dot(float3(_495, _496, _497), float3(_495, _496, _497)));
            _504 = _491;
            _505 = (_499 * _495);
            _506 = (_499 * _496);
            _507 = (_499 * _497);
            _508 = 0.0h;
          }
          _511 = (_453 == 54);
          if (_511 || (bool)((_453 & 126) == 66)) {
            _515 = __3__36__0__0__g_bentCone.Load(int3(_95, _97, 0));
            _522 = (_515.x * 2.0f) + -1.0f;
            _523 = (_515.y * 2.0f) + -1.0f;
            _524 = (_515.z * 2.0f) + -1.0f;
            _526 = rsqrt(dot(float3(_522, _523, _524), float3(_522, _523, _524)));
            _527 = _522 * _526;
            _528 = _523 * _526;
            _529 = _524 * _526;
            if (!((bool)(_renderParams.z > 0.0f) || _304)) {
              _538 = (half)(saturate((half)(_158 + 0.15002441h)));
            } else {
              _538 = _158;
            }
            _539 = float(_538);
            if (_511) {
              _554 = (((asfloat(_globalLightParams.z) * _539) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_162)));
            } else {
              _554 = _bevelParams.y;
            }
            _555 = float(_276);
            _556 = float(_277);
            _557 = float(_278);
            _558 = dot(float3(_505, _506, _507), float3(_527, _528, _529));
            _559 = -0.0f - _395;
            _560 = -0.0f - _396;
            _561 = -0.0f - _397;
            _562 = dot(float3(_505, _506, _507), float3(_559, _560, _561));
            _568 = cos(abs(asin(_562) - asin(_558)) * 0.5f);
            _572 = _527 - (_558 * _505);
            _573 = _528 - (_558 * _506);
            _574 = _529 - (_558 * _507);
            _578 = _559 - (_562 * _505);
            _579 = _560 - (_562 * _506);
            _580 = _561 - (_562 * _507);
            _587 = rsqrt((dot(float3(_578, _579, _580), float3(_578, _579, _580)) * dot(float3(_572, _573, _574), float3(_572, _573, _574))) + 9.999999747378752e-05f) * dot(float3(_572, _573, _574), float3(_578, _579, _580));
            _597 = min(max(_539, 0.09803921729326248f), 1.0f);
            _598 = _597 * _597;
            _599 = _598 * 0.5f;
            _600 = _598 * 2.0f;
            _601 = _562 + _558;
            _602 = _601 - _554;
            _611 = 1.0f / ((1.190000057220459f / _568) + (_568 * 0.36000001430511475f));
            _616 = ((_611 * (0.6000000238418579f - (_587 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_587 * 0.5f) + 0.5f));
            _622 = 1.0f - (sqrt(saturate(1.0f - (_616 * _616))) * _568);
            _623 = _622 * _622;
            _627 = 0.9534794092178345f - ((_623 * _623) * (_622 * 0.9534794092178345f));
            _628 = _611 * _616;
            _633 = (sqrt(1.0f - (_628 * _628)) * 0.5f) / _568;
            _634 = log2(_555);
            _635 = log2(_556);
            _636 = log2(_557);
            _648 = ((_627 * _627) * (exp2((((_602 * _602) * -0.5f) / (_599 * _599)) * 1.4426950216293335f) / (_598 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_587 * 5.2658371925354f));
            _652 = _601 - (_554 * 4.0f);
            _662 = 1.0f - (_568 * 0.5f);
            _663 = _662 * _662;
            _667 = (_663 * _663) * (0.9534794092178345f - (_568 * 0.47673970460891724f));
            _669 = 0.9534794092178345f - _667;
            _670 = 0.800000011920929f / _568;
            _683 = (((_669 * _669) * (_667 + 0.04652056470513344f)) * (exp2((((_652 * _652) * -0.5f) / (_600 * _600)) * 1.4426950216293335f) / (_598 * 5.013256549835205f))) * exp2((_587 * 24.525815963745117f) + -24.208423614501953f);
            _693 = min(0.0f, (-0.0f - ((_648 * exp2(_634 * _633)) + (_683 * exp2(_670 * _634)))));
            _694 = min(0.0f, (-0.0f - ((_648 * exp2(_635 * _633)) + (_683 * exp2(_670 * _635)))));
            _695 = min(0.0f, (-0.0f - ((_648 * exp2(_636 * _633)) + (_683 * exp2(_670 * _636)))));
            _704 = saturate(abs(dot(float3(_527, _528, _529), float3(_505, _506, _507))));
            _713 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_634 * 1.5f)))), 0.0f);
            _716 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_635 * 1.5f)))), 0.0f);
            _719 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_636 * 1.5f)))), 0.0f);
            _726 = min(0.9900000095367432f, _713.x);
            _727 = min(0.9900000095367432f, _716.x);
            _728 = min(0.9900000095367432f, _719.x);
            _729 = min(0.9900000095367432f, _713.y);
            _730 = min(0.9900000095367432f, _716.y);
            _731 = min(0.9900000095367432f, _719.y);
            _732 = _726 * _726;
            _733 = _727 * _727;
            _734 = _728 * _728;
            _735 = _729 * _729;
            _736 = _730 * _730;
            _737 = _731 * _731;
            _738 = _735 * _729;
            _739 = _736 * _730;
            _740 = _737 * _731;
            _741 = 1.0f - _732;
            _742 = 1.0f - _733;
            _743 = 1.0f - _734;
            _753 = _741 * _741;
            _754 = _742 * _742;
            _755 = _743 * _743;
            _756 = _753 * _741;
            _757 = _754 * _742;
            _758 = _755 * _743;
            _766 = min(max(_539, 0.18000000715255737f), 0.6000000238418579f);
            _767 = _766 * _766;
            _768 = _767 * 0.25f;
            _769 = _767 * 4.0f;
            _771 = (_727 + _726) + _728;
            _772 = _726 / _771;
            _773 = _727 / _771;
            _774 = _728 / _771;
            _775 = dot(float3(_767, _768, _769), float3(_772, _773, _774));
            _776 = _775 * _775;
            _779 = asin(min(max(_562, -1.0f), 1.0f)) + asin(min(max(_558, -1.0f), 1.0f));
            _780 = _779 * 0.5f;
            _781 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_772, _773, _774));
            _791 = _781 * _781;
            _814 = (_730 + _729) + _731;
            _818 = dot(float3(_767, _768, _769), float3((_729 / _814), (_730 / _814), (_731 / _814)));
            _822 = sqrt((_818 * _818) + (_776 * 2.0f));
            _840 = (_818 * 3.0f) + (_775 * 2.0f);
            _847 = (((_738 + _729) * ((_732 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _738) + _729);
            _848 = (((_739 + _730) * ((_733 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _739) + _730);
            _849 = (((_740 + _731) * ((_734 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _740) + _731);
            _858 = _780 - (((_791 * (((_732 * 4.0f) * _735) + (_753 * 2.0f))) * (1.0f - ((_735 * 2.0f) / _753))) / _756);
            _865 = _780 - (((_791 * (((_733 * 4.0f) * _736) + (_754 * 2.0f))) * (1.0f - ((_736 * 2.0f) / _754))) / _757);
            _872 = _780 - (((_791 * (((_734 * 4.0f) * _737) + (_755 * 2.0f))) * (1.0f - ((_737 * 2.0f) / _755))) / _758);
            _900 = exp2((((_779 * -0.25f) * _780) / _776) * 1.4426950216293335f) * 1.399999976158142f;
            _901 = ((((((_738 * _732) / _756) + ((_729 * _732) / _741)) * 4.398229598999023f) * exp2((((_858 * _858) * -0.5f) / ((_847 * _847) + _776)) * 1.4426950216293335f)) + ((((_713.x + _693) * 0.25f) - _693) * 6.2831854820251465f)) * _900;
            _902 = ((((((_739 * _733) / _757) + ((_730 * _733) / _742)) * 4.398229598999023f) * exp2((((_865 * _865) * -0.5f) / ((_848 * _848) + _776)) * 1.4426950216293335f)) + ((((_716.x + _694) * 0.25f) - _694) * 6.2831854820251465f)) * _900;
            _903 = ((((((_740 * _734) / _758) + ((_731 * _734) / _743)) * 4.398229598999023f) * exp2((((_872 * _872) * -0.5f) / ((_849 * _849) + _776)) * 1.4426950216293335f)) + ((((_719.x + _695) * 0.25f) - _695) * 6.2831854820251465f)) * _900;
            _904 = max(0.125f, _504);
            _918 = _508;
            _919 = _505;
            _920 = _506;
            _921 = _507;
            _922 = _504;
            _923 = _453;
            _924 = max(0.009999999776482582f, ((_904 * (_555 - _901)) + _901));
            _925 = max(0.009999999776482582f, (lerp(_902, _556, _904)));
            _926 = max(0.009999999776482582f, (lerp(_903, _557, _904)));
          } else {
            _918 = _508;
            _919 = _505;
            _920 = _506;
            _921 = _507;
            _922 = _504;
            _923 = _453;
            _924 = 0.0f;
            _925 = 0.0f;
            _926 = 0.0f;
          }
        } else {
          _918 = 0.0h;
          _919 = _347;
          _920 = _348;
          _921 = _349;
          _922 = 1.0f;
          _923 = 53;
          _924 = 0.0f;
          _925 = 0.0f;
          _926 = 0.0f;
        }
      } else {
        _488 = 0.0f;
        _489 = _454;
        if (_463) {
          _491 = _488;
          _495 = (_417 * 2.0f) + -1.0f;
          _496 = (_418 * 2.0f) + -1.0f;
          _497 = (_419 * 2.0f) + -1.0f;
          _499 = rsqrt(dot(float3(_495, _496, _497), float3(_495, _496, _497)));
          _504 = _491;
          _505 = (_499 * _495);
          _506 = (_499 * _496);
          _507 = (_499 * _497);
          _508 = 0.0h;
        } else {
          _504 = _488;
          _505 = _347;
          _506 = _348;
          _507 = _349;
          _508 = _489;
        }
        _511 = (_453 == 54);
        if (_511 || (bool)((_453 & 126) == 66)) {
          _515 = __3__36__0__0__g_bentCone.Load(int3(_95, _97, 0));
          _522 = (_515.x * 2.0f) + -1.0f;
          _523 = (_515.y * 2.0f) + -1.0f;
          _524 = (_515.z * 2.0f) + -1.0f;
          _526 = rsqrt(dot(float3(_522, _523, _524), float3(_522, _523, _524)));
          _527 = _522 * _526;
          _528 = _523 * _526;
          _529 = _524 * _526;
          if (!((bool)(_renderParams.z > 0.0f) || _304)) {
            _538 = (half)(saturate((half)(_158 + 0.15002441h)));
          } else {
            _538 = _158;
          }
          _539 = float(_538);
          if (_511) {
            _554 = (((asfloat(_globalLightParams.z) * _539) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_162)));
          } else {
            _554 = _bevelParams.y;
          }
          _555 = float(_276);
          _556 = float(_277);
          _557 = float(_278);
          _558 = dot(float3(_505, _506, _507), float3(_527, _528, _529));
          _559 = -0.0f - _395;
          _560 = -0.0f - _396;
          _561 = -0.0f - _397;
          _562 = dot(float3(_505, _506, _507), float3(_559, _560, _561));
          _568 = cos(abs(asin(_562) - asin(_558)) * 0.5f);
          _572 = _527 - (_558 * _505);
          _573 = _528 - (_558 * _506);
          _574 = _529 - (_558 * _507);
          _578 = _559 - (_562 * _505);
          _579 = _560 - (_562 * _506);
          _580 = _561 - (_562 * _507);
          _587 = rsqrt((dot(float3(_578, _579, _580), float3(_578, _579, _580)) * dot(float3(_572, _573, _574), float3(_572, _573, _574))) + 9.999999747378752e-05f) * dot(float3(_572, _573, _574), float3(_578, _579, _580));
          _597 = min(max(_539, 0.09803921729326248f), 1.0f);
          _598 = _597 * _597;
          _599 = _598 * 0.5f;
          _600 = _598 * 2.0f;
          _601 = _562 + _558;
          _602 = _601 - _554;
          _611 = 1.0f / ((1.190000057220459f / _568) + (_568 * 0.36000001430511475f));
          _616 = ((_611 * (0.6000000238418579f - (_587 * 0.800000011920929f))) + 1.0f) * sqrt(saturate((_587 * 0.5f) + 0.5f));
          _622 = 1.0f - (sqrt(saturate(1.0f - (_616 * _616))) * _568);
          _623 = _622 * _622;
          _627 = 0.9534794092178345f - ((_623 * _623) * (_622 * 0.9534794092178345f));
          _628 = _611 * _616;
          _633 = (sqrt(1.0f - (_628 * _628)) * 0.5f) / _568;
          _634 = log2(_555);
          _635 = log2(_556);
          _636 = log2(_557);
          _648 = ((_627 * _627) * (exp2((((_602 * _602) * -0.5f) / (_599 * _599)) * 1.4426950216293335f) / (_598 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_587 * 5.2658371925354f));
          _652 = _601 - (_554 * 4.0f);
          _662 = 1.0f - (_568 * 0.5f);
          _663 = _662 * _662;
          _667 = (_663 * _663) * (0.9534794092178345f - (_568 * 0.47673970460891724f));
          _669 = 0.9534794092178345f - _667;
          _670 = 0.800000011920929f / _568;
          _683 = (((_669 * _669) * (_667 + 0.04652056470513344f)) * (exp2((((_652 * _652) * -0.5f) / (_600 * _600)) * 1.4426950216293335f) / (_598 * 5.013256549835205f))) * exp2((_587 * 24.525815963745117f) + -24.208423614501953f);
          _693 = min(0.0f, (-0.0f - ((_648 * exp2(_634 * _633)) + (_683 * exp2(_670 * _634)))));
          _694 = min(0.0f, (-0.0f - ((_648 * exp2(_635 * _633)) + (_683 * exp2(_670 * _635)))));
          _695 = min(0.0f, (-0.0f - ((_648 * exp2(_636 * _633)) + (_683 * exp2(_670 * _636)))));
          _704 = saturate(abs(dot(float3(_527, _528, _529), float3(_505, _506, _507))));
          _713 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_634 * 1.5f)))), 0.0f);
          _716 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_635 * 1.5f)))), 0.0f);
          _719 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_704, _539, saturate(sqrt(exp2(_636 * 1.5f)))), 0.0f);
          _726 = min(0.9900000095367432f, _713.x);
          _727 = min(0.9900000095367432f, _716.x);
          _728 = min(0.9900000095367432f, _719.x);
          _729 = min(0.9900000095367432f, _713.y);
          _730 = min(0.9900000095367432f, _716.y);
          _731 = min(0.9900000095367432f, _719.y);
          _732 = _726 * _726;
          _733 = _727 * _727;
          _734 = _728 * _728;
          _735 = _729 * _729;
          _736 = _730 * _730;
          _737 = _731 * _731;
          _738 = _735 * _729;
          _739 = _736 * _730;
          _740 = _737 * _731;
          _741 = 1.0f - _732;
          _742 = 1.0f - _733;
          _743 = 1.0f - _734;
          _753 = _741 * _741;
          _754 = _742 * _742;
          _755 = _743 * _743;
          _756 = _753 * _741;
          _757 = _754 * _742;
          _758 = _755 * _743;
          _766 = min(max(_539, 0.18000000715255737f), 0.6000000238418579f);
          _767 = _766 * _766;
          _768 = _767 * 0.25f;
          _769 = _767 * 4.0f;
          _771 = (_727 + _726) + _728;
          _772 = _726 / _771;
          _773 = _727 / _771;
          _774 = _728 / _771;
          _775 = dot(float3(_767, _768, _769), float3(_772, _773, _774));
          _776 = _775 * _775;
          _779 = asin(min(max(_562, -1.0f), 1.0f)) + asin(min(max(_558, -1.0f), 1.0f));
          _780 = _779 * 0.5f;
          _781 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_772, _773, _774));
          _791 = _781 * _781;
          _814 = (_730 + _729) + _731;
          _818 = dot(float3(_767, _768, _769), float3((_729 / _814), (_730 / _814), (_731 / _814)));
          _822 = sqrt((_818 * _818) + (_776 * 2.0f));
          _840 = (_818 * 3.0f) + (_775 * 2.0f);
          _847 = (((_738 + _729) * ((_732 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _738) + _729);
          _848 = (((_739 + _730) * ((_733 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _739) + _730);
          _849 = (((_740 + _731) * ((_734 * 0.699999988079071f) + 1.0f)) * _822) / ((_840 * _740) + _731);
          _858 = _780 - (((_791 * (((_732 * 4.0f) * _735) + (_753 * 2.0f))) * (1.0f - ((_735 * 2.0f) / _753))) / _756);
          _865 = _780 - (((_791 * (((_733 * 4.0f) * _736) + (_754 * 2.0f))) * (1.0f - ((_736 * 2.0f) / _754))) / _757);
          _872 = _780 - (((_791 * (((_734 * 4.0f) * _737) + (_755 * 2.0f))) * (1.0f - ((_737 * 2.0f) / _755))) / _758);
          _900 = exp2((((_779 * -0.25f) * _780) / _776) * 1.4426950216293335f) * 1.399999976158142f;
          _901 = ((((((_738 * _732) / _756) + ((_729 * _732) / _741)) * 4.398229598999023f) * exp2((((_858 * _858) * -0.5f) / ((_847 * _847) + _776)) * 1.4426950216293335f)) + ((((_713.x + _693) * 0.25f) - _693) * 6.2831854820251465f)) * _900;
          _902 = ((((((_739 * _733) / _757) + ((_730 * _733) / _742)) * 4.398229598999023f) * exp2((((_865 * _865) * -0.5f) / ((_848 * _848) + _776)) * 1.4426950216293335f)) + ((((_716.x + _694) * 0.25f) - _694) * 6.2831854820251465f)) * _900;
          _903 = ((((((_740 * _734) / _758) + ((_731 * _734) / _743)) * 4.398229598999023f) * exp2((((_872 * _872) * -0.5f) / ((_849 * _849) + _776)) * 1.4426950216293335f)) + ((((_719.x + _695) * 0.25f) - _695) * 6.2831854820251465f)) * _900;
          _904 = max(0.125f, _504);
          _918 = _508;
          _919 = _505;
          _920 = _506;
          _921 = _507;
          _922 = _504;
          _923 = _453;
          _924 = max(0.009999999776482582f, ((_904 * (_555 - _901)) + _901));
          _925 = max(0.009999999776482582f, (lerp(_902, _556, _904)));
          _926 = max(0.009999999776482582f, (lerp(_903, _557, _904)));
        } else {
          _918 = _508;
          _919 = _505;
          _920 = _506;
          _921 = _507;
          _922 = _504;
          _923 = _453;
          _924 = 0.0f;
          _925 = 0.0f;
          _926 = 0.0f;
        }
      }
    }
    _933 = -0.0f - min(0.0f, (-0.0f - _318));
    _934 = -0.0f - min(0.0f, (-0.0f - _319));
    _935 = -0.0f - min(0.0f, (-0.0f - _320));
    half2 _937 = __3__36__0__0__g_sceneAO.Load(int3(_95, _97, 0));
    if ((uint)_923 > (uint)11) {
      _945 = ((uint)_923 < (uint)19);
      if (!((uint)_923 < (uint)20)) {
        _948 = _945;
        _951 = _948;
        _952 = (_923 == 107);
      } else {
        _951 = _945;
        _952 = true;
      }
    } else {
      if (!((uint)_923 > (uint)10)) {
        _948 = false;
        _951 = _948;
        _952 = (_923 == 107);
      } else {
        _951 = false;
        _952 = true;
      }
    }
    _957 = (_923 == 65);
    _958 = _957 || ((bool)(_951 || ((bool)((bool)(_923 == 96) || _952))));
    _960 = select(_958, float(_918), 0.0f);
    _963 = ((uint)(_923 & 24) > (uint)23);
    if (_963) {
      _965 = (_923 == 29);
      if (_965) {
        _970 = float(saturate(_158));
      } else {
        _970 = 0.0f;
      }
      _972 = uint((half)(_162 * 255.0h));
      if (_175) {
        _981 = select(((_972 & 128) != 0), 1.0f, 0.0f);
        _982 = (float((uint)((int)(_972 & 127))) * 0.007874015718698502f);
      } else {
        _981 = 0.0f;
        _982 = 0.0f;
      }
      _983 = half(_982);
      _987 = (_983 > 0.99902344h);
      _992 = _981;
      _993 = _970;
      _994 = _983;
      _995 = (half)(select(((bool)(_923 == 24) || _965), 0.010002136f, _158));
      _996 = (half)(select(_987, 1.0f, _276));
      _997 = (half)(select(_987, 1.0f, _277));
      _998 = (half)(select(_987, 1.0f, _278));
    } else {
      _992 = 0.0f;
      _993 = 0.0f;
      _994 = (half)(select(_958, 0.0f, _918));
      _995 = _158;
      _996 = _276;
      _997 = _277;
      _998 = _278;
    }
    // RenoDX: Dynamic foliage colour correction
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_113 - 12) < 7u)) {
      float3 _fcBaseColor = float3(float(_996), float(_997), float(_998));
      float3 _fcCorrected = FoliageColorCorrect(_fcBaseColor, _sunDirection.xyz, 1.0f, float3(1.0f, 1.0f, 1.0f));
      _996 = half(_fcCorrected.x);
      _997 = half(_fcCorrected.y);
      _998 = half(_fcCorrected.z);
    }
    // RenoDX: Foliage selective colour
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_113 - 12) < 7u)) {
      float3 _fscColor = FoliageSelectiveColor(float3(float(_996), float(_997), float(_998)));
      _996 = half(_fscColor.x);
      _997 = half(_fscColor.y);
      _998 = half(_fscColor.z);
    }
    _999 = _923 & -2;
    _1000 = (_999 == 66);
    _1001 = (_923 == 54);
    _1002 = _1001 || _1000;
    _1003 = -0.0f - _395;
    _1004 = -0.0f - _396;
    _1005 = -0.0f - _397;
    _1006 = dot(float3(_1003, _1004, _1005), float3(_347, _348, _349));
    if (_1002) {
      _1010 = abs(_1006);
    } else {
      _1010 = _1006;
    }
    _1011 = saturate(_1010);
    _1013 = ((_111.x & 128) == 0);
    if (_1013) {
      if ((uint)_113 > (uint)52) {
        if (!((bool)((_111.x & 125) == 105) || (bool)((uint)_113 < (uint)68))) {
          _1033 = (_113 == 98);
        } else {
          _1033 = true;
        }
      } else {
        if ((uint)_113 > (uint)10) {
          if ((uint)_113 < (uint)20) {
            if (_398 == 14) {
              _1033 = (_113 == 98);
            } else {
              _1033 = true;
            }
          } else {
            if (!((_111.x & 125) == 105)) {
              _1033 = (_113 == 98);
            } else {
              _1033 = true;
            }
          }
        } else {
          _1033 = (_113 == 98);
        }
      }
    } else {
      _1033 = true;
    }
    [branch]
    if (_963) {
      _1036 = __3__36__0__0__g_depthOpaque.Load(int3(_95, _97, 0));
      _1042 = (float((uint)((int)(_1036.x & 16777215))) * 5.960465188081798e-08f);
    } else {
      _1042 = _108.x;
    }
    _1070 = mad((_projToPrevProj[2].w), _1042, mad((_projToPrevProj[1].w), _353, ((_projToPrevProj[0].w) * _351))) + (_projToPrevProj[3].w);
    if (_1033) {
      _1077 = __3__36__0__0__g_velocity.Load(int3(_95, _97, 0));
      _1083 = (_1077.x * 2.0f);
      _1084 = (_1077.y * 2.0f);
    } else {
      _1083 = (((mad((_projToPrevProj[2].x), _1042, mad((_projToPrevProj[1].x), _353, ((_projToPrevProj[0].x) * _351))) + (_projToPrevProj[3].x)) / _1070) - _351);
      _1084 = (((mad((_projToPrevProj[2].y), _1042, mad((_projToPrevProj[1].y), _353, ((_projToPrevProj[0].y) * _351))) + (_projToPrevProj[3].y)) / _1070) - _353);
    }
    _1086 = _nearFarProj.x / max(1.0000000116860974e-07f, _1042);
    _1089 = (_1083 * 0.5f) + _105;
    _1090 = _106 - (_1084 * 0.5f);
    _1098 = select((((bool)((bool)(_1089 < 0.0f) || (bool)(_1089 > 1.0f))) || ((bool)((bool)(_1090 < 0.0f) || (bool)(_1090 > 1.0f)))), 1.0f, 0.0f);
    _1103 = (_1089 * _bufferSizeAndInvSize.x) + -0.5f;
    _1104 = (_1090 * _bufferSizeAndInvSize.y) + -0.5f;
    _1107 = int(floor(_1103));
    _1108 = int(floor(_1104));
    _1109 = float((int)(_1107));
    _1110 = float((int)(_1108));
    _1113 = (_1109 + 0.5f) * _bufferSizeAndInvSize.z;
    _1114 = (_1110 + 0.5f) * _bufferSizeAndInvSize.w;
    _1117 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1113, _1114));
    _1140 = mad(((uint)((int)(_1117.w)) >> 24), 16777216, mad(((uint)((int)(_1117.z)) >> 24), 65536, mad(((uint)((int)(_1117.y)) >> 24), 256, ((uint)((int)(_1117.x)) >> 24))));
    if (_1013) {
      if ((uint)_113 > (uint)52) {
        if (!((bool)(_113 == 98) || ((bool)((bool)((_111.x & 125) == 105) || (bool)((uint)_113 < (uint)68))))) {
          _1170 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _1170 = 0.0f;
        }
      } else {
        if ((uint)_113 > (uint)10) {
          if ((uint)_113 < (uint)20) {
            if (_398 == 14) {
              _1170 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1170 = 0.0f;
            }
          } else {
            if (!((_111.x & 125) == 105)) {
              _1170 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _1170 = 0.0f;
            }
          }
        } else {
          _1170 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _1170 = 0.0f;
    }
    _1178 = _screenPercentage.x * 2.0f;
    _1179 = _1178 * abs(_105 + -0.5f);
    _1180 = _screenPercentage.y * 2.0f;
    _1181 = _1180 * abs(_106 + -0.5f);
    _1185 = sqrt(dot(float2(_1179, _1181), float2(_1179, _1181)) + 1.0f) * _1086;
    _1202 = _1178 * abs(_1089 + -0.5f);
    _1203 = _1180 * abs(_1090 + -0.5f);
    _1206 = sqrt(dot(float2(_1202, _1203), float2(_1202, _1203)) + 1.0f);
    _1221 = _336 || (bool)((uint)(_923 + -97) < (uint)2);
    _1223 = _1086 * _1086;
    _1225 = (_1223 * select(_1221, 0.5f, 0.20000000298023224f)) + 1.0f;
    _1229 = ((uint)(_923 + -53) < (uint)15);
    if (_1229) {
      _1248 = (1000.0f - (saturate(float((bool)(bool)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _1248 = 50.0f;
    }
    _1258 = select(((bool)(_923 == 57) || _1229), 0.0f, ((max(0.0f, (_1086 + -1.0f)) * 0.10000000149011612f) * _temporalReprojectionParams.y));
    _1263 = max(0.0f, (abs(_1185 - (_1206 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((int)(_1117.x & 16777215))) * 5.960465188081798e-08f))) - _1170))) - _1258));
    _1264 = max(0.0f, (abs(_1185 - (_1206 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((int)(_1117.y & 16777215))) * 5.960465188081798e-08f))) - _1170))) - _1258));
    _1265 = max(0.0f, (abs(_1185 - (_1206 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((int)(_1117.z & 16777215))) * 5.960465188081798e-08f))) - _1170))) - _1258));
    _1266 = max(0.0f, (abs(_1185 - (_1206 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((int)(_1117.w & 16777215))) * 5.960465188081798e-08f))) - _1170))) - _1258));
    _1267 = _1263 * _1263;
    _1268 = _1264 * _1264;
    _1269 = _1265 * _1265;
    _1270 = _1266 * _1266;
    _1272 = (-1.4426950216293335f / ((_1223 * 0.10000000149011612f) + 1.0f)) * select(_1221, 0.20000000298023224f, _1248);
    _1285 = select((_1267 > _1225), 0.0f, exp2(_1267 * _1272));
    _1286 = select((_1268 > _1225), 0.0f, exp2(_1268 * _1272));
    _1287 = select((_1269 > _1225), 0.0f, exp2(_1269 * _1272));
    _1288 = select((_1270 > _1225), 0.0f, exp2(_1270 * _1272));
    if (!_963) {
      _1290 = _1140 & 127;
      _1291 = _1140 & 32512;
      _1292 = _1140 & 8323072;
      _1293 = _1140 & 2130706432;
      _1332 = (bool)(_1290 == 57) || (bool)((uint)(_1290 + -53) < (uint)15);
      _1333 = (bool)(_1291 == 14592) || (bool)((uint)((((uint)(_1140) >> 8) & 127) + -53) < (uint)15);
      _1334 = (bool)(_1292 == 3735552) || (bool)((uint)((((uint)(_1140) >> 16) & 127) + -53) < (uint)15);
      _1335 = (bool)(_1293 == 956301312) || (bool)((uint)((((uint)(_1140) >> 24) & 127) + -53) < (uint)15);
      _1347 = _113 + -53;
      if (_1013) {
        _1353 = ((bool)(_113 == 57) || (bool)((uint)_1347 < (uint)15));
      } else {
        _1353 = true;
      }
      _1362 = (_923 == 6);
      _1384 = ((uint)(_923 + -105) < (uint)3);
      _1391 = (bool)(_113 == 57) || (bool)((uint)_1347 < (uint)15);
      _1425 = (float((bool)((bool)(((bool)(_401 || ((bool)((bool)(_1290 != 54) && (bool)((_1140 & 126) != 66))))) && ((bool)(!(((bool)(((bool)((_1140 & 128) != 0) || _1332) ^ _1353)) || ((bool)(((bool)(_1362 ^ (_1290 == 6))) || ((bool)(((bool)(_1384 ^ ((bool)(_1290 == 107) || (bool)((uint)(_1290 + -105) < (uint)2)))) || ((bool)(_1332 ^ _1391)))))))))))) * _1285);
      _1426 = (float((bool)((bool)(((bool)(_401 || ((bool)((bool)(_1291 != 13824) && (bool)((_1140 & 32256) != 16896))))) && ((bool)(!(((bool)(((bool)((_1140 & 32768) != 0) || _1333) ^ _1353)) || ((bool)(((bool)(_1362 ^ (_1291 == 1536))) || ((bool)(((bool)(_1384 ^ ((bool)((_1140 & 32000) == 26880) || (bool)(_1291 == 27136)))) || ((bool)(_1333 ^ _1391)))))))))))) * _1286);
      _1427 = (float((bool)((bool)(((bool)(_401 || ((bool)((bool)(_1292 != 3538944) && (bool)((_1140 & 8257536) != 4325376))))) && ((bool)(!(((bool)(((bool)((_1140 & 8388608) != 0) || _1334) ^ _1353)) || ((bool)(((bool)(_1362 ^ (_1292 == 393216))) || ((bool)(((bool)(_1384 ^ ((bool)((_1140 & 8192000) == 6881280) || (bool)(_1292 == 6946816)))) || ((bool)(_1334 ^ _1391)))))))))))) * _1287);
      _1428 = (float((bool)((bool)(((bool)(_401 || ((bool)((bool)(_1293 != 905969664) && (bool)((_1140 & 2113929216) != 1107296256))))) && ((bool)(!(((bool)(((bool)((int)_1140 < (int)0) || _1335) ^ _1353)) || ((bool)(((bool)(_1362 ^ (_1293 == 100663296))) || ((bool)(((bool)(_1384 ^ ((bool)((_1140 & 2097152000) == 1761607680) || (bool)(_1293 == 1778384896)))) || ((bool)(_1335 ^ _1391)))))))))))) * _1288);
    } else {
      _1425 = _1285;
      _1426 = _1286;
      _1427 = _1287;
      _1428 = _1288;
    }
    _1430 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_1113, _1114));
    _1449 = min(1.0f, ((float((uint)((int)(_1430.w & 1023))) * 0.001956947147846222f) + -1.0f));
    _1450 = min(1.0f, ((float((uint)((int)(((uint)((int)(_1430.w)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    _1451 = min(1.0f, ((float((uint)((int)(((uint)((int)(_1430.w)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    _1453 = rsqrt(dot(float3(_1449, _1450, _1451), float3(_1449, _1450, _1451)));
    _1458 = saturate(dot(float3(_347, _348, _349), float3((_1453 * _1449), (_1453 * _1450), (_1453 * _1451))));
    _1473 = min(1.0f, ((float((uint)((int)(_1430.z & 1023))) * 0.001956947147846222f) + -1.0f));
    _1474 = min(1.0f, ((float((uint)((int)(((uint)((int)(_1430.z)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    _1475 = min(1.0f, ((float((uint)((int)(((uint)((int)(_1430.z)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    _1477 = rsqrt(dot(float3(_1473, _1474, _1475), float3(_1473, _1474, _1475)));
    _1482 = saturate(dot(float3(_347, _348, _349), float3((_1477 * _1473), (_1477 * _1474), (_1477 * _1475))));
    _1497 = min(1.0f, ((float((uint)((int)(_1430.x & 1023))) * 0.001956947147846222f) + -1.0f));
    _1498 = min(1.0f, ((float((uint)((int)(((uint)((int)(_1430.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    _1499 = min(1.0f, ((float((uint)((int)(((uint)((int)(_1430.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    _1501 = rsqrt(dot(float3(_1497, _1498, _1499), float3(_1497, _1498, _1499)));
    _1506 = saturate(dot(float3(_347, _348, _349), float3((_1501 * _1497), (_1501 * _1498), (_1501 * _1499))));
    _1521 = min(1.0f, ((float((uint)((int)(_1430.y & 1023))) * 0.001956947147846222f) + -1.0f));
    _1522 = min(1.0f, ((float((uint)((int)(((uint)((int)(_1430.y)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    _1523 = min(1.0f, ((float((uint)((int)(((uint)((int)(_1430.y)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    _1525 = rsqrt(dot(float3(_1521, _1522, _1523), float3(_1521, _1522, _1523)));
    _1530 = saturate(dot(float3(_347, _348, _349), float3((_1525 * _1521), (_1525 * _1522), (_1525 * _1523))));
    _1533 = select((_1001 || ((bool)(_1000 || _1221))), 0.009999999776482582f, 1.0f);
    _1550 = _1103 - _1109;
    _1551 = _1104 - _1110;
    _1552 = 1.0f - _1550;
    _1553 = 1.0f - _1551;
    _1558 = (_1552 * _1551) * _1425;
    _1560 = (_1551 * _1550) * _1426;
    _1562 = (_1553 * _1550) * _1427;
    _1564 = (_1553 * _1552) * _1428;
    _1566 = saturate(select(_963, 1.0f, (pow(_1506, _1533))) * _1558);
    _1567 = saturate(select(_963, 1.0f, (pow(_1530, _1533))) * _1560);
    _1568 = saturate(select(_963, 1.0f, (pow(_1482, _1533))) * _1562);
    _1569 = saturate(select(_963, 1.0f, (pow(_1458, _1533))) * _1564);
    [branch]
    if (!(WaveReadLaneFirst((int)(asint(__3__37__0__0__g_structureCounterBuffer.Load(8))).x) == 0)) {
      _1579 = __3__36__0__0__g_tiledManyLightsMasks.Load(int3(((uint)(_95 >> 5)), ((uint)(_97 >> 5)), 0));
      _1581 = _1579.x & 4;
      _1583 = (uint)(_1581) >> 2;
      if (!(_1581 == 0)) {
        _1591 = max((saturate(dot(float3(_933, _934, _935), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _1098);
        _1592 = _1583;
      } else {
        _1591 = _1098;
        _1592 = _1583;
      }
    } else {
      _1591 = _1098;
      _1592 = 0;
    }
    _1602 = saturate(max(_1591, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    _1603 = _1108 + 1u;
    half4 _1605 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1107, _1603, 0));
    _1610 = _1107 + 1u;
    half4 _1611 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1610, _1603, 0));
    half4 _1616 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1610, _1108, 0));
    half4 _1621 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_1107, _1108, 0));
    _1626 = dot(float4(_1566, _1567, _1568, _1569), float4(1.0f, 1.0f, 1.0f, 1.0f));
    _1635 = saturate(dot(float4(_1566, _1567, _1568, _1569), float4(float(_1605.w), float(_1611.w), float(_1616.w), float(_1621.w))) * (1.0f / max(1.0f, _1626)));
    _1640 = sqrt((_1084 * _1084) + (_1083 * _1083)) * 50.0f;
    if (_1229) {
      _1649 = saturate(1.0f - _1640);
    } else {
      _1649 = (1.0f - (saturate(_1640) * 0.5f));
    }
    _1653 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    _1658 = (_1635 * _1635) * 4.0f;
    _1669 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_105, _106), 0.0f);
    _1673 = saturate(_1669.w);
    _1675 = 1.0f / max(9.999999974752427e-07f, _1626);
    _1676 = _1675 * _1566;
    _1677 = _1675 * _1567;
    _1678 = _1675 * _1568;
    _1679 = _1675 * _1569;
    _1680 = saturate(saturate(max(_1602, (1.0f / ((saturate(_1658) * min(31.0f, ((_1649 * 15.0f) * _1653))) + 1.0f))) + _renderParams.z));
    _1722 = 1.0f / _exposure4.x;
    _1739 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1679 * float(_1621.x)) + ((_1678 * float(_1616.x)) + ((_1676 * float(_1605.x)) + (_1677 * float(_1611.x))))))) * _exposure4.y)))));
    _1740 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1679 * float(_1621.y)) + ((_1678 * float(_1616.y)) + ((_1676 * float(_1605.y)) + (_1677 * float(_1611.y))))))) * _exposure4.y)))));
    _1741 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1679 * float(_1621.z)) + ((_1678 * float(_1616.z)) + ((_1676 * float(_1605.z)) + (_1677 * float(_1611.z))))))) * _exposure4.y)))));
    if ((bool)(_923 != 54) && ((bool)((bool)(_999 != 66) && (bool)(_renderParams.y == 0.0f)))) {
      _1749 = dot(float3(_1739, _1740, _1741), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _1764 = ((min(_1749, _1669.y) / max(9.999999974752427e-07f, _1749)) * _1673) + saturate(1.0f - _1673);
      _1769 = saturate((saturate(((_1669.x - _1749) * 5.0f) / max(9.999999974752427e-07f, _1669.x)) * 0.5f) + _1680);
      _1770 = (_1764 * _1739);
      _1771 = (_1764 * _1740);
      _1772 = (_1764 * _1741);
    } else {
      _1769 = _1680;
      _1770 = _1739;
      _1771 = _1740;
      _1772 = _1741;
    }
    _1781 = ((_933 - _1770) * _1769) + _1770;
    _1782 = ((_934 - _1771) * _1769) + _1771;
    _1783 = ((_935 - _1772) * _1769) + _1772;
    __3__38__0__1__g_diffuseResultUAV[int2(_95, _97)] = float4((half)(half(_1781)), (half)(half(_1782)), (half)(half(_1783)), (half)(half(saturate(_1635 + 0.0625f))));
    _1790 = float(_996);
    _1791 = float(_997);
    _1792 = float(_998);
    if (_923 == 53) {
      _1799 = saturate(((_1791 + _1790) + _1792) * 1.2000000476837158f);
    } else {
      _1799 = 1.0f;
    }
    _1800 = float(_994);
    _1806 = (0.699999988079071f / min(max(max(max(_1790, _1791), _1792), 0.009999999776482582f), 0.699999988079071f)) * _1799;
    _1816 = (((_1806 * _1790) + -0.03999999910593033f) * _1800) + 0.03999999910593033f;
    _1817 = (((_1806 * _1791) + -0.03999999910593033f) * _1800) + 0.03999999910593033f;
    _1818 = (((_1806 * _1792) + -0.03999999910593033f) * _1800) + 0.03999999910593033f;
    if (!_963) {
      _1824 = (half)(saturate((half)(1.0h - (half)(_937.x))));
    } else {
      _1824 = 1.0h;
    }
    // RenoDX: Foliage AO for stencils 12-18 — DISABLED (vanilla already applies AO for stencils 12-18).
    // _963 is false for stencils 12-18, so vanilla path already sets _1824 = saturate(1.0h - _937.x).
    _1828 = (bool)(_923 == 98) || (bool)(_999 == 96);
    if (!_1828) {
      bool __branch_chain_1829;
      if ((uint)(_923 + -105) < (uint)2) {
        _1836 = _175;
        __branch_chain_1829 = true;
      } else {
        if (!((uint)(_923 + -11) < (uint)9)) {
          _1836 = false;
          __branch_chain_1829 = true;
        } else {
          _1867 = 0.0h;
          _1868 = _923;
          _1869 = 0.0f;
          _1870 = 0.0f;
          _1871 = 0.0f;
          __branch_chain_1829 = false;
        }
      }
      if (__branch_chain_1829) {
        _1836 = _175;
      }
      _1838 = (bool)(_923 == 107) || _1836;
      _1841 = select(_1838, 0.0f, _994);
      if (_1838 || ((bool)(!_957))) {
        if (_923 == 33) {
          _1853 = uint((asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[0u].x) * _417) + 0.5f);
          if ((bool)(_419 > 0.0f) && (bool)((uint)_1853 < (uint)(uint)(uint(asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[0u].x))))) {
            _1860 = asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((uint)(_1853 + 1u))]);
            _1867 = _1841;
            _1868 = _923;
            _1869 = min((1.0f - _1860.y), _1860.x);
            _1870 = saturate(_418);
            _1871 = _1860.x;
          } else {
            _1867 = _1841;
            _1868 = _923;
            _1869 = 0.0f;
            _1870 = 0.0f;
            _1871 = 0.0f;
          }
        } else {
          if (_923 == 55) {
            if (!(_419 < 0.0010000000474974513f)) {
              _1853 = uint((asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[0u].x) * _417) + 0.5f);
              if ((bool)(_419 > 0.0f) && (bool)((uint)_1853 < (uint)(uint)(uint(asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[0u].x))))) {
                _1860 = asfloat(__3__35__0__0__MaterialParameterPresetTableConstantBuffer_raw[((uint)(_1853 + 1u))]);
                _1867 = _1841;
                _1868 = _923;
                _1869 = min((1.0f - _1860.y), _1860.x);
                _1870 = saturate(_418);
                _1871 = _1860.x;
              } else {
                _1867 = _1841;
                _1868 = _923;
                _1869 = 0.0f;
                _1870 = 0.0f;
                _1871 = 0.0f;
              }
            } else {
              _1867 = _1841;
              _1868 = 53;
              _1869 = 0.0f;
              _1870 = 0.0f;
              _1871 = 0.0f;
            }
          } else {
            _1867 = _1841;
            _1868 = _923;
            _1869 = 0.0f;
            _1870 = 0.0f;
            _1871 = 0.0f;
          }
        }
      } else {
        _1867 = 0.0h;
        _1868 = 65;
        _1869 = 0.0f;
        _1870 = 0.0f;
        _1871 = 0.0f;
      }
    } else {
      _1867 = 0.0h;
      _1868 = _923;
      _1869 = 0.0f;
      _1870 = 0.0f;
      _1871 = 0.0f;
    }
    _1873 = dot(float3(_395, _396, _397), float3(_347, _348, _349)) * 2.0f;
    _1877 = _395 - (_1873 * _347);
    _1878 = _396 - (_1873 * _348);
    _1879 = _397 - (_1873 * _349);
    _1881 = rsqrt(dot(float3(_1877, _1878, _1879), float3(_1877, _1878, _1879)));
    _1882 = _1877 * _1881;
    _1883 = _1878 * _1881;
    _1884 = _1879 * _1881;
    _1887 = __3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_105, _106), 0.0f);
    _1889 = float(_995);
    _1891 = select((_1889 < 0.800000011920929f), _1887.x, 0.0f);
    _1892 = _1891 * _1882;
    _1893 = _1891 * _1883;
    _1894 = _1891 * _1884;
    _1899 = dot(float3(_1892, _1893, _1894), float3((-0.0f - _347), (-0.0f - _348), (-0.0f - _349))) * 2.0f;
    _1904 = ((_1899 * _347) + _390) + _1892;
    _1906 = ((_1899 * _348) + _391) + _1893;
    _1908 = ((_1899 * _349) + _392) + _1894;
    _1932 = mad((_viewProjRelative[2].x), _1908, mad((_viewProjRelative[1].x), _1906, (_1904 * (_viewProjRelative[0].x)))) + (_viewProjRelative[3].x);
    _1936 = mad((_viewProjRelative[2].y), _1908, mad((_viewProjRelative[1].y), _1906, (_1904 * (_viewProjRelative[0].y)))) + (_viewProjRelative[3].y);
    _1940 = mad((_viewProjRelative[2].z), _1908, mad((_viewProjRelative[1].z), _1906, (_1904 * (_viewProjRelative[0].z)))) + (_viewProjRelative[3].z);
    _1944 = mad((_viewProjRelative[2].w), _1908, mad((_viewProjRelative[1].w), _1906, (_1904 * (_viewProjRelative[0].w)))) + (_viewProjRelative[3].w);
    _1982 = mad((_projToPrevProj[3].w), _1944, mad((_projToPrevProj[2].w), _1940, mad((_projToPrevProj[1].w), _1936, ((_projToPrevProj[0].w) * _1932))));
    _1983 = mad((_projToPrevProj[3].x), _1944, mad((_projToPrevProj[2].x), _1940, mad((_projToPrevProj[1].x), _1936, ((_projToPrevProj[0].x) * _1932)))) / _1982;
    _1984 = mad((_projToPrevProj[3].y), _1944, mad((_projToPrevProj[2].y), _1940, mad((_projToPrevProj[1].y), _1936, ((_projToPrevProj[0].y) * _1932)))) / _1982;
    _1988 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[3].z), _1944, mad((_projToPrevProj[2].z), _1940, mad((_projToPrevProj[1].z), _1936, ((_projToPrevProj[0].z) * _1932)))) / _1982));
    _2024 = mad((_invViewProjRelativePrev[2].w), _1988, mad((_invViewProjRelativePrev[1].w), _1984, ((_invViewProjRelativePrev[0].w) * _1983))) + (_invViewProjRelativePrev[3].w);
    _2035 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[2].x), _1988, mad((_invViewProjRelativePrev[1].x), _1984, ((_invViewProjRelativePrev[0].x) * _1983))) + (_invViewProjRelativePrev[3].x)) / _2024) - _1904);
    _2036 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[2].y), _1988, mad((_invViewProjRelativePrev[1].y), _1984, ((_invViewProjRelativePrev[0].y) * _1983))) + (_invViewProjRelativePrev[3].y)) / _2024) - _1906);
    _2037 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _1988, mad((_invViewProjRelativePrev[1].z), _1984, ((_invViewProjRelativePrev[0].z) * _1983))) + (_invViewProjRelativePrev[3].z)) / _2024) - _1908);
    _2038 = dot(float3(_2035, _2036, _2037), float3(_1882, _1883, _1884));
    _2042 = _2035 - (_2038 * _1882);
    _2043 = _2036 - (_2038 * _1883);
    _2044 = _2037 - (_2038 * _1884);
    _2060 = (saturate(_1891 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_2042 * _2042) + (_2043 * _2043)) + (_2044 * _2044)) / max(0.0010000000474974513f, _1891))) + -1.0f)) + 1.0f;
    _2061 = _2060 * _2060;
    _2062 = _2061 * _2061;
    _2063 = _2062 * _1506;
    _2064 = _2062 * _1530;
    _2065 = _2062 * _1482;
    _2066 = _2062 * _1458;
    _2069 = (_renderParams.z > 0.0f);
    _2071 = float(1.0h - _995);
    _2075 = (_1983 - (_1932 / _1944)) - _1083;
    _2076 = (_1984 - (_1936 / _1944)) - _1084;
    _2080 = sqrt((_2076 * _2076) + (_2075 * _2075));
    _2085 = saturate((((_2071 * _2071) * (1.0f - (_1011 * 0.8999999761581421f))) * _2080) * select(_2069, 2000.0f, 500.0f));
    _2091 = _1868 & -2;
    _2094 = (_1868 == 29);
    _2097 = select((((bool)(_963 || _2094)) || ((bool)((bool)(_2091 == 24) || (bool)(_renderParams.y > 0.0f)))), 1.0f, float(_937.y));
    // RenoDX: Foliage specular AO — DISABLED (vanilla already applies _937.y for stencils 12-18
    // unless _renderParams.y > 0.0f, which is a rare global flag).
    _2101 = float(_1867);
    _2106 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
    _2132 = saturate(saturate(1.0f - (((_2101 * _117) / max(0.0010000000474974513f, _1011)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_2106 * 0.07500000298023224f)) + max(0.019999999552965164f, _1889)) + (saturate(_117 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_117 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_2101) * 0.75f)));
    if (_1868 == 64) {
      _2141 = ((saturate(_117 * 0.25f) * (_2132 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _2141 = _2132;
    }
    _2143 = (_2106 * 16.0f) + 16.0f;
    _2149 = select((_2106 > 1.0f), 0.0f, saturate((1.0f / _2143) * (_117 - _2143)));
    if (_1868 == 105) {
      _2160 = 1.0f;
      _2164 = select((_1868 == 65), 0.0f, _2160);
    } else {
      if (!((uint)(_1868 & 24) > (uint)23)) {
        _2160 = select((_1868 == 107), 1.0f, ((_2149 + _2141) - (_2149 * _2141)));
        _2164 = select((_1868 == 65), 0.0f, _2160);
      } else {
        _2164 = 0.0f;
      }
    }
    _2173 = select(((bool)(_1868 == 57) || (bool)((uint)((uint)(_1868 + (uint)(-53))) < (uint)15)), 31.0f, 63.0f);
    if (!_2094) {
      _2186 = (saturate((2000.0f - (saturate(float(_1867 * 0.5h) + (_117 * 0.0625f)) * 1500.0f)) * _2080) * (7.0f - _2173)) + _2173;
      if ((uint)((uint)(_1868 + (uint)(-12))) < (uint)9) {
        _2196 = ((saturate(_117 * 0.004999999888241291f) * (_2186 + -2.0f)) + 2.0f);
      } else {
        _2196 = _2186;
      }
    } else {
      _2196 = _2173;
    }
    _2199 = max(0.040008545h, _995);
    _2217 = saturate(max(max(_1602, select(_2069, (_2085 + 0.125f), 0.0f)), (1.0f / (((saturate((_1653 * _1653) * _1658) * min(64.0f, (_2196 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _2164) + (_117 * 0.0078125f)) + float(((half)(_2199 * _2199)) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    if ((uint)_1868 > (uint)52) {
      if ((uint)_1868 < (uint)68) {
        if (_2091 == 66) {
          _2250 = _2063;
          _2251 = _2064;
          _2252 = _2065;
          _2253 = _2066;
          _2256 = _2250;
          _2257 = _2251;
          _2258 = _2252;
          _2259 = _2253;
          _2260 = (half)(max(0.89990234h, _995));
        } else {
          if (!(_1868 == 54)) {
            _2228 = _2063 * _2063;
            _2229 = _2064 * _2064;
            _2230 = _2065 * _2065;
            _2231 = _2066 * _2066;
            _2232 = _2228 * _2228;
            _2233 = _2229 * _2229;
            _2234 = _2230 * _2230;
            _2235 = _2231 * _2231;
            _2241 = (_2232 * _2232);
            _2242 = (_2233 * _2233);
            _2243 = (_2234 * _2234);
            _2244 = (_2235 * _2235);
          } else {
            _2241 = _2063;
            _2242 = _2064;
            _2243 = _2065;
            _2244 = _2066;
          }
          if ((bool)(_1868 == 54) || (bool)(_2091 == 66)) {
            _2250 = _2241;
            _2251 = _2242;
            _2252 = _2243;
            _2253 = _2244;
            _2256 = _2250;
            _2257 = _2251;
            _2258 = _2252;
            _2259 = _2253;
            _2260 = (half)(max(0.89990234h, _995));
          } else {
            _2256 = _2241;
            _2257 = _2242;
            _2258 = _2243;
            _2259 = _2244;
            _2260 = (half)(max(0.099975586h, _995));
          }
        }
      } else {
        _2256 = _2063;
        _2257 = _2064;
        _2258 = _2065;
        _2259 = _2066;
        _2260 = (half)(max(0.099975586h, _995));
      }
    } else {
      _2241 = _2063;
      _2242 = _2064;
      _2243 = _2065;
      _2244 = _2066;
      if ((bool)(_1868 == 54) || (bool)(_2091 == 66)) {
        _2250 = _2241;
        _2251 = _2242;
        _2252 = _2243;
        _2253 = _2244;
        _2256 = _2250;
        _2257 = _2251;
        _2258 = _2252;
        _2259 = _2253;
        _2260 = (half)(max(0.89990234h, _995));
      } else {
        _2256 = _2241;
        _2257 = _2242;
        _2258 = _2243;
        _2259 = _2244;
        _2260 = (half)(max(0.099975586h, _995));
      }
    }
    _2261 = float(_2260);
    _2262 = _2261 * _2261;
    _2263 = _2262 * _2262;
    _2276 = (((_2263 * _2256) - _2256) * _2256) + 1.0f;
    _2277 = (((_2263 * _2257) - _2257) * _2257) + 1.0f;
    _2278 = (((_2263 * _2258) - _2258) * _2258) + 1.0f;
    _2279 = (((_2263 * _2259) - _2259) * _2259) + 1.0f;
    _2304 = saturate(select(_2094, 1.0f, saturate((_2263 / (_2276 * _2276)) * _2256)) * _1558);
    _2305 = saturate(select(_2094, 1.0f, saturate((_2263 / (_2277 * _2277)) * _2257)) * _1560);
    _2306 = saturate(select(_2094, 1.0f, saturate((_2263 / (_2278 * _2278)) * _2258)) * _1562);
    _2307 = saturate(select(_2094, 1.0f, saturate((_2263 / (_2279 * _2279)) * _2259)) * _1564);
    _2309 = ((uint)(_1868 & 24) > (uint)23);
    [branch]
    if (_2309) {
      _2322 = mad((_projToPrevProj[2].w), _108.x, mad((_projToPrevProj[1].w), _353, ((_projToPrevProj[0].w) * _351))) + (_projToPrevProj[3].w);
      _2325 = ((mad((_projToPrevProj[2].x), _108.x, mad((_projToPrevProj[1].x), _353, ((_projToPrevProj[0].x) * _351))) + (_projToPrevProj[3].x)) / _2322) - _351;
      _2326 = ((mad((_projToPrevProj[2].y), _108.x, mad((_projToPrevProj[1].y), _353, ((_projToPrevProj[0].y) * _351))) + (_projToPrevProj[3].y)) / _2322) - _353;
      _2336 = (((_2325 * 0.5f) + _105) * _bufferSizeAndInvSize.x) + -0.5f;
      _2337 = ((_106 - (_2326 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
      _2340 = int(floor(_2336));
      _2341 = int(floor(_2337));
      _2342 = float((int)(_2340));
      _2343 = float((int)(_2341));
      [branch]
      if (_2094) {
        _2353 = __3__36__0__0__g_stencilPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(((_2342 + 0.5f) * _bufferSizeAndInvSize.z), ((_2343 + 0.5f) * _bufferSizeAndInvSize.w)));
        _2360 = mad(_2353.w, 16777216, mad(_2353.z, 65536, mad(_2353.y, 256, _2353.x)));
        _2408 = saturate(min(max(((_993 / (((_117 * _117) * 0.004999999888241291f) + 1.0f)) + (_2085 * 0.5f)), 0.03125f), 0.5f) + _2217);
        _2409 = _2340;
        _2410 = _2341;
        _2411 = saturate(float((bool)(bool)((uint)(_2360 & 24) > (uint)23)) * _2304);
        _2412 = saturate(float((bool)(bool)((uint)(_2360 & 6144) > (uint)5888)) * _2305);
        _2413 = saturate(float((bool)(bool)((uint)(_2360 & 1572864) > (uint)1507328)) * _2306);
        _2414 = saturate(float((bool)(bool)((uint)(_2360 & 402653184) > (uint)385875968)) * _2307);
      } else {
        _2392 = _2336 - _2342;
        _2393 = _2337 - _2343;
        _2394 = 1.0f - _2392;
        _2395 = 1.0f - _2393;
        _2408 = saturate((sqrt((_2326 * _2326) + (_2325 * _2325)) * 100.0f) + 0.125f);
        _2409 = _2340;
        _2410 = _2341;
        _2411 = (_2394 * _2393);
        _2412 = (_2393 * _2392);
        _2413 = (_2395 * _2392);
        _2414 = (_2395 * _2394);
      }
    } else {
      _2408 = _2217;
      _2409 = _1107;
      _2410 = _1108;
      _2411 = _2304;
      _2412 = _2305;
      _2413 = _2306;
      _2414 = _2307;
    }
    _2415 = (_2101 > 0.20000000298023224f);
    _2416 = _2410 + 1u;
    half4 _2418 = __3__36__0__0__g_specularResultPrev.Load(int3(_2409, _2416, 0));
    _2431 = float((bool)((bool)(!(_2415 ^ ((half)(_2418.w) < 0.0h))))) * _2411;
    _2437 = _2409 + 1u;
    half4 _2438 = __3__36__0__0__g_specularResultPrev.Load(int3(_2437, _2416, 0));
    _2451 = float((bool)((bool)(!(_2415 ^ ((half)(_2438.w) < 0.0h))))) * _2412;
    half4 _2461 = __3__36__0__0__g_specularResultPrev.Load(int3(_2437, _2410, 0));
    _2474 = float((bool)((bool)(!(_2415 ^ ((half)(_2461.w) < 0.0h))))) * _2413;
    half4 _2484 = __3__36__0__0__g_specularResultPrev.Load(int3(_2409, _2410, 0));
    _2497 = float((bool)((bool)(!(_2415 ^ ((half)(_2484.w) < 0.0h))))) * _2414;
    _2521 = 1.0f / max(((saturate(_117 * 0.0625f) * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_2431, _2451, _2474, _2497), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    _2523 = -0.0f - (min(0.0f, (-0.0f - ((((_2431 * float(_2418.x)) + (_2451 * float(_2438.x))) + (_2474 * float(_2461.x))) + (_2497 * float(_2484.x))))) * _2521);
    _2525 = -0.0f - (min(0.0f, (-0.0f - ((((_2431 * float(_2418.y)) + (_2451 * float(_2438.y))) + (_2474 * float(_2461.y))) + (_2497 * float(_2484.y))))) * _2521);
    _2527 = -0.0f - (min(0.0f, (-0.0f - ((((_2431 * float(_2418.z)) + (_2451 * float(_2438.z))) + (_2474 * float(_2461.z))) + (_2497 * float(_2484.z))))) * _2521);
    _2528 = _2521 * min(0.0f, (-0.0f - ((((_2431 * abs(float(_2418.w))) + (_2451 * abs(float(_2438.w)))) + (_2474 * abs(float(_2461.w)))) + (_2497 * abs(float(_2484.w))))));
    if ((bool)(_1868 != 54) && ((bool)((bool)(_2091 != 66) && (bool)(_renderParams.y == 0.0f)))) {
      _2535 = dot(float3(_2523, _2525, _2527), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _2542 = ((min(_2535, _1669.z) / max(9.999999717180685e-10f, _2535)) * _1673) + saturate(1.0f - _1673);
      _2547 = (_2542 * _2523);
      _2548 = (_2542 * _2525);
      _2549 = (_2542 * _2527);
    } else {
      _2547 = _2523;
      _2548 = _2525;
      _2549 = _2527;
    }
    _2550 = _2547 * _exposure4.y;
    _2551 = _2548 * _exposure4.y;
    _2552 = _2549 * _exposure4.y;
    _2565 = ((max(0.0010000000474974513f, float(_1824)) + _2528) * _2408) - _2528;
    _2575 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2097 * _322.x) - _2550) * _2408) + _2550))));
    _2576 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2097 * _322.y) - _2551) * _2408) + _2551))));
    _2577 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_2097 * _322.z) - _2552) * _2408) + _2552))));
    __3__38__0__1__g_specularResultUAV[int2(_95, _97)] = float4((half)(half(_2575)), (half)(half(_2576)), (half)(half(_2577)), (half)(half(select(_2415, (-0.0f - _2565), _2565))));
    _2585 = select(_2309, 0.0f, _2565);
    _2590 = float(half(lerp(_2585, 1.0f, _1889)));
    _2591 = (_2091 == 64);
    _2593 = ((int)(uint)(_176)) ^ 1;
    if ((((int)(uint)(_2591)) & _2593) == 0) {
      _2610 = saturate(exp2((_2590 * _2590) * (_117 * -0.005770780146121979f)));
    } else {
      _2610 = select((_cavityParams.z > 0.0f), select(_176, 0.0f, _418), 1.0f);
    }
    _2613 = (_cavityParams.x == 0.0f);
    _2614 = select(_2613, 1.0f, _2610);
    if (_2591) {
      _2620 = (_2614 * _1816);
      _2621 = (_2614 * _1817);
      _2622 = (_2614 * _1818);
    } else {
      _2620 = _1816;
      _2621 = _1817;
      _2622 = _1818;
    }
    if ((bool)(_1868 == 54) || (bool)(_2091 == 66)) {
      _2637 = __3__36__0__0__g_hairBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, (1.0f - saturate(abs(dot(float3(_919, _920, _921), float3(_395, _396, _397)))))), (1.0f - max(0.75f, (_2590 * 2.0f)))), 0.0f);
      _2643 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1011), (1.0f - _2590)), 0.0f);
      _2650 = ((_2643.x - _2637.x) * _922) + _2637.x;
      _2651 = ((_2643.y - _2637.y) * _922) + _2637.y;
      _2653 = (_2650 * 0.009999999776482582f) + _2651;
      _2817 = _2650;
      _2818 = _2651;
      _2819 = _2653;
      _2820 = _2653;
      _2821 = _2653;
    } else {
      if ((uint)((uint)(_1868 + (uint)(-97))) < (uint)2) {
        if (!(abs(_220) > 0.9900000095367432f)) {
          _2661 = -0.0f - _221;
          _2663 = rsqrt(dot(float3(_2661, 0.0f, _219), float3(_2661, 0.0f, _219)));
          _2667 = (_2663 * _2661);
          _2668 = (_2663 * _219);
        } else {
          _2667 = 1.0f;
          _2668 = 0.0f;
        }
        _2670 = -0.0f - (_220 * _2668);
        _2673 = (_2668 * _219) - (_2667 * _221);
        _2674 = _2667 * _220;
        _2676 = rsqrt(dot(float3(_2670, _2673, _2674), float3(_2670, _2673, _2674)));
        _2684 = _viewPos.x + _390;
        _2685 = _viewPos.y + _391;
        _2686 = _viewPos.z + _392;
        _2691 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_2667, 0.0f, _2668), float3(_2684, _2685, _2686)), dot(float3((_2676 * _2670), (_2673 * _2676), (_2676 * _2674)), float3(_2684, _2685, _2686))), 0.0f);
        _2695 = _2691.x + -0.5f;
        _2696 = _2691.y + -0.5f;
        _2697 = _2691.z + -0.5f;
        _2699 = rsqrt(dot(float3(_2695, _2696, _2697), float3(_2695, _2696, _2697)));
        _2703 = (_2695 * _2699) + _347;
        _2704 = (_2696 * _2699) + _348;
        _2705 = (_2697 * _2699) + _349;
        _2707 = rsqrt(dot(float3(_2703, _2704, _2705), float3(_2703, _2704, _2705)));
        _2720 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1011), (1.0f - _2590)), 0.0f);
        _2727 = _2720.y + (exp2(log2(saturate(dot(float3(_1003, _1004, _1005), float3((_2703 * _2707), (_2704 * _2707), (_2705 * _2707))))) * 512.0f) * 20.0f);
        _2817 = _2720.x;
        _2818 = _2720.y;
        _2819 = (_2727 + (_2720.x * _2620));
        _2820 = (_2727 + (_2720.x * _2621));
        _2821 = (_2727 + (_2720.x * _2622));
      } else {
        if (_2591) {
          if (_1868 == 65) {
            _2800 = _2620;
            _2801 = _2621;
            _2802 = _2622;
            _2807 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1011), (1.0f - _2590)), 0.0f);
            _2817 = _2807.x;
            _2818 = _2807.y;
            _2819 = ((_2807.x * _2800) + _2807.y);
            _2820 = ((_2807.x * _2801) + _2807.y);
            _2821 = ((_2807.x * _2802) + _2807.y);
          } else {
            _2737 = min(0.9900000095367432f, _1011);
            _2742 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_2737, saturate(1.0f - (_2590 * 1.3300000429153442f))), 0.0f);
            _2747 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_2737, saturate(1.0f - (_2590 * 0.47998046875f))), 0.0f);
            _2751 = (_2747.x + _2742.x) * 0.5f;
            _2753 = (_2747.y + _2742.y) * 0.5f;
            _2817 = _2751;
            _2818 = _2753;
            _2819 = ((_2751 * _2620) + _2753);
            _2820 = ((_2751 * _2621) + _2753);
            _2821 = ((_2751 * _2622) + _2753);
          }
        } else {
          if ((bool)(_1868 == 33) || (bool)(_1868 == 55)) {
            _2770 = max(dot(float3(_1790, _1791, _1792), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
            _2774 = sqrt(_1790) - _2770;
            _2775 = sqrt(_1791) - _2770;
            _2776 = sqrt(_1792) - _2770;
            _2783 = saturate(1.0f - (pow(_1011, 4.0f)));
            _2800 = ((((_2774 * _1869) + _2770) + (_2783 * (_2774 * (_1871 - _1869)))) * _1870);
            _2801 = ((((_2775 * _1869) + _2770) + ((_2775 * (_1871 - _1869)) * _2783)) * _1870);
            _2802 = ((((_2776 * _1869) + _2770) + ((_2776 * (_1871 - _1869)) * _2783)) * _1870);
          } else {
            _2800 = _2620;
            _2801 = _2621;
            _2802 = _2622;
          }
          _2807 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _1011), (1.0f - _2590)), 0.0f);
          _2817 = _2807.x;
          _2818 = _2807.y;
          _2819 = ((_2807.x * _2800) + _2807.y);
          _2820 = ((_2807.x * _2801) + _2807.y);
          _2821 = ((_2807.x * _2802) + _2807.y);
        }
      }
    }
    _2824 = select((_2591 || _2309), 1.0f, _2614) * _1722;
    _2831 = _1781 * _1722;
    _2832 = _1782 * _1722;
    _2833 = _1783 * _1722;
    if ((uint)_923 > (uint)52) {
      if ((bool)((uint)_923 < (uint)68) || _963) {
        _3091 = _994;
        _3092 = _995;
        _3093 = _996;
        _3094 = _997;
        _3095 = _998;
        _3096 = _2585;
        if (_1002) {
          _3102 = _3096;
          _3103 = _3093;
          _3104 = _3094;
          _3105 = _3095;
          _3106 = _3092;
          _3107 = _3091;
          _3108 = 0.0f;
          _3109 = 0.0f;
          _3110 = 0.0f;
          _3111 = (_2831 * _924);
          _3112 = (_2832 * _925);
          _3113 = (_2833 * _926);
        } else {
          _3102 = _3096;
          _3103 = _3093;
          _3104 = _3094;
          _3105 = _3095;
          _3106 = _3092;
          _3107 = _3091;
          _3108 = _2831;
          _3109 = _2832;
          _3110 = _2833;
          _3111 = 0.0f;
          _3112 = 0.0f;
          _3113 = 0.0f;
        }
      } else {
        if (!((bool)(_923 == 6) || ((bool)((bool)(_999 == 106) || ((bool)((bool)((uint)(_923 + -27) < (uint)2) || ((bool)((bool)(_923 == 105) || (bool)(_923 == 26))))))))) {
          if (!(_923 == 7)) {
            _2858 = exp2(log2(_2585) * (saturate(_117 * 0.03125f) + 1.0f));
            _2868 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_105, _106), 0.0f);
            bool __branch_chain_2852;
            if ((bool)(_923 == 15) || ((bool)((bool)(_999 == 12) || (bool)((_923 & -4) == 16)))) {
              _2887 = false;
              _2888 = true;
              __branch_chain_2852 = true;
            } else {
              if (!((uint)_923 > (uint)10)) {
                _2887 = true;
                _2888 = false;
                __branch_chain_2852 = true;
              } else {
                if ((uint)_923 < (uint)20) {
                  _2887 = false;
                  _2888 = false;
                  __branch_chain_2852 = true;
                } else {
                  if (!(_923 == 97)) {
                    _2887 = (_923 != 107);
                    _2888 = false;
                    __branch_chain_2852 = true;
                  } else {
                    _3080 = _1800;
                    _3081 = _1889;
                    _3082 = _1790;
                    _3083 = _1791;
                    _3084 = _1792;
                    __branch_chain_2852 = false;
                  }
                }
              }
            }
            if (__branch_chain_2852) {
              if (_2868.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  _2898 = (_923 == 36);
                  if (!_2898) {
                    _2918 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _390) / _climateTextureOnePixelMeter.x) + float((int)((uint)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _392) / _climateTextureOnePixelMeter.y) + float((int)((uint)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _2924 = _2918.x;
                    _2925 = _2918.y;
                    _2926 = _2918.z;
                    _2927 = _2918.w;
                  } else {
                    _2924 = 0.11999999731779099f;
                    _2925 = 0.11999999731779099f;
                    _2926 = 0.10000000149011612f;
                    _2927 = 0.5f;
                  }
                  _2934 = 1.0f - saturate(((_viewPos.y + _391) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (_2934 > 0.0f) {
                    _2937 = saturate(_2858);
                    _2950 = ((_2925 * 0.3395099937915802f) + (_2924 * 0.6131200194358826f)) + (_2926 * 0.047370001673698425f);
                    _2951 = ((_2925 * 0.9163600206375122f) + (_2924 * 0.07020000368356705f)) + (_2926 * 0.013450000435113907f);
                    _2952 = ((_2925 * 0.10958000272512436f) + (_2924 * 0.02061999961733818f)) + (_2926 * 0.8697999715805054f);
                    _2957 = select(_2888, 1.0f, float((bool)(bool)(saturate(dot(float3(_347, _348, _349), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                    if (_enableSandAO == 1) {
                      _2962 = 1.0f - _2868.x;
                      if (_2898) {
                        _2993 = ((((_2962 * 10.0f) * _2927) * _2934) * _2937);
                        _2996 = _2950;
                        _2997 = _2951;
                        _2998 = _2952;
                        _2999 = saturate(_2993);
                      } else {
                        _2973 = saturate(_2927 + -0.5f);
                        _2996 = _2950;
                        _2997 = _2951;
                        _2998 = _2952;
                        _2999 = ((((_2973 * 2.0f) * max((_2957 * _2868.x), min((_2937 * ((_2868.x * 7.0f) + 3.0f)), (_2973 * 40.0f)))) + (((_2962 * 10.0f) * _2937) * saturate((0.5f - _2927) * 2.0f))) * _2934);
                      }
                    } else {
                      _2991 = ((_2934 * _2927) * _2868.x) * _2957;
                      if (_2898) {
                        _2993 = _2991;
                        _2996 = _2950;
                        _2997 = _2951;
                        _2998 = _2952;
                        _2999 = saturate(_2993);
                      } else {
                        _2996 = _2950;
                        _2997 = _2951;
                        _2998 = _2952;
                        _2999 = _2991;
                      }
                    }
                  } else {
                    _2996 = 0.0f;
                    _2997 = 0.0f;
                    _2998 = 0.0f;
                    _2999 = 0.0f;
                  }
                  _3003 = ((1.0f - _2868.w) * (1.0f - _2868.y)) * _2999;
                  _3004 = (_3003 > 9.999999747378752e-05f);
                  if (_3004) {
                    if (_2888) {
                      _3007 = saturate(_3003);
                      _3034 = (((sqrt(_2996 * _1790) - _1790) * _3007) + _1790);
                      _3035 = (((sqrt(_2997 * _1791) - _1791) * _3007) + _1791);
                      _3036 = (((sqrt(_2998 * _1792) - _1792) * _3007) + _1792);
                    } else {
                      _3034 = ((_3003 * (_2996 - _1790)) + _1790);
                      _3035 = ((_3003 * (_2997 - _1791)) + _1791);
                      _3036 = ((_3003 * (_2998 - _1792)) + _1792);
                    }
                  } else {
                    _3034 = _1790;
                    _3035 = _1791;
                    _3036 = _1792;
                  }
                  if (_2898 && _3004) {
                    if (_2888) {
                      _3051 = (((sqrt(_1889 * 0.25f) - _1889) * saturate(_3003)) + _1889);
                    } else {
                      _3051 = ((_3003 * (0.25f - _1889)) + _1889);
                    }
                  } else {
                    _3051 = _1889;
                  }
                  _3052 = saturate(_3034);
                  _3053 = saturate(_3035);
                  _3054 = saturate(_3036);
                  _3059 = (_3051 * (1.0f - _2858)) + _2858;
                  _3062 = ((_3051 - _3059) * _2868.y) + _3059;
                  _3069 = (((_2858 * _2858) * _2868.z) * float((bool)_2887)) * saturate(dot(float3(_347, _348, _349), float3(0.0f, 1.0f, 0.0f)));
                  _3070 = _3069 * -0.5f;
                  _3080 = (_1800 - (_2858 * _1800));
                  _3081 = (_3062 - (_3069 * _3062));
                  _3082 = ((_3070 * _3052) + _3052);
                  _3083 = ((_3070 * _3053) + _3053);
                  _3084 = ((_3070 * _3054) + _3054);
                } else {
                  _3080 = _1800;
                  _3081 = _1889;
                  _3082 = _1790;
                  _3083 = _1791;
                  _3084 = _1792;
                }
              } else {
                _3080 = _1800;
                _3081 = _1889;
                _3082 = _1790;
                _3083 = _1791;
                _3084 = _1792;
              }
            }
            _3091 = (half)(half(_3080));
            _3092 = (half)(half(_3081));
            _3093 = (half)(half(_3082));
            _3094 = (half)(half(_3083));
            _3095 = (half)(half(_3084));
            _3096 = _2858;
          } else {
            _3091 = _994;
            _3092 = _995;
            _3093 = _996;
            _3094 = _997;
            _3095 = _998;
            _3096 = _2585;
          }
          if (_1002) {
            _3102 = _3096;
            _3103 = _3093;
            _3104 = _3094;
            _3105 = _3095;
            _3106 = _3092;
            _3107 = _3091;
            _3108 = 0.0f;
            _3109 = 0.0f;
            _3110 = 0.0f;
            _3111 = (_2831 * _924);
            _3112 = (_2832 * _925);
            _3113 = (_2833 * _926);
          } else {
            _3102 = _3096;
            _3103 = _3093;
            _3104 = _3094;
            _3105 = _3095;
            _3106 = _3092;
            _3107 = _3091;
            _3108 = _2831;
            _3109 = _2832;
            _3110 = _2833;
            _3111 = 0.0f;
            _3112 = 0.0f;
            _3113 = 0.0f;
          }
        } else {
          _3102 = _2585;
          _3103 = _996;
          _3104 = _997;
          _3105 = _998;
          _3106 = _995;
          _3107 = _994;
          _3108 = _2831;
          _3109 = _2832;
          _3110 = _2833;
          _3111 = 0.0f;
          _3112 = 0.0f;
          _3113 = 0.0f;
        }
      }
    } else {
      if (_963) {
        _3091 = _994;
        _3092 = _995;
        _3093 = _996;
        _3094 = _997;
        _3095 = _998;
        _3096 = _2585;
        if (_1002) {
          _3102 = _3096;
          _3103 = _3093;
          _3104 = _3094;
          _3105 = _3095;
          _3106 = _3092;
          _3107 = _3091;
          _3108 = 0.0f;
          _3109 = 0.0f;
          _3110 = 0.0f;
          _3111 = (_2831 * _924);
          _3112 = (_2832 * _925);
          _3113 = (_2833 * _926);
        } else {
          _3102 = _3096;
          _3103 = _3093;
          _3104 = _3094;
          _3105 = _3095;
          _3106 = _3092;
          _3107 = _3091;
          _3108 = _2831;
          _3109 = _2832;
          _3110 = _2833;
          _3111 = 0.0f;
          _3112 = 0.0f;
          _3113 = 0.0f;
        }
      } else {
        if (!((bool)(_923 == 6) || ((bool)((bool)(_999 == 106) || ((bool)((bool)((uint)(_923 + -27) < (uint)2) || ((bool)((bool)(_923 == 105) || (bool)(_923 == 26))))))))) {
          if (!(_923 == 7)) {
            _2858 = exp2(log2(_2585) * (saturate(_117 * 0.03125f) + 1.0f));
            _2868 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_105, _106), 0.0f);
            bool __branch_chain_2852;
            if ((bool)(_923 == 15) || ((bool)((bool)(_999 == 12) || (bool)((_923 & -4) == 16)))) {
              _2887 = false;
              _2888 = true;
              __branch_chain_2852 = true;
            } else {
              if (!((uint)_923 > (uint)10)) {
                _2887 = true;
                _2888 = false;
                __branch_chain_2852 = true;
              } else {
                if ((uint)_923 < (uint)20) {
                  _2887 = false;
                  _2888 = false;
                  __branch_chain_2852 = true;
                } else {
                  if (!(_923 == 97)) {
                    _2887 = (_923 != 107);
                    _2888 = false;
                    __branch_chain_2852 = true;
                  } else {
                    _3080 = _1800;
                    _3081 = _1889;
                    _3082 = _1790;
                    _3083 = _1791;
                    _3084 = _1792;
                    __branch_chain_2852 = false;
                  }
                }
              }
            }
            if (__branch_chain_2852) {
              if (_2868.w < 1.0f) {
                if ((_weatherCheckFlag & 5) == 5) {
                  _2898 = (_923 == 36);
                  if (!_2898) {
                    _2918 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _390) / _climateTextureOnePixelMeter.x) + float((int)((uint)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _392) / _climateTextureOnePixelMeter.y) + float((int)((uint)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                    _2924 = _2918.x;
                    _2925 = _2918.y;
                    _2926 = _2918.z;
                    _2927 = _2918.w;
                  } else {
                    _2924 = 0.11999999731779099f;
                    _2925 = 0.11999999731779099f;
                    _2926 = 0.10000000149011612f;
                    _2927 = 0.5f;
                  }
                  _2934 = 1.0f - saturate(((_viewPos.y + _391) - _paramGlobalSand.x) / _paramGlobalSand.y);
                  if (_2934 > 0.0f) {
                    _2937 = saturate(_2858);
                    _2950 = ((_2925 * 0.3395099937915802f) + (_2924 * 0.6131200194358826f)) + (_2926 * 0.047370001673698425f);
                    _2951 = ((_2925 * 0.9163600206375122f) + (_2924 * 0.07020000368356705f)) + (_2926 * 0.013450000435113907f);
                    _2952 = ((_2925 * 0.10958000272512436f) + (_2924 * 0.02061999961733818f)) + (_2926 * 0.8697999715805054f);
                    _2957 = select(_2888, 1.0f, float((bool)(bool)(saturate(dot(float3(_347, _348, _349), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                    if (_enableSandAO == 1) {
                      _2962 = 1.0f - _2868.x;
                      if (_2898) {
                        _2993 = ((((_2962 * 10.0f) * _2927) * _2934) * _2937);
                        _2996 = _2950;
                        _2997 = _2951;
                        _2998 = _2952;
                        _2999 = saturate(_2993);
                      } else {
                        _2973 = saturate(_2927 + -0.5f);
                        _2996 = _2950;
                        _2997 = _2951;
                        _2998 = _2952;
                        _2999 = ((((_2973 * 2.0f) * max((_2957 * _2868.x), min((_2937 * ((_2868.x * 7.0f) + 3.0f)), (_2973 * 40.0f)))) + (((_2962 * 10.0f) * _2937) * saturate((0.5f - _2927) * 2.0f))) * _2934);
                      }
                    } else {
                      _2991 = ((_2934 * _2927) * _2868.x) * _2957;
                      if (_2898) {
                        _2993 = _2991;
                        _2996 = _2950;
                        _2997 = _2951;
                        _2998 = _2952;
                        _2999 = saturate(_2993);
                      } else {
                        _2996 = _2950;
                        _2997 = _2951;
                        _2998 = _2952;
                        _2999 = _2991;
                      }
                    }
                  } else {
                    _2996 = 0.0f;
                    _2997 = 0.0f;
                    _2998 = 0.0f;
                    _2999 = 0.0f;
                  }
                  _3003 = ((1.0f - _2868.w) * (1.0f - _2868.y)) * _2999;
                  _3004 = (_3003 > 9.999999747378752e-05f);
                  if (_3004) {
                    if (_2888) {
                      _3007 = saturate(_3003);
                      _3034 = (((sqrt(_2996 * _1790) - _1790) * _3007) + _1790);
                      _3035 = (((sqrt(_2997 * _1791) - _1791) * _3007) + _1791);
                      _3036 = (((sqrt(_2998 * _1792) - _1792) * _3007) + _1792);
                    } else {
                      _3034 = ((_3003 * (_2996 - _1790)) + _1790);
                      _3035 = ((_3003 * (_2997 - _1791)) + _1791);
                      _3036 = ((_3003 * (_2998 - _1792)) + _1792);
                    }
                  } else {
                    _3034 = _1790;
                    _3035 = _1791;
                    _3036 = _1792;
                  }
                  if (_2898 && _3004) {
                    if (_2888) {
                      _3051 = (((sqrt(_1889 * 0.25f) - _1889) * saturate(_3003)) + _1889);
                    } else {
                      _3051 = ((_3003 * (0.25f - _1889)) + _1889);
                    }
                  } else {
                    _3051 = _1889;
                  }
                  _3052 = saturate(_3034);
                  _3053 = saturate(_3035);
                  _3054 = saturate(_3036);
                  _3059 = (_3051 * (1.0f - _2858)) + _2858;
                  _3062 = ((_3051 - _3059) * _2868.y) + _3059;
                  _3069 = (((_2858 * _2858) * _2868.z) * float((bool)_2887)) * saturate(dot(float3(_347, _348, _349), float3(0.0f, 1.0f, 0.0f)));
                  _3070 = _3069 * -0.5f;
                  _3080 = (_1800 - (_2858 * _1800));
                  _3081 = (_3062 - (_3069 * _3062));
                  _3082 = ((_3070 * _3052) + _3052);
                  _3083 = ((_3070 * _3053) + _3053);
                  _3084 = ((_3070 * _3054) + _3054);
                } else {
                  _3080 = _1800;
                  _3081 = _1889;
                  _3082 = _1790;
                  _3083 = _1791;
                  _3084 = _1792;
                }
              } else {
                _3080 = _1800;
                _3081 = _1889;
                _3082 = _1790;
                _3083 = _1791;
                _3084 = _1792;
              }
            }
            _3091 = (half)(half(_3080));
            _3092 = (half)(half(_3081));
            _3093 = (half)(half(_3082));
            _3094 = (half)(half(_3083));
            _3095 = (half)(half(_3084));
            _3096 = _2858;
          } else {
            _3091 = _994;
            _3092 = _995;
            _3093 = _996;
            _3094 = _997;
            _3095 = _998;
            _3096 = _2585;
          }
          if (_1002) {
            _3102 = _3096;
            _3103 = _3093;
            _3104 = _3094;
            _3105 = _3095;
            _3106 = _3092;
            _3107 = _3091;
            _3108 = 0.0f;
            _3109 = 0.0f;
            _3110 = 0.0f;
            _3111 = (_2831 * _924);
            _3112 = (_2832 * _925);
            _3113 = (_2833 * _926);
          } else {
            _3102 = _3096;
            _3103 = _3093;
            _3104 = _3094;
            _3105 = _3095;
            _3106 = _3092;
            _3107 = _3091;
            _3108 = _2831;
            _3109 = _2832;
            _3110 = _2833;
            _3111 = 0.0f;
            _3112 = 0.0f;
            _3113 = 0.0f;
          }
        } else {
          _3102 = _2585;
          _3103 = _996;
          _3104 = _997;
          _3105 = _998;
          _3106 = _995;
          _3107 = _994;
          _3108 = _2831;
          _3109 = _2832;
          _3110 = _2833;
          _3111 = 0.0f;
          _3112 = 0.0f;
          _3113 = 0.0f;
        }
      }
    }
    half4 _3115 = __3__36__0__0__g_sceneShadowColor.Load(int3(_95, _97, 0));
    [branch]
    if (_963) {
      _3122 = __3__36__0__0__g_sceneNormal.Load(int3(_95, _97, 0));
      _3138 = min(1.0f, ((float((uint)((int)(_3122.x & 1023))) * 0.001956947147846222f) + -1.0f));
      _3139 = min(1.0f, ((float((uint)((int)(((uint)((int)(_3122.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
      _3140 = min(1.0f, ((float((uint)((int)(((uint)((int)(_3122.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
      _3142 = rsqrt(dot(float3(_3138, _3139, _3140), float3(_3138, _3139, _3140)));
      _3150 = (half)(half(_3142 * _3138));
      _3151 = (half)(half(_3142 * _3139));
      _3152 = (half)(half(_3142 * _3140));
    } else {
      _3150 = _290;
      _3151 = _291;
      _3152 = _292;
    }
    _3155 = (_sunDirection.y > 0.0f);
    if ((_3155) || ((!(_3155)) && (_sunDirection.y > _moonDirection.y))) {
      _3167 = _sunDirection.x;
      _3168 = _sunDirection.y;
      _3169 = _sunDirection.z;
    } else {
      _3167 = _moonDirection.x;
      _3168 = _moonDirection.y;
      _3169 = _moonDirection.z;
    }
    if ((_3155) || ((!(_3155)) && (_sunDirection.y > _moonDirection.y))) {
      _3189 = _precomputedAmbient7.y;
    } else {
      _3189 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    _3194 = _viewPos.y + _391;
    _3195 = _3194 + _earthRadius;
    _3199 = (_392 * _392) + (_390 * _390);
    _3201 = sqrt((_3195 * _3195) + _3199);
    _3206 = dot(float3((_390 / _3201), (_3195 / _3201), (_392 / _3201)), float3(_3167, _3168, _3169));
    _3211 = min(max(((_3201 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    _3219 = max(_3211, 0.0f);
    _3226 = (-0.0f - sqrt((_3219 + (_earthRadius * 2.0f)) * _3219)) / (_3219 + _earthRadius);
    if (_3206 > _3226) {
      _3249 = ((exp2(log2(saturate((_3206 - _3226) / (1.0f - _3226))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _3249 = ((exp2(log2(saturate((_3226 - _3206) / (_3226 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
    _3254 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_3211 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _3249), 0.0f);
    _3276 = ((_3254.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
    _3294 = exp2(((((float((uint)((int)(((uint)((int)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _3254.x) + _3276) * -1.4426950216293335f);
    _3295 = exp2(((((float((uint)((int)(((uint)((int)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _3254.x) + _3276) * -1.4426950216293335f);
    _3296 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((int)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _3254.x) + _3276) * -1.4426950216293335f);
    _3312 = sqrt(_3199);
    _3320 = (_cloudAltitude - (max(((_3312 * _3312) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    _3332 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((bool)(_3168 > 0.0f))) - ((int)(uint)((bool)(_3168 < 0.0f))))) * 0.5f))) + _3320;
    if (_391 < _3320) {
      _3335 = dot(float3(0.0f, 1.0f, 0.0f), float3(_3167, _3168, _3169));
      _3341 = select((abs(_3335) < 9.99999993922529e-09f), 1e+08f, ((_3332 - dot(float3(0.0f, 1.0f, 0.0f), float3(_390, _391, _392))) / _3335));
      _3347 = ((_3341 * _3167) + _390);
      _3348 = _3332;
      _3349 = ((_3341 * _3169) + _392);
    } else {
      _3347 = _390;
      _3348 = _391;
      _3349 = _392;
    }
    _3358 = __3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_3347 * 4.999999873689376e-05f) + 0.5f), ((_3348 - _3320) / _cloudThickness), ((_3349 * 4.999999873689376e-05f) + 0.5f)), 0.0f);
    _3369 = saturate(abs(_3168) * 4.0f);
    _3371 = (_3369 * _3369) * exp2(((_distanceScale * -1.4426950216293335f) * _3358.x) * (_cloudScatteringCoefficient / _distanceScale));
    _3378 = ((1.0f - _3371) * saturate(((_391 - _cloudThickness) - _3320) * 0.10000000149011612f)) + _3371;
    _3379 = _3378 * (((_3295 * 0.3395099937915802f) + (_3294 * 0.6131200194358826f)) + (_3296 * 0.047370001673698425f));
    _3380 = _3378 * (((_3295 * 0.9163600206375122f) + (_3294 * 0.07020000368356705f)) + (_3296 * 0.013450000435113907f));
    _3381 = _3378 * (((_3295 * 0.10958000272512436f) + (_3294 * 0.02061999961733818f)) + (_3296 * 0.8697999715805054f));
    _3397 = (((_3379 * 0.6131200194358826f) + (_3380 * 0.3395099937915802f)) + (_3381 * 0.047370001673698425f)) * _3189;
    _3398 = (((_3379 * 0.07020000368356705f) + (_3380 * 0.9163600206375122f)) + (_3381 * 0.013450000435113907f)) * _3189;
    _3399 = (((_3379 * 0.02061999961733818f) + (_3380 * 0.10958000272512436f)) + (_3381 * 0.8697999715805054f)) * _3189;
    // [DAWN_DUSK_GI] SH ambient directional boost
    if (DAWN_DUSK_IMPROVEMENTS == 1.f) {
      float _ddFactor = DawnDuskFactor(_sunDirection.y);
      float3 _ddAmbient = DawnDuskAmbientBoost(
        float3(_3397, _3398, _3399),
        float3(float(_3150), float(_3151), float(_3152)),
        _sunDirection.xyz,
        _ddFactor,
        _precomputedAmbient0.xyz);
      _3397 = _ddAmbient.x;
      _3398 = _ddAmbient.y;
      _3399 = _ddAmbient.z;
    }
    _3405 = float(_937.x);
    _3406 = float(_3115.x);
    _3407 = float(_3115.y);
    _3408 = float(_3115.z);
    _3409 = float(_3103);
    _3410 = float(_3104);
    _3411 = float(_3105);
    if (!_1828) {
      _3417 = (_175 && (bool)((uint)(_923 + -105) < (uint)2));
    } else {
      _3417 = true;
    }
    _3419 = float(max(0.010002136h, _3106));
    _3420 = float(_3107);
    _3423 = (_923 == 107);
    _3426 = _957 || ((bool)((bool)((uint)(_923 + -11) < (uint)9) || ((bool)(_3423 || _3417))));
    _3427 = select(_3426, 0.0f, _3420);
    if ((bool)(_999 == 26) || ((bool)((bool)(_923 == 105) || (bool)(_923 == 28)))) {
      _3439 = true;
      _3441 = _3439;
      _3442 = _3423;
    } else {
      _3436 = (_923 == 106);
      if (!(_923 == 19)) {
        _3439 = _3436;
        _3441 = _3439;
        _3442 = _3423;
      } else {
        _3441 = _3436;
        _3442 = true;
      }
    }
    _3443 = float(_3150);
    _3444 = float(_3151);
    _3445 = float(_3152);
    _3447 = __3__36__0__0__g_sceneDecalMask.Load(int3(_95, _97, 0));
    if (_923 == 97) {
      _3459 = (float((uint16_t)((int16_t)((uint16_t)((int16_t)(_3447.x)) >> 2))) * 0.01587301678955555f);
      _3460 = (((uint)((int)((int)(min16uint)((int16_t)((int16_t)(_3447.x) & 2)))) >> 1) + 97);
      _3461 = 0.0f;
      _3462 = 0.0f;
      _3463 = 0.0f;
      _3464 = 0.0f;
      _3465 = 0.0f;
    } else {
      _3459 = select(_3426, _3420, 0.0f);
      _3460 = _923;
      _3461 = _455;
      _3462 = _456;
      _3463 = _457;
      _3464 = _458;
      _3465 = _459;
    }
    _3470 = float(saturate(_195));
    _3471 = _3470 * _3470;
    _3472 = _3471 * _3471;
    _3473 = _3472 * _3472;
    _3480 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _100), (_bufferSizeAndInvSize.w * _101)), 0.0f);
    _3484 = ((_3473 * _3473) * select(((bool)(_923 == 29) || ((bool)(_3441 || _3442))), 0.0f, 1.0f)) * _3480.y;
    _3489 = _3443 - (_3484 * _3443);
    _3490 = (_3484 * (1.0f - _3444)) + _3444;
    _3491 = _3445 - (_3484 * _3445);
    _3493 = rsqrt(dot(float3(_3489, _3490, _3491), float3(_3489, _3490, _3491)));
    _3494 = _3489 * _3493;
    _3495 = _3490 * _3493;
    _3496 = _3491 * _3493;
    _3497 = (_3460 == 53);
    if (_3497) {
      _3504 = saturate(((_3410 + _3409) + _3411) * 1.2000000476837158f);
    } else {
      _3504 = 1.0f;
    }
    _3510 = (0.699999988079071f / min(max(max(max(_3409, _3410), _3411), 0.009999999776482582f), 0.699999988079071f)) * _3504;
    _3520 = (((_3510 * _3409) + -0.03999999910593033f) * _3427) + 0.03999999910593033f;
    _3521 = (((_3510 * _3410) + -0.03999999910593033f) * _3427) + 0.03999999910593033f;
    _3522 = (((_3510 * _3411) + -0.03999999910593033f) * _3427) + 0.03999999910593033f;
    _3523 = float(_3106);
    _3524 = _3460 & -2;
    _3525 = (_3524 == 64);
    _3528 = ((((int)(uint)(_3525)) & _2593) == 0);
    if (_3528) {
      _3541 = saturate(exp2((_3523 * _3523) * (_117 * -0.005770780146121979f)));
    } else {
      _3541 = select((_cavityParams.z > 0.0f), select(_176, 0.0f, _418), 1.0f);
    }
    _3542 = select(_2613, 1.0f, _3541);
    if (_3525) {
      _3548 = (_3542 * _3520);
      _3549 = (_3542 * _3521);
      _3550 = (_3542 * _3522);
    } else {
      _3548 = _3520;
      _3549 = _3521;
      _3550 = _3522;
    }
    // RenoDX: Geometric Specular AA
    float _rndx_spec_rough = _3419;
    if (SPECULAR_AA > 0.0f) {
      _rndx_spec_rough = NDFFilterRoughnessCS(float3(_3494, _3495, _3496), _3419, SPECULAR_AA);
    }
    _3551 = _rndx_spec_rough * _rndx_spec_rough;
    _3552 = _3551 * _3551;
    _3554 = ((uint)(_3460 + -97) < (uint)2);
    _3556 = select(_3554, 0.5f, (_3419 * 0.60009765625f));
    _3557 = _3556 * _3556;
    _3558 = _3557 * _3557;
    _3559 = (_3460 == 33);
    if (!_3559) {
      _3561 = (_3460 == 55);
      _3562 = (int)(uint)(_3561);
      if ((bool)(_3460 == 98) || (bool)(_3524 == 96)) {
        _3571 = true;
        if (_3561) {
          _3573 = _3571;
          _3577 = _3573;
          _3578 = ((int)(uint)((bool)(_3461 > 0.0f)));
          _3579 = _3461;
        } else {
          _3577 = _3571;
          _3578 = _3562;
          _3579 = 0.0f;
        }
        if ((uint)_3460 > (uint)11) {
          if (!((bool)((uint)_3460 < (uint)21) || (bool)(_3460 == 107))) {
            _3588 = _3577;
            _3589 = _3578;
            _3590 = _3579;
            _3593 = _3590;
            _3594 = _3589;
            _3595 = _3588;
            _3596 = (_3460 == 7);
          } else {
            _3593 = _3579;
            _3594 = _3578;
            _3595 = _3577;
            _3596 = true;
          }
        } else {
          if (!(_3460 == 6)) {
            _3588 = _3577;
            _3589 = _3578;
            _3590 = _3579;
            _3593 = _3590;
            _3594 = _3589;
            _3595 = _3588;
            _3596 = (_3460 == 7);
          } else {
            _3593 = _3579;
            _3594 = _3578;
            _3595 = _3577;
            _3596 = true;
          }
        }
      } else {
        if ((uint)(_3460 + -105) < (uint)2) {
          if (_3561) {
            _3573 = _175;
            _3577 = _3573;
            _3578 = ((int)(uint)((bool)(_3461 > 0.0f)));
            _3579 = _3461;
            if ((uint)_3460 > (uint)11) {
              if (!((bool)((uint)_3460 < (uint)21) || (bool)(_3460 == 107))) {
                _3588 = _3577;
                _3589 = _3578;
                _3590 = _3579;
                _3593 = _3590;
                _3594 = _3589;
                _3595 = _3588;
                _3596 = (_3460 == 7);
              } else {
                _3593 = _3579;
                _3594 = _3578;
                _3595 = _3577;
                _3596 = true;
              }
            } else {
              if (!(_3460 == 6)) {
                _3588 = _3577;
                _3589 = _3578;
                _3590 = _3579;
                _3593 = _3590;
                _3594 = _3589;
                _3595 = _3588;
                _3596 = (_3460 == 7);
              } else {
                _3593 = _3579;
                _3594 = _3578;
                _3595 = _3577;
                _3596 = true;
              }
            }
          } else {
            _3588 = _175;
            _3589 = _3562;
            _3590 = 0.0f;
            _3593 = _3590;
            _3594 = _3589;
            _3595 = _3588;
            _3596 = (_3460 == 7);
          }
        } else {
          _3571 = false;
          if (_3561) {
            _3573 = _3571;
            _3577 = _3573;
            _3578 = ((int)(uint)((bool)(_3461 > 0.0f)));
            _3579 = _3461;
          } else {
            _3577 = _3571;
            _3578 = _3562;
            _3579 = 0.0f;
          }
          if ((uint)_3460 > (uint)11) {
            if (!((bool)((uint)_3460 < (uint)21) || (bool)(_3460 == 107))) {
              _3588 = _3577;
              _3589 = _3578;
              _3590 = _3579;
              _3593 = _3590;
              _3594 = _3589;
              _3595 = _3588;
              _3596 = (_3460 == 7);
            } else {
              _3593 = _3579;
              _3594 = _3578;
              _3595 = _3577;
              _3596 = true;
            }
          } else {
            if (!(_3460 == 6)) {
              _3588 = _3577;
              _3589 = _3578;
              _3590 = _3579;
              _3593 = _3590;
              _3594 = _3589;
              _3595 = _3588;
              _3596 = (_3460 == 7);
            } else {
              _3593 = _3579;
              _3594 = _3578;
              _3595 = _3577;
              _3596 = true;
            }
          }
        }
      }
    } else {
      _3573 = false;
      _3577 = _3573;
      _3578 = ((int)(uint)((bool)(_3461 > 0.0f)));
      _3579 = _3461;
      if ((uint)_3460 > (uint)11) {
        if (!((bool)((uint)_3460 < (uint)21) || (bool)(_3460 == 107))) {
          _3588 = _3577;
          _3589 = _3578;
          _3590 = _3579;
          _3593 = _3590;
          _3594 = _3589;
          _3595 = _3588;
          _3596 = (_3460 == 7);
        } else {
          _3593 = _3579;
          _3594 = _3578;
          _3595 = _3577;
          _3596 = true;
        }
      } else {
        if (!(_3460 == 6)) {
          _3588 = _3577;
          _3589 = _3578;
          _3590 = _3579;
          _3593 = _3590;
          _3594 = _3589;
          _3595 = _3588;
          _3596 = (_3460 == 7);
        } else {
          _3593 = _3579;
          _3594 = _3578;
          _3595 = _3577;
          _3596 = true;
        }
      }
    }
    _3601 = exp2(log2(float(_3115.w)) * 2.200000047683716f) * 1000.0f;
    if ((_3155) || ((!(_3155)) && (_sunDirection.y > _moonDirection.y))) {
      _3613 = _sunDirection.x;
      _3614 = _sunDirection.y;
      _3615 = _sunDirection.z;
    } else {
      _3613 = _moonDirection.x;
      _3614 = _moonDirection.y;
      _3615 = _moonDirection.z;
    }
    _3616 = _3397 * _lightingParams.x;
    _3617 = _3398 * _lightingParams.x;
    _3618 = _3399 * _lightingParams.x;
    _3619 = _3613 - _395;
    _3620 = _3614 - _396;
    _3621 = _3615 - _397;
    _3623 = rsqrt(dot(float3(_3619, _3620, _3621), float3(_3619, _3620, _3621)));
    _3624 = _3623 * _3619;
    _3625 = _3623 * _3620;
    _3626 = _3623 * _3621;
    _3627 = dot(float3(_3443, _3444, _3445), float3(_3613, _3614, _3615));
    _3628 = dot(float3(_3494, _3495, _3496), float3(_3613, _3614, _3615));
    _3630 = saturate(dot(float3(_3443, _3444, _3445), float3(_1003, _1004, _1005)));
    _3632 = saturate(dot(float3(_3494, _3495, _3496), float3(_3624, _3625, _3626)));
    _3633 = dot(float3(_1003, _1004, _1005), float3(_3624, _3625, _3626));
    _3635 = saturate(dot(float3(_3613, _3614, _3615), float3(_3624, _3625, _3626)));
    _3636 = (_3524 == 66);
    _3637 = (_3460 == 54);
    _3638 = _3637 || _3636;
    if (_3638) {
      if (_3637) {
        _3655 = (((asfloat(_globalLightParams.z) * _3419) + _bevelParams.y) + (asfloat(_globalLightParams.w) * float(_162)));
      } else {
        _3655 = _bevelParams.y;
      }
      _3673 = (sqrt(_3199 + (_391 * _391)) * 2.0f) + 1.0f;
      _3677 = (_922 * 7.0f) + 1.0f;
      _3682 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2((((dot(float3(_390, _391, _392), float3(((_921 * _220) - (_920 * _221)), ((_919 * _221) - (_921 * _219)), ((_920 * _219) - (_919 * _220)))) * 2.0f) / _3673) * _3677), (((dot(float3(_390, _391, _392), float3(_919, _920, _921)) * 0.5f) / _3673) * _3677)), 0.0f);
      _3686 = _922 * 0.5f;
      _3687 = _3682.x * 2.0f;
      _3688 = _3682.y * 2.0f;
      _3689 = _3682.z * 2.0f;
      _3700 = dot(float3(_919, _920, _921), float3(_3613, _3614, _3615));
      _3701 = dot(float3(_919, _920, _921), float3(_1003, _1004, _1005));
      _3707 = cos(abs(asin(_3701) - asin(_3700)) * 0.5f);
      _3711 = _3613 - (_3700 * _919);
      _3712 = _3614 - (_3700 * _920);
      _3713 = _3615 - (_3700 * _921);
      _3717 = _1003 - (_3701 * _919);
      _3718 = _1004 - (_3701 * _920);
      _3719 = _1005 - (_3701 * _921);
      _3726 = rsqrt((dot(float3(_3717, _3718, _3719), float3(_3717, _3718, _3719)) * dot(float3(_3711, _3712, _3713), float3(_3711, _3712, _3713))) + 9.999999747378752e-05f) * dot(float3(_3711, _3712, _3713), float3(_3717, _3718, _3719));
      _3730 = sqrt(saturate((_3726 * 0.5f) + 0.5f));
      _3737 = min(max(max(0.05000000074505806f, _3419), 0.09803921729326248f), 1.0f);
      _3738 = _3737 * _3737;
      _3739 = _3738 * 0.5f;
      _3740 = _3738 * 2.0f;
      _3741 = _3701 + _3700;
      _3742 = _3741 + (_3655 * 2.0f);
      _3744 = (_3730 * 1.4142135381698608f) * _3738;
      _3758 = 1.0f - sqrt(saturate((dot(float3(_1003, _1004, _1005), float3(_3613, _3614, _3615)) * 0.5f) + 0.5f));
      _3759 = _3758 * _3758;
      _3766 = _3741 - _3655;
      _3775 = 1.0f / ((1.190000057220459f / _3707) + (_3707 * 0.36000001430511475f));
      _3780 = ((_3775 * (0.6000000238418579f - (_3726 * 0.800000011920929f))) + 1.0f) * _3730;
      _3786 = 1.0f - (sqrt(saturate(1.0f - (_3780 * _3780))) * _3707);
      _3787 = _3786 * _3786;
      _3791 = 0.9534794092178345f - ((_3787 * _3787) * (_3786 * 0.9534794092178345f));
      _3792 = _3775 * _3780;
      _3797 = (sqrt(1.0f - (_3792 * _3792)) * 0.5f) / _3707;
      _3798 = log2(_3409);
      _3799 = log2(_3410);
      _3800 = log2(_3411);
      _3812 = ((_3791 * _3791) * (exp2((((_3766 * _3766) * -0.5f) / (_3739 * _3739)) * 1.4426950216293335f) / (_3738 * 1.2533141374588013f))) * exp2(-5.741926193237305f - (_3726 * 5.2658371925354f));
      _3816 = _3741 - (_3655 * 4.0f);
      _3826 = 1.0f - (_3707 * 0.5f);
      _3827 = _3826 * _3826;
      _3831 = (_3827 * _3827) * (0.9534794092178345f - (_3707 * 0.47673970460891724f));
      _3833 = 0.9534794092178345f - _3831;
      _3834 = 0.800000011920929f / _3707;
      _3847 = (((_3833 * _3833) * (_3831 + 0.04652056470513344f)) * (exp2((((_3816 * _3816) * -0.5f) / (_3740 * _3740)) * 1.4426950216293335f) / (_3738 * 5.013256549835205f))) * exp2((_3726 * 24.525815963745117f) + -24.208423614501953f);
      _3854 = saturate(_3628);
      _3855 = (((_3730 * 0.25f) * (exp2((((_3742 * _3742) * -0.5f) / (_3744 * _3744)) * 1.4426950216293335f) / (_3744 * 2.5066282749176025f))) * (((_3759 * _3759) * (_3758 * 0.9534794092178345f)) + 0.04652056470513344f)) * _3854;
      _3865 = -0.0f - _3854;
      _3876 = saturate((_3628 + 1.0f) * 0.25f);
      _3881 = max(0.0010000000474974513f, dot(float3(_3409, _3410, _3411), float3(0.30000001192092896f, 0.5899999737739563f, 0.10999999940395355f)));
      _3900 = ((((1.0f - abs(_3628)) - _3876) * 0.33000001311302185f) + _3876) * 0.07957746833562851f;
      _3902 = (exp2(log2(_3409 / _3881) * (1.0f - _3406)) * _3900) * sqrt(_3409);
      _3904 = (exp2(log2(_3410 / _3881) * (1.0f - _3407)) * _3900) * sqrt(_3410);
      _3906 = (exp2(log2(_3411 / _3881) * (1.0f - _3408)) * _3900) * sqrt(_3411);
      _3913 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3847 * exp2(_3834 * _3798)) + (_3812 * exp2(_3798 * _3797))) * _3865)))));
      _3914 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3847 * exp2(_3834 * _3799)) + (_3812 * exp2(_3799 * _3797))) * _3865)))));
      _3915 = min(2048.0f, (-0.0f - min(0.0f, min(0.0f, (((_3847 * exp2(_3834 * _3800)) + (_3812 * exp2(_3800 * _3797))) * _3865)))));
      _3922 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3687, 1.0f, _3686)) * _3855))) * _3406));
      _3923 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3688, 1.0f, _3686)) * _3855))) * _3407));
      _3924 = -0.0f - min(0.0f, (min(0.0f, (-0.0f - ((lerp(_3689, 1.0f, _3686)) * _3855))) * _3408));
      if (!_3636) {
        _3926 = _3913;
        _3927 = _3914;
        _3928 = _3915;
        _3929 = _3922;
        _3930 = _3923;
        _3931 = _3924;
        _3932 = _3902;
        _3933 = _3904;
        _3934 = _3906;
      } else {
        _4344 = _3913;
        _4345 = _3914;
        _4346 = _3915;
        _4347 = _3922;
        _4348 = _3923;
        _4349 = _3924;
        _4350 = _3902;
        _4351 = _3904;
        _4352 = _3906;
      }
    } else {
      _3926 = 0.0f;
      _3927 = 0.0f;
      _3928 = 0.0f;
      _3929 = 0.0f;
      _3930 = 0.0f;
      _3931 = 0.0f;
      _3932 = 0.0f;
      _3933 = 0.0f;
      _3934 = 0.0f;
    }
    if (!_3637) {
      // RenoDX: Foliage stencil detection (stencil 12..18 inclusive)
      bool isFoliage = ((uint)(_113 - 12) < 7u);
      _3936 = (_3594 == 0);
      // FIX: DXIL branches stencil 66 from %3654 directly to %4343,
      // bypassing the GGX/cloth computation entirely. Guard both paths.
      if (_3636) {
        // Stencil 66: skip GGX/cloth, preserve _4344-_4352 from Marschner
        _4344 = _3926;
        _4345 = _3927;
        _4346 = _3928;
        _4347 = _3929;
        _4348 = _3930;
        _4349 = _3931;
        _4350 = _3932;
        _4351 = _3933;
        _4352 = _3934;
      } else if (_3936) {
        if ((bool)(_3627 > 0.0f) || (bool)(_3628 > 0.0f)) {
          _4104 = 0.0f;
          _4105 = 0.0f;
          _4106 = 0.0f;
          _4107 = 0.0f;
          _4108 = 0.0f;
          _4109 = 0.0f;
          _4110 = 0.0f;
          _4111 = 0.0f;
          _4112 = 0.0f;
          if (!(_3461 > 0.9900000095367432f)) {
            _4115 = saturate(_3627);
            _4116 = 1.0f - _3552;
            _4117 = 1.0f - _3635;
            _4118 = _4117 * _4117;
            _4121 = ((_4118 * _4118) * _4117) + _3635;
            _4122 = 1.0f - _4115;
            _4123 = _4122 * _4122;
            _4128 = 1.0f - _3630;
            _4129 = _4128 * _4128;
            if (DIFFUSE_BRDF_MODE >= 1.0f) {
              // EON Diffuse
              float _eon_LdotV = dot(float3(_3613, _3614, _3615), float3(_1003, _1004, _1005));
              _4156 = _4115 * EON_DiffuseScalar(_4115, _3630, _eon_LdotV, _3419);
            } else {
              // Vanilla Burley Diffuse
              _4156 = (_4115 * 0.31830987334251404f) * ((((_3635 * ((((_4116 * 34.5f) + -59.0f) * _4116) + 24.5f)) * exp2(-0.0f - (max(((_4116 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_3632)))) + _4121) + ((((1.0f - ((_4123 * _4123) * (_4122 * 0.75f))) * (1.0f - ((_4129 * _4129) * (_4128 * 0.75f)))) - _4121) * saturate((_4116 * 2.200000047683716f) + -0.5f)));
            }
            _4159 = saturate(1.0f - saturate(_3633));
            _4160 = _4159 * _4159;
            _4162 = (_4160 * _4160) * _4159;
            _4165 = _4162 * saturate(_3549 * 50.0f);
            _4166 = 1.0f - _4162;
            _4170 = (_4166 * _3548) + _4165;
            _4171 = (_4166 * _3549) + _4165;
            _4172 = (_4166 * _3550) + _4165;
            if (!(_3460 == 29)) {
              _4174 = saturate(_3628);
              _4175 = 1.0f - _3551;
              _4187 = (((_3632 * _3552) - _3632) * _3632) + 1.0f;
              _4191 = (_3552 / ((_4187 * _4187) * 3.1415927410125732f)) * (0.5f / ((((_3630 * _4175) + _3551) * _3628) + (_3630 * ((_3628 * _4175) + _3551))));
              _4202 = (max((_4191 * _4170), 0.0f) * _4174);
              _4203 = (max((_4191 * _4171), 0.0f) * _4174);
              _4204 = (max((_4191 * _4172), 0.0f) * _4174);
            } else {
              _4202 = 0.0f;
              _4203 = 0.0f;
              _4204 = 0.0f;
            }
            // RenoDX: Diffraction on Rough Surfaces
            if (DIFFRACTION > 0.0f && _3427 > 0.0f) {
              float3 _rndx_dShift = DiffractionShiftAndSpeckleCS(
                _3632, _3630, _rndx_spec_rough,
                float2(_105, _106), _117,
                float3(_3624, _3625, _3626),
                float3(_3494, _3495, _3496),
                float3(_3409, _3410, _3411)
              );
              float3 _rndx_dMod = lerp(1.0f, _rndx_dShift, DIFFRACTION * _3427);
              _4202 *= _rndx_dMod.x;
              _4203 *= _rndx_dMod.y;
              _4204 *= _rndx_dMod.z;
            }
            // RenoDX: Callisto Smooth Terminator
            if (SMOOTH_TERMINATOR > 0.0f) {
              float _rndx_c2 = CallistoSmoothTerminator(_4115, _3635, _3632, SMOOTH_TERMINATOR, 0.5f);
              _4156 *= _rndx_c2;
              _4202 *= _rndx_c2;
              _4203 *= _rndx_c2;
              _4204 *= _rndx_c2;
            }
            // RenoDX: Foliage Transmission
            if (FOLIAGE_TRANSMISSION > 0.0f && isFoliage) {
              FoliageTransmissionResult _ftResult = FoliageTransmission(
                  float3(_1003, _1004, _1005),                  // V (view dir toward camera)
                  float3(_3613, _3614, _3615),                  // L (light dir)
                  float3(_3443, _3444, _3445),                  // N (surface normal)
                  _3627,                                        // NdotL (raw)
                  float3(_3409, _3410, _3411),                  // baseColor
                  float3(_3379, _3380, _3381),                  // shadowColor
                  float3(_3616, _3617, _3618),                  // lightLum
                  FOLIAGE_TRANSMISSION_THICKNESS);              // thickness

              foliageTransR = _ftResult.transmission.x;
              foliageTransG = _ftResult.transmission.y;
              foliageTransB = _ftResult.transmission.z;

              if (_ftResult.diffuseScale > 0.0f) {
                _4156 *= _ftResult.diffuseScale;
              } else {
                float wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
                _4156 = max(0.0f, (_3627 + wrap) / (1.0f + wrap)) * 0.31830987334251404f * 0.75f;
              }
            }
            _4205 = (_3460 == 65);
            if (_3525) {
              if (_4205) {
                _4248 = max(9.999999974752427e-07f, _exposure2.x);
                _4257 = ((_4115 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_3494, _3495, _3496), float3(_1003, _1004, _1005)))) * 16.0f)) / (((_4248 * _4248) * 1e+06f) + 1.0f);
                _4271 = _4202;
                _4272 = _4203;
                _4273 = _4204;
                _4274 = ((((_4257 * _3409) - _4156) * _3459) + _4156);
                _4275 = ((((_4257 * _3410) - _4156) * _3459) + _4156);
                _4276 = ((((_4257 * _3411) - _4156) * _3459) + _4156);
              } else {
                _4212 = 1.0f - _3557;
                _4224 = (((_3632 * _3558) - _3632) * _3632) + 1.0f;
                _4228 = (_3558 / ((_4224 * _4224) * 3.1415927410125732f)) * (0.5f / ((((_3630 * _4212) + _3557) * _3628) + (_3630 * ((_3628 * _4212) + _3557))));
                _4235 = saturate(_3628) * 0.39990234375f;
                _4271 = ((max((_4228 * _4170), 0.0f) * _4235) + (_4202 * 0.60009765625f));
                _4272 = ((max((_4228 * _4171), 0.0f) * _4235) + (_4203 * 0.60009765625f));
                _4273 = ((max((_4228 * _4172), 0.0f) * _4235) + (_4204 * 0.60009765625f));
                _4274 = _4156;
                _4275 = _4156;
                _4276 = _4156;
              }
            } else {
              if (_4205) {
                _4248 = max(9.999999974752427e-07f, _exposure2.x);
                _4257 = ((_4115 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_3494, _3495, _3496), float3(_1003, _1004, _1005)))) * 16.0f)) / (((_4248 * _4248) * 1e+06f) + 1.0f);
                _4271 = _4202;
                _4272 = _4203;
                _4273 = _4204;
                _4274 = ((((_4257 * _3409) - _4156) * _3459) + _4156);
                _4275 = ((((_4257 * _3410) - _4156) * _3459) + _4156);
                _4276 = ((((_4257 * _3411) - _4156) * _3459) + _4156);
              } else {
                _4271 = _4202;
                _4272 = _4203;
                _4273 = _4204;
                _4274 = _4156;
                _4275 = _4156;
                _4276 = _4156;
              }
            }
          } else {
            _4271 = _3929;
            _4272 = _3930;
            _4273 = _3931;
            _4274 = _3932;
            _4275 = _3933;
            _4276 = _3934;
          }
          _4280 = min(-0.0f, (-0.0f - _4274));
          _4281 = min(-0.0f, (-0.0f - _4275));
          _4282 = min(-0.0f, (-0.0f - _4276));
          _4283 = -0.0f - _4280;
          _4284 = -0.0f - _4281;
          _4285 = -0.0f - _4282;
          _4344 = _3926;
          _4345 = _3927;
          _4346 = _3928;
          _4347 = (_4271 * _3406);
          _4348 = (_4272 * _3407);
          _4349 = (_4273 * _3408);
          _4350 = (_3406 * _4283);
          _4351 = (_3407 * _4284);
          _4352 = (_3408 * _4285);
        } else {
          _4344 = _3926;
          _4345 = _3927;
          _4346 = _3928;
          _4347 = _3929;
          _4348 = _3930;
          _4349 = _3931;
          _4350 = _3932;
          _4351 = _3933;
          _4352 = _3934;
        }
      } else {
        _3951 = (saturate(_3627) * 0.31830987334251404f) * (((saturate(1.0f - _effectiveMetallicForVelvet) + -1.0f) * _3465) + 1.0f);
        _3957 = max(dot(float3(_3409, _3410, _3411), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)), 0.03999999910593033f);
        _3958 = sqrt(_3409);
        _3959 = sqrt(_3410);
        _3960 = sqrt(_3411);
        _3961 = _3958 - _3957;
        _3962 = _3959 - _3957;
        _3963 = _3960 - _3957;
        _3970 = saturate(1.0f - (pow(_3630, 4.0f)));
        _3983 = (((_3962 * _3462) + _3957) + ((_3962 * (_3465 - _3462)) * _3970)) * _3463;
        _3986 = saturate(1.0f - saturate(_3633));
        _3987 = _3986 * _3986;
        _3989 = (_3987 * _3987) * _3986;
        _3992 = _3989 * saturate(_3983 * 50.0f);
        _3993 = 1.0f - _3989;
        _3994 = _3993 * _3463;
        _3998 = (_3994 * (((_3961 * _3462) + _3957) + (_3970 * (_3961 * (_3465 - _3462))))) + _3992;
        _3999 = (_3993 * _3983) + _3992;
        _4000 = (_3994 * (((_3963 * _3462) + _3957) + ((_3963 * (_3465 - _3462)) * _3970))) + _3992;
        _4001 = min(_3632, 0.9998999834060669f);
        _4002 = _4001 * _4001;
        _4003 = 1.0f - _4002;
        _4015 = (((exp2(((-0.0f - _4002) / (_4003 * _3552)) * 1.4426950216293335f) * 4.0f) / (_4003 * _4003)) + 1.0f) / ((_3552 * 12.566370964050293f) + 3.1415927410125732f);
        _4019 = ((_3630 + _3628) - (_3630 * _3628)) * 4.0f;
        _4023 = (_3998 * _4015) / _4019;
        _4024 = (_3999 * _4015) / _4019;
        _4025 = (_4000 * _4015) / _4019;
        _4026 = 1.0f - _3551;
        _4038 = (((_3632 * _3552) - _3632) * _3632) + 1.0f;
        _4042 = (_3552 / ((_4038 * _4038) * 3.1415927410125732f)) * (0.5f / ((((_3630 * _4026) + _3551) * _3627) + (_3630 * ((_3627 * _4026) + _3551))));
        _4058 = saturate(_3628);
        _4063 = (_3464 * 1.5f) + 2.5f;
        _4064 = _4063 * _4063;
        _4074 = (max(0.0f, (0.30000001192092896f - _3627)) * 0.25f) * ((exp2(_4064 * -0.48089835047721863f) * 3.0f) + exp2(_4064 * -1.4426950216293335f));
        _4099 = (((1.0f - _3465) * 0.47746479511260986f) * saturate(_3464)) * saturate((pow(_3632, 4.0f)) * exp2(log2(saturate(1.0f - abs(_3627))) * 3.0f));
        _4104 = (_4099 * _3958);
        _4105 = (_4099 * _3959);
        _4106 = (_4099 * _3960);
        _4107 = ((((max((_4042 * _3998), 0.0f) - _4023) * _3462) + _4023) * _4058);
        _4108 = ((((max((_4042 * _3999), 0.0f) - _4024) * _3462) + _4024) * _4058);
        _4109 = ((((max((_4042 * _4000), 0.0f) - _4025) * _3462) + _4025) * _4058);
        _4110 = (((_3958 * _3406) * _4074) + _3951);
        _4111 = (((_3959 * _3407) * _4074) + _3951);
        _4112 = (((_3960 * _3408) * _4074) + _3951);
        if (!(_3461 > 0.9900000095367432f)) {
          _4115 = saturate(_3627);
          _4116 = 1.0f - _3552;
          _4117 = 1.0f - _3635;
          _4118 = _4117 * _4117;
          _4121 = ((_4118 * _4118) * _4117) + _3635;
          _4122 = 1.0f - _4115;
          _4123 = _4122 * _4122;
          _4128 = 1.0f - _3630;
          _4129 = _4128 * _4128;
          if (DIFFUSE_BRDF_MODE >= 1.0f) {
            // EON Diffuse
            float _eon_LdotV = dot(float3(_3613, _3614, _3615), float3(_1003, _1004, _1005));
            _4156 = _4115 * EON_DiffuseScalar(_4115, _3630, _eon_LdotV, _3419);
          } else {
            // Vanilla Burley Diffuse
            _4156 = (_4115 * 0.31830987334251404f) * ((((_3635 * ((((_4116 * 34.5f) + -59.0f) * _4116) + 24.5f)) * exp2(-0.0f - (max(((_4116 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_3632)))) + _4121) + ((((1.0f - ((_4123 * _4123) * (_4122 * 0.75f))) * (1.0f - ((_4129 * _4129) * (_4128 * 0.75f)))) - _4121) * saturate((_4116 * 2.200000047683716f) + -0.5f)));
          }
          _4159 = saturate(1.0f - saturate(_3633));
          _4160 = _4159 * _4159;
          _4162 = (_4160 * _4160) * _4159;
          _4165 = _4162 * saturate(_3549 * 50.0f);
          _4166 = 1.0f - _4162;
          _4170 = (_4166 * _3548) + _4165;
          _4171 = (_4166 * _3549) + _4165;
          _4172 = (_4166 * _3550) + _4165;
          if (!(_3460 == 29)) {
            _4174 = saturate(_3628);
            _4175 = 1.0f - _3551;
            _4187 = (((_3632 * _3552) - _3632) * _3632) + 1.0f;
            _4191 = (_3552 / ((_4187 * _4187) * 3.1415927410125732f)) * (0.5f / ((((_3630 * _4175) + _3551) * _3628) + (_3630 * ((_3628 * _4175) + _3551))));
            _4202 = (max((_4191 * _4170), 0.0f) * _4174);
            _4203 = (max((_4191 * _4171), 0.0f) * _4174);
            _4204 = (max((_4191 * _4172), 0.0f) * _4174);
          } else {
            _4202 = 0.0f;
            _4203 = 0.0f;
            _4204 = 0.0f;
          }
          // RenoDX: Diffraction on Rough Surfaces
          if (DIFFRACTION > 0.0f && _3427 > 0.0f) {
            float3 _rndx_dShift = DiffractionShiftAndSpeckleCS(
              _3632, _3630, _rndx_spec_rough,
              float2(_105, _106), _117,
              float3(_3624, _3625, _3626),
              float3(_3494, _3495, _3496),
              float3(_3409, _3410, _3411)
            );
            float3 _rndx_dMod = lerp(1.0f, _rndx_dShift, DIFFRACTION * _3427);
            _4202 *= _rndx_dMod.x;
            _4203 *= _rndx_dMod.y;
            _4204 *= _rndx_dMod.z;
          }
          // RenoDX: Callisto Smooth Terminator
          if (SMOOTH_TERMINATOR > 0.0f) {
            float _rndx_c2 = CallistoSmoothTerminator(_4115, _3635, _3632, SMOOTH_TERMINATOR, 0.5f);
            _4156 *= _rndx_c2;
            _4202 *= _rndx_c2;
            _4203 *= _rndx_c2;
            _4204 *= _rndx_c2;
          }
          // RenoDX: Foliage Transmission
          if (FOLIAGE_TRANSMISSION > 0.0f && isFoliage) {
            FoliageTransmissionResult _ftResult = FoliageTransmission(
                float3(_1003, _1004, _1005),                  // V (view dir toward camera)
                float3(_3613, _3614, _3615),                  // L (light dir)
                float3(_3443, _3444, _3445),                  // N (surface normal)
                _3627,                                        // NdotL (raw)
                float3(_3409, _3410, _3411),                  // baseColor
                float3(_3379, _3380, _3381),                  // shadowColor
                float3(_3616, _3617, _3618),                  // lightLum
                FOLIAGE_TRANSMISSION_THICKNESS);              // thickness

            foliageTransR = _ftResult.transmission.x;
            foliageTransG = _ftResult.transmission.y;
            foliageTransB = _ftResult.transmission.z;

            if (_ftResult.diffuseScale > 0.0f) {
              _4156 *= _ftResult.diffuseScale;
            } else {
              float wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
              _4156 = max(0.0f, (_3627 + wrap) / (1.0f + wrap)) * 0.31830987334251404f * 0.75f;
            }
          }
          _4205 = (_3460 == 65);
          if (_3525) {
            if (_4205) {
              _4248 = max(9.999999974752427e-07f, _exposure2.x);
              _4257 = ((_4115 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_3494, _3495, _3496), float3(_1003, _1004, _1005)))) * 16.0f)) / (((_4248 * _4248) * 1e+06f) + 1.0f);
              _4271 = _4202;
              _4272 = _4203;
              _4273 = _4204;
              _4274 = ((((_4257 * _3409) - _4156) * _3459) + _4156);
              _4275 = ((((_4257 * _3410) - _4156) * _3459) + _4156);
              _4276 = ((((_4257 * _3411) - _4156) * _3459) + _4156);
            } else {
              _4212 = 1.0f - _3557;
              _4224 = (((_3632 * _3558) - _3632) * _3632) + 1.0f;
              _4228 = (_3558 / ((_4224 * _4224) * 3.1415927410125732f)) * (0.5f / ((((_3630 * _4212) + _3557) * _3628) + (_3630 * ((_3628 * _4212) + _3557))));
              _4235 = saturate(_3628) * 0.39990234375f;
              _4271 = ((max((_4228 * _4170), 0.0f) * _4235) + (_4202 * 0.60009765625f));
              _4272 = ((max((_4228 * _4171), 0.0f) * _4235) + (_4203 * 0.60009765625f));
              _4273 = ((max((_4228 * _4172), 0.0f) * _4235) + (_4204 * 0.60009765625f));
              _4274 = _4156;
              _4275 = _4156;
              _4276 = _4156;
            }
          } else {
            if (_4205) {
              _4248 = max(9.999999974752427e-07f, _exposure2.x);
              _4257 = ((_4115 * 50.26548385620117f) * exp2(log2(saturate(dot(float3(_3494, _3495, _3496), float3(_1003, _1004, _1005)))) * 16.0f)) / (((_4248 * _4248) * 1e+06f) + 1.0f);
              _4271 = _4202;
              _4272 = _4203;
              _4273 = _4204;
              _4274 = ((((_4257 * _3409) - _4156) * _3459) + _4156);
              _4275 = ((((_4257 * _3410) - _4156) * _3459) + _4156);
              _4276 = ((((_4257 * _3411) - _4156) * _3459) + _4156);
            } else {
              _4271 = _4202;
              _4272 = _4203;
              _4273 = _4204;
              _4274 = _4156;
              _4275 = _4156;
              _4276 = _4156;
            }
          }
        } else {
          _4271 = _3929;
          _4272 = _3930;
          _4273 = _3931;
          _4274 = _3932;
          _4275 = _3933;
          _4276 = _3934;
        }
        _4280 = min(-0.0f, (-0.0f - _4274));
        _4281 = min(-0.0f, (-0.0f - _4275));
        _4282 = min(-0.0f, (-0.0f - _4276));
        _4283 = -0.0f - _4280;
        _4284 = -0.0f - _4281;
        _4285 = -0.0f - _4282;
        _4287 = (_3461 > 0.0f);
        if (_4287) {
          _4321 = (_3926 - (_3926 * _3593));
          _4322 = (_3927 - (_3927 * _3593));
          _4323 = (_3928 - (_3928 * _3593));
          _4324 = (lerp(_4271, _4107, _3593));
          _4325 = (lerp(_4272, _4108, _3593));
          _4326 = (lerp(_4273, _4109, _3593));
          _4327 = (((_4280 + _4110) * _3593) - _4280);
          _4328 = (((_4281 + _4111) * _3593) - _4281);
          _4329 = (((_4282 + _4112) * _3593) - _4282);
        } else {
          _4321 = _3926;
          _4322 = _3927;
          _4323 = _3928;
          _4324 = _4271;
          _4325 = _4272;
          _4326 = _4273;
          _4327 = _4283;
          _4328 = _4284;
          _4329 = _4285;
        }
        _4330 = _4327 * _3406;
        _4331 = _4328 * _3407;
        _4332 = _4329 * _3408;
        _4333 = _4324 * _3406;
        _4334 = _4325 * _3407;
        _4335 = _4326 * _3408;
        if (_4287) {
          _4344 = _4321;
          _4345 = _4322;
          _4346 = _4323;
          _4347 = (_4333 + (_4104 * _3593));
          _4348 = (_4334 + (_4105 * _3593));
          _4349 = (_4335 + (_4106 * _3593));
          _4350 = _4330;
          _4351 = _4331;
          _4352 = _4332;
        } else {
          _4344 = _4321;
          _4345 = _4322;
          _4346 = _4323;
          _4347 = _4333;
          _4348 = _4334;
          _4349 = _4335;
          _4350 = _4330;
          _4351 = _4331;
          _4352 = _4332;
        }
      }
    } else {
      _4344 = _3926;
      _4345 = _3927;
      _4346 = _3928;
      _4347 = _3929;
      _4348 = _3930;
      _4349 = _3931;
      _4350 = _3932;
      _4351 = _3933;
      _4352 = _3934;
    }
    if (_3596) {
      _4356 = max(0.0f, (0.30000001192092896f - _3627)) * 0.23190687596797943f;
      _4364 = ((_4356 * _3406) + _4350);
      _4365 = ((_4356 * _3407) + _4351);
      _4366 = ((_4356 * _3408) + _4352);
    } else {
      _4364 = _4350;
      _4365 = _4351;
      _4366 = _4352;
    }
    _4368 = 1.0f - (_3633 * 0.8500000238418579f);
    if (_3525) {
      _4372 = max(4.0f, _3601);
      _4373 = _4372 * _4372;
      _4375 = exp2(_4373 * -225.4210968017578f);
      _4380 = exp2(_4373 * -29.807748794555664f);
      _4388 = exp2(_4373 * -7.714946269989014f);
      _4394 = exp2(_4373 * -2.544435739517212f);
      _4396 = _4394 * 0.007000000216066837f;
      _4401 = exp2(_4373 * -0.7249723672866821f);
      _4415 = saturate(dot(float3(_3613, _3614, _3615), float3((-0.0f - _219), _235, (-0.0f - _221))) + 0.30000001192092896f) * 0.31830987334251404f;
      _4703 = ((_4415 * ((((((_4380 * 0.10000000149011612f) + (_4375 * 0.2329999953508377f)) + (_4388 * 0.11800000071525574f)) + (_4394 * 0.11299999803304672f)) + (_4401 * 0.3580000102519989f)) + (exp2(_4373 * -0.19469568133354187f) * 0.07800000160932541f))) + _4364);
      _4704 = ((_4415 * (((((_4380 * 0.335999995470047f) + (_4375 * 0.45500001311302185f)) + (_4388 * 0.1979999989271164f)) + _4396) + (_4401 * 0.004000000189989805f))) + _4365);
      _4705 = ((_4415 * (((_4380 * 0.3440000116825104f) + (_4375 * 0.6489999890327454f)) + _4396)) + _4366);
      _4706 = _4703 * _3616;
      _4707 = _4704 * _3617;
      _4708 = _4705 * _3618;
      _4710 = (_4347 * _3616) * _3406;
      _4712 = (_4348 * _3617) * _3407;
      _4714 = (_4349 * _3618) * _3408;
      bool __branch_chain_4702;
      if (_3460 == 97) {
        _4731 = _4710;
        _4732 = _4712;
        _4733 = _4714;
        _4734 = _4706;
        _4735 = _4707;
        _4736 = _4708;
        _4737 = _4344;
        _4738 = _4345;
        _4739 = _4346;
        _4740 = _3406;
        _4741 = _3407;
        _4742 = _3408;
        __branch_chain_4702 = true;
      } else {
        _4717 = _4710;
        _4718 = _4712;
        _4719 = _4714;
        _4720 = _4706;
        _4721 = _4707;
        _4722 = _4708;
        _4723 = _4344;
        _4724 = _4345;
        _4725 = _4346;
        _4726 = _3406;
        _4727 = _3407;
        _4728 = _3408;
        if (_3460 == 98) {
          _4731 = _4717;
          _4732 = _4718;
          _4733 = _4719;
          _4734 = _4720;
          _4735 = _4721;
          _4736 = _4722;
          _4737 = _4723;
          _4738 = _4724;
          _4739 = _4725;
          _4740 = _4726;
          _4741 = _4727;
          _4742 = _4728;
          __branch_chain_4702 = true;
        } else {
          _4876 = _4720;
          _4877 = _4721;
          _4878 = _4722;
          _4879 = _4723;
          _4880 = _4724;
          _4881 = _4725;
          _4882 = _4717;
          _4883 = _4718;
          _4884 = _4719;
          __branch_chain_4702 = false;
        }
      }
      if (__branch_chain_4702) {
        if ((bool)(_117 < 1000.0f) && (bool)(_3107 == 0.0h)) {
          if (!(abs(_220) > 0.9900000095367432f)) {
            _4750 = -0.0f - _221;
            _4752 = rsqrt(dot(float3(_4750, 0.0f, _219), float3(_4750, 0.0f, _219)));
            _4756 = (_4752 * _4750);
            _4757 = (_4752 * _219);
          } else {
            _4756 = 1.0f;
            _4757 = 0.0f;
          }
          _4759 = -0.0f - (_220 * _4757);
          _4762 = (_4757 * _219) - (_4756 * _221);
          _4763 = _4756 * _220;
          _4765 = rsqrt(dot(float3(_4759, _4762, _4763), float3(_4759, _4762, _4763)));
          _4771 = _viewPos.x + _390;
          _4772 = _viewPos.z + _392;
          _4777 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4756, 0.0f, _4757), float3(_4771, _3194, _4772)), dot(float3((_4765 * _4759), (_4762 * _4765), (_4765 * _4763)), float3(_4771, _3194, _4772))), 0.0f);
          _4781 = _4777.x + -0.5f;
          _4782 = _4777.y + -0.5f;
          _4783 = _4777.z + -0.5f;
          _4785 = rsqrt(dot(float3(_4781, _4782, _4783), float3(_4781, _4782, _4783)));
          _4789 = (_4781 * _4785) + _3494;
          _4790 = (_4782 * _4785) + _3495;
          _4791 = (_4783 * _4785) + _3496;
          _4793 = rsqrt(dot(float3(_4789, _4790, _4791), float3(_4789, _4790, _4791)));
          _4794 = _4789 * _4793;
          _4795 = _4790 * _4793;
          _4796 = _4791 * _4793;
          _4808 = abs(((_98 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
          _4809 = abs(1.0f - ((_99 * 2.0f) * _bufferSizeAndInvSize.w));
          _4812 = saturate(_4808 * _4808);
          _4813 = saturate(_4809 * _4809);
          _4827 = dot(float3((-0.0f - _4794), (-0.0f - _4795), (-0.0f - _4796)), float3(_3613, _3614, _3615));
          _4829 = saturate(dot(float3(_4794, _4795, _4796), float3(_1003, _1004, _1005)));
          _4831 = saturate(1.0f - _3633);
          _4832 = _4831 * _4831;
          _4834 = (_4832 * _4832) * _4831;
          _4850 = 1.0f - ((_3632 * _3632) * 0.9998999834060669f);
          _4857 = (max((((3.18309866997879e-05f / (_4850 * _4850)) * (0.5f / ((((_4829 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4827) + (_4829 * ((_4827 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4834, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4827)) + (exp2(log2(saturate(dot(float3(_1003, _1004, _1005), float3(_4794, _4795, _4796)))) * 1024.0f) * 50.0f);
          _4862 = saturate(1.0f - (_117 * 0.0010000000474974513f)) * ((1.0f - ((_4813 * _4813) * (3.0f - (_4813 * 2.0f)))) * (1.0f - ((_4812 * _4812) * (3.0f - (_4812 * 2.0f)))));
          _4876 = _4734;
          _4877 = _4735;
          _4878 = _4736;
          _4879 = _4737;
          _4880 = _4738;
          _4881 = _4739;
          _4882 = ((((_4862 * _3616) * _4740) * _4857) + _4731);
          _4883 = ((((_4862 * _3617) * _4741) * _4857) + _4732);
          _4884 = ((((_4862 * _3618) * _4742) * _4857) + _4733);
        } else {
          _4876 = _4734;
          _4877 = _4735;
          _4878 = _4736;
          _4879 = _4737;
          _4880 = _4738;
          _4881 = _4739;
          _4882 = _4731;
          _4883 = _4732;
          _4884 = _4733;
        }
      }
    } else {
      if (_3638) {
        _4425 = dot(float3(_3409, _3410, _3411), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * _renderParams2.w;
        _4428 = _4425 + (_3405 - (_4425 * _3405));
        _4435 = (pow(_3406, 1.2000000476837158f));
        _4436 = (pow(_3407, 1.2000000476837158f));
        _4437 = (pow(_3408, 1.2000000476837158f));
        _4443 = saturate(abs(dot(float3(_3613, _3614, _3615), float3(_919, _920, _921))));
        _4452 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4443, _3419, saturate(sqrt(sqrt(_3409)))), 0.0f);
        _4455 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4443, _3419, saturate(sqrt(sqrt(_3410)))), 0.0f);
        _4458 = __3__36__0__0__g_hairDualScatteringLUT.SampleLevel(__3__40__0__0__g_samplerClamp, float3(_4443, _3419, saturate(sqrt(sqrt(_3411)))), 0.0f);
        _4467 = min(0.9900000095367432f, _4452.x);
        _4468 = min(0.9900000095367432f, _4455.x);
        _4469 = min(0.9900000095367432f, _4458.x);
        _4470 = min(0.9900000095367432f, _4452.y);
        _4471 = min(0.9900000095367432f, _4455.y);
        _4472 = min(0.9900000095367432f, _4458.y);
        _4473 = _4467 * _4467;
        _4474 = _4468 * _4468;
        _4475 = _4469 * _4469;
        _4476 = _4470 * _4470;
        _4477 = _4471 * _4471;
        _4478 = _4472 * _4472;
        _4479 = _4476 * _4470;
        _4480 = _4477 * _4471;
        _4481 = _4478 * _4472;
        _4482 = 1.0f - _4473;
        _4483 = 1.0f - _4474;
        _4484 = 1.0f - _4475;
        _4494 = _4482 * _4482;
        _4495 = _4483 * _4483;
        _4496 = _4484 * _4484;
        _4497 = _4494 * _4482;
        _4498 = _4495 * _4483;
        _4499 = _4496 * _4484;
        _4507 = min(max(_3419, 0.18000000715255737f), 0.6000000238418579f);
        _4508 = _4507 * _4507;
        _4509 = _4508 * 0.25f;
        _4510 = _4508 * 4.0f;
        _4512 = (_4468 + _4467) + _4469;
        _4513 = _4467 / _4512;
        _4514 = _4468 / _4512;
        _4515 = _4469 / _4512;
        _4516 = dot(float3(_4508, _4509, _4510), float3(_4513, _4514, _4515));
        _4517 = _4516 * _4516;
        _4521 = (asin(min(max(dot(float3(_919, _920, _921), float3(_1003, _1004, _1005)), -1.0f), 1.0f)) + asin(min(max(dot(float3(_919, _920, _921), float3(_3613, _3614, _3615)), -1.0f), 1.0f))) * 0.5f;
        _4522 = dot(float3(-0.07000000029802322f, 0.03500000014901161f, 0.14000000059604645f), float3(_4513, _4514, _4515));
        _4532 = _4522 * _4522;
        _4555 = (_4471 + _4470) + _4472;
        _4559 = dot(float3(_4508, _4509, _4510), float3((_4470 / _4555), (_4471 / _4555), (_4472 / _4555)));
        _4563 = sqrt((_4559 * _4559) + (_4517 * 2.0f));
        _4581 = (_4559 * 3.0f) + (_4516 * 2.0f);
        _4588 = (((_4479 + _4470) * ((_4473 * 0.699999988079071f) + 1.0f)) * _4563) / ((_4581 * _4479) + _4470);
        _4589 = (((_4480 + _4471) * ((_4474 * 0.699999988079071f) + 1.0f)) * _4563) / ((_4581 * _4480) + _4471);
        _4590 = (((_4481 + _4472) * ((_4475 * 0.699999988079071f) + 1.0f)) * _4563) / ((_4581 * _4481) + _4472);
        _4594 = _4521 - (((_4532 * (((_4473 * 4.0f) * _4476) + (_4494 * 2.0f))) * (1.0f - ((_4476 * 2.0f) / _4494))) / _4497);
        _4601 = _4521 - (((_4532 * (((_4474 * 4.0f) * _4477) + (_4495 * 2.0f))) * (1.0f - ((_4477 * 2.0f) / _4495))) / _4498);
        _4608 = _4521 - (((_4532 * (((_4475 * 4.0f) * _4478) + (_4496 * 2.0f))) * (1.0f - ((_4478 * 2.0f) / _4496))) / _4499);
        _4616 = (1.0f - _922) * 2.0999999046325684f;
        _4637 = (_922 * 0.31830987334251404f) * saturate(_3627);
        _4684 = _4435;
        _4685 = _4436;
        _4686 = _4437;
        _4687 = (((_4428 * _3616) * _4435) * ((((((_4479 * _4473) / _4497) + ((_4470 * _4473) / _4482)) * _4616) * exp2((((_4594 * _4594) * -0.5f) / ((_4588 * _4588) + _4517)) * 1.4426950216293335f)) + _4344));
        _4688 = (((_4428 * _3617) * _4436) * ((((((_4480 * _4474) / _4498) + ((_4471 * _4474) / _4483)) * _4616) * exp2((((_4601 * _4601) * -0.5f) / ((_4589 * _4589) + _4517)) * 1.4426950216293335f)) + _4345));
        _4689 = (((_4428 * _3618) * _4437) * ((((((_4481 * _4475) / _4499) + ((_4472 * _4475) / _4484)) * _4616) * exp2((((_4608 * _4608) * -0.5f) / ((_4590 * _4590) + _4517)) * 1.4426950216293335f)) + _4346));
        _4690 = (_4637 * _4435);
        _4691 = (_4637 * _4436);
        _4692 = (_4637 * _4437);
        _4717 = ((_4347 * _3616) * _4684);
        _4718 = ((_4348 * _3617) * _4685);
        _4719 = ((_4349 * _3618) * _4686);
        _4720 = (_4690 * _3616);
        _4721 = (_4691 * _3617);
        _4722 = (_4692 * _3618);
        _4723 = _4687;
        _4724 = _4688;
        _4725 = _4689;
        _4726 = _4684;
        _4727 = _4685;
        _4728 = _4686;
        if (_3460 == 98) {
          _4731 = _4717;
          _4732 = _4718;
          _4733 = _4719;
          _4734 = _4720;
          _4735 = _4721;
          _4736 = _4722;
          _4737 = _4723;
          _4738 = _4724;
          _4739 = _4725;
          _4740 = _4726;
          _4741 = _4727;
          _4742 = _4728;
          if ((bool)(_117 < 1000.0f) && (bool)(_3107 == 0.0h)) {
            if (!(abs(_220) > 0.9900000095367432f)) {
              _4750 = -0.0f - _221;
              _4752 = rsqrt(dot(float3(_4750, 0.0f, _219), float3(_4750, 0.0f, _219)));
              _4756 = (_4752 * _4750);
              _4757 = (_4752 * _219);
            } else {
              _4756 = 1.0f;
              _4757 = 0.0f;
            }
            _4759 = -0.0f - (_220 * _4757);
            _4762 = (_4757 * _219) - (_4756 * _221);
            _4763 = _4756 * _220;
            _4765 = rsqrt(dot(float3(_4759, _4762, _4763), float3(_4759, _4762, _4763)));
            _4771 = _viewPos.x + _390;
            _4772 = _viewPos.z + _392;
            _4777 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4756, 0.0f, _4757), float3(_4771, _3194, _4772)), dot(float3((_4765 * _4759), (_4762 * _4765), (_4765 * _4763)), float3(_4771, _3194, _4772))), 0.0f);
            _4781 = _4777.x + -0.5f;
            _4782 = _4777.y + -0.5f;
            _4783 = _4777.z + -0.5f;
            _4785 = rsqrt(dot(float3(_4781, _4782, _4783), float3(_4781, _4782, _4783)));
            _4789 = (_4781 * _4785) + _3494;
            _4790 = (_4782 * _4785) + _3495;
            _4791 = (_4783 * _4785) + _3496;
            _4793 = rsqrt(dot(float3(_4789, _4790, _4791), float3(_4789, _4790, _4791)));
            _4794 = _4789 * _4793;
            _4795 = _4790 * _4793;
            _4796 = _4791 * _4793;
            _4808 = abs(((_98 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
            _4809 = abs(1.0f - ((_99 * 2.0f) * _bufferSizeAndInvSize.w));
            _4812 = saturate(_4808 * _4808);
            _4813 = saturate(_4809 * _4809);
            _4827 = dot(float3((-0.0f - _4794), (-0.0f - _4795), (-0.0f - _4796)), float3(_3613, _3614, _3615));
            _4829 = saturate(dot(float3(_4794, _4795, _4796), float3(_1003, _1004, _1005)));
            _4831 = saturate(1.0f - _3633);
            _4832 = _4831 * _4831;
            _4834 = (_4832 * _4832) * _4831;
            _4850 = 1.0f - ((_3632 * _3632) * 0.9998999834060669f);
            _4857 = (max((((3.18309866997879e-05f / (_4850 * _4850)) * (0.5f / ((((_4829 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4827) + (_4829 * ((_4827 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4834, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4827)) + (exp2(log2(saturate(dot(float3(_1003, _1004, _1005), float3(_4794, _4795, _4796)))) * 1024.0f) * 50.0f);
            _4862 = saturate(1.0f - (_117 * 0.0010000000474974513f)) * ((1.0f - ((_4813 * _4813) * (3.0f - (_4813 * 2.0f)))) * (1.0f - ((_4812 * _4812) * (3.0f - (_4812 * 2.0f)))));
            _4876 = _4734;
            _4877 = _4735;
            _4878 = _4736;
            _4879 = _4737;
            _4880 = _4738;
            _4881 = _4739;
            _4882 = ((((_4862 * _3616) * _4740) * _4857) + _4731);
            _4883 = ((((_4862 * _3617) * _4741) * _4857) + _4732);
            _4884 = ((((_4862 * _3618) * _4742) * _4857) + _4733);
          } else {
            _4876 = _4734;
            _4877 = _4735;
            _4878 = _4736;
            _4879 = _4737;
            _4880 = _4738;
            _4881 = _4739;
            _4882 = _4731;
            _4883 = _4732;
            _4884 = _4733;
          }
        } else {
          _4876 = _4720;
          _4877 = _4721;
          _4878 = _4722;
          _4879 = _4723;
          _4880 = _4724;
          _4881 = _4725;
          _4882 = _4717;
          _4883 = _4718;
          _4884 = _4719;
        }
      } else {
        if (_3595) {
          if (_3460 == 97) {
            _4731 = ((_4347 * _3616) * _3406);
            _4732 = ((_4348 * _3617) * _3407);
            _4733 = ((_4349 * _3618) * _3408);
            _4734 = (_4364 * _3616);
            _4735 = (_4365 * _3617);
            _4736 = (_4366 * _3618);
            _4737 = _4344;
            _4738 = _4345;
            _4739 = _4346;
            _4740 = _3406;
            _4741 = _3407;
            _4742 = _3408;
            if ((bool)(_117 < 1000.0f) && (bool)(_3107 == 0.0h)) {
              if (!(abs(_220) > 0.9900000095367432f)) {
                _4750 = -0.0f - _221;
                _4752 = rsqrt(dot(float3(_4750, 0.0f, _219), float3(_4750, 0.0f, _219)));
                _4756 = (_4752 * _4750);
                _4757 = (_4752 * _219);
              } else {
                _4756 = 1.0f;
                _4757 = 0.0f;
              }
              _4759 = -0.0f - (_220 * _4757);
              _4762 = (_4757 * _219) - (_4756 * _221);
              _4763 = _4756 * _220;
              _4765 = rsqrt(dot(float3(_4759, _4762, _4763), float3(_4759, _4762, _4763)));
              _4771 = _viewPos.x + _390;
              _4772 = _viewPos.z + _392;
              _4777 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4756, 0.0f, _4757), float3(_4771, _3194, _4772)), dot(float3((_4765 * _4759), (_4762 * _4765), (_4765 * _4763)), float3(_4771, _3194, _4772))), 0.0f);
              _4781 = _4777.x + -0.5f;
              _4782 = _4777.y + -0.5f;
              _4783 = _4777.z + -0.5f;
              _4785 = rsqrt(dot(float3(_4781, _4782, _4783), float3(_4781, _4782, _4783)));
              _4789 = (_4781 * _4785) + _3494;
              _4790 = (_4782 * _4785) + _3495;
              _4791 = (_4783 * _4785) + _3496;
              _4793 = rsqrt(dot(float3(_4789, _4790, _4791), float3(_4789, _4790, _4791)));
              _4794 = _4789 * _4793;
              _4795 = _4790 * _4793;
              _4796 = _4791 * _4793;
              _4808 = abs(((_98 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
              _4809 = abs(1.0f - ((_99 * 2.0f) * _bufferSizeAndInvSize.w));
              _4812 = saturate(_4808 * _4808);
              _4813 = saturate(_4809 * _4809);
              _4827 = dot(float3((-0.0f - _4794), (-0.0f - _4795), (-0.0f - _4796)), float3(_3613, _3614, _3615));
              _4829 = saturate(dot(float3(_4794, _4795, _4796), float3(_1003, _1004, _1005)));
              _4831 = saturate(1.0f - _3633);
              _4832 = _4831 * _4831;
              _4834 = (_4832 * _4832) * _4831;
              _4850 = 1.0f - ((_3632 * _3632) * 0.9998999834060669f);
              _4857 = (max((((3.18309866997879e-05f / (_4850 * _4850)) * (0.5f / ((((_4829 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4827) + (_4829 * ((_4827 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4834, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4827)) + (exp2(log2(saturate(dot(float3(_1003, _1004, _1005), float3(_4794, _4795, _4796)))) * 1024.0f) * 50.0f);
              _4862 = saturate(1.0f - (_117 * 0.0010000000474974513f)) * ((1.0f - ((_4813 * _4813) * (3.0f - (_4813 * 2.0f)))) * (1.0f - ((_4812 * _4812) * (3.0f - (_4812 * 2.0f)))));
              _4876 = _4734;
              _4877 = _4735;
              _4878 = _4736;
              _4879 = _4737;
              _4880 = _4738;
              _4881 = _4739;
              _4882 = ((((_4862 * _3616) * _4740) * _4857) + _4731);
              _4883 = ((((_4862 * _3617) * _4741) * _4857) + _4732);
              _4884 = ((((_4862 * _3618) * _4742) * _4857) + _4733);
            } else {
              _4876 = _4734;
              _4877 = _4735;
              _4878 = _4736;
              _4879 = _4737;
              _4880 = _4738;
              _4881 = _4739;
              _4882 = _4731;
              _4883 = _4732;
              _4884 = _4733;
            }
          } else {
            if ((uint)(_3460 + -105) < (uint)2) {
              _4684 = _3406;
              _4685 = _3407;
              _4686 = _3408;
              _4687 = _4344;
              _4688 = _4345;
              _4689 = _4346;
              _4690 = _4364;
              _4691 = _4365;
              _4692 = _4366;
              _4717 = ((_4347 * _3616) * _4684);
              _4718 = ((_4348 * _3617) * _4685);
              _4719 = ((_4349 * _3618) * _4686);
              _4720 = (_4690 * _3616);
              _4721 = (_4691 * _3617);
              _4722 = (_4692 * _3618);
              _4723 = _4687;
              _4724 = _4688;
              _4725 = _4689;
              _4726 = _4684;
              _4727 = _4685;
              _4728 = _4686;
              if (_3460 == 98) {
                _4731 = _4717;
                _4732 = _4718;
                _4733 = _4719;
                _4734 = _4720;
                _4735 = _4721;
                _4736 = _4722;
                _4737 = _4723;
                _4738 = _4724;
                _4739 = _4725;
                _4740 = _4726;
                _4741 = _4727;
                _4742 = _4728;
                if ((bool)(_117 < 1000.0f) && (bool)(_3107 == 0.0h)) {
                  if (!(abs(_220) > 0.9900000095367432f)) {
                    _4750 = -0.0f - _221;
                    _4752 = rsqrt(dot(float3(_4750, 0.0f, _219), float3(_4750, 0.0f, _219)));
                    _4756 = (_4752 * _4750);
                    _4757 = (_4752 * _219);
                  } else {
                    _4756 = 1.0f;
                    _4757 = 0.0f;
                  }
                  _4759 = -0.0f - (_220 * _4757);
                  _4762 = (_4757 * _219) - (_4756 * _221);
                  _4763 = _4756 * _220;
                  _4765 = rsqrt(dot(float3(_4759, _4762, _4763), float3(_4759, _4762, _4763)));
                  _4771 = _viewPos.x + _390;
                  _4772 = _viewPos.z + _392;
                  _4777 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4756, 0.0f, _4757), float3(_4771, _3194, _4772)), dot(float3((_4765 * _4759), (_4762 * _4765), (_4765 * _4763)), float3(_4771, _3194, _4772))), 0.0f);
                  _4781 = _4777.x + -0.5f;
                  _4782 = _4777.y + -0.5f;
                  _4783 = _4777.z + -0.5f;
                  _4785 = rsqrt(dot(float3(_4781, _4782, _4783), float3(_4781, _4782, _4783)));
                  _4789 = (_4781 * _4785) + _3494;
                  _4790 = (_4782 * _4785) + _3495;
                  _4791 = (_4783 * _4785) + _3496;
                  _4793 = rsqrt(dot(float3(_4789, _4790, _4791), float3(_4789, _4790, _4791)));
                  _4794 = _4789 * _4793;
                  _4795 = _4790 * _4793;
                  _4796 = _4791 * _4793;
                  _4808 = abs(((_98 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
                  _4809 = abs(1.0f - ((_99 * 2.0f) * _bufferSizeAndInvSize.w));
                  _4812 = saturate(_4808 * _4808);
                  _4813 = saturate(_4809 * _4809);
                  _4827 = dot(float3((-0.0f - _4794), (-0.0f - _4795), (-0.0f - _4796)), float3(_3613, _3614, _3615));
                  _4829 = saturate(dot(float3(_4794, _4795, _4796), float3(_1003, _1004, _1005)));
                  _4831 = saturate(1.0f - _3633);
                  _4832 = _4831 * _4831;
                  _4834 = (_4832 * _4832) * _4831;
                  _4850 = 1.0f - ((_3632 * _3632) * 0.9998999834060669f);
                  _4857 = (max((((3.18309866997879e-05f / (_4850 * _4850)) * (0.5f / ((((_4829 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4827) + (_4829 * ((_4827 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4834, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4827)) + (exp2(log2(saturate(dot(float3(_1003, _1004, _1005), float3(_4794, _4795, _4796)))) * 1024.0f) * 50.0f);
                  _4862 = saturate(1.0f - (_117 * 0.0010000000474974513f)) * ((1.0f - ((_4813 * _4813) * (3.0f - (_4813 * 2.0f)))) * (1.0f - ((_4812 * _4812) * (3.0f - (_4812 * 2.0f)))));
                  _4876 = _4734;
                  _4877 = _4735;
                  _4878 = _4736;
                  _4879 = _4737;
                  _4880 = _4738;
                  _4881 = _4739;
                  _4882 = ((((_4862 * _3616) * _4740) * _4857) + _4731);
                  _4883 = ((((_4862 * _3617) * _4741) * _4857) + _4732);
                  _4884 = ((((_4862 * _3618) * _4742) * _4857) + _4733);
                } else {
                  _4876 = _4734;
                  _4877 = _4735;
                  _4878 = _4736;
                  _4879 = _4737;
                  _4880 = _4738;
                  _4881 = _4739;
                  _4882 = _4731;
                  _4883 = _4732;
                  _4884 = _4733;
                }
              } else {
                _4876 = _4720;
                _4877 = _4721;
                _4878 = _4722;
                _4879 = _4723;
                _4880 = _4724;
                _4881 = _4725;
                _4882 = _4717;
                _4883 = _4718;
                _4884 = _4719;
              }
            } else {
              if (_3601 < 999.9000244140625f) {
                _4668 = ((max(0.0020000000949949026f, _3601) * 0.4000000059604645f) / ((_3459 * 100.0f) + 0.10000000149011612f));
              } else {
                _4668 = 1000.0f;
              }
              _4669 = _4668 * _4668;
              _4679 = (((_3459 * 0.25f) * (0.022082746028900146f / (_4368 * _4368))) * max(0.0f, (0.30000001192092896f - _3627))) * ((exp2(_4669 * -0.48089835047721863f) * 3.0f) + exp2(_4669 * -1.4426950216293335f));
              _4703 = (_4679 + _4364);
              _4704 = (_4679 + _4365);
              _4705 = (_4679 + _4366);
              _4706 = _4703 * _3616;
              _4707 = _4704 * _3617;
              _4708 = _4705 * _3618;
              _4710 = (_4347 * _3616) * _3406;
              _4712 = (_4348 * _3617) * _3407;
              _4714 = (_4349 * _3618) * _3408;
              bool __branch_chain_4702;
              if (_3460 == 97) {
                _4731 = _4710;
                _4732 = _4712;
                _4733 = _4714;
                _4734 = _4706;
                _4735 = _4707;
                _4736 = _4708;
                _4737 = _4344;
                _4738 = _4345;
                _4739 = _4346;
                _4740 = _3406;
                _4741 = _3407;
                _4742 = _3408;
                __branch_chain_4702 = true;
              } else {
                _4717 = _4710;
                _4718 = _4712;
                _4719 = _4714;
                _4720 = _4706;
                _4721 = _4707;
                _4722 = _4708;
                _4723 = _4344;
                _4724 = _4345;
                _4725 = _4346;
                _4726 = _3406;
                _4727 = _3407;
                _4728 = _3408;
                if (_3460 == 98) {
                  _4731 = _4717;
                  _4732 = _4718;
                  _4733 = _4719;
                  _4734 = _4720;
                  _4735 = _4721;
                  _4736 = _4722;
                  _4737 = _4723;
                  _4738 = _4724;
                  _4739 = _4725;
                  _4740 = _4726;
                  _4741 = _4727;
                  _4742 = _4728;
                  __branch_chain_4702 = true;
                } else {
                  _4876 = _4720;
                  _4877 = _4721;
                  _4878 = _4722;
                  _4879 = _4723;
                  _4880 = _4724;
                  _4881 = _4725;
                  _4882 = _4717;
                  _4883 = _4718;
                  _4884 = _4719;
                  __branch_chain_4702 = false;
                }
              }
              if (__branch_chain_4702) {
                if ((bool)(_117 < 1000.0f) && (bool)(_3107 == 0.0h)) {
                  if (!(abs(_220) > 0.9900000095367432f)) {
                    _4750 = -0.0f - _221;
                    _4752 = rsqrt(dot(float3(_4750, 0.0f, _219), float3(_4750, 0.0f, _219)));
                    _4756 = (_4752 * _4750);
                    _4757 = (_4752 * _219);
                  } else {
                    _4756 = 1.0f;
                    _4757 = 0.0f;
                  }
                  _4759 = -0.0f - (_220 * _4757);
                  _4762 = (_4757 * _219) - (_4756 * _221);
                  _4763 = _4756 * _220;
                  _4765 = rsqrt(dot(float3(_4759, _4762, _4763), float3(_4759, _4762, _4763)));
                  _4771 = _viewPos.x + _390;
                  _4772 = _viewPos.z + _392;
                  _4777 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4756, 0.0f, _4757), float3(_4771, _3194, _4772)), dot(float3((_4765 * _4759), (_4762 * _4765), (_4765 * _4763)), float3(_4771, _3194, _4772))), 0.0f);
                  _4781 = _4777.x + -0.5f;
                  _4782 = _4777.y + -0.5f;
                  _4783 = _4777.z + -0.5f;
                  _4785 = rsqrt(dot(float3(_4781, _4782, _4783), float3(_4781, _4782, _4783)));
                  _4789 = (_4781 * _4785) + _3494;
                  _4790 = (_4782 * _4785) + _3495;
                  _4791 = (_4783 * _4785) + _3496;
                  _4793 = rsqrt(dot(float3(_4789, _4790, _4791), float3(_4789, _4790, _4791)));
                  _4794 = _4789 * _4793;
                  _4795 = _4790 * _4793;
                  _4796 = _4791 * _4793;
                  _4808 = abs(((_98 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
                  _4809 = abs(1.0f - ((_99 * 2.0f) * _bufferSizeAndInvSize.w));
                  _4812 = saturate(_4808 * _4808);
                  _4813 = saturate(_4809 * _4809);
                  _4827 = dot(float3((-0.0f - _4794), (-0.0f - _4795), (-0.0f - _4796)), float3(_3613, _3614, _3615));
                  _4829 = saturate(dot(float3(_4794, _4795, _4796), float3(_1003, _1004, _1005)));
                  _4831 = saturate(1.0f - _3633);
                  _4832 = _4831 * _4831;
                  _4834 = (_4832 * _4832) * _4831;
                  _4850 = 1.0f - ((_3632 * _3632) * 0.9998999834060669f);
                  _4857 = (max((((3.18309866997879e-05f / (_4850 * _4850)) * (0.5f / ((((_4829 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4827) + (_4829 * ((_4827 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4834, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4827)) + (exp2(log2(saturate(dot(float3(_1003, _1004, _1005), float3(_4794, _4795, _4796)))) * 1024.0f) * 50.0f);
                  _4862 = saturate(1.0f - (_117 * 0.0010000000474974513f)) * ((1.0f - ((_4813 * _4813) * (3.0f - (_4813 * 2.0f)))) * (1.0f - ((_4812 * _4812) * (3.0f - (_4812 * 2.0f)))));
                  _4876 = _4734;
                  _4877 = _4735;
                  _4878 = _4736;
                  _4879 = _4737;
                  _4880 = _4738;
                  _4881 = _4739;
                  _4882 = ((((_4862 * _3616) * _4740) * _4857) + _4731);
                  _4883 = ((((_4862 * _3617) * _4741) * _4857) + _4732);
                  _4884 = ((((_4862 * _3618) * _4742) * _4857) + _4733);
                } else {
                  _4876 = _4734;
                  _4877 = _4735;
                  _4878 = _4736;
                  _4879 = _4737;
                  _4880 = _4738;
                  _4881 = _4739;
                  _4882 = _4731;
                  _4883 = _4732;
                  _4884 = _4733;
                }
              }
            }
          }
        } else {
          _4703 = _4364;
          _4704 = _4365;
          _4705 = _4366;
          _4706 = _4703 * _3616;
          _4707 = _4704 * _3617;
          _4708 = _4705 * _3618;
          _4710 = (_4347 * _3616) * _3406;
          _4712 = (_4348 * _3617) * _3407;
          _4714 = (_4349 * _3618) * _3408;
          bool __branch_chain_4702;
          if (_3460 == 97) {
            _4731 = _4710;
            _4732 = _4712;
            _4733 = _4714;
            _4734 = _4706;
            _4735 = _4707;
            _4736 = _4708;
            _4737 = _4344;
            _4738 = _4345;
            _4739 = _4346;
            _4740 = _3406;
            _4741 = _3407;
            _4742 = _3408;
            __branch_chain_4702 = true;
          } else {
            _4717 = _4710;
            _4718 = _4712;
            _4719 = _4714;
            _4720 = _4706;
            _4721 = _4707;
            _4722 = _4708;
            _4723 = _4344;
            _4724 = _4345;
            _4725 = _4346;
            _4726 = _3406;
            _4727 = _3407;
            _4728 = _3408;
            if (_3460 == 98) {
              _4731 = _4717;
              _4732 = _4718;
              _4733 = _4719;
              _4734 = _4720;
              _4735 = _4721;
              _4736 = _4722;
              _4737 = _4723;
              _4738 = _4724;
              _4739 = _4725;
              _4740 = _4726;
              _4741 = _4727;
              _4742 = _4728;
              __branch_chain_4702 = true;
            } else {
              _4876 = _4720;
              _4877 = _4721;
              _4878 = _4722;
              _4879 = _4723;
              _4880 = _4724;
              _4881 = _4725;
              _4882 = _4717;
              _4883 = _4718;
              _4884 = _4719;
              __branch_chain_4702 = false;
            }
          }
          if (__branch_chain_4702) {
            if ((bool)(_117 < 1000.0f) && (bool)(_3107 == 0.0h)) {
              if (!(abs(_220) > 0.9900000095367432f)) {
                _4750 = -0.0f - _221;
                _4752 = rsqrt(dot(float3(_4750, 0.0f, _219), float3(_4750, 0.0f, _219)));
                _4756 = (_4752 * _4750);
                _4757 = (_4752 * _219);
              } else {
                _4756 = 1.0f;
                _4757 = 0.0f;
              }
              _4759 = -0.0f - (_220 * _4757);
              _4762 = (_4757 * _219) - (_4756 * _221);
              _4763 = _4756 * _220;
              _4765 = rsqrt(dot(float3(_4759, _4762, _4763), float3(_4759, _4762, _4763)));
              _4771 = _viewPos.x + _390;
              _4772 = _viewPos.z + _392;
              _4777 = __3__36__0__0__g_blueNoise.SampleLevel(__0__4__0__0__g_staticBilinearWrap, float2(dot(float3(_4756, 0.0f, _4757), float3(_4771, _3194, _4772)), dot(float3((_4765 * _4759), (_4762 * _4765), (_4765 * _4763)), float3(_4771, _3194, _4772))), 0.0f);
              _4781 = _4777.x + -0.5f;
              _4782 = _4777.y + -0.5f;
              _4783 = _4777.z + -0.5f;
              _4785 = rsqrt(dot(float3(_4781, _4782, _4783), float3(_4781, _4782, _4783)));
              _4789 = (_4781 * _4785) + _3494;
              _4790 = (_4782 * _4785) + _3495;
              _4791 = (_4783 * _4785) + _3496;
              _4793 = rsqrt(dot(float3(_4789, _4790, _4791), float3(_4789, _4790, _4791)));
              _4794 = _4789 * _4793;
              _4795 = _4790 * _4793;
              _4796 = _4791 * _4793;
              _4808 = abs(((_98 * 2.0f) * _bufferSizeAndInvSize.z) + -1.0f);
              _4809 = abs(1.0f - ((_99 * 2.0f) * _bufferSizeAndInvSize.w));
              _4812 = saturate(_4808 * _4808);
              _4813 = saturate(_4809 * _4809);
              _4827 = dot(float3((-0.0f - _4794), (-0.0f - _4795), (-0.0f - _4796)), float3(_3613, _3614, _3615));
              _4829 = saturate(dot(float3(_4794, _4795, _4796), float3(_1003, _1004, _1005)));
              _4831 = saturate(1.0f - _3633);
              _4832 = _4831 * _4831;
              _4834 = (_4832 * _4832) * _4831;
              _4850 = 1.0f - ((_3632 * _3632) * 0.9998999834060669f);
              _4857 = (max((((3.18309866997879e-05f / (_4850 * _4850)) * (0.5f / ((((_4829 * 0.9998999834060669f) + 9.999999747378752e-05f) * _4827) + (_4829 * ((_4827 * 0.9998999834060669f) + 9.999999747378752e-05f))))) * (lerp(_4834, 1.0f, 0.07999999821186066f))), 0.0f) * saturate(_4827)) + (exp2(log2(saturate(dot(float3(_1003, _1004, _1005), float3(_4794, _4795, _4796)))) * 1024.0f) * 50.0f);
              _4862 = saturate(1.0f - (_117 * 0.0010000000474974513f)) * ((1.0f - ((_4813 * _4813) * (3.0f - (_4813 * 2.0f)))) * (1.0f - ((_4812 * _4812) * (3.0f - (_4812 * 2.0f)))));
              _4876 = _4734;
              _4877 = _4735;
              _4878 = _4736;
              _4879 = _4737;
              _4880 = _4738;
              _4881 = _4739;
              _4882 = ((((_4862 * _3616) * _4740) * _4857) + _4731);
              _4883 = ((((_4862 * _3617) * _4741) * _4857) + _4732);
              _4884 = ((((_4862 * _3618) * _4742) * _4857) + _4733);
            } else {
              _4876 = _4734;
              _4877 = _4735;
              _4878 = _4736;
              _4879 = _4737;
              _4880 = _4738;
              _4881 = _4739;
              _4882 = _4731;
              _4883 = _4732;
              _4884 = _4733;
            }
          }
        }
      }
    }
    _4891 = _4876 + _3108 + foliageTransR;
    _4892 = _4877 + _3109 + foliageTransG;
    _4893 = _4878 + _3110 + foliageTransB;
    _4896 = _frameNumber.x * 13;
    [branch]
    if (((((uint)(_4896 + _95)) | ((uint)(_4896 + _97))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((uint)(_95 >> 5)), ((uint)(_97 >> 5)))] = float4((half)(half(_4891)), (half)(half(_4892)), (half)(half(_4893)), 1.0f);
    }
    _4911 = ((uint)(_3460 & 24) > (uint)23);
    if (_3528) {
      _4928 = saturate(exp2((_3523 * _3523) * (_117 * -0.005770780146121979f)));
    } else {
      _4928 = select((_cavityParams.z > 0.0f), select(_176, 0.0f, _992), 1.0f);
    }
    _4943 = select(_3525, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _4928) * select((_175 && _4911), (1.0f - _992), 1.0f)));
    _4947 = min(60000.0f, (_4943 * (((_2819 * _2575) * _2824) - min(0.0f, (-0.0f - _4882)))));
    _4948 = min(60000.0f, (_4943 * (((_2820 * _2576) * _2824) - min(0.0f, (-0.0f - _4883)))));
    _4949 = min(60000.0f, (_4943 * (((_2821 * _2577) * _2824) - min(0.0f, (-0.0f - _4884)))));
    _4952 = 1.0f - _renderParams.x;
    _4959 = half((_renderParams.x * _3409) + _4952);
    _4960 = half((_renderParams.x * _3410) + _4952);
    _4961 = half((_renderParams.x * _3411) + _4952);
    if (_3525 && (bool)(_renderParams2.x == 0.0f)) {
      _4977 = (half)(exp2((half)((half)(log2(_4959)) * 0.5h)));
      _4978 = (half)(exp2((half)((half)(log2(_4960)) * 0.5h)));
      _4979 = (half)(exp2((half)((half)(log2(_4961)) * 0.5h)));
    } else {
      _4977 = _4959;
      _4978 = _4960;
      _4979 = _4961;
    }
    _4981 = _3559 || (bool)(_3460 == 55);
    _4982 = select(_4981, 0.0f, _3107);
    _4983 = float(_4977);
    _4984 = float(_4978);
    _4985 = float(_4979);
    if (_3497) {
      _4992 = saturate(((_4984 + _4983) + _4985) * 1.2000000476837158f);
    } else {
      _4992 = 1.0f;
    }
    _4993 = float(_4982);
    _4999 = (0.699999988079071f / min(max(max(max(_4983, _4984), _4985), 0.009999999776482582f), 0.699999988079071f)) * _4992;
    _5006 = ((_4999 * _4983) + -0.03999999910593033f) * _4993;
    _5007 = ((_4999 * _4984) + -0.03999999910593033f) * _4993;
    _5008 = ((_4999 * _4985) + -0.03999999910593033f) * _4993;
    _5009 = _5006 + 0.03999999910593033f;
    _5010 = _5007 + 0.03999999910593033f;
    _5011 = _5008 + 0.03999999910593033f;
    if (_3554 || ((bool)(_3637 || ((bool)(_3636 || _4981))))) {
      _5020 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__3__40__0__0__g_samplerClamp, float2(min(0.9900000095367432f, _1011), (1.0f - max(0.019999999552965164f, float(_158)))), 0.0f);
      _5024 = _5020.x;
      _5025 = _5020.y;
    } else {
      _5024 = _2817;
      _5025 = _2818;
    }
    _5029 = (_5024 * _5009) + _5025;
    _5030 = (_5024 * _5010) + _5025;
    _5031 = (_5024 * _5011) + _5025;
    _5033 = (1.0f - _5024) - _5025;
    _5040 = ((0.9599999785423279f - _5006) * 0.0476190485060215f) + _5009;
    _5041 = ((0.9599999785423279f - _5007) * 0.0476190485060215f) + _5010;
    _5042 = ((0.9599999785423279f - _5008) * 0.0476190485060215f) + _5011;
    _5059 = saturate(1.0f - _3102);
    _5060 = (((_5029 * _5040) / (1.0f - (_5033 * _5040))) * _5033) * _5059;
    _5061 = (((_5030 * _5041) / (1.0f - (_5033 * _5041))) * _5033) * _5059;
    _5062 = (((_5031 * _5042) / (1.0f - (_5033 * _5042))) * _5033) * _5059;
    _5073 = float(1.0h - _4982);
    _5083 = half(((_4983 * _5073) * saturate((1.0f - _5029) - _5060)) + _5060);
    _5084 = half(((_4984 * _5073) * saturate((1.0f - _5030) - _5061)) + _5061);
    _5085 = half(((_4985 * _5073) * saturate((1.0f - _5031) - _5062)) + _5062);
    _5087 = float(_5083);
    _5088 = float(_5084);
    _5089 = float(_5085);
    if (_3460 == 65) {
      _5093 = max(9.999999974752427e-07f, _exposure2.x);
      _5101 = ((pow(_3630, 16.0f)) * 50.26548385620117f) / (((_5093 * _5093) * 1e+06f) + 1.0f);
      _5118 = (((((_5087 * _4891) * _5101) - _4891) * _960) + _4891);
      _5119 = (((((_5088 * _4892) * _5101) - _4892) * _960) + _4892);
      _5120 = (((((_5089 * _4893) * _5101) - _4893) * _960) + _4893);
    } else {
      _5118 = _4891;
      _5119 = _4892;
      _5120 = _4893;
    }
    _5123 = __3__36__0__0__g_caustic.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_105, _106), 0.0f);
    _5125 = _5123.x * 0.31830987334251404f;
    _5135 = (min(65535.0f, _4879) + _3111) + (((_5125 * _3397) + _5118) * _5087);
    _5136 = (min(65535.0f, _4880) + _3112) + (((_5125 * _3398) + _5119) * _5088);
    _5137 = (min(65535.0f, _4881) + _3113) + (((_5125 * _3399) + _5120) * _5089);
    _5166 = exp2((saturate(_420) * 20.0f) + -8.0f) + -0.00390625f;
    _5167 = _5166 * select((_417 < 0.040449999272823334f), (_417 * 0.07739938050508499f), exp2(log2((_417 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5168 = _5166 * select((_418 < 0.040449999272823334f), (_418 * 0.07739938050508499f), exp2(log2((_418 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5169 = _5166 * select((_419 < 0.040449999272823334f), (_419 * 0.07739938050508499f), exp2(log2((_419 + 0.054999999701976776f) * 0.9478673338890076f) * 2.4000000953674316f));
    _5182 = ((_5167 * 0.6131200194358826f) + (_5168 * 0.3395099937915802f)) + (_5169 * 0.047370001673698425f);
    _5183 = ((_5167 * 0.07020000368356705f) + (_5168 * 0.9163600206375122f)) + (_5169 * 0.013450000435113907f);
    _5184 = ((_5167 * 0.02061999961733818f) + (_5168 * 0.10958000272512436f)) + (_5169 * 0.8697999715805054f);
    if (_346) {
      _5190 = (_5182 + _5135);
      _5191 = (_5183 + _5136);
      _5192 = (_5184 + _5137);
    } else {
      _5190 = _5135;
      _5191 = _5136;
      _5192 = _5137;
    }
    _5196 = _5190 + (_4947 * _4993);
    _5197 = _5191 + (_4948 * _4993);
    _5198 = _5192 + (_4949 * _4993);
    _5220 = (((QuadReadLaneAt(_5196, 1) + QuadReadLaneAt(_5196, 0)) + QuadReadLaneAt(_5196, 2)) + QuadReadLaneAt(_5196, 3)) * 0.25f;
    _5221 = (((QuadReadLaneAt(_5197, 1) + QuadReadLaneAt(_5197, 0)) + QuadReadLaneAt(_5197, 2)) + QuadReadLaneAt(_5197, 3)) * 0.25f;
    _5222 = (((QuadReadLaneAt(_5198, 1) + QuadReadLaneAt(_5198, 0)) + QuadReadLaneAt(_5198, 2)) + QuadReadLaneAt(_5198, 3)) * 0.25f;
    [branch]
    if (((_97 | _95) & 1) == 0) {
      _5227 = dot(float3(_5220, _5221, _5222), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((uint)(_95 >> 1)), ((uint)(_97 >> 1)))] = float4(min(60000.0f, _5220), min(60000.0f, _5221), min(60000.0f, _5222), min(60000.0f, select((_1592 != 0), (-0.0f - _5227), _5227)));
    }
    if (_4911) {
      _5249 = ((bool)(_4982 == 0.0h) && ((bool)(!(((bool)((bool)(_5083 != 0.0h) && (bool)(_5084 != 0.0h))) && (bool)(_5085 != 0.0h)))));
    } else {
      _5249 = false;
    }
    if (((bool)(_4911 || ((bool)((bool)(_3460 == 96) || ((bool)(_3637 || (bool)((_3460 & -4) == 64))))))) || ((bool)((bool)(_117 <= 10.0f) && _3554))) {
      __3__38__0__1__g_sceneSpecularUAV[int2(_95, _97)] = float4(((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _4947)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _4948)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _4949)))))), ((half)(-0.0h - (half)(half(min(0.0f, (-0.0f - _2585)))))));
      _5282 = _5190;
      _5283 = _5191;
      _5284 = _5192;
    } else {
      _5282 = (_5190 + _4947);
      _5283 = (_5191 + _4948);
      _5284 = (_5192 + _4949);
    }
    if (!((bool)((uint)(_3460 + -53) < (uint)15) || ((bool)(!_346)))) {
      _5290 = dot(float3(_5182, _5183, _5184), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _5294 = max((max(_5290, 1.0f) / max(_5290, 0.10000000149011612f)), 0.0f);
      _5305 = ((_5282 - _5182) + (_5294 * _5182));
      _5306 = ((_5283 - _5183) + (_5294 * _5183));
      _5307 = ((_5284 - _5184) + (_5294 * _5184));
    } else {
      _5305 = _5282;
      _5306 = _5283;
      _5307 = _5284;
    }
    _5308 = min(60000.0f, _5305);
    _5309 = min(60000.0f, _5306);
    _5310 = min(60000.0f, _5307);
    [branch]
    if (_5249) {
      _5313 = __3__38__0__1__g_sceneColorUAV.Load(int2(_95, _97));
      _5321 = (_5313.x + _5308);
      _5322 = (_5313.y + _5309);
      _5323 = (_5313.z + _5310);
    } else {
      _5321 = _5308;
      _5322 = _5309;
      _5323 = _5310;
    }
    if (!(_renderParams.y == 0.0f)) {
      _5332 = dot(float3(_5321, _5322, _5323), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _5333 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _5332);
      _5337 = max(9.999999717180685e-10f, _5332);
      _5342 = ((_5333 * _5321) / _5337);
      _5343 = ((_5333 * _5322) / _5337);
      _5344 = ((_5333 * _5323) / _5337);
    } else {
      _5342 = _5321;
      _5343 = _5322;
      _5344 = _5323;
    }
    // RenoDX: Foliage AO on direct light — applied at final output to avoid
    // fuckery with the data flow graph of _3406/_3407/_3408 (30+ downstream references).
    // Take shadow colour to determine direct light ratio
    if (FOLIAGE_AO_STRENGTH > 0.0f && (uint)(_113 - 12) < 7u) {
      half4 _rndx_shadow = __3__36__0__0__g_sceneShadowColor.Load(int3(_95, _97, 0));
      float _rndx_directRatio = saturate(dot(float3(_rndx_shadow.xyz), float3(0.333f, 0.333f, 0.333f)));
      float _rndx_ao = lerp(1.0f, float(_937.x), _rndx_directRatio * FOLIAGE_AO_STRENGTH);
      _5342 *= _rndx_ao;
      _5343 *= _rndx_ao;
      _5344 *= _rndx_ao;
    }
    __3__38__0__1__g_sceneColorUAV[int2(_95, _97)] = float4(_5342, _5343, _5344, 1.0f);
  }
}