#include "../shared.h"
#include "../sky-atmospheric/sky_dawn_dusk_common.hlsli"
#include "diffuse_brdf.hlsli"
#include "foliage_common.hlsli"

Texture2D<float4> __3__36__0__0__g_puddleMask : register(t87, space36);

Texture2D<float4> __3__36__0__0__g_climateSandTex : register(t165, space36);

Texture2D<uint16_t> __3__36__0__0__g_sceneDecalMask : register(t166, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t19, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t195, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t0, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t152, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t79, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t91, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t92, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t39, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t49, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t94, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t50, space36);

Texture2D<float4> __3__36__0__0__g_specularResult : register(t97, space36);

Texture2D<float> __3__36__0__0__g_specularRayHitDistance : register(t180, space36);

Texture2D<float4> __3__36__0__0__g_manyLightsMoments : register(t160, space36);

Texture2D<float2> __3__36__0__0__g_iblBrdfLookup : register(t98, space36);

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
  int _47[4];
  int _60 = (int)(SV_GroupID.x) & 15;
  int _61 = (uint)((uint)(_60)) >> 2;
  _47[0] = ((g_tileIndex[(SV_GroupID.x) >> 6]).x);
  _47[1] = ((g_tileIndex[(SV_GroupID.x) >> 6]).y);
  _47[2] = ((g_tileIndex[(SV_GroupID.x) >> 6]).z);
  _47[3] = ((g_tileIndex[(SV_GroupID.x) >> 6]).w);
  int _79 = _47[(((uint)(SV_GroupID.x) >> 4) & 3)];
  float _90 = float((uint)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))) + 0.5f;
  float _91 = float((uint)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))) + 0.5f;
  float _95 = _bufferSizeAndInvSize.z * _90;
  float _96 = _91 * _bufferSizeAndInvSize.w;
  float _98 = __3__36__0__0__g_depth.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
  uint2 _101 = __3__36__0__0__g_stencil.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
  int _103 = _101.x & 127;
  float _106 = max(1.0000000116860974e-07f, _98.x);
  float _107 = _nearFarProj.x / _106;
  float _300;
  float _301;
  float _302;
  bool _318;
  bool _339;
  half _347;
  float _400;
  float _411;
  float _412;
  float _420;
  float _421;
  half _422;
  half _423;
  half _424;
  half _425;
  half _426;
  bool _460;
  float _469;
  float _510;
  float _511;
  float _598;
  float _676;
  float _849;
  float _850;
  float _851;
  float _852;
  float _1017;
  int _1018;
  float _1075;
  float _1191;
  float _1192;
  float _1193;
  float _1194;
  float _1221;
  half _1246;
  bool _1258;
  half _1265;
  float _1532;
  float _1549;
  float _1553;
  float _1582;
  float _1625;
  float _1626;
  float _1627;
  float _1628;
  float _1632;
  float _1633;
  float _1634;
  float _1635;
  float _1638;
  float _1639;
  float _1640;
  float _1641;
  half _1642;
  float _1752;
  int _1753;
  int _1754;
  float _1755;
  float _1756;
  float _1757;
  float _1758;
  float _1885;
  float _1886;
  float _1887;
  float _1949;
  float _1959;
  float _1960;
  float _1961;
  bool _2035;
  bool _2036;
  float _2072;
  float _2073;
  float _2074;
  float _2075;
  float _2141;
  float _2144;
  float _2145;
  float _2146;
  float _2147;
  float _2182;
  float _2183;
  float _2184;
  float _2199;
  float _2228;
  float _2229;
  float _2230;
  float _2231;
  float _2232;
  half _2239;
  half _2240;
  half _2241;
  half _2242;
  half _2243;
  float _2244;
  half _2280;
  half _2281;
  half _2282;
  float _2297;
  float _2298;
  float _2299;
  float _2319;
  float _2379;
  float _2476;
  float _2477;
  float _2478;
  bool _2541;
  bool _2550;
  bool _2553;
  bool _2554;
  int _2568;
  float _2611;
  float _2612;
  float _2613;
  bool _2692;
  float _2700;
  float _2711;
  float _2746;
  float _2753;
  float _2754;
  float _2755;
  float _2804;
  float _2805;
  float _2806;
  float _2815;
  float _2859;
  half _2911;
  half _2912;
  half _2913;
  float _2923;
  bool _3076;
  float _3112;
  float _3113;
  float _3114;
  float _3128;
  float _3129;
  float _3130;
  float _3149;
  float _3150;
  float _3151;
  if (!(((((_98.x < 1.0000000116860974e-07f)) || ((_98.x == 1.0f)))) || ((_103 == 10)))) {
    uint4 _115 = __3__36__0__0__g_baseColor.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
    float4 _121 = __3__36__0__0__g_normal.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
    half _130 = half(float((uint)((uint)(((uint)((uint)(_115.x)) >> 8) & 255))) * 0.003921568859368563f);
    half _134 = half(float((uint)((uint)(_115.x & 255))) * 0.003921568859368563f);
    half _139 = half(float((uint)((uint)(((uint)((uint)(_115.y)) >> 8) & 255))) * 0.003921568859368563f);
    half _148 = half(float((uint)((uint)(((uint)((uint)(_115.z)) >> 8) & 255))) * 0.003921568859368563f);
    uint _164 = uint((_121.w * 3.0f) + 0.5f);
    bool _165 = ((int)(_164) == 1);
    bool _166 = ((int)(_164) == 3);
    float _176 = (saturate(_121.x * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _177 = (saturate(_121.y * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _178 = (saturate(_121.z * 1.0009784698486328f) * 2.0f) + -1.0f;
    float _180 = rsqrt(dot(float3(_176, _177, _178), float3(_176, _177, _178)));
    half _185 = half(_180 * _177);
    half _186 = half(_178 * _180);
    half _189 = (half(float((uint)((uint)(((uint)((uint)(_115.w)) >> 8) & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
    half _190 = (half(float((uint)((uint)(_115.w & 255))) * 0.003921568859368563f) * 2.0h) + -1.0h;
    float _195 = float(_189 + _190) * 0.5f;
    float _196 = float(_189 - _190) * 0.5f;
    float _200 = (1.0f - abs(_195)) - abs(_196);
    float _202 = rsqrt(dot(float3(_195, _196, _200), float3(_195, _196, _200)));
    float _209 = float(half(_180 * _176));
    float _210 = float(_185);
    float _211 = float(_186);
    float _213 = select((_186 >= 0.0h), 1.0f, -1.0f);
    float _216 = -0.0f - (1.0f / (_213 + _211));
    float _217 = _210 * _216;
    float _218 = _217 * _209;
    float _219 = _213 * _209;
    float _226 = float(half(_202 * _195));
    float _227 = float(half(_202 * _196));
    float _228 = float(half(_202 * _200));
    half _240 = half(mad(_228, _209, mad(_227, _218, (_226 * (((_219 * _209) * _216) + 1.0f)))));
    half _241 = half(mad(_228, _210, mad(_227, ((_217 * _210) + _213), ((_226 * _213) * _218))));
    half _242 = half(mad(_228, _211, mad(_227, (-0.0f - _210), (-0.0f - (_219 * _226)))));
    half _244 = rsqrt(dot(half3(_240, _241, _242), half3(_240, _241, _242)));
    half _245 = _244 * _240;
    half _246 = _244 * _241;
    half _247 = _244 * _242;
    half _251 = saturate(_130 * _130);
    half _252 = saturate(_134 * _134);
    half _253 = saturate(_139 * _139);
    half _269 = saturate(((_252 * 0.3395996h) + (_251 * 0.61328125h)) + (_253 * 0.04736328h));
    half _270 = saturate(((_252 * 0.9165039h) + (_251 * 0.07019043h)) + (_253 * 0.013450623h));
    half _271 = saturate(((_252 * 0.109558105h) + (_251 * 0.020614624h)) + (_253 * 0.8696289h));
    bool _273 = (_103 == 29);
    bool _274 = ((_103 == 24)) || (_273);
    half4 _277 = __3__36__0__0__g_diffuseResult.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
    float _281 = float(_277.x);
    float _282 = float(_277.y);
    float _283 = float(_277.z);
    [branch]
    if (_renderParams2.y > 0.0f) {
      half4 _289 = __3__36__0__0__g_sceneDiffuse.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
      _300 = (float(_289.x) + _281);
      _301 = (float(_289.y) + _282);
      _302 = (float(_289.z) + _283);
    } else {
      _300 = _281;
      _301 = _282;
      _302 = _283;
    }
    float4 _304 = __3__36__0__0__g_specularResult.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
    bool _308 = ((uint)_103 > (uint)11);
    if (_308) {
      if (!((((uint)_103 < (uint)21)) || ((_103 == 107)))) {
        _318 = (_103 == 7);
      } else {
        _318 = true;
      }
    } else {
      if (!(_103 == 6)) {
        _318 = (_103 == 7);
      } else {
        _318 = true;
      }
    }
    float _325 = -0.0f - min(0.0f, (-0.0f - _300));
    float _326 = -0.0f - min(0.0f, (-0.0f - _301));
    float _327 = -0.0f - min(0.0f, (-0.0f - _302));
    half2 _329 = __3__36__0__0__g_sceneAO.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
    bool __defer_317_338 = false;
    if (_308) {
      if ((uint)_103 < (uint)20) {
        _347 = 0.0h;
      } else {
        _339 = ((uint)_103 < (uint)19);
        if (((_103 == 65)) || ((((((_103 == 107)) || ((_103 == 96)))) || (_339)))) {
          _347 = 0.0h;
        } else {
          _347 = select(_274, 0.0h, half(float((uint)((uint)(_115.y & 255))) * 0.003921568859368563f));
        }
      }
    } else {
      if ((uint)_103 > (uint)10) {
        _347 = 0.0h;
      } else {
        _339 = false;
        if (((_103 == 65)) || ((((((_103 == 107)) || ((_103 == 96)))) || (_339)))) {
          _347 = 0.0h;
        } else {
          _347 = select(_274, 0.0h, half(float((uint)((uint)(_115.y & 255))) * 0.003921568859368563f));
        }
      }
    }
    if (__defer_317_338) {
      if (((_103 == 65)) || ((((((_103 == 107)) || ((_103 == 96)))) || (_339)))) {
      } else {
        _347 = select(_274, 0.0h, half(float((uint)((uint)(_115.y & 255))) * 0.003921568859368563f));
      }
    }
    float _349 = (_95 * 2.0f) + -1.0f;
    float _351 = 1.0f - (_96 * 2.0f);
    float _387 = mad((_invViewProjRelative[3].z), _106, mad((_invViewProjRelative[3].y), _351, ((_invViewProjRelative[3].x) * _349))) + (_invViewProjRelative[3].w);
    float _388 = (mad((_invViewProjRelative[0].z), _106, mad((_invViewProjRelative[0].y), _351, ((_invViewProjRelative[0].x) * _349))) + (_invViewProjRelative[0].w)) / _387;
    float _389 = (mad((_invViewProjRelative[1].z), _106, mad((_invViewProjRelative[1].y), _351, ((_invViewProjRelative[1].x) * _349))) + (_invViewProjRelative[1].w)) / _387;
    float _390 = (mad((_invViewProjRelative[2].z), _106, mad((_invViewProjRelative[2].y), _351, ((_invViewProjRelative[2].x) * _349))) + (_invViewProjRelative[2].w)) / _387;
    float _392 = rsqrt(dot(float3(_388, _389, _390), float3(_388, _389, _390)));
    bool _394 = ((uint)(_101.x & 24) > (uint)23);
    if (_394) {
      if (_273) {
        _400 = float(saturate(_148));
      } else {
        _400 = 0.0f;
      }
      uint _402 = uint((float)(half(float((uint)((uint)(_115.z & 255))) * 0.003921568859368563f) * 255.0h));
      if (_165) {
        _411 = select((((int)(_402) & 128) != 0), 1.0f, 0.0f);
        _412 = (float((uint)((uint)((int)(_402) & 127))) * 0.007874015718698502f);
      } else {
        _411 = 0.0f;
        _412 = 0.0f;
      }
      half _413 = half(_412);
      bool _415 = (_413 > 0.99902344h);
      _420 = _411;
      _421 = _400;
      _422 = _413;
      _423 = select(_274, 0.010002136h, _148);
      _424 = select(_415, 1.0h, _269);
      _425 = select(_415, 1.0h, _270);
      _426 = select(_415, 1.0h, _271);
    } else {
      _420 = 0.0f;
      _421 = 0.0f;
      _422 = _347;
      _423 = _148;
      _424 = _269;
      _425 = _270;
      _426 = _271;
    }
    // RenoDX: Dynamic foliage color correction (replaces static FOLIAGE_GREEN_DESAT)
    if (FOLIAGE_COLOR_CORRECT > 0.0f && ((uint)(_103 - 12) < 7u)) {
      float3 _fcBaseColor = float3(float(_424), float(_425), float(_426));
      float3 _fcCorrected = FoliageColorCorrect(_fcBaseColor, _sunDirection.xyz, 1.0f, float3(1.0f, 1.0f, 1.0f));
      _424 = half(_fcCorrected.x);
      _425 = half(_fcCorrected.y);
      _426 = half(_fcCorrected.z);
    }
    float _427 = float(_245);
    float _428 = float(_246);
    float _429 = float(_247);
    float _430 = _392 * _388;
    float _431 = -0.0f - _430;
    float _432 = _392 * _389;
    float _433 = -0.0f - _432;
    float _434 = _392 * _390;
    float _435 = -0.0f - _434;
    float _437 = saturate(dot(float3(_431, _433, _435), float3(_427, _428, _429)));
    bool _439 = ((_101.x & 128) == 0);
    if (_439) {
      if ((uint)_103 > (uint)52) {
        if (!((((_101.x & 125) == 105)) || (((uint)_103 < (uint)68)))) {
          _460 = (_103 == 98);
        } else {
          _460 = true;
        }
      } else {
        if ((uint)_103 > (uint)10) {
          if ((uint)_103 < (uint)20) {
            if ((_101.x & 126) == 14) {
              _460 = (_103 == 98);
            } else {
              _460 = true;
            }
          } else {
            if (!((_101.x & 125) == 105)) {
              _460 = (_103 == 98);
            } else {
              _460 = true;
            }
          }
        } else {
          _460 = (_103 == 98);
        }
      }
    } else {
      _460 = true;
    }
    [branch]
    if (_394) {
      uint _463 = __3__36__0__0__g_depthOpaque.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
      _469 = (float((uint)((uint)(_463.x & 16777215))) * 5.960465188081798e-08f);
    } else {
      _469 = _98.x;
    }
    float _497 = mad((_projToPrevProj[3].z), _469, mad((_projToPrevProj[3].y), _351, ((_projToPrevProj[3].x) * _349))) + (_projToPrevProj[3].w);
    if (_460) {
      float2 _504 = __3__36__0__0__g_velocity.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
      _510 = (_504.x * 2.0f);
      _511 = (_504.y * 2.0f);
    } else {
      _510 = (((mad((_projToPrevProj[0].z), _469, mad((_projToPrevProj[0].y), _351, ((_projToPrevProj[0].x) * _349))) + (_projToPrevProj[0].w)) / _497) - _349);
      _511 = (((mad((_projToPrevProj[1].z), _469, mad((_projToPrevProj[1].y), _351, ((_projToPrevProj[1].x) * _349))) + (_projToPrevProj[1].w)) / _497) - _351);
    }
    float _513 = _nearFarProj.x / max(1.0000000116860974e-07f, _469);
    float _516 = (_510 * 0.5f) + _95;
    float _517 = _96 - (_511 * 0.5f);
    float _525 = select((((((_516 < 0.0f)) || ((_516 > 1.0f)))) || ((((_517 < 0.0f)) || ((_517 > 1.0f))))), 1.0f, 0.0f);
    float _530 = (_516 * _bufferSizeAndInvSize.x) + -0.5f;
    float _531 = (_517 * _bufferSizeAndInvSize.y) + -0.5f;
    int _534 = int(floor(_530));
    int _535 = int(floor(_531));
    float _536 = float((int)(_534));
    float _537 = float((int)(_535));
    float _540 = (_536 + 0.5f) * _bufferSizeAndInvSize.z;
    float _541 = (_537 + 0.5f) * _bufferSizeAndInvSize.w;
    int4 _544 = __3__36__0__0__g_depthOpaquePrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_540, _541));
    int _567 = asint(((((uint)((uint)((uint)(_544.w)) >> 24))) * (16777216u)) + ((uint)(asint(((((uint)((uint)((uint)(_544.z)) >> 24))) * (65536u)) + ((uint)(asint(((((uint)((uint)((uint)(_544.y)) >> 24))) * (256u)) + (((uint)((uint)((uint)(_544.x)) >> 24))))))))));
    if (_439) {
      if ((uint)_103 > (uint)52) {
        if (!(((_103 == 98)) || (((((_101.x & 125) == 105)) || (((uint)_103 < (uint)68)))))) {
          _598 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        } else {
          _598 = 0.0f;
        }
      } else {
        if ((uint)_103 > (uint)10) {
          if ((uint)_103 < (uint)20) {
            if ((_101.x & 126) == 14) {
              _598 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _598 = 0.0f;
            }
          } else {
            if (!((_101.x & 125) == 105)) {
              _598 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
            } else {
              _598 = 0.0f;
            }
          }
        } else {
          _598 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_diffViewPosAccurate.x, _diffViewPosAccurate.y, _diffViewPosAccurate.z));
        }
      }
    } else {
      _598 = 0.0f;
    }
    float _606 = _screenPercentage.x * 2.0f;
    float _607 = _606 * abs(_95 + -0.5f);
    float _608 = _screenPercentage.y * 2.0f;
    float _609 = _608 * abs(_96 + -0.5f);
    float _613 = sqrt(dot(float2(_607, _609), float2(_607, _609)) + 1.0f) * _513;
    float _630 = _606 * abs(_516 + -0.5f);
    float _631 = _608 * abs(_517 + -0.5f);
    float _634 = sqrt(dot(float2(_630, _631), float2(_630, _631)) + 1.0f);
    bool _649 = (((uint)(_103 + -97) < (uint)2)) || (_318);
    float _651 = _513 * _513;
    float _653 = (_651 * select(_649, 0.5f, 0.20000000298023224f)) + 1.0f;
    bool _657 = ((uint)(_103 + -53) < (uint)15);
    if (_657) {
      _676 = (1000.0f - (saturate(float((bool)(uint)((sqrt(((_diffViewPosAccurate.x * _diffViewPosAccurate.x) + (_diffViewPosAccurate.y * _diffViewPosAccurate.y)) + (_diffViewPosAccurate.z * _diffViewPosAccurate.z)) * 50.0f) > 1.0f))) * 875.0f));
    } else {
      _676 = 50.0f;
    }
    bool _685 = ((_103 == 57)) || (_657);
    float _686 = select(_685, 0.0f, ((max(0.0f, (_513 + -1.0f)) * 0.10000000149011612f) * _temporalReprojectionParams.y));
    float _691 = max(0.0f, (abs(_613 - (_634 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_544.x & 16777215))) * 5.960465188081798e-08f))) - _598))) - _686));
    float _692 = max(0.0f, (abs(_613 - (_634 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_544.y & 16777215))) * 5.960465188081798e-08f))) - _598))) - _686));
    float _693 = max(0.0f, (abs(_613 - (_634 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_544.z & 16777215))) * 5.960465188081798e-08f))) - _598))) - _686));
    float _694 = max(0.0f, (abs(_613 - (_634 * ((_nearFarProj.x / max(1.0000000116860974e-07f, (float((uint)((uint)(_544.w & 16777215))) * 5.960465188081798e-08f))) - _598))) - _686));
    float _695 = _691 * _691;
    float _696 = _692 * _692;
    float _697 = _693 * _693;
    float _698 = _694 * _694;
    float _700 = (-1.4426950216293335f / ((_651 * 0.10000000149011612f) + 1.0f)) * select(_649, 0.20000000298023224f, _676);
    float _713 = select((_695 > _653), 0.0f, exp2(_695 * _700));
    float _714 = select((_696 > _653), 0.0f, exp2(_696 * _700));
    float _715 = select((_697 > _653), 0.0f, exp2(_697 * _700));
    float _716 = select((_698 > _653), 0.0f, exp2(_698 * _700));
    int _717 = _101.x & 126;
    if (!_394) {
      bool _721 = ((_717 == 66)) || ((_103 == 54));
      int _722 = _567 & 127;
      int _723 = _567 & 32512;
      int _724 = _567 & 8323072;
      int _725 = _567 & 2130706432;
      bool _764 = ((_722 == 57)) || (((uint)(_722 + -53) < (uint)15));
      bool _765 = ((_723 == 14592)) || (((uint)((((uint)((uint)(_567)) >> 8) & 127) + -53) < (uint)15));
      bool _766 = ((_724 == 3735552)) || (((uint)((((uint)((uint)(_567)) >> 16) & 127) + -53) < (uint)15));
      bool _767 = ((_725 == 956301312)) || (((uint)((((uint)((uint)(_567)) >> 24) & 127) + -53) < (uint)15));
      bool _780 = (_685) || ((!_439));
      bool _789 = (_103 == 6);
      bool _811 = ((uint)(_103 + -105) < (uint)3);
      _849 = (float((bool)((uint)((((_721) || ((((_722 != 54)) && (((_567 & 126) != 66)))))) && ((!(((((_789 ^ (_722 == 6))) || ((((_685 ^ _764)) || ((_811 ^ (((_722 == 107)) || (((uint)(_722 + -105) < (uint)2))))))))) || ((((((_567 & 128) != 0)) || (_764)) ^ _780)))))))) * _713);
      _850 = (float((bool)((uint)((((_721) || ((((_723 != 13824)) && (((_567 & 32256) != 16896)))))) && ((!(((((_789 ^ (_723 == 1536))) || ((((_811 ^ ((((_567 & 32000) == 26880)) || ((_723 == 27136))))) || ((_685 ^ _765)))))) || ((((((_567 & 32768) != 0)) || (_765)) ^ _780)))))))) * _714);
      _851 = (float((bool)((uint)((((_721) || ((((_724 != 3538944)) && (((_567 & 8257536) != 4325376)))))) && ((!(((((_789 ^ (_724 == 393216))) || ((((_811 ^ ((((_567 & 8192000) == 6881280)) || ((_724 == 6946816))))) || ((_685 ^ _766)))))) || ((((((_567 & 8388608) != 0)) || (_766)) ^ _780)))))))) * _715);
      _852 = (float((bool)((uint)((((_721) || ((((_725 != 905969664)) && (((_567 & 2113929216) != 1107296256)))))) && ((!(((((_789 ^ (_725 == 100663296))) || ((((_811 ^ ((((_567 & 2097152000) == 1761607680)) || ((_725 == 1778384896))))) || ((_685 ^ _767)))))) || ((((((int)_567 < (int)0)) || (_767)) ^ _780)))))))) * _716);
    } else {
      _849 = _713;
      _850 = _714;
      _851 = _715;
      _852 = _716;
    }
    int4 _854 = __3__36__0__0__g_sceneNormalPrev.GatherRed(__3__40__0__0__g_samplerPoint, float2(_540, _541));
    float _873 = min(1.0f, ((float((uint)((uint)(_854.w & 1023))) * 0.001956947147846222f) + -1.0f));
    float _874 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_854.w)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _875 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_854.w)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _877 = rsqrt(dot(float3(_873, _874, _875), float3(_873, _874, _875)));
    float _882 = saturate(dot(float3(_427, _428, _429), float3((_877 * _873), (_877 * _874), (_877 * _875))));
    float _897 = min(1.0f, ((float((uint)((uint)(_854.z & 1023))) * 0.001956947147846222f) + -1.0f));
    float _898 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_854.z)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _899 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_854.z)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _901 = rsqrt(dot(float3(_897, _898, _899), float3(_897, _898, _899)));
    float _906 = saturate(dot(float3(_427, _428, _429), float3((_901 * _897), (_901 * _898), (_901 * _899))));
    float _921 = min(1.0f, ((float((uint)((uint)(_854.x & 1023))) * 0.001956947147846222f) + -1.0f));
    float _922 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_854.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _923 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_854.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _925 = rsqrt(dot(float3(_921, _922, _923), float3(_921, _922, _923)));
    float _930 = saturate(dot(float3(_427, _428, _429), float3((_925 * _921), (_925 * _922), (_925 * _923))));
    float _945 = min(1.0f, ((float((uint)((uint)(_854.y & 1023))) * 0.001956947147846222f) + -1.0f));
    float _946 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_854.y)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _947 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_854.y)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
    float _949 = rsqrt(dot(float3(_945, _946, _947), float3(_945, _946, _947)));
    float _954 = saturate(dot(float3(_427, _428, _429), float3((_949 * _945), (_949 * _946), (_949 * _947))));
    bool _955 = (_717 == 66);
    bool _957 = (_103 == 54);
    float _959 = select(((_957) || (((_649) || (_955)))), 0.009999999776482582f, 1.0f);
    float _976 = _530 - _536;
    float _977 = _531 - _537;
    float _978 = 1.0f - _976;
    float _979 = 1.0f - _977;
    float _984 = (_978 * _977) * _849;
    float _986 = (_977 * _976) * _850;
    float _988 = (_979 * _976) * _851;
    float _990 = (_979 * _978) * _852;
    float _992 = saturate(select(_394, 1.0f, (pow(_930, _959))) * _984);
    float _993 = saturate(select(_394, 1.0f, (pow(_954, _959))) * _986);
    float _994 = saturate(select(_394, 1.0f, (pow(_906, _959))) * _988);
    float _995 = saturate(select(_394, 1.0f, (pow(_882, _959))) * _990);
    int4 _997 = asint(__3__37__0__0__g_structureCounterBuffer.Load4(8));
    [branch]
    if (!(WaveReadLaneFirst(_997.x) == 0)) {
      uint _1005 = __3__36__0__0__g_tiledManyLightsMasks.Load(int3(((int)(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))) >> 5)), ((int)(((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))) >> 5)), 0));
      int _1007 = _1005.x & 4;
      int _1009 = (uint)((uint)(_1007)) >> 2;
      if (!(_1007 == 0)) {
        _1017 = max((saturate(dot(float3(_325, _326, _327), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.009999999776482582f) * 0.875f), _525);
        _1018 = _1009;
      } else {
        _1017 = _525;
        _1018 = _1009;
      }
    } else {
      _1017 = _525;
      _1018 = 0;
    }
    float _1028 = saturate(max(_1017, (((_environmentLightingHistory[1].w) + _temporalReprojectionParams.w) + _renderParams.y)));
    half4 _1031 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_534, ((int)((uint)(_535) + 1u)), 0));
    half4 _1037 = __3__36__0__0__g_diffuseResultPrev.Load(int3(((int)((uint)(_534) + 1u)), ((int)((uint)(_535) + 1u)), 0));
    half4 _1042 = __3__36__0__0__g_diffuseResultPrev.Load(int3(((int)((uint)(_534) + 1u)), _535, 0));
    half4 _1047 = __3__36__0__0__g_diffuseResultPrev.Load(int3(_534, _535, 0));
    float _1052 = dot(float4(_992, _993, _994, _995), float4(1.0f, 1.0f, 1.0f, 1.0f));
    float _1061 = saturate(dot(float4(_992, _993, _994, _995), float4(float(_1031.w), float(_1037.w), float(_1042.w), float(_1047.w))) * (1.0f / max(1.0f, _1052)));
    float _1066 = sqrt((_511 * _511) + (_510 * _510)) * 50.0f;
    if (_657) {
      _1075 = saturate(1.0f - _1066);
    } else {
      _1075 = (1.0f - (saturate(_1066) * 0.5f));
    }
    float _1079 = max(1.0f, (_bufferSizeAndInvSize.w * 2160.0f));
    float _1084 = (_1061 * _1061) * 4.0f;
    float4 _1095 = __3__36__0__0__g_manyLightsMoments.SampleLevel(__3__40__0__0__g_sampler, float2(_95, _96), 0.0f);
    float _1099 = saturate(_1095.w);
    float _1101 = 1.0f / max(9.999999974752427e-07f, _1052);
    float _1102 = _1101 * _992;
    float _1103 = _1101 * _993;
    float _1104 = _1101 * _994;
    float _1105 = _1101 * _995;
    float _1106 = saturate(saturate(max(_1028, (1.0f / ((saturate(_1084) * min(31.0f, ((_1075 * 15.0f) * _1079))) + 1.0f))) + _renderParams.z));
    float _1148 = 1.0f / _exposure4.x;
    float _1165 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1105 * float(_1047.x)) + ((_1104 * float(_1042.x)) + ((_1102 * float(_1031.x)) + (_1103 * float(_1037.x))))))) * _exposure4.y)))));
    float _1166 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1105 * float(_1047.y)) + ((_1104 * float(_1042.y)) + ((_1102 * float(_1031.y)) + (_1103 * float(_1037.y))))))) * _exposure4.y)))));
    float _1167 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, (-0.0f - (min(0.0f, (-0.0f - ((_1105 * float(_1047.z)) + ((_1104 * float(_1042.z)) + ((_1102 * float(_1031.z)) + (_1103 * float(_1037.z))))))) * _exposure4.y)))));
    if (_renderParams.y == 0.0f) {
      float _1171 = dot(float3(_1165, _1166, _1167), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _1186 = ((min(_1171, _1095.y) / max(9.999999974752427e-07f, _1171)) * _1099) + saturate(1.0f - _1099);
      _1191 = saturate((saturate(((_1095.x - _1171) * 5.0f) / max(9.999999974752427e-07f, _1095.x)) * 0.5f) + _1106);
      _1192 = (_1186 * _1165);
      _1193 = (_1186 * _1166);
      _1194 = (_1186 * _1167);
    } else {
      _1191 = _1106;
      _1192 = _1165;
      _1193 = _1166;
      _1194 = _1167;
    }
    float _1203 = ((_325 - _1192) * _1191) + _1192;
    float _1204 = ((_326 - _1193) * _1191) + _1193;
    float _1205 = ((_327 - _1194) * _1191) + _1194;
    __3__38__0__1__g_diffuseResultUAV[int2(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))))] = half4(half(_1203), half(_1204), half(_1205), half(saturate(_1061 + 0.0625f)));
    float _1212 = float(_424);
    float _1213 = float(_425);
    float _1214 = float(_426);
    if (_103 == 53) {
      _1221 = saturate(((_1213 + _1212) + _1214) * 1.2000000476837158f);
    } else {
      _1221 = 1.0f;
    }
    float _1222 = float(_422);
    float _1228 = (0.699999988079071f / min(max(max(max(_1212, _1213), _1214), 0.009999999776482582f), 0.699999988079071f)) * _1221;
    float _1238 = (((_1228 * _1212) + -0.03999999910593033f) * _1222) + 0.03999999910593033f;
    float _1239 = (((_1228 * _1213) + -0.03999999910593033f) * _1222) + 0.03999999910593033f;
    float _1240 = (((_1228 * _1214) + -0.03999999910593033f) * _1222) + 0.03999999910593033f;
    if (!_394) {
      _1246 = saturate(1.0h - _329.x);
    } else {
      _1246 = 1.0h;
    }
    if (!(((_103 == 98)) || ((_717 == 96)))) {
      if ((uint)(_103 + -105) < (uint)2) {
        _1258 = _165;
        _1265 = select((((_103 == 65)) || ((((_103 == 107)) || (_1258)))), 0.0h, _422);
      } else {
        if (!((uint)(_103 + -11) < (uint)9)) {
          _1258 = false;
          _1265 = select((((_103 == 65)) || ((((_103 == 107)) || (_1258)))), 0.0h, _422);
        } else {
          _1265 = 0.0h;
        }
      }
    } else {
      _1265 = 0.0h;
    }
    float _1267 = dot(float3(_430, _432, _434), float3(_427, _428, _429)) * 2.0f;
    float _1271 = _430 - (_1267 * _427);
    float _1272 = _432 - (_1267 * _428);
    float _1273 = _434 - (_1267 * _429);
    float _1275 = rsqrt(dot(float3(_1271, _1272, _1273), float3(_1271, _1272, _1273)));
    float _1276 = _1271 * _1275;
    float _1277 = _1272 * _1275;
    float _1278 = _1273 * _1275;
    float _1281 = __3__36__0__0__g_specularRayHitDistance.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_95, _96), 0.0f);
    float _1283 = float(_423);
    float _1285 = select((_1283 < 0.800000011920929f), _1281.x, 0.0f);
    float _1286 = _1285 * _1276;
    float _1287 = _1285 * _1277;
    float _1288 = _1285 * _1278;
    float _1293 = dot(float3(_1286, _1287, _1288), float3((-0.0f - _427), (-0.0f - _428), (-0.0f - _429))) * 2.0f;
    float _1298 = ((_1293 * _427) + _388) + _1286;
    float _1300 = ((_1293 * _428) + _389) + _1287;
    float _1302 = ((_1293 * _429) + _390) + _1288;
    float _1326 = mad((_viewProjRelative[0].z), _1302, mad((_viewProjRelative[0].y), _1300, (_1298 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w);
    float _1330 = mad((_viewProjRelative[1].z), _1302, mad((_viewProjRelative[1].y), _1300, (_1298 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w);
    float _1334 = mad((_viewProjRelative[2].z), _1302, mad((_viewProjRelative[2].y), _1300, (_1298 * (_viewProjRelative[2].x)))) + (_viewProjRelative[2].w);
    float _1338 = mad((_viewProjRelative[3].z), _1302, mad((_viewProjRelative[3].y), _1300, (_1298 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
    float _1376 = mad((_projToPrevProj[3].w), _1338, mad((_projToPrevProj[3].z), _1334, mad((_projToPrevProj[3].y), _1330, ((_projToPrevProj[3].x) * _1326))));
    float _1377 = mad((_projToPrevProj[0].w), _1338, mad((_projToPrevProj[0].z), _1334, mad((_projToPrevProj[0].y), _1330, ((_projToPrevProj[0].x) * _1326)))) / _1376;
    float _1378 = mad((_projToPrevProj[1].w), _1338, mad((_projToPrevProj[1].z), _1334, mad((_projToPrevProj[1].y), _1330, ((_projToPrevProj[1].x) * _1326)))) / _1376;
    float _1382 = max(1.0000000116860974e-07f, (mad((_projToPrevProj[2].w), _1338, mad((_projToPrevProj[2].z), _1334, mad((_projToPrevProj[2].y), _1330, ((_projToPrevProj[2].x) * _1326)))) / _1376));
    float _1418 = mad((_invViewProjRelativePrev[3].z), _1382, mad((_invViewProjRelativePrev[3].y), _1378, ((_invViewProjRelativePrev[3].x) * _1377))) + (_invViewProjRelativePrev[3].w);
    float _1429 = _diffViewPosAccurate.x + (((mad((_invViewProjRelativePrev[0].z), _1382, mad((_invViewProjRelativePrev[0].y), _1378, ((_invViewProjRelativePrev[0].x) * _1377))) + (_invViewProjRelativePrev[0].w)) / _1418) - _1298);
    float _1430 = _diffViewPosAccurate.y + (((mad((_invViewProjRelativePrev[1].z), _1382, mad((_invViewProjRelativePrev[1].y), _1378, ((_invViewProjRelativePrev[1].x) * _1377))) + (_invViewProjRelativePrev[1].w)) / _1418) - _1300);
    float _1431 = _diffViewPosAccurate.z + (((mad((_invViewProjRelativePrev[2].z), _1382, mad((_invViewProjRelativePrev[2].y), _1378, ((_invViewProjRelativePrev[2].x) * _1377))) + (_invViewProjRelativePrev[2].w)) / _1418) - _1302);
    float _1432 = dot(float3(_1429, _1430, _1431), float3(_1276, _1277, _1278));
    float _1436 = _1429 - (_1432 * _1276);
    float _1437 = _1430 - (_1432 * _1277);
    float _1438 = _1431 - (_1432 * _1278);
    float _1454 = (saturate(_1285 * 0.125f) * (sqrt(1.0f - saturate(sqrt(((_1436 * _1436) + (_1437 * _1437)) + (_1438 * _1438)) / max(0.0010000000474974513f, _1285))) + -1.0f)) + 1.0f;
    float _1455 = _1454 * _1454;
    float _1456 = _1455 * _1455;
    float _1457 = _1456 * _930;
    float _1458 = _1456 * _954;
    float _1459 = _1456 * _906;
    float _1460 = _1456 * _882;
    bool _1463 = (_renderParams.z > 0.0f);
    float _1465 = float(1.0h - _423);
    float _1469 = (_1377 - (_1326 / _1338)) - _510;
    float _1470 = (_1378 - (_1330 / _1338)) - _511;
    float _1474 = sqrt((_1470 * _1470) + (_1469 * _1469));
    float _1479 = saturate((((_1465 * _1465) * (1.0f - (_437 * 0.8999999761581421f))) * _1474) * select(_1463, 2000.0f, 500.0f));
    float _1488 = select(((((_273) || (_394))) || ((((_717 == 24)) || ((_renderParams.y > 0.0f))))), 1.0f, float(_329.y));
    float _1492 = float(_1265);
    float _1497 = min(max((_cavityParams.y + -1.0f), 0.0f), 2.0f);
    float _1523 = saturate(saturate(1.0f - (((_1492 * _107) / max(0.0010000000474974513f, _437)) * 0.0010000000474974513f)) * 1.25f) * saturate(((((-0.05000000074505806f - (_1497 * 0.07500000298023224f)) + max(0.019999999552965164f, _1283)) + (saturate(_107 * 0.02500000037252903f) * 0.10000000149011612f)) * min(max((_107 + 1.0f), 5.0f), 50.0f)) * (1.0f - (saturate(_1492) * 0.75f)));
    if (_103 == 64) {
      _1532 = ((saturate(_107 * 0.25f) * (_1523 + -0.39990234375f)) + 0.39990234375f);
    } else {
      _1532 = _1523;
    }
    float _1534 = (_1497 * 16.0f) + 16.0f;
    float _1540 = select((_1497 > 1.0f), 0.0f, saturate((1.0f / _1534) * (_107 - _1534)));
    bool _1541 = (_103 == 105);
    do {
    if (_1541) {
      _1549 = 1.0f;
      _1553 = select((_103 == 65), 0.0f, _1549);
      break;
    } else {
      if (!_394) {
        _1549 = select((_103 == 107), 1.0f, ((_1540 + _1532) - (_1540 * _1532)));
        _1553 = select((_103 == 65), 0.0f, _1549);
        break;
      } else {
        _1553 = 0.0f;
      }
    }
    } while(false);
    float _1559 = saturate(_107 * 0.0625f);
    float _1566 = select(_685, 31.0f, 63.0f);
    float _1572 = (saturate((float(saturate(_1265 + (_423 * 2.0h))) * _1474) * (2000.0f - (_1559 * 1500.0f))) * (7.0f - _1566)) + _1566;
    if ((uint)(_103 + -12) < (uint)9) {
      _1582 = ((saturate(_107 * 0.004999999888241291f) * (_1572 + -2.0f)) + 2.0f);
    } else {
      _1582 = _1572;
    }
    half _1585 = max(0.040008545h, _423);
    float _1603 = saturate(max(max(_1028, select(_1463, _1479, 0.0f)), (1.0f / (((saturate((_1079 * _1079) * _1084) * min(64.0f, (_1582 + 1.0f))) * ((saturate((select((_lightingParams.y == 0.0f), 0.0f, _1553) + (_107 * 0.0078125f)) + float((_1585 * _1585) * 64.0h)) * 0.9375f) + 0.0625f)) + 1.0f))));
    bool __defer_1581_1624 = false;
    if ((uint)_103 > (uint)52) {
      if ((uint)_103 < (uint)68) {
        if (_955) {
          _1632 = _1457;
          _1633 = _1458;
          _1634 = _1459;
          _1635 = _1460;
          _1638 = _1632;
          _1639 = _1633;
          _1640 = _1634;
          _1641 = _1635;
          _1642 = max(0.89990234h, _423);
        } else {
          if (!_957) {
            float _1612 = _1457 * _1457;
            float _1613 = _1458 * _1458;
            float _1614 = _1459 * _1459;
            float _1615 = _1460 * _1460;
            float _1616 = _1612 * _1612;
            float _1617 = _1613 * _1613;
            float _1618 = _1614 * _1614;
            float _1619 = _1615 * _1615;
            _1625 = (_1616 * _1616);
            _1626 = (_1617 * _1617);
            _1627 = (_1618 * _1618);
            _1628 = (_1619 * _1619);
          } else {
            _1625 = _1457;
            _1626 = _1458;
            _1627 = _1459;
            _1628 = _1460;
          }
          __defer_1581_1624 = true;
        }
      } else {
        _1638 = _1457;
        _1639 = _1458;
        _1640 = _1459;
        _1641 = _1460;
        _1642 = max(0.099975586h, _423);
      }
    } else {
      _1625 = _1457;
      _1626 = _1458;
      _1627 = _1459;
      _1628 = _1460;
      __defer_1581_1624 = true;
    }
    if (__defer_1581_1624) {
      if ((_957) || (_955)) {
        _1632 = _1625;
        _1633 = _1626;
        _1634 = _1627;
        _1635 = _1628;
        _1638 = _1632;
        _1639 = _1633;
        _1640 = _1634;
        _1641 = _1635;
        _1642 = max(0.89990234h, _423);
      } else {
        _1638 = _1625;
        _1639 = _1626;
        _1640 = _1627;
        _1641 = _1628;
        _1642 = max(0.099975586h, _423);
      }
    }
    float _1643 = float(_1642);
    float _1644 = _1643 * _1643;
    float _1645 = _1644 * _1644;
    float _1658 = (((_1645 * _1638) - _1638) * _1638) + 1.0f;
    float _1659 = (((_1645 * _1639) - _1639) * _1639) + 1.0f;
    float _1660 = (((_1645 * _1640) - _1640) * _1640) + 1.0f;
    float _1661 = (((_1645 * _1641) - _1641) * _1641) + 1.0f;
    float _1686 = saturate(select(_273, 1.0f, saturate((_1645 / (_1658 * _1658)) * _1638)) * _984);
    float _1687 = saturate(select(_273, 1.0f, saturate((_1645 / (_1659 * _1659)) * _1639)) * _986);
    float _1688 = saturate(select(_273, 1.0f, saturate((_1645 / (_1660 * _1660)) * _1640)) * _988);
    float _1689 = saturate(select(_273, 1.0f, saturate((_1645 / (_1661 * _1661)) * _1641)) * _990);
    if (_394) {
      [branch]
      if (_273) {
        _1752 = saturate((_1603 + (_1479 * 0.5f)) + min(0.5f, (_421 / (((_107 * _107) * 0.004999999888241291f) + 1.0f))));
        _1753 = _534;
        _1754 = _535;
        _1755 = _1686;
        _1756 = _1687;
        _1757 = _1688;
        _1758 = _1689;
      } else {
        float _1703 = mad((_projToPrevProj[3].z), _98.x, mad((_projToPrevProj[3].y), _351, ((_projToPrevProj[3].x) * _349))) + (_projToPrevProj[3].w);
        float _1706 = ((mad((_projToPrevProj[0].z), _98.x, mad((_projToPrevProj[0].y), _351, ((_projToPrevProj[0].x) * _349))) + (_projToPrevProj[0].w)) / _1703) - _349;
        float _1707 = ((mad((_projToPrevProj[1].z), _98.x, mad((_projToPrevProj[1].y), _351, ((_projToPrevProj[1].x) * _349))) + (_projToPrevProj[1].w)) / _1703) - _351;
        float _1717 = (((_1706 * 0.5f) + _95) * _bufferSizeAndInvSize.x) + -0.5f;
        float _1718 = ((_96 - (_1707 * 0.5f)) * _bufferSizeAndInvSize.y) + -0.5f;
        int _1721 = int(floor(_1717));
        int _1722 = int(floor(_1718));
        float _1725 = _1717 - float((int)(_1721));
        float _1726 = _1718 - float((int)(_1722));
        float _1727 = 1.0f - _1725;
        float _1728 = 1.0f - _1726;
        _1752 = saturate((sqrt((_1707 * _1707) + (_1706 * _1706)) * 100.0f) + 0.125f);
        _1753 = _1721;
        _1754 = _1722;
        _1755 = (_1727 * _1726);
        _1756 = (_1726 * _1725);
        _1757 = (_1728 * _1725);
        _1758 = (_1728 * _1727);
      }
    } else {
      if (_273) {
        _1752 = saturate((_1603 + (_1479 * 0.5f)) + min(0.5f, (_421 / (((_107 * _107) * 0.004999999888241291f) + 1.0f))));
        _1753 = _534;
        _1754 = _535;
        _1755 = _1686;
        _1756 = _1687;
        _1757 = _1688;
        _1758 = _1689;
      } else {
        _1752 = _1603;
        _1753 = _534;
        _1754 = _535;
        _1755 = _1686;
        _1756 = _1687;
        _1757 = _1688;
        _1758 = _1689;
      }
    }
    bool _1759 = (_1492 > 0.20000000298023224f);
    half4 _1762 = __3__36__0__0__g_specularResultPrev.Load(int3(_1753, ((int)((uint)(_1754) + 1u)), 0));
    float _1775 = float((bool)((uint)(!(_1759 ^ (_1762.w < 0.0h))))) * _1755;
    half4 _1782 = __3__36__0__0__g_specularResultPrev.Load(int3(((int)((uint)(_1753) + 1u)), ((int)((uint)(_1754) + 1u)), 0));
    float _1795 = float((bool)((uint)(!(_1759 ^ (_1782.w < 0.0h))))) * _1756;
    half4 _1805 = __3__36__0__0__g_specularResultPrev.Load(int3(((int)((uint)(_1753) + 1u)), _1754, 0));
    float _1818 = float((bool)((uint)(!(_1759 ^ (_1805.w < 0.0h))))) * _1757;
    half4 _1828 = __3__36__0__0__g_specularResultPrev.Load(int3(_1753, _1754, 0));
    float _1841 = float((bool)((uint)(!(_1759 ^ (_1828.w < 0.0h))))) * _1758;
    float _1863 = 1.0f / max(((_1559 * 0.000999000039882958f) + 9.999999974752427e-07f), dot(float4(_1775, _1795, _1818, _1841), float4(1.0f, 1.0f, 1.0f, 1.0f)));
    float _1865 = -0.0f - (min(0.0f, (-0.0f - ((((_1775 * float(_1762.x)) + (_1795 * float(_1782.x))) + (_1818 * float(_1805.x))) + (_1841 * float(_1828.x))))) * _1863);
    float _1867 = -0.0f - (min(0.0f, (-0.0f - ((((_1775 * float(_1762.y)) + (_1795 * float(_1782.y))) + (_1818 * float(_1805.y))) + (_1841 * float(_1828.y))))) * _1863);
    float _1869 = -0.0f - (min(0.0f, (-0.0f - ((((_1775 * float(_1762.z)) + (_1795 * float(_1782.z))) + (_1818 * float(_1805.z))) + (_1841 * float(_1828.z))))) * _1863);
    float _1870 = _1863 * min(0.0f, (-0.0f - ((((_1775 * abs(float(_1762.w))) + (_1795 * abs(float(_1782.w)))) + (_1818 * abs(float(_1805.w)))) + (_1841 * abs(float(_1828.w))))));
    if (_renderParams.y == 0.0f) {
      float _1873 = dot(float3(_1865, _1867, _1869), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _1880 = ((min(_1873, _1095.z) / max(9.999999717180685e-10f, _1873)) * _1099) + saturate(1.0f - _1099);
      _1885 = (_1880 * _1865);
      _1886 = (_1880 * _1867);
      _1887 = (_1880 * _1869);
    } else {
      _1885 = _1865;
      _1886 = _1867;
      _1887 = _1869;
    }
    float _1888 = _1885 * _exposure4.y;
    float _1889 = _1886 * _exposure4.y;
    float _1890 = _1887 * _exposure4.y;
    float _1893 = saturate(_1752 + _renderParams.z);
    float _1905 = ((max(0.0010000000474974513f, float(_1246)) + _1870) * _1752) - _1870;
    float _1915 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((_1893 * ((_1488 * _304.x) - _1888)) + _1888))));
    float _1916 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((_1893 * ((_1488 * _304.y) - _1889)) + _1889))));
    float _1917 = -0.0f - min(0.0f, (-0.0f - min(30000.0f, ((_1893 * ((_1488 * _304.z) - _1890)) + _1890))));
    __3__38__0__1__g_specularResultUAV[int2(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))))] = half4(half(_1915), half(_1916), half(_1917), half(select(_1759, (-0.0f - _1905), _1905)));
    float _1925 = select(_394, 0.0f, _1905);
    float _1930 = float(half(lerp(_1925, 1.0f, _1283)));
    bool _1931 = (_717 == 64);
    int _1933 = ((int)(uint)((int)(_166))) ^ 1;
    if ((((int)(uint)((int)(_1931))) & _1933) == 0) {
      _1949 = saturate(exp2((_1930 * _1930) * (_107 * -0.005770780146121979f)));
    } else {
      _1949 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);
    }
    bool _1952 = (_cavityParams.x == 0.0f);
    float _1953 = select(_1952, 1.0f, _1949);
    if (_1931) {
      _1959 = (_1953 * _1238);
      _1960 = (_1953 * _1239);
      _1961 = (_1953 * _1240);
    } else {
      _1959 = _1238;
      _1960 = _1239;
      _1961 = _1240;
    }
    float2 _1966 = __3__36__0__0__g_iblBrdfLookup.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(min(0.9900000095367432f, _437), (1.0f - _1930)), 0.0f);
    float _1977 = select(((_1931) || (_394)), 1.0f, _1953) * _1148;
    if (!_657) {
      if (((_103 != 7)) && ((!(((_103 == 6)) || (((((((uint)(_103 + -27) < (uint)2)) || ((((_103 == 26)) || (((_394) || (_1541))))))) || ((_717 == 106)))))))) {
        float _2007 = exp2(log2(_1925) * (saturate(_107 * 0.03125f) + 1.0f));
        float4 _2016 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_95, _96), 0.0f);
        bool __defer_2001_2034 = false;
        bool __branch_chain_2001;
        if (((_103 == 15)) || (((((_101.x & 124) == 16)) || ((_717 == 12))))) {
          _2035 = false;
          _2036 = true;
          __branch_chain_2001 = true;
        } else {
          if (!((uint)_103 > (uint)10)) {
            _2035 = true;
            _2036 = _1541;
            __branch_chain_2001 = true;
          } else {
            if ((uint)_103 < (uint)20) {
              _2035 = false;
              _2036 = _1541;
              __branch_chain_2001 = true;
            } else {
              if (!(_103 == 97)) {
                _2035 = (_103 != 107);
                _2036 = _1541;
                __branch_chain_2001 = true;
              } else {
                _2228 = _1222;
                _2229 = _1283;
                _2230 = _1212;
                _2231 = _1213;
                _2232 = _1214;
                __branch_chain_2001 = false;
              }
            }
          }
        }
        if (__branch_chain_2001) {
          __defer_2001_2034 = true;
        }
        if (__defer_2001_2034) {
          if (_2016.w < 1.0f) {
            if ((_weatherCheckFlag & 5) == 5) {
              bool _2046 = (_103 == 36);
              if (!_2046) {
                float4 _2066 = __3__36__0__0__g_climateSandTex.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((((_viewPos.x + _388) / _climateTextureOnePixelMeter.x) + float((int)((int)(_climateTextureSize.x >> 1)))) / float((int)(_climateTextureSize.x))), (1.0f - ((((_viewPos.z + _390) / _climateTextureOnePixelMeter.y) + float((int)((int)(_climateTextureSize.y >> 1)))) / float((int)(_climateTextureSize.y))))), 0.0f);
                _2072 = _2066.x;
                _2073 = _2066.y;
                _2074 = _2066.z;
                _2075 = _2066.w;
              } else {
                _2072 = 0.11999999731779099f;
                _2073 = 0.11999999731779099f;
                _2074 = 0.10000000149011612f;
                _2075 = 0.5f;
              }
              float _2082 = 1.0f - saturate(((_viewPos.y + _389) - _paramGlobalSand.x) / _paramGlobalSand.y);
              if (!(_2082 <= 0.0f)) {
                float _2085 = saturate(_2007);
                float _2098 = ((_2073 * 0.3395099937915802f) + (_2072 * 0.6131200194358826f)) + (_2074 * 0.047370001673698425f);
                float _2099 = ((_2073 * 0.9163600206375122f) + (_2072 * 0.07020000368356705f)) + (_2074 * 0.013450000435113907f);
                float _2100 = ((_2073 * 0.10958000272512436f) + (_2072 * 0.02061999961733818f)) + (_2074 * 0.8697999715805054f);
                float _2105 = select(_2036, 1.0f, float((bool)(uint)(saturate(dot(float3(_427, _428, _429), float3(0.0f, 1.0f, 0.0f))) > 0.5f)));
                if (_enableSandAO == 1) {
                  float _2110 = 1.0f - _2016.x;
                  if (_2046) {
                    _2141 = ((((_2110 * 10.0f) * _2075) * _2082) * _2085);
                    _2144 = _2098;
                    _2145 = _2099;
                    _2146 = _2100;
                    _2147 = saturate(_2141);
                  } else {
                    float _2121 = saturate(_2075 + -0.5f);
                    _2144 = _2098;
                    _2145 = _2099;
                    _2146 = _2100;
                    _2147 = ((((_2121 * 2.0f) * max((_2105 * _2016.x), min((_2085 * ((_2016.x * 7.0f) + 3.0f)), (_2121 * 40.0f)))) + (((_2110 * 10.0f) * _2085) * saturate((0.5f - _2075) * 2.0f))) * _2082);
                  }
                } else {
                  float _2139 = ((_2082 * _2075) * _2016.x) * _2105;
                  if (_2046) {
                    _2141 = _2139;
                    _2144 = _2098;
                    _2145 = _2099;
                    _2146 = _2100;
                    _2147 = saturate(_2141);
                  } else {
                    _2144 = _2098;
                    _2145 = _2099;
                    _2146 = _2100;
                    _2147 = _2139;
                  }
                }
              } else {
                _2144 = 0.0f;
                _2145 = 0.0f;
                _2146 = 0.0f;
                _2147 = 0.0f;
              }
              float _2151 = ((1.0f - _2016.w) * (1.0f - _2016.y)) * _2147;
              bool _2152 = (_2151 > 9.999999747378752e-05f);
              if (_2152) {
                if (_2036) {
                  float _2155 = saturate(_2151);
                  _2182 = (((sqrt(_2144 * _1212) - _1212) * _2155) + _1212);
                  _2183 = (((sqrt(_2145 * _1213) - _1213) * _2155) + _1213);
                  _2184 = (((sqrt(_2146 * _1214) - _1214) * _2155) + _1214);
                } else {
                  _2182 = ((_2151 * (_2144 - _1212)) + _1212);
                  _2183 = ((_2151 * (_2145 - _1213)) + _1213);
                  _2184 = ((_2151 * (_2146 - _1214)) + _1214);
                }
              } else {
                _2182 = _1212;
                _2183 = _1213;
                _2184 = _1214;
              }
              if ((_2046) && (_2152)) {
                if (_2036) {
                  _2199 = (((sqrt(_1283 * 0.25f) - _1283) * saturate(_2151)) + _1283);
                } else {
                  _2199 = ((_2151 * (0.25f - _1283)) + _1283);
                }
              } else {
                _2199 = _1283;
              }
              float _2200 = saturate(_2182);
              float _2201 = saturate(_2183);
              float _2202 = saturate(_2184);
              float _2207 = (_2199 * (1.0f - _2007)) + _2007;
              float _2210 = ((_2199 - _2207) * _2016.y) + _2207;
              float _2217 = (((_2007 * _2007) * _2016.z) * float((bool)(uint)(_2035))) * saturate(dot(float3(_427, _428, _429), float3(0.0f, 1.0f, 0.0f)));
              float _2218 = _2217 * -0.5f;
              _2228 = (_1222 - (_2007 * _1222));
              _2229 = (_2210 - (_2217 * _2210));
              _2230 = ((_2218 * _2200) + _2200);
              _2231 = ((_2218 * _2201) + _2201);
              _2232 = ((_2218 * _2202) + _2202);
            } else {
              _2228 = _1222;
              _2229 = _1283;
              _2230 = _1212;
              _2231 = _1213;
              _2232 = _1214;
            }
          } else {
            _2228 = _1222;
            _2229 = _1283;
            _2230 = _1212;
            _2231 = _1213;
            _2232 = _1214;
          }
        }
        _2239 = half(_2228);
        _2240 = half(_2229);
        _2241 = half(_2230);
        _2242 = half(_2231);
        _2243 = half(_2232);
        _2244 = _2007;
      } else {
        _2239 = _422;
        _2240 = _423;
        _2241 = _424;
        _2242 = _425;
        _2243 = _426;
        _2244 = _1925;
      }
    } else {
      _2239 = _422;
      _2240 = _423;
      _2241 = _424;
      _2242 = _425;
      _2243 = _426;
      _2244 = _1925;
    }
    half4 _2246 = __3__36__0__0__g_sceneShadowColor.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
    [branch]
    if (_394) {
      uint _2252 = __3__36__0__0__g_sceneNormal.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
      float _2268 = min(1.0f, ((float((uint)((uint)(_2252.x & 1023))) * 0.001956947147846222f) + -1.0f));
      float _2269 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_2252.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _2270 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_2252.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
      float _2272 = rsqrt(dot(float3(_2268, _2269, _2270), float3(_2268, _2269, _2270)));
      _2280 = half(_2272 * _2268);
      _2281 = half(_2272 * _2269);
      _2282 = half(_2272 * _2270);
    } else {
      _2280 = _245;
      _2281 = _246;
      _2282 = _247;
    }
    bool _2285 = (_sunDirection.y > 0.0f);
    if ((_2285) || ((!(_2285)) && (_sunDirection.y > _moonDirection.y))) {
      _2297 = _sunDirection.x;
      _2298 = _sunDirection.y;
      _2299 = _sunDirection.z;
    } else {
      _2297 = _moonDirection.x;
      _2298 = _moonDirection.y;
      _2299 = _moonDirection.z;
    }
    if ((_2285) || ((!(_2285)) && (_sunDirection.y > _moonDirection.y))) {
      _2319 = _precomputedAmbient7.y;
    } else {
      _2319 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
    }
    float _2325 = (_earthRadius + _389) + _viewPos.y;
    float _2329 = (_390 * _390) + (_388 * _388);
    float _2331 = sqrt((_2325 * _2325) + _2329);
    float _2336 = dot(float3((_388 / _2331), (_2325 / _2331), (_390 / _2331)), float3(_2297, _2298, _2299));
    float _2341 = min(max(((_2331 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
    float _2349 = max(_2341, 0.0f);
    float _2356 = (-0.0f - sqrt((_2349 + (_earthRadius * 2.0f)) * _2349)) / (_2349 + _earthRadius);
    if (_2336 > _2356) {
      _2379 = ((exp2(log2(saturate((_2336 - _2356) / (1.0f - _2356))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
    } else {
      _2379 = ((exp2(log2(saturate((_2356 - _2336) / (_2356 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
    }
    float2 _2383 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_2341 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _2379), 0.0f);
    float _2405 = ((_2383.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
    float _2423 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _2383.x) + _2405) * -1.4426950216293335f);
    float _2424 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _2383.x) + _2405) * -1.4426950216293335f);
    float _2425 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((uint)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _2383.x) + _2405) * -1.4426950216293335f);
    float _2441 = sqrt(_2329);
    float _2449 = (_cloudAltitude - (max(((_2441 * _2441) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
    float _2461 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_2298 > 0.0f))) - ((int)(uint)((int)(_2298 < 0.0f))))) * 0.5f))) + _2449;
    if (_389 < _2449) {
      float _2464 = dot(float3(0.0f, 1.0f, 0.0f), float3(_2297, _2298, _2299));
      float _2470 = select((abs(_2464) < 9.99999993922529e-09f), 1e+08f, ((_2461 - dot(float3(0.0f, 1.0f, 0.0f), float3(_388, _389, _390))) / _2464));
      _2476 = ((_2470 * _2297) + _388);
      _2477 = _2461;
      _2478 = ((_2470 * _2299) + _390);
    } else {
      _2476 = _388;
      _2477 = _389;
      _2478 = _390;
    }
    float _2487 = __3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_2476 * 4.999999873689376e-05f) + 0.5f), ((_2477 - _2449) / _cloudThickness), ((_2478 * 4.999999873689376e-05f) + 0.5f)), 0.0f);
    float _2498 = saturate(abs(_2298) * 4.0f);
    float _2500 = (_2498 * _2498) * exp2(((_distanceScale * -1.4426950216293335f) * _2487.x) * (_cloudScatteringCoefficient / _distanceScale));
    float _2507 = ((1.0f - _2500) * saturate(((_389 - _cloudThickness) - _2449) * 0.10000000149011612f)) + _2500;
    float _2508 = _2507 * (((_2424 * 0.3395099937915802f) + (_2423 * 0.6131200194358826f)) + (_2425 * 0.047370001673698425f));
    float _2509 = _2507 * (((_2424 * 0.9163600206375122f) + (_2423 * 0.07020000368356705f)) + (_2425 * 0.013450000435113907f));
    float _2510 = _2507 * (((_2424 * 0.10958000272512436f) + (_2423 * 0.02061999961733818f)) + (_2425 * 0.8697999715805054f));
    float _2526 = (((_2508 * 0.6131200194358826f) + (_2509 * 0.3395099937915802f)) + (_2510 * 0.047370001673698425f)) * _2319;
    float _2527 = (((_2508 * 0.07020000368356705f) + (_2509 * 0.9163600206375122f)) + (_2510 * 0.013450000435113907f)) * _2319;
    float _2528 = (((_2508 * 0.02061999961733818f) + (_2509 * 0.10958000272512436f)) + (_2510 * 0.8697999715805054f)) * _2319;
    // [DAWN_DUSK_GI] SH ambient directional boost
    if (DAWN_DUSK_IMPROVEMENTS == 1.f) {
      float _ddFactor = DawnDuskFactor(_sunDirection.y);
      float3 _ddAmbient = DawnDuskAmbientBoost(
        float3(_2526, _2527, _2528),
        float3(float(_2280), float(_2281), float(_2282)),
        _sunDirection.xyz,
        _ddFactor,
        _precomputedAmbient0.xyz);
      _2526 = _ddAmbient.x;
      _2527 = _ddAmbient.y;
      _2528 = _ddAmbient.z;
    }
    float _2531 = float(_2246.x);
    float _2532 = float(_2246.y);
    float _2533 = float(_2246.z);
    if (!(_308) | !((((uint)_103 < (uint)20)) || ((_103 == 107)))) {
      _2541 = (_103 == 20);
    } else {
      _2541 = true;
    }
    do {
    if (_103 == 19) {
      _2550 = true;
      _2553 = _2550;
      _2554 = (_103 == 106);
      break;
    } else {
      bool _2544 = (_103 == 107);
      if (!((((_1541) || ((_103 == 28)))) || ((_717 == 26)))) {
        _2550 = _2544;
        _2553 = _2550;
        _2554 = (_103 == 106);
        break;
      } else {
        _2553 = _2544;
        _2554 = true;
      }
    }
    } while(false);
    float _2555 = float(_2280);
    float _2556 = float(_2281);
    float _2557 = float(_2282);
    if (_103 == 97) {
      uint16_t _2561 = __3__36__0__0__g_sceneDecalMask.Load(int3(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))), 0));
      _2568 = (((uint)((uint)((int)(min16uint)((int)((int)(_2561.x) & 4)))) >> 2) + 97);
    } else {
      _2568 = _103;
    }
    float _2573 = float(saturate(_185));
    float _2574 = _2573 * _2573;
    float _2575 = _2574 * _2574;
    float _2576 = _2575 * _2575;
    float4 _2583 = __3__36__0__0__g_puddleMask.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2((_bufferSizeAndInvSize.z * _90), (_bufferSizeAndInvSize.w * _91)), 0.0f);
    float _2587 = ((_2576 * _2576) * select(((_273) || (((_2553) || (_2554)))), 0.0f, 1.0f)) * _2583.y;
    float _2592 = _2555 - (_2587 * _2555);
    float _2593 = (_2587 * (1.0f - _2556)) + _2556;
    float _2594 = _2557 - (_2587 * _2557);
    float _2596 = rsqrt(dot(float3(_2592, _2593, _2594), float3(_2592, _2593, _2594)));
    float _2597 = _2592 * _2596;
    float _2598 = _2593 * _2596;
    float _2599 = _2594 * _2596;
    if ((_2285) || ((!(_2285)) && (_sunDirection.y > _moonDirection.y))) {
      _2611 = _sunDirection.x;
      _2612 = _sunDirection.y;
      _2613 = _sunDirection.z;
    } else {
      _2611 = _moonDirection.x;
      _2612 = _moonDirection.y;
      _2613 = _moonDirection.z;
    }
    float _2614 = _2526 * _lightingParams.x;
    float _2615 = _2527 * _lightingParams.x;
    float _2616 = _2528 * _lightingParams.x;
    float _2617 = _2611 - _430;
    float _2618 = _2612 - _432;
    float _2619 = _2613 - _434;
    float _2621 = rsqrt(dot(float3(_2617, _2618, _2619), float3(_2617, _2618, _2619)));
    float _2622 = _2621 * _2617;
    float _2623 = _2621 * _2618;
    float _2624 = _2621 * _2619;
    float _2625 = dot(float3(_2555, _2556, _2557), float3(_2611, _2612, _2613));
    float _2626 = dot(float3(_2597, _2598, _2599), float3(_2611, _2612, _2613));

    float _2628 = saturate(dot(float3(_2555, _2556, _2557), float3(_431, _433, _435)));
    float _2630 = saturate(dot(float3(_2597, _2598, _2599), float3(_2622, _2623, _2624)));
    float _2633 = saturate(dot(float3(_2611, _2612, _2613), float3(_2622, _2623, _2624)));
    float _2635 = float(max(0.010002136h, _2240));
    float _2636 = saturate(_2625);
    // RenoDX: Geometric Specular AA
    float _rndx_spec_rough = _2635;
    if (SPECULAR_AA > 0.0f) {
      _rndx_spec_rough = NDFFilterRoughnessCS(float3(_2597, _2598, _2599), _2635, SPECULAR_AA);
    }
    float _2637 = _rndx_spec_rough * _rndx_spec_rough;
    float _2638 = _2637 * _2637;
    float _2639 = 1.0f - _2638;
    float _2640 = 1.0f - _2633;
    float _2641 = _2640 * _2640;
    float _2644 = ((_2641 * _2641) * _2640) + _2633;
    float _2645 = 1.0f - _2636;
    float _2646 = _2645 * _2645;
    float _2651 = 1.0f - _2628;
    float _2652 = _2651 * _2651;
    float _2680;
    if (DIFFUSE_BRDF_MODE >= 2.0f) {
      // EON Diffuse
      float _eon_LdotV = dot(float3(_2611, _2612, _2613), float3(_431, _433, _435));
      _2680 = _2636 * EON_DiffuseScalar(_2636, _2628, _eon_LdotV, _2635);
    } else if (DIFFUSE_BRDF_MODE >= 1.0f) {
      // Hammon Diffuse
      _2680 = _2636 * HammonDiffuseScalar(_2636, _2628, _2630, _2633, _2635);
    } else {
      // Vanilla Burley Diffuse
      _2680 = saturate((_2636 * 0.31830987334251404f) * ((((((1.0f - ((_2646 * _2646) * (_2645 * 0.75f))) * (1.0f - ((_2652 * _2652) * (_2651 * 0.75f)))) - _2644) * saturate((_2639 * 2.200000047683716f) + -0.5f)) + _2644) + ((exp2(-0.0f - (max(((_2639 * 73.19999694824219f) + -21.200000762939453f), 8.899999618530273f) * sqrt(_2630))) * _2633) * ((((_2639 * 34.5f) + -59.0f) * _2639) + 24.5f))));
    }
    int _2681 = _2568 & 126;
    bool __defer_2610_2691 = false;
    bool __branch_chain_2610;
    if (((_2568 == 98)) || ((_2681 == 96))) {
      _2692 = true;
      __branch_chain_2610 = true;
    } else {
      if ((uint)(_2568 + -105) < (uint)2) {
        _2692 = _165;
        __branch_chain_2610 = true;
      } else {
        if (!((uint)(_2568 + -11) < (uint)9)) {
          _2692 = false;
          __branch_chain_2610 = true;
        } else {
          __branch_chain_2610 = false;
        }
      }
    }
    if (__branch_chain_2610) {
      __defer_2610_2691 = true;
    } else {
      _2700 = 0.0f;
    }
    if (__defer_2610_2691) {
      if (((_2568 == 65)) || ((((_2568 == 107)) || (_2692)))) {
        _2700 = 0.0f;
      } else {
        _2700 = float(_2239);
      }
    }
    bool _2701 = (_2568 == 53);
    float _2702 = float(_2241);
    float _2703 = float(_2242);
    float _2704 = float(_2243);
    if (_2701) {
      _2711 = saturate(((_2703 + _2702) + _2704) * 1.2000000476837158f);
    } else {
      _2711 = 1.0f;
    }
    float _2717 = (0.699999988079071f / min(max(max(max(_2702, _2703), _2704), 0.009999999776482582f), 0.699999988079071f)) * _2711;
    float _2727 = (((_2717 * _2702) + -0.03999999910593033f) * _2700) + 0.03999999910593033f;
    float _2728 = (((_2717 * _2703) + -0.03999999910593033f) * _2700) + 0.03999999910593033f;
    float _2729 = (((_2717 * _2704) + -0.03999999910593033f) * _2700) + 0.03999999910593033f;
    float _2730 = float(_2240);
    bool _2731 = (_2681 == 64);
    bool _2734 = ((((int)(uint)((int)(_2731))) & _1933) == 0);
    if (_2734) {
      _2746 = saturate(exp2((_2730 * _2730) * (_107 * -0.005770780146121979f)));
    } else {
      _2746 = select((_cavityParams.z > 0.0f), 0.0f, 1.0f);
    }
    float _2747 = select(_1952, 1.0f, _2746);
    if (_2731) {
      _2753 = (_2747 * _2727);
      _2754 = (_2747 * _2728);
      _2755 = (_2747 * _2729);
    } else {
      _2753 = _2727;
      _2754 = _2728;
      _2755 = _2729;
    }
    float _2758 = saturate(1.0f - saturate(dot(float3(_431, _433, _435), float3(_2622, _2623, _2624))));
    float _2759 = _2758 * _2758;
    float _2761 = (_2759 * _2759) * _2758;
    float _2764 = _2761 * saturate(_2754 * 50.0f);
    float _2765 = 1.0f - _2761;
    if (!_273) {
      float _2773 = saturate(_2626);
      float _2774 = 1.0f - _2637;
      float _2786 = (((_2638 * _2630) - _2630) * _2630) + 1.0f;
      float _2790 = (_2638 / ((_2786 * _2786) * 3.1415927410125732f)) * (0.5f / ((((_2774 * _2628) + _2637) * _2626) + (((_2774 * _2626) + _2637) * _2628)));
      _2804 = ((_2773 * _2531) * max((_2790 * ((_2765 * _2753) + _2764)), 0.0f));
      _2805 = ((_2773 * _2532) * max((_2790 * ((_2765 * _2754) + _2764)), 0.0f));
      _2806 = ((_2773 * _2533) * max((_2790 * ((_2765 * _2755) + _2764)), 0.0f));
    } else {
      _2804 = 0.0f;
      _2805 = 0.0f;
      _2806 = 0.0f;
    }
    // RenoDX: Diffraction on Rough Surfaces
    if (DIFFRACTION > 0.0f && _2700 > 0.0f) {
      float3 _rndx_dShift = DiffractionShiftAndSpeckleCS(
        _2630, _2628, _rndx_spec_rough,
        float2(_95, _96), _107,
        float3(_2622, _2623, _2624),
        float3(_2597, _2598, _2599),
        float3(_2702, _2703, _2704)
      );
      float3 _rndx_dMod = lerp(1.0f, _rndx_dShift, DIFFRACTION * _2700);
      _2804 *= _rndx_dMod.x;
      _2805 *= _rndx_dMod.y;
      _2806 *= _rndx_dMod.z;
    }
    // RenoDX: Callisto Smooth Terminator
    if (SMOOTH_TERMINATOR > 0.0f) {
      float _rndx_c2 = CallistoSmoothTerminator(_2636, _2633, _2630, SMOOTH_TERMINATOR, 0.5f);
      _2680 *= _rndx_c2;
      _2804 *= _rndx_c2;
      _2805 *= _rndx_c2;
      _2806 *= _rndx_c2;
    }
    // RenoDX: Foliage Transmission
    bool isFoliage = ((uint)(_103 - 12) < 7u);
    float foliageTransR = 0.0f;
    float foliageTransG = 0.0f;
    float foliageTransB = 0.0f;
    if (FOLIAGE_TRANSMISSION > 0.0f && isFoliage) {
      FoliageTransmissionResult _ftResult = FoliageTransmission(
          float3(_431, _433, _435),                   // V (view dir toward camera)
          float3(_2611, _2612, _2613),                 // L (light dir)
          float3(_2555, _2556, _2557),                 // N (surface normal)
          _2625,                                       // NdotL (raw)
          float3(_2702, _2703, _2704),                 // baseColor
          float3(_2531, _2532, _2533),                 // shadowColor
          float3(_2614, _2615, _2616),                 // lightLum
          FOLIAGE_TRANSMISSION_THICKNESS);              // thickness

      foliageTransR = _ftResult.transmission.x;
      foliageTransG = _ftResult.transmission.y;
      foliageTransB = _ftResult.transmission.z;

      if (_ftResult.diffuseScale > 0.0f) {
        _2680 *= _ftResult.diffuseScale;
      } else {
        // At terminator: use wrapped lambert directly
        float wrap = 0.25f * (1.0f - FOLIAGE_TRANSMISSION_THICKNESS);
        _2680 = max(0.0f, (_2625 + wrap) / (1.0f + wrap)) * 0.31830987334251404f * 0.75f;
      }
    }
    if ((_2541) || ((_2681 == 6))) {
      _2815 = ((max(0.0f, (0.30000001192092896f - _2625)) * 0.23190687596797943f) + _2680);
    } else {
      _2815 = _2680;
    }
    float _2822 = ((_2531 * _2815) * _2614) + (_1203 * _1148) + foliageTransR;
    float _2823 = ((_2532 * _2815) * _2615) + (_1204 * _1148) + foliageTransG;
    float _2824 = ((_2533 * _2815) * _2616) + (_1205 * _1148) + foliageTransB;
    uint _2827 = _frameNumber.x * 13;
    [branch]
    if (((((int)(_2827 + ((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3))))) | ((int)(_2827 + ((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))))) & 31) == 0) {
      __3__38__0__1__g_sceneColorLightingOnlyForAwbUAV[int2(((int)(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))) >> 5)), ((int)(((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))) >> 5)))] = half4(half(_2822), half(_2823), half(_2824), 1.0h);
    }
    bool _2842 = ((uint)(_2568 & 24) > (uint)23);
    if (_2734) {
      _2859 = saturate(exp2((_2730 * _2730) * (_107 * -0.005770780146121979f)));
    } else {
      _2859 = select((_cavityParams.z > 0.0f), select(_166, 0.0f, _420), 1.0f);
    }
    float _2877 = select(_2731, 1.0f, (select((_cavityParams.x == 0.0f), 1.0f, _2859) * select(((_165) && (_2842)), (1.0f - _420), 1.0f)));
    float _2881 = min(60000.0f, (_2877 * (((((_1966.x * _1959) + _1966.y) * _1915) * _1977) - min(0.0f, (-0.0f - (_2614 * _2804))))));
    float _2882 = min(60000.0f, (_2877 * (((((_1966.x * _1960) + _1966.y) * _1916) * _1977) - min(0.0f, (-0.0f - (_2615 * _2805))))));
    float _2883 = min(60000.0f, (_2877 * (((((_1966.x * _1961) + _1966.y) * _1917) * _1977) - min(0.0f, (-0.0f - (_2616 * _2806))))));
    float _2886 = 1.0f - _renderParams.x;
    half _2893 = half((_renderParams.x * _2702) + _2886);
    half _2894 = half((_renderParams.x * _2703) + _2886);
    half _2895 = half((_renderParams.x * _2704) + _2886);
    if ((_2731) && ((_renderParams2.x == 0.0f))) {
      _2911 = (pow(_2893, 0.5h));
      _2912 = (pow(_2894, 0.5h));
      _2913 = (pow(_2895, 0.5h));
    } else {
      _2911 = _2893;
      _2912 = _2894;
      _2913 = _2895;
    }
    float _2914 = float(_2911);
    float _2915 = float(_2912);
    float _2916 = float(_2913);
    if (_2701) {
      _2923 = saturate(((_2915 + _2914) + _2916) * 1.2000000476837158f);
    } else {
      _2923 = 1.0f;
    }
    float _2924 = float(_2239);
    float _2930 = (0.699999988079071f / min(max(max(max(_2914, _2915), _2916), 0.009999999776482582f), 0.699999988079071f)) * _2923;
    float _2937 = ((_2930 * _2914) + -0.03999999910593033f) * _2924;
    float _2938 = ((_2930 * _2915) + -0.03999999910593033f) * _2924;
    float _2939 = ((_2930 * _2916) + -0.03999999910593033f) * _2924;
    float _2940 = _2937 + 0.03999999910593033f;
    float _2941 = _2938 + 0.03999999910593033f;
    float _2942 = _2939 + 0.03999999910593033f;
    float _2946 = (_2940 * _1966.x) + _1966.y;
    float _2947 = (_2941 * _1966.x) + _1966.y;
    float _2948 = (_2942 * _1966.x) + _1966.y;
    float _2950 = (1.0f - _1966.y) - _1966.x;
    float _2957 = ((0.9599999785423279f - _2937) * 0.0476190485060215f) + _2940;
    float _2958 = ((0.9599999785423279f - _2938) * 0.0476190485060215f) + _2941;
    float _2959 = ((0.9599999785423279f - _2939) * 0.0476190485060215f) + _2942;
    float _2976 = saturate(1.0f - _2244);
    float _2977 = (((_2946 * _2957) / (1.0f - (_2957 * _2950))) * _2950) * _2976;
    float _2978 = (((_2947 * _2958) / (1.0f - (_2958 * _2950))) * _2950) * _2976;
    float _2979 = (((_2948 * _2959) / (1.0f - (_2959 * _2950))) * _2950) * _2976;
    float _2990 = float(1.0h - _2239);
    half _3000 = half(((_2914 * _2990) * saturate((1.0f - _2977) - _2946)) + _2977);
    half _3001 = half(((_2915 * _2990) * saturate((1.0f - _2978) - _2947)) + _2978);
    half _3002 = half(((_2916 * _2990) * saturate((1.0f - _2979) - _2948)) + _2979);
    float _3005 = __3__36__0__0__g_caustic.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_95, _96), 0.0f);
    float _3007 = _3005.x * 0.31830987334251404f;
    float _3017 = ((_3007 * _2526) + _2822) * float(_3000);
    float _3018 = ((_3007 * _2527) + _2823) * float(_3001);
    float _3019 = ((_3007 * _2528) + _2824) * float(_3002);
    float _3023 = _3017 + (_2881 * _2924);
    float _3024 = _3018 + (_2882 * _2924);
    float _3025 = _3019 + (_2883 * _2924);
    float _3047 = (((QuadReadLaneAt(_3023,1) + QuadReadLaneAt(_3023,0)) + QuadReadLaneAt(_3023,2)) + QuadReadLaneAt(_3023,3)) * 0.25f;
    float _3048 = (((QuadReadLaneAt(_3024,1) + QuadReadLaneAt(_3024,0)) + QuadReadLaneAt(_3024,2)) + QuadReadLaneAt(_3024,3)) * 0.25f;
    float _3049 = (((QuadReadLaneAt(_3025,1) + QuadReadLaneAt(_3025,0)) + QuadReadLaneAt(_3025,2)) + QuadReadLaneAt(_3025,3)) * 0.25f;
    [branch]
    if (((((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))) | ((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3))))) & 1) == 0) {
      float _3054 = dot(float3(_3047, _3048, _3049), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      __3__38__0__1__g_diffuseHalfPrevUAV[int2(((int)(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))) >> 1)), ((int)(((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))) >> 1)))] = float4(min(60000.0f, _3047), min(60000.0f, _3048), min(60000.0f, _3049), min(60000.0f, select((_1018 != 0), (-0.0f - _3054), _3054)));
    }
    if (_2842) {
      _3076 = (((_2239 == 0.0h)) && ((!(((((!(_3000 == 0.0h))) && ((!(_3001 == 0.0h))))) && ((!(_3002 == 0.0h)))))));
    } else {
      _3076 = false;
    }
    bool __defer_3075_3089 = false;
    if (((_2842) || ((((_2568 == 96)) || ((((_2568 == 54)) || (((_2568 & 124) == 64))))))) || ((!((_2842) || ((((_2568 == 96)) || ((((_2568 == 54)) || (((_2568 & 124) == 64)))))))) && (((_107 <= 10.0f)) && (((uint)(_2568 + -97) < (uint)2))))) {
      __defer_3075_3089 = true;
    } else {
      _3112 = (_3017 + _2881);
      _3113 = (_3018 + _2882);
      _3114 = (_3019 + _2883);
    }
    if (__defer_3075_3089) {
      __3__38__0__1__g_sceneSpecularUAV[int2(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))))] = half4((-0.0h - half(min(0.0f, (-0.0f - _2881)))), (-0.0h - half(min(0.0f, (-0.0f - _2882)))), (-0.0h - half(min(0.0f, (-0.0f - _2883)))), (-0.0h - half(min(0.0f, (-0.0f - _1925)))));
      _3112 = _3017;
      _3113 = _3018;
      _3114 = _3019;
    }
    float _3115 = min(60000.0f, _3112);
    float _3116 = min(60000.0f, _3113);
    float _3117 = min(60000.0f, _3114);
    [branch]
    if (_3076) {
      float4 _3120 = __3__38__0__1__g_sceneColorUAV.Load(int2(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5))))));
      _3128 = (_3120.x + _3115);
      _3129 = (_3120.y + _3116);
      _3130 = (_3120.z + _3117);
    } else {
      _3128 = _3115;
      _3129 = _3116;
      _3130 = _3117;
    }
    if (!(_renderParams.y == 0.0f)) {
      float _3139 = dot(float3(_3128, _3129, _3130), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _3140 = min((max(0.009999999776482582f, _exposure3.w) * 4096.0f), _3139);
      float _3144 = max(9.999999717180685e-10f, _3139);
      _3149 = ((_3140 * _3128) / _3144);
      _3150 = ((_3140 * _3129) / _3144);
      _3151 = ((_3140 * _3130) / _3144);
    } else {
      _3149 = _3128;
      _3150 = _3129;
      _3151 = _3130;
    }
    __3__38__0__1__g_sceneColorUAV[int2(((int)((((uint)(((int)((uint)(_79) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_60 - (_61 << 2)) << 3)))), ((int)((((uint)(_61 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_79)) >> 16) << 5)))))] = float4(_3149, _3150, _3151, 1.0f);
  }
}