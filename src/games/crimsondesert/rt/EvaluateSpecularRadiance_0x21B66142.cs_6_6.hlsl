#include "../shared.h"
#include "../sky-atmospheric/sky_dawn_dusk_common.hlsli"

struct SurfelData {
  uint _baseColor;
  uint _normal;
  half3 _radiance;
  uint16_t _radius;
};


Texture3D<float> __3__36__0__1__g_skyVisibilityVoxelsTexturesLikeUav : register(t223, space36);

Texture3D<float> __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav : register(t224, space36);

Texture3D<uint> __3__36__0__0__g_surfelIndicesVoxelsTextures : register(t217, space36);

Texture3D<uint4> __3__36__0__0__g_axisAlignedDistanceTextures : register(t218, space36);

Texture2D<float> __3__36__0__0__g_waterDepthTop : register(t167, space36);

Texture2D<float2> __3__36__0__0__g_texNetDensity : register(t19, space36);

Texture3D<float> __3__36__0__0__g_texCloudVolumeShadow : register(t195, space36);

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t141, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t229, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t232, space36);

Texture2DArray<half4> __3__36__0__0__g_shadowColorArray : register(t234, space36);

TextureCube<float4> __3__36__0__0__g_environmentColor : register(t225, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t0, space36);

Texture2D<float4> __3__36__0__0__g_normal : register(t152, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t79, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t39, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t50, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t174, space36);

Texture2D<float4> __3__36__0__0__g_character : register(t76, space36);

Texture2D<float4> __3__36__0__0__g_raytracingHitResult : register(t101, space36);

Texture2D<float4> __3__36__0__0__g_raytracingBaseColor : register(t103, space36);

Texture2D<float4> __3__36__0__0__g_raytracingNormal : register(t104, space36);

StructuredBuffer<SurfelData> __3__37__0__0__g_surfelDataBuffer : register(t24, space37);

Texture2D<float4> __3__36__0__0__g_sceneDiffuseHalfPrev : register(t169, space36);

Texture2D<float2> __3__36__0__0__g_sceneAO : register(t159, space36);

RWTexture2D<float> __3__38__0__1__g_specularRayHitDistanceUAV : register(u41, space38);

RWTexture2D<float4> __3__38__0__1__g_specularResultUAV : register(u8, space38);

cbuffer __1__3__0__0__PipelineProperty : register(b0, space3) {
  float2 g_screenSpaceScale : packoffset(c000.x);
  float2 __padding : packoffset(c000.z);
};

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

cbuffer __3__35__0__0__ShadowConstantBuffer : register(b21, space35) {
  float4 _shadowDepthRanges : packoffset(c000.x);
  float4 _massiveShadowSizeAndInvSize : packoffset(c001.x);
  uint4 _shadowParam : packoffset(c002.x);
  int4 _updateIndex : packoffset(c003.x);
  float4 _jitterOffset[8] : packoffset(c004.x);
  float4 _shadowRelativePosition : packoffset(c012.x);
  float4 _dynmaicShadowSizeAndInvSize : packoffset(c013.x);
  column_major float4x4 _dynamicShadowProjTexScale[2] : packoffset(c014.x);
  column_major float4x4 _dynamicShadowProjRelativeTexScale[2] : packoffset(c022.x);
  float4 _dynamicShadowFrustumPlanes0[6] : packoffset(c030.x);
  float4 _dynamicShadowFrustumPlanes1[6] : packoffset(c036.x);
  column_major float4x4 _dynamicShadowViewProj[2] : packoffset(c042.x);
  column_major float4x4 _dynamicShadowViewProjPrev[2] : packoffset(c050.x);
  column_major float4x4 _invDynamicShadowViewProj[2] : packoffset(c058.x);
  float4 _dynamicShadowPosition[2] : packoffset(c066.x);
  float4 _shadowSizeAndInvSize : packoffset(c068.x);
  column_major float4x4 _shadowProjTexScale[2] : packoffset(c069.x);
  column_major float4x4 _shadowProjRelativeTexScale[2] : packoffset(c077.x);
  float4 _staticShadowPosition[2] : packoffset(c085.x);
  column_major float4x4 _shadowViewProj[2] : packoffset(c087.x);
  column_major float4x4 _shadowViewProjRelative[2] : packoffset(c095.x);
  column_major float4x4 _invShadowViewProj[2] : packoffset(c103.x);
  float4 _currShadowFrustumPlanes[6] : packoffset(c111.x);
  column_major float4x4 _currShadowViewProjRelative : packoffset(c117.x);
  column_major float4x4 _currInvShadowViewProjRelative : packoffset(c121.x);
  float4 _currStaticShadowPosition : packoffset(c125.x);
  float4 _currTerrainShadowFrustumPlanes[6] : packoffset(c126.x);
  column_major float4x4 _terrainShadowProjTexScale : packoffset(c132.x);
  column_major float4x4 _terrainShadowProjRelativeTexScale : packoffset(c136.x);
  column_major float4x4 _terrainShadowViewProj : packoffset(c140.x);
  column_major float4x4 _nearFieldShadowViewProj : packoffset(c144.x);
  float4 _nearFieldShadowFlag : packoffset(c148.x);
  float4 _nearFieldShadowFrustumPlanes[6] : packoffset(c149.x);
};

