#include "../shared.h"

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t35, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t230, space36);

Texture2DArray<uint2> __3__36__0__0__g_dynamicShadowStencilArray : register(t231, space36);

Texture2DArray<half4> __3__36__0__0__g_dynamicShadowColorArray : register(t232, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t233, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t15, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t43, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t18, space36);

Texture2D<float> __3__36__0__0__g_raytracedShadow : register(t118, space36);

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
  float _69 = ((_bufferSizeAndInvSize.z * 2.0f) * (_60 + 0.5f)) + -1.0f;
  float _72 = 1.0f - ((_bufferSizeAndInvSize.w * 2.0f) * (_61 + 0.5f));
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
  int _5008;
  float _5111;
  float _5112;
  half _5113;
  half _5114;
  half _5115;
  float _5167;
  float _5168;
  float _5169;
  float _rndxMicroDirX;
  float _rndxMicroDirY;
  float _rndxMicroDirZ;
  float _rndxMicroWorldPosX;
  float _rndxMicroWorldPosY;
  float _rndxMicroWorldPosZ;
  float _5267;
  float _5281;
  int _5318;
  float _5324;
  float _5337;
  float _5350;
  float _5360;
  float _5361;
  float _5362;
  float _5371;
  float _5372;
  float _5373;
  int _5520;
  float _5521;
  float _5522;
  float _5523;
  float _5524;
  float _5525;
  int _5526;
  float _5527;
  float _5528;
  bool _5591;
  int _5598;
  float _5617;
  int _5632;
  float _5633;
  float _5656;
  float _5657;
  float _5658;
  float _5659;
  float _5660;
  float _5664;
  int _5796;
  float _5797;
  float _5798;
  float _5799;
  float _5800;
  float _5801;
  int _5802;
  float _5803;
  float _5804;
  bool _5867;
  int _5874;
  float _5893;
  int _5908;
  float _5909;
  float _5932;
  float _5933;
  float _5934;
  float _5935;
  float _5936;
  float _5940;
  int _5950;
  float _5951;
  float _5952;
  float _5953;
  float _5954;
  float _5955;
  float _6016;
  float _6018;
  float _6042;
  float _6115;
  float _6118;
  float _6122;
  float _6137;
  float _6138;
  float _6139;
  float _6140;
  if (((_79 < 1.0000000116860974e-07f)) || (_107)) {
    float _110 = select(_107, 0.0f, 1.0f);
    _6137 = _110;
    _6138 = _110;
    _6139 = _110;
    _6140 = _110;
  } else {
    float _114 = max(1.0000000116860974e-07f, _79);
    float _115 = _nearFarProj.x / _114;
    float _151 = mad((_invViewProjRelative[3].z), _114, mad((_invViewProjRelative[3].y), _72, ((_invViewProjRelative[3].x) * _69))) + (_invViewProjRelative[3].w);
    float _152 = (mad((_invViewProjRelative[0].z), _114, mad((_invViewProjRelative[0].y), _72, ((_invViewProjRelative[0].x) * _69))) + (_invViewProjRelative[0].w)) / _151;
    float _153 = (mad((_invViewProjRelative[1].z), _114, mad((_invViewProjRelative[1].y), _72, ((_invViewProjRelative[1].x) * _69))) + (_invViewProjRelative[1].w)) / _151;
    float _154 = (mad((_invViewProjRelative[2].z), _114, mad((_invViewProjRelative[2].y), _72, ((_invViewProjRelative[2].x) * _69))) + (_invViewProjRelative[2].w)) / _151;
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
      float _4995 = _26[_814];
      float _4996 = _27[_814];
      float _4997 = _28[_814];
      if (_952) {
        int _5002 = ((int)(((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) + (uint)(-1879881855)));
        _5008 = ((int)(((uint)(_5002 ^ (((uint)(((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) >> 5) + -939442524))) + _942));
      } else {
        _5008 = (int)(_942);
      }
      float _5009 = _shadowSizeAndInvSize.z * 2.0f;
      float _5010 = _shadowSizeAndInvSize.w * 2.0f;
      float _5017 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      float _5019 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      float _5023 = ((float((uint)((uint)(((int)(_5008 * 48271)) & 16777215))) * _5017) - _5009) + _4995;
      float _5024 = ((float((uint)((uint)(((int)(_5008 * -1964877855)) & 16777215))) * _5019) - _5010) + _4996;
      float _5025 = float((uint)(uint)(_814));
      float4 _5028 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5023, _5024, _5025), 0.0f);
      float _5032 = _4997 - _812;
      float4 _5034 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_5023, _5024, _5025), _5032);
      float _5048 = ((float((uint)((uint)(((int)(_5008 * -856141137)) & 16777215))) * _5017) - _5009) + _4995;
      float _5049 = ((float((uint)((uint)(((int)(_5008 * -613502015)) & 16777215))) * _5019) - _5010) + _4996;
      float4 _5050 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5048, _5049, _5025), 0.0f);
      float4 _5054 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_5048, _5049, _5025), _5032);
      float _5070 = ((float((uint)((uint)(((int)(_5008 * -556260145)) & 16777215))) * _5017) - _5009) + _4995;
      float _5071 = ((float((uint)((uint)(((int)(_5008 * 902075297)) & 16777215))) * _5019) - _5010) + _4996;
      float4 _5072 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5070, _5071, _5025), 0.0f);
      float4 _5076 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_5070, _5071, _5025), _5032);
      float _5092 = ((float((uint)((uint)(((int)(_5008 * 1698214639)) & 16777215))) * _5017) - _5009) + _4995;
      float _5093 = ((float((uint)((uint)(((int)(_5008 * 773027713)) & 16777215))) * _5019) - _5010) + _4996;
      float4 _5094 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_5092, _5093, _5025), 0.0f);
      float4 _5098 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_5092, _5093, _5025), _5032);
      float _5104 = (((saturate(1.0f - _5054.x) + saturate(1.0f - _5034.x)) + saturate(1.0f - _5076.x)) + saturate(1.0f - _5098.x)) * 0.25f;
      float _5105 = (((max(0.0f, (_4997 - _5050.x)) + max(0.0f, (_4997 - _5028.x))) + max(0.0f, (_4997 - _5072.x))) + max(0.0f, (_4997 - _5094.x))) * 0.25f;
      _5111 = saturate(_5104 * _5104);
      _5112 = saturate(_5105 * _5105);
      _5113 = 1.0h;
      _5114 = 1.0h;
      _5115 = 1.0h;
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
      float _4987 = __3__36__0__0__g_raytracedShadow.Load(int3(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)), 0));
      _5111 = min(_556, min((_4947 * _4943), _4987.x));
      _5112 = (_4947 * _4944);
      _5113 = _4983;
      _5114 = _4984;
      _5115 = _4985;
    }
    bool _5116 = (_813 != 0);
    float _5118 = min(_556, select(_5116, _5111, 1.0f));
    float _5122 = select((_697 != 0), select(_5116, (_5112 * 400.0f), 4e+06f), 1.0f);
    float _5137 = (_5118 - (_shadowAOParams.x * _5118)) + _shadowAOParams.x;
    [branch]
    if (_5137 > 0.0f) {
      int _5147 = _76 & 126;
      bool _5148 = (_5147 == 64);
      bool _5149 = (_80 == 66);
      bool _5150 = (_5148) || (_5149);
      float _5151 = select(_5150, 2.0f, 4.0f);
      if ((_sunDirection.y > 0.0f) || ((!(_sunDirection.y > 0.0f)) && (_sunDirection.y > _moonDirection.y))) {
        _5167 = _sunDirection.x;
        _5168 = _sunDirection.y;
        _5169 = _sunDirection.z;
      } else {
        _5167 = _moonDirection.x;
        _5168 = _moonDirection.y;
        _5169 = _moonDirection.z;
      }
      _rndxMicroDirX = _5167;
      _rndxMicroDirY = _5168;
      _rndxMicroDirZ = _5169;
      _rndxMicroWorldPosX = _152;
      _rndxMicroWorldPosY = _153;
      _rndxMicroWorldPosZ = _154;
      int _5170 = ((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)) & 3;
      int _5174 = ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)) & 3;
      float _5191 = float((uint)(uint)(_frameNumber.x));
      float _5202 = (frac(((_5191 * 92.0f) + _60) * 0.0078125f) * 128.0f) + -64.34062194824219f;
      float _5203 = (frac(((_5191 * 71.0f) + _61) * 0.0078125f) * 128.0f) + -72.46562194824219f;
      float _5208 = frac(dot(float3((_5202 * _5202), (_5203 * _5203), (_5203 * _5202)), float3(20.390625f, 60.703125f, 2.4281208515167236f)));
      float _5224 = frac((float((uint)((uint)((int)(uint(_5208 * 51540816.0f)) & 65535))) * 1.52587890625e-05f) + (float((uint)((uint)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_5174 << 1) | _5174) << 1) & 10) | (((_5170 << 1) | _5170) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_5174 << 1) | _5174) << 1) & 10) | (((_5170 << 1) | _5170) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_5174 << 1) | _5174) << 1) & 10) | (((_5170 << 1) | _5170) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_5174 << 1) | _5174) << 1) & 10) | (((_5170 << 1) | _5170) & 5)))) >> 2) & 858993459))) >> 1) & 21)))) * 0.03125f)) * 6.2831854820251465f;
      float _5228 = (((1.0f - _shadowAOParams.z) * 2.3283064365386963e-10f) * float((uint)((uint)(reversebits((float)((((int)(((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_5174 << 1) | _5174) << 1) & 10) | (((_5170 << 1) | _5170) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_5174 << 1) | _5174) << 1) & 10) | (((_5170 << 1) | _5170) & 5)))) >> 2) & 858993459))) << 1)) & 10) | (((uint)((uint)((((int)(((_frameNumber.x * 1551) + ((uint)(((((_5174 << 1) | _5174) << 1) & 10) | (((_5170 << 1) | _5170) & 5)))) << 2)) & -858993460) | (((uint)((_frameNumber.x * 1551) + ((uint)(((((_5174 << 1) | _5174) << 1) & 10) | (((_5170 << 1) | _5170) & 5)))) >> 2) & 858993459))) >> 1) & 21))) ^ (int)(uint(_5208 * 287478368.0f)))))) + _shadowAOParams.z;
      float _5231 = sqrt(1.0f - (_5228 * _5228));
      float _5234 = cos(_5224) * _5231;
      float _5235 = sin(_5224) * _5231;
      float _5237 = select((_5169 >= 0.0f), 1.0f, -1.0f);
      float _5240 = -0.0f - (1.0f / (_5237 + _5169));
      float _5241 = _5168 * _5240;
      float _5242 = _5241 * _5167;
      float _5243 = _5237 * _5167;
      float _5252 = mad(_5228, _5167, mad(_5235, _5242, ((((_5243 * _5167) * _5240) + 1.0f) * _5234)));
      float _5256 = mad(_5228, _5168, mad(_5235, (_5237 + (_5241 * _5168)), ((_5234 * _5237) * _5242)));
      float _5260 = mad(_5228, _5169, mad(_5235, (-0.0f - _5168), (-0.0f - (_5243 * _5234))));
      if (CONTACT_SHADOW_STABLE_DIRECTION == 1.f) {
        _5252 = _5167;
        _5256 = _5168;
        _5260 = _5169;
      }
      int _5261 = select(_5148, 10, 8);
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f) {
        _5261 = (int)(lerp(float(_5261), CONTACT_SHADOW_RT_MARCH_SAMPLES, CONTACT_SHADOW_RT_TUNING) + 0.5f);
      }
      if (!_170) {
        _5267 = min(0.5f, ((_115 * 0.0024999999441206455f) + 0.25f));
      } else {
        _5267 = 1.0f;
      }
      float _5273 = ((abs(_5168) * (select(_5150, 12.0f, 2.0f) - _5151)) + _5151) * select(_172, lerp(0.009999999776482582f, CONTACT_SHADOW_RT_REACH_TARGET, CONTACT_SHADOW_RT_TUNING), 0.10000000149011612f);
      if (!_172) {
        _5281 = max((_115 * select(((uint)(_80 + -11) < (uint)9), 0.00800000037997961f, 0.029999999329447746f)), _5273);
      } else {
        _5281 = _5273;
      }
      float _5287 = saturate(((_115 * 0.009999999776482582f) * (1.0f - saturate(dot(float3(_103, _104, _105), float3((-0.0f - (_152 * _156)), (-0.0f - (_153 * _156)), (-0.0f - (_154 * _156))))))) + 0.009999999776482582f);
      bool _5294 = (_terrainNormalParams.z > 0.0f);
      if (_5294) {
        float _5298 = float((uint)((uint)(((int)(_frameNumber.x * 73)) & 255)));
        _5324 = frac(frac(dot(float2(((_5298 * 32.665000915527344f) + _60), ((_5298 * 11.8149995803833f) + _61)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
      } else {
        if (_952) {
          int _5312 = ((int)(((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) + (uint)(-1879881855)));
          _5318 = ((int)(((uint)(_5312 ^ (((uint)(((uint)((((int)((_942 << 4) + (uint)(-1383041155))) ^ ((int)(_942 + (uint)(-239350328)))) ^ ((int)(((uint)((uint)(_942) >> 5)) + 2123724318u)))) + (((uint)((((int)((((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) + 1401181199u))) ^ ((int)(((uint)((uint)((uint)(_925) + (((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894)) >> 5)) + 2123724318u)))) + (((uint)((((int)(((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) << 4) + (uint)(-1383041155))) ^ ((int)((((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) + (uint)(-1253254570)))) ^ ((int)(((uint)((uint)(((uint)((((int)(((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) << 4) + (uint)(-1556008596))) ^ ((int)((((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) + (uint)(-1253254570)))) ^ (((uint)(((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886) >> 5) + -939442524))) + _894) >> 5)) + 2123724318u)))) + (((uint)((((int)((_894 << 4) + (uint)(-1383041155))) ^ ((int)(_894 + 387276957u))) ^ ((int)(((uint)((uint)(_894) >> 5)) + 2123724318u)))) + _886)))) >> 5) + -939442524))) + _942));
        } else {
          _5318 = (int)(_942);
        }
        _5324 = (float((uint)((uint)(((int)(_5318 * 48271)) & 16777215))) * 5.960464477539063e-08f);
      }
      if ((_5149) || ((((_80 != 15)) && (((uint)(_80 + -12) < (uint)7))))) {
        _5337 = (_5324 * lerp(10.0f, CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING));
      } else {
        if (_80 == 15) {
          _5337 = ((lerp((10.0f - (saturate(_115 * 0.0010000000474974513f) * 9.0f)), CONTACT_SHADOW_RT_START_TARGET, CONTACT_SHADOW_RT_TUNING)) * _5324);
        } else {
          _5337 = _5324;
        }
      }
      if (_5147 == 12) {
        _5350 = (0.10000000149011612f - (abs(_5256) * 0.05000000074505806f));
      } else {
        if ((uint)_80 > (uint)15) {
          if ((((uint)_80 < (uint)20)) || ((_80 == 107))) {
            _5350 = (0.10000000149011612f - (abs(_5256) * 0.05000000074505806f));
          } else {
            _5350 = 0.0f;
          }
        } else {
          _5350 = 0.0f;
        }
      }
      if (!_172) {
        float _5352 = _5350 * _156;
        _5360 = (_152 - (_5352 * _152));
        _5361 = (_153 - (_5352 * _153));
        _5362 = (_154 - (_5352 * _154));
      } else {
        _5360 = _152;
        _5361 = _153;
        _5362 = _154;
      }
      if (!_5294) {
        float _5366 = saturate(_115 * 0.0625f) * 0.05000000074505806f;
        _5371 = (_5366 * _103);
        _5372 = (_5366 * _104);
        _5373 = (_5366 * _105);
      } else {
        _5371 = 0.0f;
        _5372 = 0.0f;
        _5373 = 0.0f;
      }
      float _5374 = _5371 + _5360;
      float _5375 = _5372 + _5361;
      float _5376 = _5373 + _5362;
      _rndxMicroWorldPosX = _5360;
      _rndxMicroWorldPosY = _5361;
      _rndxMicroWorldPosZ = _5362;
      _rndxMicroDirX = _5252;
      _rndxMicroDirY = _5256;
      _rndxMicroDirZ = _5260;
      float _5389 = mad((_viewRelative[2].z), _5376, mad((_viewRelative[2].y), _5375, ((_viewRelative[2].x) * _5374))) + (_viewRelative[2].w);
      float _5392 = mad((_viewRelative[2].z), _5260, mad((_viewRelative[2].y), _5256, ((_viewRelative[2].x) * _5252)));
      bool _5395 = (((_5392 * _5281) + _5389) < _nearFarProj.x);
      if (_115 < 8.0f) {
        float _5399 = select(_5395, ((_nearFarProj.x - _5389) / _5392), _5281);
        float _5431 = mad((_viewProjRelative[2].z), _5376, mad((_viewProjRelative[2].y), _5375, ((_viewProjRelative[2].x) * _5374))) + (_viewProjRelative[2].w);
        float _5435 = mad((_viewProjRelative[3].z), _5376, mad((_viewProjRelative[3].y), _5375, ((_viewProjRelative[3].x) * _5374))) + (_viewProjRelative[3].w);
        float _5439 = (_5399 * _5252) + _5374;
        float _5440 = (_5399 * _5256) + _5375;
        float _5441 = (_5399 * _5260) + _5376;
        float _5457 = mad((_viewProjRelative[3].z), _5441, mad((_viewProjRelative[3].y), _5440, ((_viewProjRelative[3].x) * _5439))) + (_viewProjRelative[3].w);
        float _5458 = (mad((_viewProjRelative[0].z), _5376, mad((_viewProjRelative[0].y), _5375, ((_viewProjRelative[0].x) * _5374))) + (_viewProjRelative[0].w)) / _5435;
        float _5459 = (mad((_viewProjRelative[1].z), _5376, mad((_viewProjRelative[1].y), _5375, ((_viewProjRelative[1].x) * _5374))) + (_viewProjRelative[1].w)) / _5435;
        float _5460 = _5431 / _5435;
        float _5464 = ((mad((_viewProjRelative[0].z), _5441, mad((_viewProjRelative[0].y), _5440, ((_viewProjRelative[0].x) * _5439))) + (_viewProjRelative[0].w)) / _5457) - _5458;
        float _5465 = ((mad((_viewProjRelative[1].z), _5441, mad((_viewProjRelative[1].y), _5440, ((_viewProjRelative[1].x) * _5439))) + (_viewProjRelative[1].w)) / _5457) - _5459;
        float _5468 = 1.0f / float((uint)(uint)(_5261));
        float _5479 = max(_5468, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_5464)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_5465))) * _5468))));
        float _5480 = _5479 * (((mad((_viewProjRelative[2].z), _5441, mad((_viewProjRelative[2].y), _5440, ((_viewProjRelative[2].x) * _5439))) + (_viewProjRelative[2].w)) / _5457) - _5460);
        float _5498 = (max(abs(_5480), (_5460 - ((mad((_proj[2].z), _115, 0.0f) + _5431) / (mad((_proj[3].z), _115, 0.0f) + _5435)))) * _5267) * max(0.0625f, _5468);
        float _5499 = _5479 * _5468;
        float _5501 = (_5464 * 0.5f) * _5499;
        float _5503 = (_5465 * -0.5f) * _5499;
        float _5504 = _5480 * _5468;
        float _5511 = max(_5337, (1.0f / max((abs(_5501) * _bufferSizeAndInvSize.x), (abs(_5503) * _bufferSizeAndInvSize.y))));
        float _5518 = 0.5f / _bufferSizeAndInvSize.x;
        _5520 = 0;
        _5521 = (((_5458 * 0.5f) + 0.5f) + (_5511 * _5501));
        _5522 = ((0.5f - (_5459 * 0.5f)) + (_5511 * _5503));
        _5523 = ((_5511 * _5504) + _5460);
        _5524 = _5337;
        _5525 = _5287;
        _5526 = 0;
        _5527 = 1.0f;
        _5528 = 0.0f;
        while(true) {
          uint _5537 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_5521, _5518), (1.0f - _5518)) * _bufferSizeAndInvSize.x), int(_5522 * _bufferSizeAndInvSize.y), 0));
          int _5539 = (uint)((uint)(_5537.x)) >> 24;
          float _5542 = float((uint)((uint)(_5537.x & 16777215))) * 5.960465188081798e-08f;
          int _5543 = _5539 & 127;
          bool _5544 = (_5526 == 0);
          float _5545 = select(_5544, 1.0f, _5525);
          float _5549 = _nearFarProj.x / max(1.0000000116860974e-07f, _5542);
          float _5550 = _5523 - _5542;
          float _5553 = _5549 - (_nearFarProj.x / max(1.0000000116860974e-07f, _5523));
          bool _5556 = (abs(_5550 + _5498) < _5498);
          int _5557 = (int)(uint)((int)(_5556));
          if (_5556) {
            if (((_5543 == 7)) || ((((_5543 == 54)) || (((((_5539 & 126) == 66)) || (((((uint)(_5543 + -5) < (uint)2)) || ((((_5543 == 107)) || ((((_5543 == 26)) || (((((uint)(_5543 + -27) < (uint)2)) || ((((_5543 == 106)) || (((((_5539 & 125) == 105)) || ((((_5543 == 18)) || (((uint)(_5543 + -19) < (uint)2))))))))))))))))))))) {
              _5591 = true;
              _5598 = ((int)(uint)((int)(((_5553 < 0.0f)) && ((_5553 > select(_5591, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_5543 + -53) < (uint)14) {
                _5591 = (_5549 < 32.0f);
                _5598 = ((int)(uint)((int)(((_5553 < 0.0f)) && ((_5553 > select(_5591, -0.07999999821186066f, -1.0f))))));
              } else {
                _5598 = _5557;
              }
            }
          } else {
            _5598 = _5557;
          }
          if (!(_5598 == 0)) {
            if ((uint)_5543 > (uint)11) {
              if (!((uint)_5543 < (uint)18)) {
                if (!(((_5543 == 18)) || ((((_5543 == 107)) || (((uint)(_5543 + -19) < (uint)2)))))) {
                  if (!(_5543 == 66)) {
                    _5617 = 0.0f;
                  } else {
                    _5617 = 0.10000000149011612f;
                  }
                } else {
                  _5617 = 0.15000000596046448f;
                }
              } else {
                _5617 = 0.10000000149011612f;
              }
            } else {
              if (!(_5543 == 11)) {
                _5617 = 0.0f;
              } else {
                _5617 = 0.10000000149011612f;
              }
            }
            float _5619 = saturate(_5549 * 0.015625f);
            float _5622 = (1.0f - _5619) + (_5619 * _5617);
            _5632 = _5543;
            float _microNearAccum = saturate(1.0f - ((_5622 * _5622) * _5617)) * (1.0f - _5528);
            _5633 = saturate((_microNearAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _5528);
          } else {
            _5632 = _5520;
            _5633 = _5528;
          }
          [branch]
          if (_5633 > 0.949999988079071f) {
            if (!_5544) {
              _5664 = (saturate(_5527 / (_5527 - _5550)) - min(_5524, _5545));
            } else {
              _5664 = 0.0f;
            }
            _5950 = _5543;
            _5951 = _5633;
            _5952 = ((_5664 * _5501) + _5521);
            _5953 = ((_5664 * _5503) + _5522);
            _5954 = ((_5664 * _5504) + _5523);
            _5955 = _5542;
          } else {
            if ((uint)_5526 < (uint)(_5261 + -1)) {
              _5656 = ((_5545 * _5501) + _5521);
              _5657 = ((_5545 * _5503) + _5522);
              _5658 = ((_5545 * _5504) + _5523);
              _5659 = (_5545 + _5524);
              _5660 = min(abs(_5504), _5550);
            } else {
              _5656 = _5521;
              _5657 = _5522;
              _5658 = _5523;
              _5659 = _5524;
              _5660 = _5527;
            }
            if ((uint)(_5526 + 1) < (uint)_5261) {
              _5520 = _5632;
              _5521 = _5656;
              _5522 = _5657;
              _5523 = _5658;
              _5524 = _5659;
              _5525 = _5545;
              _5526 = (_5526 + 1);
              _5527 = _5660;
              _5528 = _5633;
              continue;
            } else {
              _5950 = _5632;
              _5951 = _5633;
              _5952 = _5521;
              _5953 = _5522;
              _5954 = _5523;
              _5955 = _5542;
            }
          }
          break;
        }
      } else {
        float _5674 = select(_5395, ((_nearFarProj.x - _5389) / _5392), _5281);
        float _5706 = mad((_viewProjRelative[2].z), _5376, mad((_viewProjRelative[2].y), _5375, ((_viewProjRelative[2].x) * _5374))) + (_viewProjRelative[2].w);
        float _5710 = mad((_viewProjRelative[3].z), _5376, mad((_viewProjRelative[3].y), _5375, ((_viewProjRelative[3].x) * _5374))) + (_viewProjRelative[3].w);
        float _5714 = (_5674 * _5252) + _5374;
        float _5715 = (_5674 * _5256) + _5375;
        float _5716 = (_5674 * _5260) + _5376;
        float _5732 = mad((_viewProjRelative[3].z), _5716, mad((_viewProjRelative[3].y), _5715, ((_viewProjRelative[3].x) * _5714))) + (_viewProjRelative[3].w);
        float _5733 = (mad((_viewProjRelative[0].z), _5376, mad((_viewProjRelative[0].y), _5375, ((_viewProjRelative[0].x) * _5374))) + (_viewProjRelative[0].w)) / _5710;
        float _5734 = (mad((_viewProjRelative[1].z), _5376, mad((_viewProjRelative[1].y), _5375, ((_viewProjRelative[1].x) * _5374))) + (_viewProjRelative[1].w)) / _5710;
        float _5735 = _5706 / _5710;
        float _5739 = ((mad((_viewProjRelative[0].z), _5716, mad((_viewProjRelative[0].y), _5715, ((_viewProjRelative[0].x) * _5714))) + (_viewProjRelative[0].w)) / _5732) - _5733;
        float _5740 = ((mad((_viewProjRelative[1].z), _5716, mad((_viewProjRelative[1].y), _5715, ((_viewProjRelative[1].x) * _5714))) + (_viewProjRelative[1].w)) / _5732) - _5734;
        float _5743 = 1.0f / float((uint)(uint)(_5261));
        float _5754 = max(_5743, (1.0f / min(1.0f, (max(((_bufferSizeAndInvSize.x * 0.5f) * abs(_5739)), ((_bufferSizeAndInvSize.y * 0.5f) * abs(_5740))) * _5743))));
        float _5755 = _5754 * (((mad((_viewProjRelative[2].z), _5716, mad((_viewProjRelative[2].y), _5715, ((_viewProjRelative[2].x) * _5714))) + (_viewProjRelative[2].w)) / _5732) - _5735);
        float _5774 = ((_5267 * 0.5f) * max(abs(_5755), (_5735 - ((mad((_proj[2].z), _115, 0.0f) + _5706) / (mad((_proj[3].z), _115, 0.0f) + _5710))))) * max(0.0625f, _5743);
        float _5775 = _5754 * _5743;
        float _5777 = (_5739 * 0.5f) * _5775;
        float _5779 = (_5740 * -0.5f) * _5775;
        float _5780 = _5755 * _5743;
        float _5787 = max(_5337, (1.0f / max((abs(_5777) * _bufferSizeAndInvSize.x), (abs(_5779) * _bufferSizeAndInvSize.y))));
        float _5794 = 0.5f / _bufferSizeAndInvSize.x;
        _5796 = 0;
        _5797 = _5287;
        _5798 = _5337;
        _5799 = (((_5733 * 0.5f) + 0.5f) + (_5787 * _5777));
        _5800 = ((0.5f - (_5734 * 0.5f)) + (_5787 * _5779));
        _5801 = ((_5787 * _5780) + _5735);
        _5802 = 0;
        _5803 = 1.0f;
        _5804 = 0.0f;
        while(true) {
          uint _5813 = __3__36__0__0__g_depthStencil.Load(int3(int(min(max(_5799, _5794), (1.0f - _5794)) * _bufferSizeAndInvSize.x), int(_5800 * _bufferSizeAndInvSize.y), 0));
          int _5815 = (uint)((uint)(_5813.x)) >> 24;
          float _5818 = float((uint)((uint)(_5813.x & 16777215))) * 5.960465188081798e-08f;
          int _5819 = _5815 & 127;
          bool _5820 = (_5796 == 0);
          float _5821 = select(_5820, 1.0f, _5797);
          float _5822 = _5801 - _5818;
          float _5826 = _nearFarProj.x / max(1.0000000116860974e-07f, _5818);
          float _5829 = _5826 - (_nearFarProj.x / max(1.0000000116860974e-07f, _5801));
          bool _5832 = (abs(_5822 + _5774) < _5774);
          int _5833 = (int)(uint)((int)(_5832));
          if (_5832) {
            if (((_5819 == 7)) || ((((_5819 == 54)) || (((((_5815 & 126) == 66)) || (((((uint)(_5819 + -5) < (uint)2)) || ((((_5819 == 107)) || ((((_5819 == 26)) || (((((uint)(_5819 + -27) < (uint)2)) || ((((_5819 == 106)) || (((((_5815 & 125) == 105)) || ((((_5819 == 18)) || (((uint)(_5819 + -19) < (uint)2))))))))))))))))))))) {
              _5867 = true;
              _5874 = ((int)(uint)((int)(((_5829 < 0.0f)) && ((_5829 > select(_5867, -0.07999999821186066f, -1.0f))))));
            } else {
              if ((uint)(_5819 + -53) < (uint)14) {
                _5867 = (_5826 < 32.0f);
                _5874 = ((int)(uint)((int)(((_5829 < 0.0f)) && ((_5829 > select(_5867, -0.07999999821186066f, -1.0f))))));
              } else {
                _5874 = _5833;
              }
            }
          } else {
            _5874 = _5833;
          }
          if (!(_5874 == 0)) {
            if ((uint)_5819 > (uint)11) {
              if (!((uint)_5819 < (uint)18)) {
                if (!(((_5819 == 18)) || ((((_5819 == 107)) || (((uint)(_5819 + -19) < (uint)2)))))) {
                  if (!(_5819 == 66)) {
                    _5893 = 0.0f;
                  } else {
                    _5893 = 0.10000000149011612f;
                  }
                } else {
                  _5893 = 0.15000000596046448f;
                }
              } else {
                _5893 = 0.10000000149011612f;
              }
            } else {
              if (!(_5819 == 11)) {
                _5893 = 0.0f;
              } else {
                _5893 = 0.10000000149011612f;
              }
            }
            float _5895 = saturate(_5826 * 0.015625f);
            float _5898 = (1.0f - _5895) + (_5895 * _5893);
            _5908 = _5819;
            float _microFarAccum = saturate(1.0f - ((_5898 * _5898) * _5893)) * (1.0f - _5804);
            _5909 = saturate((_microFarAccum * lerp(1.0f, CONTACT_SHADOW_RT_ACCUM_STRENGTH, CONTACT_SHADOW_RT_TUNING)) + _5804);
          } else {
            _5908 = _5802;
            _5909 = _5804;
          }
          [branch]
          if (_5909 > 0.949999988079071f) {
            if (!_5820) {
              _5940 = (saturate(_5803 / (_5803 - _5822)) - min(_5798, _5821));
            } else {
              _5940 = 0.0f;
            }
            _5950 = _5819;
            _5951 = _5909;
            _5952 = ((_5940 * _5777) + _5799);
            _5953 = ((_5940 * _5779) + _5800);
            _5954 = ((_5940 * _5780) + _5801);
            _5955 = _5818;
          } else {
            if ((uint)_5796 < (uint)(_5261 + -1)) {
              _5932 = (_5798 + _5821);
              _5933 = (_5799 + (_5821 * _5777));
              _5934 = (_5800 + (_5821 * _5779));
              _5935 = (_5801 + (_5821 * _5780));
              _5936 = min(abs(_5780), _5822);
            } else {
              _5932 = _5798;
              _5933 = _5799;
              _5934 = _5800;
              _5935 = _5801;
              _5936 = _5803;
            }
            if ((uint)(_5796 + 1) < (uint)_5261) {
              _5796 = (_5796 + 1);
              _5797 = _5821;
              _5798 = _5932;
              _5799 = _5933;
              _5800 = _5934;
              _5801 = _5935;
              _5802 = _5908;
              _5803 = _5936;
              _5804 = _5909;
              continue;
            } else {
              _5950 = _5908;
              _5951 = _5909;
              _5952 = 0.0f;
              _5953 = 0.0f;
              _5954 = -1.0f;
              _5955 = 0.0f;
            }
          }
          break;
        }
      }
      bool _5959 = (_5951 > 0.0f);
      if (_5954 > 0.0f) {
        if ((_5959) || ((((((_5952 >= 0.0f)) && ((_5952 <= 1.0f)))) && ((((_5953 >= 0.0f)) && ((_5953 <= 1.0f))))))) {
          float _5973 = (_5952 * 2.0f) + -1.0f;
          float _5974 = 1.0f - (_5953 * 2.0f);
          float _5990 = mad((_invViewProjRelative[3].z), _5954, mad((_invViewProjRelative[3].y), _5974, (_5973 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
          if (!(_5950 == 2)) {
            if (_5950 == 3) {
              _6016 = 0.0f;
              _6018 = _6016;
            } else {
              if (_5950 == 21) {
                if (!(_80 == 21)) {
                  _6016 = 0.0f;
                  _6018 = _6016;
                } else {
                  _6018 = 20.0f;
                }
              } else {
                bool _6009 = (_5950 == 22);
                if (!(((_80 == 22)) && (_6009))) {
                  _6016 = select(_6009, 0.0f, 1.0f);
                  _6018 = _6016;
                } else {
                  _6018 = 20.0f;
                }
              }
            }
          } else {
            if (!(_80 == 2)) {
              _6016 = 0.0f;
              _6018 = _6016;
            } else {
              _6018 = 20.0f;
            }
          }
          if (!((_170) || ((!(_5951 == 1.0f))))) {
            _6042 = saturate(((((_5281 * 0.9375f) - max(0.0f, dot(float3(_5252, _5256, _5260), float3((((mad((_invViewProjRelative[0].z), _5954, mad((_invViewProjRelative[0].y), _5974, (_5973 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _5990) - _5374), (((mad((_invViewProjRelative[1].z), _5954, mad((_invViewProjRelative[1].y), _5974, (_5973 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _5990) - _5375), (((mad((_invViewProjRelative[2].z), _5954, mad((_invViewProjRelative[2].y), _5974, (_5973 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _5990) - _5376))))) * ((_115 * 0.015625f) + 1.5f)) / _5281) * 0.9375f);
          } else {
            _6042 = _5951;
          }
          float _6043 = _6042 * saturate(exp2(min(0.0f, (((_115 * 0.01899999938905239f) + 0.10000000149011612f) + (_6018 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _5955)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _5954)))))) * 1.4426950216293335f));
          int _6044 = _5950 & -2;
          if (!(_6044 == 6)) {
            bool __defer_6046_6056 = false;
            if ((((_80 == 33) && (_5950 == 33)) || (!(_80 == 33) && (((_80 == 55)) && ((_5950 == 55)))))) {
              _6118 = (_6043 * 0.009999999776482582f);
            } else {
              __defer_6046_6056 = true;
            }
            if (__defer_6046_6056) {
              if (!(((_5950 == 54)) || ((_6044 == 66))) || ((((_5950 == 54)) || ((_6044 == 66))) && (!(((_5147 == 66)) || ((_80 == 54)))))) {
                if (!_172) {
                  if ((uint)((int)((uint)(_5950) + (uint)(-53))) < (uint)15) {
                    _6115 = saturate(_115 * 0.03125f);
                  } else {
                    _6115 = 1.0f;
                  }
                  _6118 = (_6115 * _6043);
                } else {
                  _6118 = _6043;
                }
              } else {
                uint4 _6070 = __3__36__0__0__g_baseColor.Load(int3(int(_5952 * _bufferSizeAndInvSize.x), int(_5953 * _bufferSizeAndInvSize.y), 0));
                float _6076 = float((uint)((uint)(((uint)((uint)(_6070.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _6079 = float((uint)((uint)(_6070.x & 255))) * 0.003921568859368563f;
                float _6083 = float((uint)((uint)(((uint)((uint)(_6070.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _6084 = _6076 * _6076;
                float _6085 = _6079 * _6079;
                float _6086 = _6083 * _6083;
                _6118 = (saturate(1.0f - (dot(float3((((_6084 * 0.6131200194358826f) + (_6085 * 0.3395099937915802f)) + (_6086 * 0.047370001673698425f)), (((_6084 * 0.07020000368356705f) + (_6085 * 0.9163600206375122f)) + (_6086 * 0.013450000435113907f)), (((_6084 * 0.02061999961733818f) + (_6085 * 0.10958000272512436f)) + (_6086 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _6043);
              }
            }
          } else {
            _6118 = (_6043 * 0.009999999776482582f);
          }
        } else {
          _6118 = 0.0f;
        }
      } else {
        if (_5959) {
          float _5973 = (_5952 * 2.0f) + -1.0f;
          float _5974 = 1.0f - (_5953 * 2.0f);
          float _5990 = mad((_invViewProjRelative[3].z), _5954, mad((_invViewProjRelative[3].y), _5974, (_5973 * (_invViewProjRelative[3].x)))) + (_invViewProjRelative[3].w);
          if (!(_5950 == 2)) {
            if (_5950 == 3) {
              _6016 = 0.0f;
              _6018 = _6016;
            } else {
              if (_5950 == 21) {
                if (!(_80 == 21)) {
                  _6016 = 0.0f;
                  _6018 = _6016;
                } else {
                  _6018 = 20.0f;
                }
              } else {
                bool _6009 = (_5950 == 22);
                if (!(((_80 == 22)) && (_6009))) {
                  _6016 = select(_6009, 0.0f, 1.0f);
                  _6018 = _6016;
                } else {
                  _6018 = 20.0f;
                }
              }
            }
          } else {
            if (!(_80 == 2)) {
              _6016 = 0.0f;
              _6018 = _6016;
            } else {
              _6018 = 20.0f;
            }
          }
          if (!((_170) || ((!(_5951 == 1.0f))))) {
            _6042 = saturate(((((_5281 * 0.9375f) - max(0.0f, dot(float3(_5252, _5256, _5260), float3((((mad((_invViewProjRelative[0].z), _5954, mad((_invViewProjRelative[0].y), _5974, (_5973 * (_invViewProjRelative[0].x)))) + (_invViewProjRelative[0].w)) / _5990) - _5374), (((mad((_invViewProjRelative[1].z), _5954, mad((_invViewProjRelative[1].y), _5974, (_5973 * (_invViewProjRelative[1].x)))) + (_invViewProjRelative[1].w)) / _5990) - _5375), (((mad((_invViewProjRelative[2].z), _5954, mad((_invViewProjRelative[2].y), _5974, (_5973 * (_invViewProjRelative[2].x)))) + (_invViewProjRelative[2].w)) / _5990) - _5376))))) * ((_115 * 0.015625f) + 1.5f)) / _5281) * 0.9375f);
          } else {
            _6042 = _5951;
          }
          float _6043 = _6042 * saturate(exp2(min(0.0f, (((_115 * 0.01899999938905239f) + 0.10000000149011612f) + (_6018 * ((_nearFarProj.x / max(1.0000000116860974e-07f, _5955)) - (_nearFarProj.x / max(1.0000000116860974e-07f, _5954)))))) * 1.4426950216293335f));
          int _6044 = _5950 & -2;
          if (!(_6044 == 6)) {
            bool __defer_6046_6056 = false;
            if ((((_80 == 33) && (_5950 == 33)) || (!(_80 == 33) && (((_80 == 55)) && ((_5950 == 55)))))) {
              _6118 = (_6043 * 0.009999999776482582f);
            } else {
              __defer_6046_6056 = true;
            }
            if (__defer_6046_6056) {
              if (!(((_5950 == 54)) || ((_6044 == 66))) || ((((_5950 == 54)) || ((_6044 == 66))) && (!(((_5147 == 66)) || ((_80 == 54)))))) {
                if (!_172) {
                  if ((uint)((int)((uint)(_5950) + (uint)(-53))) < (uint)15) {
                    _6115 = saturate(_115 * 0.03125f);
                  } else {
                    _6115 = 1.0f;
                  }
                  _6118 = (_6115 * _6043);
                } else {
                  _6118 = _6043;
                }
              } else {
                uint4 _6070 = __3__36__0__0__g_baseColor.Load(int3(int(_5952 * _bufferSizeAndInvSize.x), int(_5953 * _bufferSizeAndInvSize.y), 0));
                float _6076 = float((uint)((uint)(((uint)((uint)(_6070.x)) >> 8) & 255))) * 0.003921568859368563f;
                float _6079 = float((uint)((uint)(_6070.x & 255))) * 0.003921568859368563f;
                float _6083 = float((uint)((uint)(((uint)((uint)(_6070.y)) >> 8) & 255))) * 0.003921568859368563f;
                float _6084 = _6076 * _6076;
                float _6085 = _6079 * _6079;
                float _6086 = _6083 * _6083;
                _6118 = (saturate(1.0f - (dot(float3((((_6084 * 0.6131200194358826f) + (_6085 * 0.3395099937915802f)) + (_6086 * 0.047370001673698425f)), (((_6084 * 0.07020000368356705f) + (_6085 * 0.9163600206375122f)) + (_6086 * 0.013450000435113907f)), (((_6084 * 0.02061999961733818f) + (_6085 * 0.10958000272512436f)) + (_6086 * 0.8697999715805054f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * 0.875f)) * _6043);
              }
            }
          } else {
            _6118 = (_6043 * 0.009999999776482582f);
          }
        } else {
          _6118 = 0.0f;
        }
      }
      _6122 = saturate(1.0f - _6118);
    } else {
      _6122 = 1.0f;
    }
    float _rndxMicroBaseContact = _6122;
    #define MICRO_PIXEL_X_FLOAT   _60
    #define MICRO_PIXEL_Y_FLOAT   _61
    #define MICRO_LINEAR_DEPTH    _115
    #define MICRO_CONTACT_SHADOW  _6122
    #define MICRO_STENCIL         _80
    #define MICRO_LIGHT_DIR_X     _rndxMicroDirX
    #define MICRO_LIGHT_DIR_Y     _rndxMicroDirY
    #define MICRO_LIGHT_DIR_Z     _rndxMicroDirZ
    #define MICRO_WORLD_POS_X     _rndxMicroWorldPosX
    #define MICRO_WORLD_POS_Y     _rndxMicroWorldPosY
    #define MICRO_WORLD_POS_Z     _rndxMicroWorldPosZ
    #define CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE CONTACT_MICRO_DETAIL_STRENGTH_RT
    #define CONTACT_MICRO_DISTANCE_FADE_ACTIVE CONTACT_MICRO_DISTANCE_FADE_RT
    #define CONTACT_MICRO_RANGE_NEAR_ACTIVE CONTACT_MICRO_RANGE_NEAR_RT
    #define CONTACT_MICRO_RANGE_FAR_ACTIVE CONTACT_MICRO_RANGE_FAR_RT
    #define CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE CONTACT_MICRO_THICKNESS_MULTIPLIER_RT
    #define CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE CONTACT_MICRO_OCCLUSION_SCALE_RT
    #define CONTACT_MICRO_SELF_REJECT_PIXELS_ACTIVE CONTACT_MICRO_SELF_REJECT_PIXELS_RT
    #define CONTACT_MICRO_SELF_FADE_PIXELS_ACTIVE CONTACT_MICRO_SELF_FADE_PIXELS_RT
    #define CONTACT_MICRO_FOLIAGE_THICKNESS_BOOST_ACTIVE CONTACT_MICRO_FOLIAGE_THICKNESS_BOOST_RT
    #define CONTACT_MICRO_FOLIAGE_OCCLUSION_BOOST_ACTIVE CONTACT_MICRO_FOLIAGE_OCCLUSION_BOOST_RT
    #include "micro_detail_shadows.hlsli"
    #undef CONTACT_MICRO_DETAIL_STRENGTH_ACTIVE
    #undef CONTACT_MICRO_DISTANCE_FADE_ACTIVE
    #undef CONTACT_MICRO_RANGE_NEAR_ACTIVE
    #undef CONTACT_MICRO_RANGE_FAR_ACTIVE
    #undef CONTACT_MICRO_THICKNESS_MULTIPLIER_ACTIVE
    #undef CONTACT_MICRO_OCCLUSION_SCALE_ACTIVE
    #undef CONTACT_MICRO_SELF_REJECT_PIXELS_ACTIVE
    #undef CONTACT_MICRO_SELF_FADE_PIXELS_ACTIVE
    #undef CONTACT_MICRO_FOLIAGE_THICKNESS_BOOST_ACTIVE
    #undef CONTACT_MICRO_FOLIAGE_OCCLUSION_BOOST_ACTIVE
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
    if (CONTACT_SHADOW_RT_TUNING > 0.f || CONTACT_SHADOW_DETAIL_PATH == 1.f) {
      float _rndxMicroWithHelper = _6122;
      float _rndxMicroBaseBoosted = _rndxMicroBaseContact;
      float _rndxMicroHelperBoosted = _rndxMicroWithHelper;
      if (CONTACT_SHADOW_RT_TUNING > 0.f && _rndxMicroBaseBoosted < 1.0f) {
        _rndxMicroBaseBoosted = saturate(1.0f - ((1.0f - _rndxMicroBaseBoosted) * lerp(1.0f, CONTACT_SHADOW_RT_FINAL_STRENGTH, CONTACT_SHADOW_RT_TUNING)));
      }
      if (CONTACT_SHADOW_RT_TUNING > 0.f && _rndxMicroHelperBoosted < 1.0f) {
        _rndxMicroHelperBoosted = saturate(1.0f - ((1.0f - _rndxMicroHelperBoosted) * lerp(1.0f, CONTACT_SHADOW_RT_FINAL_STRENGTH, CONTACT_SHADOW_RT_TUNING)));
      }
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _rndxMicroHelperBoosted < _rndxMicroBaseBoosted) {
        float2 _screenUV = float2((_60 + 0.5f) * _bufferSizeAndInvSize.z,
                                   (_61 + 0.5f) * _bufferSizeAndInvSize.w);
        float2 _edgeDist = min(_screenUV, 1.0f - _screenUV);
        float _edgeFade = saturate(min(_edgeDist.x, _edgeDist.y) * 10.0f);
        _6122 = lerp(_rndxMicroBaseBoosted, _rndxMicroHelperBoosted, _edgeFade);
      } else {
        _6122 = _rndxMicroHelperBoosted;
      }
    } else {
      if (CONTACT_SHADOW_RT_TUNING > 0.f && _6122 < 1.0f) {
        _6122 = saturate(1.0f - ((1.0f - _6122) * lerp(1.0f, CONTACT_SHADOW_RT_FINAL_STRENGTH, CONTACT_SHADOW_RT_TUNING)));
      }
      if (CONTACT_SHADOW_DETAIL_PATH == 1.f && _6122 < 1.0f) {
        float2 _screenUV = float2((_60 + 0.5f) * _bufferSizeAndInvSize.z,
                                   (_61 + 0.5f) * _bufferSizeAndInvSize.w);
        float2 _edgeDist = min(_screenUV, 1.0f - _screenUV);
        float _edgeFade = saturate(min(_edgeDist.x, _edgeDist.y) * 10.0f);
        _6122 = lerp(lerp(1.0f, _6122, 0.5f), _6122, _edgeFade);
      }
    }
    float _6123 = min(_5137, _6122);
    _6137 = float(half(_6123 * float(_5113)));
    _6138 = float(half(_6123 * float(_5114)));
    _6139 = float(half(_6123 * float(_5115)));
    _6140 = saturate((1.0f - _556) + (exp2(log2(saturate(select(_172, (_5122 + 0.9800000190734863f), _5122))) * 0.45454543828964233f) * _556));
  }
  __3__38__0__1__g_shadowColorResultUAV[int2(((int)(((uint)(((((int)((uint)(_46) << 2)) & 1020) | ((int)(SV_GroupID.x) & 3)) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((((uint)((uint)(_46)) >> 6) & 1020) | (((uint)(SV_GroupID.x) >> 2) & 3)) << 3)) + SV_GroupThreadID.y)))] = half4(half(_6137), half(_6138), half(_6139), half(_6140));
}
