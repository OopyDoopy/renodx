#include "../shared.h"
#include "diffuse_brdf.hlsli"
#include "foliage_common.hlsli"
#include "purkinje_common.hlsli"

Texture2D<float4> __3__36__0__0__g_puddleMask : register(t135, space36);

Texture2D<float4> __3__36__0__0__g_climateSandTex : register(t136, space36);

Texture2D<uint16_t> __3__36__0__0__g_sceneDecalMask : register(t137, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t33, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t200, space36);

Texture2D<float4> __3__36__0__0__g_specularResult : register(t149, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t152, space36);

Texture2D<uint2> __3__36__0__0__g_stencilPrev : register(t139, space36);

Texture2D<half4> __3__36__0__0__g_sceneDiffuse : register(t182, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResult : register(t109, space36);

Texture2D<half4> __3__36__0__0__g_diffuseResultPrev : register(t110, space36);

Texture2D<half4> __3__36__0__0__g_specularResultPrev : register(t60, space36);

Texture2D<half2> __3__36__0__0__g_sceneAO : register(t61, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t19, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t20, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t21, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t53, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t63, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t51, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t67, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t68, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t55, space36);

Texture2D<float4> __3__36__0__0__g_manyLightsMoments : register(t13, space36);

Texture2D<float> __3__36__0__0__g_specularRayHitDistance : register(t69, space36);

Texture2D<float> __3__36__0__0__g_caustic : register(t70, space36);

Texture2D<uint> __3__36__0__0__g_tiledManyLightsMasks : register(t15, space36);

ByteAddressBuffer __3__37__0__0__g_structureCounterBuffer : register(t26, space37);

Texture2D<half4> __3__36__0__0__g_sceneShadowColor : register(t57, space36);

RWTexture2D<float4> __3__38__0__1__g_diffuseHalfPrevUAV : register(u42, space38);

RWTexture2D<float4> __3__38__0__1__g_sceneColorUAV : register(u14, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneSpecularUAV : register(u15, space38);

RWTexture2D<half4> __3__38__0__1__g_diffuseResultUAV : register(u16, space38);

RWTexture2D<half4> __3__38__0__1__g_specularResultUAV : register(u6, space38);

RWTexture2D<half4> __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV : register(u21, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b13, space35) {
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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b17, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__WeatherConstantBuffer : register(b37, space35) {
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

cbuffer __3__35__0__0__PrecomputedAmbientConstantBuffer : register(b42, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b44, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__35__0__0__EnvironmentLightingHistoryConstantBuffer : register(b22, space35) {
  float4 _environmentLightingHistory[4] : packoffset(c000.x);
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

SamplerState __3__40__0__0__g_samplerPoint : register(s4, space40);

SamplerState __0__4__0__0__g_staticBilinearWrapUWClampV : register(s1, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _48[4];
  int _61 = (int)(SV_GroupID.x) & 15;
  int _62 = (uint)((uint)(_61)) >> 2;
  _48[0] = ((g_tileIndex[(SV_GroupID.x) >> 7]).x);
  _48[1] = ((g_tileIndex[(SV_GroupID.x) >> 7]).y);
  _48[2] = ((g_tileIndex[(SV_GroupID.x) >> 7]).z);
  _48[3] = ((g_tileIndex[(SV_GroupID.x) >> 7]).w);
  int _80 = _48[(((uint)(SV_GroupID.x) >> 5) & 3)];
  int _84 = select((((int)(SV_GroupID.x) & 16) == 0), _80, ((uint)((uint)(_80)) >> 16));
  float _95 = float((uint)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))) + 0.5f;
  float _96 = float((uint)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))) + 0.5f;
  float _100 = _bufferSizeAndInvSize.z * _95;
  float _101 = _96 * _bufferSizeAndInvSize.w;
  float _103 = __3__36__0__0__g_depth.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
  uint2 _106 = __3__36__0__0__g_stencil.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
  int _108 = _106.x & 127;
  float _111 = max(1.0000000116860974e-07f, _103.x);
  float _112 = _nearFarProj.x / _111;
  float _305;
  float _306;
  float _307;
  bool _323;
  bool _344;
  half _352;
  float _405;
  float _416;
  float _417;
  float _425;
  float _426;
  half _427;
  half _428;
  half _429;
  half _430;
  half _431;
  bool _465;
  float _474;
  float _515;
  float _516;
  float _603;
  float _681;
  float _854;
  float _855;
  float _856;
  float _857;
  float _1022;
  int _1023;
  float _1080;
  float _1197;
  float _1198;
  float _1199;
  float _1200;
  float _1205;
  float _1230;
  half _1255;
  bool _1267;
  half _1274;
  float _1542;
  float _1559;
  float _1563;
  float _1591;
  float _1634;
  float _1635;
  float _1636;
  float _1637;
  float _1641;
  float _1642;
  float _1643;
  float _1644;
  float _1647;
  float _1648;
  float _1649;
  float _1650;
  half _1651;
  float _1802;
  int _1803;
  int _1804;
  float _1805;
  float _1806;
  float _1807;
  float _1808;
  float _1937;
  float _1938;
  float _1939;
  float _1999;
  float _2009;
  float _2010;
  float _2011;
  bool _2085;
  bool _2086;
  float _2122;
  float _2123;
  float _2124;
  float _2125;
  float _2191;
  float _2194;
  float _2195;
  float _2196;
  float _2197;
  float _2232;
  float _2233;
  float _2234;
  float _2249;
  float _2278;
  float _2279;
  float _2280;
  float _2281;
  float _2282;
  half _2289;
  half _2290;
  half _2291;
  half _2292;
  half _2293;
  float _2294;
  half _2330;
  half _2331;
  half _2332;
  float _2347;
  float _2348;
  float _2349;
  float _2369;
  float _2429;
  float _2526;
  float _2527;
  float _2528;
  bool _2591;
  bool _2600;
  bool _2603;
  bool _2604;
  int _2618;
  float _2661;
  float _2662;
  float _2663;
  bool _2742;
  float _2750;
  float _2761;
  float _2796;
  float _2803;
  float _2804;
  float _2805;
  float _2854;
  float _2855;
  float _2856;
  float _2865;
  float _2909;
  half _2961;
  half _2962;
  half _2963;
  float _2973;
  bool _3126;
  float _3162;
  float _3163;
  float _3164;
  float _3178;
  float _3179;
  float _3180;
  float _3199;
  float _3200;
  float _3201;
  // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
  // Description: Crimson Desert 1.11 changed RenderDiffuseTiled to evaluate partially valid 2x2 quads while preserving the original per-pixel invalid predicate for full-resolution scene-color writes. This block computes the per-pixel invalid flag and quad-lane validity flags used by the 1.11 half-resolution history fallback.
  bool _rndx_invalidPixel = (((((_103.x < 1.0000000116860974e-07f)) || ((_103.x == 1.0f)))) || ((_108 == 10)));
  float _rndx_invalidPixelF = (float)((bool)_rndx_invalidPixel);
  bool _rndx_quadInvalid0 = !(QuadReadLaneAt(_rndx_invalidPixelF, 0) == 0.0f);
  bool _rndx_quadInvalid1 = !(QuadReadLaneAt(_rndx_invalidPixelF, 1) == 0.0f);
  bool _rndx_quadInvalid2 = !(QuadReadLaneAt(_rndx_invalidPixelF, 2) == 0.0f);
  bool _rndx_quadInvalid3 = !(QuadReadLaneAt(_rndx_invalidPixelF, 3) == 0.0f);
  // RenoDX: <<< [Patch: Native111InvalidLaneParity]
  if (!(((_rndx_quadInvalid0 && _rndx_quadInvalid1) && _rndx_quadInvalid2) && _rndx_quadInvalid3)) {
    uint4 _120 = __3__36__0__0__g_baseColor.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
    float4 _126 = __3__36__0__0__g_normal.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
    half _135 = half(float((uint)((uint)(((uint)((uint)(_120.x)) >> 8) & 255))) * 0.003921568859368563f);
    half _139 = half(float((uint)((uint)(_120.x & 255))) * 0.003921568859368563f);
    half _144 = half(float((uint)((uint)(((uint)((uint)(_120.y)) >> 8) & 255))) * 0.003921568859368563f);
    half _153 = half(float((uint)((uint)(((uint)((uint)(_120.z)) >> 8) & 255))) * 0.003921568859368563f);
    uint _169 = uint((_126.w * 3.0f) + 0.5f);
    bool _170 = ((int)(_169) == 1);
    bool _171 = ((int)(_169) == 3);
    float _181 = (saturate(_126.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _182 = (saturate(_126.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _183 = (saturate(_126.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _185 = rsqrt(dot(float3(_181, _182, _183), float3(_181, _182, _183)));
    half _190 = half(_185 * _182);
    half _191 = half(_183 * _185);
    half _194 = (half(float((uint)((uint)(((uint)((uint)(_120.w)) >> 8) & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
    half _195 = (half(float((uint)((uint)(_120.w & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
    float _200 = float(_194 + _195) * 0.5f;
    float _201 = float(_194 - _195) * 0.5f;
    float _205 = (1.0f - abs(_200)) - abs(_201);
    float _207 = rsqrt(dot(float3(_200, _201, _205), float3(_200, _201, _205)));
    float _214 = float(half(_185 * _181));
    float _215 = float(_190);
    float _216 = float(_191);
    float _218 = select((_191 >= 0.0h), 1.0f, -1.0f);
    float _221 = -0.0f - (1.0f / (_218 + _216));
    float _222 = _215 * _221;
    float _223 = _222 * _214;
    float _224 = _218 * _214;
    float _231 = float(half(_207 * _200));
    float _232 = float(half(_207 * _201));
    float _233 = float(half(_207 * _205));
    half _245 = half(mad(_233, _214, mad(_232, _223, (_231 * (((_224 * _214) * _221) + 1.0f)))));
    half _246 = half(mad(_233, _215, mad(_232, ((_222 * _215) + _218), ((_231 * _218) * _223))));
    half _247 = half(mad(_233, _216, mad(_232, (-0.0f - _215), (-0.0f - (_224 * _231)))));
    half _249 = rsqrt(dot(half3(_245, _246, _247), half3(_245, _246, _247)));
    half _250 = _249 * _245;
    half _251 = _249 * _246;
    half _252 = _249 * _247;
    half _256 = saturate(_135 * _135);
    half _257 = saturate(_139 * _139);
    half _258 = saturate(_144 * _144);
    half _274 = saturate(((_257 * 0.3395996h) + (_256 * 0.61328125h)) + (_258 * 0.04736328h));
    half _275 = saturate(((_257 * 0.9165039h) + (_256 * 0.07019043h)) + (_258 * 0.013450623h));
    half _276 = saturate(((_257 * 0.109558105h) + (_256 * 0.020614624h)) + (_258 * 0.8696289h));
    bool _277 = (_108 == 24);
    bool _278 = (_108 == 29);
    bool _279 = (_277) || (_278);
    half4 _282 = __3__36__0__0__g_diffuseResult.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
    float _286 = float(_282.x);
    float _287 = float(_282.y);
    float _288 = float(_282.z);
    [branch]
    if (_renderParams2.y > 0.0f) {
      half4 _294 = __3__36__0__0__g_sceneDiffuse.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
      _305 = (float(_294.x) + _286);
      _306 = (float(_294.y) + _287);
      _307 = (float(_294.z) + _288);
    } else {
      _305 = _286;
      _306 = _287;
      _307 = _288;
    }
    float4 _309 = __3__36__0__0__g_specularResult.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
    bool _313 = ((uint)_108 > (uint)11);
    if (_313) {
      if (!((((uint)_108 < (uint)21)) || ((_108 == 107)))) {
        _323 = (_108 == 7);
      } else {
        _323 = true;
      }
    } else {
      if (!(_108 == 6)) {
        _323 = (_108 == 7);
      } else {
        _323 = true;
      }
    }
    float _330 = -0.0f - min(0.0f, (-0.0f - _305));
    float _331 = -0.0f - min(0.0f, (-0.0f - _306));
    float _332 = -0.0f - min(0.0f, (-0.0f - _307));
    half2 _334 = __3__36__0__0__g_sceneAO.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
    bool __defer_322_343 = false;
    if (_313) {
      if ((uint)_108 < (uint)20) {
        _352 = 0.0h;
      } else {
        _344 = ((uint)_108 < (uint)19);
        if (((_108 == 65)) || ((((((_108 == 107)) || ((_108 == 96)))) || (_344)))) {
          _352 = 0.0h;
        } else {
          _352 = select(_279, 0.0h, half(float((uint)((uint)(_120.y & 255))) * 0.003921568859368563f));
        }
      }
    } else {
      if ((uint)_108 > (uint)10) {
        _352 = 0.0h;
      } else {
        _344 = false;
        if (((_108 == 65)) || ((((((_108 == 107)) || ((_108 == 96)))) || (_344)))) {
          _352 = 0.0h;
        } else {
          _352 = select(_279, 0.0h, half(float((uint)((uint)(_120.y & 255))) * 0.003921568859368563f));
        }
      }
    }
    if (__defer_322_343) {
      if (((_108 == 65)) || ((((((_108 == 107)) || ((_108 == 96)))) || (_344)))) {
      } else {
        _352 = select(_279, 0.0h, half(float((uint)((uint)(_120.y & 255))) * 0.003921568859368563f));
      }
    }
    float _354 = (_100 * 2.0f) + -1.0f;
    float _356 = 1.0f - (_101 * 2.0f);
    float _392 = mad((_invViewProjRelative[3].z), _111, mad((_invViewProjRelative[3].y), _356, ((_invViewProjRelative[3].x) * _354))) + (_invViewProjRelative[3].w);
    float _393 = (mad((_invViewProjRelative[0].z), _111, mad((_invViewProjRelative[0].y), _356, ((_invViewProjRelative[0].x) * _354))) + (_invViewProjRelative[0].w)) / _392;
    float _394 = (mad((_invViewProjRelative[1].z), _111, mad((_invViewProjRelative[1].y), _356, ((_invViewProjRelative[1].x) * _354))) + (_invViewProjRelative[1].w)) / _392;
    float _395 = (mad((_invViewProjRelative[2].z), _111, mad((_invViewProjRelative[2].y), _356, ((_invViewProjRelative[2].x) * _354))) + (_invViewProjRelative[2].w)) / _392;
    float _397 = rsqrt(dot(float3(_393, _394, _395), float3(_393, _394, _395)));
    bool _399 = ((uint)(_106.x & 24) > (uint)23);
    if (_399) {
      if (_278) {
        _405 = float(saturate(_153));
      } else {
        _405 = 0.0f;
      }
      uint _407 = uint((float)(half(float((uint)((uint)(_120.z & 255))) * 0.003921568859368563f) * 255.0h));
      if (_170) {
        _416 = select((((int)(_407) & 128) != 0), 1.0f, 0.0f);
        _417 = (float((uint)((uint)((int)(_407) & 127))) * 0.007874015718698502f);
      } else {
        _416 = 0.0f;
        _417 = 0.0f;
      }
      half _418 = half(_417);
      bool _420 = (_418 > 0.99902344h);
      _425 = _416;
      _426 = _405;
      _427 = _418;
      _428 = select(_279, 0.010002136h, _153);
      _429 = select(_420, 1.0h, _274);
      _430 = select(_420, 1.0h, _275);
      _431 = select(_420, 1.0h, _276);
    } else {
      _425 = 0.0f;
      _426 = 0.0f;
      _427 = _352;
      _428 = _153;
      _429 = _274;
      _430 = _275;
      _431 = _276;
    }
    // RenoDX: >>> [Patch: FoliageColorCorrect] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x14947ADD applies AO+ foliage color shaping to foliage stencil materials after vanilla resolves the direct diffuse base color, using g_sceneShadowColor visibility so shadowed foliage does not receive the fully sunlit color-shaping path.
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_108 - 12) < 7u)) {
      float3 _rndx_fcBaseColor = float3(float(_429), float(_430), float(_431));
      half4 _rndx_fcShadow = __3__36__0__0__g_sceneShadowColor.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
      float _rndx_fcShadowVis = saturate(dot(float3(_rndx_fcShadow.xyz), float3(0.2126f, 0.7152f, 0.0722f)));
      float3 _rndx_fcCorrected = FoliageColorCorrect(_rndx_fcBaseColor, _sunDirection.xyz, _rndx_fcShadowVis, float3(1.0f, 1.0f, 1.0f));
      float3 _rndx_fscColor = FoliageSelectiveColor(_rndx_fcCorrected);
      _429 = half(_rndx_fscColor.x);
      _430 = half(_rndx_fscColor.y);
      _431 = half(_rndx_fscColor.z);
    }
    // RenoDX: <<< [Patch: FoliageColorCorrect]
    float _432 = float(_250);
    float _433 = float(_251);
    float _434 = float(_252);
    float _435 = _397 * _393;
    float _436 = -0.0f - _435;
    float _437 = _397 * _394;
    float _438 = -0.0f - _437;
    float _439 = _397 * _395;
    float _440 = -0.0f - _439;
    float _442 = saturate(dot(float3(_436, _438, _440), float3(_432, _433, _434)));
    bool _444 = ((_106.x & 128) == 0);
    if (_444) {
      if ((uint)_108 > (uint)52) {
        if (!((((_106.x & 125) == 105)) || (((uint)_108 < (uint)68)))) {
          _465 = (_108 == 98);
        } else {
          _465 = true;
        }
      } else {
        if ((uint)_108 > (uint)10) {
          if ((uint)_108 < (uint)20) {
            if ((_106.x & 126) == 14) {
              _465 = (_108 == 98);
            } else {
              _465 = true;
            }
          } else {
            if (!((_106.x & 125) == 105)) {
              _465 = (_108 == 98);
            } else {
              _465 = true;
            }
          }
        } else {
          _465 = (_108 == 98);
        }
      }
    } else {
      _465 = true;
    }
    [branch]
    if (_399) {
      uint _468 = __3__36__0__0__g_depthOpaque.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
      _474 = (float((uint)((uint)(_468.x & 16777215))) * 5.960465188081798e-08f);
    } else {
      _474 = _103.x;
    }
    float _502 = mad((_projToPrevProj[3].z), _474, mad((_projToPrevProj[3].y), _356, ((_projToPrevProj[3].x) * _354))) + (_projToPrevProj[3].w);
    if (_465) {
      float2 _509 = __3__36__0__0__g_velocity.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
      _515 = (_509.x * 2.0f);
      _516 = (_509.y * 2.0f);
    } else {
      _515 = (((mad((_projToPrevProj[0].z), _474, mad((_projToPrevProj[0].y), _356, ((_projToPrevProj[0].x) * _354))) + (_projToPrevProj[0].w)) / _502) - _354);
      _516 = (((mad((_projToPrevProj[1].z), _474, mad((_projToPrevProj[1].y), _356, ((_projToPrevProj[1].x) * _354))) + (_projToPrevProj[1].w)) / _502) - _356);
    }
    float _518 = _nearFarProj.x / max(1.0000000116860974e-07f, _474);
    float _521 = (_515 * 0.5f) + _100;
    float _522 = _101 - (_516 * 0.5f);
    float _530 = select((((((_521 < 0.0f)) || ((_521 > 1.0f)))) || ((((_522 < 0.0f)) || ((_522 > 1.0f))))), 1.0f, 0.0f);
    float _535 = (_521 * _bufferSizeAndInvSize.x) + -0.5f;
    float _536 = (_522 * _bufferSizeAndInvSize.y) + -0.5f;
    int _539 = int(floor(_535));
    int _540 = int(floor(_536));
    float _541 = float((int)(_539));
    float _542 = float((int)(_540));
    float _545 = (_541 + 0.5f) * _bufferSizeAndInvSize.z;
    float _546 = (_542 + 0.5f) * _bufferSizeAndInvSize.w;
    int4 _549 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_545, _546));
    int _572 = asint(((((uint)((uint)((uint)(_549.w)) >> 24))) * (16777216u)) + ((uint)(asint(((((uint)((uint)((uint)(_549.z)) >> 24))) * (65536u)) + ((uint)(asint(((((uint)((uint)((uint)(_549.y)) >> 24))) * (256u)) + (((uint)((uint)((uint)(_549.x)) >> 24))))))))));
    if (_444) {
      if ((uint)_108 > (uint)52) {
        if (!(((_108 == 98)) || (((((_106.x & 125) == 105)) || (((uint)_108 < (uint)68)))))) {
          _603 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _603 = 0.0f;
        }
      } else {
        if ((uint)_108 > (uint)10) {
          if ((uint)_108 < (uint)20) {
            if ((_106.x & 126) == 14) {
              _603 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _603 = 0.0f;
            }
          } else {
            if (!((_106.x & 125) == 105)) {
              _603 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _603 = 0.0f;
            }
          }
        } else {
          _603 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _603 = 0.0f;
    }
    float _611 = _screenPercentage.x * 2.0f;
    float _612 = _611 * abs(_100 + -0.5f);
    float _613 = _screenPercentage.y * 2.0f;
    float _614 = _613 * abs(_101 + -0.5f);
    float _618 = sqrt(dot(float2(_612, _614), float2(_612, _614)) + 1.0f) * _518;
    float _635 = _611 * abs(_521 + -0.5f);
    float _636 = _613 * abs(_522 + -0.5f);
    float _639 = sqrt(dot(float2(_635, _636), float2(_635, _636)) + 1.0f);
    bool _654 = (((uint)(_108 + -97) < (uint)2)) || (_323);
    float _656 = _518 * _518;
    float _658 = (_656 * select(_654, 0.5f, 0.20000000298023224f)) + 1.0f;
    bool _662 = ((uint)(_108 + -53) < (uint)15);
    if (_662) {
      _681 = (1000.0f - (saturate(float((bool)(uint)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _681 = 50.0f;
    }
    bool _690 = ((_108 == 57)) || (_662);
    float _691 = select(_690, 0.0f, ((max(0.0f, (_518 + -1.0f)) * 0.10000000149011612f) * _temporalReprojectionParams.y));
    float _696 = max(0.0f, (abs(_618 - (_639 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_549.x & 16777215))) * 5.960465188081798e-08f))) - _603))) - _691));
    float _697 = max(0.0f, (abs(_618 - (_639 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_549.y & 16777215))) * 5.960465188081798e-08f))) - _603))) - _691));
    float _698 = max(0.0f, (abs(_618 - (_639 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_549.z & 16777215))) * 5.960465188081798e-08f))) - _603))) - _691));
    float _699 = max(0.0f, (abs(_618 - (_639 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_549.w & 16777215))) * 5.960465188081798e-08f))) - _603))) - _691));
    float _700 = _696 * _696;
    float _701 = _697 * _697;
    float _702 = _698 * _698;
    float _703 = _699 * _699;
    float _705 = (-1.4426950216293335f / ((_656 * 0.10000000149011612f) + 1.0f)) * select(_654, 0.20000000298023224f, _681);
    float _718 = select((_700 > _658), 0.0f, exp2(_700 * _705));
    float _719 = select((_701 > _658), 0.0f, exp2(_701 * _705));
    float _720 = select((_702 > _658), 0.0f, exp2(_702 * _705));
    float _721 = select((_703 > _658), 0.0f, exp2(_703 * _705));
    int _722 = _106.x & 126;
    if (!_399) {
      bool _726 = ((_722 == 66)) || ((_108 == 54));
      int _727 = _572 & 127;
      int _728 = _572 & 32512;
      int _729 = _572 & 8323072;
      int _730 = _572 & 2130706432;
      bool _769 = ((_727 == 57)) || (((uint)(_727 + -53) < (uint)15));
      bool _770 = ((_728 == 14592)) || (((uint)((((uint)((uint)(_572)) >> 8) & 127) + -53) < (uint)15));
      bool _771 = ((_729 == 3735552)) || (((uint)((((uint)((uint)(_572)) >> 16) & 127) + -53) < (uint)15));
      bool _772 = ((_730 == 956301312)) || (((uint)((((uint)((uint)(_572)) >> 24) & 127) + -53) < (uint)15));
      bool _785 = (_690) || ((!_444));
      bool _794 = (_108 == 6);
      bool _816 = ((uint)(_108 + -105) < (uint)3);
      _854 = (float((bool)((uint)((((_726) || ((((_727 != 54)) && (((_572 & 126) != 66)))))) && ((!(((((_794 ^ (_727 == 6))) || ((((_690 ^ _769)) || ((_816 ^ (((_727 == 107)) || (((uint)(_727 + -105) < (uint)2))))))))) || ((((((_572 & 128) != 0)) || (_769)) ^ _785)))))))) * _718);
      _855 = (float((bool)((uint)((((_726) || ((((_728 != 13824)) && (((_572 & 32256) != 16896)))))) && ((!(((((_794 ^ (_728 == 1536))) || ((((_816 ^ ((((_572 & 32000) == 26880)) || ((_728 == 27136))))) || ((_690 ^ _770)))))) || ((((((_572 & 32768) != 0)) || (_770)) ^ _785)))))))) * _719);
      _856 = (float((bool)((uint)((((_726) || ((((_729 != 3538944)) && (((_572 & 8257536) != 4325376)))))) && ((!(((((_794 ^ (_729 == 393216))) || ((((_816 ^ ((((_572 & 8192000) == 6881280)) || ((_729 == 6946816))))) || ((_690 ^ _771)))))) || ((((((_572 & 8388608) != 0)) || (_771)) ^ _785)))))))) * _720);
      _857 = (float((bool)((uint)((((_726) || ((((_730 != 905969664)) && (((_572 & 2113929216) != 1107296256)))))) && ((!(((((_794 ^ (_730 == 100663296))) || ((((_816 ^ ((((_572 & 2097152000) == 1761607680)) || ((_730 == 1778384896))))) || ((_690 ^ _772)))))) || ((((((int)_572 < (int)0)) || (_772)) ^ _785)))))))) * _721);
    } else {
      _854 = _718;
      _855 = _719;
      _856 = _720;
      _857 = _721;
    }
    int4 _859 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_545, _546));
    float _878 = min(1.0f, ((float((uint)((uint)(_859.w & 1023))) * 0.001956947147846222f) + -1.0f));
    float _879 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_859.w)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _880 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_859.w)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _882 = rsqrt(dot(float3(_878, _879, _880), float3(_878, _879, _880)));
    float _887 = saturate(dot(float3(_432, _433, _434), float3((_882 * _878), (_882 * _879), (_882 * _880))));
    float _902 = min(1.0f, ((float((uint)((uint)(_859.z & 1023))) * 0.001956947147846222f) + -1.0f));
    float _903 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_859.z)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _904 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_859.z)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _906 = rsqrt(dot(float3(_902, _903, _904), float3(_902, _903, _904)));
    float _911 = saturate(dot(float3(_432, _433, _434), float3((_906 * _902), (_906 * _903), (_906 * _904))));
    float _926 = min(1.0f, ((float((uint)((uint)(_859.x & 1023))) * 0.001956947147846222f) + -1.0f));
    float _927 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_859.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _928 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_859.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _930 = rsqrt(dot(float3(_926, _927, _928), float3(_926, _927, _928)));
    float _935 = saturate(dot(float3(_432, _433, _434), float3((_930 * _926), (_930 * _927), (_930 * _928))));
    float _950 = min(1.0f, ((float((uint)((uint)(_859.y & 1023))) * 0.001956947147846222f) + -1.0f));
    float _951 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_859.y)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _952 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_859.y)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _954 = rsqrt(dot(float3(_950, _951, _952), float3(_950, _951, _952)));
    float _959 = saturate(dot(float3(_432, _433, _434), float3((_954 * _950), (_954 * _951), (_954 * _952))));
    bool _960 = (_722 == 66);
    bool _962 = (_108 == 54);
    float _964 = select(((_962) || (((_654) || (_960)))), 0.009999999776482582f, 1.0f);
    float _981 = _535 - _541;
    float _982 = _536 - _542;
    float _983 = 1.0f - _981;
    float _984 = 1.0f - _982;
    float _989 = (_983 * _982) * _854;
    float _991 = (_982 * _981) * _855;
    float _993 = (_984 * _981) * _856;
    float _995 = (_984 * _983) * _857;
    float _997 = saturate(select(_399, 1.0f, (pow(_935, _964))) * _989);
    float _998 = saturate(select(_399, 1.0f, (pow(_959, _964))) * _991);
    float _999 = saturate(select(_399, 1.0f, (pow(_911, _964))) * _993);
    float _1000 = saturate(select(_399, 1.0f, (pow(_887, _964))) * _995);
    int4 _1002 = asint(__3__37__0__0__g_structureCounterBuffer.Load4(8));
    [branch]
    if (!(WaveReadLaneFirst(_1002.x) == 0)) {
      uint _1010 = __3__36__0__0__g_tiledManyLightsMasks.Load(int3(((int)(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))) >> 5)), ((int)(((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))) >> 5)), 0));
      int _1012 = _1010.x & 4;
      int _1014 = (uint)((uint)(_1012)) >> 2;
      if (!(_1012 == 0)) {
        _1022 = max((saturate(dot(float3(_330, _331, _332), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _530);
        _1023 = _1014;
      } else {
        _1022 = _530;
        _1023 = _1014;
      }
    } else {
      _1022 = _530;
      _1023 = 0;
    }
    float _1033 = saturate(max(_1022, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    half4 _1036 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_539, ((int)((uint)(_540) + 1u)), 0));
    half4 _1042 = __3__36__0__0__g_diffuseResultPrev.Load(int3(((int)((uint)(_539) + 1u)), ((int)((uint)(_540) + 1u)), 0));
    half4 _1047 = __3__36__0__0__g_diffuseResultPrev.Load(int3(((int)((uint)(_539) + 1u)), _540, 0));
    half4 _1052 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_539, _540, 0));
    float _1057 = dot(float4(_997, _998, _999, _1000), float4(1.0f, 1.0f, 1.0f, 1.0f));
    float _1066 = saturate(dot(float4(_997, _998, _999, _1000), float4(float(_1036.w), float(_1042.w), float(_1047.w), float(_1052.w))) * (1.0f / max(1.0f, _1057)));
    float _1071 = sqrt((_516 * _516) + (_515 * _515)) * 50.0f;
    if (_662) {
      _1080 = saturate(1.0f - _1071);
    } else {
      _1080 = (1.0f - (saturate(_1071) * 0.5f));
    }
    float _1084 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    float _1088 = select(_277, 1.0f, _1066);
    float _1090 = (_1088 * _1088) * 4.0f;
    float4 _1101 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_100, _101), 0.0f);
    float _1105 = saturate(_1101.w);
    float _1107 = 1.0f / max(9.999999974752427e-07f, _1057);
    float _1108 = _1107 * _997;
    float _1109 = _1107 * _998;
    float _1110 = _1107 * _999;
    float _1111 = _1107 * _1000;
    float _1112 = saturate(saturate(max(_1033, (1.0f / ((saturate(_1090) * min(31.0f, ((_1080 * 15.0f) * _1084))) + 1.0f))) + _renderParams.z));
    float _1154 = 1.0f / _exposure4.x;
    float _1171 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1111 * float(_1052.x)) + ((_1110 * float(_1047.x)) + ((_1108 * float(_1036.x)) + (_1109 * float(_1042.x))))))) * _exposure4.y)))));
    float _1172 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1111 * float(_1052.y)) + ((_1110 * float(_1047.y)) + ((_1108 * float(_1036.y)) + (_1109 * float(_1042.y))))))) * _exposure4.y)))));
    float _1173 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1111 * float(_1052.z)) + ((_1110 * float(_1047.z)) + ((_1108 * float(_1036.z)) + (_1109 * float(_1042.z))))))) * _exposure4.y)))));
    if (_renderParams.y == 0.0f) {
      float _1177 = dot(float3(_1171, _1172, _1173), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _1192 = ((min(_1177, _1101.y) / max(9.999999974752427e-07f, _1177)) * _1105) + saturate(1.0f - _1105);
      _1197 = saturate((saturate(((_1101.x - _1177) * 5.0f) / max(9.999999974752427e-07f, _1101.x)) * 0.5f) + _1112);
      _1198 = (_1192 * _1171);
      _1199 = (_1192 * _1172);
      _1200 = (_1192 * _1173);
    } else {
      _1197 = _1112;
      _1198 = _1171;
      _1199 = _1172;
      _1200 = _1173;
    }
    if (!_277) {
      _1205 = saturate(_1066 + 0.0625f);
    } else {
      _1205 = 0.0f;
    }
    float _1212 = ((_330 - _1198) * _1197) + _1198;
    float _1213 = ((_331 - _1199) * _1197) + _1199;
    float _1214 = ((_332 - _1200) * _1197) + _1200;
    __3__38__0__1__g_diffuseResultUAV[int2(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))))] = half4(half(_1212), half(_1213), half(_1214), half(_1205));
    float _1221 = float(_429);
    float _1222 = float(_430);
    float _1223 = float(_431);
    if (_108 == 53) {
      _1230 = saturate(((_1222 + _1221) + _1223) * 1.2000000476837158f);
    } else {
      _1230 = 1.0f;
    }
    float _1231 = float(_427);
    float _1237 = (0.699999988079071f / min(max(max(max(_1221, _1222), _1223), 0.009999999776482582f), 0.699999988079071f)) * _1230;
    float _1247 = (((_1237 * _1221) + -0.03999999910593033f) * _1231) + 0.03999999910593033f;
    float _1248 = (((_1237 * _1222) + -0.03999999910593033f) * _1231) + 0.03999999910593033f;
    float _1249 = (((_1237 * _1223) + -0.03999999910593033f) * _1231) + 0.03999999910593033f;
    if (!_399) {
      _1255 = saturate(1.0h - _334.x);
    } else {
      _1255 = 1.0h;
    }
    if (!(((_108 == 98)) || ((_722 == 96)))) {
      if ((uint)(_108 + -105) < (uint)2) {
        _1267 = _170;
        _1274 = select((((_108 == 65)) || ((((_108 == 107)) || (_1267)))), 0.0h, _427);
      } else {
        if (!((uint)(_108 + -11) < (uint)9)) {
          _1267 = false;
          _1274 = select((((_108 == 65)) || ((((_108 == 107)) || (_1267)))), 0.0h, _427);
        } else {
          _1274 = 0.0h;
        }
      }
    } else {
      _1274 = 0.0h;
    }
    float _1276 = dot(float3(_435, _437, _439), float3(_432, _433, _434)) * 2.0f;
    float _1280 = _435 - (_1276 * _432);
    float _1281 = _437 - (_1276 * _433);
    float _1282 = _439 - (_1276 * _434);
    float _1284 = rsqrt(dot(float3(_1280, _1281, _1282), float3(_1280, _1281, _1282)));
    float _1285 = _1280 * _1284;
    float _1286 = _1281 * _1284;
    float _1287 = _1282 * _1284;
    float _1290 = __3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_100, _101), 0.0f);
    float _1292 = float(_428);
    float _1294 = select((_1292 < 0.800000011920929f), _1290.x, 0.0f);
    float _1295 = _1294 * _1285;
    float _1296 = _1294 * _1286;
    float _1297 = _1294 * _1287;
    float _1302 = dot(float3(_1295, _1296, _1297), float3((-0.0f - _432), (-0.0f - _433), (-0.0f - _434))) * 2.0f;
    float _1307 = ((_1302 * _432) + _393) + _1295;
    float _1309 = ((_1302 * _433) + _394) + _1296;
    float _1311 = ((_1302 * _434) + _395) + _1297;
    float _1335 = mad((_viewProjRelative[0].z), _1311, mad((_viewProjRelative[0].y), _1309, (_1307 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w);
    float _1339 = mad((_viewProjRelative[1].z), _1311, mad((_viewProjRelative[1].y), _1309, (_1307 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w);
    float _1343 = mad((_viewProjRelative[2].z), _1311, mad((_viewProjRelative[2].y), _1309, (_1307 * (_viewProjRelative[2].x)))) + (_viewProjRelative[2].w);
    float _1347 = mad((_viewProjRelative[3].z), _1311, mad((_viewProjRelative[3].y), _1309, (_1307 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
    float _1385 = mad((_projToPrevProj[3].w), _1347, mad((_projToPrevProj[3].z), _1343, mad((_projToPrevProj[3].y), _1339, ((_projToPrevProj[3].x) * _1335))));
    float _1386 = mad((_projToPrevProj[0].w), _1347, mad((_projToPrevProj[0].z), _1343, mad((_projToPrevProj[0].y), _1339, ((_projToPrevProj[0].x) * _1335)))) / _1385;
    float _1387 = mad((_projToPrevProj[1].w), _1347, mad((_projToPrevProj[1].z), _1343, mad((_projToPrevProj[1].y), _1339, ((_projToPrevProj[1].x) * _1335)))) / _1385;
    float _1391 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[2].w), _1347, mad((_projToPrevProj[2].z), _1343, mad((_projToPrevProj[2].y), _1339, ((_projToPrevProj[2].x) * _1335)))) / _1385));
    float _1427 = mad((_invViewProjRelativePrev[3].z), _1391, mad((_invViewProjRelativePrev[3].y), _1387, ((_invViewProjRelativePrev[3].x) * _1386))) + (_invViewProjRelativePrev[3].w);
    float _1438 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[0].z), _1391, mad((_invViewProjRelativePrev[0].y), _1387, ((_invViewProjRelativePrev[0].x) * _1386))) + (_invViewProjRelativePrev[0].w)) / _1427) - _1307);
    float _1439 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[1].z), _1391, mad((_invViewProjRelativePrev[1].y), _1387, ((_invViewProjRelativePrev[1].x) * _1386))) + (_invViewProjRelativePrev[1].w)) / _1427) - _1309);
    float _1440 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _1391, mad((_invViewProjRelativePrev[2].y), _1387, ((_invViewProjRelativePrev[2].x) * _1386))) + (_invViewProjRelativePrev[2].w)) / _1427) - _1311);
    float _1441 = dot(float3(_1438, _1439, _1440), float3(_1285, _1286, _1287));
    float _1445 = _1438 - (_1441 * _1285);
    float _1446 = _1439 - (_1441 * _1286);
    float _1447 = _1440 - (_1441 * _1287);
    float _1463 = (saturate(_1294 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_1445 * _1445) + (_1446 * _1446)) + (_1447 * _1447)) / max(0.0010000000474974513f, _1294))) + -1.0f)) + 1.0f;
    float _1464 = _1463 * _1463;
    float _1465 = _1464 * _1464;
    float _1466 = _1465 * _935;
    float _1467 = _1465 * _959;
    float _1468 = _1465 * _911;
    float _1469 = _1465 * _887;
    bool _1472 = (_renderParams.z > 0.0f);
    float _1474 = float(1.0h - _428);
    float _1478 = (_1386 - (_1335 / _1347)) - _515;
    float _1479 = (_1387 - (_1339 / _1347)) - _516;
    float _1483 = sqrt((_1479 * _1479) + (_1478 * _1478));
    float _1488 = saturate((((_1474 * _1474) * (1.0f - (_442 * 0.8999999761581421f))) * _1483) * select(_1472, 2000.0f, 500.0f));
    float _1498 = select(((((_278) || (_399))) || ((((_722 == 24)) || ((_renderParams.y > 0.0f))))), 1.0f, float(_334.y));
    float _1502 = float(_1274);
    float _1507 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
    float _1533 = saturate(saturate(1.0f - (((_1502 * _112) / max(0.0010000000474974513f, _442)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_1507 * 0.07500000298023224f)) + max(0.019999999552965164f, _1292)) + (saturate(_112 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_112 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_1502) * 0.75f)));
    if (_108 == 64) {
      _1542 = ((saturate(_112 * 0.25f) * (_1533 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _1542 = _1533;
    }
    float _1544 = (_1507 * 16.0f) + 16.0f;
    float _1550 = select((_1507 > 1.0f), 0.0f, saturate((1.0f / _1544) * (_112 - _1544)));
    bool _1551 = (_108 == 105);
    if (_1551) {
      _1559 = 1.0f;
      _1563 = select((_108 == 65), 0.0f, _1559);
    } else {
      if (!_399) {
        _1559 = select((_108 == 107), 1.0f, ((_1550 + _1542) - (_1550 * _1542)));
        _1563 = select((_108 == 65), 0.0f, _1559);
      } else {
        _1563 = 0.0f;
      }
    }
    float _1568 = select(_690, 31.0f, 63.0f);
    if (!_278) {
      float _1581 = (saturate((2000.0f - (saturate(float(_1274 * 0.5h) + (_112 * 0.0625f)) * 1500.0f)) * _1483) * (7.0f - _1568)) + _1568;
      if ((uint)(_108 + -12) < (uint)9) {
        _1591 = ((saturate(_112 * 0.004999999888241291f) * (_1581 + -2.0f)) + 2.0f);
      } else {
        _1591 = _1581;
      }
    } else {
      _1591 = _1568;
    }
    half _1594 = max(0.040008545h, _428);
    float _1612 = saturate(max(max(_1033, select(_1472, (_1488 + 0.125f), 0.0f)), (1.0f / (((saturate((_1084 * _1084) * _1090) * min(64.0f, (_1591 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _1563) + (_112 * 0.0078125f)) + float((_1594 * _1594) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    bool __defer_1590_1633 = false;
    if ((uint)_108 > (uint)52) {
      if ((uint)_108 < (uint)68) {
        if (_960) {
          _1641 = _1466;
          _1642 = _1467;
          _1643 = _1468;
          _1644 = _1469;
          _1647 = _1641;
          _1648 = _1642;
          _1649 = _1643;
          _1650 = _1644;
          _1651 = max(0.89990234h, _428);
        } else {
          if (!_962) {
            float _1621 = _1466 * _1466;
            float _1622 = _1467 * _1467;
            float _1623 = _1468 * _1468;
            float _1624 = _1469 * _1469;
            float _1625 = _1621 * _1621;
            float _1626 = _1622 * _1622;
            float _1627 = _1623 * _1623;
            float _1628 = _1624 * _1624;
            _1634 = (_1625 * _1625);
            _1635 = (_1626 * _1626);
            _1636 = (_1627 * _1627);
            _1637 = (_1628 * _1628);
          } else {
            _1634 = _1466;
            _1635 = _1467;
            _1636 = _1468;
            _1637 = _1469;
          }
          __defer_1590_1633 = true;
        }
      } else {
        _1647 = _1466;
        _1648 = _1467;
        _1649 = _1468;
        _1650 = _1469;
        _1651 = max(0.099975586h, _428);
      }
    } else {
      _1634 = _1466;
      _1635 = _1467;
      _1636 = _1468;
      _1637 = _1469;
      __defer_1590_1633 = true;
    }
    if (__defer_1590_1633) {
      if ((_962) || (_960)) {
        _1641 = _1634;
        _1642 = _1635;
        _1643 = _1636;
        _1644 = _1637;
        _1647 = _1641;
        _1648 = _1642;
        _1649 = _1643;
        _1650 = _1644;
        _1651 = max(0.89990234h, _428);
      } else {
        _1647 = _1634;
        _1648 = _1635;
        _1649 = _1636;
        _1650 = _1637;
        _1651 = max(0.099975586h, _428);
      }
    }
    float _1652 = float(_1651);
    float _1653 = _1652 * _1652;
    float _1654 = _1653 * _1653;
    float _1667 = (((_1654 * _1647) - _1647) * _1647) + 1.0f;
    float _1668 = (((_1654 * _1648) - _1648) * _1648) + 1.0f;
    float _1669 = (((_1654 * _1649) - _1649) * _1649) + 1.0f;
    float _1670 = (((_1654 * _1650) - _1650) * _1650) + 1.0f;
    float _1695 = saturate(select(_278, 1.0f, saturate((_1654 / (_1667 * _1667)) * _1647)) * _989);
    float _1696 = saturate(select(_278, 1.0f, saturate((_1654 / (_1668 * _1668)) * _1648)) * _991);
    float _1697 = saturate(select(_278, 1.0f, saturate((_1654 / (_1669 * _1669)) * _1649)) * _993);
    float _1698 = saturate(select(_278, 1.0f, saturate((_1654 / (_1670 * _1670)) * _1650)) * _995);
    [branch]
    if (_399) {
      float _1711 = mad((_projToPrevProj[3].z), _103.x, mad((_projToPrevProj[3].y), _356, ((_projToPrevProj[3].x) * _354))) + (_projToPrevProj[3].w);
      float _1714 = ((mad((_projToPrevProj[0].z), _103.x, mad((_projToPrevProj[0].y), _356, ((_projToPrevProj[0].x) * _354))) + (_projToPrevProj[0].w)) / _1711) - _354;
      float _1715 = ((mad((_projToPrevProj[1].z), _103.x, mad((_projToPrevProj[1].y), _356, ((_projToPrevProj[1].x) * _354))) + (_projToPrevProj[1].w)) / _1711) - _356;
      float _1725 = (((_1714 * 0.5f) + _100) * _bufferSizeAndInvSize.x) + -0.5f;
      float _1726 = ((_101 - (_1715 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
      int _1729 = int(floor(_1725));
      int _1730 = int(floor(_1726));
      float _1731 = float((int)(_1729));
      float _1732 = float((int)(_1730));
      [branch]
      if (_278) {
        int4 _1742 = __3__36__0__0__g_stencilPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(((_1731 + 0.5f) * _bufferSizeAndInvSize.z), ((_1732 + 0.5f) * _bufferSizeAndInvSize.w)));
        int _1749 = asint((((uint)(_1742.w)) * (16777216u)) + ((uint)(asint((((uint)(_1742.z)) * (65536u)) + ((uint)(asint((((uint)(_1742.y)) * (256u)) + ((uint)(_1742.x)))))))));
        float _1766 = saturate(float((bool)(uint)((uint)(_1749 & 24) > (uint)23)) * _1695);
        float _1767 = saturate(float((bool)(uint)((uint)(_1749 & 6144) > (uint)5888)) * _1696);
        float _1768 = saturate(float((bool)(uint)((uint)(_1749 & 1572864) > (uint)1507328)) * _1697);
        float _1769 = saturate(float((bool)(uint)((uint)(_1749 & 402653184) > (uint)385875968)) * _1698);
        _1802 = max(saturate(min(max(((_426 / (((_112 * _112) * 0.004999999888241291f) + 1.0f)) + (_1488 * 0.5f)), 0.03125f), 0.5f) + _1612), saturate(1.0f - dot(float4(_1766, _1767, _1768, _1769), float4(1.0f, 1.0f, 1.0f, 1.0f))));
        _1803 = _1729;
        _1804 = _1730;
        _1805 = _1766;
        _1806 = _1767;
        _1807 = _1768;
        _1808 = _1769;
      } else {
        float _1785 = _1725 - _1731;
        float _1786 = _1726 - _1732;
        float _1787 = 1.0f - _1785;
        float _1788 = 1.0f - _1786;
        _1802 = (saturate((sqrt((_1715 * _1715) + (_1714 * _1714)) * 50.0f) + 0.125f) * 0.875f);
        _1803 = _1729;
        _1804 = _1730;
        _1805 = (_1787 * _1786);
        _1806 = (_1786 * _1785);
        _1807 = (_1788 * _1785);
        _1808 = (_1788 * _1787);
      }
    } else {
      _1802 = _1612;
      _1803 = _539;
      _1804 = _540;
      _1805 = _1695;
      _1806 = _1696;
      _1807 = _1697;
      _1808 = _1698;
    }
    bool _1809 = (_1502 > 0.20000000298023224f);
    half4 _1812 = __3__36__0__0__g_specularResultPrev.Load(int3(_1803, ((int)((uint)(_1804) + 1u)), 0));
    float _1825 = float((bool)((uint)(!(_1809 ^ (_1812.w < 0.0h))))) * _1805;
    half4 _1832 = __3__36__0__0__g_specularResultPrev.Load(int3(((int)((uint)(_1803) + 1u)), ((int)((uint)(_1804) + 1u)), 0));
    float _1845 = float((bool)((uint)(!(_1809 ^ (_1832.w < 0.0h))))) * _1806;
    half4 _1855 = __3__36__0__0__g_specularResultPrev.Load(int3(((int)((uint)(_1803) + 1u)), _1804, 0));
    float _1868 = float((bool)((uint)(!(_1809 ^ (_1855.w < 0.0h))))) * _1807;
    half4 _1878 = __3__36__0__0__g_specularResultPrev.Load(int3(_1803, _1804, 0));
    float _1891 = float((bool)((uint)(!(_1809 ^ (_1878.w < 0.0h))))) * _1808;
    float _1915 = 1.0f / max(((saturate(_112 * 0.0625f) * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_1825, _1845, _1868, _1891), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    float _1917 = -0.0f - (min(0.0f, (-0.0f - ((((_1825 * float(_1812.x)) + (_1845 * float(_1832.x))) + (_1868 * float(_1855.x))) + (_1891 * float(_1878.x))))) * _1915);
    float _1919 = -0.0f - (min(0.0f, (-0.0f - ((((_1825 * float(_1812.y)) + (_1845 * float(_1832.y))) + (_1868 * float(_1855.y))) + (_1891 * float(_1878.y))))) * _1915);
    float _1921 = -0.0f - (min(0.0f, (-0.0f - ((((_1825 * float(_1812.z)) + (_1845 * float(_1832.z))) + (_1868 * float(_1855.z))) + (_1891 * float(_1878.z))))) * _1915);
    float _1922 = _1915 * min(0.0f, (-0.0f - ((((_1825 * abs(float(_1812.w))) + (_1845 * abs(float(_1832.w)))) + (_1868 * abs(float(_1855.w)))) + (_1891 * abs(float(_1878.w))))));
    if (_renderParams.y == 0.0f) {
      float _1925 = dot(float3(_1917, _1919, _1921), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _1932 = ((min(_1925, _1101.z) / max(9.999999717180685e-10f, _1925)) * _1105) + saturate(1.0f - _1105);
      _1937 = (_1932 * _1917);
      _1938 = (_1932 * _1919);
      _1939 = (_1932 * _1921);
    } else {
      _1937 = _1917;
      _1938 = _1919;
      _1939 = _1921;
    }
    float _1940 = _1937 * _exposure4.y;
    float _1941 = _1938 * _exposure4.y;
    float _1942 = _1939 * _exposure4.y;
    float _1955 = ((max(0.0010000000474974513f, float(_1255)) + _1922) * _1802) - _1922;
    float _1965 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_1498 * _309.x) - _1940) * _1802) + _1940))));
    float _1966 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_1498 * _309.y) - _1941) * _1802) + _1941))));
    float _1967 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((((_1498 * _309.z) - _1942) * _1802) + _1942))));
    __3__38__0__1__g_specularResultUAV[int2(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))))] = half4(half(_1965), half(_1966), half(_1967), half(select(_1809, (-0.0f - _1955), _1955)));
    float _1975 = select(_399, 0.0f, _1955);
    float _1980 = float(half(lerp(_1975, 1.0f, _1292)));
    bool _1981 = (_722 == 64);
    int _1983 = ((int)(uint)((int)(_171))) ^ 1;
    if ((((int)(uint)((int)(_1981))) & _1983) == 0) {
      _1999 = saturate(exp2((_1980 * _1980) * (_112 * -0.005770780146121979f)));
    } else {
      _1999 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);
    }
    bool _2002 = (_cavityParams.x == 0.0f);
    float _2003 = select(_2002, 1.0f, _1999);
    if (_1981) {
      _2009 = (_2003 * _1247);
      _2010 = (_2003 * _1248);
      _2011 = (_2003 * _1249);
    } else {
      _2009 = _1247;
      _2010 = _1248;
      _2011 = _1249;
    }
    float2 _2016 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _442), (1.0f - _1980)), 0.0f);
    float _2027 = select(((_1981) || (_399)), 1.0f, _2003) * _1154;
    if (!_662) {
      if (((_108 != 7)) && ((!(((_108 == 6)) || (((((((uint)(_108 + -27) < (uint)2)) || ((((_108 == 26)) || (((_399) || (_1551))))))) || ((_722 == 106)))))))) {
        float _2057 = exp2(log2(_1975) * (saturate(_112 * 0.03125f) + 1.0f));
        float4 _2066 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_100, _101), 0.0f);
        bool __defer_2051_2084 = false;
        bool __branch_chain_2051;
        if (((_108 == 15)) || (((((_106.x & 124) == 16)) || ((_722 == 12))))) {
          _2085 = false;
          _2086 = true;
          __branch_chain_2051 = true;
        } else {
          if (!((uint)_108 > (uint)10)) {
            _2085 = true;
            _2086 = _1551;
            __branch_chain_2051 = true;
          } else {
            if ((uint)_108 < (uint)20) {
              _2085 = false;
              _2086 = _1551;
              __branch_chain_2051 = true;
            } else {
              if (!(_108 == 97)) {
                _2085 = (_108 != 107);
                _2086 = _1551;
                __branch_chain_2051 = true;
              } else {
                _2278 = _1231;
                _2279 = _1292;
                _2280 = _1221;
                _2281 = _1222;
                _2282 = _1223;
                __branch_chain_2051 = false;
              }
            }
          }
        }
        if (__branch_chain_2051) {
          __defer_2051_2084 = true;
        }
        if (__defer_2051_2084) {
          if (_2066.w < 1.0f) {
            if ((_weatherCheckFlag & 5) == 5) {
              bool _2096 = (_108 == 36);
              if (!_2096) {
                float4 _2116 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _393) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _395) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                _2122 = _2116.x;
                _2123 = _2116.y;
                _2124 = _2116.z;
                _2125 = _2116.w;
              } else {
                _2122 = 0.11999999731779099f;
                _2123 = 0.11999999731779099f;
                _2124 = 0.10000000149011612f;
                _2125 = 0.5f;
              }
              float _2132 = 1.0f - saturate(((_viewPos.y + _394) - _paramGlobalSand.x) / _paramGlobalSand.y);
              if (!(_2132 <= 0.0f)) {
                float _2135 = saturate(_2057);
                float _2148 = ((_2123 * 0.3395099937915802f) + (_2122 * 0.6131200194358826f)) + (_2124 * 0.047370001673698425f);
                float _2149 = ((_2123 * 0.9163600206375122f) + (_2122 * 0.07020000368356705f)) + (_2124 * 0.013450000435113907f);
                float _2150 = ((_2123 * 0.10958000272512436f) + (_2122 * 0.02061999961733818f)) + (_2124 * 0.8697999715805054f);
                float _2155 = select(_2086, 1.0f, float((bool)(uint)(saturate(dot(float3(_432, _433, _434), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                if (_enableSandAO == 1) {
                  float _2160 = 1.0f - _2066.x;
                  if (_2096) {
                    _2191 = ((((_2160 * 10.0f) * _2125) * _2132) * _2135);
                    _2194 = _2148;
                    _2195 = _2149;
                    _2196 = _2150;
                    _2197 = saturate(_2191);
                  } else {
                    float _2171 = saturate(_2125 + -0.5f);
                    _2194 = _2148;
                    _2195 = _2149;
                    _2196 = _2150;
                    _2197 = ((((_2171 * 2.0f) * max((_2155 * _2066.x), min((_2135 * ((_2066.x * 7.0f) + 3.0f)), (_2171 * 40.0f)))) + (((_2160 * 10.0f) * _2135) * saturate((0.5f - _2125) * 2.0f))) * _2132);
                  }
                } else {
                  float _2189 = ((_2132 * _2125) * _2066.x) * _2155;
                  if (_2096) {
                    _2191 = _2189;
                    _2194 = _2148;
                    _2195 = _2149;
                    _2196 = _2150;
                    _2197 = saturate(_2191);
                  } else {
                    _2194 = _2148;
                    _2195 = _2149;
                    _2196 = _2150;
                    _2197 = _2189;
                  }
                }
              } else {
                _2194 = 0.0f;
                _2195 = 0.0f;
                _2196 = 0.0f;
                _2197 = 0.0f;
              }
              float _2201 = ((1.0f - _2066.w) * (1.0f - _2066.y)) * _2197;
              bool _2202 = (_2201 > 9.999999747378752e-05f);
              if (_2202) {
                if (_2086) {
                  float _2205 = saturate(_2201);
                  _2232 = (((sqrt(_2194 * _1221) - _1221) * _2205) + _1221);
                  _2233 = (((sqrt(_2195 * _1222) - _1222) * _2205) + _1222);
                  _2234 = (((sqrt(_2196 * _1223) - _1223) * _2205) + _1223);
                } else {
                  _2232 = ((_2201 * (_2194 - _1221)) + _1221);
                  _2233 = ((_2201 * (_2195 - _1222)) + _1222);
                  _2234 = ((_2201 * (_2196 - _1223)) + _1223);
                }
              } else {
                _2232 = _1221;
                _2233 = _1222;
                _2234 = _1223;
              }
              if ((_2096) && (_2202)) {
                if (_2086) {
                  _2249 = (((sqrt(_1292 * 0.25f) - _1292) * saturate(_2201)) + _1292);
                } else {
                  _2249 = ((_2201 * (0.25f - _1292)) + _1292);
                }
              } else {
                _2249 = _1292;
              }
              float _2250 = saturate(_2232);
              float _2251 = saturate(_2233);
              float _2252 = saturate(_2234);
              float _2257 = (_2249 * (1.0f - _2057)) + _2057;
              float _2260 = ((_2249 - _2257) * _2066.y) + _2257;
              float _2267 = (((_2057 * _2057) * _2066.z) * float((bool)(uint)(_2085))) * saturate(dot(float3(_432, _433, _434), float3(0.0f, 1.0f, 0.0f)));
              float _2268 = _2267 * -0.5f;
              _2278 = (_1231 - (_2057 * _1231));
              _2279 = (_2260 - (_2267 * _2260));
              _2280 = ((_2268 * _2250) + _2250);
              _2281 = ((_2268 * _2251) + _2251);
              _2282 = ((_2268 * _2252) + _2252);
            } else {
              _2278 = _1231;
              _2279 = _1292;
              _2280 = _1221;
              _2281 = _1222;
              _2282 = _1223;
            }
          } else {
            _2278 = _1231;
            _2279 = _1292;
            _2280 = _1221;
            _2281 = _1222;
            _2282 = _1223;
          }
        }
        _2289 = half(_2278);
        _2290 = half(_2279);
        _2291 = half(_2280);
        _2292 = half(_2281);
        _2293 = half(_2282);
        _2294 = _2057;
      } else {
        _2289 = _427;
        _2290 = _428;
        _2291 = _429;
        _2292 = _430;
        _2293 = _431;
        _2294 = _1975;
      }
    } else {
      _2289 = _427;
      _2290 = _428;
      _2291 = _429;
      _2292 = _430;
      _2293 = _431;
      _2294 = _1975;
    }
    half4 _2296 = __3__36__0__0__g_sceneShadowColor.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
    [branch]
    if (_399) {
      uint _2302 = __3__36__0__0__g_sceneNormal.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
      float _2318 = min(1.0f, ((float((uint)((uint)(_2302.x & 1023))) * 0.001956947147846222f) + -1.0f));
      float _2319 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_2302.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _2320 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_2302.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _2322 = rsqrt(dot(float3(_2318, _2319, _2320), float3(_2318, _2319, _2320)));
      _2330 = half(_2322 * _2318);
      _2331 = half(_2322 * _2319);
      _2332 = half(_2322 * _2320);
    } else {
      _2330 = _250;
      _2331 = _251;
      _2332 = _252;
    }
    bool _2335 = (_sunDirection.y > 0.0f);
    if ((_2335) || ((!(_2335)) && (_sunDirection.y > _moonDirection.y))) {
      _2347 = _sunDirection.x;
      _2348 = _sunDirection.y;
      _2349 = _sunDirection.z;
    } else {
      _2347 = _moonDirection.x;
      _2348 = _moonDirection.y;
      _2349 = _moonDirection.z;
    }
    if ((_2335) || ((!(_2335)) && (_sunDirection.y > _moonDirection.y))) {
      _2369 = _precomputedAmbient7.y;
    } else {
      _2369 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    float _2375 = (_earthRadius + _394) + _viewPos.y;
    float _2379 = (_395 * _395) + (_393 * _393);
    float _2381 = sqrt((_2375 * _2375) + _2379);
    float _2386 = dot(float3((_393 / _2381), (_2375 / _2381), (_395 / _2381)), float3(_2347, _2348, _2349));
    float _2391 = min(max(((_2381 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    float _2399 = max(_2391, 0.0f);
    float _2406 = (-0.0f - sqrt((_2399 + (_earthRadius * 2.0f)) * _2399)) / (_2399 + _earthRadius);
    if (_2386 > _2406) {
      _2429 = ((exp2(log2(saturate((_2386 - _2406) / (1.0f - _2406))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _2429 = ((exp2(log2(saturate((_2406 - _2386) / (_2406 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
    float2 _2433 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_2391 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _2429), 0.0f);
    float _2455 = ((_2433.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
    float _2473 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _2433.x) + _2455) * -1.4426950216293335f);
    float _2474 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _2433.x) + _2455) * -1.4426950216293335f);
    float _2475 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((uint)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _2433.x) + _2455) * -1.4426950216293335f);
    float _2491 = sqrt(_2379);
    float _2499 = (_cloudAltitude - (max(((_2491 * _2491) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    float _2511 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_2348 > 0.0f))) - ((int)(uint)((int)(_2348 < 0.0f))))) * 0.5f))) + _2499;
    if (_394 < _2499) {
      float _2514 = dot(float3(0.0f, 1.0f, 0.0f), float3(_2347, _2348, _2349));
      float _2520 = select((abs(_2514) < 9.99999993922529e-09f), 1e+08f, ((_2511 - dot(float3(0.0f, 1.0f, 0.0f), float3(_393, _394, _395))) / _2514));
      _2526 = ((_2520 * _2347) + _393);
      _2527 = _2511;
      _2528 = ((_2520 * _2349) + _395);
    } else {
      _2526 = _393;
      _2527 = _394;
      _2528 = _395;
    }
    float _2537 = __3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_2526 * 4.999999873689376e-05f) + 0.5f), ((_2527 - _2499) / _cloudThickness), ((_2528 * 4.999999873689376e-05f) + 0.5f)), 0.0f);
    float _2548 = saturate(abs(_2348) * 4.0f);
    float _2550 = (_2548 * _2548) * exp2(((_distanceScale * -1.4426950216293335f) * _2537.x) * (_cloudScatteringCoefficient / _distanceScale));
    float _2557 = ((1.0f - _2550) * saturate(((_394 - _cloudThickness) - _2499) * 0.10000000149011612f)) + _2550;
    float _2558 = _2557 * (((_2474 * 0.3395099937915802f) + (_2473 * 0.6131200194358826f)) + (_2475 * 0.047370001673698425f));
    float _2559 = _2557 * (((_2474 * 0.9163600206375122f) + (_2473 * 0.07020000368356705f)) + (_2475 * 0.013450000435113907f));
    float _2560 = _2557 * (((_2474 * 0.10958000272512436f) + (_2473 * 0.02061999961733818f)) + (_2475 * 0.8697999715805054f));
    float _2576 = (((_2558 * 0.6131200194358826f) + (_2559 * 0.3395099937915802f)) + (_2560 * 0.047370001673698425f)) * _2369;
    float _2577 = (((_2558 * 0.07020000368356705f) + (_2559 * 0.9163600206375122f)) + (_2560 * 0.013450000435113907f)) * _2369;
    float _2578 = (((_2558 * 0.02061999961733818f) + (_2559 * 0.10958000272512436f)) + (_2560 * 0.8697999715805054f)) * _2369;
    // RenoDX: purkinje colour shift for direct moonlight
    {
      bool _purk_isMoon = !_2335 && (_sunDirection.y <= _moonDirection.y);
      float3 _purk_light = ApplyPurkinjeShift(
        float3(_2576, _2577, _2578), _sunDirection.y, _purk_isMoon);
      _2576 = _purk_light.x;
      _2577 = _purk_light.y;
      _2578 = _purk_light.z;
    }
    float _2581 = float(_2296.x);
    float _2582 = float(_2296.y);
    float _2583 = float(_2296.z);
    if (!(_313) | !((((uint)_108 < (uint)20)) || ((_108 == 107)))) {
      _2591 = (_108 == 20);
    } else {
      _2591 = true;
    }
    if (_108 == 19) {
      _2600 = true;
      _2603 = _2600;
      _2604 = (_108 == 106);
    } else {
      bool _2594 = (_108 == 107);
      if (!((((_1551) || ((_108 == 28)))) || ((_722 == 26)))) {
        _2600 = _2594;
        _2603 = _2600;
        _2604 = (_108 == 106);
      } else {
        _2603 = _2594;
        _2604 = true;
      }
    }
    float _2605 = float(_2330);
    float _2606 = float(_2331);
    float _2607 = float(_2332);
    if (_108 == 97) {
      uint16_t _2611 = __3__36__0__0__g_sceneDecalMask.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
      _2618 = (((uint)((uint)((int)(min16uint)((int)((int)(_2611.x) & 2)))) >> 1) + 97);
    } else {
      _2618 = _108;
    }
    float _2623 = float(saturate(_190));
    float _2624 = _2623 * _2623;
    float _2625 = _2624 * _2624;
    float _2626 = _2625 * _2625;
    float4 _2633 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _95), (_bufferSizeAndInvSize.w * _96)), 0.0f);
    float _2637 = ((_2626 * _2626) * select(((_278) || (((_2603) || (_2604)))), 0.0f, 1.0f)) * _2633.y;
    float _2642 = _2605 - (_2637 * _2605);
    float _2643 = (_2637 * (1.0f - _2606)) + _2606;
    float _2644 = _2607 - (_2637 * _2607);
    float _2646 = rsqrt(dot(float3(_2642, _2643, _2644), float3(_2642, _2643, _2644)));
    float _2647 = _2642 * _2646;
    float _2648 = _2643 * _2646;
    float _2649 = _2644 * _2646;
    if ((_2335) || ((!(_2335)) && (_sunDirection.y > _moonDirection.y))) {
      _2661 = _sunDirection.x;
      _2662 = _sunDirection.y;
      _2663 = _sunDirection.z;
    } else {
      _2661 = _moonDirection.x;
      _2662 = _moonDirection.y;
      _2663 = _moonDirection.z;
    }
    float _2664 = _2576 * _lightingParams.x;
    float _2665 = _2577 * _lightingParams.x;
    float _2666 = _2578 * _lightingParams.x;
    float _2667 = _2661 - _435;
    float _2668 = _2662 - _437;
    float _2669 = _2663 - _439;
    float _2671 = rsqrt(dot(float3(_2667, _2668, _2669), float3(_2667, _2668, _2669)));
    float _2672 = _2671 * _2667;
    float _2673 = _2671 * _2668;
    float _2674 = _2671 * _2669;
    float _2675 = dot(float3(_2605, _2606, _2607), float3(_2661, _2662, _2663));
    float _2676 = dot(float3(_2647, _2648, _2649), float3(_2661, _2662, _2663));
    float _2678 = saturate(dot(float3(_2605, _2606, _2607), float3(_436, _438, _440)));
    float _2680 = saturate(dot(float3(_2647, _2648, _2649), float3(_2672, _2673, _2674)));
    float _2683 = saturate(dot(float3(_2661, _2662, _2663), float3(_2672, _2673, _2674)));
    float _2685 = float(max(0.010002136h, _2290));
    float _2686 = saturate(_2675);
    float _rndx_spec_rough = _2685;
    // Material Improvements: specular AA filters roughness only when the gate is enabled.
    if (SPECULAR_AA > 0.0f) {
      _rndx_spec_rough = NDFFilterRoughnessCS(float3(_2647, _2648, _2649), _2685, SPECULAR_AA);
    }
    float _2687 = _rndx_spec_rough * _rndx_spec_rough;
    float _2688 = _2687 * _2687;
    float _2689 = 1.0f - _2688;
    float _2690 = 1.0f - _2683;
    float _2691 = _2690 * _2690;
    float _2694 = ((_2691 * _2691) * _2690) + _2683;
    float _2695 = 1.0f - _2686;
    float _2696 = _2695 * _2695;
    float _2701 = 1.0f - _2678;
    float _2702 = _2701 * _2701;
    float _2730;
    // Material Improvements: optional diffuse BRDF replacement, otherwise vanilla diffuse.
    if (DIFFUSE_BRDF_MODE >= 1.0f) {
      float _eon_LdotV = dot(float3(_2661, _2662, _2663), float3(_436, _438, _440));
      _2730 = _2686 * EON_DiffuseScalar(_2686, _2678, _eon_LdotV, _2685);
    } else {
      _2730 = saturate((_2686 * 0.31830987334251404f) * ((((((1.0f - ((_2696 * _2696) * (_2695 * 0.75f))) * (1.0f - ((_2702 * _2702) * (_2701 * 0.75f)))) - _2694) * saturate((_2689 * 2.200000047683716f) + -0.5f)) + _2694) + ((exp2(-0.0f - (max(((_2689 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_2680))) * _2683) * ((((_2689 * 34.5f) + -59.0f) * _2689) + 24.5f))));
    }
    int _2731 = _2618 & 126;
    bool __defer_2660_2741 = false;
    bool __branch_chain_2660;
    if (((_2618 == 98)) || ((_2731 == 96))) {
      _2742 = true;
      __branch_chain_2660 = true;
    } else {
      if ((uint)(_2618 + -105) < (uint)2) {
        _2742 = _170;
        __branch_chain_2660 = true;
      } else {
        if (!((uint)(_2618 + -11) < (uint)9)) {
          _2742 = false;
          __branch_chain_2660 = true;
        } else {
          __branch_chain_2660 = false;
        }
      }
    }
    if (__branch_chain_2660) {
      __defer_2660_2741 = true;
    } else {
      _2750 = 0.0f;
    }
    if (__defer_2660_2741) {
      if (((_2618 == 65)) || ((((_2618 == 107)) || (_2742)))) {
        _2750 = 0.0f;
      } else {
        _2750 = float(_2289);
      }
    }
    bool _2751 = (_2618 == 53);
    float _2752 = float(_2291);
    float _2753 = float(_2292);
    float _2754 = float(_2293);
    if (_2751) {
      _2761 = saturate(((_2753 + _2752) + _2754) * 1.2000000476837158f);
    } else {
      _2761 = 1.0f;
    }
    float _2767 = (0.699999988079071f / min(max(max(max(_2752, _2753), _2754), 0.009999999776482582f), 0.699999988079071f)) * _2761;
    float _2777 = (((_2767 * _2752) + -0.03999999910593033f) * _2750) + 0.03999999910593033f;
    float _2778 = (((_2767 * _2753) + -0.03999999910593033f) * _2750) + 0.03999999910593033f;
    float _2779 = (((_2767 * _2754) + -0.03999999910593033f) * _2750) + 0.03999999910593033f;
    float _2780 = float(_2290);
    bool _2781 = (_2731 == 64);
    bool _2784 = ((((int)(uint)((int)(_2781))) & _1983) == 0);
    if (_2784) {
      _2796 = saturate(exp2((_2780 * _2780) * (_112 * -0.005770780146121979f)));
    } else {
      _2796 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);
    }
    float _2797 = select(_2002, 1.0f, _2796);
    if (_2781) {
      _2803 = (_2797 * _2777);
      _2804 = (_2797 * _2778);
      _2805 = (_2797 * _2779);
    } else {
      _2803 = _2777;
      _2804 = _2778;
      _2805 = _2779;
    }
    float _2808 = saturate(1.0f - saturate(dot(float3(_436, _438, _440), float3(_2672, _2673, _2674))));
    float _2809 = _2808 * _2808;
    float _2811 = (_2809 * _2809) * _2808;
    float _2814 = _2811 * saturate(_2804 * 50.0f);
    float _2815 = 1.0f - _2811;
    if (!_278) {
      float _2823 = saturate(_2676);
      float _2824 = 1.0f - _2687;
      float _2836 = (((_2688 * _2680) - _2680) * _2680) + 1.0f;
      float _2840 = (_2688 / ((_2836 * _2836) * 3.1415927410125732f)) * (0.5f / ((((_2824 * _2678) + _2687) * _2676) + (((_2824 * _2676) + _2687) * _2678)));
      _2854 = ((_2823 * _2581) * max((_2840 * ((_2815 * _2803) + _2814)), 0.0f));
      _2855 = ((_2823 * _2582) * max((_2840 * ((_2815 * _2804) + _2814)), 0.0f));
      _2856 = ((_2823 * _2583) * max((_2840 * ((_2815 * _2805) + _2814)), 0.0f));
    } else {
      _2854 = 0.0f;
      _2855 = 0.0f;
      _2856 = 0.0f;
    }
    // Material Improvements: diffraction tint is disabled unless the material gate is on.
    if (DIFFRACTION > 0.0f && _2750 > 0.0f) {
      float3 _rndx_dShift = DiffractionShiftAndSpeckleCS(
          _2680, _2678, _rndx_spec_rough,
          float2(_100, _101), _112,
          float3(_2672, _2673, _2674),
          float3(_2647, _2648, _2649),
          float3(_2752, _2753, _2754));
      float3 _rndx_dMod = lerp(1.0f, _rndx_dShift, DIFFRACTION * _2750);
      _2854 *= _rndx_dMod.x;
      _2855 *= _rndx_dMod.y;
      _2856 *= _rndx_dMod.z;
    }
    // Material Improvements: smooth terminator is gated separately and defaults off.
    if (SMOOTH_TERMINATOR > 0.0f) {
      float _rndx_c2 = CallistoSmoothTerminator(_2686, _2683, _2680, SMOOTH_TERMINATOR, 0.5f);
      _2730 *= _rndx_c2;
      _2854 *= _rndx_c2;
      _2855 *= _rndx_c2;
      _2856 *= _rndx_c2;
    }
    float _rndx_foliageTransR = 0.0f;
    float _rndx_foliageTransG = 0.0f;
    float _rndx_foliageTransB = 0.0f;
    // RenoDX: >>> [Patch: FoliageTransmission] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x14947ADD adds AO+ foliage transmission for foliage stencil materials during direct diffuse lighting, injecting the helper's transmission contribution into the final diffuse color while preserving vanilla lighting for non-foliage pixels and lower foliage modes.
    if (FOLIAGE_TRANSMISSION > 0.0f && ((uint)(_108 - 12) < 7u)) {
      FoliageTransmissionResult _rndx_ftResult = FoliageTransmission(
          float3(_436, _438, _440),
          float3(_2661, _2662, _2663),
          float3(_2605, _2606, _2607),
          _2675,
          float3(_2752, _2753, _2754),
          float3(_2581, _2582, _2583),
          float3(_2664, _2665, _2666),
          FOLIAGE_TRANSMISSION_THICKNESS);

      _rndx_foliageTransR = _rndx_ftResult.transmission.x;
      _rndx_foliageTransG = _rndx_ftResult.transmission.y;
      _rndx_foliageTransB = _rndx_ftResult.transmission.z;

      if (_rndx_ftResult.diffuseScale > 0.0f) {
        _2730 *= _rndx_ftResult.diffuseScale;
      } else {
        float _rndx_wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
        _2730 = max(0.0f, (_2675 + _rndx_wrap) / (1.0f + _rndx_wrap)) * 0.31830987334251404f * 0.75f;
      }
    }
    // RenoDX: <<< [Patch: FoliageTransmission]
    if ((_2591) || ((_2731 == 6))) {
      _2865 = ((max(0.0f, (0.30000001192092896f - _2675)) * 0.23190687596797943f) + _2730);
    } else {
      _2865 = _2730;
    }
    float _2872 = ((_2581 * _2865) * _2664) + (_1212 * _1154) + _rndx_foliageTransR;
    float _2873 = ((_2582 * _2865) * _2665) + (_1213 * _1154) + _rndx_foliageTransG;
    float _2874 = ((_2583 * _2865) * _2666) + (_1214 * _1154) + _rndx_foliageTransB;
    uint _2877 = _frameNumber.x * 13;
    [branch]
    if (((((int)(_2877 + ((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160))))) | ((int)(_2877 + ((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((int)(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))) >> 5)), ((int)(((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))) >> 5)))] = half4(half(_2872), half(_2873), half(_2874), 1.0h);
    }
    bool _2892 = ((uint)(_2618 & 24) > (uint)23);
    if (_2784) {
      _2909 = saturate(exp2((_2780 * _2780) * (_112 * -0.005770780146121979f)));
    } else {
      _2909 = select((_cavityParams.z > 0.0f), select(_171, 0.0f, _425), 1.0f);
    }
    float _2927 = select(_2781, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _2909) * select(((_170) && (_2892)), (1.0f - _425), 1.0f)));
    float _2931 = min(60000.0f, (_2927 * (((((_2016.x * _2009) + _2016.y) * _1965) * _2027) - min(0.0f, (-0.0f - (_2664 * _2854))))));
    float _2932 = min(60000.0f, (_2927 * (((((_2016.x * _2010) + _2016.y) * _1966) * _2027) - min(0.0f, (-0.0f - (_2665 * _2855))))));
    float _2933 = min(60000.0f, (_2927 * (((((_2016.x * _2011) + _2016.y) * _1967) * _2027) - min(0.0f, (-0.0f - (_2666 * _2856))))));
    float _2936 = 1.0f - _renderParams.x;
    half _2943 = half((_renderParams.x * _2752) + _2936);
    half _2944 = half((_renderParams.x * _2753) + _2936);
    half _2945 = half((_renderParams.x * _2754) + _2936);
    if ((_2781) && ((_renderParams2.x == 0.0f))) {
      _2961 = (pow(_2943, 0.5h));
      _2962 = (pow(_2944, 0.5h));
      _2963 = (pow(_2945, 0.5h));
    } else {
      _2961 = _2943;
      _2962 = _2944;
      _2963 = _2945;
    }
    float _2964 = float(_2961);
    float _2965 = float(_2962);
    float _2966 = float(_2963);
    if (_2751) {
      _2973 = saturate(((_2965 + _2964) + _2966) * 1.2000000476837158f);
    } else {
      _2973 = 1.0f;
    }
    float _2974 = float(_2289);
    float _2980 = (0.699999988079071f / min(max(max(max(_2964, _2965), _2966), 0.009999999776482582f), 0.699999988079071f)) * _2973;
    float _2987 = ((_2980 * _2964) + -0.03999999910593033f) * _2974;
    float _2988 = ((_2980 * _2965) + -0.03999999910593033f) * _2974;
    float _2989 = ((_2980 * _2966) + -0.03999999910593033f) * _2974;
    float _2990 = _2987 + 0.03999999910593033f;
    float _2991 = _2988 + 0.03999999910593033f;
    float _2992 = _2989 + 0.03999999910593033f;
    float _2996 = (_2990 * _2016.x) + _2016.y;
    float _2997 = (_2991 * _2016.x) + _2016.y;
    float _2998 = (_2992 * _2016.x) + _2016.y;
    float _3000 = (1.0f - _2016.y) - _2016.x;
    float _3007 = ((0.9599999785423279f - _2987) * 0.0476190485060215f) + _2990;
    float _3008 = ((0.9599999785423279f - _2988) * 0.0476190485060215f) + _2991;
    float _3009 = ((0.9599999785423279f - _2989) * 0.0476190485060215f) + _2992;
    float _3026 = saturate(1.0f - _2294);
    float _3027 = (((_2996 * _3007) / (1.0f - (_3007 * _3000))) * _3000) * _3026;
    float _3028 = (((_2997 * _3008) / (1.0f - (_3008 * _3000))) * _3000) * _3026;
    float _3029 = (((_2998 * _3009) / (1.0f - (_3009 * _3000))) * _3000) * _3026;
    float _3040 = float(1.0h - _2289);
    half _3050 = half(((_2964 * _3040) * saturate((1.0f - _3027) - _2996)) + _3027);
    half _3051 = half(((_2965 * _3040) * saturate((1.0f - _3028) - _2997)) + _3028);
    half _3052 = half(((_2966 * _3040) * saturate((1.0f - _3029) - _2998)) + _3029);
    float _3055 = __3__36__0__0__g_caustic.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_100, _101), 0.0f);
    float _3057 = _3055.x * 0.31830987334251404f;
    float _3067 = ((_3057 * _2576) + _2872) * float(_3050);
    float _3068 = ((_3057 * _2577) + _2873) * float(_3051);
    float _3069 = ((_3057 * _2578) + _2874) * float(_3052);
    float _3073 = _3067 + (_2931 * _2974);
    float _3074 = _3068 + (_2932 * _2974);
    float _3075 = _3069 + (_2933 * _2974);
    float _3097;
    float _3098;
    float _3099;
    // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
    // Description: Crimson Desert 1.11 avoids averaging half-resolution history across a 2x2 quad that contains any invalid lane. This preserves the current lane value for mixed valid/invalid quads instead of blending in invalid neighbors.
    if (!(((_rndx_quadInvalid0 || _rndx_quadInvalid1) || _rndx_quadInvalid2) || _rndx_quadInvalid3)) {
      _3097 = ((((QuadReadLaneAt(_3073,1) + QuadReadLaneAt(_3073,0)) + QuadReadLaneAt(_3073,2)) + QuadReadLaneAt(_3073,3)) * 0.25f);
      _3098 = ((((QuadReadLaneAt(_3074,1) + QuadReadLaneAt(_3074,0)) + QuadReadLaneAt(_3074,2)) + QuadReadLaneAt(_3074,3)) * 0.25f);
      _3099 = ((((QuadReadLaneAt(_3075,1) + QuadReadLaneAt(_3075,0)) + QuadReadLaneAt(_3075,2)) + QuadReadLaneAt(_3075,3)) * 0.25f);
    } else {
      _3097 = _3073;
      _3098 = _3074;
      _3099 = _3075;
    }
    // RenoDX: <<< [Patch: Native111InvalidLaneParity]
    [branch]
    if (((((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))) | ((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160))))) & 1) == 0) {
      float _3104 = dot(float3(_3097, _3098, _3099), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((int)(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))) >> 1)), ((int)(((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))) >> 1)))] = float4(min(60000.0f, _3097), min(60000.0f, _3098), min(60000.0f, _3099), min(60000.0f, select((_1023 != 0), (-0.0f - _3104), _3104)));
    }
    if (_2892) {
      _3126 = (((_2289 == 0.0h)) && ((!(((((!(_3050 == 0.0h))) && ((!(_3051 == 0.0h))))) && ((!(_3052 == 0.0h)))))));
    } else {
      _3126 = false;
    }
    bool __defer_3125_3139 = false;
    if (((_2892) || ((((_2618 == 96)) || ((((_2618 == 54)) || (((_2618 & 124) == 64))))))) || ((!((_2892) || ((((_2618 == 96)) || ((((_2618 == 54)) || (((_2618 & 124) == 64)))))))) && (((_112 <= 10.0f)) && (((uint)(_2618 + -97) < (uint)2))))) {
      __defer_3125_3139 = true;
    } else {
      _3162 = (_3067 + _2931);
      _3163 = (_3068 + _2932);
      _3164 = (_3069 + _2933);
    }
    if (__defer_3125_3139) {
      __3__38__0__1__g_sceneSpecularUAV[int2(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))))] = half4((-0.0h - half(min(0.0f, (-0.0f - _2931)))), (-0.0h - half(min(0.0f, (-0.0f - _2932)))), (-0.0h - half(min(0.0f, (-0.0f - _2933)))), (-0.0h - half(min(0.0f, (-0.0f - _1975)))));
      _3162 = _3067;
      _3163 = _3068;
      _3164 = _3069;
    }
    float _3165 = min(60000.0f, _3162);
    float _3166 = min(60000.0f, _3163);
    float _3167 = min(60000.0f, _3164);
    // RenoDX: >>> [Patch: Native111InvalidLaneParity] [Version: 1.11.0]
    // Description: Because the 1.11 RenderDiffuseTiled body can run for invalid lanes in partially valid quads, this guard preserves vanilla 1.11 behavior by preventing invalid pixels from reading, accumulating, or storing full-resolution scene color.
    if (!_rndx_invalidPixel) {
    [branch]
    if (_3126) {
      float4 _3170 = __3__38__0__1__g_sceneColorUAV.Load(int2(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160))))));
      _3178 = (_3170.x + _3165);
      _3179 = (_3170.y + _3166);
      _3180 = (_3170.z + _3167);
    } else {
      _3178 = _3165;
      _3179 = _3166;
      _3180 = _3167;
    }
    if (!(_renderParams.y == 0.0f)) {
      float _3189 = dot(float3(_3178, _3179, _3180), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _3190 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _3189);
      float _3194 = max(9.999999717180685e-10f, _3189);
      _3199 = ((_3190 * _3178) / _3194);
      _3200 = ((_3190 * _3179) / _3194);
      _3201 = ((_3190 * _3180) / _3194);
    } else {
      _3199 = _3178;
      _3200 = _3179;
      _3201 = _3180;
    }
    // RenoDX: >>> [Patch: FoliageFinalAO] [Version: 1.11-family]
    // Description: RenderDiffuseTiledCS 0x14947ADD applies RenoDX foliage AO darkening to the final direct-lit scene color for foliage stencil materials, using vanilla scene AO and shadow visibility so direct light remains naturally occluded.
    if (FOLIAGE_AO_STRENGTH > 0.0f && ((uint)(_108 - 12) < 7u)) {
      half4 _rndx_shadow = __3__36__0__0__g_sceneShadowColor.Load(int3(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))), 0));
      float _rndx_directRatio = saturate(dot(float3(_rndx_shadow.xyz), float3(0.333f, 0.333f, 0.333f)));
      float _rndx_ao = lerp(1.0f, float(_334.x), _rndx_directRatio * FOLIAGE_AO_STRENGTH);
      _3199 *= _rndx_ao;
      _3200 *= _rndx_ao;
      _3201 *= _rndx_ao;
    }
    // RenoDX: <<< [Patch: FoliageFinalAO]
    __3__38__0__1__g_sceneColorUAV[int2(((int)((((uint)((_61 - (_62 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_84) << 5)) & 8160)))), ((int)((((uint)(_62 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_84)) >> 3) & 8160)))))] = float4(_3199, _3200, _3201, 1.0f);
    }
    // RenoDX: <<< [Patch: Native111InvalidLaneParity]
  }
}