cbuffer __3__35__0__0__VoxelGlobalIlluminationConstantBuffer : register(b2, space35) {
  float4 _voxelParams : packoffset(c000.x);
  float4 _invClipmapExtent : packoffset(c001.x);
  float4 _wrappedViewPosForInject : packoffset(c002.x);
  float4 _clipmapOffsetsForInject[8] : packoffset(c003.x);
  float4 _clipmapRelativeIndexOffsetsForInject[8] : packoffset(c011.x);
  float4 _wrappedViewPos : packoffset(c019.x);
  float4 _clipmapOffsets[8] : packoffset(c020.x);
  float4 _clipmapOffsetsPrev[8] : packoffset(c028.x);
  float4 _clipmapRelativeIndexOffsets[8] : packoffset(c036.x);
  float4 _clipmapUVParams[2] : packoffset(c044.x);
  float4 _clipmapUVRelativeOffset : packoffset(c046.x);
  uint4 _surfelTimestamps : packoffset(c047.x);
};

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b34, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__WaterConstantBuffer : register(b3, space35) {
  float4 _waterDepthFieldSize : packoffset(c000.x);
  float4 _waterDepthFieldTextureSize : packoffset(c001.x);
  float4 _waterDepthMinMax : packoffset(c002.x);
  column_major float4x4 _waterDepthViewProjRelative : packoffset(c003.x);
  column_major float4x4 _waterDepthViewProjRelativeInv : packoffset(c007.x);
  float4 _waterDepthFrustumPlanes[6] : packoffset(c011.x);
  float4 _waterReadbackTextureSize : packoffset(c017.x);
  column_major float4x4 _waterReadbackViewProjRelative : packoffset(c018.x);
  column_major float4x4 _waterReadbackViewProjRelativeInv : packoffset(c022.x);
  float4 _ripplePivot : packoffset(c026.x);
  float4 _rippleFieldSize : packoffset(c027.x);
  float4 _rippleFieldTextureSize : packoffset(c028.x);
  float4 _shallowWaterPivot : packoffset(c029.x);
  float4 _shallowWaterFieldSize : packoffset(c030.x);
  float4 _shallowWaterFieldTextureSize : packoffset(c031.x);
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

cbuffer __3__1__0__0__RenderVoxelConstants : register(b0, space1) {
  float4 _renderParams : packoffset(c000.x);
  float4 _renderParams2 : packoffset(c001.x);
  float4 _cubemapViewPosRelative : packoffset(c002.x);
  float4 _lightingParams : packoffset(c003.x);
  float4 _volumeSize : packoffset(c004.x);
  float4 _renderFlags : packoffset(c005.x);
  float4 _tiledRadianceCacheParams : packoffset(c006.x);
};

SamplerState __3__40__0__0__g_sampler : register(s1, space40);

SamplerState __3__40__0__0__g_samplerTrilinear : register(s7, space40);

SamplerState __0__4__0__0__g_staticBilinearWrapUWClampV : register(s1, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

SamplerState __0__4__0__0__g_staticVoxelSampler : register(s12, space4);

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int __loop_jump_target = -1;
  int _44[4];
  int _58 = (int)(SV_GroupID.x) & 15;
  int _59 = (uint)((uint)(_58)) >> 2;
  _44[0] = ((g_tileIndex[(SV_GroupID.x) >> 6]).x);
  _44[1] = ((g_tileIndex[(SV_GroupID.x) >> 6]).y);
  _44[2] = ((g_tileIndex[(SV_GroupID.x) >> 6]).z);
  _44[3] = ((g_tileIndex[(SV_GroupID.x) >> 6]).w);
  int _77 = _44[(((uint)(SV_GroupID.x) >> 4) & 3)];
  float _87 = __3__36__0__0__g_depth.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
  uint2 _90 = __3__36__0__0__g_stencil.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
  int _92 = _90.x & 127;
  float _101 = g_screenSpaceScale.x * _bufferSizeAndInvSize.x;
  float _104 = (1.0f / g_screenSpaceScale.x) * _bufferSizeAndInvSize.z;
  float _105 = float((int)((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))));
  float _106 = float((int)((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))));
  float _111 = (((_105 + 0.5f) * 2.0f) * _104) + -1.0f;
  float _115 = 1.0f - ((((_106 + 0.5f) * 2.0f) * _bufferSizeAndInvSize.w) * (1.0f / g_screenSpaceScale.y));
  float _118 = max(1.0000000116860974e-07f, _87.x);
  float _119 = _nearFarProj.x / _118;
  float _155 = mad((_invViewProjRelative[3].z), _118, mad((_invViewProjRelative[3].y), _115, ((_invViewProjRelative[3].x) * _111))) + (_invViewProjRelative[3].w);
  float _156 = (mad((_invViewProjRelative[0].z), _118, mad((_invViewProjRelative[0].y), _115, ((_invViewProjRelative[0].x) * _111))) + (_invViewProjRelative[0].w)) / _155;
  float _157 = (mad((_invViewProjRelative[1].z), _118, mad((_invViewProjRelative[1].y), _115, ((_invViewProjRelative[1].x) * _111))) + (_invViewProjRelative[1].w)) / _155;
  float _158 = (mad((_invViewProjRelative[2].z), _118, mad((_invViewProjRelative[2].y), _115, ((_invViewProjRelative[2].x) * _111))) + (_invViewProjRelative[2].w)) / _155;
  float _160 = rsqrt(dot(float3(_156, _157, _158), float3(_156, _157, _158)));
  float _161 = _160 * _156;
  float _162 = _160 * _157;
  float _163 = _160 * _158;
  bool _180;
  bool _181;
  bool _184;
  bool _185;
  bool _188;
  bool _189;
  bool _190;
  float _292;
  float _293;
  float _294;
  float _297;
  float _298;
  float _299;
  bool _300;
  int _326;
  int _329;
  bool _330;
  int _338;
  int _339;
  float _340;
  float _341;
  float _342;
  float _343;
  float _391;
  float _392;
  float _393;
  float _394;
  float _395;
  float _396;
  int _547;
  float _789;
  float _790;
  float _791;
  float _802;
  float _803;
  float _804;
  float _851;
  int _867;
  bool _997;
  float _998;
  float _999;
  float _1000;
  float _1001;
  float _1002;
  float _1003;
  float _1004;
  float _1024;
  float _1025;
  float _1026;
  float _1150;
  float _1151;
  float _1152;
  float _1153;
  float _1159;
  bool _1226;
  int _1315;
  int _1373;
  int _1400;
  int _1458;
  float _1479;
  int _1525;
  int _1588;
  int _1589;
  int _1590;
  int _1591;
  int _1607;
  int _1608;
  int _1609;
  int _1610;
  int _1616;
  int _1679;
  int _1680;
  int _1681;
  int _1682;
  int _1687;
  int _1688;
  int _1689;
  int _1690;
  int _1691;
  int _1694;
  int _1695;
  int _1696;
  int _1697;
  int _1700;
  int _1701;
  int _1702;
  int _1703;
  int _1704;
  bool _1727;
  int _1728;
  int _1729;
  int _1730;
  int _1731;
  int _1732;
  int _1741;
  int _1742;
  int _1743;
  int _1744;
  int _1745;
  float _1801;
  float _1802;
  float _1803;
  float _1804;
  float _1805;
  float _1806;
  float _1807;
  int _1808;
  float _2020;
  float _2021;
  float _2022;
  float _2023;
  float _2040;
  float _2041;
  float _2042;
  float _2208;
  float _2209;
  float _2210;
  float _2211;
  half _2212;
  half _2213;
  half _2214;
  half _2215;
  float _2353;
  float _2354;
  float _2355;
  float _2356;
  float _2357;
  float _2358;
  float _2359;
  float _2360;
  half _2361;
  half _2362;
  half _2363;
  half _2364;
  float _2415;
  float _2416;
  float _2417;
  float _2418;
  int _2419;
  int _2420;
  float _2467;
  float _2468;
  float _2469;
  float _2470;
  int _2471;
  int _2472;
  float _2502;
  float _2503;
  float _2504;
  float _2505;
  float _2624;
  float _2625;
  float _2626;
  float _2645;
  float _2646;
  float _2647;
  float _2648;
  float _2730;
  float _2765;
  float _2766;
  float _2767;
  float _2787;
  float _2844;
  float _2942;
  float _2943;
  float _2944;
  float _3008;
  float _3009;
  float _3010;
  float _3011;
  half _3012;
  half _3013;
  half _3014;
  float _3015;
  float _3016;
  float _3017;
  float _3018;
  float _3019;
  int _3158;
  int _3216;
  float _3257;
  float _3320;
  float _3321;
  float _3322;
  float _3323;
  float _3324;
  int _3325;
  int _3326;
  float _3327;
  float _3328;
  float _3329;
  float _3330;
  float _3331;
  float _3332;
  float _3333;
  float _3334;
  float _3355;
  float _3356;
  float _3357;
  float _3398;
  float _3399;
  float _3400;
  float _3401;
  int _3543;
  bool _3565;
  bool _3595;
  bool _3603;
  int _3617;
  float _3626;
  float _3630;
  float _3688;
  float _3689;
  float _3690;
  float _3691;
  float _3698;
  int _3702;
  int _3760;
  int _3790;
  float _3791;
  float _3792;
  float _3793;
  float _3794;
  float _3795;
  float _3796;
  int _3798;
  float _4014;
  float _4052;
  float _4081;
  float _4083;
  float _4084;
  float _4085;
  float _4086;
  float _4087;
  float _4147;
  float _4148;
  float _4149;
  float _4168;
  int _4222;
  int _4285;
  int _4286;
  int _4287;
  int _4288;
  int _4304;
  int _4305;
  int _4306;
  int _4307;
  int _4314;
  int _4377;
  int _4378;
  int _4379;
  int _4380;
  int _4385;
  int _4386;
  int _4387;
  int _4388;
  int _4389;
  int _4392;
  int _4393;
  int _4394;
  int _4395;
  int _4398;
  int _4399;
  int _4400;
  int _4401;
  int _4402;
  bool _4425;
  int _4426;
  int _4427;
  int _4428;
  int _4429;
  int _4430;
  int _4439;
  int _4440;
  int _4441;
  int _4442;
  int _4443;
  float _4499;
  float _4500;
  float _4501;
  float _4502;
  int _4503;
  float _4704;
  float _4705;
  float _4706;
  float _4707;
  float _4724;
  float _4725;
  float _4726;
  float _4734;
  float _4735;
  float _4736;
  float _4737;
  float _4738;
  int _4784;
  int _4842;
  float _4863;
  float _4921;
  float _4922;
  float _4923;
  int _4936;
  int _4999;
  int _5000;
  int _5001;
  int _5002;
  float _5025;
  float _5026;
  float _5027;
  float _5029;
  float _5030;
  float _5031;
  float _5032;
  float _5033;
  float _5034;
  float _5035;
  int _5036;
  float _5145;
  float _5146;
  float _5147;
  float _5148;
  float _5149;
  float _5150;
  float _5151;
  float _5162;
  float _5163;
  float _5164;
  float _5165;
  float _5166;
  float _5167;
  float _5168;
  float _5169;
  bool _5170;
  float _5171;
  float _5317;
  float _5318;
  float _5319;
  float _5320;
  half _5321;
  half _5322;
  half _5323;
  half _5324;
  float _5462;
  float _5463;
  float _5464;
  float _5465;
  float _5466;
  float _5467;
  float _5468;
  float _5469;
  half _5470;
  half _5471;
  half _5472;
  half _5473;
  float _5524;
  float _5525;
  float _5526;
  float _5527;
  int _5528;
  int _5529;
  float _5576;
  float _5577;
  float _5578;
  float _5579;
  int _5580;
  int _5581;
  float _5611;
  float _5612;
  float _5613;
  float _5614;
  float _5730;
  float _5731;
  float _5732;
  float _5751;
  float _5752;
  float _5753;
  float _5754;
  float _5836;
  float _5868;
  float _5869;
  float _5870;
  float _5890;
  float _5947;
  float _6044;
  float _6045;
  float _6046;
  half _6107;
  half _6108;
  half _6109;
  float _6110;
  float _6134;
  float _6135;
  float _6136;
  float _6147;
  float _6148;
  float _6149;
  float _6150;
  float _6151;
  float _6152;
  float _6153;
  float _6154;
  float _6175;
  float _6176;
  float _6177;
  float _6178;
  float _6179;
  float _6180;
  float _6181;
  int _6188;
  int _6246;
  float _6287;
  float _6319;
  float _6320;
  float _6321;
  float _6349;
  float _6350;
  float _6351;
  bool _6405;
  int _6406;
  int _6407;
  int _6408;
  int _6409;
  int _6410;
  bool _6419;
  int _6420;
  int _6421;
  int _6422;
  int _6423;
  int _6424;
  if ((uint)_92 > (uint)11) {
    bool __defer_166_179 = false;
    if (!((((uint)_92 < (uint)20)) || ((_92 == 107)))) {
      bool _171 = (_92 == 20);
      if ((_90.x & 126) == 96) {
        _184 = _171;
        _185 = true;
        _188 = _185;
        _189 = _184;
        _190 = (_92 == 54);
      } else {
        bool _177 = (_92 == 98);
        if (!(_92 == 66)) {
          _180 = _177;
          _181 = _171;
          __defer_166_179 = true;
        } else {
          _188 = _177;
          _189 = _171;
          _190 = true;
        }
      }
    } else {
      _180 = (_92 == 98);
      _181 = true;
      __defer_166_179 = true;
    }
    if (__defer_166_179) {
      if (!(_92 == 67)) {
        _184 = _181;
        _185 = _180;
        _188 = _185;
        _189 = _184;
        _190 = (_92 == 54);
      } else {
        _188 = _180;
        _189 = _181;
        _190 = true;
      }
    }
  } else {
    _184 = false;
    _185 = false;
    _188 = _185;
    _189 = _184;
    _190 = (_92 == 54);
  }
  bool _193 = (_92 == 33);
  bool _194 = (_92 == 55);
  bool _195 = (_193) || (_194);
  uint4 _198 = __3__36__0__0__g_baseColor.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
  float4 _203 = __3__36__0__0__g_normal.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
  float _209 = float((uint)((uint)(_198.y & 255))) * 0.003921568859368563f;
  float _213 = float((uint)((uint)(((uint)((uint)(_198.z)) >> 8) & 255))) * 0.003921568859368563f;
  float _228 = (saturate(_203.x * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _229 = (saturate(_203.y * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _230 = (saturate(_203.z * 1.0009784698486328f) * 2.0f) + -1.0f;
  float _232 = rsqrt(dot(float3(_228, _229, _230), float3(_228, _229, _230)));
  float _233 = _232 * _228;
  float _234 = _232 * _229;
  float _235 = _230 * _232;
  float _238 = (float((uint)((uint)(((uint)((uint)(_198.w)) >> 8) & 255))) * 0.007843137718737125f) + -1.0f;
  float _239 = (float((uint)((uint)(_198.w & 255))) * 0.007843137718737125f) + -1.0f;
  float _242 = (_238 + _239) * 0.5f;
  float _243 = (_238 - _239) * 0.5f;
  float _247 = (1.0f - abs(_242)) - abs(_243);
  float _249 = rsqrt(dot(float3(_242, _243, _247), float3(_242, _243, _247)));
  float _250 = _249 * _242;
  float _251 = _249 * _243;
  float _252 = _249 * _247;
  float _254 = select((_235 >= 0.0f), 1.0f, -1.0f);
  float _257 = -0.0f - (1.0f / (_254 + _235));
  float _258 = _234 * _257;
  float _259 = _258 * _233;
  float _260 = _254 * _233;
  float _269 = mad(_252, _233, mad(_251, _259, ((((_260 * _233) * _257) + 1.0f) * _250)));
  float _273 = mad(_252, _234, mad(_251, (_254 + (_258 * _234)), ((_250 * _254) * _259)));
  float _277 = mad(_252, _235, mad(_251, (-0.0f - _234), (-0.0f - (_260 * _250))));
  float _279 = rsqrt(dot(float3(_269, _273, _277), float3(_269, _273, _277)));
  float _280 = _279 * _269;
  float _281 = _279 * _273;
  float _282 = _279 * _277;
  bool _284 = (_92 == 29);
  if (((_92 == 24)) || (_284)) {
    _292 = 0.0f;
    _293 = 0.0f;
    _294 = select(_284, _213, 0.0f);
    _297 = _292;
    _298 = _293;
    _299 = _294;
    _300 = (_92 == 107);
  } else {
    if (!((uint)(_92 + -11) < (uint)9)) {
      _292 = _213;
      _293 = _209;
      _294 = 0.0f;
      _297 = _292;
      _298 = _293;
      _299 = _294;
      _300 = (_92 == 107);
    } else {
      _297 = _213;
      _298 = _209;
      _299 = 0.0f;
      _300 = true;
    }
  }
  float _302 = select(((_188) || (_300)), 0.0f, _298);
  if ((_195) || (_190)) {
    float4 _306 = __3__36__0__0__g_character.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
    float _313 = (_306.x * 2.0f) + -1.0f;
    float _314 = (_306.y * 2.0f) + -1.0f;
    float _315 = (_306.z * 2.0f) + -1.0f;
    float _317 = rsqrt(dot(float3(_313, _314, _315), float3(_313, _314, _315)));
    if (_194) {
      if (_306.z < 0.0010000000474974513f) {
        _326 = 53;
      } else {
        _326 = 55;
      }
      _329 = _326;
      _330 = (_326 == 55);
    } else {
      if (!_193) {
        _326 = _92;
        _329 = _326;
        _330 = (_326 == 55);
      } else {
        _329 = 33;
        _330 = true;
      }
    }
    _338 = _329;
    _339 = ((int)(uint)((int)(_330)));
    _340 = _297;
    _341 = (_313 * _317);
    _342 = (_314 * _317);
    _343 = (_315 * _317);
  } else {
    _338 = _92;
    _339 = ((int)(uint)((int)(_195)));
    _340 = select(((((_90.x & 126) == 64)) && ((_92 != 65))), (_297 * 0.60009765625f), _297);
    _341 = 0.0f;
    _342 = 0.0f;
    _343 = 0.0f;
  }
  float _344 = max(0.019999999552965164f, _340);
  if (((_92 == 19)) || (_190)) {
    float _349 = (_342 * _282) - (_343 * _281);
    float _352 = (_343 * _280) - (_341 * _282);
    float _355 = (_341 * _281) - (_342 * _280);
    float _357 = rsqrt(dot(float3(_349, _352, _355), float3(_349, _352, _355)));
    _391 = _341;
    _392 = _342;
    _393 = _343;
    _394 = (_357 * _349);
    _395 = (_357 * _352);
    _396 = (_357 * _355);
  } else {
    float _364 = (_282 * _162) - (_281 * _163);
    float _367 = (_280 * _163) - (_282 * _161);
    float _370 = (_281 * _161) - (_280 * _162);
    float _372 = rsqrt(dot(float3(_364, _367, _370), float3(_364, _367, _370)));
    float _373 = _372 * _364;
    float _374 = _372 * _367;
    float _375 = _372 * _370;
    float _378 = (_375 * _281) - (_374 * _282);
    float _381 = (_373 * _282) - (_375 * _280);
    float _384 = (_374 * _280) - (_373 * _281);
    float _386 = rsqrt(dot(float3(_378, _381, _384), float3(_378, _381, _384)));
    _391 = (_378 * _386);
    _392 = (_381 * _386);
    _393 = (_384 * _386);
    _394 = _373;
    _395 = _374;
    _396 = _375;
  }
  int _397 = _338 & -2;
  float _400 = _344 * _344;
  float _401 = _400 * select((_397 == 64), 0.5f, 2.0f);
  int _413 = (((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524);
  uint _439 = (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) + 1013904242u))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285);
  uint _441 = ((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) + 1013904242u))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596);
  int _443 = (uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) + 1013904242u))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5;
  uint _454 = ((uint)((((int)(((((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))) + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) + 1013904242u))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)));
  int _469 = (((int)(((((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))))) + 2027808484u))) ^ ((int)(((uint)((uint)(((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))))) >> 5)) + 2123724318u));
  int _485 = (((int)(((((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))) + 387276957u))) ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))) >> 5)) + 2123724318u));
  int _501 = (((int)(((((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))))))) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))))))) >> 5)) + 2123724318u));
  int _514 = ((int)(((((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) + 1401181199u));
  int _522 = ((int)(((((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454)))) + (uint)(-239350328)));
  uint _526 = ((uint)(_522 ^ (((uint)(((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454)))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105))))))));
  bool _536 = (((int)(_526) & 16777215) == 0);
  if (_536) {
    int _541 = ((int)(((((uint)((((int)((_526 << 4) + (uint)(-1383041155))) ^ ((int)(_526 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_526) >> 5)) + 2123724318u)))) + (((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_526 << 4) + (uint)(-1383041155))) ^ ((int)(_526 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_526) >> 5)) + 2123724318u)))) + (((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))))) + (uint)(-1879881855)));
    _547 = ((int)(((uint)(_541 ^ (((uint)(((uint)((((int)((_526 << 4) + (uint)(-1383041155))) ^ ((int)(_526 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_526) >> 5)) + 2123724318u)))) + (((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))))) >> 5) + -939442524))) + _526));
  } else {
    _547 = (int)(_526);
  }
  uint _553 = min((uint)(1023), (uint)((int)(uint(float((uint)((uint)(((int)(_547 * 48271)) & 16777215))) * 6.103515625e-05f))));
  float _555 = float((uint)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3))));
  float _556 = float((uint)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5))));
  float _557 = float((uint)(uint)(_frameNumber.x));
  float _558 = _557 * 92.0f;
  float _559 = _557 * 71.0f;
  float _568 = (frac((_558 + _555) * 0.0078125f) * 128.0f) + -64.34062194824219f;
  float _569 = (frac((_559 + _556) * 0.0078125f) * 128.0f) + -72.46562194824219f;
  float _574 = frac(dot(float3((_568 * _568), (_569 * _569), (_569 * _568)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
  float _599 = (sqrt((sqrt(1.0f / ((_401 * _401) + 1.0f)) + 1.0f) * 0.5f) * 0.949999988079071f) * ((float((uint)((uint)(reversebits(_553) ^ (int)(uint(_574 * 287478368.0f))))) * 2.3283064365386963e-10f) + -0.5f);
  float _600 = _599 + 0.5f;
  float _601 = dot(float3(_161, _162, _163), float3(_280, _281, _282));
  float _602 = frac((float((uint)((uint)((int)(uint(_574 * 51540816.0f)) & 65535))) * 1.52587890625e-05f) + (float((uint)_553) * 0.0009765625f)) * 6.2831854820251465f;
  float _603 = 0.5f - _599;
  float _604 = sin(_602);
  float _605 = cos(_602);
  if (_339 == 0) {
    if (_190) {
      float _683 = saturate(_344 + 0.5f);
      float _686 = max(0.0f, sqrt(_600 / _603));
      float _688 = (_605 * _400) * _686;
      float _691 = ((_683 * _683) * _604) * _686;
      float _697 = 1.0f / sqrt(((_691 * _691) + 1.0f) + (_688 * _688));
      float _698 = _697 * _688;
      float _699 = _697 * _691;
      _802 = mad(_697, _280, mad(_699, _394, (_698 * _391)));
      _803 = mad(_697, _281, mad(_699, _395, (_698 * _392)));
      _804 = mad(_697, _282, mad(_699, _396, (_698 * _393)));
    } else {
      float _711 = select((_282 >= 0.0f), 1.0f, -1.0f);
      float _714 = -0.0f - (1.0f / (_711 + _282));
      float _716 = (_280 * _281) * _714;
      float _720 = (((_280 * _280) * _711) * _714) + 1.0f;
      float _721 = _716 * _711;
      float _723 = -0.0f - (_711 * _280);
      float _726 = ((_281 * _281) * _714) + _711;
      float _727 = -0.0f - _281;
      float _728 = dot(float3(_161, _162, _163), float3(_720, _721, _723));
      float _729 = dot(float3(_161, _162, _163), float3(_716, _726, _727));
      float _730 = -0.0f - _601;
      float _732 = _400 * _400;
      if (_338 == 29) {
        float _739 = saturate(sqrt(_603 / ((_600 * (_732 + -1.0f)) + 1.0f)));
        float _742 = sqrt(1.0f - (_739 * _739));
        _789 = (_742 * _605);
        _790 = (_742 * _604);
        _791 = _739;
      } else {
        float _746 = -0.0f - _400;
        float _747 = _728 * _746;
        float _748 = _729 * _746;
        float _750 = rsqrt(dot(float3(_747, _748, _730), float3(_747, _748, _730)));
        float _753 = _750 * _730;
        float _758 = sqrt((_729 * _729) + (_728 * _728)) + 1.0f;
        float _759 = _758 * _758;
        float _768 = select((_601 < -0.0f), (((_759 - (_759 * _732)) / (_759 + ((_601 * _601) * _732))) * _753), _753);
        float _771 = mad(_603, (_768 + 1.0f), (-0.0f - _768));
        float _775 = sqrt(saturate(1.0f - (_771 * _771)));
        float _780 = _771 + _753;
        float _781 = ((_775 * _605) + (_750 * _747)) * _400;
        float _782 = ((_775 * _604) + (_750 * _748)) * _400;
        float _784 = rsqrt(dot(float3(_781, _782, _780), float3(_781, _782, _780)));
        _789 = (_781 * _784);
        _790 = (_782 * _784);
        _791 = (_784 * _780);
      }
      _802 = mad(_791, _280, mad(_790, _716, (_789 * _720)));
      _803 = mad(_791, _281, mad(_790, _726, (_789 * _721)));
      _804 = mad(_791, _282, mad(_790, _727, (_789 * _723)));
    }
  } else {
    float _608 = select((_282 >= 0.0f), 1.0f, -1.0f);
    float _611 = -0.0f - (1.0f / (_608 + _282));
    float _613 = (_280 * _281) * _611;
    float _617 = (((_280 * _280) * _608) * _611) + 1.0f;
    float _618 = _613 * _608;
    float _620 = -0.0f - (_608 * _280);
    float _623 = ((_281 * _281) * _611) + _608;
    float _624 = -0.0f - _281;
    float _625 = dot(float3(_161, _162, _163), float3(_617, _618, _620));
    float _626 = dot(float3(_161, _162, _163), float3(_613, _623, _624));
    float _627 = -0.0f - _601;
    float _628 = -0.0f - _400;
    float _629 = _625 * _628;
    float _630 = _626 * _628;
    float _632 = rsqrt(dot(float3(_629, _630, _627), float3(_629, _630, _627)));
    float _635 = _632 * _627;
    float _640 = sqrt((_626 * _626) + (_625 * _625)) + 1.0f;
    float _641 = _400 * _400;
    float _642 = _640 * _640;
    float _651 = select((_601 < -0.0f), (((_642 - (_642 * _641)) / (_642 + ((_601 * _601) * _641))) * _635), _635);
    float _654 = mad(_603, (_651 + 1.0f), (-0.0f - _651));
    float _658 = sqrt(saturate(1.0f - (_654 * _654)));
    float _663 = _654 + _635;
    float _664 = ((_658 * _605) + (_632 * _629)) * _400;
    float _665 = ((_658 * _604) + (_632 * _630)) * _400;
    float _667 = rsqrt(dot(float3(_664, _665, _663), float3(_664, _665, _663)));
    float _668 = _664 * _667;
    float _669 = _665 * _667;
    float _670 = _667 * _663;
    _802 = mad(_670, _280, mad(_669, _613, (_668 * _617)));
    _803 = mad(_670, _281, mad(_669, _623, (_668 * _618)));
    _804 = mad(_670, _282, mad(_669, _624, (_668 * _620)));
  }
  float _809 = dot(float3((-0.0f - _161), (-0.0f - _162), (-0.0f - _163)), float3(_802, _803, _804)) * 2.0f;
  float _813 = (_809 * _802) + _161;
  float _814 = (_809 * _803) + _162;
  float _815 = (_809 * _804) + _163;
  float _816 = _601 * 2.0f;
  float _820 = _161 - (_816 * _280);
  float _821 = _162 - (_816 * _281);
  float _822 = _163 - (_816 * _282);
  float _824 = rsqrt(dot(float3(_820, _821, _822), float3(_820, _821, _822)));
  float _832 = 4096.0f - ((_302 * 3584.0f) * _terrainNormalParams.z);
  if ((uint)_338 > (uint)11) {
    if (((_397 == 106)) || (((((uint)(_338 + -27) < (uint)2)) || ((((_338 == 26)) || (((((uint)_338 < (uint)21)) || (((_338 & -3) == 105))))))))) {
      _851 = min(256.0f, _832);
    } else {
      _851 = _832;
    }
  } else {
    if (_397 == 6) {
      _851 = min(256.0f, _832);
    } else {
      _851 = _832;
    }
  }
  float _854 = _exposure3.w * _851;
  float _856 = select(_190, (_854 * 0.5f), _854);
  if (_536) {
    int _861 = ((int)(((((uint)((((int)((_526 << 4) + (uint)(-1383041155))) ^ ((int)(_526 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_526) >> 5)) + 2123724318u)))) + (((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_526 << 4) + (uint)(-1383041155))) ^ ((int)(_526 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_526) >> 5)) + 2123724318u)))) + (((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))))) + (uint)(-1879881855)));
    _867 = ((int)(((uint)(_861 ^ (((uint)(((uint)((((int)((_526 << 4) + (uint)(-1383041155))) ^ ((int)(_526 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_526) >> 5)) + 2123724318u)))) + (((uint)(_514 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) + 1401181199u))) ^ (((uint)((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_485) + ((uint)(_469) + _454)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_485) + ((uint)(_469) + _454)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_485) + ((uint)(_469) + _454)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_469) + _454) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_469) + _454) + 387276957u))) ^ (((uint)((uint)(_469) + _454) >> 5) + -939442524))) + (((uint)((((int)((_454 << 4) + (uint)(-1556008596))) ^ ((int)(_454 + 2027808484u))) ^ (((uint)(_454) >> 5) + -939442524))) + (((uint)(((int)(_441) ^ (int)(_439)) ^ (_443 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _106) + _105)))))))) >> 5)) + 2123724318u)))) + ((uint)(_501) + ((uint)(_485) + ((uint)(_469) + _454))))) >> 5) + -939442524))) + _526));
  } else {
    _867 = (int)(_526);
  }
  float _881 = (frac((_558 + _105) * 0.0078125f) * 128.0f) + -64.34062194824219f;
  float _882 = (frac((_559 + _106) * 0.0078125f) * 128.0f) + -72.46562194824219f;
  float _887 = frac(dot(float3((_881 * _881), (_882 * _882), (_882 * _881)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
  int _892 = (int)(uint(float((uint)((uint)(((int)(_867 * 48271)) & 16777215))) * 1.9067525727223256e-06f)) & 31;
  float _899 = frac((float((uint)((uint)((int)(uint(_887 * 51540816.0f)) & 65535))) * 1.52587890625e-05f) + (float((uint)(uint)(_892)) * 0.03125f));
  float _903 = float((uint)((uint)(reversebits(_892) ^ (int)(uint(_887 * 287478368.0f))))) * 2.3283064365386963e-10f;
  float4 _905 = __3__36__0__0__g_raytracingHitResult.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
  float _907 = _905.x * _813;
  float _908 = _905.x * _814;
  float _909 = _905.x * _815;
  float _910 = _907 + _156;
  float _911 = _908 + _157;
  float _912 = _909 + _158;
  float _948 = mad((_viewProjRelative[3].z), _912, mad((_viewProjRelative[3].y), _911, (_910 * (_viewProjRelative[3].x)))) + (_viewProjRelative[3].w);
  float _949 = (mad((_viewProjRelative[0].z), _912, mad((_viewProjRelative[0].y), _911, (_910 * (_viewProjRelative[0].x)))) + (_viewProjRelative[0].w)) / _948;
  float _950 = (mad((_viewProjRelative[1].z), _912, mad((_viewProjRelative[1].y), _911, (_910 * (_viewProjRelative[1].x)))) + (_viewProjRelative[1].w)) / _948;
  float4 _962 = __3__36__0__0__g_raytracingNormal.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
  if (!(((_962.w == 1.0f)) && ((((_962.z == 0.0f)) && ((((_962.x == 0.0f)) && ((_962.y == 0.0f))))))) | !(_renderParams.z > 0.0f)) {
    float4 _980 = __3__36__0__0__g_raytracingBaseColor.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
    float _988 = (_962.x * 2.0f) + -1.0f;
    float _989 = (_962.y * 2.0f) + -1.0f;
    float _990 = (_962.z * 2.0f) + -1.0f;
    float _992 = rsqrt(dot(float3(_988, _989, _990), float3(_988, _989, _990)));
    _997 = false;
    _998 = _980.x;
    _999 = _980.y;
    _1000 = _980.z;
    _1001 = _980.w;
    _1002 = (_992 * _988);
    _1003 = (_992 * _989);
    _1004 = (_992 * _990);
  } else {
    _997 = true;
    _998 = 0.0f;
    _999 = 0.0f;
    _1000 = 0.0f;
    _1001 = 0.0f;
    _1002 = _962.x;
    _1003 = _962.y;
    _1004 = _962.z;
  }
  float _1005 = select(_997, 0.0f, _1002);
  float _1006 = select(_997, 0.0f, _1003);
  float _1007 = select(_997, 0.0f, _1004);
  float _1008 = saturate(_1001);
  float _1009 = saturate(_962.w);
  bool _1010 = (_1009 == 0.0f);
  if (_1010) {
    _1024 = 0.0f;
    _1025 = 1.0f;
    _1026 = min((_856 * select((((_338 == 54)) || ((_397 == 66))), 8.0f, 32.0f)), (exp2((saturate(_1008) * 20.0f) + -8.0f) + -0.00390625f));
  } else {
    _1024 = _1008;
    _1025 = _1009;
    _1026 = 0.0f;
  }
  float _1027 = 1.0f - _1024;
  float _1028 = _1027 * _998;
  float _1029 = _1027 * _999;
  float _1030 = _1027 * _1000;
  int _1032 = ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))) & 3;
  float _1040 = float((uint)((uint)(((int)((uint)(_frameNumber.x) + ((uint)((((_1032 << 1) | _1032) << 1) | (((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))) & 1))))) & 3))) * 0.0416666679084301f;
  float _1041 = _1040 + -1.0f;
  float _1042 = 1.0f - _1040;
  bool _1043 = (((mad((_viewProjRelative[2].z), _912, mad((_viewProjRelative[2].y), _911, (_910 * (_viewProjRelative[2].x)))) + (_viewProjRelative[2].w)) / _948) > 0.0f);
  bool __defer_1023_1309 = false;
  [branch]
  if ((((_997) && (_1043)) || (!(_997) && ((_1043) && ((((((_949 > _1041)) && ((_949 < _1042)))) && ((((_950 > _1041)) && ((_950 < _1042)))))))))) {
    float _1056 = _950 * -0.5f;
    float _1058 = _1056 + 0.5f;
    float _1059 = _104 * 0.5f;
    float _1060 = 1.0f - _1059;
    float _1062 = min(max(((_949 * 0.5f) + 0.5f), _1059), _1060);
    float _1063 = _1062 * _bufferSizeAndInvSize.x;
    float _1064 = _1058 * _bufferSizeAndInvSize.y;
    uint _1065 = uint(_1063);
    uint _1066 = uint(_1064);
    float _1067 = __3__36__0__0__g_depth.Load(int3((int)(_1065), (int)(_1066), 0));
    uint2 _1069 = __3__36__0__0__g_stencil.Load(int3((int)(_1065), (int)(_1066), 0));
    int _1071 = _1069.x & 127;
    float _1073 = _nearFarProj.x / max(1.0000000116860974e-07f, _1067.x);
    float _1075 = abs(_948 - _1073);
    bool __defer_1054_1090 = false;
    if ((((_1075 < ((_1073 * 10.0f) + 0.10000000149011612f))) && (((_997) || ((_1075 < ((_1073 * 0.10000000149011612f) + 0.10000000149011612f)))))) || (((!(((_1075 < ((_1073 * 10.0f) + 0.10000000149011612f))) && (((_997) || ((_1075 < ((_1073 * 0.10000000149011612f) + 0.10000000149011612f))))))) && (!(!(_905.x >= 99999.0f)))) && (((_1067.x < 1.0000000116860974e-07f)) || ((_1067.x == 1.0f))))) {
      __defer_1054_1090 = true;
    } else {
      __defer_1023_1309 = true;
    }
    if (__defer_1054_1090) {
      if ((((_905.x < 99999.0f) && ((uint)(_1069.x & 24) > (uint)23)) || (!(_905.x < 99999.0f) && !(_1071 == 0)))) {
        __defer_1023_1309 = true;
      } else {
        if ((((_905.x < 99999.0f) && (!((uint)(_1069.x & 24) > (uint)23))) && (!(_1071 == 0)))) {
          float _1127 = mad((_viewProjRelativePrev[3].z), _912, mad((_viewProjRelativePrev[3].y), _911, ((_viewProjRelativePrev[3].x) * _910))) + (_viewProjRelativePrev[3].w);
          float4 _1138 = __3__36__0__0__g_sceneDiffuseHalfPrev.SampleLevel(__3__40__0__0__g_sampler, float2(min(max(((((mad((_viewProjRelativePrev[0].z), _912, mad((_viewProjRelativePrev[0].y), _911, ((_viewProjRelativePrev[0].x) * _910))) + (_viewProjRelativePrev[0].w)) / _1127) * 0.5f) + 0.5f), _1059), _1060), (0.5f - (((mad((_viewProjRelativePrev[1].z), _912, mad((_viewProjRelativePrev[1].y), _911, ((_viewProjRelativePrev[1].x) * _910))) + (_viewProjRelativePrev[1].w)) / _1127) * 0.5f))), 0.0f);
          _1150 = _1138.x;
          _1151 = _1138.y;
          _1152 = _1138.z;
          _1153 = 1.0f;
        } else {
          float4 _1145 = __3__36__0__0__g_sceneColor.SampleLevel(__3__40__0__0__g_sampler, float2(_1062, _1058), 0.0f);
          _1150 = _1145.x;
          _1151 = _1145.y;
          _1152 = _1145.z;
          _1153 = 0.0f;
        }
        if (_189) {
          _1159 = saturate(1.0f - (_119 * 0.019999999552965164f));
        } else {
          _1159 = 1.0f;
        }
        float _1175 = dot(float3(_1150, _1151, _1152), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
        float _1176 = min((((_1159 * _856) * (0.1875f - (saturate(_905.x * 0.019999999552965164f) * 0.13750000298023224f))) * saturate(1.0f - (saturate((_344 * 5.0f) * saturate(_905.x * 16.0f)) * 0.9375f))), _1175);
        float _1180 = max(9.999999717180685e-10f, _1175);
        float _1181 = (_1176 * _1150) / _1180;
        float _1182 = (_1176 * _1151) / _1180;
        float _1183 = (_1176 * _1152) / _1180;
        bool _1184 = (_905.x > 0.0f);
        if (_997) {
          bool _1187 = (_905.x >= 99999.0f);
          uint _1192 = uint((_1062 * _101) + 0.5f);
          uint _1193 = uint((_1064 * g_screenSpaceScale.y) + 0.5f);
          uint _1195 = __3__36__0__0__g_sceneNormal.Load(int3((int)(_1192), (int)(_1193), 0));
          float _1211 = min(1.0f, ((float((uint)((uint)(_1195.x & 1023))) * 0.001956947147846222f) + -1.0f));
          float _1212 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1195.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
          float _1213 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_1195.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
          float _1215 = rsqrt(dot(float3(_1211, _1212, _1213), float3(_1211, _1212, _1213)));
          if (!_1187) {
            _1226 = (dot(float3((-0.0f - _813), (-0.0f - _814), (-0.0f - _815)), float3((_1215 * _1211), (_1215 * _1212), (_1215 * _1213))) > -0.20000000298023224f);
          } else {
            _1226 = true;
          }
          float _1227 = select(_1226, 1.0f, 0.0f);
          float _1229 = saturate(_119 * 0.009999999776482582f);
          float _1235 = ((_1229 + _1227) - (_1229 * _1227)) * _renderParams.z;
          float _1236 = _1235 * _1181;
          float _1237 = _1235 * _1182;
          float _1238 = _1235 * _1183;
          float _1239 = select(_1187, 10000.0f, _905.x);
          uint _1256 = uint((float((uint)((uint)(((int)(_frameNumber.x * 73)) & 1023))) + (float((uint)_1193) * _101)) + float((uint)_1192));
          int _1257 = (uint)(_1256) >> 1;
          int _1259 = (uint)(_1256) >> 3;
          float _1271 = float((uint)_1256);
          float _1274 = 0.33676624298095703f / sqrt(_1271 + -0.30000001192092896f);
          float _1279 = (_1274 + (_1271 * 0.7548776268959045f)) * ((float((uint)((uint)(((int)(_1257 * -1029531031)) ^ _1259))) * 2.3283064365386963e-10f) + -0.5f);
          float _1280 = (_1274 + (_1271 * 0.5698402523994446f)) * ((float((uint)((uint)(((int)((((int)(_1257 * 1103515245)) ^ 1) * 1103515245)) ^ _1259))) * 2.3283064365386963e-10f) + -0.5f);
          float _1293 = __3__36__0__0__g_depth.Load(int3(int((_1063 + -24.0f) + ((_1279 - floor(_1279)) * 48.0f)), int((_1064 + -24.0f) + ((_1280 - floor(_1280)) * 48.0f)), 0));
          int _1307 = (int)(uint)((int)((_1184) && ((!_1187))));
          _3320 = _1236;
          _3321 = _1237;
          _3322 = _1238;
          _3323 = ((((_renderParams.z * _1153) * saturate(min(_1062, (1.0f - _1062)) * 20.0f)) * saturate(min(_1058, (0.5f - _1056)) * 20.0f)) * (1.0f - (float((bool)((uint)(((_1293.x < 1.0000000116860974e-07f)) || ((_1293.x == 1.0f))))) * 0.75f)));
          _3324 = _1239;
          _3325 = _1307;
          _3326 = _1307;
          _3327 = _1236;
          _3328 = _1237;
          _3329 = _1238;
          _3330 = select(_1187, 0.0f, 1.0f);
          _3331 = _910;
          _3332 = _911;
          _3333 = _912;
          _3334 = _1239;
        } else {
          _3320 = 0.0f;
          _3321 = 0.0f;
          _3322 = 0.0f;
          _3323 = 0.0f;
          _3324 = _905.x;
          _3325 = 0;
          _3326 = ((int)(uint)((int)(_1184)));
          _3327 = _1181;
          _3328 = _1182;
          _3329 = _1183;
          _3330 = _1153;
          _3331 = 0.0f;
          _3332 = 0.0f;
          _3333 = 0.0f;
          _3334 = 0.0f;
        }
      }
    }
  } else {
    __defer_1023_1309 = true;
  }
  if (__defer_1023_1309) {
    if (((_905.x > 0.0f)) && ((_905.x < 10000.0f))) {
      _1315 = 0;
      while(true) {
        int _1355 = int(floor(((_wrappedViewPos.x + _910) * ((_clipmapOffsets[_1315]).w)) + ((_clipmapRelativeIndexOffsets[_1315]).x)));
        int _1356 = int(floor(((_wrappedViewPos.y + _911) * ((_clipmapOffsets[_1315]).w)) + ((_clipmapRelativeIndexOffsets[_1315]).y)));
        int _1357 = int(floor(((_wrappedViewPos.z + _912) * ((_clipmapOffsets[_1315]).w)) + ((_clipmapRelativeIndexOffsets[_1315]).z)));
        if (!((((((((int)_1355 >= (int)int(((_clipmapOffsets[_1315]).x) + -63.0f))) && (((int)_1355 < (int)int(((_clipmapOffsets[_1315]).x) + 63.0f))))) && (((((int)_1356 >= (int)int(((_clipmapOffsets[_1315]).y) + -31.0f))) && (((int)_1356 < (int)int(((_clipmapOffsets[_1315]).y) + 31.0f))))))) && (((((int)_1357 >= (int)int(((_clipmapOffsets[_1315]).z) + -63.0f))) && (((int)_1357 < (int)int(((_clipmapOffsets[_1315]).z) + 63.0f))))))) {
          if ((uint)(_1315 + 1) < (uint)8) {
            _1315 = (_1315 + 1);
            continue;
          } else {
            _1373 = -10000;
          }
        } else {
          _1373 = _1315;
        }
        float _1379 = float((int)((int)(1u << (_1373 & 31)))) * _voxelParams.x;
        float _1380 = -0.0f - _813;
        float _1381 = -0.0f - _814;
        float _1382 = -0.0f - _815;
        float _1387 = min(_905.x, (_1379 * 0.5f));
        float _1388 = _1387 * select(_997, _1380, _1002);
        float _1389 = _1387 * select(_997, _1381, _1003);
        float _1390 = _1387 * select(_997, _1382, _1004);
        float _1391 = _1388 + _910;
        float _1392 = _1389 + _911;
        float _1393 = _1390 + _912;
        float _1394 = _905.x * 0.019999999552965164f;
        _1400 = 0;
        while(true) {
          int _1440 = int(floor(((_wrappedViewPos.x + _1391) * ((_clipmapOffsets[_1400]).w)) + ((_clipmapRelativeIndexOffsets[_1400]).x)));
          int _1441 = int(floor(((_wrappedViewPos.y + _1392) * ((_clipmapOffsets[_1400]).w)) + ((_clipmapRelativeIndexOffsets[_1400]).y)));
          int _1442 = int(floor(((_wrappedViewPos.z + _1393) * ((_clipmapOffsets[_1400]).w)) + ((_clipmapRelativeIndexOffsets[_1400]).z)));
          if (!((((((((int)_1440 >= (int)int(((_clipmapOffsets[_1400]).x) + -63.0f))) && (((int)_1440 < (int)int(((_clipmapOffsets[_1400]).x) + 63.0f))))) && (((((int)_1441 >= (int)int(((_clipmapOffsets[_1400]).y) + -31.0f))) && (((int)_1441 < (int)int(((_clipmapOffsets[_1400]).y) + 31.0f))))))) && (((((int)_1442 >= (int)int(((_clipmapOffsets[_1400]).z) + -63.0f))) && (((int)_1442 < (int)int(((_clipmapOffsets[_1400]).z) + 63.0f))))))) {
            if ((uint)(_1400 + 1) < (uint)8) {
              _1400 = (_1400 + 1);
              continue;
            } else {
              _1458 = -10000;
            }
          } else {
            _1458 = _1400;
          }
          float _1462 = _voxelParams.x * 0.5f;
          float _1463 = _1462 * float((int)((int)(1u << (_1458 & 31))));
          float _1467 = saturate((_1463 * _1463) / (_905.x * _905.x));
          float _1468 = _899 * 6.2831854820251465f;
          if (_1467 < 0.009999999776482582f) {
            _1479 = (((_1467 * 0.125f) + 0.5f) * _1467);
          } else {
            _1479 = (1.0f - sqrt(1.0f - _1467));
          }
          float _1481 = 1.0f - (_1479 * _903);
          float _1484 = sqrt(1.0f - (_1481 * _1481));
          float _1487 = cos(_1468) * _1484;
          float _1488 = sin(_1468) * _1484;
          float _1490 = select((_815 >= 0.0f), 1.0f, -1.0f);
          float _1493 = -0.0f - (1.0f / (_1490 + _815));
          float _1495 = (_813 * _814) * _1493;
          float _1519 = (_1388 + _156) + (mad(_1481, _813, mad(_1488, _1495, (((((_813 * _813) * _1490) * _1493) + 1.0f) * _1487))) * _905.x);
          float _1521 = (_1389 + _157) + (mad(_1481, _814, mad(_1488, (((_814 * _814) * _1493) + _1490), ((_1487 * _1490) * _1495))) * _905.x);
          float _1523 = (_1390 + _158) + (mad(_1481, _815, mad(_1488, _1381, (-0.0f - ((_1490 * _813) * _1487)))) * _905.x);
          _1525 = 0;
          while(true) {
            int _1565 = int(floor(((_wrappedViewPos.x + _1519) * ((_clipmapOffsets[_1525]).w)) + ((_clipmapRelativeIndexOffsets[_1525]).x)));
            int _1566 = int(floor(((_wrappedViewPos.y + _1521) * ((_clipmapOffsets[_1525]).w)) + ((_clipmapRelativeIndexOffsets[_1525]).y)));
            int _1567 = int(floor(((_wrappedViewPos.z + _1523) * ((_clipmapOffsets[_1525]).w)) + ((_clipmapRelativeIndexOffsets[_1525]).z)));
            if ((((((((int)_1565 >= (int)int(((_clipmapOffsets[_1525]).x) + -63.0f))) && (((int)_1565 < (int)int(((_clipmapOffsets[_1525]).x) + 63.0f))))) && (((((int)_1566 >= (int)int(((_clipmapOffsets[_1525]).y) + -31.0f))) && (((int)_1566 < (int)int(((_clipmapOffsets[_1525]).y) + 31.0f))))))) && (((((int)_1567 >= (int)int(((_clipmapOffsets[_1525]).z) + -63.0f))) && (((int)_1567 < (int)int(((_clipmapOffsets[_1525]).z) + 63.0f)))))) {
              _1588 = (_1565 & 127);
              _1589 = (_1566 & 63);
              _1590 = (_1567 & 127);
              _1591 = _1525;
            } else {
              if ((uint)(_1525 + 1) < (uint)8) {
                _1525 = (_1525 + 1);
                continue;
              } else {
                _1588 = -10000;
                _1589 = -10000;
                _1590 = -10000;
                _1591 = -10000;
              }
            }
            if (!((uint)_1591 > (uint)5)) {
              uint _1601 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4(_1588, _1589, ((int)(((uint)(((int)(_1591 * 130)) | 1)) + (uint)(_1590))), 0));
              bool _1604 = ((_1601.x & 4194303) == 0);
              [branch]
              if (!_1604) {
                _1607 = _1588;
                _1608 = _1589;
                _1609 = _1590;
                _1610 = _1591;
              } else {
                _1607 = -10000;
                _1608 = -10000;
                _1609 = -10000;
                _1610 = -10000;
              }
              float _1611 = _1462 * float((int)((int)(1u << (_1591 & 31))));
              _1616 = 0;
              while(true) {
                int _1656 = int(floor((((_1519 - _1611) + _wrappedViewPos.x) * ((_clipmapOffsets[_1616]).w)) + ((_clipmapRelativeIndexOffsets[_1616]).x)));
                int _1657 = int(floor((((_1521 - _1611) + _wrappedViewPos.y) * ((_clipmapOffsets[_1616]).w)) + ((_clipmapRelativeIndexOffsets[_1616]).y)));
                int _1658 = int(floor((((_1523 - _1611) + _wrappedViewPos.z) * ((_clipmapOffsets[_1616]).w)) + ((_clipmapRelativeIndexOffsets[_1616]).z)));
                if ((((((((int)_1656 >= (int)int(((_clipmapOffsets[_1616]).x) + -63.0f))) && (((int)_1656 < (int)int(((_clipmapOffsets[_1616]).x) + 63.0f))))) && (((((int)_1657 >= (int)int(((_clipmapOffsets[_1616]).y) + -31.0f))) && (((int)_1657 < (int)int(((_clipmapOffsets[_1616]).y) + 31.0f))))))) && (((((int)_1658 >= (int)int(((_clipmapOffsets[_1616]).z) + -63.0f))) && (((int)_1658 < (int)int(((_clipmapOffsets[_1616]).z) + 63.0f)))))) {
                  _1679 = (_1656 & 127);
                  _1680 = (_1657 & 63);
                  _1681 = (_1658 & 127);
                  _1682 = _1616;
                } else {
                  if ((uint)(_1616 + 1) < (uint)8) {
                    _1616 = (_1616 + 1);
                    continue;
                  } else {
                    _1679 = -10000;
                    _1680 = -10000;
                    _1681 = -10000;
                    _1682 = -10000;
                  }
                }
                if (!((uint)_1682 > (uint)5)) {
                  if (_1604) {
                    _1687 = 0;
                    _1688 = _1610;
                    _1689 = _1609;
                    _1690 = _1608;
                    _1691 = _1607;
                    while(true) {
                      _1700 = 0;
                      _1701 = _1688;
                      _1702 = _1689;
                      _1703 = _1690;
                      _1704 = _1691;
                      while(true) {
                        if (!((((uint)(_1700 + _1680) > (uint)63)) || (((uint)(_1679 | (_1687 + _1681)) > (uint)127)))) {
                          uint _1722 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4(_1679, (_1700 + _1680), ((int)(((uint)(_1687 + _1681)) + ((uint)(((int)(_1682 * 130)) | 1)))), 0));
                          int _1724 = _1722.x & 4194303;
                          _1727 = (_1724 != 0);
                          _1728 = _1724;
                          _1729 = _1682;
                          _1730 = (_1687 + _1681);
                          _1731 = (_1700 + _1680);
                          _1732 = _1679;
                        } else {
                          _1727 = false;
                          _1728 = 0;
                          _1729 = 0;
                          _1730 = 0;
                          _1731 = 0;
                          _1732 = 0;
                        }
                        if (!_1727) {
                          if (!((((uint)(_1700 + _1680) > (uint)63)) || (((uint)((_1679 + 1) | (_1687 + _1681)) > (uint)127)))) {
                            uint _6414 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4((_1679 + 1), (_1700 + _1680), ((int)(((uint)(_1687 + _1681)) + ((uint)(((int)(_1682 * 130)) | 1)))), 0));
                            int _6416 = _6414.x & 4194303;
                            _6419 = (_6416 != 0);
                            _6420 = _6416;
                            _6421 = _1682;
                            _6422 = (_1687 + _1681);
                            _6423 = (_1700 + _1680);
                            _6424 = (_1679 + 1);
                          } else {
                            _6419 = false;
                            _6420 = 0;
                            _6421 = 0;
                            _6422 = 0;
                            _6423 = 0;
                            _6424 = 0;
                          }
                          if (!_6419) {
                            _1741 = _1704;
                            _1742 = _1703;
                            _1743 = _1702;
                            _1744 = _1701;
                            _1745 = 0;
                          } else {
                            _1741 = _6424;
                            _1742 = _6423;
                            _1743 = _6422;
                            _1744 = _6421;
                            _1745 = _6420;
                          }
                        } else {
                          _1741 = _1732;
                          _1742 = _1731;
                          _1743 = _1730;
                          _1744 = _1729;
                          _1745 = _1728;
                        }
                        if ((((int)(_1700 + 1) < (int)2)) && ((_1745 == 0))) {
                          _1700 = (_1700 + 1);
                          _1701 = _1744;
                          _1702 = _1743;
                          _1703 = _1742;
                          _1704 = _1741;
                          continue;
                        }
                        if ((((int)(_1687 + 1) < (int)2)) && ((_1745 == 0))) {
                          _1687 = (_1687 + 1);
                          _1688 = _1744;
                          _1689 = _1743;
                          _1690 = _1742;
                          _1691 = _1741;
                          __loop_jump_target = 1686;
                          break;
                        }
                        _1694 = _1744;
                        _1695 = _1743;
                        _1696 = _1742;
                        _1697 = _1741;
                        break;
                      }
                      if (__loop_jump_target == 1686) {
                        __loop_jump_target = -1;
                        continue;
                      }
                      if (__loop_jump_target != -1) {
                        break;
                      }
                      break;
                    }
                  } else {
                    _1694 = _1610;
                    _1695 = _1609;
                    _1696 = _1608;
                    _1697 = _1607;
                  }
                  if ((uint)_1694 < (uint)6) {
                    uint _1751 = _1694 * 130;
                    uint _1755 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4(_1697, _1696, ((int)(((uint)((int)(_1751) | 1)) + (uint)(_1695))), 0));
                    int _1757 = _1755.x & 4194303;
                    [branch]
                    if (!(_1757 == 0)) {
                      float _1763 = float((int)((int)(1u << (_1694 & 31)))) * _voxelParams.x;
                      _1801 = 0.0f;
                      _1802 = 0.0f;
                      _1803 = 0.0f;
                      _1804 = _1005;
                      _1805 = _1006;
                      _1806 = _1007;
                      _1807 = 0.0f;
                      _1808 = 0;
                      while(true) {
                        int _1813 = __3__37__0__0__g_surfelDataBuffer[((_1757 + -1) + _1808)]._baseColor;
                        int _1815 = __3__37__0__0__g_surfelDataBuffer[((_1757 + -1) + _1808)]._normal;
                        int16_t _1818 = __3__37__0__0__g_surfelDataBuffer[((_1757 + -1) + _1808)]._radius;
                        if (!(_1813 == 0)) {
                          half _1821 = __3__37__0__0__g_surfelDataBuffer[((_1757 + -1) + _1808)]._radiance.z;
                          half _1822 = __3__37__0__0__g_surfelDataBuffer[((_1757 + -1) + _1808)]._radiance.y;
                          half _1823 = __3__37__0__0__g_surfelDataBuffer[((_1757 + -1) + _1808)]._radiance.x;
                          float _1829 = float((uint)((uint)(_1813 & 255)));
                          float _1830 = float((uint)((uint)(((uint)((uint)(_1813)) >> 8) & 255)));
                          float _1831 = float((uint)((uint)(((uint)((uint)(_1813)) >> 16) & 255)));
                          float _1856 = select(((_1829 * 0.003921568859368563f) < 0.040449999272823334f), (_1829 * 0.0003035269910469651f), exp2(log2((_1829 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                          float _1857 = select(((_1830 * 0.003921568859368563f) < 0.040449999272823334f), (_1830 * 0.0003035269910469651f), exp2(log2((_1830 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                          float _1858 = select(((_1831 * 0.003921568859368563f) < 0.040449999272823334f), (_1831 * 0.0003035269910469651f), exp2(log2((_1831 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                          float _1870 = (float((uint)((uint)(_1815 & 255))) * 0.007874015718698502f) + -1.0f;
                          float _1871 = (float((uint)((uint)(((uint)((uint)(_1815)) >> 8) & 255))) * 0.007874015718698502f) + -1.0f;
                          float _1872 = (float((uint)((uint)(((uint)((uint)(_1815)) >> 16) & 255))) * 0.007874015718698502f) + -1.0f;
                          float _1874 = rsqrt(dot(float3(_1870, _1871, _1872), float3(_1870, _1871, _1872)));
                          bool _1879 = ((_1815 & 16777215) == 0);
                          float _1883 = float(_1823);
                          float _1884 = float(_1822);
                          float _1885 = float(_1821);
                          float _1889 = (_1763 * 0.0019607844296842813f) * float((uint16_t)((uint)((int)(_1818) & 255)));
                          float _1905 = (((float((uint)((uint)((uint)((uint)(_1813)) >> 24))) * 0.003937007859349251f) + -0.5f) * _1763) + ((((((_clipmapOffsets[_1694]).x) + -63.5f) + float((int)(((int)(((uint)(_1697) + 64u) - (uint)(int((_clipmapOffsets[_1694]).x)))) & 127))) * _1763) - _viewPos.x);
                          float _1906 = (((float((uint)((uint)((uint)((uint)(_1815)) >> 24))) * 0.003937007859349251f) + -0.5f) * _1763) + ((((((_clipmapOffsets[_1694]).y) + -31.5f) + float((int)(((int)(((uint)(_1696) + 32u) - (uint)(int((_clipmapOffsets[_1694]).y)))) & 63))) * _1763) - _viewPos.y);
                          float _1907 = (((float((uint16_t)((uint)((uint16_t)((uint)(_1818)) >> 8))) * 0.003937007859349251f) + -0.5f) * _1763) + ((((((_clipmapOffsets[_1694]).z) + -63.5f) + float((int)(((int)(((uint)(_1695) + 64u) - (uint)(int((_clipmapOffsets[_1694]).z)))) & 127))) * _1763) - _viewPos.z);
                          bool _1925 = (_962.w == 0.0f);
                          float _1926 = select(_1925, _1380, _1804);
                          float _1927 = select(_1925, _1381, _1805);
                          float _1928 = select(_1925, _1382, _1806);
                          float _1931 = ((-0.0f - _156) - _907) + _1905;
                          float _1934 = ((-0.0f - _157) - _908) + _1906;
                          float _1937 = ((-0.0f - _158) - _909) + _1907;
                          float _1938 = dot(float3(_1931, _1934, _1937), float3(_1926, _1927, _1928));
                          float _1942 = _1931 - (_1938 * _1926);
                          float _1943 = _1934 - (_1938 * _1927);
                          float _1944 = _1937 - (_1938 * _1928);
                          float _1970 = 1.0f / float((uint)(1u << (_1694 & 31)));
                          float _1974 = frac(((_invClipmapExtent.z * _1907) + _clipmapUVRelativeOffset.z) * _1970);
                          float _1985 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3((((_invClipmapExtent.x * _1905) + _clipmapUVRelativeOffset.x) * _1970), (((_invClipmapExtent.y * _1906) + _clipmapUVRelativeOffset.y) * _1970), (((float((uint)_1751) + 1.0f) + ((select((_1974 < 0.0f), 1.0f, 0.0f) + _1974) * 128.0f)) * 0.000961538462433964f)), 0.0f);
                          float _1999 = select(((int)_1694 > (int)5), 1.0f, ((saturate((saturate(dot(float3(_1380, _1381, _1382), float3(select(_1879, _1380, (_1874 * _1870)), select(_1879, _1381, (_1874 * _1871)), select(_1879, _1382, (_1874 * _1872))))) + -0.03125f) * 1.0322580337524414f) * float((bool)(uint)(dot(float3(_1942, _1943, _1944), float3(_1942, _1943, _1944)) < ((_1889 * _1889) * 16.0f)))) * float((bool)(uint)(_1985.x > ((_1763 * 0.25f) * (saturate((dot(float3(_1883, _1884, _1885), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 9.999999747378752e-05f) / _exposure3.w) + 1.0f))))));
                          bool _2003 = ((!(_1001 > 0.0f))) || (((_1813 & 16777215) == 16777215));
                          float _2013 = ((select(_2003, (((_1857 * 0.3395099937915802f) + (_1856 * 0.6131200194358826f)) + (_1858 * 0.047370001673698425f)), _1028) * _1883) * _1999) + _1801;
                          float _2014 = ((select(_2003, (((_1857 * 0.9163600206375122f) + (_1856 * 0.07020000368356705f)) + (_1858 * 0.013450000435113907f)), _1029) * _1884) * _1999) + _1802;
                          float _2015 = ((select(_2003, (((_1857 * 0.10958000272512436f) + (_1856 * 0.02061999961733818f)) + (_1858 * 0.8697999715805054f)), _1030) * _1885) * _1999) + _1803;
                          float _2016 = _1999 + _1807;
                          if ((uint)(_1808 + 1) < (uint)4) {
                            _1801 = _2013;
                            _1802 = _2014;
                            _1803 = _2015;
                            _1804 = _1926;
                            _1805 = _1927;
                            _1806 = _1928;
                            _1807 = _2016;
                            _1808 = (_1808 + 1);
                            continue;
                          } else {
                            _2020 = _2013;
                            _2021 = _2014;
                            _2022 = _2015;
                            _2023 = _2016;
                          }
                        } else {
                          _2020 = _1801;
                          _2021 = _1802;
                          _2022 = _1803;
                          _2023 = _1807;
                        }
                        if (_2023 > 0.0f) {
                          float _2026 = 1.0f / _2023;
                          _2040 = (-0.0f - min(0.0f, (-0.0f - (_2020 * _2026))));
                          _2041 = (-0.0f - min(0.0f, (-0.0f - (_2021 * _2026))));
                          _2042 = (-0.0f - min(0.0f, (-0.0f - (_2022 * _2026))));
                        } else {
                          _2040 = _2020;
                          _2041 = _2021;
                          _2042 = _2022;
                        }
                        break;
                      }
                    } else {
                      _2040 = 0.0f;
                      _2041 = 0.0f;
                      _2042 = 0.0f;
                    }
                  } else {
                    _2040 = 0.0f;
                    _2041 = 0.0f;
                    _2042 = 0.0f;
                  }
                } else {
                  _2040 = 0.0f;
                  _2041 = 0.0f;
                  _2042 = 0.0f;
                }
                break;
              }
            } else {
              _2040 = 0.0f;
              _2041 = 0.0f;
              _2042 = 0.0f;
            }
            float _2043 = dot(float3(_2040, _2041, _2042), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
            float _2044 = min(((1.0f - (saturate(_1394) * 0.75f)) * _856), _2043);
            float _2048 = max(9.999999717180685e-10f, _2043);
            float _2056 = saturate(((_905.x - (_1379 * 1.4140000343322754f)) * 2.0f) / _1379);
            float _2060 = min(0.05000000074505806f, _1394);
            float _2064 = (_2060 * _1005) + _910;
            float _2065 = (_2060 * _1006) + _911;
            float _2066 = (_2060 * _1007) + _912;
            float _2072 = _2064 + _viewPos.x;
            float _2073 = _2065 + _viewPos.y;
            float _2074 = _2066 + _viewPos.z;
            float _2079 = _2072 - (_staticShadowPosition[1].x);
            float _2080 = _2073 - (_staticShadowPosition[1].y);
            float _2081 = _2074 - (_staticShadowPosition[1].z);
            float _2101 = mad((_shadowProjRelativeTexScale[1][0].z), _2081, mad((_shadowProjRelativeTexScale[1][0].y), _2080, ((_shadowProjRelativeTexScale[1][0].x) * _2079))) + (_shadowProjRelativeTexScale[1][0].w);
            float _2105 = mad((_shadowProjRelativeTexScale[1][1].z), _2081, mad((_shadowProjRelativeTexScale[1][1].y), _2080, ((_shadowProjRelativeTexScale[1][1].x) * _2079))) + (_shadowProjRelativeTexScale[1][1].w);
            float _2112 = 2.0f / _shadowSizeAndInvSize.y;
            float _2113 = 1.0f - _2112;
            bool _2120 = ((((((!(_2101 <= _2113))) || ((!(_2101 >= _2112))))) || ((!(_2105 <= _2113))))) || ((!(_2105 >= _2112)));
            float _2129 = _2072 - (_staticShadowPosition[0].x);
            float _2130 = _2073 - (_staticShadowPosition[0].y);
            float _2131 = _2074 - (_staticShadowPosition[0].z);
            float _2151 = mad((_shadowProjRelativeTexScale[0][0].z), _2131, mad((_shadowProjRelativeTexScale[0][0].y), _2130, ((_shadowProjRelativeTexScale[0][0].x) * _2129))) + (_shadowProjRelativeTexScale[0][0].w);
            float _2155 = mad((_shadowProjRelativeTexScale[0][1].z), _2131, mad((_shadowProjRelativeTexScale[0][1].y), _2130, ((_shadowProjRelativeTexScale[0][1].x) * _2129))) + (_shadowProjRelativeTexScale[0][1].w);
            bool _2166 = ((((((!(_2151 <= _2113))) || ((!(_2151 >= _2112))))) || ((!(_2155 <= _2113))))) || ((!(_2155 >= _2112)));
            float _2167 = select(_2166, select(_2120, 0.0f, _2101), _2151);
            float _2168 = select(_2166, select(_2120, 0.0f, _2105), _2155);
            float _2169 = select(_2166, select(_2120, 0.0f, (mad((_shadowProjRelativeTexScale[1][2].z), _2081, mad((_shadowProjRelativeTexScale[1][2].y), _2080, ((_shadowProjRelativeTexScale[1][2].x) * _2079))) + (_shadowProjRelativeTexScale[1][2].w))), (mad((_shadowProjRelativeTexScale[0][2].z), _2131, mad((_shadowProjRelativeTexScale[0][2].y), _2130, ((_shadowProjRelativeTexScale[0][2].x) * _2129))) + (_shadowProjRelativeTexScale[0][2].w)));
            int _2170 = select(_2166, select(_2120, -1, 1), 0);
            [branch]
            if (!(_2170 == -1)) {
              float _2176 = (_2167 * _shadowSizeAndInvSize.x) + -0.5f;
              float _2177 = (_2168 * _shadowSizeAndInvSize.y) + -0.5f;
              int _2180 = int(floor(_2176));
              int _2181 = int(floor(_2177));
              if (!((((uint)_2180 > (uint)(int)(uint(_shadowSizeAndInvSize.x)))) || (((uint)_2181 > (uint)(int)(uint(_shadowSizeAndInvSize.y)))))) {
                float4 _2191 = __3__36__0__0__g_shadowDepthArray.Load(int4(_2180, _2181, _2170, 0));
                float4 _2193 = __3__36__0__0__g_shadowDepthArray.Load(int4(((int)((uint)(_2180) + 1u)), _2181, _2170, 0));
                float4 _2195 = __3__36__0__0__g_shadowDepthArray.Load(int4(_2180, ((int)((uint)(_2181) + 1u)), _2170, 0));
                float4 _2197 = __3__36__0__0__g_shadowDepthArray.Load(int4(((int)((uint)(_2180) + 1u)), ((int)((uint)(_2181) + 1u)), _2170, 0));
                half4 _2202 = __3__36__0__0__g_shadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_2167, _2168, float((uint)(uint)(_2170))), 0.0f);
                _2208 = _2191.x;
                _2209 = _2193.x;
                _2210 = _2195.x;
                _2211 = _2197.x;
                _2212 = _2202.x;
                _2213 = _2202.y;
                _2214 = _2202.z;
                _2215 = _2202.w;
              } else {
                _2208 = 0.0f;
                _2209 = 0.0f;
                _2210 = 0.0f;
                _2211 = 0.0f;
                _2212 = 1.0h;
                _2213 = 1.0h;
                _2214 = 1.0h;
                _2215 = 1.0h;
              }
              float _2241 = (float4(_invShadowViewProj[_2170][0][0], _invShadowViewProj[_2170][1][0], _invShadowViewProj[_2170][2][0], _invShadowViewProj[_2170][3][0]).x) * _2167;
              float _2245 = (float4(_invShadowViewProj[_2170][0][0], _invShadowViewProj[_2170][1][0], _invShadowViewProj[_2170][2][0], _invShadowViewProj[_2170][3][0]).y) * _2167;
              float _2249 = (float4(_invShadowViewProj[_2170][0][0], _invShadowViewProj[_2170][1][0], _invShadowViewProj[_2170][2][0], _invShadowViewProj[_2170][3][0]).z) * _2167;
              float _2253 = (float4(_invShadowViewProj[_2170][0][0], _invShadowViewProj[_2170][1][0], _invShadowViewProj[_2170][2][0], _invShadowViewProj[_2170][3][0]).w) * _2167;
              float _2256 = mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).w), _2208, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).w), _2168, _2253)) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).w);
              float _2257 = (mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).x), _2208, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).x), _2168, _2241)) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).x)) / _2256;
              float _2258 = (mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).y), _2208, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).y), _2168, _2245)) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).y)) / _2256;
              float _2259 = (mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).z), _2208, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).z), _2168, _2249)) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).z)) / _2256;
              float _2262 = _2167 + (_shadowSizeAndInvSize.z * 4.0f);
              float _2278 = mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).w), _2209, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).w), _2168, ((float4(_invShadowViewProj[_2170][0][0], _invShadowViewProj[_2170][1][0], _invShadowViewProj[_2170][2][0], _invShadowViewProj[_2170][3][0]).w) * _2262))) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).w);
              float _2284 = _2168 - (_shadowSizeAndInvSize.w * 2.0f);
              float _2296 = mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).w), _2210, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).w), _2284, _2253)) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).w);
              float _2300 = ((mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).x), _2210, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).x), _2284, _2241)) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).x)) / _2296) - _2257;
              float _2301 = ((mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).y), _2210, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).y), _2284, _2245)) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).y)) / _2296) - _2258;
              float _2302 = ((mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).z), _2210, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).z), _2284, _2249)) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).z)) / _2296) - _2259;
              float _2303 = ((mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).x), _2209, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).x), _2168, ((float4(_invShadowViewProj[_2170][0][0], _invShadowViewProj[_2170][1][0], _invShadowViewProj[_2170][2][0], _invShadowViewProj[_2170][3][0]).x) * _2262))) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).x)) / _2278) - _2257;
              float _2304 = ((mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).y), _2209, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).y), _2168, ((float4(_invShadowViewProj[_2170][0][0], _invShadowViewProj[_2170][1][0], _invShadowViewProj[_2170][2][0], _invShadowViewProj[_2170][3][0]).y) * _2262))) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).y)) / _2278) - _2258;
              float _2305 = ((mad((float4(_invShadowViewProj[_2170][0][2], _invShadowViewProj[_2170][1][2], _invShadowViewProj[_2170][2][2], _invShadowViewProj[_2170][3][2]).z), _2209, mad((float4(_invShadowViewProj[_2170][0][1], _invShadowViewProj[_2170][1][1], _invShadowViewProj[_2170][2][1], _invShadowViewProj[_2170][3][1]).z), _2168, ((float4(_invShadowViewProj[_2170][0][0], _invShadowViewProj[_2170][1][0], _invShadowViewProj[_2170][2][0], _invShadowViewProj[_2170][3][0]).z) * _2262))) + (float4(_invShadowViewProj[_2170][0][3], _invShadowViewProj[_2170][1][3], _invShadowViewProj[_2170][2][3], _invShadowViewProj[_2170][3][3]).z)) / _2278) - _2259;
              float _2308 = (_2302 * _2304) - (_2301 * _2305);
              float _2311 = (_2300 * _2305) - (_2302 * _2303);
              float _2314 = (_2301 * _2303) - (_2300 * _2304);
              float _2316 = rsqrt(dot(float3(_2308, _2311, _2314), float3(_2308, _2311, _2314)));
              float _2317 = _2308 * _2316;
              float _2318 = _2311 * _2316;
              float _2319 = _2314 * _2316;
              float _2320 = frac(_2176);
              float _2325 = (saturate(dot(float3(_813, _814, _815), float3(_2317, _2318, _2319))) * 0.0020000000949949026f) + _2169;
              float _2338 = saturate(exp2((_2208 - _2325) * 1442695.0f));
              float _2340 = saturate(exp2((_2210 - _2325) * 1442695.0f));
              float _2346 = ((saturate(exp2((_2209 - _2325) * 1442695.0f)) - _2338) * _2320) + _2338;
              _2353 = _2317;
              _2354 = _2318;
              _2355 = _2319;
              _2356 = saturate((((_2340 - _2346) + ((saturate(exp2((_2211 - _2325) * 1442695.0f)) - _2340) * _2320)) * frac(_2177)) + _2346);
              _2357 = _2208;
              _2358 = _2209;
              _2359 = _2210;
              _2360 = _2211;
              _2361 = _2212;
              _2362 = _2213;
              _2363 = _2214;
              _2364 = _2215;
            } else {
              _2353 = 0.0f;
              _2354 = 0.0f;
              _2355 = 0.0f;
              _2356 = 0.0f;
              _2357 = 0.0f;
              _2358 = 0.0f;
              _2359 = 0.0f;
              _2360 = 0.0f;
              _2361 = 0.0h;
              _2362 = 0.0h;
              _2363 = 0.0h;
              _2364 = 0.0h;
            }
            float _2384 = mad((_dynamicShadowProjRelativeTexScale[1][0].z), _2066, mad((_dynamicShadowProjRelativeTexScale[1][0].y), _2065, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _2064))) + (_dynamicShadowProjRelativeTexScale[1][0].w);
            float _2388 = mad((_dynamicShadowProjRelativeTexScale[1][1].z), _2066, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _2065, ((_dynamicShadowProjRelativeTexScale[1][1].x) * _2064))) + (_dynamicShadowProjRelativeTexScale[1][1].w);
            float _2392 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _2066, mad((_dynamicShadowProjRelativeTexScale[1][2].y), _2065, ((_dynamicShadowProjRelativeTexScale[1][2].x) * _2064))) + (_dynamicShadowProjRelativeTexScale[1][2].w);
            float _2395 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
            float _2396 = 1.0f - _2395;
            if (!(((((!(_2384 <= _2396))) || ((!(_2384 >= _2395))))) || ((!(_2388 <= _2396))))) {
              bool _2407 = ((_2392 >= -1.0f)) && ((((_2392 <= 1.0f)) && ((_2388 >= _2395))));
              _2415 = select(_2407, 9.999999747378752e-06f, -9.999999747378752e-05f);
              _2416 = select(_2407, _2384, _2167);
              _2417 = select(_2407, _2388, _2168);
              _2418 = select(_2407, _2392, _2169);
              _2419 = select(_2407, 1, _2170);
              _2420 = ((int)(uint)((int)(_2407)));
            } else {
              _2415 = -9.999999747378752e-05f;
              _2416 = _2167;
              _2417 = _2168;
              _2418 = _2169;
              _2419 = _2170;
              _2420 = 0;
            }
            float _2440 = mad((_dynamicShadowProjRelativeTexScale[0][0].z), _2066, mad((_dynamicShadowProjRelativeTexScale[0][0].y), _2065, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _2064))) + (_dynamicShadowProjRelativeTexScale[0][0].w);
            float _2444 = mad((_dynamicShadowProjRelativeTexScale[0][1].z), _2066, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _2065, ((_dynamicShadowProjRelativeTexScale[0][1].x) * _2064))) + (_dynamicShadowProjRelativeTexScale[0][1].w);
            float _2448 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _2066, mad((_dynamicShadowProjRelativeTexScale[0][2].y), _2065, ((_dynamicShadowProjRelativeTexScale[0][2].x) * _2064))) + (_dynamicShadowProjRelativeTexScale[0][2].w);
            if (!(((((!(_2440 <= _2396))) || ((!(_2440 >= _2395))))) || ((!(_2444 <= _2396))))) {
              bool _2459 = ((_2448 >= -1.0f)) && ((((_2444 >= _2395)) && ((_2448 <= 1.0f))));
              _2467 = select(_2459, 9.999999747378752e-06f, _2415);
              _2468 = select(_2459, _2440, _2416);
              _2469 = select(_2459, _2444, _2417);
              _2470 = select(_2459, _2448, _2418);
              _2471 = select(_2459, 0, _2419);
              _2472 = select(_2459, 1, _2420);
            } else {
              _2467 = _2415;
              _2468 = _2416;
              _2469 = _2417;
              _2470 = _2418;
              _2471 = _2419;
              _2472 = _2420;
            }
            [branch]
            if (!(_2472 == 0)) {
              int _2482 = int(floor((_2468 * _dynmaicShadowSizeAndInvSize.x) + -0.5f));
              int _2483 = int(floor((_2469 * _dynmaicShadowSizeAndInvSize.y) + -0.5f));
              if (!((((uint)_2482 > (uint)(int)(uint(_dynmaicShadowSizeAndInvSize.x)))) || (((uint)_2483 > (uint)(int)(uint(_dynmaicShadowSizeAndInvSize.y)))))) {
                float4 _2493 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2482, _2483, _2471, 0));
                float4 _2495 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2482) + 1u)), _2483, _2471, 0));
                float4 _2497 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2482, ((int)((uint)(_2483) + 1u)), _2471, 0));
                float4 _2499 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2482) + 1u)), ((int)((uint)(_2483) + 1u)), _2471, 0));
                _2502 = _2493.x;
                _2503 = _2495.x;
                _2504 = _2497.x;
                _2505 = _2499.x;
              } else {
                _2502 = _2357;
                _2503 = _2358;
                _2504 = _2359;
                _2505 = _2360;
              }
              float _2531 = (float4(_invDynamicShadowViewProj[_2471][0][0], _invDynamicShadowViewProj[_2471][1][0], _invDynamicShadowViewProj[_2471][2][0], _invDynamicShadowViewProj[_2471][3][0]).x) * _2468;
              float _2535 = (float4(_invDynamicShadowViewProj[_2471][0][0], _invDynamicShadowViewProj[_2471][1][0], _invDynamicShadowViewProj[_2471][2][0], _invDynamicShadowViewProj[_2471][3][0]).y) * _2468;
              float _2539 = (float4(_invDynamicShadowViewProj[_2471][0][0], _invDynamicShadowViewProj[_2471][1][0], _invDynamicShadowViewProj[_2471][2][0], _invDynamicShadowViewProj[_2471][3][0]).z) * _2468;
              float _2543 = (float4(_invDynamicShadowViewProj[_2471][0][0], _invDynamicShadowViewProj[_2471][1][0], _invDynamicShadowViewProj[_2471][2][0], _invDynamicShadowViewProj[_2471][3][0]).w) * _2468;
              float _2546 = mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).w), _2502, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).w), _2469, _2543)) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).w);
              float _2547 = (mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).x), _2502, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).x), _2469, _2531)) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).x)) / _2546;
              float _2548 = (mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).y), _2502, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).y), _2469, _2535)) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).y)) / _2546;
              float _2549 = (mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).z), _2502, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).z), _2469, _2539)) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).z)) / _2546;
              float _2552 = _2468 + (_dynmaicShadowSizeAndInvSize.z * 8.0f);
              float _2568 = mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).w), _2503, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).w), _2469, ((float4(_invDynamicShadowViewProj[_2471][0][0], _invDynamicShadowViewProj[_2471][1][0], _invDynamicShadowViewProj[_2471][2][0], _invDynamicShadowViewProj[_2471][3][0]).w) * _2552))) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).w);
              float _2574 = _2469 - (_dynmaicShadowSizeAndInvSize.w * 4.0f);
              float _2586 = mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).w), _2504, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).w), _2574, _2543)) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).w);
              float _2590 = ((mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).x), _2504, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).x), _2574, _2531)) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).x)) / _2586) - _2547;
              float _2591 = ((mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).y), _2504, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).y), _2574, _2535)) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).y)) / _2586) - _2548;
              float _2592 = ((mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).z), _2504, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).z), _2574, _2539)) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).z)) / _2586) - _2549;
              float _2593 = ((mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).x), _2503, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).x), _2469, ((float4(_invDynamicShadowViewProj[_2471][0][0], _invDynamicShadowViewProj[_2471][1][0], _invDynamicShadowViewProj[_2471][2][0], _invDynamicShadowViewProj[_2471][3][0]).x) * _2552))) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).x)) / _2568) - _2547;
              float _2594 = ((mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).y), _2503, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).y), _2469, ((float4(_invDynamicShadowViewProj[_2471][0][0], _invDynamicShadowViewProj[_2471][1][0], _invDynamicShadowViewProj[_2471][2][0], _invDynamicShadowViewProj[_2471][3][0]).y) * _2552))) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).y)) / _2568) - _2548;
              float _2595 = ((mad((float4(_invDynamicShadowViewProj[_2471][0][2], _invDynamicShadowViewProj[_2471][1][2], _invDynamicShadowViewProj[_2471][2][2], _invDynamicShadowViewProj[_2471][3][2]).z), _2503, mad((float4(_invDynamicShadowViewProj[_2471][0][1], _invDynamicShadowViewProj[_2471][1][1], _invDynamicShadowViewProj[_2471][2][1], _invDynamicShadowViewProj[_2471][3][1]).z), _2469, ((float4(_invDynamicShadowViewProj[_2471][0][0], _invDynamicShadowViewProj[_2471][1][0], _invDynamicShadowViewProj[_2471][2][0], _invDynamicShadowViewProj[_2471][3][0]).z) * _2552))) + (float4(_invDynamicShadowViewProj[_2471][0][3], _invDynamicShadowViewProj[_2471][1][3], _invDynamicShadowViewProj[_2471][2][3], _invDynamicShadowViewProj[_2471][3][3]).z)) / _2568) - _2549;
              float _2598 = (_2592 * _2594) - (_2591 * _2595);
              float _2601 = (_2590 * _2595) - (_2592 * _2593);
              float _2604 = (_2591 * _2593) - (_2590 * _2594);
              float _2606 = rsqrt(dot(float3(_2598, _2601, _2604), float3(_2598, _2601, _2604)));
              if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
                _2624 = _sunDirection.x;
                _2625 = _sunDirection.y;
                _2626 = _sunDirection.z;
              } else {
                _2624 = _moonDirection.x;
                _2625 = _moonDirection.y;
                _2626 = _moonDirection.z;
              }
              float _2632 = (_2467 - (saturate(-0.0f - dot(float3(_2624, _2625, _2626), float3(_813, _814, _815))) * 9.999999747378752e-05f)) + _2470;
              _2645 = (_2598 * _2606);
              _2646 = (_2601 * _2606);
              _2647 = (_2604 * _2606);
              _2648 = min(float((bool)(uint)(_2502 > _2632)), min(min(float((bool)(uint)(_2503 > _2632)), float((bool)(uint)(_2504 > _2632))), float((bool)(uint)(_2505 > _2632))));
            } else {
              _2645 = _2353;
              _2646 = _2354;
              _2647 = _2355;
              _2648 = _2356;
            }
            float _2656 = (_viewPos.x - _shadowRelativePosition.x) + _2064;
            float _2657 = (_viewPos.y - _shadowRelativePosition.y) + _2065;
            float _2658 = (_viewPos.z - _shadowRelativePosition.z) + _2066;
            float _2678 = mad((_terrainShadowProjRelativeTexScale[0].z), _2658, mad((_terrainShadowProjRelativeTexScale[0].y), _2657, (_2656 * (_terrainShadowProjRelativeTexScale[0].x)))) + (_terrainShadowProjRelativeTexScale[0].w);
            float _2682 = mad((_terrainShadowProjRelativeTexScale[1].z), _2658, mad((_terrainShadowProjRelativeTexScale[1].y), _2657, (_2656 * (_terrainShadowProjRelativeTexScale[1].x)))) + (_terrainShadowProjRelativeTexScale[1].w);
            float _2686 = mad((_terrainShadowProjRelativeTexScale[2].z), _2658, mad((_terrainShadowProjRelativeTexScale[2].y), _2657, (_2656 * (_terrainShadowProjRelativeTexScale[2].x)))) + (_terrainShadowProjRelativeTexScale[2].w);
            if (saturate(_2678) == _2678) {
              if (((_2686 >= 9.999999747378752e-05f)) && ((((_2686 <= 1.0f)) && ((saturate(_2682) == _2682))))) {
                float _2701 = frac((_2678 * 1024.0f) + -0.5f);
                float4 _2705 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_2678, _2682));
                float _2710 = _2686 + -0.004999999888241291f;
                float _2715 = select((_2705.w > _2710), 1.0f, 0.0f);
                float _2717 = select((_2705.x > _2710), 1.0f, 0.0f);
                float _2724 = ((select((_2705.z > _2710), 1.0f, 0.0f) - _2715) * _2701) + _2715;
                _2730 = saturate((((((select((_2705.y > _2710), 1.0f, 0.0f) - _2717) * _2701) + _2717) - _2724) * frac((_2682 * 1024.0f) + -0.5f)) + _2724);
              } else {
                _2730 = 1.0f;
              }
            } else {
              _2730 = 1.0f;
            }
            float _2731 = min(_2648, _2730);
            half _2732 = saturate(_2361);
            half _2733 = saturate(_2362);
            half _2734 = saturate(_2363);
            bool _2753 = (_sunDirection.y > 0.0f);
            if ((_2753) || ((!(_2753)) && (_sunDirection.y > _moonDirection.y))) {
              _2765 = _sunDirection.x;
              _2766 = _sunDirection.y;
              _2767 = _sunDirection.z;
            } else {
              _2765 = _moonDirection.x;
              _2766 = _moonDirection.y;
              _2767 = _moonDirection.z;
            }
            if ((_2753) || ((!(_2753)) && (_sunDirection.y > _moonDirection.y))) {
              _2787 = _precomputedAmbient7.y;
            } else {
              _2787 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
            }
            float _2790 = _2073 + _earthRadius;
            float _2794 = (_2066 * _2066) + (_2064 * _2064);
            float _2796 = sqrt((_2790 * _2790) + _2794);
            float _2801 = dot(float3((_2064 / _2796), (_2790 / _2796), (_2066 / _2796)), float3(_2765, _2766, _2767));
            float _2806 = min(max(((_2796 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
            float _2814 = max(_2806, 0.0f);
            float _2821 = (-0.0f - sqrt((_2814 + (_earthRadius * 2.0f)) * _2814)) / (_2814 + _earthRadius);
            if (_2801 > _2821) {
              _2844 = ((exp2(log2(saturate((_2801 - _2821) / (1.0f - _2821))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
            } else {
              _2844 = ((exp2(log2(saturate((_2821 - _2801) / (_2821 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
            }
            float2 _2849 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_2806 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _2844), 0.0f);
            float _2871 = ((_2849.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
            float _2889 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _2849.x) + _2871) * -1.4426950216293335f);
            float _2890 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _2849.x) + _2871) * -1.4426950216293335f);
            float _2891 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((uint)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _2849.x) + _2871) * -1.4426950216293335f);
            float _2907 = sqrt(_2794);
            float _2915 = (_cloudAltitude - (max(((_2907 * _2907) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
            float _2927 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_2766 > 0.0f))) - ((int)(uint)((int)(_2766 < 0.0f))))) * 0.5f))) + _2915;
            if (_2065 < _2915) {
              float _2930 = dot(float3(0.0f, 1.0f, 0.0f), float3(_2765, _2766, _2767));
              float _2936 = select((abs(_2930) < 9.99999993922529e-09f), 1e+08f, ((_2927 - dot(float3(0.0f, 1.0f, 0.0f), float3(_2064, _2065, _2066))) / _2930));
              _2942 = ((_2936 * _2765) + _2064);
              _2943 = _2927;
              _2944 = ((_2936 * _2767) + _2066);
            } else {
              _2942 = _2064;
              _2943 = _2065;
              _2944 = _2066;
            }
            float _2953 = __3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_2942 * 4.999999873689376e-05f) + 0.5f), ((_2943 - _2915) / _cloudThickness), ((_2944 * 4.999999873689376e-05f) + 0.5f)), 0.0f);
            float _2964 = saturate(abs(_2766) * 4.0f);
            float _2966 = (_2964 * _2964) * exp2(((_distanceScale * -1.4426950216293335f) * _2953.x) * (_cloudScatteringCoefficient / _distanceScale));
            float _2973 = ((1.0f - _2966) * saturate(((_2065 - _cloudThickness) - _2915) * 0.10000000149011612f)) + _2966;
            float _2974 = _2973 * (((_2890 * 0.3395099937915802f) + (_2889 * 0.6131200194358826f)) + (_2891 * 0.047370001673698425f));
            float _2975 = _2973 * (((_2890 * 0.9163600206375122f) + (_2889 * 0.07020000368356705f)) + (_2891 * 0.013450000435113907f));
            float _2976 = _2973 * (((_2890 * 0.10958000272512436f) + (_2889 * 0.02061999961733818f)) + (_2891 * 0.8697999715805054f));
            if (_1001 > 0.0f) {
              bool _2995 = (_962.w > 0.0f);
              float _2996 = select(_2995, _1005, _2645);
              float _2997 = select(_2995, _1006, _2646);
              float _2998 = select(_2995, _1007, _2647);
              half _3000 = half(_1028);
              half _3001 = half(_1029);
              half _3002 = half(_1030);
              _3008 = select(_2995, _962.w, 0.800000011920929f);
              _3009 = _2996;
              _3010 = _2997;
              _3011 = _2998;
              _3012 = _3000;
              _3013 = _3001;
              _3014 = _3002;
              _3015 = _1001;
              _3016 = float(_3000);
              _3017 = float(_3001);
              _3018 = float(_3002);
              _3019 = dot(float3(_2996, _2997, _2998), float3(_2765, _2766, _2767));
            } else {
              _3008 = 0.800000011920929f;
              _3009 = _2645;
              _3010 = _2646;
              _3011 = _2647;
              _3012 = (((_2733 * 0.3395996h) + (_2732 * 0.61328125h)) + (_2734 * 0.04736328h));
              _3013 = (((_2733 * 0.9165039h) + (_2732 * 0.07019043h)) + (_2734 * 0.013450623h));
              _3014 = (((_2733 * 0.109558105h) + (_2732 * 0.020614624h)) + (_2734 * 0.8696289h));
              _3015 = 0.10000000149011612f;
              _3016 = 1.0f;
              _3017 = 1.0f;
              _3018 = 1.0f;
              _3019 = float(saturate(_2364));
            }
            float _3027 = float(half(saturate(_3019) * 0.31830987334251404f)) * _2731;
            float _3035 = 0.699999988079071f / min(max(max(max(_3016, _3017), _3018), 0.009999999776482582f), 0.699999988079071f);
            float _3046 = (((_3035 * _3017) + -0.03999999910593033f) * _3015) + 0.03999999910593033f;
            float _3048 = _2765 - _813;
            float _3049 = _2766 - _814;
            float _3050 = _2767 - _815;
            float _3052 = rsqrt(dot(float3(_3048, _3049, _3050), float3(_3048, _3049, _3050)));
            float _3053 = _3052 * _3048;
            float _3054 = _3052 * _3049;
            float _3055 = _3052 * _3050;
            float _3060 = saturate(max(9.999999747378752e-06f, dot(float3(_1380, _1381, _1382), float3(_3009, _3010, _3011))));
            float _3062 = saturate(dot(float3(_3009, _3010, _3011), float3(_3053, _3054, _3055)));
            float _3065 = saturate(1.0f - saturate(saturate(dot(float3(_1380, _1381, _1382), float3(_3053, _3054, _3055)))));
            float _3066 = _3065 * _3065;
            float _3068 = (_3066 * _3066) * _3065;
            float _3071 = _3068 * saturate(_3046 * 50.0f);
            float _3072 = 1.0f - _3068;
            float _3080 = saturate(_3019 * _2731);
            float _3081 = _3008 * _3008;
            float _3082 = _3081 * _3081;
            float _3083 = 1.0f - _3081;
            float _3095 = (((_3062 * _3082) - _3062) * _3062) + 1.0f;
            float _3099 = (_3082 / ((_3095 * _3095) * 3.1415927410125732f)) * (0.5f / ((((_3060 * _3083) + _3081) * _3019) + (_3060 * ((_3019 * _3083) + _3081))));
            float _3114 = _renderParams2.z * _2787;
            float _3116 = (_3114 * (((_2974 * 0.6131200194358826f) + (_2975 * 0.3395099937915802f)) + (_2976 * 0.047370001673698425f))) * ((max((((_3072 * ((((_3035 * _3016) + -0.03999999910593033f) * _3015) + 0.03999999910593033f)) + _3071) * _3099), 0.0f) * _3080) + (_3027 * float(_3012)));
            float _3118 = (_3114 * (((_2974 * 0.07020000368356705f) + (_2975 * 0.9163600206375122f)) + (_2976 * 0.013450000435113907f))) * ((max((((_3072 * _3046) + _3071) * _3099), 0.0f) * _3080) + (_3027 * float(_3013)));
            float _3120 = (_3114 * (((_2974 * 0.02061999961733818f) + (_2975 * 0.10958000272512436f)) + (_2976 * 0.8697999715805054f))) * ((max((((_3072 * ((((_3035 * _3018) + -0.03999999910593033f) * _3015) + 0.03999999910593033f)) + _3071) * _3099), 0.0f) * _3080) + (_3027 * float(_3014)));
            float _3121 = dot(float3(_3116, _3118, _3120), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
            float _3122 = min(_856, _3121);
            float _3126 = max(9.999999717180685e-10f, _3121);
            float _3130 = ((_3122 * _3116) / _3126) + (_2056 * ((_2044 * _2040) / _2048));
            float _3131 = ((_3118 * _3122) / _3126) + (_2056 * ((_2044 * _2041) / _2048));
            float _3132 = ((_3120 * _3122) / _3126) + (_2056 * ((_2044 * _2042) / _2048));
            if (_1024 == 1.0f) {
              [branch]
              if (((_1030 < 0.009999999776482582f)) && ((((_1028 < 0.009999999776482582f)) && ((_1029 < 0.009999999776482582f))))) {
                float _3145 = dot(float3(_813, _814, _815), float3(_1005, _1006, _1007)) * 2.0f;
                float _3149 = _813 - (_3145 * _1005);
                float _3150 = _814 - (_3145 * _1006);
                float _3151 = _815 - (_3145 * _1007);
                float _3153 = rsqrt(dot(float3(_3149, _3150, _3151), float3(_3149, _3150, _3151)));
                _3158 = 1;
                while(true) {
                  int _3198 = int(floor(((_wrappedViewPos.x + _1391) * ((_clipmapOffsets[_3158]).w)) + ((_clipmapRelativeIndexOffsets[_3158]).x)));
                  int _3199 = int(floor(((_wrappedViewPos.y + _1392) * ((_clipmapOffsets[_3158]).w)) + ((_clipmapRelativeIndexOffsets[_3158]).y)));
                  int _3200 = int(floor(((_wrappedViewPos.z + _1393) * ((_clipmapOffsets[_3158]).w)) + ((_clipmapRelativeIndexOffsets[_3158]).z)));
                  if (!((((((((int)_3198 >= (int)int(((_clipmapOffsets[_3158]).x) + -63.0f))) && (((int)_3198 < (int)int(((_clipmapOffsets[_3158]).x) + 63.0f))))) && (((((int)_3199 >= (int)int(((_clipmapOffsets[_3158]).y) + -31.0f))) && (((int)_3199 < (int)int(((_clipmapOffsets[_3158]).y) + 31.0f))))))) && (((((int)_3200 >= (int)int(((_clipmapOffsets[_3158]).z) + -63.0f))) && (((int)_3200 < (int)int(((_clipmapOffsets[_3158]).z) + 63.0f))))))) {
                    if ((uint)(_3158 + 1) < (uint)8) {
                      _3158 = (_3158 + 1);
                      continue;
                    } else {
                      _3216 = -10000;
                    }
                  } else {
                    _3216 = _3158;
                  }
                  if (!((uint)_3216 > (uint)3)) {
                    float _3236 = 1.0f / float((uint)(1u << (_3216 & 31)));
                    float _3240 = frac(((_invClipmapExtent.z * _1393) + _clipmapUVRelativeOffset.z) * _3236);
                    float _3252 = __3__36__0__1__g_skyVisibilityVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3((((_invClipmapExtent.x * _1391) + _clipmapUVRelativeOffset.x) * _3236), (((_invClipmapExtent.y * _1392) + _clipmapUVRelativeOffset.y) * _3236), (((float((uint)(_3216 * 66)) + 1.0f) + ((select((_3240 < 0.0f), 1.0f, 0.0f) + _3240) * 64.0f)) * 0.0037878789007663727f)), 0.0f);
                    _3257 = saturate(1.0f - _3252.x);
                  } else {
                    _3257 = 1.0f;
                  }
                  float _3259 = saturate(_3257 * 4.0f);
                  float4 _3262 = __3__36__0__0__g_environmentColor.SampleLevel(__3__40__0__0__g_samplerTrilinear, float3((_3149 * _3153), (_3150 * _3153), (_3151 * _3153)), ((log2(_1025) * 2.0f) + 9.0f));
                  float _3266 = _3262.x * _3259;
                  float _3267 = _3262.y * _3259;
                  float _3268 = _3262.z * _3259;
                  float _3271 = _1025 * _1025;
                  float _3272 = abs(saturate(dot(float3(_1380, _1381, _1382), float3(_1005, _1006, _1007))));
                  float _3273 = _3272 * _3272;
                  float _3274 = _3273 * _3272;
                  float _3276 = (_3271 * _3271) * _3271;
                  float _3303 = mad(0.03999999910593033f, max(0.0f, ((1.0f / dot(float3(mad(-1.3677200078964233f, _3274, mad(3.5968499183654785f, _3273, 1.0f)), mad(9.229490280151367f, _3274, mad(-16.317399978637695f, _3273, 9.044010162353516f)), mad(-20.212299346923828f, _3274, mad(19.78860092163086f, _3273, 5.565889835357666f))), float3(1.0f, _3271, _3276))) * dot(float2(mad(3.3270699977874756f, _3272, 0.03654630109667778f), mad(-9.04755973815918f, _3272, 9.063199996948242f)), float2(1.0f, _3271)))), max(0.0f, ((1.0f / dot(float3(mad(59.418800354003906f, _3274, mad(2.923379898071289f, _3272, 1.0f)), mad(222.5919952392578f, _3274, mad(-27.03019905090332f, _3272, 20.322500228881836f)), mad(316.62701416015625f, _3274, mad(626.1300048828125f, _3272, 121.56300354003906f))), float3(1.0f, _3271, _3276))) * dot(float2(mad(-1.285140037536621f, _3272, 0.9904400110244751f), mad(-0.7559069991111755f, _3272, 1.296779990196228f)), float2(1.0f, _3271)))));
                  float _3304 = dot(float3(_3266, _3267, _3268), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
                  float _3305 = min(_856, _3304);
                  float _3309 = max(9.999999717180685e-10f, _3304);
                  _3320 = 0.0f;
                  _3321 = 0.0f;
                  _3322 = 0.0f;
                  _3323 = 0.0f;
                  _3324 = _905.x;
                  _3325 = 0;
                  _3326 = 1;
                  _3327 = ((((_3305 * _3266) / _3309) * _3303) + _3130);
                  _3328 = ((((_3305 * _3267) / _3309) * _3303) + _3131);
                  _3329 = ((((_3305 * _3268) / _3309) * _3303) + _3132);
                  _3330 = 1.0f;
                  _3331 = _1391;
                  _3332 = _1392;
                  _3333 = _1393;
                  _3334 = _905.x;
                  break;
                }
              } else {
                _3320 = 0.0f;
                _3321 = 0.0f;
                _3322 = 0.0f;
                _3323 = 0.0f;
                _3324 = _905.x;
                _3325 = 0;
                _3326 = 1;
                _3327 = _3130;
                _3328 = _3131;
                _3329 = _3132;
                _3330 = 1.0f;
                _3331 = _1391;
                _3332 = _1392;
                _3333 = _1393;
                _3334 = _905.x;
              }
            } else {
              _3320 = 0.0f;
              _3321 = 0.0f;
              _3322 = 0.0f;
              _3323 = 0.0f;
              _3324 = _905.x;
              _3325 = 0;
              _3326 = 1;
              _3327 = _3130;
              _3328 = _3131;
              _3329 = _3132;
              _3330 = 1.0f;
              _3331 = _1391;
              _3332 = _1392;
              _3333 = _1393;
              _3334 = _905.x;
            }
            break;
          }
          break;
        }
        break;
      }
    } else {
      _3320 = 0.0f;
      _3321 = 0.0f;
      _3322 = 0.0f;
      _3323 = 0.0f;
      _3324 = _905.x;
      _3325 = 0;
      _3326 = 0;
      _3327 = 0.0f;
      _3328 = 0.0f;
      _3329 = 0.0f;
      _3330 = 0.0f;
      _3331 = 0.0f;
      _3332 = 0.0f;
      _3333 = 0.0f;
      _3334 = 0.0f;
    }
  }
  if (_1010) {
    float _3339 = _1028 * _1026;
    float _3340 = _1029 * _1026;
    float _3341 = _1030 * _1026;
    float _3342 = dot(float3(_3339, _3340, _3341), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    float _3343 = min((_exposure3.w * 512.0f), _3342);
    float _3347 = max(9.999999717180685e-10f, _3342);
    _3355 = (((_3343 * _3339) / _3347) + _3327);
    _3356 = (((_3343 * _3340) / _3347) + _3328);
    _3357 = (((_3343 * _3341) / _3347) + _3329);
  } else {
    _3355 = _3327;
    _3356 = _3328;
    _3357 = _3329;
  }
  bool _3361 = (_3326 == 0);
  if ((_3361) && ((_renderParams.w > 0.0f))) {
    float4 _3366 = __3__36__0__0__g_environmentColor.SampleLevel(__3__40__0__0__g_samplerTrilinear, float3(_813, _814, _815), 0.0f);
    float _3370 = dot(float3(_3366.x, _3366.y, _3366.z), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    float _3371 = min(_856, _3370);
    float _3375 = max(9.999999717180685e-10f, _3370);
    float _3379 = ((_3371 * _3366.x) / _3375) * _renderParams.w;
    float _3380 = ((_3371 * _3366.y) / _3375) * _renderParams.w;
    float _3381 = ((_3371 * _3366.z) / _3375) * _renderParams.w;
    float _3382 = _renderParams.w * 1e+06f;
    if (_3323 < 1.0f) {
      _3398 = (lerp(_3379, _3320, _3323));
      _3399 = (lerp(_3380, _3321, _3323));
      _3400 = (lerp(_3381, _3322, _3323));
      _3401 = (lerp(_3382, _3323, _3323));
    } else {
      _3398 = _3320;
      _3399 = _3321;
      _3400 = _3322;
      _3401 = _3323;
    }
  } else {
    _3398 = _3320;
    _3399 = _3321;
    _3400 = _3322;
    _3401 = _3323;
  }
  uint _3435 = (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) + 1013904242u))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285);
  uint _3437 = ((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) + 1013904242u))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596);
  int _3439 = (uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) + 1013904242u))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5;
  uint _3450 = ((uint)((((int)(((((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))) + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) + 1013904242u))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)));
  int _3465 = (((int)(((((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))))) + 2027808484u))) ^ ((int)(((uint)((uint)(((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))))) >> 5)) + 2123724318u));
  int _3481 = (((int)(((((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))) + 387276957u))) ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))) >> 5)) + 2123724318u));
  int _3497 = (((int)(((((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))))))) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))))))) >> 5)) + 2123724318u));
  int _3510 = ((int)(((((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))))) + 1401181199u));
  int _3518 = ((int)(((((uint)(_3510 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))))) >> 5)) + 2123724318u)))) + ((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_3510 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))))) >> 5)) + 2123724318u)))) + ((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450)))) + (uint)(-239350328)));
  uint _3522 = ((uint)(_3518 ^ (((uint)(((uint)(_3510 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))))) >> 5)) + 2123724318u)))) + ((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450)))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555))))))));
  if (((int)(_3522) & 16777215) == 0) {
    int _3537 = ((int)(((((uint)((((int)((_3522 << 4) + (uint)(-1383041155))) ^ ((int)(_3522 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_3522) >> 5)) + 2123724318u)))) + (((uint)(_3510 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))))) >> 5)) + 2123724318u)))) + ((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_3522 << 4) + (uint)(-1383041155))) ^ ((int)(_3522 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_3522) >> 5)) + 2123724318u)))) + (((uint)(_3510 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))))) >> 5)) + 2123724318u)))) + ((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))))) + (uint)(-1879881855)));
    _3543 = ((int)(((uint)(_3537 ^ (((uint)(((uint)((((int)((_3522 << 4) + (uint)(-1383041155))) ^ ((int)(_3522 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_3522) >> 5)) + 2123724318u)))) + (((uint)(_3510 ^ ((int)(((uint)((uint)(((uint)((((int)((((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) + 1401181199u))) ^ (((uint)((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3481) + ((uint)(_3465) + _3450)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3481) + ((uint)(_3465) + _3450)) + (uint)(-1253254570)))) ^ (((uint)((uint)(_3481) + ((uint)(_3465) + _3450)) >> 5) + -939442524))) + (((uint)((((int)((((uint)(_3465) + _3450) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_3465) + _3450) + 387276957u))) ^ (((uint)((uint)(_3465) + _3450) >> 5) + -939442524))) + (((uint)((((int)((_3450 << 4) + (uint)(-1556008596))) ^ ((int)(_3450 + 2027808484u))) ^ (((uint)(_3450) >> 5) + -939442524))) + (((uint)(((int)(_3437) ^ (int)(_3435)) ^ (_3439 + -939442524))) + (((uint)((((int)(((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)((((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + ((uint)(_413) + uint((_bufferSizeAndInvSize.x * _556) + _555)))))))) >> 5)) + 2123724318u)))) + ((uint)(_3497) + ((uint)(_3481) + ((uint)(_3465) + _3450))))) >> 5) + -939442524))) + _3522));
  } else {
    _3543 = (int)(_3522);
  }
  float _3546 = float((uint)((uint)(((int)(_3543 * 48271)) & 16777215)));
  bool _3547 = (_cavityParams.y == 0.0f);
  if (!_3547) {
    if (!(_cavityParams.y <= 1.0f)) {
      bool _3571 = (_119 > ((_3546 * 4.76837158203125e-07f) + 32.0f));
      if (!(!(_cavityParams.y <= 2.0f))) {
        if (_3571) {
          _3595 = (_338 != 29);
        } else {
          if (!(_sunDirection.y > 0.0f)) {
            if (!(_sunDirection.y > _moonDirection.y)) {
              if ((((_297 > 0.20000000298023224f)) || ((_298 < 0.10000000149011612f))) | (_119 > ((_3546 * 2.384185791015625e-07f) + 16.0f))) {
                _3595 = (_338 != 29);
              } else {
                _3595 = false;
              }
            } else {
              _3595 = false;
            }
          } else {
            _3595 = false;
          }
        }
      } else {
        if (_3571) {
          _3595 = (_338 != 29);
        } else {
          _3595 = false;
        }
      }
    } else {
      if (!(_297 > 0.20000000298023224f)) {
        if (!(_119 > ((_3546 * 2.384185791015625e-07f) + 16.0f))) {
          if (!(_sunDirection.y > 0.0f)) {
            _3565 = (_sunDirection.y > _moonDirection.y);
          } else {
            _3565 = true;
          }
          _3595 = (!_3565);
        } else {
          _3595 = true;
        }
      } else {
        _3595 = true;
      }
    }
  } else {
    _3595 = true;
  }
  if (((((_338 != 29)) || ((((_948 < 0.20000000298023224f)) || ((((((_949 < -1.0f)) || ((_949 > 1.0f)))) || ((((_950 < -1.0f)) || ((_950 > 1.0f)))))))))) && (_3361)) {
    _3603 = (((_119 < (_voxelParams.x * 11585.1259765625f))) || (_3595));
  } else {
    _3603 = false;
  }
  if (((_renderParams.y > 0.0f)) && ((((_3325 == 0)) && (_3603)))) {
    if (!_3547) {
      _3617 = (int)(uint((saturate(1.0f - _344) * 64.0f) + 128.0f));
    } else {
      _3617 = 64;
    }
    if (!(((_92 != 29)) || (_3547))) {
      _3626 = min(3072.0f, ((_119 * 8.0f) + 256.0f));
    } else {
      _3626 = select(_3547, 64.0f, 256.0f);
    }
    if (!_3361) {
      _3630 = min(_3626, _3334);
    } else {
      _3630 = _3626;
    }
    float _3632 = min(max(_401, 0.009999999776482582f), 0.03999999910593033f);
    if (!_3595) {
      float _3636 = _lightingParams.z * 1.3434898853302002f;
      float _3637 = -0.0f - _3636;
      if (((((_158 > _3637)) && ((_158 < _3636)))) && ((((((_156 > _3637)) && ((_156 < _3636)))) && ((((_157 > _3637)) && ((_157 < _3636))))))) {
        float _3650 = 1.0f / _813;
        float _3651 = 1.0f / _814;
        float _3652 = 1.0f / _815;
        float _3656 = _3650 * (_3637 - _156);
        float _3657 = _3651 * (_3637 - _157);
        float _3658 = _3652 * (_3637 - _158);
        float _3662 = _3650 * (_3636 - _156);
        float _3663 = _3651 * (_3636 - _157);
        float _3664 = _3652 * (_3636 - _158);
        float _3674 = min(min(max(_3656, _3662), max(_3657, _3663)), max(_3658, _3664));
        if (((_3674 > 0.0f)) && ((((_3674 >= 0.0f)) && ((max(max(min(_3656, _3662), min(_3657, _3663)), min(_3658, _3664)) <= _3674))))) {
          _3688 = ((_3674 * _813) + _156);
          _3689 = ((_3674 * _814) + _157);
          _3690 = ((_3674 * _815) + _158);
          _3691 = _3674;
        } else {
          _3688 = _156;
          _3689 = _157;
          _3690 = _158;
          _3691 = 0.0f;
        }
      } else {
        _3688 = _156;
        _3689 = _157;
        _3690 = _158;
        _3691 = 0.0f;
      }
    } else {
      _3688 = _156;
      _3689 = _157;
      _3690 = _158;
      _3691 = 0.0f;
    }
    if (_338 == 29) {
      _3698 = (min(10.0f, (_119 * 0.10000000149011612f)) + 10.0f);
    } else {
      _3698 = 1.0f;
    }
    _3702 = 0;
    while(true) {
      int _3742 = int(floor(((_wrappedViewPos.x + _3688) * ((_clipmapOffsets[_3702]).w)) + ((_clipmapRelativeIndexOffsets[_3702]).x)));
      int _3743 = int(floor(((_wrappedViewPos.y + _3689) * ((_clipmapOffsets[_3702]).w)) + ((_clipmapRelativeIndexOffsets[_3702]).y)));
      int _3744 = int(floor(((_wrappedViewPos.z + _3690) * ((_clipmapOffsets[_3702]).w)) + ((_clipmapRelativeIndexOffsets[_3702]).z)));
      if (!((((((((int)_3742 >= (int)int(((_clipmapOffsets[_3702]).x) + -63.0f))) && (((int)_3742 < (int)int(((_clipmapOffsets[_3702]).x) + 63.0f))))) && (((((int)_3743 >= (int)int(((_clipmapOffsets[_3702]).y) + -31.0f))) && (((int)_3743 < (int)int(((_clipmapOffsets[_3702]).y) + 31.0f))))))) && (((((int)_3744 >= (int)int(((_clipmapOffsets[_3702]).z) + -63.0f))) && (((int)_3744 < (int)int(((_clipmapOffsets[_3702]).z) + 63.0f))))))) {
        if ((uint)(_3702 + 1) < (uint)8) {
          _3702 = (_3702 + 1);
          continue;
        } else {
          _3760 = -10000;
        }
      } else {
        _3760 = _3702;
      }
      if (!(_3760 == -10000)) {
        uint _3763 = min((uint)(32768), (uint)(_3617));
        bool _3768 = (_813 == 0.0f);
        bool _3769 = (_814 == 0.0f);
        bool _3770 = (_815 == 0.0f);
        float _3771 = select(_3768, 0.0f, (1.0f / _813));
        float _3772 = select(_3769, 0.0f, (1.0f / _814));
        float _3773 = select(_3770, 0.0f, (1.0f / _815));
        bool _3774 = (_813 > 0.0f);
        bool _3775 = (_814 > 0.0f);
        bool _3776 = (_815 > 0.0f);
        float _3783 = saturate(dot(float3(_280, _281, _282), float3(_813, _814, _815))) * 0.4375f;
        if (((_3630 > 0.0f)) && (((int)(_3763) != 0))) {
          _3790 = 0;
          _3791 = 1.0f;
          _3792 = 0.0f;
          _3793 = 0.0f;
          _3794 = _3690;
          _3795 = _3689;
          _3796 = _3688;
          while(true) {
            _3798 = 0;
            while(true) {
              float _3823 = ((_wrappedViewPos.x + _3796) * ((_clipmapOffsets[_3798]).w)) + ((_clipmapRelativeIndexOffsets[_3798]).x);
              float _3824 = ((_wrappedViewPos.y + _3795) * ((_clipmapOffsets[_3798]).w)) + ((_clipmapRelativeIndexOffsets[_3798]).y);
              float _3825 = ((_wrappedViewPos.z + _3794) * ((_clipmapOffsets[_3798]).w)) + ((_clipmapRelativeIndexOffsets[_3798]).z);
              bool __defer_3797_3840 = false;
              if (!(((_3825 >= (((_clipmapOffsets[_3798]).z) + -63.0f))) && ((((_3823 >= (((_clipmapOffsets[_3798]).x) + -63.0f))) && ((_3824 >= (((_clipmapOffsets[_3798]).y) + -31.0f)))))) || ((((_3825 >= (((_clipmapOffsets[_3798]).z) + -63.0f))) && ((((_3823 >= (((_clipmapOffsets[_3798]).x) + -63.0f))) && ((_3824 >= (((_clipmapOffsets[_3798]).y) + -31.0f)))))) && (!(((_3825 < (((_clipmapOffsets[_3798]).z) + 63.0f))) && ((((_3823 < (((_clipmapOffsets[_3798]).x) + 63.0f))) && ((_3824 < (((_clipmapOffsets[_3798]).y) + 31.0f))))))))) {
                __defer_3797_3840 = true;
              } else {
                if (_3798 == -10000) {
                  _4081 = _3793;
                  _4083 = _4081;
                  _4084 = -10000.0f;
                  _4085 = 0.0f;
                  _4086 = 0.0f;
                  _4087 = 0.0f;
                } else {
                  float _3848 = float((int)((int)(1u << (_3798 & 31))));
                  float _3849 = 1.0f / _3848;
                  float _3850 = _3848 * _voxelParams.x;
                  float _3862 = (_invClipmapExtent.x * _3796) + _clipmapUVRelativeOffset.x;
                  float _3863 = (_invClipmapExtent.y * _3795) + _clipmapUVRelativeOffset.y;
                  float _3864 = (_invClipmapExtent.z * _3794) + _clipmapUVRelativeOffset.z;
                  float _3866 = _3862 * _3849;
                  float _3867 = _3863 * _3849;
                  float _3868 = _3864 * _3849;
                  float _3869 = _3866 * 64.0f;
                  float _3870 = _3867 * 32.0f;
                  float _3871 = _3868 * 64.0f;
                  int _3875 = int(floor(_3869));
                  int _3876 = int(floor(_3870));
                  int _3877 = int(floor(_3871));
                  uint4 _3884 = __3__36__0__0__g_axisAlignedDistanceTextures.Load(int4((_3875 & 63), (_3876 & 31), ((_3877 & 63) | (_3798 << 6)), 0));
                  float _3924 = _3869 - float((int)(_3875));
                  float _3925 = _3870 - float((int)(_3876));
                  float _3926 = _3871 - float((int)(_3877));
                  float _3957 = max(((_3850 * 0.5f) * min(min(select(_3768, 999999.0f, ((select(_3774, 1.0f, 0.0f) - frac(_3866 * 256.0f)) * _3771)), select(_3769, 999999.0f, ((select(_3775, 1.0f, 0.0f) - frac(_3867 * 128.0f)) * _3772))), select(_3770, 999999.0f, ((select(_3776, 1.0f, 0.0f) - frac(_3868 * 256.0f)) * _3773)))), ((_3850 * 2.0f) * min(min(select(_3768, 999999.0f, (select(_3774, ((0.009999999776482582f - _3924) + float((uint)((uint)(((uint)((uint)(_3884.x)) >> 4) & 15)))), ((0.9900000095367432f - _3924) - float((uint)((uint)(_3884.x & 15))))) * _3771)), select(_3769, 999999.0f, (select(_3775, ((0.009999999776482582f - _3925) + float((uint)((uint)(((uint)((uint)(_3884.y)) >> 4) & 15)))), ((0.9900000095367432f - _3925) - float((uint)((uint)(_3884.y & 15))))) * _3772))), select(_3770, 999999.0f, (select(_3776, ((0.009999999776482582f - _3926) + float((uint)((uint)(((uint)((uint)(_3884.z)) >> 4) & 15)))), ((0.9900000095367432f - _3926) - float((uint)((uint)(_3884.z & 15))))) * _3773)))));
                  float _3962 = _3793 * 0.125f;
                  float _3967 = frac(_3868);
                  float _3974 = float((uint)(_3798 * 130)) + 1.0f;
                  float _3976 = (((select((_3967 < 0.0f), 1.0f, 0.0f) + _3967) * 128.0f) + _3974) * 0.000961538462433964f;
                  float _3979 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_3866, _3867, _3976), 0.0f);
                  if (_3962 < _3850) {
                    float _3985 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(((_3862 + 0.009999999776482582f) * _3849), _3867, _3976), 0.0f);
                    float _3987 = _3985.x - _3979.x;
                    float _3990 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_3866, ((_3863 + 0.009999999776482582f) * _3849), _3976), 0.0f);
                    float _3992 = _3990.x - _3979.x;
                    float _3995 = frac((_3864 + 0.009999999776482582f) * _3849);
                    float _4002 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_3866, _3867, ((((select((_3995 < 0.0f), 1.0f, 0.0f) + _3995) * 128.0f) + _3974) * 0.000961538462433964f)), 0.0f);
                    float _4004 = _4002.x - _3979.x;
                    float _4006 = rsqrt(dot(float3(_3987, _3992, _4004), float3(_3987, _3992, _4004)));
                    _4014 = (1.0f - saturate(dot(float3(_280, _281, _282), float3((_4006 * _3987), (_4006 * _3992), (_4004 * _4006)))));
                  } else {
                    _4014 = 0.0f;
                  }
                  float _4019 = _3979.x - ((_3850 * 0.707099974155426f) * saturate(_3793 * 0.10000000149011612f));
                  float _4021 = (_3632 * 2.0f) * _3793;
                  float _4024 = ((_4014 * 0.875f) + 0.125f) / _3850;
                  float _4041 = (_4019 + min(4.0f, ((_119 * _119) * 9.999999747378752e-05f))) / min(8.0f, (((max(((_3850 * 2.1213200092315674f) * ((_3783 + 0.0625f) + (saturate(_3962) * (0.4375f - _3783)))), _4021) - _4021) * saturate(((max(1.0f, (_4024 * 0.75f)) * _4024) * min(_3793, max(0.0f, (_3630 - _3793)))) + -1.0f)) + _4021));
                  float _4047 = saturate(((float((bool)(uint)(saturate(float((uint)((uint)((uint)((uint)(_3884.w)) >> 2))) * 0.01587301678955555f) > 0.0f)) * (1.0f - _3792)) * saturate(1.0f - (_4041 * _4041))) + _3792);
                  if (!(_4019 > _3850)) {
                    _4052 = min(_3957, _4019);
                  } else {
                    _4052 = _3957;
                  }
                  if (!(_4047 >= 0.5f)) {
                    float _4060 = _3791 * (((_3632 * 0.20000000298023224f) * _3698) + 1.0f);
                    float _4065 = max((_3850 * 0.10000000149011612f), (max((_voxelParams.x * 0.25f), _4052) * _4060));
                    float _4066 = _4065 + _3793;
                    if ((((((uint)((int)((uint)(_3790) + 1u)) < (uint)(int)(_3763))) && ((_4047 < 0.5f)))) && ((_4066 < _3630))) {
                      _3790 = ((int)((uint)(_3790) + 1u));
                      _3791 = _4060;
                      _3792 = _4047;
                      _3793 = _4066;
                      _3794 = ((_4065 * _815) + _3794);
                      _3795 = ((_4065 * _814) + _3795);
                      _3796 = ((_4065 * _813) + _3796);
                      __loop_jump_target = 3789;
                      break;
                    } else {
                      _4081 = _4066;
                      _4083 = _4081;
                      _4084 = -10000.0f;
                      _4085 = 0.0f;
                      _4086 = 0.0f;
                      _4087 = 0.0f;
                    }
                  } else {
                    _4083 = _3793;
                    _4084 = float((int)(_3798));
                    _4085 = _3862;
                    _4086 = _3863;
                    _4087 = _3864;
                  }
                }
              }
              if (__defer_3797_3840) {
                if ((int)(_3798 + 1) < (int)8) {
                  _3798 = (_3798 + 1);
                  continue;
                } else {
                  _4083 = _3793;
                  _4084 = -10000.0f;
                  _4085 = 0.0f;
                  _4086 = 0.0f;
                  _4087 = 0.0f;
                }
              }
              break;
            }
            if (__loop_jump_target == 3789) {
              __loop_jump_target = -1;
              continue;
            }
            if (__loop_jump_target != -1) {
              break;
            }
            break;
          }
        } else {
          _4083 = 0.0f;
          _4084 = -10000.0f;
          _4085 = 0.0f;
          _4086 = 0.0f;
          _4087 = 0.0f;
        }
        int _4088 = int(_4084);
        if ((uint)_4088 < (uint)8) {
          float _4091 = -0.0f - _813;
          float _4092 = -0.0f - _814;
          float _4093 = -0.0f - _815;
          float _4096 = float((int)((int)(1u << (_4088 & 31))));
          float _4097 = _4096 * _voxelParams.x;
          if (_4083 < (_4097 * 2.0f)) {
            float _4101 = 1.0f / _4096;
            float _4102 = _4101 * _4085;
            float _4103 = _4101 * _4086;
            float _4105 = frac(_4101 * _4087);
            float _4112 = float((uint)(_4088 * 130)) + 1.0f;
            float _4114 = (((select((_4105 < 0.0f), 1.0f, 0.0f) + _4105) * 128.0f) + _4112) * 0.000961538462433964f;
            float _4117 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_4102, _4103, _4114), 0.0f);
            float _4121 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3((_4101 * (_4085 + 9.999999747378752e-05f)), _4103, _4114), 0.0f);
            float _4123 = _4121.x - _4117.x;
            float _4126 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_4102, (_4101 * (_4086 + 9.999999747378752e-05f)), _4114), 0.0f);
            float _4128 = _4126.x - _4117.x;
            float _4131 = frac(_4101 * (_4087 + 9.999999747378752e-05f));
            float _4138 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3(_4102, _4103, ((((select((_4131 < 0.0f), 1.0f, 0.0f) + _4131) * 128.0f) + _4112) * 0.000961538462433964f)), 0.0f);
            float _4140 = _4138.x - _4117.x;
            float _4142 = rsqrt(dot(float3(_4123, _4128, _4140), float3(_4123, _4128, _4140)));
            _4147 = (_4142 * _4123);
            _4148 = (_4142 * _4128);
            _4149 = (_4140 * _4142);
          } else {
            _4147 = _4091;
            _4148 = _4092;
            _4149 = _4093;
          }
          if ((int)_4088 < (int)6) {
            float _4152 = _4097 * 0.5f;
            float _4156 = saturate((_4152 * _4152) / (_4083 * _4083));
            float _4157 = _899 * 6.2831854820251465f;
            if (_4156 < 0.009999999776482582f) {
              _4168 = (((_4156 * 0.125f) + 0.5f) * _4156);
            } else {
              _4168 = (1.0f - sqrt(1.0f - _4156));
            }
            float _4170 = 1.0f - (_4168 * _903);
            float _4173 = sqrt(1.0f - (_4170 * _4170));
            float _4176 = cos(_4157) * _4173;
            float _4177 = sin(_4157) * _4173;
            float _4179 = select((_815 >= 0.0f), 1.0f, -1.0f);
            float _4182 = -0.0f - (1.0f / (_4179 + _815));
            float _4184 = (_813 * _814) * _4182;
            float _4211 = min(_4083, (_4097 * 0.25f));
            float _4215 = ((mad(_4170, _813, mad(_4177, _4184, (((((_813 * _813) * _4179) * _4182) + 1.0f) * _4176))) * _4083) + _3688) + (_4211 * _4147);
            float _4216 = ((mad(_4170, _814, mad(_4177, (((_814 * _814) * _4182) + _4179), ((_4176 * _4179) * _4184))) * _4083) + _3689) + (_4211 * _4148);
            float _4217 = ((mad(_4170, _815, mad(_4177, _4092, (-0.0f - ((_4179 * _813) * _4176)))) * _4083) + _3690) + (_4211 * _4149);
            _4222 = 0;
            while(true) {
              int _4262 = int(floor(((_wrappedViewPos.x + _4215) * ((_clipmapOffsets[_4222]).w)) + ((_clipmapRelativeIndexOffsets[_4222]).x)));
              int _4263 = int(floor(((_wrappedViewPos.y + _4216) * ((_clipmapOffsets[_4222]).w)) + ((_clipmapRelativeIndexOffsets[_4222]).y)));
              int _4264 = int(floor(((_wrappedViewPos.z + _4217) * ((_clipmapOffsets[_4222]).w)) + ((_clipmapRelativeIndexOffsets[_4222]).z)));
              if ((((((((int)_4262 >= (int)int(((_clipmapOffsets[_4222]).x) + -63.0f))) && (((int)_4262 < (int)int(((_clipmapOffsets[_4222]).x) + 63.0f))))) && (((((int)_4263 >= (int)int(((_clipmapOffsets[_4222]).y) + -31.0f))) && (((int)_4263 < (int)int(((_clipmapOffsets[_4222]).y) + 31.0f))))))) && (((((int)_4264 >= (int)int(((_clipmapOffsets[_4222]).z) + -63.0f))) && (((int)_4264 < (int)int(((_clipmapOffsets[_4222]).z) + 63.0f)))))) {
                _4285 = (_4262 & 127);
                _4286 = (_4263 & 63);
                _4287 = (_4264 & 127);
                _4288 = _4222;
              } else {
                if ((uint)(_4222 + 1) < (uint)8) {
                  _4222 = (_4222 + 1);
                  continue;
                } else {
                  _4285 = -10000;
                  _4286 = -10000;
                  _4287 = -10000;
                  _4288 = -10000;
                }
              }
              if (!((uint)_4288 > (uint)5)) {
                uint _4298 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4(_4285, _4286, ((int)(((uint)(((int)(_4288 * 130)) | 1)) + (uint)(_4287))), 0));
                bool _4301 = ((_4298.x & 4194303) == 0);
                [branch]
                if (!_4301) {
                  _4304 = _4285;
                  _4305 = _4286;
                  _4306 = _4287;
                  _4307 = _4288;
                } else {
                  _4304 = -10000;
                  _4305 = -10000;
                  _4306 = -10000;
                  _4307 = -10000;
                }
                float _4309 = (_voxelParams.x * 0.5f) * float((int)((int)(1u << (_4288 & 31))));
                _4314 = 0;
                while(true) {
                  int _4354 = int(floor((((_4215 - _4309) + _wrappedViewPos.x) * ((_clipmapOffsets[_4314]).w)) + ((_clipmapRelativeIndexOffsets[_4314]).x)));
                  int _4355 = int(floor((((_4216 - _4309) + _wrappedViewPos.y) * ((_clipmapOffsets[_4314]).w)) + ((_clipmapRelativeIndexOffsets[_4314]).y)));
                  int _4356 = int(floor((((_4217 - _4309) + _wrappedViewPos.z) * ((_clipmapOffsets[_4314]).w)) + ((_clipmapRelativeIndexOffsets[_4314]).z)));
                  if ((((((((int)_4354 >= (int)int(((_clipmapOffsets[_4314]).x) + -63.0f))) && (((int)_4354 < (int)int(((_clipmapOffsets[_4314]).x) + 63.0f))))) && (((((int)_4355 >= (int)int(((_clipmapOffsets[_4314]).y) + -31.0f))) && (((int)_4355 < (int)int(((_clipmapOffsets[_4314]).y) + 31.0f))))))) && (((((int)_4356 >= (int)int(((_clipmapOffsets[_4314]).z) + -63.0f))) && (((int)_4356 < (int)int(((_clipmapOffsets[_4314]).z) + 63.0f)))))) {
                    _4377 = (_4354 & 127);
                    _4378 = (_4355 & 63);
                    _4379 = (_4356 & 127);
                    _4380 = _4314;
                  } else {
                    if ((uint)(_4314 + 1) < (uint)8) {
                      _4314 = (_4314 + 1);
                      continue;
                    } else {
                      _4377 = -10000;
                      _4378 = -10000;
                      _4379 = -10000;
                      _4380 = -10000;
                    }
                  }
                  if (!((uint)_4380 > (uint)5)) {
                    if (_4301) {
                      _4385 = 0;
                      _4386 = _4307;
                      _4387 = _4306;
                      _4388 = _4305;
                      _4389 = _4304;
                      while(true) {
                        _4398 = 0;
                        _4399 = _4386;
                        _4400 = _4387;
                        _4401 = _4388;
                        _4402 = _4389;
                        while(true) {
                          if (!((((uint)(_4398 + _4378) > (uint)63)) || (((uint)(_4377 | (_4385 + _4379)) > (uint)127)))) {
                            uint _4420 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4(_4377, (_4398 + _4378), ((int)(((uint)(_4385 + _4379)) + ((uint)(((int)(_4380 * 130)) | 1)))), 0));
                            int _4422 = _4420.x & 4194303;
                            _4425 = (_4422 != 0);
                            _4426 = _4422;
                            _4427 = _4380;
                            _4428 = (_4385 + _4379);
                            _4429 = (_4398 + _4378);
                            _4430 = _4377;
                          } else {
                            _4425 = false;
                            _4426 = 0;
                            _4427 = 0;
                            _4428 = 0;
                            _4429 = 0;
                            _4430 = 0;
                          }
                          if (!_4425) {
                            if (!((((uint)(_4398 + _4378) > (uint)63)) || (((uint)((_4377 + 1) | (_4385 + _4379)) > (uint)127)))) {
                              uint _6400 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4((_4377 + 1), (_4398 + _4378), ((int)(((uint)(_4385 + _4379)) + ((uint)(((int)(_4380 * 130)) | 1)))), 0));
                              int _6402 = _6400.x & 4194303;
                              _6405 = (_6402 != 0);
                              _6406 = _6402;
                              _6407 = _4380;
                              _6408 = (_4385 + _4379);
                              _6409 = (_4398 + _4378);
                              _6410 = (_4377 + 1);
                            } else {
                              _6405 = false;
                              _6406 = 0;
                              _6407 = 0;
                              _6408 = 0;
                              _6409 = 0;
                              _6410 = 0;
                            }
                            if (!_6405) {
                              _4439 = _4402;
                              _4440 = _4401;
                              _4441 = _4400;
                              _4442 = _4399;
                              _4443 = 0;
                            } else {
                              _4439 = _6410;
                              _4440 = _6409;
                              _4441 = _6408;
                              _4442 = _6407;
                              _4443 = _6406;
                            }
                          } else {
                            _4439 = _4430;
                            _4440 = _4429;
                            _4441 = _4428;
                            _4442 = _4427;
                            _4443 = _4426;
                          }
                          if ((((int)(_4398 + 1) < (int)2)) && ((_4443 == 0))) {
                            _4398 = (_4398 + 1);
                            _4399 = _4442;
                            _4400 = _4441;
                            _4401 = _4440;
                            _4402 = _4439;
                            continue;
                          }
                          if ((((int)(_4385 + 1) < (int)2)) && ((_4443 == 0))) {
                            _4385 = (_4385 + 1);
                            _4386 = _4442;
                            _4387 = _4441;
                            _4388 = _4440;
                            _4389 = _4439;
                            __loop_jump_target = 4384;
                            break;
                          }
                          _4392 = _4442;
                          _4393 = _4441;
                          _4394 = _4440;
                          _4395 = _4439;
                          break;
                        }
                        if (__loop_jump_target == 4384) {
                          __loop_jump_target = -1;
                          continue;
                        }
                        if (__loop_jump_target != -1) {
                          break;
                        }
                        break;
                      }
                    } else {
                      _4392 = _4307;
                      _4393 = _4306;
                      _4394 = _4305;
                      _4395 = _4304;
                    }
                    if ((uint)_4392 < (uint)6) {
                      uint _4449 = _4392 * 130;
                      uint _4453 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4(_4395, _4394, ((int)(((uint)((int)(_4449) | 1)) + (uint)(_4393))), 0));
                      int _4455 = _4453.x & 4194303;
                      [branch]
                      if (!(_4455 == 0)) {
                        float _4461 = float((int)((int)(1u << (_4392 & 31)))) * _voxelParams.x;
                        _4499 = 0.0f;
                        _4500 = 0.0f;
                        _4501 = 0.0f;
                        _4502 = 0.0f;
                        _4503 = 0;
                        while(true) {
                          int _4508 = __3__37__0__0__g_surfelDataBuffer[((_4455 + -1) + _4503)]._baseColor;
                          int _4510 = __3__37__0__0__g_surfelDataBuffer[((_4455 + -1) + _4503)]._normal;
                          int16_t _4513 = __3__37__0__0__g_surfelDataBuffer[((_4455 + -1) + _4503)]._radius;
                          if (!(_4508 == 0)) {
                            half _4516 = __3__37__0__0__g_surfelDataBuffer[((_4455 + -1) + _4503)]._radiance.z;
                            half _4517 = __3__37__0__0__g_surfelDataBuffer[((_4455 + -1) + _4503)]._radiance.y;
                            half _4518 = __3__37__0__0__g_surfelDataBuffer[((_4455 + -1) + _4503)]._radiance.x;
                            float _4524 = float((uint)((uint)(_4508 & 255)));
                            float _4525 = float((uint)((uint)(((uint)((uint)(_4508)) >> 8) & 255)));
                            float _4526 = float((uint)((uint)(((uint)((uint)(_4508)) >> 16) & 255)));
                            float _4551 = select(((_4524 * 0.003921568859368563f) < 0.040449999272823334f), (_4524 * 0.0003035269910469651f), exp2(log2((_4524 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                            float _4552 = select(((_4525 * 0.003921568859368563f) < 0.040449999272823334f), (_4525 * 0.0003035269910469651f), exp2(log2((_4525 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                            float _4553 = select(((_4526 * 0.003921568859368563f) < 0.040449999272823334f), (_4526 * 0.0003035269910469651f), exp2(log2((_4526 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                            float _4565 = (float((uint)((uint)(_4510 & 255))) * 0.007874015718698502f) + -1.0f;
                            float _4566 = (float((uint)((uint)(((uint)((uint)(_4510)) >> 8) & 255))) * 0.007874015718698502f) + -1.0f;
                            float _4567 = (float((uint)((uint)(((uint)((uint)(_4510)) >> 16) & 255))) * 0.007874015718698502f) + -1.0f;
                            float _4569 = rsqrt(dot(float3(_4565, _4566, _4567), float3(_4565, _4566, _4567)));
                            bool _4574 = ((_4510 & 16777215) == 0);
                            float _4578 = float(_4518);
                            float _4579 = float(_4517);
                            float _4580 = float(_4516);
                            float _4584 = (_4461 * 0.0019607844296842813f) * float((uint16_t)((uint)((int)(_4513) & 255)));
                            float _4600 = (((float((uint)((uint)((uint)((uint)(_4508)) >> 24))) * 0.003937007859349251f) + -0.5f) * _4461) + ((((((_clipmapOffsets[_4392]).x) + -63.5f) + float((int)(((int)(((uint)(_4395) + 64u) - (uint)(int((_clipmapOffsets[_4392]).x)))) & 127))) * _4461) - _viewPos.x);
                            float _4601 = (((float((uint)((uint)((uint)((uint)(_4510)) >> 24))) * 0.003937007859349251f) + -0.5f) * _4461) + ((((((_clipmapOffsets[_4392]).y) + -31.5f) + float((int)(((int)(((uint)(_4394) + 32u) - (uint)(int((_clipmapOffsets[_4392]).y)))) & 63))) * _4461) - _viewPos.y);
                            float _4602 = (((float((uint16_t)((uint)((uint16_t)((uint)(_4513)) >> 8))) * 0.003937007859349251f) + -0.5f) * _4461) + ((((((_clipmapOffsets[_4392]).z) + -63.5f) + float((int)(((int)(((uint)(_4393) + 64u) - (uint)(int((_clipmapOffsets[_4392]).z)))) & 127))) * _4461) - _viewPos.z);
                            float _4622 = ((-0.0f - _3688) - (_4083 * _813)) + _4600;
                            float _4625 = ((-0.0f - _3689) - (_4083 * _814)) + _4601;
                            float _4628 = ((-0.0f - _3690) - (_4083 * _815)) + _4602;
                            float _4629 = dot(float3(_4622, _4625, _4628), float3(_4091, _4092, _4093));
                            float _4633 = _4622 - (_4629 * _4091);
                            float _4634 = _4625 - (_4629 * _4092);
                            float _4635 = _4628 - (_4629 * _4093);
                            float _4661 = 1.0f / float((uint)(1u << (_4392 & 31)));
                            float _4665 = frac(((_invClipmapExtent.z * _4602) + _clipmapUVRelativeOffset.z) * _4661);
                            float _4676 = __3__36__0__1__g_signedDistanceVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3((((_invClipmapExtent.x * _4600) + _clipmapUVRelativeOffset.x) * _4661), (((_invClipmapExtent.y * _4601) + _clipmapUVRelativeOffset.y) * _4661), (((float((uint)_4449) + 1.0f) + ((select((_4665 < 0.0f), 1.0f, 0.0f) + _4665) * 128.0f)) * 0.000961538462433964f)), 0.0f);
                            float _4690 = select(((int)_4392 > (int)5), 1.0f, ((saturate((saturate(dot(float3(_4091, _4092, _4093), float3(select(_4574, _4091, (_4569 * _4565)), select(_4574, _4092, (_4569 * _4566)), select(_4574, _4093, (_4569 * _4567))))) + -0.03125f) * 1.0322580337524414f) * float((bool)(uint)(dot(float3(_4633, _4634, _4635), float3(_4633, _4634, _4635)) < ((_4584 * _4584) * 16.0f)))) * float((bool)(uint)(_4676.x > ((_4461 * 0.25f) * (saturate((dot(float3(_4578, _4579, _4580), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 9.999999747378752e-05f) / _exposure3.w) + 1.0f))))));
                            float _4697 = (((((_4552 * 0.3395099937915802f) + (_4551 * 0.6131200194358826f)) + (_4553 * 0.047370001673698425f)) * _4578) * _4690) + _4499;
                            float _4698 = (((((_4552 * 0.9163600206375122f) + (_4551 * 0.07020000368356705f)) + (_4553 * 0.013450000435113907f)) * _4579) * _4690) + _4500;
                            float _4699 = (((((_4552 * 0.10958000272512436f) + (_4551 * 0.02061999961733818f)) + (_4553 * 0.8697999715805054f)) * _4580) * _4690) + _4501;
                            float _4700 = _4690 + _4502;
                            if ((uint)(_4503 + 1) < (uint)4) {
                              _4499 = _4697;
                              _4500 = _4698;
                              _4501 = _4699;
                              _4502 = _4700;
                              _4503 = (_4503 + 1);
                              continue;
                            } else {
                              _4704 = _4697;
                              _4705 = _4698;
                              _4706 = _4699;
                              _4707 = _4700;
                            }
                          } else {
                            _4704 = _4499;
                            _4705 = _4500;
                            _4706 = _4501;
                            _4707 = _4502;
                          }
                          if (_4707 > 0.0f) {
                            float _4710 = 1.0f / _4707;
                            _4724 = (-0.0f - min(0.0f, (-0.0f - (_4704 * _4710))));
                            _4725 = (-0.0f - min(0.0f, (-0.0f - (_4705 * _4710))));
                            _4726 = (-0.0f - min(0.0f, (-0.0f - (_4706 * _4710))));
                          } else {
                            _4724 = _4704;
                            _4725 = _4705;
                            _4726 = _4706;
                          }
                          break;
                        }
                      } else {
                        _4724 = 0.0f;
                        _4725 = 0.0f;
                        _4726 = 0.0f;
                      }
                    } else {
                      _4724 = 0.0f;
                      _4725 = 0.0f;
                      _4726 = 0.0f;
                    }
                  } else {
                    _4724 = 0.0f;
                    _4725 = 0.0f;
                    _4726 = 0.0f;
                  }
                  break;
                }
              } else {
                _4724 = 0.0f;
                _4725 = 0.0f;
                _4726 = 0.0f;
              }
              break;
            }
          } else {
            _4724 = 0.0f;
            _4725 = 0.0f;
            _4726 = 0.0f;
          }
          _4734 = min(30000.0f, _4724);
          _4735 = min(30000.0f, _4725);
          _4736 = min(30000.0f, _4726);
          _4737 = 1.0f;
          _4738 = max(9.999999747378752e-05f, _4083);
        } else {
          _4734 = 0.0f;
          _4735 = 0.0f;
          _4736 = 0.0f;
          _4737 = 0.0f;
          _4738 = (-0.0f - _4083);
        }
      } else {
        _4734 = 0.0f;
        _4735 = 0.0f;
        _4736 = 0.0f;
        _4737 = 0.0f;
        _4738 = 0.0f;
      }
      float _4742 = (_4738 * _813) + _3688;
      float _4743 = (_4738 * _814) + _3689;
      float _4744 = (_4738 * _815) + _3690;
      if (_4738 > 0.0f) {
        float _4747 = _4738 + _3691;
        float _4748 = _4734 * _renderParams.y;
        float _4749 = _4735 * _renderParams.y;
        float _4750 = _4736 * _renderParams.y;
        float _4753 = select((_4747 <= 0.0f), 9.999999974752427e-07f, _4747);
        float _4763 = __3__36__0__0__g_waterDepthTop.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((_waterDepthFieldSize.z * _4742) + 0.5f), (0.5f - (_waterDepthFieldSize.w * _4744))), 0.0f);
        float _4777 = saturate((((_4743 - _waterDepthMinMax.z) + _waterDepthMinMax.x) + ((_waterDepthMinMax.y - _waterDepthMinMax.x) * _4763.x)) * 0.125f);
        if (_4777 > 0.0f) {
          float _4782 = _renderParams2.z * _4777;
          _4784 = 0;
          while(true) {
            int _4824 = int(floor(((_wrappedViewPos.x + _4742) * ((_clipmapOffsets[_4784]).w)) + ((_clipmapRelativeIndexOffsets[_4784]).x)));
            int _4825 = int(floor(((_wrappedViewPos.y + _4743) * ((_clipmapOffsets[_4784]).w)) + ((_clipmapRelativeIndexOffsets[_4784]).y)));
            int _4826 = int(floor(((_wrappedViewPos.z + _4744) * ((_clipmapOffsets[_4784]).w)) + ((_clipmapRelativeIndexOffsets[_4784]).z)));
            if (!((((((((int)_4824 >= (int)int(((_clipmapOffsets[_4784]).x) + -63.0f))) && (((int)_4824 < (int)int(((_clipmapOffsets[_4784]).x) + 63.0f))))) && (((((int)_4825 >= (int)int(((_clipmapOffsets[_4784]).y) + -31.0f))) && (((int)_4825 < (int)int(((_clipmapOffsets[_4784]).y) + 31.0f))))))) && (((((int)_4826 >= (int)int(((_clipmapOffsets[_4784]).z) + -63.0f))) && (((int)_4826 < (int)int(((_clipmapOffsets[_4784]).z) + 63.0f))))))) {
              if ((uint)(_4784 + 1) < (uint)8) {
                _4784 = (_4784 + 1);
                continue;
              } else {
                _4842 = -10000;
              }
            } else {
              _4842 = _4784;
            }
            float _4846 = float((int)((int)(1u << (_4842 & 31)))) * _voxelParams.x;
            float _4847 = _4846 * 0.5f;
            float _4851 = saturate((_4847 * _4847) / (_4753 * _4753));
            float _4852 = _899 * 6.2831854820251465f;
            if (_4851 < 0.009999999776482582f) {
              _4863 = (((_4851 * 0.125f) + 0.5f) * _4851);
            } else {
              _4863 = (1.0f - sqrt(1.0f - _4851));
            }
            float _4865 = 1.0f - (_4863 * _903);
            float _4868 = sqrt(1.0f - (_4865 * _4865));
            float _4871 = cos(_4852) * _4868;
            float _4872 = sin(_4852) * _4868;
            float _4874 = select((_815 >= 0.0f), 1.0f, -1.0f);
            float _4877 = -0.0f - (1.0f / (_4874 + _815));
            float _4879 = (_813 * _814) * _4877;
            float _4888 = -0.0f - _814;
            float _4900 = _4846 + _4753;
            bool _4909 = (_sunDirection.y > 0.0f);
            if ((_4909) || ((!(_4909)) && (_sunDirection.y > _moonDirection.y))) {
              _4921 = _sunDirection.x;
              _4922 = _sunDirection.y;
              _4923 = _sunDirection.z;
            } else {
              _4921 = _moonDirection.x;
              _4922 = _moonDirection.y;
              _4923 = _moonDirection.z;
            }
            float _4927 = (_4921 * 0.25f) - _813;
            float _4928 = (_4922 * 0.25f) - _814;
            float _4929 = (_4923 * 0.25f) - _815;
            float _4931 = rsqrt(dot(float3(_4927, _4928, _4929), float3(_4927, _4928, _4929)));
            _4936 = 0;
            while(true) {
              int _4976 = int(floor(((((mad(_4865, _813, mad(_4872, _4879, (((((_813 * _813) * _4874) * _4877) + 1.0f) * _4871))) * _4900) + _156) + _wrappedViewPos.x) * ((_clipmapOffsets[_4936]).w)) + ((_clipmapRelativeIndexOffsets[_4936]).x)));
              int _4977 = int(floor(((((mad(_4865, _814, mad(_4872, (((_814 * _814) * _4877) + _4874), ((_4871 * _4874) * _4879))) * _4900) + _157) + _wrappedViewPos.y) * ((_clipmapOffsets[_4936]).w)) + ((_clipmapRelativeIndexOffsets[_4936]).y)));
              int _4978 = int(floor(((((mad(_4865, _815, mad(_4872, _4888, (-0.0f - ((_4874 * _813) * _4871)))) * _4900) + _158) + _wrappedViewPos.z) * ((_clipmapOffsets[_4936]).w)) + ((_clipmapRelativeIndexOffsets[_4936]).z)));
              if ((((((((int)_4976 >= (int)int(((_clipmapOffsets[_4936]).x) + -63.0f))) && (((int)_4976 < (int)int(((_clipmapOffsets[_4936]).x) + 63.0f))))) && (((((int)_4977 >= (int)int(((_clipmapOffsets[_4936]).y) + -31.0f))) && (((int)_4977 < (int)int(((_clipmapOffsets[_4936]).y) + 31.0f))))))) && (((((int)_4978 >= (int)int(((_clipmapOffsets[_4936]).z) + -63.0f))) && (((int)_4978 < (int)int(((_clipmapOffsets[_4936]).z) + 63.0f)))))) {
                _4999 = (_4976 & 127);
                _5000 = (_4977 & 63);
                _5001 = (_4978 & 127);
                _5002 = _4936;
              } else {
                if ((uint)(_4936 + 1) < (uint)8) {
                  _4936 = (_4936 + 1);
                  continue;
                } else {
                  _4999 = -10000;
                  _5000 = -10000;
                  _5001 = -10000;
                  _5002 = -10000;
                }
              }
              if ((uint)_5002 < (uint)6) {
                uint _5009 = __3__36__0__0__g_surfelIndicesVoxelsTextures.Load(int4(_4999, _5000, ((int)(((uint)(((int)(_5002 * 130)) | 1)) + (uint)(_5001))), 0));
                int _5011 = _5009.x & 4194303;
                [branch]
                if (!(_5011 == 0)) {
                  if ((_4909) || ((!(_4909)) && (_sunDirection.y > _moonDirection.y))) {
                    _5025 = _sunDirection.x;
                    _5026 = _sunDirection.y;
                    _5027 = _sunDirection.z;
                  } else {
                    _5025 = _moonDirection.x;
                    _5026 = _moonDirection.y;
                    _5027 = _moonDirection.z;
                  }
                  _5029 = 0.0f;
                  _5030 = 0.0f;
                  _5031 = 0.0f;
                  _5032 = 0.0f;
                  _5033 = 0.0f;
                  _5034 = 0.0f;
                  _5035 = 0.0f;
                  _5036 = 0;
                  while(true) {
                    int _5041 = __3__37__0__0__g_surfelDataBuffer[((_5011 + -1) + _5036)]._baseColor;
                    int _5043 = __3__37__0__0__g_surfelDataBuffer[((_5011 + -1) + _5036)]._normal;
                    if (!(_5041 == 0)) {
                      float _5051 = float((uint)((uint)(_5041 & 255)));
                      float _5052 = float((uint)((uint)(((uint)((uint)(_5041)) >> 8) & 255)));
                      float _5053 = float((uint)((uint)(((uint)((uint)(_5041)) >> 16) & 255)));
                      float _5078 = select(((_5051 * 0.003921568859368563f) < 0.040449999272823334f), (_5051 * 0.0003035269910469651f), exp2(log2((_5051 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                      float _5079 = select(((_5052 * 0.003921568859368563f) < 0.040449999272823334f), (_5052 * 0.0003035269910469651f), exp2(log2((_5052 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                      float _5080 = select(((_5053 * 0.003921568859368563f) < 0.040449999272823334f), (_5053 * 0.0003035269910469651f), exp2(log2((_5053 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
                      float _5092 = (float((uint)((uint)(_5043 & 255))) * 0.007874015718698502f) + -1.0f;
                      float _5093 = (float((uint)((uint)(((uint)((uint)(_5043)) >> 8) & 255))) * 0.007874015718698502f) + -1.0f;
                      float _5094 = (float((uint)((uint)(((uint)((uint)(_5043)) >> 16) & 255))) * 0.007874015718698502f) + -1.0f;
                      float _5096 = rsqrt(dot(float3(_5092, _5093, _5094), float3(_5092, _5093, _5094)));
                      bool _5101 = ((_5043 & 16777215) == 0);
                      float _5102 = select(_5101, (_4931 * _4927), (_5096 * _5092));
                      float _5103 = select(_5101, (_4931 * _4928), (_5096 * _5093));
                      float _5104 = select(_5101, (_4929 * _4931), (_5096 * _5094));
                      float _5127 = float((bool)(uint)(saturate(dot(float3((-0.0f - _813), _4888, (-0.0f - _815)), float3(_5102, _5103, _5104))) > 0.0f));
                      float _5128 = _5127 * saturate(dot(float3(_5102, _5103, _5104), float3(_5025, _5026, _5027)));
                      float _5132 = (_5128 * (((_5079 * 0.3395099937915802f) + (_5078 * 0.6131200194358826f)) + (_5080 * 0.047370001673698425f))) + _5032;
                      float _5133 = (_5128 * (((_5079 * 0.9163600206375122f) + (_5078 * 0.07020000368356705f)) + (_5080 * 0.013450000435113907f))) + _5033;
                      float _5134 = (_5128 * (((_5079 * 0.10958000272512436f) + (_5078 * 0.02061999961733818f)) + (_5080 * 0.8697999715805054f))) + _5034;
                      float _5138 = (_5127 * _5102) + _5029;
                      float _5139 = (_5127 * _5103) + _5030;
                      float _5140 = (_5127 * _5104) + _5031;
                      float _5141 = _5127 + _5035;
                      if ((uint)(_5036 + 1) < (uint)4) {
                        _5029 = _5138;
                        _5030 = _5139;
                        _5031 = _5140;
                        _5032 = _5132;
                        _5033 = _5133;
                        _5034 = _5134;
                        _5035 = _5141;
                        _5036 = (_5036 + 1);
                        continue;
                      } else {
                        _5145 = _5138;
                        _5146 = _5139;
                        _5147 = _5140;
                        _5148 = _5132;
                        _5149 = _5133;
                        _5150 = _5134;
                        _5151 = _5141;
                      }
                    } else {
                      _5145 = _5029;
                      _5146 = _5030;
                      _5147 = _5031;
                      _5148 = _5032;
                      _5149 = _5033;
                      _5150 = _5034;
                      _5151 = _5035;
                    }
                    if (_5151 > 0.0f) {
                      float _5154 = 1.0f / _5151;
                      _5162 = (_5154 * _5145);
                      _5163 = (_5154 * _5146);
                      _5164 = (_5154 * _5147);
                      _5165 = 0.800000011920929f;
                      _5166 = (_5154 * _5148);
                      _5167 = (_5154 * _5149);
                      _5168 = (_5154 * _5150);
                      _5169 = 0.0010000000474974513f;
                      _5170 = true;
                      _5171 = 1.0f;
                    } else {
                      _5162 = _5145;
                      _5163 = _5146;
                      _5164 = _5147;
                      _5165 = 0.0f;
                      _5166 = _5148;
                      _5167 = _5149;
                      _5168 = _5150;
                      _5169 = 0.0f;
                      _5170 = false;
                      _5171 = _4782;
                    }
                    break;
                  }
                } else {
                  _5162 = 0.0f;
                  _5163 = 0.0f;
                  _5164 = 0.0f;
                  _5165 = 0.0f;
                  _5166 = 0.0f;
                  _5167 = 0.0f;
                  _5168 = 0.0f;
                  _5169 = 0.0f;
                  _5170 = false;
                  _5171 = _4782;
                }
              } else {
                _5162 = 0.0f;
                _5163 = 0.0f;
                _5164 = 0.0f;
                _5165 = 0.0f;
                _5166 = 0.0f;
                _5167 = 0.0f;
                _5168 = 0.0f;
                _5169 = 0.0f;
                _5170 = false;
                _5171 = _4782;
              }
              float _5173 = min(0.05000000074505806f, (_4753 * 0.019999999552965164f));
              float _5177 = (_5173 * _5162) + _4742;
              float _5178 = (_5173 * _5163) + _4743;
              float _5179 = (_5173 * _5164) + _4744;
              float _5182 = _5177 + _viewPos.x;
              float _5183 = _5178 + _viewPos.y;
              float _5184 = _5179 + _viewPos.z;
              float _5189 = _5182 - (_staticShadowPosition[1].x);
              float _5190 = _5183 - (_staticShadowPosition[1].y);
              float _5191 = _5184 - (_staticShadowPosition[1].z);
              float _5211 = mad((_shadowProjRelativeTexScale[1][0].z), _5191, mad((_shadowProjRelativeTexScale[1][0].y), _5190, (_5189 * (_shadowProjRelativeTexScale[1][0].x)))) + (_shadowProjRelativeTexScale[1][0].w);
              float _5215 = mad((_shadowProjRelativeTexScale[1][1].z), _5191, mad((_shadowProjRelativeTexScale[1][1].y), _5190, (_5189 * (_shadowProjRelativeTexScale[1][1].x)))) + (_shadowProjRelativeTexScale[1][1].w);
              float _5222 = 2.0f / _shadowSizeAndInvSize.y;
              float _5223 = 1.0f - _5222;
              bool _5230 = ((((((!(_5211 <= _5223))) || ((!(_5211 >= _5222))))) || ((!(_5215 <= _5223))))) || ((!(_5215 >= _5222)));
              float _5239 = _5182 - (_staticShadowPosition[0].x);
              float _5240 = _5183 - (_staticShadowPosition[0].y);
              float _5241 = _5184 - (_staticShadowPosition[0].z);
              float _5261 = mad((_shadowProjRelativeTexScale[0][0].z), _5241, mad((_shadowProjRelativeTexScale[0][0].y), _5240, ((_shadowProjRelativeTexScale[0][0].x) * _5239))) + (_shadowProjRelativeTexScale[0][0].w);
              float _5265 = mad((_shadowProjRelativeTexScale[0][1].z), _5241, mad((_shadowProjRelativeTexScale[0][1].y), _5240, ((_shadowProjRelativeTexScale[0][1].x) * _5239))) + (_shadowProjRelativeTexScale[0][1].w);
              bool _5276 = ((((((!(_5261 <= _5223))) || ((!(_5261 >= _5222))))) || ((!(_5265 <= _5223))))) || ((!(_5265 >= _5222)));
              float _5277 = select(_5276, select(_5230, 0.0f, _5211), _5261);
              float _5278 = select(_5276, select(_5230, 0.0f, _5215), _5265);
              float _5279 = select(_5276, select(_5230, 0.0f, (mad((_shadowProjRelativeTexScale[1][2].z), _5191, mad((_shadowProjRelativeTexScale[1][2].y), _5190, (_5189 * (_shadowProjRelativeTexScale[1][2].x)))) + (_shadowProjRelativeTexScale[1][2].w))), (mad((_shadowProjRelativeTexScale[0][2].z), _5241, mad((_shadowProjRelativeTexScale[0][2].y), _5240, ((_shadowProjRelativeTexScale[0][2].x) * _5239))) + (_shadowProjRelativeTexScale[0][2].w)));
              int _5280 = select(_5276, select(_5230, -1, 1), 0);
              [branch]
              if (!(_5280 == -1)) {
                float _5286 = (_5277 * _shadowSizeAndInvSize.x) + -0.5f;
                float _5287 = (_5278 * _shadowSizeAndInvSize.y) + -0.5f;
                int _5290 = int(floor(_5286));
                int _5291 = int(floor(_5287));
                if (!((((uint)_5290 > (uint)(int)(uint(_shadowSizeAndInvSize.x)))) || (((uint)_5291 > (uint)(int)(uint(_shadowSizeAndInvSize.y)))))) {
                  float4 _5301 = __3__36__0__0__g_shadowDepthArray.Load(int4(_5290, _5291, _5280, 0));
                  float4 _5303 = __3__36__0__0__g_shadowDepthArray.Load(int4(((int)((uint)(_5290) + 1u)), _5291, _5280, 0));
                  float4 _5305 = __3__36__0__0__g_shadowDepthArray.Load(int4(_5290, ((int)((uint)(_5291) + 1u)), _5280, 0));
                  float4 _5307 = __3__36__0__0__g_shadowDepthArray.Load(int4(((int)((uint)(_5290) + 1u)), ((int)((uint)(_5291) + 1u)), _5280, 0));
                  half4 _5311 = __3__36__0__0__g_shadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5277, _5278, float((uint)(uint)(_5280))), 0.0f);
                  _5317 = _5301.x;
                  _5318 = _5303.x;
                  _5319 = _5305.x;
                  _5320 = _5307.x;
                  _5321 = _5311.x;
                  _5322 = _5311.y;
                  _5323 = _5311.z;
                  _5324 = _5311.w;
                } else {
                  _5317 = 0.0f;
                  _5318 = 0.0f;
                  _5319 = 0.0f;
                  _5320 = 0.0f;
                  _5321 = 1.0h;
                  _5322 = 1.0h;
                  _5323 = 1.0h;
                  _5324 = 1.0h;
                }
                float _5350 = (float4(_invShadowViewProj[_5280][0][0], _invShadowViewProj[_5280][1][0], _invShadowViewProj[_5280][2][0], _invShadowViewProj[_5280][3][0]).x) * _5277;
                float _5354 = (float4(_invShadowViewProj[_5280][0][0], _invShadowViewProj[_5280][1][0], _invShadowViewProj[_5280][2][0], _invShadowViewProj[_5280][3][0]).y) * _5277;
                float _5358 = (float4(_invShadowViewProj[_5280][0][0], _invShadowViewProj[_5280][1][0], _invShadowViewProj[_5280][2][0], _invShadowViewProj[_5280][3][0]).z) * _5277;
                float _5362 = (float4(_invShadowViewProj[_5280][0][0], _invShadowViewProj[_5280][1][0], _invShadowViewProj[_5280][2][0], _invShadowViewProj[_5280][3][0]).w) * _5277;
                float _5365 = mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).w), _5317, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).w), _5278, _5362)) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).w);
                float _5366 = (mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).x), _5317, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).x), _5278, _5350)) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).x)) / _5365;
                float _5367 = (mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).y), _5317, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).y), _5278, _5354)) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).y)) / _5365;
                float _5368 = (mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).z), _5317, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).z), _5278, _5358)) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).z)) / _5365;
                float _5371 = _5277 + (_shadowSizeAndInvSize.z * 4.0f);
                float _5387 = mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).w), _5318, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).w), _5278, ((float4(_invShadowViewProj[_5280][0][0], _invShadowViewProj[_5280][1][0], _invShadowViewProj[_5280][2][0], _invShadowViewProj[_5280][3][0]).w) * _5371))) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).w);
                float _5393 = _5278 - (_shadowSizeAndInvSize.w * 2.0f);
                float _5405 = mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).w), _5319, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).w), _5393, _5362)) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).w);
                float _5409 = ((mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).x), _5319, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).x), _5393, _5350)) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).x)) / _5405) - _5366;
                float _5410 = ((mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).y), _5319, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).y), _5393, _5354)) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).y)) / _5405) - _5367;
                float _5411 = ((mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).z), _5319, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).z), _5393, _5358)) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).z)) / _5405) - _5368;
                float _5412 = ((mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).x), _5318, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).x), _5278, ((float4(_invShadowViewProj[_5280][0][0], _invShadowViewProj[_5280][1][0], _invShadowViewProj[_5280][2][0], _invShadowViewProj[_5280][3][0]).x) * _5371))) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).x)) / _5387) - _5366;
                float _5413 = ((mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).y), _5318, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).y), _5278, ((float4(_invShadowViewProj[_5280][0][0], _invShadowViewProj[_5280][1][0], _invShadowViewProj[_5280][2][0], _invShadowViewProj[_5280][3][0]).y) * _5371))) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).y)) / _5387) - _5367;
                float _5414 = ((mad((float4(_invShadowViewProj[_5280][0][2], _invShadowViewProj[_5280][1][2], _invShadowViewProj[_5280][2][2], _invShadowViewProj[_5280][3][2]).z), _5318, mad((float4(_invShadowViewProj[_5280][0][1], _invShadowViewProj[_5280][1][1], _invShadowViewProj[_5280][2][1], _invShadowViewProj[_5280][3][1]).z), _5278, ((float4(_invShadowViewProj[_5280][0][0], _invShadowViewProj[_5280][1][0], _invShadowViewProj[_5280][2][0], _invShadowViewProj[_5280][3][0]).z) * _5371))) + (float4(_invShadowViewProj[_5280][0][3], _invShadowViewProj[_5280][1][3], _invShadowViewProj[_5280][2][3], _invShadowViewProj[_5280][3][3]).z)) / _5387) - _5368;
                float _5417 = (_5411 * _5413) - (_5410 * _5414);
                float _5420 = (_5409 * _5414) - (_5411 * _5412);
                float _5423 = (_5410 * _5412) - (_5409 * _5413);
                float _5425 = rsqrt(dot(float3(_5417, _5420, _5423), float3(_5417, _5420, _5423)));
                float _5426 = _5417 * _5425;
                float _5427 = _5420 * _5425;
                float _5428 = _5423 * _5425;
                float _5429 = frac(_5286);
                float _5434 = (saturate(dot(float3(_813, _814, _815), float3(_5426, _5427, _5428))) * 0.0020000000949949026f) + _5279;
                float _5447 = saturate(exp2((_5317 - _5434) * 1442695.0f));
                float _5449 = saturate(exp2((_5319 - _5434) * 1442695.0f));
                float _5455 = ((saturate(exp2((_5318 - _5434) * 1442695.0f)) - _5447) * _5429) + _5447;
                _5462 = _5426;
                _5463 = _5427;
                _5464 = _5428;
                _5465 = saturate((((_5449 - _5455) + ((saturate(exp2((_5320 - _5434) * 1442695.0f)) - _5449) * _5429)) * frac(_5287)) + _5455);
                _5466 = _5317;
                _5467 = _5318;
                _5468 = _5319;
                _5469 = _5320;
                _5470 = _5321;
                _5471 = _5322;
                _5472 = _5323;
                _5473 = _5324;
              } else {
                _5462 = 0.0f;
                _5463 = 0.0f;
                _5464 = 0.0f;
                _5465 = 0.0f;
                _5466 = 0.0f;
                _5467 = 0.0f;
                _5468 = 0.0f;
                _5469 = 0.0f;
                _5470 = 0.0h;
                _5471 = 0.0h;
                _5472 = 0.0h;
                _5473 = 0.0h;
              }
              float _5493 = mad((_dynamicShadowProjRelativeTexScale[1][0].z), _5179, mad((_dynamicShadowProjRelativeTexScale[1][0].y), _5178, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _5177))) + (_dynamicShadowProjRelativeTexScale[1][0].w);
              float _5497 = mad((_dynamicShadowProjRelativeTexScale[1][1].z), _5179, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _5178, ((_dynamicShadowProjRelativeTexScale[1][1].x) * _5177))) + (_dynamicShadowProjRelativeTexScale[1][1].w);
              float _5501 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _5179, mad((_dynamicShadowProjRelativeTexScale[1][2].y), _5178, ((_dynamicShadowProjRelativeTexScale[1][2].x) * _5177))) + (_dynamicShadowProjRelativeTexScale[1][2].w);
              float _5504 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
              float _5505 = 1.0f - _5504;
              if (!(((((!(_5493 <= _5505))) || ((!(_5493 >= _5504))))) || ((!(_5497 <= _5505))))) {
                bool _5516 = ((_5501 >= -1.0f)) && ((((_5501 <= 1.0f)) && ((_5497 >= _5504))));
                _5524 = select(_5516, 9.999999747378752e-06f, -9.999999747378752e-05f);
                _5525 = select(_5516, _5493, _5277);
                _5526 = select(_5516, _5497, _5278);
                _5527 = select(_5516, _5501, _5279);
                _5528 = select(_5516, 1, _5280);
                _5529 = ((int)(uint)((int)(_5516)));
              } else {
                _5524 = -9.999999747378752e-05f;
                _5525 = _5277;
                _5526 = _5278;
                _5527 = _5279;
                _5528 = _5280;
                _5529 = 0;
              }
              float _5549 = mad((_dynamicShadowProjRelativeTexScale[0][0].z), _5179, mad((_dynamicShadowProjRelativeTexScale[0][0].y), _5178, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _5177))) + (_dynamicShadowProjRelativeTexScale[0][0].w);
              float _5553 = mad((_dynamicShadowProjRelativeTexScale[0][1].z), _5179, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _5178, ((_dynamicShadowProjRelativeTexScale[0][1].x) * _5177))) + (_dynamicShadowProjRelativeTexScale[0][1].w);
              float _5557 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _5179, mad((_dynamicShadowProjRelativeTexScale[0][2].y), _5178, ((_dynamicShadowProjRelativeTexScale[0][2].x) * _5177))) + (_dynamicShadowProjRelativeTexScale[0][2].w);
              if (!(((((!(_5549 <= _5505))) || ((!(_5549 >= _5504))))) || ((!(_5553 <= _5505))))) {
                bool _5568 = ((_5557 >= -1.0f)) && ((((_5553 >= _5504)) && ((_5557 <= 1.0f))));
                _5576 = select(_5568, 9.999999747378752e-06f, _5524);
                _5577 = select(_5568, _5549, _5525);
                _5578 = select(_5568, _5553, _5526);
                _5579 = select(_5568, _5557, _5527);
                _5580 = select(_5568, 0, _5528);
                _5581 = select(_5568, 1, _5529);
              } else {
                _5576 = _5524;
                _5577 = _5525;
                _5578 = _5526;
                _5579 = _5527;
                _5580 = _5528;
                _5581 = _5529;
              }
              [branch]
              if (!(_5581 == 0)) {
                int _5591 = int(floor((_5577 * _dynmaicShadowSizeAndInvSize.x) + -0.5f));
                int _5592 = int(floor((_5578 * _dynmaicShadowSizeAndInvSize.y) + -0.5f));
                if (!((((uint)_5591 > (uint)(int)(uint(_dynmaicShadowSizeAndInvSize.x)))) || (((uint)_5592 > (uint)(int)(uint(_dynmaicShadowSizeAndInvSize.y)))))) {
                  float4 _5602 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_5591, _5592, _5580, 0));
                  float4 _5604 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_5591) + 1u)), _5592, _5580, 0));
                  float4 _5606 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_5591, ((int)((uint)(_5592) + 1u)), _5580, 0));
                  float4 _5608 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_5591) + 1u)), ((int)((uint)(_5592) + 1u)), _5580, 0));
                  _5611 = _5602.x;
                  _5612 = _5604.x;
                  _5613 = _5606.x;
                  _5614 = _5608.x;
                } else {
                  _5611 = _5466;
                  _5612 = _5467;
                  _5613 = _5468;
                  _5614 = _5469;
                }
                float _5640 = (float4(_invDynamicShadowViewProj[_5580][0][0], _invDynamicShadowViewProj[_5580][1][0], _invDynamicShadowViewProj[_5580][2][0], _invDynamicShadowViewProj[_5580][3][0]).x) * _5577;
                float _5644 = (float4(_invDynamicShadowViewProj[_5580][0][0], _invDynamicShadowViewProj[_5580][1][0], _invDynamicShadowViewProj[_5580][2][0], _invDynamicShadowViewProj[_5580][3][0]).y) * _5577;
                float _5648 = (float4(_invDynamicShadowViewProj[_5580][0][0], _invDynamicShadowViewProj[_5580][1][0], _invDynamicShadowViewProj[_5580][2][0], _invDynamicShadowViewProj[_5580][3][0]).z) * _5577;
                float _5652 = (float4(_invDynamicShadowViewProj[_5580][0][0], _invDynamicShadowViewProj[_5580][1][0], _invDynamicShadowViewProj[_5580][2][0], _invDynamicShadowViewProj[_5580][3][0]).w) * _5577;
                float _5655 = mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).w), _5611, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).w), _5578, _5652)) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).w);
                float _5656 = (mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).x), _5611, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).x), _5578, _5640)) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).x)) / _5655;
                float _5657 = (mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).y), _5611, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).y), _5578, _5644)) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).y)) / _5655;
                float _5658 = (mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).z), _5611, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).z), _5578, _5648)) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).z)) / _5655;
                float _5661 = _5577 + (_dynmaicShadowSizeAndInvSize.z * 8.0f);
                float _5677 = mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).w), _5612, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).w), _5578, ((float4(_invDynamicShadowViewProj[_5580][0][0], _invDynamicShadowViewProj[_5580][1][0], _invDynamicShadowViewProj[_5580][2][0], _invDynamicShadowViewProj[_5580][3][0]).w) * _5661))) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).w);
                float _5683 = _5578 - (_dynmaicShadowSizeAndInvSize.w * 4.0f);
                float _5695 = mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).w), _5613, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).w), _5683, _5652)) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).w);
                float _5699 = ((mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).x), _5613, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).x), _5683, _5640)) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).x)) / _5695) - _5656;
                float _5700 = ((mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).y), _5613, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).y), _5683, _5644)) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).y)) / _5695) - _5657;
                float _5701 = ((mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).z), _5613, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).z), _5683, _5648)) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).z)) / _5695) - _5658;
                float _5702 = ((mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).x), _5612, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).x), _5578, ((float4(_invDynamicShadowViewProj[_5580][0][0], _invDynamicShadowViewProj[_5580][1][0], _invDynamicShadowViewProj[_5580][2][0], _invDynamicShadowViewProj[_5580][3][0]).x) * _5661))) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).x)) / _5677) - _5656;
                float _5703 = ((mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).y), _5612, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).y), _5578, ((float4(_invDynamicShadowViewProj[_5580][0][0], _invDynamicShadowViewProj[_5580][1][0], _invDynamicShadowViewProj[_5580][2][0], _invDynamicShadowViewProj[_5580][3][0]).y) * _5661))) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).y)) / _5677) - _5657;
                float _5704 = ((mad((float4(_invDynamicShadowViewProj[_5580][0][2], _invDynamicShadowViewProj[_5580][1][2], _invDynamicShadowViewProj[_5580][2][2], _invDynamicShadowViewProj[_5580][3][2]).z), _5612, mad((float4(_invDynamicShadowViewProj[_5580][0][1], _invDynamicShadowViewProj[_5580][1][1], _invDynamicShadowViewProj[_5580][2][1], _invDynamicShadowViewProj[_5580][3][1]).z), _5578, ((float4(_invDynamicShadowViewProj[_5580][0][0], _invDynamicShadowViewProj[_5580][1][0], _invDynamicShadowViewProj[_5580][2][0], _invDynamicShadowViewProj[_5580][3][0]).z) * _5661))) + (float4(_invDynamicShadowViewProj[_5580][0][3], _invDynamicShadowViewProj[_5580][1][3], _invDynamicShadowViewProj[_5580][2][3], _invDynamicShadowViewProj[_5580][3][3]).z)) / _5677) - _5658;
                float _5707 = (_5701 * _5703) - (_5700 * _5704);
                float _5710 = (_5699 * _5704) - (_5701 * _5702);
                float _5713 = (_5700 * _5702) - (_5699 * _5703);
                float _5715 = rsqrt(dot(float3(_5707, _5710, _5713), float3(_5707, _5710, _5713)));
                if ((_4909) || ((!(_4909)) && (_sunDirection.y > _moonDirection.y))) {
                  _5730 = _sunDirection.x;
                  _5731 = _sunDirection.y;
                  _5732 = _sunDirection.z;
                } else {
                  _5730 = _moonDirection.x;
                  _5731 = _moonDirection.y;
                  _5732 = _moonDirection.z;
                }
                float _5738 = (_5576 - (saturate(-0.0f - dot(float3(_5730, _5731, _5732), float3(_813, _814, _815))) * 9.999999747378752e-05f)) + _5579;
                _5751 = (_5707 * _5715);
                _5752 = (_5710 * _5715);
                _5753 = (_5713 * _5715);
                _5754 = min(float((bool)(uint)(_5611 > _5738)), min(min(float((bool)(uint)(_5612 > _5738)), float((bool)(uint)(_5613 > _5738))), float((bool)(uint)(_5614 > _5738))));
              } else {
                _5751 = _5462;
                _5752 = _5463;
                _5753 = _5464;
                _5754 = _5465;
              }
              float _5762 = (_viewPos.x - _shadowRelativePosition.x) + _5177;
              float _5763 = (_viewPos.y - _shadowRelativePosition.y) + _5178;
              float _5764 = (_viewPos.z - _shadowRelativePosition.z) + _5179;
              float _5784 = mad((_terrainShadowProjRelativeTexScale[0].z), _5764, mad((_terrainShadowProjRelativeTexScale[0].y), _5763, (_5762 * (_terrainShadowProjRelativeTexScale[0].x)))) + (_terrainShadowProjRelativeTexScale[0].w);
              float _5788 = mad((_terrainShadowProjRelativeTexScale[1].z), _5764, mad((_terrainShadowProjRelativeTexScale[1].y), _5763, (_5762 * (_terrainShadowProjRelativeTexScale[1].x)))) + (_terrainShadowProjRelativeTexScale[1].w);
              float _5792 = mad((_terrainShadowProjRelativeTexScale[2].z), _5764, mad((_terrainShadowProjRelativeTexScale[2].y), _5763, (_5762 * (_terrainShadowProjRelativeTexScale[2].x)))) + (_terrainShadowProjRelativeTexScale[2].w);
              if (saturate(_5784) == _5784) {
                if (((_5792 >= 9.999999747378752e-05f)) && ((((_5792 <= 1.0f)) && ((saturate(_5788) == _5788))))) {
                  float _5807 = frac((_5784 * 1024.0f) + -0.5f);
                  float4 _5811 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_5784, _5788));
                  float _5816 = _5792 + -0.004999999888241291f;
                  float _5821 = select((_5811.w > _5816), 1.0f, 0.0f);
                  float _5823 = select((_5811.x > _5816), 1.0f, 0.0f);
                  float _5830 = ((select((_5811.z > _5816), 1.0f, 0.0f) - _5821) * _5807) + _5821;
                  _5836 = saturate((((((select((_5811.y > _5816), 1.0f, 0.0f) - _5823) * _5807) + _5823) - _5830) * frac((_5788 * 1024.0f) + -0.5f)) + _5830);
                } else {
                  _5836 = 1.0f;
                }
              } else {
                _5836 = 1.0f;
              }
              half _5838 = saturate(_5470);
              half _5839 = saturate(_5471);
              half _5840 = saturate(_5472);
              half _5854 = ((_5839 * 0.3395996h) + (_5838 * 0.61328125h)) + (_5840 * 0.04736328h);
              half _5855 = ((_5839 * 0.9165039h) + (_5838 * 0.07019043h)) + (_5840 * 0.013450623h);
              half _5856 = ((_5839 * 0.109558105h) + (_5838 * 0.020614624h)) + (_5840 * 0.8696289h);
              if ((_4909) || ((!(_4909)) && (_sunDirection.y > _moonDirection.y))) {
                _5868 = _sunDirection.x;
                _5869 = _sunDirection.y;
                _5870 = _sunDirection.z;
              } else {
                _5868 = _moonDirection.x;
                _5869 = _moonDirection.y;
                _5870 = _moonDirection.z;
              }
              if ((_4909) || ((!(_4909)) && (_sunDirection.y > _moonDirection.y))) {
                _5890 = _precomputedAmbient7.y;
              } else {
                _5890 = ((0.5f - (dot(float3(_sunDirection.x, _sunDirection.y, _sunDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)) * 0.5f)) * _precomputedAmbient7.w);
              }
              float _5893 = _5183 + _earthRadius;
              float _5897 = (_5179 * _5179) + (_5177 * _5177);
              float _5899 = sqrt((_5893 * _5893) + _5897);
              float _5904 = dot(float3((_5177 / _5899), (_5893 / _5899), (_5179 / _5899)), float3(_5868, _5869, _5870));
              float _5909 = min(max(((_5899 - _earthRadius) / _atmosphereThickness), 16.0f), (_atmosphereThickness + -16.0f));
              float _5917 = max(_5909, 0.0f);
              float _5924 = (-0.0f - sqrt((_5917 + (_earthRadius * 2.0f)) * _5917)) / (_5917 + _earthRadius);
              if (_5904 > _5924) {
                _5947 = ((exp2(log2(saturate((_5904 - _5924) / (1.0f - _5924))) * 0.20000000298023224f) * 0.4921875f) + 0.50390625f);
              } else {
                _5947 = ((exp2(log2(saturate((_5924 - _5904) / (_5924 + 1.0f))) * 0.20000000298023224f) * 0.4921875f) + 0.00390625f);
              }
              float2 _5951 = __3__36__0__0__g_texNetDensity.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(((exp2(log2(saturate((_5909 + -16.0f) / (_atmosphereThickness + -32.0f))) * 0.5f) * 0.96875f) + 0.015625f), _5947), 0.0f);
              float _5973 = ((_5951.y * 1.9999999494757503e-05f) * _mieAerosolDensity) * (_mieAerosolAbsorption + 1.0f);
              float _5991 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 16) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 2.05560013455397e-06f)) * _5951.x) + _5973) * -1.4426950216293335f);
              float _5992 = exp2(((((float((uint)((uint)(((uint)((uint)(_rayleighScatteringColor)) >> 8) & 255))) * 1.960784317134312e-07f) + (_ozoneRatio * 4.978800461685751e-06f)) * _5951.x) + _5973) * -1.4426950216293335f);
              float _5993 = exp2(((((_ozoneRatio * 2.1360001767334325e-07f) + (float((uint)((uint)(_rayleighScatteringColor & 255))) * 1.960784317134312e-07f)) * _5951.x) + _5973) * -1.4426950216293335f);
              float _6009 = sqrt(_5897);
              float _6017 = (_cloudAltitude - (max(((_6009 * _6009) + -4e+05f), 0.0f) * 9.999999974752427e-07f)) - _viewPos.y;
              float _6029 = (_cloudThickness * (0.5f - (float((int)(((int)(uint)((int)(_5869 > 0.0f))) - ((int)(uint)((int)(_5869 < 0.0f))))) * 0.5f))) + _6017;
              if (_5178 < _6017) {
                float _6032 = dot(float3(0.0f, 1.0f, 0.0f), float3(_5868, _5869, _5870));
                float _6038 = select((abs(_6032) < 9.99999993922529e-09f), 1e+08f, ((_6029 - dot(float3(0.0f, 1.0f, 0.0f), float3(_5177, _5178, _5179))) / _6032));
                _6044 = ((_6038 * _5868) + _5177);
                _6045 = _6029;
                _6046 = ((_6038 * _5870) + _5179);
              } else {
                _6044 = _5177;
                _6045 = _5178;
                _6046 = _5179;
              }
              float _6055 = __3__36__0__0__g_texCloudVolumeShadow.SampleLevel(__0__4__0__0__g_staticBilinearWrapUWClampV, float3(((_6044 * 4.999999873689376e-05f) + 0.5f), ((_6045 - _6017) / _cloudThickness), ((_6046 * 4.999999873689376e-05f) + 0.5f)), 0.0f);
              float _6066 = saturate(abs(_5869) * 4.0f);
              float _6068 = (_6066 * _6066) * exp2(((_distanceScale * -1.4426950216293335f) * _6055.x) * (_cloudScatteringCoefficient / _distanceScale));
              float _6075 = ((1.0f - _6068) * saturate(((_5178 - _cloudThickness) - _6017) * 0.10000000149011612f)) + _6068;
              float _6076 = _6075 * (((_5992 * 0.3395099937915802f) + (_5991 * 0.6131200194358826f)) + (_5993 * 0.047370001673698425f));
              float _6077 = _6075 * (((_5992 * 0.9163600206375122f) + (_5991 * 0.07020000368356705f)) + (_5993 * 0.013450000435113907f));
              float _6078 = _6075 * (((_5992 * 0.10958000272512436f) + (_5991 * 0.02061999961733818f)) + (_5993 * 0.8697999715805054f));
              float _6094 = float(saturate(_5473));
              if (_5170) {
                bool _6096 = (_5165 > 0.0f);
                if (_5169 > 0.0f) {
                  _6107 = half(_5166);
                  _6108 = half(_5167);
                  _6109 = half(_5168);
                  _6110 = dot(float3(select(_6096, _5162, _5751), select(_6096, _5163, _5752), select(_6096, _5164, _5753)), float3(_5868, _5869, _5870));
                } else {
                  _6107 = _5854;
                  _6108 = _5855;
                  _6109 = _5856;
                  _6110 = _6094;
                }
              } else {
                _6107 = _5854;
                _6108 = _5855;
                _6109 = _5856;
                _6110 = _6094;
              }
              float _6114 = float(half(saturate(_6110) * 0.31830987334251404f));
              float _6120 = ((min(_5754, _5836) * _5171) * _5890) * _renderParams2.z;
              _6134 = ((((_6120 * (((_6076 * 0.6131200194358826f) + (_6077 * 0.3395099937915802f)) + (_6078 * 0.047370001673698425f))) * float(_6107)) * _6114) + _4748);
              _6135 = ((((_6120 * (((_6076 * 0.07020000368356705f) + (_6077 * 0.9163600206375122f)) + (_6078 * 0.013450000435113907f))) * float(_6108)) * _6114) + _4749);
              _6136 = ((((_6120 * (((_6076 * 0.02061999961733818f) + (_6077 * 0.10958000272512436f)) + (_6078 * 0.8697999715805054f))) * float(_6109)) * _6114) + _4750);
              break;
            }
            break;
          }
        } else {
          _6134 = _4748;
          _6135 = _4749;
          _6136 = _4750;
        }
        float _6137 = dot(float3(_6134, _6135, _6136), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
        float _6138 = min(_856, _6137);
        float _6142 = max(9.999999717180685e-10f, _6137);
        _6147 = ((_6138 * _6134) / _6142);
        _6148 = ((_6138 * _6135) / _6142);
        _6149 = ((_6138 * _6136) / _6142);
        _6150 = (_4737 * _renderParams.y);
        _6151 = _4753;
        _6152 = _4742;
        _6153 = _4743;
        _6154 = _4744;
      } else {
        _6147 = _3355;
        _6148 = _3356;
        _6149 = _3357;
        _6150 = _3330;
        _6151 = _3324;
        _6152 = _3331;
        _6153 = _3332;
        _6154 = _3333;
      }
      break;
    }
  } else {
    _6147 = _3355;
    _6148 = _3356;
    _6149 = _3357;
    _6150 = _3330;
    _6151 = _3324;
    _6152 = _3331;
    _6153 = _3332;
    _6154 = _3333;
  }
  if (((_3401 > 0.0f)) && ((_6150 < 1.0f))) {
    _6175 = ((_6150 * (_6147 - _3398)) + _3398);
    _6176 = ((_6150 * (_6148 - _3399)) + _3399);
    _6177 = ((_6150 * (_6149 - _3400)) + _3400);
    _6178 = 10000.0f;
    _6179 = ((_813 * 10000.0f) + _156);
    _6180 = ((_814 * 10000.0f) + _157);
    _6181 = ((_815 * 10000.0f) + _158);
  } else {
    _6175 = _6147;
    _6176 = _6148;
    _6177 = _6149;
    _6178 = _6151;
    _6179 = _6152;
    _6180 = _6153;
    _6181 = _6154;
  }
  if (((_6178 > 128.0f)) && ((dot(float3(_6175, _6176, _6177), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) == 0.0f))) {
    _6188 = 1;
    while(true) {
      int _6228 = int(floor(((_wrappedViewPos.x + _6179) * ((_clipmapOffsets[_6188]).w)) + ((_clipmapRelativeIndexOffsets[_6188]).x)));
      int _6229 = int(floor(((_wrappedViewPos.y + _6180) * ((_clipmapOffsets[_6188]).w)) + ((_clipmapRelativeIndexOffsets[_6188]).y)));
      int _6230 = int(floor(((_wrappedViewPos.z + _6181) * ((_clipmapOffsets[_6188]).w)) + ((_clipmapRelativeIndexOffsets[_6188]).z)));
      if (!((((((((int)_6228 >= (int)int(((_clipmapOffsets[_6188]).x) + -63.0f))) && (((int)_6228 < (int)int(((_clipmapOffsets[_6188]).x) + 63.0f))))) && (((((int)_6229 >= (int)int(((_clipmapOffsets[_6188]).y) + -31.0f))) && (((int)_6229 < (int)int(((_clipmapOffsets[_6188]).y) + 31.0f))))))) && (((((int)_6230 >= (int)int(((_clipmapOffsets[_6188]).z) + -63.0f))) && (((int)_6230 < (int)int(((_clipmapOffsets[_6188]).z) + 63.0f))))))) {
        if ((uint)(_6188 + 1) < (uint)8) {
          _6188 = (_6188 + 1);
          continue;
        } else {
          _6246 = -10000;
        }
      } else {
        _6246 = _6188;
      }
      if (!((uint)_6246 > (uint)3)) {
        float _6266 = 1.0f / float((uint)(1u << (_6246 & 31)));
        float _6270 = frac(((_invClipmapExtent.z * _6181) + _clipmapUVRelativeOffset.z) * _6266);
        float _6282 = __3__36__0__1__g_skyVisibilityVoxelsTexturesLikeUav.SampleLevel(__0__4__0__0__g_staticVoxelSampler, float3((((_invClipmapExtent.x * _6179) + _clipmapUVRelativeOffset.x) * _6266), (((_invClipmapExtent.y * _6180) + _clipmapUVRelativeOffset.y) * _6266), (((float((uint)(_6246 * 66)) + 1.0f) + ((select((_6270 < 0.0f), 1.0f, 0.0f) + _6270) * 64.0f)) * 0.0037878789007663727f)), 0.0f);
        _6287 = saturate(1.0f - _6282.x);
      } else {
        _6287 = 1.0f;
      }
      bool _6288 = (_1001 == 0.0f);
      float4 _6296 = __3__36__0__0__g_environmentColor.SampleLevel(__3__40__0__0__g_samplerTrilinear, float3(select(_6288, (-0.0f - _813), _1005), select(_6288, _814, _1006), select(_6288, (-0.0f - _815), _1007)), 4.0f);
      float _6300 = _6296.x * _6287;
      float _6301 = _6296.y * _6287;
      float _6302 = _6296.z * _6287;
      float _6303 = dot(float3(_6300, _6301, _6302), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float _6304 = min(_856, _6303);
      float _6308 = max(9.999999717180685e-10f, _6303);
      _6319 = (((_6300 * _6304) / _6308) * select(_6288, 0.03125f, _1028));
      _6320 = (((_6301 * _6304) / _6308) * select(_6288, 0.03125f, _1029));
      _6321 = (((_6302 * _6304) / _6308) * select(_6288, 0.03125f, _1030));
      // [DAWN_DUSK_GI] Probe directional boost + energy floor
      if (DAWN_DUSK_IMPROVEMENTS == 1.f) {
        float _ddFactor = DawnDuskFactor(_sunDirection.y);
        float3 _ddAmbient = DawnDuskAmbientBoost(
          float3(_6319, _6320, _6321),
          float3(_802, _803, _804),
          _sunDirection.xyz,
          _ddFactor,
          _precomputedAmbient0.xyz);
        _6319 = _ddAmbient.x;
        _6320 = _ddAmbient.y;
        _6321 = _ddAmbient.z;
      }
      break;
    }
  } else {
    _6319 = _6175;
    _6320 = _6176;
    _6321 = _6177;
  }
  float _6325 = max(0.0f, _6319);
  float _6326 = max(0.0f, _6320);
  float _6327 = max(0.0f, _6321);
  float _6329 = min(-0.0f, (-0.0f - _344));
  bool _6333 = (_338 == 29);
  [branch]
  if (_lightingParams.y > 0.0f) {
    float2 _6340 = __3__36__0__0__g_sceneAO.Load(int3(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))), 0));
    float _6344 = select(((uint)(_338 & 24) > (uint)23), 1.0f, _6340.y);
    _6349 = (_6344 * _6325);
    _6350 = (_6344 * _6326);
    _6351 = (_6344 * _6327);
  } else {
    _6349 = _6325;
    _6350 = _6326;
    _6351 = _6327;
  }
  float4 _6353 = __3__38__0__1__g_specularResultUAV.Load(int2(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5))))));
  float _6360 = min(-9.999999974752427e-07f, (-0.0f - dot(float3(_6349, _6350, _6351), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f))));
  float _6361 = dot(float3(_6353.x, _6353.y, _6353.z), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
  float _6368 = ((_6361 * _6353.w) - ((saturate(dot(float3((_824 * _820), (_824 * _821), (_824 * _822)), float3(_813, _814, _815))) * _6178) * _6360)) * (1.0f / max(9.999999974752427e-07f, (_6361 - _6360)));
  bool _6370 = ((_338 == 24)) || (_6333);
  __3__38__0__1__g_specularResultUAV[int2(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))))] = float4((-0.0f - min(0.0f, (-0.0f - min(30000.0f, (_exposure4.x * (select(_6370, 0.0f, _6353.x) + _6349)))))), (-0.0f - min(0.0f, (-0.0f - min(30000.0f, (_exposure4.x * (select(_6370, 0.0f, _6353.y) + _6350)))))), (-0.0f - min(0.0f, (-0.0f - min(30000.0f, (_exposure4.x * (select(_6370, 0.0f, _6353.z) + _6351)))))), select((_lightingParams.w > 0.0f), _6368, select(_6333, _299, select((_302 > 0.20000000298023224f), _6329, (-0.0f - _6329)))));
  __3__38__0__1__g_specularRayHitDistanceUAV[int2(((int)((((uint)(((int)((uint)(_77) << 5)) & 2097120)) + SV_GroupThreadID.x) + ((uint)((_58 - (_59 << 2)) << 3)))), ((int)((((uint)(_59 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_77)) >> 16) << 5)))))] = _6368;
}