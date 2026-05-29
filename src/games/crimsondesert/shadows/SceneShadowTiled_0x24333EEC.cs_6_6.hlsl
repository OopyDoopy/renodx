#include "../shared.h"

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t35, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t230, space36);

Texture2DArray<uint2> __3__36__0__0__g_dynamicShadowStencilArray : register(t231, space36);

Texture2DArray<half4> __3__36__0__0__g_dynamicShadowColorArray : register(t232, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t233, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t15, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t43, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t18, space36);

Texture2D<float2> __3__36__0__0__g_raytracedShadow : register(t117, space36);

RWTexture2D<half4> __3__38__0__1__g_shadowColorResultUAV : register(u40, space38);

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

cbuffer __3__35__0__0__ShadowConstantBuffer : register(b19, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b31, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _shadowAOParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

SamplerComparisonState __3__40__0__0__g_samplerShadow : register(s0, space40);

static const int RAYTRACED_SHADOW_JITTER[16] = { 1, -3, -1, 3, 5, 1, -3, -5, -5, 5, -7, -1, 3, 7, 7, -7 };

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _18[4];
  float _26[2];
  float _27[2];
  float _28[2];
  _18[0] = ((g_tileIndex[(SV_GroupID.x) >> 7]).x);
  _18[1] = ((g_tileIndex[(SV_GroupID.x) >> 7]).y);
  _18[2] = ((g_tileIndex[(SV_GroupID.x) >> 7]).z);
  _18[3] = ((g_tileIndex[(SV_GroupID.x) >> 7]).w);
  int _42 = _18[(((uint)(SV_GroupID.x) >> 5) & 3)];
  int _46 = select((((int)(SV_GroupID.x) & 16) == 0), _42, ((uint)((uint)(_42)) >> 16));
  float _60 = float((uint)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x));
  float _61 = float((uint)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y));
  float _67 = (_60 + 0.5f) * _bufferSizeAndInvSize.z;
  float _68 = (_61 + 0.5f) * _bufferSizeAndInvSize.w;
  float _70 = (_67 * 2.0f) + -1.0f;
  float _72 = 1.0f - (_68 * 2.0f);
  uint _74 = __3__36__0__0__g_depthStencil.Load(int3(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)), 0));
  int _76 = (uint)((uint)(_74.x)) >> 24;
  float _79 = float((uint)((uint)(_74.x & 16777215))) * 5.960465188081798e-08f;
  int _80 = _76 & 127;
  uint _82 = __3__36__0__0__g_sceneNormal.Load(int3(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)), 0));
  float _98 = min(1.0f, ((float((uint)((uint)(_82.x & 1023))) * 0.001956947147846222f) + -1.0f));
  float _99 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_82.x)) >> 10) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _100 = min(1.0f, ((float((uint)((uint)(((uint)((uint)(_82.x)) >> 20) & 1023))) * 0.001956947147846222f) + -1.0f));
  float _102 = rsqrt(dot(float3(_98, _99, _100), float3(_98, _99, _100)));
  float _103 = _102 * _98;
  float _104 = _102 * _99;
  float _105 = _102 * _100;
  bool _107 = (_79 == 1.0f);
  int _377;
  float _556;
  float _630;
  int _631;
  float _632;
  float _696;
  int _697;
  int _698;
  float _699;
  float _761;
  int _762;
  int _763;
  float _812;
  int _813;
  int _814;
  int _974;
  float _1214;
  float _1215;
  bool _1216;
  half _1217;
  half _1218;
  half _1219;
  float _1454;
  float _1455;
  bool _1456;
  half _1457;
  half _1458;
  half _1459;
  half _1468;
  half _1469;
  half _1470;
  float _1471;
  float _1472;
  float _1473;
  float _1702;
  float _1703;
  bool _1704;
  half _1705;
  half _1706;
  half _1707;
  half _1716;
  half _1717;
  half _1718;
  float _1719;
  float _1720;
  float _1721;
  float _1950;
  float _1951;
  bool _1952;
  half _1953;
  half _1954;
  half _1955;
  half _1964;
  half _1965;
  half _1966;
  float _1967;
  float _1968;
  float _1969;
  float _2198;
  float _2199;
  bool _2200;
  half _2201;
  half _2202;
  half _2203;
  half _2212;
  half _2213;
  half _2214;
  float _2215;
  float _2216;
  float _2217;
  float _2446;
  float _2447;
  bool _2448;
  half _2449;
  half _2450;
  half _2451;
  half _2460;
  half _2461;
  half _2462;
  float _2463;
  float _2464;
  float _2465;
  float _2694;
  float _2695;
  bool _2696;
  half _2697;
  half _2698;
  half _2699;
  half _2708;
  half _2709;
  half _2710;
  float _2711;
  float _2712;
  float _2713;
  float _2942;
  float _2943;
  bool _2944;
  half _2945;
  half _2946;
  half _2947;
  half _2956;
  half _2957;
  half _2958;
  float _2959;
  float _2960;
  float _2961;
  float _3190;
  float _3191;
  bool _3192;
  half _3193;
  half _3194;
  half _3195;
  half _3204;
  half _3205;
  half _3206;
  float _3207;
  float _3208;
  float _3209;
  float _3438;
  float _3439;
  bool _3440;
  half _3441;
  half _3442;
  half _3443;
  half _3452;
  half _3453;
  half _3454;
  float _3455;
  float _3456;
  float _3457;
  float _3686;
  float _3687;
  bool _3688;
  half _3689;
  half _3690;
  half _3691;
  half _3700;
  half _3701;
  half _3702;
  float _3703;
  float _3704;
  float _3705;
  float _3934;
  float _3935;
  bool _3936;
  half _3937;
  half _3938;
  half _3939;
  half _3948;
  half _3949;
  half _3950;
  float _3951;
  float _3952;
  float _3953;
  float _4182;
  float _4183;
  bool _4184;
  half _4185;
  half _4186;
  half _4187;
  half _4196;
  half _4197;
  half _4198;
  float _4199;
  float _4200;
  float _4201;
  float _4430;
  float _4431;
  bool _4432;
  half _4433;
  half _4434;
  half _4435;
  half _4444;
  half _4445;
  half _4446;
  float _4447;
  float _4448;
  float _4449;
  float _4678;
  float _4679;
  bool _4680;
  half _4681;
  half _4682;
  half _4683;
  half _4692;
  half _4693;
  half _4694;
  float _4695;
  float _4696;
  float _4697;
  float _4926;
  float _4927;
  bool _4928;
  half _4929;
  half _4930;
  half _4931;
  half _4940;
  half _4941;
  half _4942;
  float _4943;
  float _4944;
  float _4945;
  half _4983;
  half _4984;
  half _4985;
  float _5005;
  float _5006;
  int _5007;
  float _5108;
  int _5131;
  float _5234;
  float _5235;
  half _5236;
  half _5237;
  half _5238;
  float _5290;
  float _5291;
  float _5292;
  float _5392;
  float _5406;
  int _5578;
  float _5584;
  float _5597;
  float _5610;
  float _5620;
  float _5621;
  float _5622;
  float _5631;
  float _5632;
  float _5633;
  int _5782;
  float _5783;
  float _5784;
  float _5785;
  float _5786;
  float _5787;
  int _5788;
  float _5789;
  float _5790;
  bool _5853;
  int _5860;
  float _5879;
  int _5894;
  float _5895;
  float _5918;
  float _5919;
  float _5920;
  float _5921;
  float _5922;
  float _5926;
  int _6058;
  float _6059;
  float _6060;
  float _6061;
  float _6062;
  float _6063;
  int _6064;
  float _6065;
  float _6066;
  bool _6129;
  int _6136;
  float _6155;
  int _6170;
  float _6171;
  float _6194;
  float _6195;
  float _6196;
  float _6197;
  float _6198;
  float _6202;
  int _6212;
  float _6213;
  float _6214;
  float _6215;
  float _6216;
  float _6217;
  float _6298;
  float _6300;
  float _6324;
  float _6400;
  float _6403;
  float _6407;
  float _6422;
  float _6423;
  float _6424;
  float _6425;
  if (((_79 < 1.0000000116860974e-07f)) || (_107)) {
    float _110 = select(_107, 0.0f, 1.0f);
    _6422 = _110;
    _6423 = _110;
    _6424 = _110;
    _6425 = _110;
  } else {
    float _114 = max(1.0000000116860974e-07f, _79);
    float _115 = _nearFarProj.x / _114;
    float _151 = mad((_invViewProjRelative[3].z), _114, mad((_invViewProjRelative[3].y), _72, ((_invViewProjRelative[3].x) * _70))) + (_invViewProjRelative[3].w);
    float _152 = (mad((_invViewProjRelative[0].z), _114, mad((_invViewProjRelative[0].y), _72, ((_invViewProjRelative[0].x) * _70))) + (_invViewProjRelative[0].w)) / _151;
    float _153 = (mad((_invViewProjRelative[1].z), _114, mad((_invViewProjRelative[1].y), _72, ((_invViewProjRelative[1].x) * _70))) + (_invViewProjRelative[1].w)) / _151;
    float _154 = (mad((_invViewProjRelative[2].z), _114, mad((_invViewProjRelative[2].y), _72, ((_invViewProjRelative[2].x) * _70))) + (_invViewProjRelative[2].w)) / _151;
    float _156 = rsqrt(dot(float3(_152, _153, _154), float3(_152, _153, _154)));
    _26[0] = 0.0f;
    _27[0] = 0.0f;
    _28[0] = 0.0f;
    _26[1] = 0.0f;
    _27[1] = 0.0f;
    _28[1] = 0.0f;
    bool _170 = ((uint)(_80 + -53) < (uint)15);
    bool _172 = ((_80 == 57)) || (_170);
    float _192 = mad((_terrainShadowProjRelativeTexScale[0].z), _154, mad((_terrainShadowProjRelativeTexScale[0].y), _153, ((_terrainShadowProjRelativeTexScale[0].x) * _152))) + (_terrainShadowProjRelativeTexScale[0].w);
    float _196 = mad((_terrainShadowProjRelativeTexScale[1].z), _154, mad((_terrainShadowProjRelativeTexScale[1].y), _153, ((_terrainShadowProjRelativeTexScale[1].x) * _152))) + (_terrainShadowProjRelativeTexScale[1].w);
    float _200 = mad((_terrainShadowProjRelativeTexScale[2].z), _154, mad((_terrainShadowProjRelativeTexScale[2].y), _153, ((_terrainShadowProjRelativeTexScale[2].x) * _152))) + (_terrainShadowProjRelativeTexScale[2].w);
    if (saturate(_192) == _192) {
      if (((_200 >= 9.999999747378752e-05f)) && ((((_200 <= 1.0f)) && ((saturate(_196) == _196))))) {
        float _211 = float((uint)(uint)(_frameNumber.x));
        float _222 = (frac(((_211 * 92.0f) + _60) * 0.0078125f) * 128.0f) + -64.34062194824219f;
        float _223 = (frac(((_211 * 71.0f) + _61) * 0.0078125f) * 128.0f) + -72.46562194824219f;
        float _228 = frac(dot(float3((_222 * _222), (_223 * _223), (_223 * _222)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
        int _264 = ((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) + 1013904242u));
        int _272 = ((int)(((((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
        uint _276 = ((uint)(_272 ^ (((uint)(((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)));
        int _288 = ((int)(((((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
        int _296 = ((int)(((((uint)(_288 ^ (((uint)(((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _276) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_288 ^ (((uint)(((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _276) + 2027808484u));
        uint _300 = ((uint)(_296 ^ ((int)(((uint)((uint)(((uint)(_288 ^ (((uint)(((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _276) >> 5)) + 2123724318u)))) + (((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
        uint _308 = ((uint)((((int)((_300 << 4) + (uint)(-1556008596))) ^ ((int)(_300 + 387276957u))) ^ (((uint)(_300) >> 5) + -939442524))) + (((uint)(_288 ^ (((uint)(((uint)((((int)((_276 << 4) + (uint)(-1383041155))) ^ ((int)(_276 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_276) >> 5)) + 2123724318u)))) + (((uint)(_264 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _276);
        int _339 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)) >> 5) + -939442524);
        int _352 = ((int)(((((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300))) + (uint)(-239350328)));
        uint _356 = ((uint)(_352 ^ (((uint)(((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300))) >> 5) + -939442524))) + ((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308));
        if (((int)(_356) & 16777215) == 0) {
          int _371 = ((int)(((((uint)((((int)((_356 << 4) + (uint)(-1383041155))) ^ ((int)(_356 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_356) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_356 << 4) + (uint)(-1383041155))) ^ ((int)(_356 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_356) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)))) + (uint)(-1879881855)));
          _377 = ((int)(((uint)(_371 ^ (((uint)(((uint)((((int)((_356 << 4) + (uint)(-1383041155))) ^ ((int)(_356 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_356) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_339) + (((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300) >> 5) + -939442524))) + _308) >> 5)) + 2123724318u)))) + (((uint)((((int)((_308 << 4) + (uint)(-1383041155))) ^ ((int)(_308 + 387276957u))) ^ ((int)(((uint)((uint)(_308) >> 5)) + 2123724318u)))) + _300)))) >> 5) + -939442524))) + _356));
        } else {
          _377 = (int)(_356);
        }
        uint _382 = uint(float((uint)((uint)(((int)(_377 * 48271)) & 16777215))) * 3.814637693722034e-06f);
        float _389 = frac((float((uint)_382) * 0.015625f) + (float((uint)((uint)((int)(uint(_228 * 51540816.0f)) & 65535))) * 1.52587890625e-05f));
        float _395 = (_389 * 2.0f) + -1.0f;
        float _396 = (float((uint)((uint)(reversebits(_382) ^ (int)(uint(_228 * 287478368.0f))))) * 4.656612873077393e-10f) + -1.0f;
        float _398 = rsqrt(dot(float2(_395, _396), float2(_395, _396)));
        float _405 = ((_389 * 0.0009765625f) + -0.00048828125f) * _398;
        float _407 = (_396 * _398) * 0.00048828125f;
        float _409 = (_405 * (_jitterOffset[0].x)) + _192;
        float _410 = (_407 * (_jitterOffset[0].y)) + _196;
        float _415 = frac((_409 * 1024.0f) + -0.5f);
        float4 _419 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_409, _410));
        float _424 = _200 + -0.004999999888241291f;
        float _429 = select((_419.w > _424), 1.0f, 0.0f);
        float _431 = select((_419.x > _424), 1.0f, 0.0f);
        float _438 = ((select((_419.z > _424), 1.0f, 0.0f) - _429) * _415) + _429;
        float _448 = ((_jitterOffset[1].x) * _405) + _192;
        float _449 = ((_jitterOffset[1].y) * _407) + _196;
        float _454 = frac((_448 * 1024.0f) + -0.5f);
        float4 _456 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_448, _449));
        float _465 = select((_456.w > _424), 1.0f, 0.0f);
        float _467 = select((_456.x > _424), 1.0f, 0.0f);
        float _474 = ((select((_456.z > _424), 1.0f, 0.0f) - _465) * _454) + _465;
        float _485 = ((_jitterOffset[2].x) * _405) + _192;
        float _486 = ((_jitterOffset[2].y) * _407) + _196;
        float _491 = frac((_485 * 1024.0f) + -0.5f);
        float4 _493 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_485, _486));
        float _502 = select((_493.w > _424), 1.0f, 0.0f);
        float _504 = select((_493.x > _424), 1.0f, 0.0f);
        float _511 = ((select((_493.z > _424), 1.0f, 0.0f) - _502) * _491) + _502;
        float _522 = ((_jitterOffset[3].x) * _405) + _192;
        float _523 = ((_jitterOffset[3].y) * _407) + _196;
        float _528 = frac((_522 * 1024.0f) + -0.5f);
        float4 _530 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_522, _523));
        float _539 = select((_530.w > _424), 1.0f, 0.0f);
        float _541 = select((_530.x > _424), 1.0f, 0.0f);
        float _548 = ((select((_530.z > _424), 1.0f, 0.0f) - _539) * _528) + _539;
        _556 = ((((saturate((((((select((_456.y > _424), 1.0f, 0.0f) - _467) * _454) + _467) - _474) * frac((_449 * 1024.0f) + -0.5f)) + _474) + saturate((((((select((_419.y > _424), 1.0f, 0.0f) - _431) * _415) + _431) - _438) * frac((_410 * 1024.0f) + -0.5f)) + _438)) + saturate((((((select((_493.y > _424), 1.0f, 0.0f) - _504) * _491) + _504) - _511) * frac((_486 * 1024.0f) + -0.5f)) + _511)) + saturate((((((select((_530.y > _424), 1.0f, 0.0f) - _541) * _528) + _541) - _548) * frac((_523 * 1024.0f) + -0.5f)) + _548)) * 0.25f);
      } else {
        _556 = 1.0f;
      }
    } else {
      _556 = 1.0f;
    }
    float _564 = sqrt(((_153 * _153) + (_152 * _152)) + (_154 * _154));
    float _584 = mad((_dynamicShadowProjRelativeTexScale[1][0].z), _154, mad((_dynamicShadowProjRelativeTexScale[1][0].y), _153, ((_dynamicShadowProjRelativeTexScale[1][0].x) * _152))) + (_dynamicShadowProjRelativeTexScale[1][0].w);
    float _588 = mad((_dynamicShadowProjRelativeTexScale[1][1].z), _154, mad((_dynamicShadowProjRelativeTexScale[1][1].y), _153, ((_dynamicShadowProjRelativeTexScale[1][1].x) * _152))) + (_dynamicShadowProjRelativeTexScale[1][1].w);
    float _592 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _154, mad((_dynamicShadowProjRelativeTexScale[1][2].y), _153, ((_dynamicShadowProjRelativeTexScale[1][2].x) * _152))) + (_dynamicShadowProjRelativeTexScale[1][2].w);
    float _593 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
    float _594 = 1.0f - _593;
    if (!(((((!(_584 <= _594))) || ((!(_584 >= _593))))) || ((!(_588 <= _594))))) {
      if (((_564 < 128.0f)) && ((((_592 >= -1.0f)) && ((((_592 <= 1.0f)) && ((_588 >= _593))))))) {
        float _619 = max(0.0f, ((abs((_584 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        float _620 = max(0.0f, ((abs((_588 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _26[1] = _584;
        _27[1] = _588;
        _28[1] = _592;
        _630 = select((_terrainNormalParams.y > 0.0f), 1.9999999494757503e-05f, 7.999999797903001e-05f);
        _631 = 1;
        _632 = sqrt((_620 * _620) + (_619 * _619));
      } else {
        _630 = 0.0f;
        _631 = 0;
        _632 = 0.0f;
      }
    } else {
      _630 = 0.0f;
      _631 = 0;
      _632 = 0.0f;
    }
    float _652 = mad((_dynamicShadowProjRelativeTexScale[0][0].z), _154, mad((_dynamicShadowProjRelativeTexScale[0][0].y), _153, ((_dynamicShadowProjRelativeTexScale[0][0].x) * _152))) + (_dynamicShadowProjRelativeTexScale[0][0].w);
    float _656 = mad((_dynamicShadowProjRelativeTexScale[0][1].z), _154, mad((_dynamicShadowProjRelativeTexScale[0][1].y), _153, ((_dynamicShadowProjRelativeTexScale[0][1].x) * _152))) + (_dynamicShadowProjRelativeTexScale[0][1].w);
    float _660 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _154, mad((_dynamicShadowProjRelativeTexScale[0][2].y), _153, ((_dynamicShadowProjRelativeTexScale[0][2].x) * _152))) + (_dynamicShadowProjRelativeTexScale[0][2].w);
    if (!(((((!(_652 >= _593))) || ((!(_652 <= _594))))) || ((!(_656 <= _594))))) {
      if (((_564 < 128.0f)) && ((((_660 >= -1.0f)) && ((((_656 >= _593)) && ((_660 <= 1.0f))))))) {
        float _685 = max(0.0f, ((abs((_652 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        float _686 = max(0.0f, ((abs((_656 * 2.0f) + -1.0f) + -0.8999999761581421f) * 10.0f));
        _26[0] = _652;
        _27[0] = _656;
        _28[0] = _660;
        _696 = select((_terrainNormalParams.y > 0.0f), 4.999999873689376e-06f, 1.9999999494757503e-05f);
        _697 = 1;
        _698 = 0;
        _699 = sqrt((_686 * _686) + (_685 * _685));
      } else {
        _696 = _630;
        _697 = _631;
        _698 = _631;
        _699 = _632;
      }
    } else {
      _696 = _630;
      _697 = _631;
      _698 = _631;
      _699 = _632;
    }
    bool _700 = (_697 == 0);
    [branch]
    if (_700) {
      float _708 = _viewPos.x + _152;
      float _709 = _viewPos.y + _153;
      float _710 = _viewPos.z + _154;
      float _715 = _708 - (_staticShadowPosition[1].x);
      float _716 = _709 - (_staticShadowPosition[1].y);
      float _717 = _710 - (_staticShadowPosition[1].z);
      float _737 = mad((_shadowProjRelativeTexScale[1][0].z), _717, mad((_shadowProjRelativeTexScale[1][0].y), _716, ((_shadowProjRelativeTexScale[1][0].x) * _715))) + (_shadowProjRelativeTexScale[1][0].w);
      float _741 = mad((_shadowProjRelativeTexScale[1][1].z), _717, mad((_shadowProjRelativeTexScale[1][1].y), _716, ((_shadowProjRelativeTexScale[1][1].x) * _715))) + (_shadowProjRelativeTexScale[1][1].w);
      float _745 = mad((_shadowProjRelativeTexScale[1][2].z), _717, mad((_shadowProjRelativeTexScale[1][2].y), _716, ((_shadowProjRelativeTexScale[1][2].x) * _715))) + (_shadowProjRelativeTexScale[1][2].w);
      float _746 = 2.0f / _shadowSizeAndInvSize.y;
      float _747 = 1.0f - _746;
      if (!(((((!(_737 <= _747))) || ((!(_737 >= _746))))) || ((!(_741 <= _747))))) {
        if (((_745 >= 9.999999747378752e-05f)) && ((((_745 <= 1.0f)) && ((_741 >= _746))))) {
          _26[1] = _737;
          _27[1] = _741;
          _28[1] = _745;
          _761 = 0.00019999999494757503f;
          _762 = 1;
          _763 = 1;
        } else {
          _761 = _696;
          _762 = 0;
          _763 = _698;
        }
      } else {
        _761 = _696;
        _762 = 0;
        _763 = _698;
      }
      float _768 = _708 - (_staticShadowPosition[0].x);
      float _769 = _709 - (_staticShadowPosition[0].y);
      float _770 = _710 - (_staticShadowPosition[0].z);
      float _790 = mad((_shadowProjRelativeTexScale[0][0].z), _770, mad((_shadowProjRelativeTexScale[0][0].y), _769, ((_shadowProjRelativeTexScale[0][0].x) * _768))) + (_shadowProjRelativeTexScale[0][0].w);
      float _794 = mad((_shadowProjRelativeTexScale[0][1].z), _770, mad((_shadowProjRelativeTexScale[0][1].y), _769, ((_shadowProjRelativeTexScale[0][1].x) * _768))) + (_shadowProjRelativeTexScale[0][1].w);
      float _798 = mad((_shadowProjRelativeTexScale[0][2].z), _770, mad((_shadowProjRelativeTexScale[0][2].y), _769, ((_shadowProjRelativeTexScale[0][2].x) * _768))) + (_shadowProjRelativeTexScale[0][2].w);
      if (!(((((!(_790 >= _746))) || ((!(_790 <= _747))))) || ((!(_794 <= _747))))) {
        if (((_798 >= 9.999999747378752e-05f)) && ((((_794 >= _746)) && ((_798 <= 1.0f))))) {
          _26[0] = _790;
          _27[0] = _794;
          _28[0] = _798;
          _812 = 0.00019999999494757503f;
          _813 = 1;
          _814 = 0;
        } else {
          _812 = _761;
          _813 = _762;
          _814 = _763;
        }
      } else {
        _812 = _761;
        _813 = _762;
        _814 = _763;
      }
    } else {
      _812 = _696;
      _813 = 1;
      _814 = _698;
    }
    int _850 = ((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) + 1013904242u));
    int _858 = ((int)(((((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    uint _862 = ((uint)(_858 ^ (((uint)(((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)));
    int _874 = ((int)(((((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _882 = ((int)(((((uint)(_874 ^ (((uint)(((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _862) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_874 ^ (((uint)(((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _862) + 2027808484u));
    uint _886 = ((uint)(_882 ^ ((int)(((uint)((uint)(((uint)(_874 ^ (((uint)(((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _862) >> 5)) + 2123724318u)))) + (((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
    uint _894 = ((uint)((((int)((_886 << 4) + (uint)(-1556008596))) ^ ((int)(_886 + 387276957u))) ^ (((uint)(_886) >> 5) + -939442524))) + (((uint)(_874 ^ (((uint)(((uint)((((int)((_862 << 4) + (uint)(-1383041155))) ^ ((int)(_862 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_862) >> 5)) + 2123724318u)))) + (((uint)(_850 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))) + uint((_61 * _bufferSizeAndInvSize.x) + _60)) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _862);
    int _925 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)) >> 5) + -939442524);
    int _938 = ((int)(((((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886))) + (uint)(-239350328)));
    uint _942 = ((uint)(_938 ^ (((uint)(((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886))) >> 5) + -939442524))) + ((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894));
    bool _952 = (((int)(_942) & 16777215) == 0);
    [branch]
    if (_700) {
      float _5118 = _26[_814];
      float _5119 = _27[_814];
      float _5120 = _28[_814];
      if (_952) {
        int _5125 = ((int)(((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) + (uint)(-1879881855)));
        _5131 = ((int)(((uint)(_5125 ^ (((uint)(((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) >> 5) + -939442524))) + _942));
      } else {
        _5131 = (int)(_942);
      }
      float _5132 = _shadowSizeAndInvSize.z * 2.0f;
      float _5133 = _shadowSizeAndInvSize.w * 2.0f;
      float _5140 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      float _5142 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      float _5146 = ((float((uint)((uint)(((int)(_5131 * 48271)) & 16777215))) * _5140) - _5132) + _5118;
      float _5147 = ((float((uint)((uint)(((int)(_5131 * -1964877855)) & 16777215))) * _5142) - _5133) + _5119;
      float _5148 = float((uint)(uint)(_814));
      float4 _5151 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5146, _5147, _5148), 0.0f);
      float _5155 = _5120 - _812;
      float4 _5157 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_5146, _5147, _5148), _5155);
      float _5171 = ((float((uint)((uint)(((int)(_5131 * -856141137)) & 16777215))) * _5140) - _5132) + _5118;
      float _5172 = ((float((uint)((uint)(((int)(_5131 * -613502015)) & 16777215))) * _5142) - _5133) + _5119;
      float4 _5173 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5171, _5172, _5148), 0.0f);
      float4 _5177 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_5171, _5172, _5148), _5155);
      float _5193 = ((float((uint)((uint)(((int)(_5131 * -556260145)) & 16777215))) * _5140) - _5132) + _5118;
      float _5194 = ((float((uint)((uint)(((int)(_5131 * 902075297)) & 16777215))) * _5142) - _5133) + _5119;
      float4 _5195 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5193, _5194, _5148), 0.0f);
      float4 _5199 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_5193, _5194, _5148), _5155);
      float _5215 = ((float((uint)((uint)(((int)(_5131 * 1698214639)) & 16777215))) * _5140) - _5132) + _5118;
      float _5216 = ((float((uint)((uint)(((int)(_5131 * 773027713)) & 16777215))) * _5142) - _5133) + _5119;
      float4 _5217 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5215, _5216, _5148), 0.0f);
      float4 _5221 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_5215, _5216, _5148), _5155);
      float _5227 = (((saturate(1.0f - _5177.x) + saturate(1.0f - _5157.x)) + saturate(1.0f - _5199.x)) + saturate(1.0f - _5221.x)) * 0.25f;
      float _5228 = (((max(0.0f, (_5120 - _5173.x)) + max(0.0f, (_5120 - _5151.x))) + max(0.0f, (_5120 - _5195.x))) + max(0.0f, (_5120 - _5217.x))) * 0.25f;
      _5234 = saturate(_5227 * _5227);
      _5235 = saturate(_5228 * _5228);
      _5236 = 1.0h;
      _5237 = 1.0h;
      _5238 = 1.0h;
    } else {
      float _957 = _26[_814];
      float _958 = _27[_814];
      float _959 = _28[_814];
      float _961 = select((_814 == 0), 2.5f, 1.0f);
      if (_952) {
        int _968 = ((int)(((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) + (uint)(-1879881855)));
        _974 = ((int)(((uint)(_968 ^ (((uint)(((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) >> 5) + -939442524))) + _942));
      } else {
        _974 = (int)(_942);
      }
      float _975 = select(_172, (_961 * 0.75f), _961) * 0.6600000262260437f;
      float _976 = _975 * _dynmaicShadowSizeAndInvSize.z;
      float _977 = _975 * _dynmaicShadowSizeAndInvSize.w;
      float _984 = _976 * 1.1920928955078125e-07f;
      float _986 = _977 * 1.1920928955078125e-07f;
      float _993 = min(100.0f, _shadowAOParams.y) * 0.8500000238418579f;
      float _994 = ((float((uint)((uint)(((int)(_974 * 48271)) & 16777215))) * _984) - _976) + _957;
      float _995 = ((float((uint)((uint)(((int)(_974 * -1964877855)) & 16777215))) * _986) - _977) + _958;
      float _998 = (_994 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _999 = (_995 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1000 = frac(_998);
      float _1001 = frac(_999);
      int _1004 = int(floor(_998));
      int _1005 = int(floor(_999));
      uint _1006 = uint(_dynmaicShadowSizeAndInvSize.x);
      uint _1007 = uint(_dynmaicShadowSizeAndInvSize.y);
      if (!((((uint)_1004 > (uint)(int)(_1006))) || (((uint)_1005 > (uint)(int)(_1007))))) {
        float4 _1015 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1004, _1005, _814, 0));
        float4 _1017 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1004) + 1u)), _1005, _814, 0));
        float4 _1019 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1004, ((int)((uint)(_1005) + 1u)), _814, 0));
        float4 _1021 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1004) + 1u)), ((int)((uint)(_1005) + 1u)), _814, 0));
        half4 _1024 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1004, _1005, _814, 0));
        float _1032 = max(0.0f, (_959 - _1015.x));
        float _1034 = max(0.0f, (_959 - _1019.x));
        float _1048 = saturate(exp2((_1015.x - _959) * 432808.5f));
        float _1050 = saturate(exp2((_1019.x - _959) * 432808.5f));
        float _1060 = ((saturate(exp2((_1017.x - _959) * 432808.5f)) - _1048) * _1000) + _1048;
        float _1061 = ((max(0.0f, (_959 - _1017.x)) - _1032) * _1000) + _1032;
        uint2 _1070 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1004, _1005, _814, 0));
        uint2 _1072 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1004) + 1u)), _1005, _814, 0));
        uint2 _1074 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1004, ((int)((uint)(_1005) + 1u)), _814, 0));
        uint2 _1076 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1004) + 1u)), ((int)((uint)(_1005) + 1u)), _814, 0));
        float _1112 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _995, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _994));
        float _1114 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1015.x, _1112) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1116 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _995, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _994));
        float _1118 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1015.x, _1116) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1120 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _995, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _994));
        float _1122 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1015.x, _1120) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1123 = -4.0f - _993;
        float _1141 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1017.x, _1112) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1143 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1017.x, _1116) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1145 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1017.x, _1120) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1163 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1019.x, _1112) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1165 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1019.x, _1116) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1167 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1019.x, _1120) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1185 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1021.x, _1112) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1187 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1021.x, _1116) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1189 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1021.x, _1120) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _1214 = ((max(max(max(float((bool)(uint)((_1070.x & 1) != 0)), saturate(max(max((max((_1114 + _1123), (_1123 - _1114)) * 0.25f), (max((_1118 + _1123), (_1123 - _1118)) * 0.25f)), (max((_1122 + _1123), (_1123 - _1122)) * 0.25f)))), max(float((bool)(uint)((_1072.x & 1) != 0)), saturate(max(max((max((_1141 + _1123), (_1123 - _1141)) * 0.25f), (max((_1143 + _1123), (_1123 - _1143)) * 0.25f)), (max((_1145 + _1123), (_1123 - _1145)) * 0.25f))))), max(max(float((bool)(uint)((_1074.x & 1) != 0)), saturate(max(max((max((_1163 + _1123), (_1123 - _1163)) * 0.25f), (max((_1165 + _1123), (_1123 - _1165)) * 0.25f)), (max((_1167 + _1123), (_1123 - _1167)) * 0.25f)))), max(float((bool)(uint)((_1076.x & 1) != 0)), saturate(max(max((max((_1185 + _1123), (_1123 - _1185)) * 0.25f), (max((_1187 + _1123), (_1123 - _1187)) * 0.25f)), (max((_1189 + _1123), (_1123 - _1189)) * 0.25f)))))) * ((_1060 + -1.0f) + (((_1050 - _1060) + ((saturate(exp2((_1021.x - _959) * 432808.5f)) - _1050) * _1000)) * _1001))) + 1.0f);
        _1215 = ((((_1034 - _1061) + ((max(0.0f, (_959 - _1021.x)) - _1034) * _1000)) * _1001) + _1061);
        _1216 = false;
        _1217 = _1024.x;
        _1218 = _1024.y;
        _1219 = _1024.z;
      } else {
        _1214 = 1.0f;
        _1215 = 0.0f;
        _1216 = true;
        _1217 = 1.0h;
        _1218 = 1.0h;
        _1219 = 1.0h;
      }
      half _1220 = select(_1216, 0.0h, _1217);
      half _1221 = select(_1216, 0.0h, _1218);
      half _1222 = select(_1216, 0.0h, _1219);
      float _1223 = select(_1216, 0.0f, _1214);
      float _1224 = select(_1216, 0.0f, _1215);
      float _1225 = select(_1216, 0.0f, 1.0f);
      float _1236 = ((float((uint)((uint)(((int)(_974 * -856141137)) & 16777215))) * _984) - _976) + _957;
      float _1237 = ((float((uint)((uint)(((int)(_974 * -613502015)) & 16777215))) * _986) - _977) + _958;
      float _1240 = (_1236 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1241 = (_1237 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1242 = frac(_1240);
      float _1243 = frac(_1241);
      int _1246 = int(floor(_1240));
      int _1247 = int(floor(_1241));
      if (!((((uint)_1246 > (uint)(int)(_1006))) || (((uint)_1247 > (uint)(int)(_1007))))) {
        float4 _1255 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1246, _1247, _814, 0));
        float4 _1257 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1246) + 1u)), _1247, _814, 0));
        float4 _1259 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1246, ((int)((uint)(_1247) + 1u)), _814, 0));
        float4 _1261 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1246) + 1u)), ((int)((uint)(_1247) + 1u)), _814, 0));
        half4 _1264 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1246, _1247, _814, 0));
        float _1272 = max(0.0f, (_959 - _1255.x));
        float _1274 = max(0.0f, (_959 - _1259.x));
        float _1288 = saturate(exp2((_1255.x - _959) * 432808.5f));
        float _1290 = saturate(exp2((_1259.x - _959) * 432808.5f));
        float _1300 = ((saturate(exp2((_1257.x - _959) * 432808.5f)) - _1288) * _1242) + _1288;
        float _1301 = ((max(0.0f, (_959 - _1257.x)) - _1272) * _1242) + _1272;
        uint2 _1310 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1246, _1247, _814, 0));
        uint2 _1312 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1246) + 1u)), _1247, _814, 0));
        uint2 _1314 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1246, ((int)((uint)(_1247) + 1u)), _814, 0));
        uint2 _1316 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1246) + 1u)), ((int)((uint)(_1247) + 1u)), _814, 0));
        float _1352 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _1237, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _1236));
        float _1354 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1255.x, _1352) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1356 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _1237, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _1236));
        float _1358 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1255.x, _1356) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1360 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _1237, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _1236));
        float _1362 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1255.x, _1360) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1363 = -4.0f - _993;
        float _1381 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1257.x, _1352) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1383 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1257.x, _1356) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1385 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1257.x, _1360) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1403 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1259.x, _1352) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1405 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1259.x, _1356) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1407 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1259.x, _1360) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1425 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1261.x, _1352) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1427 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1261.x, _1356) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1429 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1261.x, _1360) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _1454 = ((max(max(max(float((bool)(uint)((_1310.x & 1) != 0)), saturate(max(max((max((_1354 + _1363), (_1363 - _1354)) * 0.25f), (max((_1358 + _1363), (_1363 - _1358)) * 0.25f)), (max((_1362 + _1363), (_1363 - _1362)) * 0.25f)))), max(float((bool)(uint)((_1312.x & 1) != 0)), saturate(max(max((max((_1381 + _1363), (_1363 - _1381)) * 0.25f), (max((_1383 + _1363), (_1363 - _1383)) * 0.25f)), (max((_1385 + _1363), (_1363 - _1385)) * 0.25f))))), max(max(float((bool)(uint)((_1314.x & 1) != 0)), saturate(max(max((max((_1403 + _1363), (_1363 - _1403)) * 0.25f), (max((_1405 + _1363), (_1363 - _1405)) * 0.25f)), (max((_1407 + _1363), (_1363 - _1407)) * 0.25f)))), max(float((bool)(uint)((_1316.x & 1) != 0)), saturate(max(max((max((_1425 + _1363), (_1363 - _1425)) * 0.25f), (max((_1427 + _1363), (_1363 - _1427)) * 0.25f)), (max((_1429 + _1363), (_1363 - _1429)) * 0.25f)))))) * ((_1300 + -1.0f) + (((_1290 - _1300) + ((saturate(exp2((_1261.x - _959) * 432808.5f)) - _1290) * _1242)) * _1243))) + 1.0f);
        _1455 = ((((_1274 - _1301) + ((max(0.0f, (_959 - _1261.x)) - _1274) * _1242)) * _1243) + _1301);
        _1456 = false;
        _1457 = _1264.x;
        _1458 = _1264.y;
        _1459 = _1264.z;
      } else {
        _1454 = 1.0f;
        _1455 = 0.0f;
        _1456 = true;
        _1457 = 1.0h;
        _1458 = 1.0h;
        _1459 = 1.0h;
      }
      if (!_1456) {
        _1468 = (_1457 + _1220);
        _1469 = (_1458 + _1221);
        _1470 = (_1459 + _1222);
        _1471 = (_1454 + _1223);
        _1472 = (_1455 + _1224);
        _1473 = (_1225 + 1.0f);
      } else {
        _1468 = _1220;
        _1469 = _1221;
        _1470 = _1222;
        _1471 = _1223;
        _1472 = _1224;
        _1473 = _1225;
      }
      float _1484 = ((float((uint)((uint)(((int)(_974 * -556260145)) & 16777215))) * _984) - _976) + _957;
      float _1485 = ((float((uint)((uint)(((int)(_974 * 902075297)) & 16777215))) * _986) - _977) + _958;
      float _1488 = (_1484 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1489 = (_1485 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1490 = frac(_1488);
      float _1491 = frac(_1489);
      int _1494 = int(floor(_1488));
      int _1495 = int(floor(_1489));
      if (!((((uint)_1494 > (uint)(int)(_1006))) || (((uint)_1495 > (uint)(int)(_1007))))) {
        float4 _1503 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1494, _1495, _814, 0));
        float4 _1505 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1494) + 1u)), _1495, _814, 0));
        float4 _1507 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1494, ((int)((uint)(_1495) + 1u)), _814, 0));
        float4 _1509 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1494) + 1u)), ((int)((uint)(_1495) + 1u)), _814, 0));
        half4 _1512 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1494, _1495, _814, 0));
        float _1520 = max(0.0f, (_959 - _1503.x));
        float _1522 = max(0.0f, (_959 - _1507.x));
        float _1536 = saturate(exp2((_1503.x - _959) * 432808.5f));
        float _1538 = saturate(exp2((_1507.x - _959) * 432808.5f));
        float _1548 = ((saturate(exp2((_1505.x - _959) * 432808.5f)) - _1536) * _1490) + _1536;
        float _1549 = ((max(0.0f, (_959 - _1505.x)) - _1520) * _1490) + _1520;
        uint2 _1558 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1494, _1495, _814, 0));
        uint2 _1560 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1494) + 1u)), _1495, _814, 0));
        uint2 _1562 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1494, ((int)((uint)(_1495) + 1u)), _814, 0));
        uint2 _1564 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1494) + 1u)), ((int)((uint)(_1495) + 1u)), _814, 0));
        float _1600 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _1485, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _1484));
        float _1602 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1503.x, _1600) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1604 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _1485, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _1484));
        float _1606 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1503.x, _1604) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1608 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _1485, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _1484));
        float _1610 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1503.x, _1608) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1611 = -4.0f - _993;
        float _1629 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1505.x, _1600) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1631 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1505.x, _1604) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1633 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1505.x, _1608) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1651 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1507.x, _1600) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1653 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1507.x, _1604) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1655 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1507.x, _1608) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1673 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1509.x, _1600) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1675 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1509.x, _1604) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1677 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1509.x, _1608) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _1702 = ((max(max(max(float((bool)(uint)((_1558.x & 1) != 0)), saturate(max(max((max((_1602 + _1611), (_1611 - _1602)) * 0.25f), (max((_1606 + _1611), (_1611 - _1606)) * 0.25f)), (max((_1610 + _1611), (_1611 - _1610)) * 0.25f)))), max(float((bool)(uint)((_1560.x & 1) != 0)), saturate(max(max((max((_1629 + _1611), (_1611 - _1629)) * 0.25f), (max((_1631 + _1611), (_1611 - _1631)) * 0.25f)), (max((_1633 + _1611), (_1611 - _1633)) * 0.25f))))), max(max(float((bool)(uint)((_1562.x & 1) != 0)), saturate(max(max((max((_1651 + _1611), (_1611 - _1651)) * 0.25f), (max((_1653 + _1611), (_1611 - _1653)) * 0.25f)), (max((_1655 + _1611), (_1611 - _1655)) * 0.25f)))), max(float((bool)(uint)((_1564.x & 1) != 0)), saturate(max(max((max((_1673 + _1611), (_1611 - _1673)) * 0.25f), (max((_1675 + _1611), (_1611 - _1675)) * 0.25f)), (max((_1677 + _1611), (_1611 - _1677)) * 0.25f)))))) * ((_1548 + -1.0f) + (((_1538 - _1548) + ((saturate(exp2((_1509.x - _959) * 432808.5f)) - _1538) * _1490)) * _1491))) + 1.0f);
        _1703 = ((((_1522 - _1549) + ((max(0.0f, (_959 - _1509.x)) - _1522) * _1490)) * _1491) + _1549);
        _1704 = false;
        _1705 = _1512.x;
        _1706 = _1512.y;
        _1707 = _1512.z;
      } else {
        _1702 = 1.0f;
        _1703 = 0.0f;
        _1704 = true;
        _1705 = 1.0h;
        _1706 = 1.0h;
        _1707 = 1.0h;
      }
      if (!_1704) {
        _1716 = (_1705 + _1468);
        _1717 = (_1706 + _1469);
        _1718 = (_1707 + _1470);
        _1719 = (_1702 + _1471);
        _1720 = (_1703 + _1472);
        _1721 = (_1473 + 1.0f);
      } else {
        _1716 = _1468;
        _1717 = _1469;
        _1718 = _1470;
        _1719 = _1471;
        _1720 = _1472;
        _1721 = _1473;
      }
      float _1732 = ((float((uint)((uint)(((int)(_974 * 1698214639)) & 16777215))) * _984) - _976) + _957;
      float _1733 = ((float((uint)((uint)(((int)(_974 * 773027713)) & 16777215))) * _986) - _977) + _958;
      float _1736 = (_1732 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1737 = (_1733 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1738 = frac(_1736);
      float _1739 = frac(_1737);
      int _1742 = int(floor(_1736));
      int _1743 = int(floor(_1737));
      if (!((((uint)_1742 > (uint)(int)(_1006))) || (((uint)_1743 > (uint)(int)(_1007))))) {
        float4 _1751 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1742, _1743, _814, 0));
        float4 _1753 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1742) + 1u)), _1743, _814, 0));
        float4 _1755 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1742, ((int)((uint)(_1743) + 1u)), _814, 0));
        float4 _1757 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1742) + 1u)), ((int)((uint)(_1743) + 1u)), _814, 0));
        half4 _1760 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1742, _1743, _814, 0));
        float _1768 = max(0.0f, (_959 - _1751.x));
        float _1770 = max(0.0f, (_959 - _1755.x));
        float _1784 = saturate(exp2((_1751.x - _959) * 432808.5f));
        float _1786 = saturate(exp2((_1755.x - _959) * 432808.5f));
        float _1796 = ((saturate(exp2((_1753.x - _959) * 432808.5f)) - _1784) * _1738) + _1784;
        float _1797 = ((max(0.0f, (_959 - _1753.x)) - _1768) * _1738) + _1768;
        uint2 _1806 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1742, _1743, _814, 0));
        uint2 _1808 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1742) + 1u)), _1743, _814, 0));
        uint2 _1810 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1742, ((int)((uint)(_1743) + 1u)), _814, 0));
        uint2 _1812 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1742) + 1u)), ((int)((uint)(_1743) + 1u)), _814, 0));
        float _1848 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _1733, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _1732));
        float _1850 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1751.x, _1848) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1852 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _1733, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _1732));
        float _1854 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1751.x, _1852) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1856 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _1733, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _1732));
        float _1858 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1751.x, _1856) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1859 = -4.0f - _993;
        float _1877 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1753.x, _1848) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1879 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1753.x, _1852) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1881 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1753.x, _1856) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1899 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1755.x, _1848) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1901 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1755.x, _1852) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1903 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1755.x, _1856) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _1921 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1757.x, _1848) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _1923 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1757.x, _1852) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _1925 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1757.x, _1856) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _1950 = ((max(max(max(float((bool)(uint)((_1806.x & 1) != 0)), saturate(max(max((max((_1850 + _1859), (_1859 - _1850)) * 0.25f), (max((_1854 + _1859), (_1859 - _1854)) * 0.25f)), (max((_1858 + _1859), (_1859 - _1858)) * 0.25f)))), max(float((bool)(uint)((_1808.x & 1) != 0)), saturate(max(max((max((_1877 + _1859), (_1859 - _1877)) * 0.25f), (max((_1879 + _1859), (_1859 - _1879)) * 0.25f)), (max((_1881 + _1859), (_1859 - _1881)) * 0.25f))))), max(max(float((bool)(uint)((_1810.x & 1) != 0)), saturate(max(max((max((_1899 + _1859), (_1859 - _1899)) * 0.25f), (max((_1901 + _1859), (_1859 - _1901)) * 0.25f)), (max((_1903 + _1859), (_1859 - _1903)) * 0.25f)))), max(float((bool)(uint)((_1812.x & 1) != 0)), saturate(max(max((max((_1921 + _1859), (_1859 - _1921)) * 0.25f), (max((_1923 + _1859), (_1859 - _1923)) * 0.25f)), (max((_1925 + _1859), (_1859 - _1925)) * 0.25f)))))) * ((_1796 + -1.0f) + (((_1786 - _1796) + ((saturate(exp2((_1757.x - _959) * 432808.5f)) - _1786) * _1738)) * _1739))) + 1.0f);
        _1951 = ((((_1770 - _1797) + ((max(0.0f, (_959 - _1757.x)) - _1770) * _1738)) * _1739) + _1797);
        _1952 = false;
        _1953 = _1760.x;
        _1954 = _1760.y;
        _1955 = _1760.z;
      } else {
        _1950 = 1.0f;
        _1951 = 0.0f;
        _1952 = true;
        _1953 = 1.0h;
        _1954 = 1.0h;
        _1955 = 1.0h;
      }
      if (!_1952) {
        _1964 = (_1953 + _1716);
        _1965 = (_1954 + _1717);
        _1966 = (_1955 + _1718);
        _1967 = (_1950 + _1719);
        _1968 = (_1951 + _1720);
        _1969 = (_1721 + 1.0f);
      } else {
        _1964 = _1716;
        _1965 = _1717;
        _1966 = _1718;
        _1967 = _1719;
        _1968 = _1720;
        _1969 = _1721;
      }
      float _1980 = ((float((uint)((uint)(((int)(_974 * 144866575)) & 16777215))) * _984) - _976) + _957;
      float _1981 = ((float((uint)((uint)(((int)(_974 * 647683937)) & 16777215))) * _986) - _977) + _958;
      float _1984 = (_1980 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _1985 = (_1981 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _1986 = frac(_1984);
      float _1987 = frac(_1985);
      int _1990 = int(floor(_1984));
      int _1991 = int(floor(_1985));
      if (!((((uint)_1990 > (uint)(int)(_1006))) || (((uint)_1991 > (uint)(int)(_1007))))) {
        float4 _1999 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1990, _1991, _814, 0));
        float4 _2001 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1990) + 1u)), _1991, _814, 0));
        float4 _2003 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_1990, ((int)((uint)(_1991) + 1u)), _814, 0));
        float4 _2005 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_1990) + 1u)), ((int)((uint)(_1991) + 1u)), _814, 0));
        half4 _2008 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_1990, _1991, _814, 0));
        float _2016 = max(0.0f, (_959 - _1999.x));
        float _2018 = max(0.0f, (_959 - _2003.x));
        float _2032 = saturate(exp2((_1999.x - _959) * 432808.5f));
        float _2034 = saturate(exp2((_2003.x - _959) * 432808.5f));
        float _2044 = ((saturate(exp2((_2001.x - _959) * 432808.5f)) - _2032) * _1986) + _2032;
        float _2045 = ((max(0.0f, (_959 - _2001.x)) - _2016) * _1986) + _2016;
        uint2 _2054 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1990, _1991, _814, 0));
        uint2 _2056 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1990) + 1u)), _1991, _814, 0));
        uint2 _2058 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_1990, ((int)((uint)(_1991) + 1u)), _814, 0));
        uint2 _2060 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_1990) + 1u)), ((int)((uint)(_1991) + 1u)), _814, 0));
        float _2096 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _1981, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _1980));
        float _2098 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _1999.x, _2096) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2100 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _1981, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _1980));
        float _2102 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _1999.x, _2100) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2104 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _1981, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _1980));
        float _2106 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _1999.x, _2104) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2107 = -4.0f - _993;
        float _2125 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2001.x, _2096) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2127 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2001.x, _2100) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2129 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2001.x, _2104) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2147 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2003.x, _2096) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2149 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2003.x, _2100) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2151 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2003.x, _2104) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2169 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2005.x, _2096) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2171 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2005.x, _2100) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2173 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2005.x, _2104) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _2198 = ((max(max(max(float((bool)(uint)((_2054.x & 1) != 0)), saturate(max(max((max((_2098 + _2107), (_2107 - _2098)) * 0.25f), (max((_2102 + _2107), (_2107 - _2102)) * 0.25f)), (max((_2106 + _2107), (_2107 - _2106)) * 0.25f)))), max(float((bool)(uint)((_2056.x & 1) != 0)), saturate(max(max((max((_2125 + _2107), (_2107 - _2125)) * 0.25f), (max((_2127 + _2107), (_2107 - _2127)) * 0.25f)), (max((_2129 + _2107), (_2107 - _2129)) * 0.25f))))), max(max(float((bool)(uint)((_2058.x & 1) != 0)), saturate(max(max((max((_2147 + _2107), (_2107 - _2147)) * 0.25f), (max((_2149 + _2107), (_2107 - _2149)) * 0.25f)), (max((_2151 + _2107), (_2107 - _2151)) * 0.25f)))), max(float((bool)(uint)((_2060.x & 1) != 0)), saturate(max(max((max((_2169 + _2107), (_2107 - _2169)) * 0.25f), (max((_2171 + _2107), (_2107 - _2171)) * 0.25f)), (max((_2173 + _2107), (_2107 - _2173)) * 0.25f)))))) * ((_2044 + -1.0f) + (((_2034 - _2044) + ((saturate(exp2((_2005.x - _959) * 432808.5f)) - _2034) * _1986)) * _1987))) + 1.0f);
        _2199 = ((((_2018 - _2045) + ((max(0.0f, (_959 - _2005.x)) - _2018) * _1986)) * _1987) + _2045);
        _2200 = false;
        _2201 = _2008.x;
        _2202 = _2008.y;
        _2203 = _2008.z;
      } else {
        _2198 = 1.0f;
        _2199 = 0.0f;
        _2200 = true;
        _2201 = 1.0h;
        _2202 = 1.0h;
        _2203 = 1.0h;
      }
      if (!_2200) {
        _2212 = (_2201 + _1964);
        _2213 = (_2202 + _1965);
        _2214 = (_2203 + _1966);
        _2215 = (_2198 + _1967);
        _2216 = (_2199 + _1968);
        _2217 = (_1969 + 1.0f);
      } else {
        _2212 = _1964;
        _2213 = _1965;
        _2214 = _1966;
        _2215 = _1967;
        _2216 = _1968;
        _2217 = _1969;
      }
      float _2228 = ((float((uint)((uint)(((int)(_974 * 1284375343)) & 16777215))) * _984) - _976) + _957;
      float _2229 = ((float((uint)((uint)(((int)(_974 * 229264193)) & 16777215))) * _986) - _977) + _958;
      float _2232 = (_2228 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2233 = (_2229 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2234 = frac(_2232);
      float _2235 = frac(_2233);
      int _2238 = int(floor(_2232));
      int _2239 = int(floor(_2233));
      if (!((((uint)_2238 > (uint)(int)(_1006))) || (((uint)_2239 > (uint)(int)(_1007))))) {
        float4 _2247 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2238, _2239, _814, 0));
        float4 _2249 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2238) + 1u)), _2239, _814, 0));
        float4 _2251 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2238, ((int)((uint)(_2239) + 1u)), _814, 0));
        float4 _2253 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2238) + 1u)), ((int)((uint)(_2239) + 1u)), _814, 0));
        half4 _2256 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2238, _2239, _814, 0));
        float _2264 = max(0.0f, (_959 - _2247.x));
        float _2266 = max(0.0f, (_959 - _2251.x));
        float _2280 = saturate(exp2((_2247.x - _959) * 432808.5f));
        float _2282 = saturate(exp2((_2251.x - _959) * 432808.5f));
        float _2292 = ((saturate(exp2((_2249.x - _959) * 432808.5f)) - _2280) * _2234) + _2280;
        float _2293 = ((max(0.0f, (_959 - _2249.x)) - _2264) * _2234) + _2264;
        uint2 _2302 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2238, _2239, _814, 0));
        uint2 _2304 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2238) + 1u)), _2239, _814, 0));
        uint2 _2306 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2238, ((int)((uint)(_2239) + 1u)), _814, 0));
        uint2 _2308 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2238) + 1u)), ((int)((uint)(_2239) + 1u)), _814, 0));
        float _2344 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _2229, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _2228));
        float _2346 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2247.x, _2344) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2348 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _2229, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _2228));
        float _2350 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2247.x, _2348) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2352 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _2229, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _2228));
        float _2354 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2247.x, _2352) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2355 = -4.0f - _993;
        float _2373 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2249.x, _2344) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2375 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2249.x, _2348) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2377 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2249.x, _2352) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2395 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2251.x, _2344) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2397 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2251.x, _2348) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2399 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2251.x, _2352) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2417 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2253.x, _2344) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2419 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2253.x, _2348) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2421 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2253.x, _2352) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _2446 = ((max(max(max(float((bool)(uint)((_2302.x & 1) != 0)), saturate(max(max((max((_2346 + _2355), (_2355 - _2346)) * 0.25f), (max((_2350 + _2355), (_2355 - _2350)) * 0.25f)), (max((_2354 + _2355), (_2355 - _2354)) * 0.25f)))), max(float((bool)(uint)((_2304.x & 1) != 0)), saturate(max(max((max((_2373 + _2355), (_2355 - _2373)) * 0.25f), (max((_2375 + _2355), (_2355 - _2375)) * 0.25f)), (max((_2377 + _2355), (_2355 - _2377)) * 0.25f))))), max(max(float((bool)(uint)((_2306.x & 1) != 0)), saturate(max(max((max((_2395 + _2355), (_2355 - _2395)) * 0.25f), (max((_2397 + _2355), (_2355 - _2397)) * 0.25f)), (max((_2399 + _2355), (_2355 - _2399)) * 0.25f)))), max(float((bool)(uint)((_2308.x & 1) != 0)), saturate(max(max((max((_2417 + _2355), (_2355 - _2417)) * 0.25f), (max((_2419 + _2355), (_2355 - _2419)) * 0.25f)), (max((_2421 + _2355), (_2355 - _2421)) * 0.25f)))))) * ((_2292 + -1.0f) + (((_2282 - _2292) + ((saturate(exp2((_2253.x - _959) * 432808.5f)) - _2282) * _2234)) * _2235))) + 1.0f);
        _2447 = ((((_2266 - _2293) + ((max(0.0f, (_959 - _2253.x)) - _2266) * _2234)) * _2235) + _2293);
        _2448 = false;
        _2449 = _2256.x;
        _2450 = _2256.y;
        _2451 = _2256.z;
      } else {
        _2446 = 1.0f;
        _2447 = 0.0f;
        _2448 = true;
        _2449 = 1.0h;
        _2450 = 1.0h;
        _2451 = 1.0h;
      }
      if (!_2448) {
        _2460 = (_2449 + _2212);
        _2461 = (_2450 + _2213);
        _2462 = (_2451 + _2214);
        _2463 = (_2446 + _2215);
        _2464 = (_2447 + _2216);
        _2465 = (_2217 + 1.0f);
      } else {
        _2460 = _2212;
        _2461 = _2213;
        _2462 = _2214;
        _2463 = _2215;
        _2464 = _2216;
        _2465 = _2217;
      }
      float _2476 = ((float((uint)((uint)(((int)(_974 * -1318861489)) & 16777215))) * _984) - _976) + _957;
      float _2477 = ((float((uint)((uint)(((int)(_974 * 1537293089)) & 16777215))) * _986) - _977) + _958;
      float _2480 = (_2476 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2481 = (_2477 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2482 = frac(_2480);
      float _2483 = frac(_2481);
      int _2486 = int(floor(_2480));
      int _2487 = int(floor(_2481));
      if (!((((uint)_2486 > (uint)(int)(_1006))) || (((uint)_2487 > (uint)(int)(_1007))))) {
        float4 _2495 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2486, _2487, _814, 0));
        float4 _2497 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2486) + 1u)), _2487, _814, 0));
        float4 _2499 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2486, ((int)((uint)(_2487) + 1u)), _814, 0));
        float4 _2501 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2486) + 1u)), ((int)((uint)(_2487) + 1u)), _814, 0));
        half4 _2504 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2486, _2487, _814, 0));
        float _2512 = max(0.0f, (_959 - _2495.x));
        float _2514 = max(0.0f, (_959 - _2499.x));
        float _2528 = saturate(exp2((_2495.x - _959) * 432808.5f));
        float _2530 = saturate(exp2((_2499.x - _959) * 432808.5f));
        float _2540 = ((saturate(exp2((_2497.x - _959) * 432808.5f)) - _2528) * _2482) + _2528;
        float _2541 = ((max(0.0f, (_959 - _2497.x)) - _2512) * _2482) + _2512;
        uint2 _2550 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2486, _2487, _814, 0));
        uint2 _2552 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2486) + 1u)), _2487, _814, 0));
        uint2 _2554 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2486, ((int)((uint)(_2487) + 1u)), _814, 0));
        uint2 _2556 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2486) + 1u)), ((int)((uint)(_2487) + 1u)), _814, 0));
        float _2592 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _2477, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _2476));
        float _2594 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2495.x, _2592) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2596 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _2477, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _2476));
        float _2598 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2495.x, _2596) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2600 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _2477, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _2476));
        float _2602 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2495.x, _2600) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2603 = -4.0f - _993;
        float _2621 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2497.x, _2592) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2623 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2497.x, _2596) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2625 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2497.x, _2600) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2643 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2499.x, _2592) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2645 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2499.x, _2596) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2647 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2499.x, _2600) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2665 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2501.x, _2592) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2667 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2501.x, _2596) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2669 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2501.x, _2600) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _2694 = ((max(max(max(float((bool)(uint)((_2550.x & 1) != 0)), saturate(max(max((max((_2594 + _2603), (_2603 - _2594)) * 0.25f), (max((_2598 + _2603), (_2603 - _2598)) * 0.25f)), (max((_2602 + _2603), (_2603 - _2602)) * 0.25f)))), max(float((bool)(uint)((_2552.x & 1) != 0)), saturate(max(max((max((_2621 + _2603), (_2603 - _2621)) * 0.25f), (max((_2623 + _2603), (_2603 - _2623)) * 0.25f)), (max((_2625 + _2603), (_2603 - _2625)) * 0.25f))))), max(max(float((bool)(uint)((_2554.x & 1) != 0)), saturate(max(max((max((_2643 + _2603), (_2603 - _2643)) * 0.25f), (max((_2645 + _2603), (_2603 - _2645)) * 0.25f)), (max((_2647 + _2603), (_2603 - _2647)) * 0.25f)))), max(float((bool)(uint)((_2556.x & 1) != 0)), saturate(max(max((max((_2665 + _2603), (_2603 - _2665)) * 0.25f), (max((_2667 + _2603), (_2603 - _2667)) * 0.25f)), (max((_2669 + _2603), (_2603 - _2669)) * 0.25f)))))) * ((_2540 + -1.0f) + (((_2530 - _2540) + ((saturate(exp2((_2501.x - _959) * 432808.5f)) - _2530) * _2482)) * _2483))) + 1.0f);
        _2695 = ((((_2514 - _2541) + ((max(0.0f, (_959 - _2501.x)) - _2514) * _2482)) * _2483) + _2541);
        _2696 = false;
        _2697 = _2504.x;
        _2698 = _2504.y;
        _2699 = _2504.z;
      } else {
        _2694 = 1.0f;
        _2695 = 0.0f;
        _2696 = true;
        _2697 = 1.0h;
        _2698 = 1.0h;
        _2699 = 1.0h;
      }
      if (!_2696) {
        _2708 = (_2697 + _2460);
        _2709 = (_2698 + _2461);
        _2710 = (_2699 + _2462);
        _2711 = (_2694 + _2463);
        _2712 = (_2695 + _2464);
        _2713 = (_2465 + 1.0f);
      } else {
        _2708 = _2460;
        _2709 = _2461;
        _2710 = _2462;
        _2711 = _2463;
        _2712 = _2464;
        _2713 = _2465;
      }
      float _2724 = ((float((uint)((uint)(((int)(_974 * -1770241169)) & 16777215))) * _984) - _976) + _957;
      float _2725 = ((float((uint)((uint)(((int)(_974 * 1357852417)) & 16777215))) * _986) - _977) + _958;
      float _2728 = (_2724 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2729 = (_2725 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2730 = frac(_2728);
      float _2731 = frac(_2729);
      int _2734 = int(floor(_2728));
      int _2735 = int(floor(_2729));
      if (!((((uint)_2734 > (uint)(int)(_1006))) || (((uint)_2735 > (uint)(int)(_1007))))) {
        float4 _2743 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2734, _2735, _814, 0));
        float4 _2745 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2734) + 1u)), _2735, _814, 0));
        float4 _2747 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2734, ((int)((uint)(_2735) + 1u)), _814, 0));
        float4 _2749 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2734) + 1u)), ((int)((uint)(_2735) + 1u)), _814, 0));
        half4 _2752 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2734, _2735, _814, 0));
        float _2760 = max(0.0f, (_959 - _2743.x));
        float _2762 = max(0.0f, (_959 - _2747.x));
        float _2776 = saturate(exp2((_2743.x - _959) * 432808.5f));
        float _2778 = saturate(exp2((_2747.x - _959) * 432808.5f));
        float _2788 = ((saturate(exp2((_2745.x - _959) * 432808.5f)) - _2776) * _2730) + _2776;
        float _2789 = ((max(0.0f, (_959 - _2745.x)) - _2760) * _2730) + _2760;
        uint2 _2798 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2734, _2735, _814, 0));
        uint2 _2800 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2734) + 1u)), _2735, _814, 0));
        uint2 _2802 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2734, ((int)((uint)(_2735) + 1u)), _814, 0));
        uint2 _2804 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2734) + 1u)), ((int)((uint)(_2735) + 1u)), _814, 0));
        float _2840 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _2725, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _2724));
        float _2842 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2743.x, _2840) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2844 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _2725, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _2724));
        float _2846 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2743.x, _2844) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2848 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _2725, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _2724));
        float _2850 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2743.x, _2848) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2851 = -4.0f - _993;
        float _2869 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2745.x, _2840) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2871 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2745.x, _2844) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2873 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2745.x, _2848) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2891 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2747.x, _2840) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2893 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2747.x, _2844) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2895 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2747.x, _2848) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _2913 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2749.x, _2840) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _2915 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2749.x, _2844) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _2917 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2749.x, _2848) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _2942 = ((max(max(max(float((bool)(uint)((_2798.x & 1) != 0)), saturate(max(max((max((_2842 + _2851), (_2851 - _2842)) * 0.25f), (max((_2846 + _2851), (_2851 - _2846)) * 0.25f)), (max((_2850 + _2851), (_2851 - _2850)) * 0.25f)))), max(float((bool)(uint)((_2800.x & 1) != 0)), saturate(max(max((max((_2869 + _2851), (_2851 - _2869)) * 0.25f), (max((_2871 + _2851), (_2851 - _2871)) * 0.25f)), (max((_2873 + _2851), (_2851 - _2873)) * 0.25f))))), max(max(float((bool)(uint)((_2802.x & 1) != 0)), saturate(max(max((max((_2891 + _2851), (_2851 - _2891)) * 0.25f), (max((_2893 + _2851), (_2851 - _2893)) * 0.25f)), (max((_2895 + _2851), (_2851 - _2895)) * 0.25f)))), max(float((bool)(uint)((_2804.x & 1) != 0)), saturate(max(max((max((_2913 + _2851), (_2851 - _2913)) * 0.25f), (max((_2915 + _2851), (_2851 - _2915)) * 0.25f)), (max((_2917 + _2851), (_2851 - _2917)) * 0.25f)))))) * ((_2788 + -1.0f) + (((_2778 - _2788) + ((saturate(exp2((_2749.x - _959) * 432808.5f)) - _2778) * _2730)) * _2731))) + 1.0f);
        _2943 = ((((_2762 - _2789) + ((max(0.0f, (_959 - _2749.x)) - _2762) * _2730)) * _2731) + _2789);
        _2944 = false;
        _2945 = _2752.x;
        _2946 = _2752.y;
        _2947 = _2752.z;
      } else {
        _2942 = 1.0f;
        _2943 = 0.0f;
        _2944 = true;
        _2945 = 1.0h;
        _2946 = 1.0h;
        _2947 = 1.0h;
      }
      if (!_2944) {
        _2956 = (_2945 + _2708);
        _2957 = (_2946 + _2709);
        _2958 = (_2947 + _2710);
        _2959 = (_2942 + _2711);
        _2960 = (_2943 + _2712);
        _2961 = (_2713 + 1.0f);
      } else {
        _2956 = _2708;
        _2957 = _2709;
        _2958 = _2710;
        _2959 = _2711;
        _2960 = _2712;
        _2961 = _2713;
      }
      float _2972 = ((float((uint)((uint)(((int)(_974 * -601883249)) & 16777215))) * _984) - _976) + _957;
      float _2973 = ((float((uint)((uint)(((int)(_974 * 1947444961)) & 16777215))) * _986) - _977) + _958;
      float _2976 = (_2972 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _2977 = (_2973 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _2978 = frac(_2976);
      float _2979 = frac(_2977);
      int _2982 = int(floor(_2976));
      int _2983 = int(floor(_2977));
      if (!((((uint)_2982 > (uint)(int)(_1006))) || (((uint)_2983 > (uint)(int)(_1007))))) {
        float4 _2991 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2982, _2983, _814, 0));
        float4 _2993 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2982) + 1u)), _2983, _814, 0));
        float4 _2995 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_2982, ((int)((uint)(_2983) + 1u)), _814, 0));
        float4 _2997 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_2982) + 1u)), ((int)((uint)(_2983) + 1u)), _814, 0));
        half4 _3000 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_2982, _2983, _814, 0));
        float _3008 = max(0.0f, (_959 - _2991.x));
        float _3010 = max(0.0f, (_959 - _2995.x));
        float _3024 = saturate(exp2((_2991.x - _959) * 432808.5f));
        float _3026 = saturate(exp2((_2995.x - _959) * 432808.5f));
        float _3036 = ((saturate(exp2((_2993.x - _959) * 432808.5f)) - _3024) * _2978) + _3024;
        float _3037 = ((max(0.0f, (_959 - _2993.x)) - _3008) * _2978) + _3008;
        uint2 _3046 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2982, _2983, _814, 0));
        uint2 _3048 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2982) + 1u)), _2983, _814, 0));
        uint2 _3050 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_2982, ((int)((uint)(_2983) + 1u)), _814, 0));
        uint2 _3052 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_2982) + 1u)), ((int)((uint)(_2983) + 1u)), _814, 0));
        float _3088 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _2973, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _2972));
        float _3090 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2991.x, _3088) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3092 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _2973, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _2972));
        float _3094 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2991.x, _3092) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3096 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _2973, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _2972));
        float _3098 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2991.x, _3096) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3099 = -4.0f - _993;
        float _3117 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2993.x, _3088) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3119 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2993.x, _3092) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3121 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2993.x, _3096) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3139 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2995.x, _3088) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3141 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2995.x, _3092) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3143 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2995.x, _3096) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3161 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _2997.x, _3088) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3163 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _2997.x, _3092) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3165 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _2997.x, _3096) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _3190 = ((max(max(max(float((bool)(uint)((_3046.x & 1) != 0)), saturate(max(max((max((_3090 + _3099), (_3099 - _3090)) * 0.25f), (max((_3094 + _3099), (_3099 - _3094)) * 0.25f)), (max((_3098 + _3099), (_3099 - _3098)) * 0.25f)))), max(float((bool)(uint)((_3048.x & 1) != 0)), saturate(max(max((max((_3117 + _3099), (_3099 - _3117)) * 0.25f), (max((_3119 + _3099), (_3099 - _3119)) * 0.25f)), (max((_3121 + _3099), (_3099 - _3121)) * 0.25f))))), max(max(float((bool)(uint)((_3050.x & 1) != 0)), saturate(max(max((max((_3139 + _3099), (_3099 - _3139)) * 0.25f), (max((_3141 + _3099), (_3099 - _3141)) * 0.25f)), (max((_3143 + _3099), (_3099 - _3143)) * 0.25f)))), max(float((bool)(uint)((_3052.x & 1) != 0)), saturate(max(max((max((_3161 + _3099), (_3099 - _3161)) * 0.25f), (max((_3163 + _3099), (_3099 - _3163)) * 0.25f)), (max((_3165 + _3099), (_3099 - _3165)) * 0.25f)))))) * ((_3036 + -1.0f) + (((_3026 - _3036) + ((saturate(exp2((_2997.x - _959) * 432808.5f)) - _3026) * _2978)) * _2979))) + 1.0f);
        _3191 = ((((_3010 - _3037) + ((max(0.0f, (_959 - _2997.x)) - _3010) * _2978)) * _2979) + _3037);
        _3192 = false;
        _3193 = _3000.x;
        _3194 = _3000.y;
        _3195 = _3000.z;
      } else {
        _3190 = 1.0f;
        _3191 = 0.0f;
        _3192 = true;
        _3193 = 1.0h;
        _3194 = 1.0h;
        _3195 = 1.0h;
      }
      if (!_3192) {
        _3204 = (_3193 + _2956);
        _3205 = (_3194 + _2957);
        _3206 = (_3195 + _2958);
        _3207 = (_3190 + _2959);
        _3208 = (_3191 + _2960);
        _3209 = (_2961 + 1.0f);
      } else {
        _3204 = _2956;
        _3205 = _2957;
        _3206 = _2958;
        _3207 = _2959;
        _3208 = _2960;
        _3209 = _2961;
      }
      float _3220 = ((float((uint)((uint)(((int)(_974 * 1166504879)) & 16777215))) * _984) - _976) + _957;
      float _3221 = ((float((uint)((uint)(((int)(_974 * 1335763649)) & 16777215))) * _986) - _977) + _958;
      float _3224 = (_3220 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _3225 = (_3221 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _3226 = frac(_3224);
      float _3227 = frac(_3225);
      int _3230 = int(floor(_3224));
      int _3231 = int(floor(_3225));
      if (!((((uint)_3230 > (uint)(int)(_1006))) || (((uint)_3231 > (uint)(int)(_1007))))) {
        float4 _3239 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_3230, _3231, _814, 0));
        float4 _3241 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_3230) + 1u)), _3231, _814, 0));
        float4 _3243 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_3230, ((int)((uint)(_3231) + 1u)), _814, 0));
        float4 _3245 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_3230) + 1u)), ((int)((uint)(_3231) + 1u)), _814, 0));
        half4 _3248 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_3230, _3231, _814, 0));
        float _3256 = max(0.0f, (_959 - _3239.x));
        float _3258 = max(0.0f, (_959 - _3243.x));
        float _3272 = saturate(exp2((_3239.x - _959) * 432808.5f));
        float _3274 = saturate(exp2((_3243.x - _959) * 432808.5f));
        float _3284 = ((saturate(exp2((_3241.x - _959) * 432808.5f)) - _3272) * _3226) + _3272;
        float _3285 = ((max(0.0f, (_959 - _3241.x)) - _3256) * _3226) + _3256;
        uint2 _3294 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_3230, _3231, _814, 0));
        uint2 _3296 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_3230) + 1u)), _3231, _814, 0));
        uint2 _3298 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_3230, ((int)((uint)(_3231) + 1u)), _814, 0));
        uint2 _3300 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_3230) + 1u)), ((int)((uint)(_3231) + 1u)), _814, 0));
        float _3336 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _3221, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _3220));
        float _3338 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3239.x, _3336) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3340 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _3221, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _3220));
        float _3342 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3239.x, _3340) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3344 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _3221, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _3220));
        float _3346 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3239.x, _3344) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3347 = -4.0f - _993;
        float _3365 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3241.x, _3336) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3367 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3241.x, _3340) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3369 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3241.x, _3344) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3387 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3243.x, _3336) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3389 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3243.x, _3340) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3391 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3243.x, _3344) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3409 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3245.x, _3336) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3411 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3245.x, _3340) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3413 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3245.x, _3344) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _3438 = ((max(max(max(float((bool)(uint)((_3294.x & 1) != 0)), saturate(max(max((max((_3338 + _3347), (_3347 - _3338)) * 0.25f), (max((_3342 + _3347), (_3347 - _3342)) * 0.25f)), (max((_3346 + _3347), (_3347 - _3346)) * 0.25f)))), max(float((bool)(uint)((_3296.x & 1) != 0)), saturate(max(max((max((_3365 + _3347), (_3347 - _3365)) * 0.25f), (max((_3367 + _3347), (_3347 - _3367)) * 0.25f)), (max((_3369 + _3347), (_3347 - _3369)) * 0.25f))))), max(max(float((bool)(uint)((_3298.x & 1) != 0)), saturate(max(max((max((_3387 + _3347), (_3347 - _3387)) * 0.25f), (max((_3389 + _3347), (_3347 - _3389)) * 0.25f)), (max((_3391 + _3347), (_3347 - _3391)) * 0.25f)))), max(float((bool)(uint)((_3300.x & 1) != 0)), saturate(max(max((max((_3409 + _3347), (_3347 - _3409)) * 0.25f), (max((_3411 + _3347), (_3347 - _3411)) * 0.25f)), (max((_3413 + _3347), (_3347 - _3413)) * 0.25f)))))) * ((_3284 + -1.0f) + (((_3274 - _3284) + ((saturate(exp2((_3245.x - _959) * 432808.5f)) - _3274) * _3226)) * _3227))) + 1.0f);
        _3439 = ((((_3258 - _3285) + ((max(0.0f, (_959 - _3245.x)) - _3258) * _3226)) * _3227) + _3285);
        _3440 = false;
        _3441 = _3248.x;
        _3442 = _3248.y;
        _3443 = _3248.z;
      } else {
        _3438 = 1.0f;
        _3439 = 0.0f;
        _3440 = true;
        _3441 = 1.0h;
        _3442 = 1.0h;
        _3443 = 1.0h;
      }
      if (!_3440) {
        _3452 = (_3441 + _3204);
        _3453 = (_3442 + _3205);
        _3454 = (_3443 + _3206);
        _3455 = (_3438 + _3207);
        _3456 = (_3439 + _3208);
        _3457 = (_3209 + 1.0f);
      } else {
        _3452 = _3204;
        _3453 = _3205;
        _3454 = _3206;
        _3455 = _3207;
        _3456 = _3208;
        _3457 = _3209;
      }
      float _3468 = ((float((uint)((uint)(((int)(_974 * -1696913969)) & 16777215))) * _984) - _976) + _957;
      float _3469 = ((float((uint)((uint)(((int)(_974 * 1882071713)) & 16777215))) * _986) - _977) + _958;
      float _3472 = (_3468 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _3473 = (_3469 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _3474 = frac(_3472);
      float _3475 = frac(_3473);
      int _3478 = int(floor(_3472));
      int _3479 = int(floor(_3473));
      if (!((((uint)_3478 > (uint)(int)(_1006))) || (((uint)_3479 > (uint)(int)(_1007))))) {
        float4 _3487 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_3478, _3479, _814, 0));
        float4 _3489 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_3478) + 1u)), _3479, _814, 0));
        float4 _3491 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_3478, ((int)((uint)(_3479) + 1u)), _814, 0));
        float4 _3493 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_3478) + 1u)), ((int)((uint)(_3479) + 1u)), _814, 0));
        half4 _3496 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_3478, _3479, _814, 0));
        float _3504 = max(0.0f, (_959 - _3487.x));
        float _3506 = max(0.0f, (_959 - _3491.x));
        float _3520 = saturate(exp2((_3487.x - _959) * 432808.5f));
        float _3522 = saturate(exp2((_3491.x - _959) * 432808.5f));
        float _3532 = ((saturate(exp2((_3489.x - _959) * 432808.5f)) - _3520) * _3474) + _3520;
        float _3533 = ((max(0.0f, (_959 - _3489.x)) - _3504) * _3474) + _3504;
        uint2 _3542 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_3478, _3479, _814, 0));
        uint2 _3544 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_3478) + 1u)), _3479, _814, 0));
        uint2 _3546 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_3478, ((int)((uint)(_3479) + 1u)), _814, 0));
        uint2 _3548 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_3478) + 1u)), ((int)((uint)(_3479) + 1u)), _814, 0));
        float _3584 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _3469, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _3468));
        float _3586 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3487.x, _3584) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3588 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _3469, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _3468));
        float _3590 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3487.x, _3588) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3592 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _3469, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _3468));
        float _3594 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3487.x, _3592) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3595 = -4.0f - _993;
        float _3613 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3489.x, _3584) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3615 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3489.x, _3588) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3617 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3489.x, _3592) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3635 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3491.x, _3584) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3637 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3491.x, _3588) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3639 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3491.x, _3592) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3657 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3493.x, _3584) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3659 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3493.x, _3588) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3661 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3493.x, _3592) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _3686 = ((max(max(max(float((bool)(uint)((_3542.x & 1) != 0)), saturate(max(max((max((_3586 + _3595), (_3595 - _3586)) * 0.25f), (max((_3590 + _3595), (_3595 - _3590)) * 0.25f)), (max((_3594 + _3595), (_3595 - _3594)) * 0.25f)))), max(float((bool)(uint)((_3544.x & 1) != 0)), saturate(max(max((max((_3613 + _3595), (_3595 - _3613)) * 0.25f), (max((_3615 + _3595), (_3595 - _3615)) * 0.25f)), (max((_3617 + _3595), (_3595 - _3617)) * 0.25f))))), max(max(float((bool)(uint)((_3546.x & 1) != 0)), saturate(max(max((max((_3635 + _3595), (_3595 - _3635)) * 0.25f), (max((_3637 + _3595), (_3595 - _3637)) * 0.25f)), (max((_3639 + _3595), (_3595 - _3639)) * 0.25f)))), max(float((bool)(uint)((_3548.x & 1) != 0)), saturate(max(max((max((_3657 + _3595), (_3595 - _3657)) * 0.25f), (max((_3659 + _3595), (_3595 - _3659)) * 0.25f)), (max((_3661 + _3595), (_3595 - _3661)) * 0.25f)))))) * ((_3532 + -1.0f) + (((_3522 - _3532) + ((saturate(exp2((_3493.x - _959) * 432808.5f)) - _3522) * _3474)) * _3475))) + 1.0f);
        _3687 = ((((_3506 - _3533) + ((max(0.0f, (_959 - _3493.x)) - _3506) * _3474)) * _3475) + _3533);
        _3688 = false;
        _3689 = _3496.x;
        _3690 = _3496.y;
        _3691 = _3496.z;
      } else {
        _3686 = 1.0f;
        _3687 = 0.0f;
        _3688 = true;
        _3689 = 1.0h;
        _3690 = 1.0h;
        _3691 = 1.0h;
      }
      if (!_3688) {
        _3700 = (_3689 + _3452);
        _3701 = (_3690 + _3453);
        _3702 = (_3691 + _3454);
        _3703 = (_3686 + _3455);
        _3704 = (_3687 + _3456);
        _3705 = (_3457 + 1.0f);
      } else {
        _3700 = _3452;
        _3701 = _3453;
        _3702 = _3454;
        _3703 = _3455;
        _3704 = _3456;
        _3705 = _3457;
      }
      float _3716 = ((float((uint)((uint)(((int)(_974 * -1959554065)) & 16777215))) * _984) - _976) + _957;
      float _3717 = ((float((uint)((uint)(((int)(_974 * -1569511807)) & 16777215))) * _986) - _977) + _958;
      float _3720 = (_3716 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _3721 = (_3717 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _3722 = frac(_3720);
      float _3723 = frac(_3721);
      int _3726 = int(floor(_3720));
      int _3727 = int(floor(_3721));
      if (!((((uint)_3726 > (uint)(int)(_1006))) || (((uint)_3727 > (uint)(int)(_1007))))) {
        float4 _3735 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_3726, _3727, _814, 0));
        float4 _3737 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_3726) + 1u)), _3727, _814, 0));
        float4 _3739 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_3726, ((int)((uint)(_3727) + 1u)), _814, 0));
        float4 _3741 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_3726) + 1u)), ((int)((uint)(_3727) + 1u)), _814, 0));
        half4 _3744 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_3726, _3727, _814, 0));
        float _3752 = max(0.0f, (_959 - _3735.x));
        float _3754 = max(0.0f, (_959 - _3739.x));
        float _3768 = saturate(exp2((_3735.x - _959) * 432808.5f));
        float _3770 = saturate(exp2((_3739.x - _959) * 432808.5f));
        float _3780 = ((saturate(exp2((_3737.x - _959) * 432808.5f)) - _3768) * _3722) + _3768;
        float _3781 = ((max(0.0f, (_959 - _3737.x)) - _3752) * _3722) + _3752;
        uint2 _3790 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_3726, _3727, _814, 0));
        uint2 _3792 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_3726) + 1u)), _3727, _814, 0));
        uint2 _3794 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_3726, ((int)((uint)(_3727) + 1u)), _814, 0));
        uint2 _3796 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_3726) + 1u)), ((int)((uint)(_3727) + 1u)), _814, 0));
        float _3832 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _3717, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _3716));
        float _3834 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3735.x, _3832) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3836 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _3717, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _3716));
        float _3838 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3735.x, _3836) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3840 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _3717, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _3716));
        float _3842 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3735.x, _3840) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3843 = -4.0f - _993;
        float _3861 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3737.x, _3832) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3863 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3737.x, _3836) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3865 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3737.x, _3840) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3883 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3739.x, _3832) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3885 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3739.x, _3836) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3887 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3739.x, _3840) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _3905 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3741.x, _3832) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _3907 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3741.x, _3836) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _3909 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3741.x, _3840) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _3934 = ((max(max(max(float((bool)(uint)((_3790.x & 1) != 0)), saturate(max(max((max((_3834 + _3843), (_3843 - _3834)) * 0.25f), (max((_3838 + _3843), (_3843 - _3838)) * 0.25f)), (max((_3842 + _3843), (_3843 - _3842)) * 0.25f)))), max(float((bool)(uint)((_3792.x & 1) != 0)), saturate(max(max((max((_3861 + _3843), (_3843 - _3861)) * 0.25f), (max((_3863 + _3843), (_3843 - _3863)) * 0.25f)), (max((_3865 + _3843), (_3843 - _3865)) * 0.25f))))), max(max(float((bool)(uint)((_3794.x & 1) != 0)), saturate(max(max((max((_3883 + _3843), (_3843 - _3883)) * 0.25f), (max((_3885 + _3843), (_3843 - _3885)) * 0.25f)), (max((_3887 + _3843), (_3843 - _3887)) * 0.25f)))), max(float((bool)(uint)((_3796.x & 1) != 0)), saturate(max(max((max((_3905 + _3843), (_3843 - _3905)) * 0.25f), (max((_3907 + _3843), (_3843 - _3907)) * 0.25f)), (max((_3909 + _3843), (_3843 - _3909)) * 0.25f)))))) * ((_3780 + -1.0f) + (((_3770 - _3780) + ((saturate(exp2((_3741.x - _959) * 432808.5f)) - _3770) * _3722)) * _3723))) + 1.0f);
        _3935 = ((((_3754 - _3781) + ((max(0.0f, (_959 - _3741.x)) - _3754) * _3722)) * _3723) + _3781);
        _3936 = false;
        _3937 = _3744.x;
        _3938 = _3744.y;
        _3939 = _3744.z;
      } else {
        _3934 = 1.0f;
        _3935 = 0.0f;
        _3936 = true;
        _3937 = 1.0h;
        _3938 = 1.0h;
        _3939 = 1.0h;
      }
      if (!_3936) {
        _3948 = (_3937 + _3700);
        _3949 = (_3938 + _3701);
        _3950 = (_3939 + _3702);
        _3951 = (_3934 + _3703);
        _3952 = (_3935 + _3704);
        _3953 = (_3705 + 1.0f);
      } else {
        _3948 = _3700;
        _3949 = _3701;
        _3950 = _3702;
        _3951 = _3703;
        _3952 = _3704;
        _3953 = _3705;
      }
      float _3964 = ((float((uint)((uint)(((int)(_974 * 1318665743)) & 16777215))) * _984) - _976) + _957;
      float _3965 = ((float((uint)((uint)(((int)(_974 * 1898753633)) & 16777215))) * _986) - _977) + _958;
      float _3968 = (_3964 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _3969 = (_3965 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _3970 = frac(_3968);
      float _3971 = frac(_3969);
      int _3974 = int(floor(_3968));
      int _3975 = int(floor(_3969));
      if (!((((uint)_3974 > (uint)(int)(_1006))) || (((uint)_3975 > (uint)(int)(_1007))))) {
        float4 _3983 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_3974, _3975, _814, 0));
        float4 _3985 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_3974) + 1u)), _3975, _814, 0));
        float4 _3987 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_3974, ((int)((uint)(_3975) + 1u)), _814, 0));
        float4 _3989 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_3974) + 1u)), ((int)((uint)(_3975) + 1u)), _814, 0));
        half4 _3992 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_3974, _3975, _814, 0));
        float _4000 = max(0.0f, (_959 - _3983.x));
        float _4002 = max(0.0f, (_959 - _3987.x));
        float _4016 = saturate(exp2((_3983.x - _959) * 432808.5f));
        float _4018 = saturate(exp2((_3987.x - _959) * 432808.5f));
        float _4028 = ((saturate(exp2((_3985.x - _959) * 432808.5f)) - _4016) * _3970) + _4016;
        float _4029 = ((max(0.0f, (_959 - _3985.x)) - _4000) * _3970) + _4000;
        uint2 _4038 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_3974, _3975, _814, 0));
        uint2 _4040 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_3974) + 1u)), _3975, _814, 0));
        uint2 _4042 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_3974, ((int)((uint)(_3975) + 1u)), _814, 0));
        uint2 _4044 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_3974) + 1u)), ((int)((uint)(_3975) + 1u)), _814, 0));
        float _4080 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _3965, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _3964));
        float _4082 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3983.x, _4080) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4084 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _3965, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _3964));
        float _4086 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3983.x, _4084) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4088 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _3965, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _3964));
        float _4090 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3983.x, _4088) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4091 = -4.0f - _993;
        float _4109 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3985.x, _4080) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4111 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3985.x, _4084) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4113 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3985.x, _4088) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4131 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3987.x, _4080) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4133 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3987.x, _4084) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4135 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3987.x, _4088) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4153 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _3989.x, _4080) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4155 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _3989.x, _4084) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4157 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _3989.x, _4088) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _4182 = ((max(max(max(float((bool)(uint)((_4038.x & 1) != 0)), saturate(max(max((max((_4082 + _4091), (_4091 - _4082)) * 0.25f), (max((_4086 + _4091), (_4091 - _4086)) * 0.25f)), (max((_4090 + _4091), (_4091 - _4090)) * 0.25f)))), max(float((bool)(uint)((_4040.x & 1) != 0)), saturate(max(max((max((_4109 + _4091), (_4091 - _4109)) * 0.25f), (max((_4111 + _4091), (_4091 - _4111)) * 0.25f)), (max((_4113 + _4091), (_4091 - _4113)) * 0.25f))))), max(max(float((bool)(uint)((_4042.x & 1) != 0)), saturate(max(max((max((_4131 + _4091), (_4091 - _4131)) * 0.25f), (max((_4133 + _4091), (_4091 - _4133)) * 0.25f)), (max((_4135 + _4091), (_4091 - _4135)) * 0.25f)))), max(float((bool)(uint)((_4044.x & 1) != 0)), saturate(max(max((max((_4153 + _4091), (_4091 - _4153)) * 0.25f), (max((_4155 + _4091), (_4091 - _4155)) * 0.25f)), (max((_4157 + _4091), (_4091 - _4157)) * 0.25f)))))) * ((_4028 + -1.0f) + (((_4018 - _4028) + ((saturate(exp2((_3989.x - _959) * 432808.5f)) - _4018) * _3970)) * _3971))) + 1.0f);
        _4183 = ((((_4002 - _4029) + ((max(0.0f, (_959 - _3989.x)) - _4002) * _3970)) * _3971) + _4029);
        _4184 = false;
        _4185 = _3992.x;
        _4186 = _3992.y;
        _4187 = _3992.z;
      } else {
        _4182 = 1.0f;
        _4183 = 0.0f;
        _4184 = true;
        _4185 = 1.0h;
        _4186 = 1.0h;
        _4187 = 1.0h;
      }
      if (!_4184) {
        _4196 = (_4185 + _3948);
        _4197 = (_4186 + _3949);
        _4198 = (_4187 + _3950);
        _4199 = (_4182 + _3951);
        _4200 = (_4183 + _3952);
        _4201 = (_3953 + 1.0f);
      } else {
        _4196 = _3948;
        _4197 = _3949;
        _4198 = _3950;
        _4199 = _3951;
        _4200 = _3952;
        _4201 = _3953;
      }
      float _4212 = ((float((uint)((uint)(((int)(_974 * 134521903)) & 16777215))) * _984) - _976) + _957;
      float _4213 = ((float((uint)((uint)(((int)(_974 * -483771839)) & 16777215))) * _986) - _977) + _958;
      float _4216 = (_4212 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _4217 = (_4213 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _4218 = frac(_4216);
      float _4219 = frac(_4217);
      int _4222 = int(floor(_4216));
      int _4223 = int(floor(_4217));
      if (!((((uint)_4222 > (uint)(int)(_1006))) || (((uint)_4223 > (uint)(int)(_1007))))) {
        float4 _4231 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_4222, _4223, _814, 0));
        float4 _4233 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_4222) + 1u)), _4223, _814, 0));
        float4 _4235 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_4222, ((int)((uint)(_4223) + 1u)), _814, 0));
        float4 _4237 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_4222) + 1u)), ((int)((uint)(_4223) + 1u)), _814, 0));
        half4 _4240 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_4222, _4223, _814, 0));
        float _4248 = max(0.0f, (_959 - _4231.x));
        float _4250 = max(0.0f, (_959 - _4235.x));
        float _4264 = saturate(exp2((_4231.x - _959) * 432808.5f));
        float _4266 = saturate(exp2((_4235.x - _959) * 432808.5f));
        float _4276 = ((saturate(exp2((_4233.x - _959) * 432808.5f)) - _4264) * _4218) + _4264;
        float _4277 = ((max(0.0f, (_959 - _4233.x)) - _4248) * _4218) + _4248;
        uint2 _4286 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_4222, _4223, _814, 0));
        uint2 _4288 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_4222) + 1u)), _4223, _814, 0));
        uint2 _4290 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_4222, ((int)((uint)(_4223) + 1u)), _814, 0));
        uint2 _4292 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_4222) + 1u)), ((int)((uint)(_4223) + 1u)), _814, 0));
        float _4328 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _4213, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _4212));
        float _4330 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4231.x, _4328) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4332 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _4213, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _4212));
        float _4334 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4231.x, _4332) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4336 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _4213, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _4212));
        float _4338 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4231.x, _4336) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4339 = -4.0f - _993;
        float _4357 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4233.x, _4328) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4359 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4233.x, _4332) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4361 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4233.x, _4336) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4379 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4235.x, _4328) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4381 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4235.x, _4332) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4383 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4235.x, _4336) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4401 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4237.x, _4328) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4403 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4237.x, _4332) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4405 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4237.x, _4336) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _4430 = ((max(max(max(float((bool)(uint)((_4286.x & 1) != 0)), saturate(max(max((max((_4330 + _4339), (_4339 - _4330)) * 0.25f), (max((_4334 + _4339), (_4339 - _4334)) * 0.25f)), (max((_4338 + _4339), (_4339 - _4338)) * 0.25f)))), max(float((bool)(uint)((_4288.x & 1) != 0)), saturate(max(max((max((_4357 + _4339), (_4339 - _4357)) * 0.25f), (max((_4359 + _4339), (_4339 - _4359)) * 0.25f)), (max((_4361 + _4339), (_4339 - _4361)) * 0.25f))))), max(max(float((bool)(uint)((_4290.x & 1) != 0)), saturate(max(max((max((_4379 + _4339), (_4339 - _4379)) * 0.25f), (max((_4381 + _4339), (_4339 - _4381)) * 0.25f)), (max((_4383 + _4339), (_4339 - _4383)) * 0.25f)))), max(float((bool)(uint)((_4292.x & 1) != 0)), saturate(max(max((max((_4401 + _4339), (_4339 - _4401)) * 0.25f), (max((_4403 + _4339), (_4339 - _4403)) * 0.25f)), (max((_4405 + _4339), (_4339 - _4405)) * 0.25f)))))) * ((_4276 + -1.0f) + (((_4266 - _4276) + ((saturate(exp2((_4237.x - _959) * 432808.5f)) - _4266) * _4218)) * _4219))) + 1.0f);
        _4431 = ((((_4250 - _4277) + ((max(0.0f, (_959 - _4237.x)) - _4250) * _4218)) * _4219) + _4277);
        _4432 = false;
        _4433 = _4240.x;
        _4434 = _4240.y;
        _4435 = _4240.z;
      } else {
        _4430 = 1.0f;
        _4431 = 0.0f;
        _4432 = true;
        _4433 = 1.0h;
        _4434 = 1.0h;
        _4435 = 1.0h;
      }
      if (!_4432) {
        _4444 = (_4433 + _4196);
        _4445 = (_4434 + _4197);
        _4446 = (_4435 + _4198);
        _4447 = (_4430 + _4199);
        _4448 = (_4431 + _4200);
        _4449 = (_4201 + 1.0f);
      } else {
        _4444 = _4196;
        _4445 = _4197;
        _4446 = _4198;
        _4447 = _4199;
        _4448 = _4200;
        _4449 = _4201;
      }
      float _4460 = ((float((uint)((uint)(((int)(_974 * -413252017)) & 16777215))) * _984) - _976) + _957;
      float _4461 = ((float((uint)((uint)(((int)(_974 * 2034977313)) & 16777215))) * _986) - _977) + _958;
      float _4464 = (_4460 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _4465 = (_4461 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _4466 = frac(_4464);
      float _4467 = frac(_4465);
      int _4470 = int(floor(_4464));
      int _4471 = int(floor(_4465));
      if (!((((uint)_4470 > (uint)(int)(_1006))) || (((uint)_4471 > (uint)(int)(_1007))))) {
        float4 _4479 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_4470, _4471, _814, 0));
        float4 _4481 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_4470) + 1u)), _4471, _814, 0));
        float4 _4483 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_4470, ((int)((uint)(_4471) + 1u)), _814, 0));
        float4 _4485 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_4470) + 1u)), ((int)((uint)(_4471) + 1u)), _814, 0));
        half4 _4488 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_4470, _4471, _814, 0));
        float _4496 = max(0.0f, (_959 - _4479.x));
        float _4498 = max(0.0f, (_959 - _4483.x));
        float _4512 = saturate(exp2((_4479.x - _959) * 432808.5f));
        float _4514 = saturate(exp2((_4483.x - _959) * 432808.5f));
        float _4524 = ((saturate(exp2((_4481.x - _959) * 432808.5f)) - _4512) * _4466) + _4512;
        float _4525 = ((max(0.0f, (_959 - _4481.x)) - _4496) * _4466) + _4496;
        uint2 _4534 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_4470, _4471, _814, 0));
        uint2 _4536 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_4470) + 1u)), _4471, _814, 0));
        uint2 _4538 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_4470, ((int)((uint)(_4471) + 1u)), _814, 0));
        uint2 _4540 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_4470) + 1u)), ((int)((uint)(_4471) + 1u)), _814, 0));
        float _4576 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _4461, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _4460));
        float _4578 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4479.x, _4576) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4580 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _4461, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _4460));
        float _4582 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4479.x, _4580) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4584 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _4461, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _4460));
        float _4586 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4479.x, _4584) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4587 = -4.0f - _993;
        float _4605 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4481.x, _4576) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4607 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4481.x, _4580) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4609 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4481.x, _4584) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4627 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4483.x, _4576) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4629 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4483.x, _4580) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4631 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4483.x, _4584) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4649 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4485.x, _4576) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4651 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4485.x, _4580) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4653 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4485.x, _4584) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _4678 = ((max(max(max(float((bool)(uint)((_4534.x & 1) != 0)), saturate(max(max((max((_4578 + _4587), (_4587 - _4578)) * 0.25f), (max((_4582 + _4587), (_4587 - _4582)) * 0.25f)), (max((_4586 + _4587), (_4587 - _4586)) * 0.25f)))), max(float((bool)(uint)((_4536.x & 1) != 0)), saturate(max(max((max((_4605 + _4587), (_4587 - _4605)) * 0.25f), (max((_4607 + _4587), (_4587 - _4607)) * 0.25f)), (max((_4609 + _4587), (_4587 - _4609)) * 0.25f))))), max(max(float((bool)(uint)((_4538.x & 1) != 0)), saturate(max(max((max((_4627 + _4587), (_4587 - _4627)) * 0.25f), (max((_4629 + _4587), (_4587 - _4629)) * 0.25f)), (max((_4631 + _4587), (_4587 - _4631)) * 0.25f)))), max(float((bool)(uint)((_4540.x & 1) != 0)), saturate(max(max((max((_4649 + _4587), (_4587 - _4649)) * 0.25f), (max((_4651 + _4587), (_4587 - _4651)) * 0.25f)), (max((_4653 + _4587), (_4587 - _4653)) * 0.25f)))))) * ((_4524 + -1.0f) + (((_4514 - _4524) + ((saturate(exp2((_4485.x - _959) * 432808.5f)) - _4514) * _4466)) * _4467))) + 1.0f);
        _4679 = ((((_4498 - _4525) + ((max(0.0f, (_959 - _4485.x)) - _4498) * _4466)) * _4467) + _4525);
        _4680 = false;
        _4681 = _4488.x;
        _4682 = _4488.y;
        _4683 = _4488.z;
      } else {
        _4678 = 1.0f;
        _4679 = 0.0f;
        _4680 = true;
        _4681 = 1.0h;
        _4682 = 1.0h;
        _4683 = 1.0h;
      }
      if (!_4680) {
        _4692 = (_4681 + _4444);
        _4693 = (_4682 + _4445);
        _4694 = (_4683 + _4446);
        _4695 = (_4678 + _4447);
        _4696 = (_4679 + _4448);
        _4697 = (_4449 + 1.0f);
      } else {
        _4692 = _4444;
        _4693 = _4445;
        _4694 = _4446;
        _4695 = _4447;
        _4696 = _4448;
        _4697 = _4449;
      }
      float _4708 = ((float((uint)((uint)(((int)(_974 * 192849007)) & 16777215))) * _984) - _976) + _957;
      float _4709 = ((float((uint)((uint)(((int)(_974 * 1820286465)) & 16777215))) * _986) - _977) + _958;
      float _4712 = (_4708 * _dynmaicShadowSizeAndInvSize.x) + -0.5f;
      float _4713 = (_4709 * _dynmaicShadowSizeAndInvSize.y) + -0.5f;
      float _4714 = frac(_4712);
      float _4715 = frac(_4713);
      int _4718 = int(floor(_4712));
      int _4719 = int(floor(_4713));
      if (!((((uint)_4718 > (uint)(int)(_1006))) || (((uint)_4719 > (uint)(int)(_1007))))) {
        float4 _4727 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_4718, _4719, _814, 0));
        float4 _4729 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_4718) + 1u)), _4719, _814, 0));
        float4 _4731 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(_4718, ((int)((uint)(_4719) + 1u)), _814, 0));
        float4 _4733 = __3__36__0__0__g_dynamicShadowDepthArray.Load(int4(((int)((uint)(_4718) + 1u)), ((int)((uint)(_4719) + 1u)), _814, 0));
        half4 _4736 = __3__36__0__0__g_dynamicShadowColorArray.Load(int4(_4718, _4719, _814, 0));
        float _4744 = max(0.0f, (_959 - _4727.x));
        float _4746 = max(0.0f, (_959 - _4731.x));
        float _4760 = saturate(exp2((_4727.x - _959) * 432808.5f));
        float _4762 = saturate(exp2((_4731.x - _959) * 432808.5f));
        float _4772 = ((saturate(exp2((_4729.x - _959) * 432808.5f)) - _4760) * _4714) + _4760;
        float _4773 = ((max(0.0f, (_959 - _4729.x)) - _4744) * _4714) + _4744;
        uint2 _4782 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_4718, _4719, _814, 0));
        uint2 _4784 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_4718) + 1u)), _4719, _814, 0));
        uint2 _4786 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(_4718, ((int)((uint)(_4719) + 1u)), _814, 0));
        uint2 _4788 = __3__36__0__0__g_dynamicShadowStencilArray.Load(int4(((int)((uint)(_4718) + 1u)), ((int)((uint)(_4719) + 1u)), _814, 0));
        float _4824 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).x), _4709, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).x) * _4708));
        float _4826 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4727.x, _4824) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4828 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).y), _4709, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).y) * _4708));
        float _4830 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4727.x, _4828) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4832 = mad((float4(_invDynamicShadowViewProj[_814][0][1], _invDynamicShadowViewProj[_814][1][1], _invDynamicShadowViewProj[_814][2][1], _invDynamicShadowViewProj[_814][3][1]).z), _4709, ((float4(_invDynamicShadowViewProj[_814][0][0], _invDynamicShadowViewProj[_814][1][0], _invDynamicShadowViewProj[_814][2][0], _invDynamicShadowViewProj[_814][3][0]).z) * _4708));
        float _4834 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4727.x, _4832) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4835 = -4.0f - _993;
        float _4853 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4729.x, _4824) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4855 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4729.x, _4828) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4857 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4729.x, _4832) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4875 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4731.x, _4824) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4877 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4731.x, _4828) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4879 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4731.x, _4832) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        float _4897 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).x), _4733.x, _4824) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).x);
        float _4899 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).y), _4733.x, _4828) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).y);
        float _4901 = mad((float4(_invDynamicShadowViewProj[_814][0][2], _invDynamicShadowViewProj[_814][1][2], _invDynamicShadowViewProj[_814][2][2], _invDynamicShadowViewProj[_814][3][2]).z), _4733.x, _4832) + (float4(_invDynamicShadowViewProj[_814][0][3], _invDynamicShadowViewProj[_814][1][3], _invDynamicShadowViewProj[_814][2][3], _invDynamicShadowViewProj[_814][3][3]).z);
        _4926 = ((max(max(max(float((bool)(uint)((_4782.x & 1) != 0)), saturate(max(max((max((_4826 + _4835), (_4835 - _4826)) * 0.25f), (max((_4830 + _4835), (_4835 - _4830)) * 0.25f)), (max((_4834 + _4835), (_4835 - _4834)) * 0.25f)))), max(float((bool)(uint)((_4784.x & 1) != 0)), saturate(max(max((max((_4853 + _4835), (_4835 - _4853)) * 0.25f), (max((_4855 + _4835), (_4835 - _4855)) * 0.25f)), (max((_4857 + _4835), (_4835 - _4857)) * 0.25f))))), max(max(float((bool)(uint)((_4786.x & 1) != 0)), saturate(max(max((max((_4875 + _4835), (_4835 - _4875)) * 0.25f), (max((_4877 + _4835), (_4835 - _4877)) * 0.25f)), (max((_4879 + _4835), (_4835 - _4879)) * 0.25f)))), max(float((bool)(uint)((_4788.x & 1) != 0)), saturate(max(max((max((_4897 + _4835), (_4835 - _4897)) * 0.25f), (max((_4899 + _4835), (_4835 - _4899)) * 0.25f)), (max((_4901 + _4835), (_4835 - _4901)) * 0.25f)))))) * ((_4772 + -1.0f) + (((_4762 - _4772) + ((saturate(exp2((_4733.x - _959) * 432808.5f)) - _4762) * _4714)) * _4715))) + 1.0f);
        _4927 = ((((_4746 - _4773) + ((max(0.0f, (_959 - _4733.x)) - _4746) * _4714)) * _4715) + _4773);
        _4928 = false;
        _4929 = _4736.x;
        _4930 = _4736.y;
        _4931 = _4736.z;
      } else {
        _4926 = 1.0f;
        _4927 = 0.0f;
        _4928 = true;
        _4929 = 1.0h;
        _4930 = 1.0h;
        _4931 = 1.0h;
      }
      if (!_4928) {
        _4940 = (_4929 + _4692);
        _4941 = (_4930 + _4693);
        _4942 = (_4931 + _4694);
        _4943 = (_4926 + _4695);
        _4944 = (_4927 + _4696);
        _4945 = (_4697 + 1.0f);
      } else {
        _4940 = _4692;
        _4941 = _4693;
        _4942 = _4694;
        _4943 = _4695;
        _4944 = _4696;
        _4945 = _4697;
      }
      float _4947 = 1.0f / max(_4945, 1.0f);
      float _4957 = max((_4945 + 1.0f), 1.0f);
      half _4961 = half(float(_4940 + _4929) / _4957);
      half _4962 = half(float(_4941 + _4930) / _4957);
      half _4963 = half(float(_4942 + _4931) / _4957);
      if (_814 == 1) {
        float _4966 = float(_4961);
        float _4967 = float(_4962);
        float _4968 = float(_4963);
        float _4969 = -0.0f - _699;
        _4983 = half((_4966 + _699) + (_4966 * _4969));
        _4984 = half((_4967 + _699) + (_4967 * _4969));
        _4985 = half((_4968 + _699) + (_4968 * _4969));
      } else {
        _4983 = _4961;
        _4984 = _4962;
        _4985 = _4963;
      }
      float2 _4988 = __3__36__0__0__g_raytracedShadow.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_67, _68), 0.0f);
      float _4993 = _115 * 0.05000000074505806f;
      float _4995 = 1.0f / _bufferSizeAndInvSize.x;
      float _4996 = 1.0f / _bufferSizeAndInvSize.y;
      _5005 = _4988.x;
      _5006 = 1.0f;
      _5007 = 0;
      while(true) {
        float _5016 = float((int)(RAYTRACED_SHADOW_JITTER[((int)(0u + (_5007 * 2)))]));
        float _5017 = float((int)(RAYTRACED_SHADOW_JITTER[((int)(1u + (_5007 * 2)))]));
        float _5018 = _5016 + _60;
        float _5019 = _5017 + _61;
        uint _5023 = __3__36__0__0__g_depthStencil.Load(int3(int(_5018), int(_5019), 0));
        float _5032 = ((_4995 * 2.0f) * _5018) + -1.0f;
        float _5033 = 1.0f - ((_4996 * 2.0f) * _5019);
        float _5036 = max(1.0000000116860974e-07f, (float((uint)((uint)(_5023.x & 16777215))) * 5.960465188081798e-08f));
        float _5073 = mad((_invViewProjRelative[3].z), _5036, mad((_invViewProjRelative[3].y), _5033, ((_invViewProjRelative[3].x) * _5032))) + (_invViewProjRelative[3].w);
        float _5077 = ((mad((_invViewProjRelative[0].z), _5036, mad((_invViewProjRelative[0].y), _5033, ((_invViewProjRelative[0].x) * _5032))) + (_invViewProjRelative[0].w)) / _5073) - _152;
        float _5078 = ((mad((_invViewProjRelative[1].z), _5036, mad((_invViewProjRelative[1].y), _5033, ((_invViewProjRelative[1].x) * _5032))) + (_invViewProjRelative[1].w)) / _5073) - _153;
        float _5079 = ((mad((_invViewProjRelative[2].z), _5036, mad((_invViewProjRelative[2].y), _5033, ((_invViewProjRelative[2].x) * _5032))) + (_invViewProjRelative[2].w)) / _5073) - _154;
        float _5085 = sqrt(((_5078 * _5078) + (_5077 * _5077)) + (_5079 * _5079));
        float _5087 = abs((_nearFarProj.x / _5036) - _115);
        float _5088 = _5087 * _5087;
        float2 _5095 = __3__36__0__0__g_raytracedShadow.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(((_5016 * _4995) + _67), ((_5017 * _4996) + _68)), 0.0f);
        if (!(_5088 > (_4993 * _4993))) {
          _5108 = (exp2((-1.4426950216293335f / ((_115 * 0.019999999552965164f) + 0.25f)) * ((_5088 * 20.0f) + ((_5085 * _5085) * 0.019999999552965164f))) * max(0.019999999552965164f, _4988.y));
        } else {
          _5108 = 0.0f;
        }
        float _5110 = (_5108 * _5095.x) + _5005;
        float _5111 = _5108 + _5006;
        if (!((_5007 + 1) == 8)) {
          _5005 = _5110;
          _5006 = _5111;
          _5007 = (_5007 + 1);
          continue;
        }
        _5234 = min(_556, min((_4947 * _4943), ((1.0f / max(9.999999974752427e-07f, _5111)) * _5110)));
        _5235 = (_4947 * _4944);
        _5236 = _4983;
        _5237 = _4984;
        _5238 = _4985;
        break;
      }
    }
    bool _5239 = (_813 != 0);
    float _5241 = min(_556, select(_5239, _5234, 1.0f));
    float _5245 = select((_697 != 0), select(_5239, (_5235 * 400.0f), 4e+06f), 1.0f);
    float _5260 = (_5241 - (_shadowAOParams.x * _5241)) + _shadowAOParams.x;
    [branch]
    if (_5260 > 0.0f) {
      int _5270 = _76 & 126;
      bool _5271 = (_5270 == 64);
      bool _5272 = (_80 == 66);
      bool _5273 = (_5271) || (_5272);
      float _5274 = select(_5273, 2.0f, 4.0f);
      if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
        _5290 = _sunDirection.x;
        _5291 = _sunDirection.y;
        _5292 = _sunDirection.z;
      } else {
        _5290 = _moonDirection.x;
        _5291 = _moonDirection.y;
        _5292 = _moonDirection.z;
      }
      int _5293 = ((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)) & 3;
      int _5297 = ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)) & 3;
      float _5316 = float((uint)(uint)(_frameNumber.x));
      float _5327 = (frac(((_5316 * 92.0f) + _60) * 0.0078125f) * 128.0f) + -64.34062194824219f;
      float _5328 = (frac(((_5316 * 71.0f) + _61) * 0.0078125f) * 128.0f) + -72.46562194824219f;
      float _5333 = frac(dot(float3((_5327 * _5327), (_5328 * _5328), (_5328 * _5327)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
      float _5349 = frac((float((uint)((uint)((int)(uint(_5333 * 51540816.0f)) & 65535))) * 1.52587890625e-05f) + (float((uint)((uint)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_5297 << 1) | _5297) << 1) & 10) | (((_5293 << 1) | _5293) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_5297 << 1) | _5297) << 1) & 10) | (((_5293 << 1) | _5293) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_5297 << 1) | _5297) << 1) & 10) | (((_5293 << 1) | _5293) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_5297 << 1) | _5297) << 1) & 10) | (((_5293 << 1) | _5293) & 5)))) >> 2) & 858993459))) >> 1) & 21)))) * 0.03125f)) * 6.2831854820251465f;
      float _5353 = (((1.0f - _shadowAOParams.z) * 2.3283064365386963e-10f) * float((uint)((uint)(reversebits((float)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_5297 << 1) | _5297) << 1) & 10) | (((_5293 << 1) | _5293) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_5297 << 1) | _5297) << 1) & 10) | (((_5293 << 1) | _5293) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_5297 << 1) | _5297) << 1) & 10) | (((_5293 << 1) | _5293) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_5297 << 1) | _5297) << 1) & 10) | (((_5293 << 1) | _5293) & 5)))) >> 2) & 858993459))) >> 1) & 21))) ^ (int)(uint(_5333 * 287478368.0f)))))) + _shadowAOParams.z;
      float _5356 = sqrt(1.0f - (_5353 * _5353));
      float _5359 = cos(_5349) * _5356;
      float _5360 = sin(_5349) * _5356;
      float _5362 = select((_5292 >= 0.0f), 1.0f, -1.0f);
      float _5365 = -0.0f - (1.0f / (_5362 + _5292));
      float _5366 = _5291 * _5365;
      float _5367 = _5366 * _5290;
      float _5368 = _5362 * _5290;
      float _5377 = mad(_5353, _5290, mad(_5360, _5367, ((((_5368 * _5290) * _5365) + 1.0f) * _5359)));
      float _5381 = mad(_5353, _5291, mad(_5360, (_5362 + (_5366 * _5291)), ((_5359 * _5362) * _5367)));
      float _5385 = mad(_5353, _5292, mad(_5360, (-0.0f - _5291), (-0.0f - (_5368 * _5359))));
      if (CONTACT_SHADOW_STABLE_DIRECTION == 1.f) {
        _5377 = _5290;
        _5381 = _5291;
        _5385 = _5292;
      }
      int _5386 = select(_5271, 10, 8);
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f) {
        _5386 = (int)(lerp(float(_5386), CONTACT_SHADOW_RT_MARCH_SAMPLES, CONTACT_SHADOW_RT_TUNING) + 0.5f);
      }
      if (!_170) {
        _5392 = min(0.5f, ((_115 * 0.0024999999441206455f) + 0.25f));
      } else {
        _5392 = 1.0f;
      }
      float _5398 = ((abs(_5291) * (select(_5273, 12.0f, 2.0f) - _5274)) + _5274) * select(_172, lerp(0.009999999776482582f, CONTACT_SHADOW_RT_REACH_TARGET, CONTACT_SHADOW_RT_TUNING), 0.10000000149011612f);
      if (!_172) {
        _5406 = max((_115 * select(((uint)(_80 + -11) < (uint)9), 0.00800000037997961f, 0.029999999329447746f)), _5398);
      } else {
        _5406 = _5398;
      }
      float _5412 = saturate(((_115 * 0.009999999776482582f) * (1.0f - saturate(dot(float3(_103, _104, _105), float3((-0.0f - (_152 * _156)), (-0.0f - (_153 * _156)), (-0.0f - (_154 * _156))))))) + 0.009999999776482582f);
      bool _5419 = (_terrainNormalParams.z > 0.0f);
      if (_5419) {
        float _5423 = float((uint)((uint)(((int)(_frameNumber.x * 73)) & 255)));
        _5584 = frac(frac(dot(float2(((_5423 * 32.665000915527344f) + _60), ((_5423 * 11.8149995803833f) + _61)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
      } else {
        int _5465 = ((int)(((((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) + 1013904242u));
        int _5473 = ((int)(((((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
        uint _5477 = ((uint)(_5473 ^ (((uint)(((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))) >> 5) + -939442524))) + (((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))));
        int _5489 = ((int)(((((uint)((((int)((_5477 << 4) + (uint)(-1383041155))) ^ ((int)(_5477 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_5477) >> 5)) + 2123724318u)))) + (((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5477 << 4) + (uint)(-1383041155))) ^ ((int)(_5477 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_5477) >> 5)) + 2123724318u)))) + (((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) + 2027808484u));
        int _5497 = ((int)(((((uint)(_5489 ^ (((uint)(((uint)((((int)((_5477 << 4) + (uint)(-1383041155))) ^ ((int)(_5477 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_5477) >> 5)) + 2123724318u)))) + (((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _5477) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)(_5489 ^ (((uint)(((uint)((((int)((_5477 << 4) + (uint)(-1383041155))) ^ ((int)(_5477 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_5477) >> 5)) + 2123724318u)))) + (((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _5477) + 2027808484u));
        uint _5501 = ((uint)(_5497 ^ ((int)(((uint)((uint)(((uint)(_5489 ^ (((uint)(((uint)((((int)((_5477 << 4) + (uint)(-1383041155))) ^ ((int)(_5477 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_5477) >> 5)) + 2123724318u)))) + (((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _5477) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5477 << 4) + (uint)(-1383041155))) ^ ((int)(_5477 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_5477) >> 5)) + 2123724318u)))) + (((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x))));
        uint _5509 = ((uint)((((int)((_5501 << 4) + (uint)(-1556008596))) ^ ((int)(_5501 + 387276957u))) ^ (((uint)(_5501) >> 5) + -939442524))) + (((uint)(_5489 ^ (((uint)(((uint)((((int)((_5477 << 4) + (uint)(-1383041155))) ^ ((int)(_5477 + (uint)(-626627285)))) ^ ((int)(((uint)((uint)(_5477) >> 5)) + 2123724318u)))) + (((uint)(_5465 ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) + 1013904242u))) ^ (((uint)(((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)) >> 5) + -939442524))) + (uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524))))) >> 5)) + 2123724318u)))) + (((uint)((((int)(((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) << 4) + (uint)(-1383041155))) ^ ((int)((uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) + (uint)(-1640531527)))) ^ ((int)(((uint)((uint)(uint((_bufferSizeAndInvSize.x * _61) + _60) + ((uint)((((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)))) ^ (((uint)((uint)(_frameNumber.x)) >> 5) + -939442524)))) >> 5)) + 2123724318u)))) + (uint)(_frameNumber.x)))) >> 5) + -939442524))) + _5477);
        int _5540 = (((int)(((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501)) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501)) + 1401181199u))) ^ (((uint)(((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501)) >> 5) + -939442524);
        int _5553 = ((int)(((((uint)((((int)((((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501))) + (uint)(-239350328)));
        uint _5557 = ((uint)(_5553 ^ (((uint)(((uint)((((int)((((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501))) >> 5) + -939442524))) + ((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509));
        if (((int)(_5557) & 16777215) == 0) {
          int _5572 = ((int)(((((uint)((((int)((_5557 << 4) + (uint)(-1383041155))) ^ ((int)(_5557 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_5557) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5557 << 4) + (uint)(-1383041155))) ^ ((int)(_5557 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_5557) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501)))) + (uint)(-1879881855)));
          uint _5576 = ((uint)(_5572 ^ (((uint)(((uint)((((int)((_5557 << 4) + (uint)(-1383041155))) ^ ((int)(_5557 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_5557) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_5540) + (((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501) >> 5) + -939442524))) + _5509) >> 5)) + 2123724318u)))) + (((uint)((((int)((_5509 << 4) + (uint)(-1383041155))) ^ ((int)(_5509 + 387276957u))) ^ ((int)(((uint)((uint)(_5509) >> 5)) + 2123724318u)))) + _5501)))) >> 5) + -939442524))) + _5557;
          _5578 = (int)(_5576);
        } else {
          _5578 = (int)(_5557);
        }
        _5584 = (float((uint)((uint)(((int)(_5578 * 48271)) & 16777215))) * 5.960464477539063e-08f);
      }
      if ((_5272) || ((((_80 != 15)) && (((uint)(_80 + -12) < (uint)7))))) {
        _5597 = (_5584 * lerp(10.0f, CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING));
      } else {
        if (_80 == 15) {
          _5597 = ((lerp((10.0f - (saturate(_115 * 0.0010000000474974513f) * 9.0f)), CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING)) * _5584);
        } else {
          _5597 = _5584;
        }
      }
      if (_5270 == 12) {
        _5610 = (0.10000000149011612f - (abs(_5381) * 0.05000000074505806f));
      } else {
        if ((uint)_80 > (uint)15) {
          if ((((uint)_80 < (uint)20)) || ((_80 == 107))) {
            _5610 = (0.10000000149011612f - (abs(_5381) * 0.05000000074505806f));
          } else {
            _5610 = 0.0f;
          }
        } else {
          _5610 = 0.0f;
        }
      }
      if (!_172) {
        float _5612 = _5610 * _156;
        _5620 = (_152 - (_5612 * _152));
        _5621 = (_153 - (_5612 * _153));
        _5622 = (_154 - (_5612 * _154));
      } else {
        _5620 = _152;
        _5621 = _153;
        _5622 = _154;
      }
      if (!_5419) {
        float _5626 = saturate(_115 * 0.0625f) * 0.05000000074505806f;
        _5631 = (_5626 * _103);
        _5632 = (_5626 * _104);
        _5633 = (_5626 * _105);
      } else {
        _5631 = 0.0f;
        _5632 = 0.0f;
        _5633 = 0.0f;
      }
      float _5634 = _5631 + _5620;
      float _5635 = _5632 + _5621;
      float _5636 = _5633 + _5622;
      float _5649 = mad((_viewRelative[2].z), _5636, mad((_viewRelative[2].y), _5635, ((_viewRelative[2].x) * _5634))) + (_viewRelative[2].w);
      float _5652 = mad((_viewRelative[2].z), _5385, mad((_viewRelative[2].y), _5381, ((_viewRelative[2].x) * _5377)));
      bool _5657 = (((_5652 * _5406) + _5649) < _nearFarProj.x);
      if (_115 < 8.0f) {
        float _5661 = select(_5657, ((_nearFarProj.x - _5649) / _5652), _5406);
        float _5693 = mad((_viewProjRelative[2].z), _5636, mad((_viewProjRelative[2].y), _5635, ((_viewProjRelative[2].x) * _5634))) + (_viewProjRelative[2].w);
        float _5697 = mad((_viewProjRelative[3].z), _5636, mad((_viewProjRelative[3].y), _5635, ((_viewProjRelative[3].x) * _5634))) + (_viewProjRelative[3].w);
        float _5701 = (_5661 * _5377) + _5634;
        float _5702 = (_5661 * _5381) + _5635;
        float _5703 = (_5661 * _5385) + _5636;
        float _5719 = mad((_viewProjRelative[3].z), _5703, mad((_viewProjRelative[3].y), _5702, ((_viewProjRelative[3].x) * _5701))) + (_viewProjRelative[3].w);
        float _5720 = (mad((_viewProjRelative[0].z), _5636, mad((_viewProjRelative[0].y), _5635, ((_viewProjRelative[0].x) * _5634))) + (_viewProjRelative[0].w)) / _5697;
        float _5721 = (mad((_viewProjRelative[1].z), _5636, mad((_viewProjRelative[1].y), _5635, ((_viewProjRelative[1].x) * _5634))) + (_viewProjRelative[1].w)) / _5697;
        float _5722 = _5693 / _5697;
        float _5726 = ((mad((_viewProjRelative[0].z), _5703, mad((_viewProjRelative[0].y), _5702, ((_viewProjRelative[0].x) * _5701))) + (_viewProjRelative[0].w)) / _5719) - _5720;
        float _5727 = ((mad((_viewProjRelative[1].z), _5703, mad((_viewProjRelative[1].y), _5702, ((_viewProjRelative[1].x) * _5701))) + (_viewProjRelative[1].w)) / _5719) - _5721;
        float _5730 = 1.0f / float((uint)(uint)(_5386));
        float _5741 = max(_5730, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_5726)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_5727))) * _5730))));
        float _5742 = _5741 * (((mad((_viewProjRelative[2].z), _5703, mad((_viewProjRelative[2].y), _5702, ((_viewProjRelative[2].x) * _5701))) + (_viewProjRelative[2].w)) / _5719) - _5722);
        float _5760 = (max(abs(_5742), (_5722 - ((mad((_proj[2].z), _115, 0.0f) + _5693) / (mad((_proj[3].z), _115, 0.0f) + _5697)))) * _5392) * max(0.0625f, _5730);
        float _5761 = _5741 * _5730;
        float _5763 = (_5726 * 0.5f) * _5761;
        float _5765 = (_5727 * -0.5f) * _5761;
        float _5766 = _5742 * _5730;
        float _5773 = max(_5597, (1.0f / max((abs(_5763) * _bufferSizeAndInvSize.x), (abs(_5765) * _bufferSizeAndInvSize.y))));
        float _5780 = 0.5f / _bufferSizeAndInvSize.x;
        _5782 = 0;
        _5783 = (((_5720 * 0.5f) + 0.5f) + (_5773 * _5763));
        _5784 = ((0.5f - (_5721 * 0.5f)) + (_5773 * _5765));
        _5785 = ((_5773 * _5766) + _5722);
        _5786 = _5597;
        _5787 = _5412;
        _5788 = 0;
        _5789 = 1.0f;
        _5790 = 0.0f;
        while(true) {
          uint _5799 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_5783, _5780), (1.0f - _5780)) * _bufferSizeAndInvSize.x), int(_5784 * _bufferSizeAndInvSize.y), 0));
          int _5801 = (uint)((uint)(_5799.x)) >> 24;
          float _5804 = float((uint)((uint)(_5799.x & 16777215))) * 5.960465188081798e-08f;
          int _5805 = _5801 & 127;
          bool _5806 = (_5788 == 0);
          float _5807 = select(_5806, 1.0f, _5787);
          float _5811 = _nearFarProj.x / max(1.0000000116860974e-07f, _5804);
          float _5812 = _5785 - _5804;
          float _5815 = _5811 - (_nearFarProj.x / max(1.0000000116860974e-07f, _5785));
          bool _5818 = (abs(_5812 + _5760) < _5760);
          int _5819 = (int)(uint)((int)(_5818));
          if (_5818) {
            if (((_5805 == 7)) || ((((_5805 == 54)) || (((((_5801 & 126) == 66)) || (((((uint)(_5805 + -5) < (uint)2)) || ((((_5805 == 107)) || ((((_5805 == 26)) || (((((uint)(_5805 + -27) < (uint)2)) || ((((_5805 == 106)) || (((((_5801 & 125) == 105)) || ((((_5805 == 18)) || (((uint)(_5805 + -19) < (uint)2))))))))))))))))))))) {
              _5853 = true;
              _5860 = ((int)(uint)((int)(((_5815 < 0.0f)) && ((_5815 > select(_5853, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_5805 + -53) < (uint)14) {
                _5853 = (_5811 < 32.0f);
                _5860 = ((int)(uint)((int)(((_5815 < 0.0f)) && ((_5815 > select(_5853, -0.07999999821186066f, -1.0f))))));
              } else {
                _5860 = _5819;
              }
            }
          } else {
            _5860 = _5819;
          }
          if (!(_5860 == 0)) {
            if ((uint)_5805 > (uint)11) {
              if (!((uint)_5805 < (uint)18)) {
                if (!(((_5805 == 18)) || ((((_5805 == 107)) || (((uint)(_5805 + -19) < (uint)2)))))) {
                  if (!(_5805 == 66)) {
                    _5879 = 0.0f;
                  } else {
                    _5879 = 0.10000000149011612f;
                  }
                } else {
                  _5879 = 0.15000000596046448f;
                }
              } else {
                _5879 = 0.10000000149011612f;
              }
            } else {
              if (!(_5805 == 11)) {
                _5879 = 0.0f;
              } else {
                _5879 = 0.10000000149011612f;
              }
            }
            float _5881 = saturate(_5811 * 0.015625f);
            float _5884 = (1.0f - _5881) + (_5881 * _5879);
            _5894 = _5805;
            float _microNearAccum = saturate(1.0f - ((_5884 * _5884) * _5879)) * (1.0f - _5790);
            _5895 = saturate((_microNearAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _5790);
          } else {
            _5894 = _5782;
            _5895 = _5790;
          }
          [branch]
          if (_5895 > 0.949999988079071f) {
            if (!_5806) {
              _5926 = (saturate(_5789 / (_5789 - _5812)) - min(_5786, _5807));
            } else {
              _5926 = 0.0f;
            }
            _6212 = _5805;
            _6213 = _5895;
            _6214 = ((_5926 * _5763) + _5783);
            _6215 = ((_5926 * _5765) + _5784);
            _6216 = ((_5926 * _5766) + _5785);
            _6217 = _5804;
          } else {
            if ((uint)_5788 < (uint)(_5386 + -1)) {
              _5918 = ((_5807 * _5763) + _5783);
              _5919 = ((_5807 * _5765) + _5784);
              _5920 = ((_5807 * _5766) + _5785);
              _5921 = (_5807 + _5786);
              _5922 = min(abs(_5766), _5812);
            } else {
              _5918 = _5783;
              _5919 = _5784;
              _5920 = _5785;
              _5921 = _5786;
              _5922 = _5789;
            }
            if ((uint)(_5788 + 1) < (uint)_5386) {
              _5782 = _5894;
              _5783 = _5918;
              _5784 = _5919;
              _5785 = _5920;
              _5786 = _5921;
              _5787 = _5807;
              _5788 = (_5788 + 1);
              _5789 = _5922;
              _5790 = _5895;
              continue;
            } else {
              _6212 = _5894;
              _6213 = _5895;
              _6214 = _5783;
              _6215 = _5784;
              _6216 = _5785;
              _6217 = _5804;
            }
          }
          break;
        }
      } else {
        float _5936 = select(_5657, ((_nearFarProj.x - _5649) / _5652), _5406);
        float _5968 = mad((_viewProjRelative[2].z), _5636, mad((_viewProjRelative[2].y), _5635, ((_viewProjRelative[2].x) * _5634))) + (_viewProjRelative[2].w);
        float _5972 = mad((_viewProjRelative[3].z), _5636, mad((_viewProjRelative[3].y), _5635, ((_viewProjRelative[3].x) * _5634))) + (_viewProjRelative[3].w);
        float _5976 = (_5936 * _5377) + _5634;
        float _5977 = (_5936 * _5381) + _5635;
        float _5978 = (_5936 * _5385) + _5636;
        float _5994 = mad((_viewProjRelative[3].z), _5978, mad((_viewProjRelative[3].y), _5977, ((_viewProjRelative[3].x) * _5976))) + (_viewProjRelative[3].w);
        float _5995 = (mad((_viewProjRelative[0].z), _5636, mad((_viewProjRelative[0].y), _5635, ((_viewProjRelative[0].x) * _5634))) + (_viewProjRelative[0].w)) / _5972;
        float _5996 = (mad((_viewProjRelative[1].z), _5636, mad((_viewProjRelative[1].y), _5635, ((_viewProjRelative[1].x) * _5634))) + (_viewProjRelative[1].w)) / _5972;
        float _5997 = _5968 / _5972;
        float _6001 = ((mad((_viewProjRelative[0].z), _5978, mad((_viewProjRelative[0].y), _5977, ((_viewProjRelative[0].x) * _5976))) + (_viewProjRelative[0].w)) / _5994) - _5995;
        float _6002 = ((mad((_viewProjRelative[1].z), _5978, mad((_viewProjRelative[1].y), _5977, ((_viewProjRelative[1].x) * _5976))) + (_viewProjRelative[1].w)) / _5994) - _5996;
        float _6005 = 1.0f / float((uint)(uint)(_5386));
        float _6016 = max(_6005, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_6001)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_6002))) * _6005))));
        float _6017 = _6016 * (((mad((_viewProjRelative[2].z), _5978, mad((_viewProjRelative[2].y), _5977, ((_viewProjRelative[2].x) * _5976))) + (_viewProjRelative[2].w)) / _5994) - _5997);
        float _6036 = ((_5392 * 0.5f) * max(abs(_6017), (_5997 - ((mad((_proj[2].z), _115, 0.0f) + _5968) / (mad((_proj[3].z), _115, 0.0f) + _5972))))) * max(0.0625f, _6005);
        float _6037 = _6016 * _6005;
        float _6039 = (_6001 * 0.5f) * _6037;
        float _6041 = (_6002 * -0.5f) * _6037;
        float _6042 = _6017 * _6005;
        float _6049 = max(_5597, (1.0f / max((abs(_6039) * _bufferSizeAndInvSize.x), (abs(_6041) * _bufferSizeAndInvSize.y))));
        float _6056 = 0.5f / _bufferSizeAndInvSize.x;
        _6058 = 0;
        _6059 = _5412;
        _6060 = _5597;
        _6061 = (((_5995 * 0.5f) + 0.5f) + (_6049 * _6039));
        _6062 = ((0.5f - (_5996 * 0.5f)) + (_6049 * _6041));
        _6063 = ((_6049 * _6042) + _5997);
        _6064 = 0;
        _6065 = 1.0f;
        _6066 = 0.0f;
        while(true) {
          uint _6075 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_6061, _6056), (1.0f - _6056)) * _bufferSizeAndInvSize.x), int(_6062 * _bufferSizeAndInvSize.y), 0));
          int _6077 = (uint)((uint)(_6075.x)) >> 24;
          float _6080 = float((uint)((uint)(_6075.x & 16777215))) * 5.960465188081798e-08f;
          int _6081 = _6077 & 127;
          bool _6082 = (_6058 == 0);
          float _6083 = select(_6082, 1.0f, _6059);
          float _6084 = _6063 - _6080;
          float _6088 = _nearFarProj.x / max(1.0000000116860974e-07f, _6080);
          float _6091 = _6088 - (_nearFarProj.x / max(1.0000000116860974e-07f, _6063));
          bool _6094 = (abs(_6084 + _6036) < _6036);
          int _6095 = (int)(uint)((int)(_6094));
          if (_6094) {
            if (((_6081 == 7)) || ((((_6081 == 54)) || (((((_6077 & 126) == 66)) || (((((uint)(_6081 + -5) < (uint)2)) || ((((_6081 == 107)) || ((((_6081 == 26)) || (((((uint)(_6081 + -27) < (uint)2)) || ((((_6081 == 106)) || (((((_6077 & 125) == 105)) || ((((_6081 == 18)) || (((uint)(_6081 + -19) < (uint)2))))))))))))))))))))) {
              _6129 = true;
              _6136 = ((int)(uint)((int)(((_6091 < 0.0f)) && ((_6091 > select(_6129, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_6081 + -53) < (uint)14) {
                _6129 = (_6088 < 32.0f);
                _6136 = ((int)(uint)((int)(((_6091 < 0.0f)) && ((_6091 > select(_6129, -0.07999999821186066f, -1.0f))))));
              } else {
                _6136 = _6095;
              }
            }
          } else {
            _6136 = _6095;
          }
          if (!(_6136 == 0)) {
            if ((uint)_6081 > (uint)11) {
              if (!((uint)_6081 < (uint)18)) {
                if (!(((_6081 == 18)) || ((((_6081 == 107)) || (((uint)(_6081 + -19) < (uint)2)))))) {
                  if (!(_6081 == 66)) {
                    _6155 = 0.0f;
                  } else {
                    _6155 = 0.10000000149011612f;
                  }
                } else {
                  _6155 = 0.15000000596046448f;
                }
              } else {
                _6155 = 0.10000000149011612f;
              }
            } else {
              if (!(_6081 == 11)) {
                _6155 = 0.0f;
              } else {
                _6155 = 0.10000000149011612f;
              }
            }
            float _6157 = saturate(_6088 * 0.015625f);
            float _6160 = (1.0f - _6157) + (_6157 * _6155);
            _6170 = _6081;
            float _microFarAccum = saturate(1.0f - ((_6160 * _6160) * _6155)) * (1.0f - _6066);
            _6171 = saturate((_microFarAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _6066);
          } else {
            _6170 = _6064;
            _6171 = _6066;
          }
          [branch]
          if (_6171 > 0.949999988079071f) {
            if (!_6082) {
              _6202 = (saturate(_6065 / (_6065 - _6084)) - min(_6060, _6083));
            } else {
              _6202 = 0.0f;
            }
            _6212 = _6081;
            _6213 = _6171;
            _6214 = ((_6202 * _6039) + _6061);
            _6215 = ((_6202 * _6041) + _6062);
            _6216 = ((_6202 * _6042) + _6063);
            _6217 = _6080;
          } else {
            if ((uint)_6058 < (uint)(_5386 + -1)) {
              _6194 = (_6060 + _6083);
              _6195 = (_6061 + (_6083 * _6039));
              _6196 = (_6062 + (_6083 * _6041));
              _6197 = (_6063 + (_6083 * _6042));
              _6198 = min(abs(_6042), _6084);
            } else {
              _6194 = _6060;
              _6195 = _6061;
              _6196 = _6062;
              _6197 = _6063;
              _6198 = _6065;
            }
            if ((uint)(_6058 + 1) < (uint)_5386) {
              _6058 = (_6058 + 1);
              _6059 = _6083;
              _6060 = _6194;
              _6061 = _6195;
              _6062 = _6196;
              _6063 = _6197;
              _6064 = _6170;
              _6065 = _6198;
              _6066 = _6171;
              continue;
            } else {
              _6212 = _6170;
              _6213 = _6171;
              _6214 = 0.0f;
              _6215 = 0.0f;
              _6216 = -1.0f;
              _6217 = 0.0f;
            }
          }
          break;
        }
      }
      bool _6221 = (_6213 > 0.0f);
      if (_6216 > 0.0f) {
        if ((_6221) || ((((((_6214 >= 0.0f)) && ((_6214 <= 1.0f)))) && ((((_6215 >= 0.0f)) && ((_6215 <= 1.0f))))))) {
          float _6235 = (_6214 * 2.0f) + -1.0f;
          float _6236 = 1.0f - (_6215 * 2.0f);
          float _6272 = mad((_invViewProjRelative[3].z), _6216, mad((_invViewProjRelative[3].y), _6236, ((_invViewProjRelative[3].x) * _6235))) + (_invViewProjRelative[3].w);
          if (!(_6212 == 2)) {
            if (_6212 == 3) {
              _6298 = 0.0f;
              _6300 = _6298;
            } else {
              if (_6212 == 21) {
                if (!(_80 == 21)) {
                  _6298 = 0.0f;
                  _6300 = _6298;
                } else {
                  _6300 = 20.0f;
                }
              } else {
                bool _6291 = (_6212 == 22);
                if (!(((_80 == 22)) && (_6291))) {
                  _6298 = select(_6291, 0.0f, 1.0f);
                  _6300 = _6298;
                } else {
                  _6300 = 20.0f;
                }
              }
            }
          } else {
            if (!(_80 == 2)) {
              _6298 = 0.0f;
              _6300 = _6298;
            } else {
              _6300 = 20.0f;
            }
          }
          if (!((_170) || ((!(_6213 == 1.0f))))) {
            _6324 = saturate(((((_5406 * 0.9375f) - max(0.0f, dot(float3(_5377, _5381, _5385), float3((((mad((_invViewProjRelative[0].z), _6216, mad((_invViewProjRelative[0].y), _6236, ((_invViewProjRelative[0].x) * _6235))) + (_invViewProjRelative[0].w)) / _6272) - _5634), (((mad((_invViewProjRelative[1].z), _6216, mad((_invViewProjRelative[1].y), _6236, ((_invViewProjRelative[1].x) * _6235))) + (_invViewProjRelative[1].w)) / _6272) - _5635), (((mad((_invViewProjRelative[2].z), _6216, mad((_invViewProjRelative[2].y), _6236, ((_invViewProjRelative[2].x) * _6235))) + (_invViewProjRelative[2].w)) / _6272) - _5636))))) * ((_115 * 0.015625f) + 1.5f)) / _5406) * 0.9375f);
          } else {
            _6324 = _6213;
          }
          float _6325 = _6324 * saturate(exp2(min(0.0f, (((_115 * 0.01899999938905239f) + 0.10000000149011612f) + (_6300 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _6217)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _6216)))))) * 1.4426950216293335f));
          int _6326 = _6212 & -2;
          if (!(_6326 == 6)) {
            bool __defer_6328_6338 = false;
            if ((((_80 == 33) && (_6212 == 33)) || (!(_80 == 33) && (((_80 == 55)) && ((_6212 == 55)))))) {
              _6403 = (_6325 * 0.009999999776482582f);
            } else {
              __defer_6328_6338 = true;
            }
            if (__defer_6328_6338) {
              if (!(((_6212 == 54)) || ((_6326 == 66))) || ((((_6212 == 54)) || ((_6326 == 66))) && (!(((_5270 == 66)) || ((_80 == 54)))))) {
                if (!_172) {
                  if ((uint)((int)((uint)(_6212) + (uint)(-53))) < (uint)15) {
                    _6400 = saturate(_115 * 0.03125f);
                  } else {
                    _6400 = 1.0f;
                  }
                  _6403 = (_6400 * _6325);
                } else {
                  _6403 = _6325;
                }
              } else {
                uint4 _6355 = __3__36__0__0__g_baseColor.Load(int3(int(_bufferSizeAndInvSize.x * _6214), int(_bufferSizeAndInvSize.y * _6215), 0));
                float _6361 = float((uint)((uint)(((uint)((uint)(_6355.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _6364 = float((uint)((uint)(_6355.x & 255))) * 0.003921568859368563f;
                float _6368 = float((uint)((uint)(((uint)((uint)(_6355.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _6369 = _6361 * _6361;
                float _6370 = _6364 * _6364;
                float _6371 = _6368 * _6368;
                _6403 = (saturate(1.0f - (dot(float3((((_6369 * 0.6131200194358826f) + (_6370 * 0.3395099937915802f)) + (_6371 * 0.047370001673698425f)), (((_6369 * 0.07020000368356705f) + (_6370 * 0.9163600206375122f)) + (_6371 * 0.013450000435113907f)), (((_6369 * 0.02061999961733818f) + (_6370 * 0.10958000272512436f)) + (_6371 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _6325);
              }
            }
          } else {
            _6403 = (_6325 * 0.009999999776482582f);
          }
        } else {
          _6403 = 0.0f;
        }
      } else {
        if (_6221) {
          float _6235 = (_6214 * 2.0f) + -1.0f;
          float _6236 = 1.0f - (_6215 * 2.0f);
          float _6272 = mad((_invViewProjRelative[3].z), _6216, mad((_invViewProjRelative[3].y), _6236, ((_invViewProjRelative[3].x) * _6235))) + (_invViewProjRelative[3].w);
          if (!(_6212 == 2)) {
            if (_6212 == 3) {
              _6298 = 0.0f;
              _6300 = _6298;
            } else {
              if (_6212 == 21) {
                if (!(_80 == 21)) {
                  _6298 = 0.0f;
                  _6300 = _6298;
                } else {
                  _6300 = 20.0f;
                }
              } else {
                bool _6291 = (_6212 == 22);
                if (!(((_80 == 22)) && (_6291))) {
                  _6298 = select(_6291, 0.0f, 1.0f);
                  _6300 = _6298;
                } else {
                  _6300 = 20.0f;
                }
              }
            }
          } else {
            if (!(_80 == 2)) {
              _6298 = 0.0f;
              _6300 = _6298;
            } else {
              _6300 = 20.0f;
            }
          }
          if (!((_170) || ((!(_6213 == 1.0f))))) {
            _6324 = saturate(((((_5406 * 0.9375f) - max(0.0f, dot(float3(_5377, _5381, _5385), float3((((mad((_invViewProjRelative[0].z), _6216, mad((_invViewProjRelative[0].y), _6236, ((_invViewProjRelative[0].x) * _6235))) + (_invViewProjRelative[0].w)) / _6272) - _5634), (((mad((_invViewProjRelative[1].z), _6216, mad((_invViewProjRelative[1].y), _6236, ((_invViewProjRelative[1].x) * _6235))) + (_invViewProjRelative[1].w)) / _6272) - _5635), (((mad((_invViewProjRelative[2].z), _6216, mad((_invViewProjRelative[2].y), _6236, ((_invViewProjRelative[2].x) * _6235))) + (_invViewProjRelative[2].w)) / _6272) - _5636))))) * ((_115 * 0.015625f) + 1.5f)) / _5406) * 0.9375f);
          } else {
            _6324 = _6213;
          }
          float _6325 = _6324 * saturate(exp2(min(0.0f, (((_115 * 0.01899999938905239f) + 0.10000000149011612f) + (_6300 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _6217)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _6216)))))) * 1.4426950216293335f));
          int _6326 = _6212 & -2;
          if (!(_6326 == 6)) {
            bool __defer_6328_6338 = false;
            if ((((_80 == 33) && (_6212 == 33)) || (!(_80 == 33) && (((_80 == 55)) && ((_6212 == 55)))))) {
              _6403 = (_6325 * 0.009999999776482582f);
            } else {
              __defer_6328_6338 = true;
            }
            if (__defer_6328_6338) {
              if (!(((_6212 == 54)) || ((_6326 == 66))) || ((((_6212 == 54)) || ((_6326 == 66))) && (!(((_5270 == 66)) || ((_80 == 54)))))) {
                if (!_172) {
                  if ((uint)((int)((uint)(_6212) + (uint)(-53))) < (uint)15) {
                    _6400 = saturate(_115 * 0.03125f);
                  } else {
                    _6400 = 1.0f;
                  }
                  _6403 = (_6400 * _6325);
                } else {
                  _6403 = _6325;
                }
              } else {
                uint4 _6355 = __3__36__0__0__g_baseColor.Load(int3(int(_bufferSizeAndInvSize.x * _6214), int(_bufferSizeAndInvSize.y * _6215), 0));
                float _6361 = float((uint)((uint)(((uint)((uint)(_6355.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _6364 = float((uint)((uint)(_6355.x & 255))) * 0.003921568859368563f;
                float _6368 = float((uint)((uint)(((uint)((uint)(_6355.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _6369 = _6361 * _6361;
                float _6370 = _6364 * _6364;
                float _6371 = _6368 * _6368;
                _6403 = (saturate(1.0f - (dot(float3((((_6369 * 0.6131200194358826f) + (_6370 * 0.3395099937915802f)) + (_6371 * 0.047370001673698425f)), (((_6369 * 0.07020000368356705f) + (_6370 * 0.9163600206375122f)) + (_6371 * 0.013450000435113907f)), (((_6369 * 0.02061999961733818f) + (_6370 * 0.10958000272512436f)) + (_6371 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _6325);
              }
            }
          } else {
            _6403 = (_6325 * 0.009999999776482582f);
          }
        } else {
          _6403 = 0.0f;
        }
      }
      _6407 = saturate(1.0f - _6403);
    } else {
      _6407 = 1.0f;
    }
    #define MICRO_PIXEL_X_FLOAT   _60
    #define MICRO_PIXEL_Y_FLOAT   _61
    #define MICRO_LINEAR_DEPTH    _115
    #define MICRO_CONTACT_SHADOW  _6407
    #define MICRO_STENCIL         _80
    #define MICRO_LIGHT_DIR_X     _5290
    #define MICRO_LIGHT_DIR_Y     _5291
    #define MICRO_LIGHT_DIR_Z     _5292
    #define MICRO_WORLD_POS_X     _5620
    #define MICRO_WORLD_POS_Y     _5621
    #define MICRO_WORLD_POS_Z     _5622
    #define CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE CONTACT_MICRO_DETAIL_STRENGTH_RT
    #define CONTACT_MICRO_DISTANCE_FADE_ACTIVE CONTACT_MICRO_DISTANCE_FADE_RT
    #define CONTACT_MICRO_RANGE_NEAR_ACTIVE CONTACT_MICRO_RANGE_NEAR_RT
    #define CONTACT_MICRO_RANGE_FAR_ACTIVE CONTACT_MICRO_RANGE_FAR_RT
    #define CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE CONTACT_MICRO_THICKNESS_MULTIPLIER_RT
    #define CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE CONTACT_MICRO_OCCLUSION_SCALE_RT
    #include "micro_detail_shadows.hlsli"
    #undef CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE
    #undef CONTACT_MICRO_DISTANCE_FADE_ACTIVE
    #undef CONTACT_MICRO_RANGE_NEAR_ACTIVE
    #undef CONTACT_MICRO_RANGE_FAR_ACTIVE
    #undef CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE
    #undef CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE
    #undef MICRO_PIXEL_X_FLOAT
    #undef MICRO_PIXEL_Y_FLOAT
    #undef MICRO_LINEAR_DEPTH
    #undef MICRO_CONTACT_SHADOW
    #undef MICRO_STENCIL
    #undef MICRO_LIGHT_DIR_X
    #undef MICRO_LIGHT_DIR_Y
    #undef MICRO_LIGHT_DIR_Z
    #undef MICRO_WORLD_POS_X
    #undef MICRO_WORLD_POS_Y
    #undef MICRO_WORLD_POS_Z
    if (CONTACT_SHADOW_RT_TUNING > 0.f && _6407 < 1.0f) {
      _6407 = saturate(1.0f - ((1.0f - _6407) * lerp(1.0f, CONTACT_SHADOW_RT_FINAL_STRENGTH, CONTACT_SHADOW_RT_TUNING)));
    }
    if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _6407 < 1.0f) {
      float2 _screenUV = float2((_60 + 0.5f) * _bufferSizeAndInvSize.z,
                                 (_61 + 0.5f) * _bufferSizeAndInvSize.w);
      float2 _edgeDist = min(_screenUV, 1.0f - _screenUV);
      float _edgeFade = saturate(min(_edgeDist.x, _edgeDist.y) * 10.0f);
      _6407 = lerp(lerp(1.0f, _6407, 0.5f), _6407, _edgeFade);
    }
    float _6408 = min(_5260, _6407);
    _6422 = float(half(_6408 * float(_5236)));
    _6423 = float(half(_6408 * float(_5237)));
    _6424 = float(half(_6408 * float(_5238)));
    _6425 = saturate((1.0f - _556) + (exp2(log2(saturate(select(_172, (_5245 + 0.9800000190734863f), _5245))) * 0.45454543828964233f) * _556));
  }
  __3__38__0__1__g_shadowColorResultUAV[int2(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)))] = half4(half(_6422), half(_6423), half(_6424), half(_6425));
}
