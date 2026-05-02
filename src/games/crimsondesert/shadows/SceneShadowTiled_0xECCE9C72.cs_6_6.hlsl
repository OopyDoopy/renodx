#include "../shared.h"

// ── Foliage Contact Shadow Material ID Reference ─────────────────────
// ID 12 = Tree leaves + larger bushes (close/medium range)
// ID 13 = Small-scale foliage (close/medium range)
// ID 14 = Small-scale foliage (close/medium range)
// ID 15 = Distant tree LODs + larger bushes (medium/long range)
// ID 16 = Same Larger bushes as ID 15 + smaller bushes (close/medium range, no trees)
// ID 17 = Grass, flowers, small foliage (close/medium range)
// ID 18 = Very small bushes + grass not covered by other IDs (close/medium range)
// ─────────────────────────────────────────────────────────────────────

Texture2D<float4> __3__36__0__0__g_terrainShadowDepth : register(t140, space36);

Texture2DArray<float4> __3__36__0__0__g_dynamicShadowDepthArray : register(t230, space36);

Texture2DArray<half4> __3__36__0__0__g_dynamicShadowColorArray : register(t232, space36);

Texture2DArray<float4> __3__36__0__0__g_shadowDepthArray : register(t233, space36);

Texture2D<uint4> __3__36__0__0__g_baseColor : register(t44, space36);

Texture2D<uint> __3__36__0__0__g_depthStencil : register(t40, space36);

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t51, space36);

Texture2D<float> __3__36__0__0__g_nearFieldShadowDepth : register(t72, space36);

RWTexture2D<half4> __3__38__0__1__g_shadowColorResultUAV : register(u39, space38);

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
  uint _isPhotosensitiveMode_isAllolwBlood;
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b33, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__35__0__0__NearFieldShadowConstantBuffer : register(b43, space35) {
  float4 _nearFieldShadowBoundsMin : packoffset(c000.x);
  float4 _nearFieldShadowBoundsMax : packoffset(c001.x);
  column_major float4x4 _nearFieldShadowViewProjCompacted : packoffset(c002.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _shadowAOParams : packoffset(c000.x);
  float4 _tiledRadianceCacheParams : packoffset(c001.x);
};

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

SamplerComparisonState __3__40__0__0__g_samplerShadow : register(s0, space40);

static const float _global_0[32] = { -7.0f, -8.0f, 0.0f, -7.0f, -4.0f, -6.0f, 3.0f, -5.0f, 7.0f, -4.0f, -1.0f, -3.0f, -5.0f, -2.0f, 4.0f, -1.0f, -8.0f, 0.0f, 1.0f, 1.0f, -3.0f, 2.0f, 5.0f, 3.0f, -6.0f, 4.0f, 2.0f, 5.0f, -2.0f, 6.0f, 6.0f, 7.0f };

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _18[4];
  float _27[2];
  float _28[2];
  float _29[2];
  int _30 = (uint)(SV_GroupID.x) >> 4;
  int _31 = (uint)(SV_GroupID.x) >> 6;
  int _32 = _30 & 3;
  _18[0] = ((g_tileIndex[_31]).x);
  _18[1] = ((g_tileIndex[_31]).y);
  _18[2] = ((g_tileIndex[_31]).z);
  _18[3] = ((g_tileIndex[_31]).w);
  int _43 = _18[_32];
  int _44 = (uint)((uint)(_43)) >> 16;
  int _46 = ((int)((uint)(_43) << 2)) & 262140;
  int _48 = (int)(SV_GroupID.x) & 3;
  int _50 = (uint)(SV_GroupID.x) >> 2;
  int _51 = _50 & 3;
  float _57 = float((uint)(((uint)((_46 | _48) << 3)) + SV_GroupThreadID.x));
  float _58 = float((uint)(((uint)(((_44 << 2) | _51) << 3)) + SV_GroupThreadID.y));
  float _59 = _57 + 0.5f;
  float _60 = _58 + 0.5f;
  float _64 = _bufferSizeAndInvSize.z * 2.0f;
  float _65 = _64 * _59;
  float _66 = _65 + -1.0f;
  float _67 = _bufferSizeAndInvSize.w * 2.0f;
  float _68 = _67 * _60;
  float _69 = 1.0f - _68;
  uint _71 = __3__36__0__0__g_depthStencil.Load(int3(((int)(((uint)((_46 | _48) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((_44 << 2) | _51) << 3)) + SV_GroupThreadID.y)), 0));
  int _73 = (uint)((uint)(_71.x)) >> 24;
  int _74 = _71.x & 16777215;
  float _75 = float((uint)(uint)(_74));
  float _76 = _75 * 5.960465188081798e-08f;
  int _77 = _73 & 127;
  uint _79 = __3__36__0__0__g_sceneNormal.Load(int3(((int)(((uint)((_46 | _48) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((_44 << 2) | _51) << 3)) + SV_GroupThreadID.y)), 0));
  int _81 = (uint)((uint)(_79.x)) >> 10;
  int _82 = (uint)((uint)(_79.x)) >> 20;
  int _83 = _79.x & 1023;
  int _84 = _81 & 1023;
  int _85 = _82 & 1023;
  float _86 = float((uint)(uint)(_83));
  float _87 = float((uint)(uint)(_84));
  float _88 = float((uint)(uint)(_85));
  float _89 = _86 * 0.001956947147846222f;
  float _90 = _87 * 0.001956947147846222f;
  float _91 = _88 * 0.001956947147846222f;
  float _92 = _89 + -1.0f;
  float _93 = _90 + -1.0f;
  float _94 = _91 + -1.0f;
  float _95 = min(1.0f, _92);
  float _96 = min(1.0f, _93);
  float _97 = min(1.0f, _94);
  float _98 = dot(float3(_95, _96, _97), float3(_95, _96, _97));
  float _99 = rsqrt(_98);
  float _100 = _99 * _95;
  float _101 = _99 * _96;
  float _102 = _99 * _97;
  bool _103 = (_76 < 1.0000000116860974e-07f);
  bool _104 = (_76 == 1.0f);
  bool _105 = (_103) || (_104);
  int _374;
  float _553;
  float _627;
  int _628;
  float _629;
  float _693;
  int _694;
  int _695;
  float _696;
  float _758;
  int _759;
  int _760;
  float _809;
  int _810;
  int _811;
  int _970;
  int _1490;
  float _1593;
  float _1594;
  half _1595;
  half _1596;
  half _1597;
  float _1674;
  float _1675;
  float _1676;
  int _1721;
  int _1757;
  float _1771;
  float _1784;
  int _1785;
  float _1876;
  float _1877;
  float _1878;
  float _1880;
  int _1881;
  float _1921;
  float _1922;
  float _1965;
  float _1966;
  float _1967;
  float _2077;
  int _2249;
  float _2255;
  float _2268;
  float _2281;
  float _2291;
  float _2292;
  float _2293;
  float _2302;
  float _2303;
  float _2304;
  int _2449;
  float _2450;
  float _2451;
  float _2452;
  float _2453;
  float _2454;
  int _2455;
  float _2456;
  float _2457;
  bool _2520;
  int _2527;
  float _2546;
  int _2561;
  float _2562;
  float _2584;
  float _2585;
  float _2586;
  float _2587;
  float _2588;
  float _2592;
  int _2719;
  float _2720;
  float _2721;
  float _2722;
  float _2723;
  float _2724;
  int _2725;
  float _2726;
  float _2727;
  bool _2790;
  int _2797;
  float _2816;
  int _2831;
  float _2832;
  float _2854;
  float _2855;
  float _2856;
  float _2857;
  float _2858;
  float _2862;
  int _2872;
  float _2873;
  float _2874;
  float _2875;
  float _2876;
  float _2877;
  float _2958;
  float _2960;
  float _2983;
  float _3059;
  float _3062;
  float _3066;
  float _3081;
  float _3082;
  float _3083;
  float _3084;
  if (_105) {
    float _107 = select(_104, 0.0f, 1.0f);
    _3081 = _107;
    _3082 = _107;
    _3083 = _107;
    _3084 = _107;
  } else {
    float _111 = max(1.0000000116860974e-07f, _76);
    float _112 = _nearFarProj.x / _111;
    float _133 = (_invViewProjRelative[0].x) * _66;
    float _134 = mad((_invViewProjRelative[0].y), _69, _133);
    float _135 = mad((_invViewProjRelative[0].z), _111, _134);
    float _136 = _135 + (_invViewProjRelative[0].w);
    float _137 = (_invViewProjRelative[1].x) * _66;
    float _138 = mad((_invViewProjRelative[1].y), _69, _137);
    float _139 = mad((_invViewProjRelative[1].z), _111, _138);
    float _140 = _139 + (_invViewProjRelative[1].w);
    float _141 = (_invViewProjRelative[2].x) * _66;
    float _142 = mad((_invViewProjRelative[2].y), _69, _141);
    float _143 = mad((_invViewProjRelative[2].z), _111, _142);
    float _144 = _143 + (_invViewProjRelative[2].w);
    float _145 = (_invViewProjRelative[3].x) * _66;
    float _146 = mad((_invViewProjRelative[3].y), _69, _145);
    float _147 = mad((_invViewProjRelative[3].z), _111, _146);
    float _148 = _147 + (_invViewProjRelative[3].w);
    float _149 = _136 / _148;
    float _150 = _140 / _148;
    float _151 = _144 / _148;
    float _152 = dot(float3(_149, _150, _151), float3(_149, _150, _151));
    float _153 = rsqrt(_152);
    _27[0] = 0.0f;
    _28[0] = 0.0f;
    _29[0] = 0.0f;
    _27[1] = 0.0f;
    _28[1] = 0.0f;
    _29[1] = 0.0f;
    uint _165 = _frameNumber.x * 1551;
    bool _169 = ((_77 == 57) || ((uint)(_77 + -53) < (uint)15));
    float _186 = (_terrainShadowProjRelativeTexScale[0].x) * _149;
    float _187 = mad((_terrainShadowProjRelativeTexScale[0].y), _150, _186);
    float _188 = mad((_terrainShadowProjRelativeTexScale[0].z), _151, _187);
    float _189 = _188 + (_terrainShadowProjRelativeTexScale[0].w);
    float _190 = (_terrainShadowProjRelativeTexScale[1].x) * _149;
    float _191 = mad((_terrainShadowProjRelativeTexScale[1].y), _150, _190);
    float _192 = mad((_terrainShadowProjRelativeTexScale[1].z), _151, _191);
    float _193 = _192 + (_terrainShadowProjRelativeTexScale[1].w);
    float _194 = (_terrainShadowProjRelativeTexScale[2].x) * _149;
    float _195 = mad((_terrainShadowProjRelativeTexScale[2].y), _150, _194);
    float _196 = mad((_terrainShadowProjRelativeTexScale[2].z), _151, _195);
    float _197 = _196 + (_terrainShadowProjRelativeTexScale[2].w);
    float _198 = saturate(_189);
    bool _199 = (_198 == _189);
    if (_199) {
      float _201 = saturate(_193);
      bool _206 = ((_197 >= 9.999999747378752e-05f) && ((_197 <= 1.0f) && (_201 == _193)));
      if (_206) {
        float _208 = float((uint)(uint)(_frameNumber.x));
        float _209 = _208 * 92.0f;
        float _210 = _208 * 71.0f;
        float _211 = _209 + _57;
        float _212 = _210 + _58;
        float _213 = _211 * 0.0078125f;
        float _214 = _212 * 0.0078125f;
        float _215 = frac(_213);
        float _216 = frac(_214);
        float _217 = _215 * 128.0f;
        float _218 = _216 * 128.0f;
        float _219 = _217 + -64.34062194824219f;
        float _220 = _218 + -72.46562194824219f;
        float _221 = _219 * _219;
        float _222 = _220 * _220;
        float _223 = _220 * _219;
        float _224 = dot(float3(_221, _222, _223), float3(20.390625f, 60.703125f, 2.4281208515167236f));
        float _225 = frac(_224);
        float _226 = _225 * 51540816.0f;
        float _227 = _225 * 287478368.0f;
        uint _228 = uint(_226);
        uint _229 = uint(_227);
        float _231 = _58 * _bufferSizeAndInvSize.x;
        float _232 = _231 + _57;
        uint _233 = uint(_232);
        int _237 = ((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)));
        int _238 = (uint)((uint)(_frameNumber.x)) >> 5;
        int _240 = _237 ^ (_238 + -939442524);
        int _245 = ((int)((((uint)(_240) + _233) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_240) + _233) + (uint)(-1640531527)));
        int _246 = (uint)((uint)(_240) + _233) >> 5;
        int _248 = _245 ^ ((int)((uint)(_246) + 2123724318u));
        int _253 = ((int)((((uint)(_248) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_248) + (uint)(_frameNumber.x)) + 1013904242u));
        int _254 = (uint)((uint)(_248) + (uint)(_frameNumber.x)) >> 5;
        int _256 = _253 ^ (_254 + -939442524);
        int _261 = ((int)((((uint)(_256) + ((uint)(_240) + _233)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_256) + ((uint)(_240) + _233)) + 1013904242u));
        int _262 = (uint)((uint)(_256) + ((uint)(_240) + _233)) >> 5;
        int _264 = _261 ^ ((int)((uint)(_262) + 2123724318u));
        int _269 = ((int)((((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
        int _270 = (uint)((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))) >> 5;
        int _272 = _269 ^ (_270 + -939442524);
        int _277 = ((int)((((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))) + (uint)(-626627285)));
        int _278 = (uint)((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))) >> 5;
        int _280 = _277 ^ ((int)((uint)(_278) + 2123724318u));
        int _285 = ((int)((((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))) + 2027808484u));
        int _286 = (uint)((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))) >> 5;
        int _288 = _285 ^ (_286 + -939442524);
        int _293 = ((int)((((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))) + 2027808484u));
        int _294 = (uint)((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))) >> 5;
        int _296 = _293 ^ ((int)((uint)(_294) + 2123724318u));
        int _301 = ((int)((((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))) + 387276957u));
        int _302 = (uint)((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))) >> 5;
        int _304 = _301 ^ (_302 + -939442524);
        int _309 = ((int)((((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))))) + 387276957u));
        int _310 = (uint)((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))))) >> 5;
        int _312 = _309 ^ ((int)((uint)(_310) + 2123724318u));
        int _317 = ((int)((((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
        int _318 = (uint)((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))))) >> 5;
        int _320 = _317 ^ (_318 + -939442524);
        int _325 = ((int)((((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))))) + (uint)(-1253254570)));
        int _326 = (uint)((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))))) >> 5;
        int _328 = _325 ^ ((int)((uint)(_326) + 2123724318u));
        int _333 = ((int)((((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))))) + 1401181199u));
        int _334 = (uint)((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))))) >> 5;
        int _336 = _333 ^ (_334 + -939442524);
        int _341 = ((int)((((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))))))) + 1401181199u));
        int _342 = (uint)((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))))))) >> 5;
        int _344 = _341 ^ ((int)((uint)(_342) + 2123724318u));
        int _349 = ((int)((((uint)(_344) + ((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_344) + ((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
        int _350 = (uint)((uint)(_344) + ((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x)))))))) >> 5;
        int _352 = _349 ^ (_350 + -939442524);
        int _357 = ((int)((((uint)(_352) + ((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_352) + ((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))))))) + (uint)(-239350328)));
        int _358 = (uint)((uint)(_352) + ((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))))))) >> 5;
        int _360 = _357 ^ ((int)((uint)(_358) + 2123724318u));
        int _362 = ((int)((uint)(_352) + ((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))))))))) & 16777215;
        bool _363 = (_362 == 0);
        if (_363) {
          int _368 = ((int)((((uint)(_360) + ((uint)(_344) + ((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_360) + ((uint)(_344) + ((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
          int _369 = (uint)((uint)(_360) + ((uint)(_344) + ((uint)(_328) + ((uint)(_312) + ((uint)(_296) + ((uint)(_280) + ((uint)(_264) + ((uint)(_248) + (uint)(_frameNumber.x))))))))) >> 5;
          int _371 = _368 ^ (_369 + -939442524);
          _374 = ((int)((uint)(_371) + ((uint)(_352) + ((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233))))))))));
        } else {
          _374 = ((int)((uint)(_352) + ((uint)(_336) + ((uint)(_320) + ((uint)(_304) + ((uint)(_288) + ((uint)(_272) + ((uint)(_256) + ((uint)(_240) + _233)))))))));
        }
        uint _375 = _374 * 48271;
        int _376 = (int)(_375) & 16777215;
        float _377 = float((uint)(uint)(_376));
        float _378 = _377 * 3.814637693722034e-06f;
        uint _379 = uint(_378);
        float _380 = float((uint)_379);
        float _381 = _380 * 0.015625f;
        int _382 = (int)(_228) & 65535;
        float _383 = float((uint)(uint)(_382));
        float _384 = _383 * 1.52587890625e-05f;
        float _385 = _381 + _384;
        float _386 = frac(_385);
        int _387 = reversebits(_379);
        int _388 = _387 ^ (int)(_229);
        float _389 = float((uint)(uint)(_388));
        float _390 = _386 * 2.0f;
        float _391 = _389 * 4.656612873077393e-10f;
        float _392 = _390 + -1.0f;
        float _393 = _391 + -1.0f;
        float _394 = dot(float2(_392, _393), float2(_392, _393));
        float _395 = rsqrt(_394);
        float _396 = _393 * _395;
        float _400 = _386 * 0.0009765625f;
        float _401 = _400 + -0.00048828125f;
        float _402 = _401 * _395;
        float _403 = _402 * (_jitterOffset[0].x);
        float _404 = _396 * 0.00048828125f;
        float _405 = _404 * (_jitterOffset[0].y);
        float _406 = _403 + _189;
        float _407 = _405 + _193;
        float _408 = _406 * 1024.0f;
        float _409 = _407 * 1024.0f;
        float _410 = _408 + -0.5f;
        float _411 = _409 + -0.5f;
        float _412 = frac(_410);
        float _413 = frac(_411);
        float4 _416 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_406, _407));
        float _421 = _197 + -0.004999999888241291f;
        bool _422 = (_416.w > _421);
        bool _423 = (_416.z > _421);
        bool _424 = (_416.x > _421);
        bool _425 = (_416.y > _421);
        float _426 = select(_422, 1.0f, 0.0f);
        float _427 = select(_423, 1.0f, 0.0f);
        float _428 = select(_424, 1.0f, 0.0f);
        float _429 = select(_425, 1.0f, 0.0f);
        float _430 = _429 - _428;
        float _431 = _430 * _412;
        float _432 = _431 + _428;
        float _433 = _427 - _426;
        float _434 = _433 * _412;
        float _435 = _434 + _426;
        float _436 = _432 - _435;
        float _437 = _436 * _413;
        float _438 = _437 + _435;
        float _439 = saturate(_438);
        float _443 = (_jitterOffset[1].x) * _402;
        float _444 = (_jitterOffset[1].y) * _404;
        float _445 = _443 + _189;
        float _446 = _444 + _193;
        float _447 = _445 * 1024.0f;
        float _448 = _446 * 1024.0f;
        float _449 = _447 + -0.5f;
        float _450 = _448 + -0.5f;
        float _451 = frac(_449);
        float _452 = frac(_450);
        float4 _453 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_445, _446));
        bool _458 = (_453.w > _421);
        bool _459 = (_453.z > _421);
        bool _460 = (_453.x > _421);
        bool _461 = (_453.y > _421);
        float _462 = select(_458, 1.0f, 0.0f);
        float _463 = select(_459, 1.0f, 0.0f);
        float _464 = select(_460, 1.0f, 0.0f);
        float _465 = select(_461, 1.0f, 0.0f);
        float _466 = _465 - _464;
        float _467 = _466 * _451;
        float _468 = _467 + _464;
        float _469 = _463 - _462;
        float _470 = _469 * _451;
        float _471 = _470 + _462;
        float _472 = _468 - _471;
        float _473 = _472 * _452;
        float _474 = _473 + _471;
        float _475 = saturate(_474);
        float _476 = _475 + _439;
        float _480 = (_jitterOffset[2].x) * _402;
        float _481 = (_jitterOffset[2].y) * _404;
        float _482 = _480 + _189;
        float _483 = _481 + _193;
        float _484 = _482 * 1024.0f;
        float _485 = _483 * 1024.0f;
        float _486 = _484 + -0.5f;
        float _487 = _485 + -0.5f;
        float _488 = frac(_486);
        float _489 = frac(_487);
        float4 _490 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_482, _483));
        bool _495 = (_490.w > _421);
        bool _496 = (_490.z > _421);
        bool _497 = (_490.x > _421);
        bool _498 = (_490.y > _421);
        float _499 = select(_495, 1.0f, 0.0f);
        float _500 = select(_496, 1.0f, 0.0f);
        float _501 = select(_497, 1.0f, 0.0f);
        float _502 = select(_498, 1.0f, 0.0f);
        float _503 = _502 - _501;
        float _504 = _503 * _488;
        float _505 = _504 + _501;
        float _506 = _500 - _499;
        float _507 = _506 * _488;
        float _508 = _507 + _499;
        float _509 = _505 - _508;
        float _510 = _509 * _489;
        float _511 = _510 + _508;
        float _512 = saturate(_511);
        float _513 = _476 + _512;
        float _517 = (_jitterOffset[3].x) * _402;
        float _518 = (_jitterOffset[3].y) * _404;
        float _519 = _517 + _189;
        float _520 = _518 + _193;
        float _521 = _519 * 1024.0f;
        float _522 = _520 * 1024.0f;
        float _523 = _521 + -0.5f;
        float _524 = _522 + -0.5f;
        float _525 = frac(_523);
        float _526 = frac(_524);
        float4 _527 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_519, _520));
        bool _532 = (_527.w > _421);
        bool _533 = (_527.z > _421);
        bool _534 = (_527.x > _421);
        bool _535 = (_527.y > _421);
        float _536 = select(_532, 1.0f, 0.0f);
        float _537 = select(_533, 1.0f, 0.0f);
        float _538 = select(_534, 1.0f, 0.0f);
        float _539 = select(_535, 1.0f, 0.0f);
        float _540 = _539 - _538;
        float _541 = _540 * _525;
        float _542 = _541 + _538;
        float _543 = _537 - _536;
        float _544 = _543 * _525;
        float _545 = _544 + _536;
        float _546 = _542 - _545;
        float _547 = _546 * _526;
        float _548 = _547 + _545;
        float _549 = saturate(_548);
        float _550 = _513 + _549;
        float _551 = _550 * 0.25f;
        _553 = _551;
      } else {
        _553 = 1.0f;
      }
    } else {
      _553 = 1.0f;
    }
    float _556 = _149 * _149;
    float _557 = _150 * _150;
    float _558 = _557 + _556;
    float _559 = _151 * _151;
    float _560 = _558 + _559;
    float _561 = sqrt(_560);
    float _578 = (_dynamicShadowProjRelativeTexScale[1][0].x) * _149;
    float _579 = mad((_dynamicShadowProjRelativeTexScale[1][0].y), _150, _578);
    float _580 = mad((_dynamicShadowProjRelativeTexScale[1][0].z), _151, _579);
    float _581 = _580 + (_dynamicShadowProjRelativeTexScale[1][0].w);
    float _582 = (_dynamicShadowProjRelativeTexScale[1][1].x) * _149;
    float _583 = mad((_dynamicShadowProjRelativeTexScale[1][1].y), _150, _582);
    float _584 = mad((_dynamicShadowProjRelativeTexScale[1][1].z), _151, _583);
    float _585 = _584 + (_dynamicShadowProjRelativeTexScale[1][1].w);
    float _586 = (_dynamicShadowProjRelativeTexScale[1][2].x) * _149;
    float _587 = mad((_dynamicShadowProjRelativeTexScale[1][2].y), _150, _586);
    float _588 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _151, _587);
    float _589 = _588 + (_dynamicShadowProjRelativeTexScale[1][2].w);
    float _590 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
    float _591 = 1.0f - _590;
    bool _592 = !(_581 >= _590);
    bool _593 = !(_581 <= _591);
    bool _594 = (_593) || (_592);
    bool _595 = !(_585 <= _591);
    bool _596 = (_594) || (_595);
    if (!_596) {
      bool _604 = ((_561 < 128.0f) && ((_589 >= -1.0f) && ((_589 <= 1.0f) && (_585 >= _590))));
      if (_604) {
        float _606 = _581 * 2.0f;
        float _607 = _585 * 2.0f;
        float _608 = _606 + -1.0f;
        float _609 = _607 + -1.0f;
        float _610 = abs(_608);
        float _611 = abs(_609);
        float _612 = _610 + -0.8999999761581421f;
        float _613 = _611 + -0.8999999761581421f;
        float _614 = _612 * 10.0f;
        float _615 = _613 * 10.0f;
        float _616 = max(0.0f, _614);
        float _617 = max(0.0f, _615);
        float _618 = _616 * _616;
        float _619 = _617 * _617;
        float _620 = _619 + _618;
        float _621 = sqrt(_620);
        _27[1] = _581;
        _28[1] = _585;
        _29[1] = _589;
        bool _624 = (_terrainNormalParams.y > 0.0f);
        float _625 = select(_624, 1.9999999494757503e-05f, 7.999999797903001e-05f);
        _627 = _625;
        _628 = 1;
        _629 = _621;
      } else {
        _627 = 0.0f;
        _628 = 0;
        _629 = 0.0f;
      }
    } else {
      _627 = 0.0f;
      _628 = 0;
      _629 = 0.0f;
    }
    float _646 = (_dynamicShadowProjRelativeTexScale[0][0].x) * _149;
    float _647 = mad((_dynamicShadowProjRelativeTexScale[0][0].y), _150, _646);
    float _648 = mad((_dynamicShadowProjRelativeTexScale[0][0].z), _151, _647);
    float _649 = _648 + (_dynamicShadowProjRelativeTexScale[0][0].w);
    float _650 = (_dynamicShadowProjRelativeTexScale[0][1].x) * _149;
    float _651 = mad((_dynamicShadowProjRelativeTexScale[0][1].y), _150, _650);
    float _652 = mad((_dynamicShadowProjRelativeTexScale[0][1].z), _151, _651);
    float _653 = _652 + (_dynamicShadowProjRelativeTexScale[0][1].w);
    float _654 = (_dynamicShadowProjRelativeTexScale[0][2].x) * _149;
    float _655 = mad((_dynamicShadowProjRelativeTexScale[0][2].y), _150, _654);
    float _656 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _151, _655);
    float _657 = _656 + (_dynamicShadowProjRelativeTexScale[0][2].w);
    bool _658 = !(_649 <= _591);
    bool _659 = !(_649 >= _590);
    bool _660 = (_659) || (_658);
    bool _661 = !(_653 <= _591);
    bool _662 = (_660) || (_661);
    if (!_662) {
      bool _670 = ((_561 < 128.0f) && ((_657 >= -1.0f) && ((_653 >= _590) && (_657 <= 1.0f))));
      if (_670) {
        float _672 = _649 * 2.0f;
        float _673 = _653 * 2.0f;
        float _674 = _672 + -1.0f;
        float _675 = _673 + -1.0f;
        float _676 = abs(_674);
        float _677 = abs(_675);
        float _678 = _676 + -0.8999999761581421f;
        float _679 = _677 + -0.8999999761581421f;
        float _680 = _678 * 10.0f;
        float _681 = _679 * 10.0f;
        float _682 = max(0.0f, _680);
        float _683 = max(0.0f, _681);
        float _684 = _682 * _682;
        float _685 = _683 * _683;
        float _686 = _685 + _684;
        float _687 = sqrt(_686);
        _27[0] = _649;
        _28[0] = _653;
        _29[0] = _657;
        bool _690 = (_terrainNormalParams.y > 0.0f);
        float _691 = select(_690, 4.999999873689376e-06f, 1.9999999494757503e-05f);
        _693 = _691;
        _694 = 1;
        _695 = 0;
        _696 = _687;
      } else {
        _693 = _627;
        _694 = _628;
        _695 = _628;
        _696 = _629;
      }
    } else {
      _693 = _627;
      _694 = _628;
      _695 = _628;
      _696 = _629;
    }
    bool _697 = (_694 == 0);
    [branch]
    if (_697) {
      float _705 = _viewPos.x + _149;
      float _706 = _viewPos.y + _150;
      float _707 = _viewPos.z + _151;
      float _712 = _705 - (_staticShadowPosition[1].x);
      float _713 = _706 - (_staticShadowPosition[1].y);
      float _714 = _707 - (_staticShadowPosition[1].z);
      float _731 = (_shadowProjRelativeTexScale[1][0].x) * _712;
      float _732 = mad((_shadowProjRelativeTexScale[1][0].y), _713, _731);
      float _733 = mad((_shadowProjRelativeTexScale[1][0].z), _714, _732);
      float _734 = _733 + (_shadowProjRelativeTexScale[1][0].w);
      float _735 = (_shadowProjRelativeTexScale[1][1].x) * _712;
      float _736 = mad((_shadowProjRelativeTexScale[1][1].y), _713, _735);
      float _737 = mad((_shadowProjRelativeTexScale[1][1].z), _714, _736);
      float _738 = _737 + (_shadowProjRelativeTexScale[1][1].w);
      float _739 = (_shadowProjRelativeTexScale[1][2].x) * _712;
      float _740 = mad((_shadowProjRelativeTexScale[1][2].y), _713, _739);
      float _741 = mad((_shadowProjRelativeTexScale[1][2].z), _714, _740);
      float _742 = _741 + (_shadowProjRelativeTexScale[1][2].w);
      float _743 = 2.0f / _shadowSizeAndInvSize.y;
      float _744 = 1.0f - _743;
      bool _745 = !(_734 >= _743);
      bool _746 = !(_734 <= _744);
      bool _747 = (_746) || (_745);
      bool _748 = !(_738 <= _744);
      bool _749 = (_747) || (_748);
      if (!_749) {
        bool _755 = ((_742 >= 9.999999747378752e-05f) && ((_742 <= 1.0f) && (_738 >= _743)));
        if (_755) {
          _27[1] = _734;
          _28[1] = _738;
          _29[1] = _742;
          _758 = 0.00019999999494757503f;
          _759 = 1;
          _760 = 1;
        } else {
          _758 = _693;
          _759 = 0;
          _760 = _695;
        }
      } else {
        _758 = _693;
        _759 = 0;
        _760 = _695;
      }
      float _765 = _705 - (_staticShadowPosition[0].x);
      float _766 = _706 - (_staticShadowPosition[0].y);
      float _767 = _707 - (_staticShadowPosition[0].z);
      float _784 = (_shadowProjRelativeTexScale[0][0].x) * _765;
      float _785 = mad((_shadowProjRelativeTexScale[0][0].y), _766, _784);
      float _786 = mad((_shadowProjRelativeTexScale[0][0].z), _767, _785);
      float _787 = _786 + (_shadowProjRelativeTexScale[0][0].w);
      float _788 = (_shadowProjRelativeTexScale[0][1].x) * _765;
      float _789 = mad((_shadowProjRelativeTexScale[0][1].y), _766, _788);
      float _790 = mad((_shadowProjRelativeTexScale[0][1].z), _767, _789);
      float _791 = _790 + (_shadowProjRelativeTexScale[0][1].w);
      float _792 = (_shadowProjRelativeTexScale[0][2].x) * _765;
      float _793 = mad((_shadowProjRelativeTexScale[0][2].y), _766, _792);
      float _794 = mad((_shadowProjRelativeTexScale[0][2].z), _767, _793);
      float _795 = _794 + (_shadowProjRelativeTexScale[0][2].w);
      bool _796 = !(_787 <= _744);
      bool _797 = !(_787 >= _743);
      bool _798 = (_797) || (_796);
      bool _799 = !(_791 <= _744);
      bool _800 = (_798) || (_799);
      if (!_800) {
        bool _806 = ((_795 >= 9.999999747378752e-05f) && ((_791 >= _743) && (_795 <= 1.0f)));
        if (_806) {
          _27[0] = _787;
          _28[0] = _791;
          _29[0] = _795;
          _809 = 0.00019999999494757503f;
          _810 = 1;
          _811 = 0;
        } else {
          _809 = _758;
          _810 = _759;
          _811 = _760;
        }
      } else {
        _809 = _758;
        _810 = _759;
        _811 = _760;
      }
    } else {
      _809 = _693;
      _810 = 1;
      _811 = _695;
    }
    float _817 = _58 * _bufferSizeAndInvSize.x;
    float _818 = _817 + _57;
    uint _819 = uint(_818);
    int _823 = ((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)));
    int _824 = (uint)((uint)(_frameNumber.x)) >> 5;
    int _826 = _823 ^ (_824 + -939442524);
    int _831 = ((int)((((uint)(_826) + _819) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_826) + _819) + (uint)(-1640531527)));
    int _832 = (uint)((uint)(_826) + _819) >> 5;
    int _834 = _831 ^ ((int)((uint)(_832) + 2123724318u));
    int _839 = ((int)((((uint)(_834) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_834) + (uint)(_frameNumber.x)) + 1013904242u));
    int _840 = (uint)((uint)(_834) + (uint)(_frameNumber.x)) >> 5;
    int _842 = _839 ^ (_840 + -939442524);
    int _847 = ((int)((((uint)(_842) + ((uint)(_826) + _819)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_842) + ((uint)(_826) + _819)) + 1013904242u));
    int _848 = (uint)((uint)(_842) + ((uint)(_826) + _819)) >> 5;
    int _850 = _847 ^ ((int)((uint)(_848) + 2123724318u));
    int _855 = ((int)((((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    int _856 = (uint)((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))) >> 5;
    int _858 = _855 ^ (_856 + -939442524);
    int _863 = ((int)((((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))) + (uint)(-626627285)));
    int _864 = (uint)((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))) >> 5;
    int _866 = _863 ^ ((int)((uint)(_864) + 2123724318u));
    int _871 = ((int)((((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _872 = (uint)((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))) >> 5;
    int _874 = _871 ^ (_872 + -939442524);
    int _879 = ((int)((((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))) + 2027808484u));
    int _880 = (uint)((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))) >> 5;
    int _882 = _879 ^ ((int)((uint)(_880) + 2123724318u));
    int _887 = ((int)((((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))) + 387276957u));
    int _888 = (uint)((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))) >> 5;
    int _890 = _887 ^ (_888 + -939442524);
    int _895 = ((int)((((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))) + 387276957u));
    int _896 = (uint)((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))) >> 5;
    int _898 = _895 ^ ((int)((uint)(_896) + 2123724318u));
    int _903 = ((int)((((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
    int _904 = (uint)((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))))) >> 5;
    int _906 = _903 ^ (_904 + -939442524);
    int _911 = ((int)((((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))) + (uint)(-1253254570)));
    int _912 = (uint)((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))) >> 5;
    int _914 = _911 ^ ((int)((uint)(_912) + 2123724318u));
    int _919 = ((int)((((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))) + 1401181199u));
    int _920 = (uint)((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))) >> 5;
    int _922 = _919 ^ (_920 + -939442524);
    int _927 = ((int)((((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))))) + 1401181199u));
    int _928 = (uint)((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))))) >> 5;
    int _930 = _927 ^ ((int)((uint)(_928) + 2123724318u));
    int _935 = ((int)((((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
    int _936 = (uint)((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x)))))))) >> 5;
    int _938 = _935 ^ (_936 + -939442524);
    int _943 = ((int)((((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))))) + (uint)(-239350328)));
    int _944 = (uint)((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))))) >> 5;
    int _946 = _943 ^ ((int)((uint)(_944) + 2123724318u));
    int _948 = ((int)((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))))))) & 16777215;
    bool _949 = (_948 == 0);
    [branch]
    if (_697) {
      float _1477 = _27[_811];
      float _1478 = _28[_811];
      float _1479 = _29[_811];
      if (_949) {
        int _1484 = ((int)((((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
        int _1485 = (uint)((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) >> 5;
        int _1487 = _1484 ^ (_1485 + -939442524);
        _1490 = ((int)((uint)(_1487) + ((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))))))));
      } else {
        _1490 = ((int)((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))))));
      }
      float _1491 = _shadowSizeAndInvSize.z * 2.0f;
      float _1492 = _shadowSizeAndInvSize.w * 2.0f;
      uint _1493 = _1490 * 48271;
      int _1494 = (int)(_1493) & 16777215;
      float _1495 = float((uint)(uint)(_1494));
      uint _1496 = _1490 * -1964877855;
      int _1497 = (int)(_1496) & 16777215;
      float _1498 = float((uint)(uint)(_1497));
      float _1499 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      float _1500 = _1495 * _1499;
      float _1501 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      float _1502 = _1498 * _1501;
      float _1503 = _1500 - _1491;
      float _1504 = _1502 - _1492;
      float _1505 = _1503 + _1477;
      float _1506 = _1504 + _1478;
      float _1507 = float((uint)(uint)(_811));
      float4 _1510 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1505, _1506, _1507), 0.0f);
      float _1512 = _1479 - _1510.x;
      float _1513 = max(0.0f, _1512);
      float _1514 = _1479 - _809;
      float4 _1516 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1505, _1506, _1507), _1514);
      float _1518 = 1.0f - _1516.x;
      float _1519 = saturate(_1518);
      uint _1520 = _1490 * -856141137;
      int _1521 = (int)(_1520) & 16777215;
      float _1522 = float((uint)(uint)(_1521));
      uint _1523 = _1490 * -613502015;
      int _1524 = (int)(_1523) & 16777215;
      float _1525 = float((uint)(uint)(_1524));
      float _1526 = _1522 * _1499;
      float _1527 = _1525 * _1501;
      float _1528 = _1526 - _1491;
      float _1529 = _1527 - _1492;
      float _1530 = _1528 + _1477;
      float _1531 = _1529 + _1478;
      float4 _1532 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1530, _1531, _1507), 0.0f);
      float _1534 = _1479 - _1532.x;
      float _1535 = max(0.0f, _1534);
      float4 _1536 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1530, _1531, _1507), _1514);
      float _1538 = 1.0f - _1536.x;
      float _1539 = saturate(_1538);
      float _1540 = _1539 + _1519;
      float _1541 = _1535 + _1513;
      uint _1542 = _1490 * -556260145;
      int _1543 = (int)(_1542) & 16777215;
      float _1544 = float((uint)(uint)(_1543));
      uint _1545 = _1490 * 902075297;
      int _1546 = (int)(_1545) & 16777215;
      float _1547 = float((uint)(uint)(_1546));
      float _1548 = _1544 * _1499;
      float _1549 = _1547 * _1501;
      float _1550 = _1548 - _1491;
      float _1551 = _1549 - _1492;
      float _1552 = _1550 + _1477;
      float _1553 = _1551 + _1478;
      float4 _1554 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1552, _1553, _1507), 0.0f);
      float _1556 = _1479 - _1554.x;
      float _1557 = max(0.0f, _1556);
      float4 _1558 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1552, _1553, _1507), _1514);
      float _1560 = 1.0f - _1558.x;
      float _1561 = saturate(_1560);
      float _1562 = _1540 + _1561;
      float _1563 = _1541 + _1557;
      uint _1564 = _1490 * 1698214639;
      int _1565 = (int)(_1564) & 16777215;
      float _1566 = float((uint)(uint)(_1565));
      uint _1567 = _1490 * 773027713;
      int _1568 = (int)(_1567) & 16777215;
      float _1569 = float((uint)(uint)(_1568));
      float _1570 = _1566 * _1499;
      float _1571 = _1569 * _1501;
      float _1572 = _1570 - _1491;
      float _1573 = _1571 - _1492;
      float _1574 = _1572 + _1477;
      float _1575 = _1573 + _1478;
      float4 _1576 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1574, _1575, _1507), 0.0f);
      float _1578 = _1479 - _1576.x;
      float _1579 = max(0.0f, _1578);
      float4 _1580 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1574, _1575, _1507), _1514);
      float _1582 = 1.0f - _1580.x;
      float _1583 = saturate(_1582);
      float _1584 = _1562 + _1583;
      float _1585 = _1563 + _1579;
      float _1586 = _1584 * 0.25f;
      float _1587 = _1585 * 0.25f;
      float _1588 = _1586 * _1586;
      float _1589 = _1587 * _1587;
      float _1590 = saturate(_1588);
      float _1591 = saturate(_1589);
      _1593 = _1590;
      _1594 = _1591;
      _1595 = 1.0h;
      _1596 = 1.0h;
      _1597 = 1.0h;
    } else {
      float _953 = _27[_811];
      float _954 = _28[_811];
      float _955 = _29[_811];
      bool _956 = (_811 == 0);
      float _957 = select(_956, 2.5f, 1.0f);
      float _958 = _957 * 0.75f;
      float _959 = select(_169, _958, _957);
      if (_949) {
        int _964 = ((int)((((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
        int _965 = (uint)((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) >> 5;
        int _967 = _964 ^ (_965 + -939442524);
        _970 = ((int)((uint)(_967) + ((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))))))));
      } else {
        _970 = ((int)((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))))));
      }
      float _971 = _959 * 0.6600000262260437f;
      float _972 = _971 * _dynmaicShadowSizeAndInvSize.z;
      float _973 = _971 * _dynmaicShadowSizeAndInvSize.w;
      uint _974 = _970 * 48271;
      int _975 = (int)(_974) & 16777215;
      float _976 = float((uint)(uint)(_975));
      uint _977 = _970 * -1964877855;
      int _978 = (int)(_977) & 16777215;
      float _979 = float((uint)(uint)(_978));
      float _980 = _972 * 1.1920928955078125e-07f;
      float _981 = _976 * _980;
      float _982 = _973 * 1.1920928955078125e-07f;
      float _983 = _979 * _982;
      float _984 = _981 - _972;
      float _985 = _983 - _973;
      float _986 = _984 + _953;
      float _987 = _985 + _954;
      float _988 = float((uint)(uint)(_811));
      float4 _991 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_986, _987, _988), 0.0f);
      float _993 = _955 - _991.x;
      float _994 = max(0.0f, _993);
      float _995 = _955 - _809;
      float4 _997 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_986, _987, _988), _995);
      float _999 = 1.0f - _997.x;
      float _1000 = saturate(_999);
      half4 _1002 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_986, _987, _988), 0.0f);
      uint _1006 = _970 * -856141137;
      int _1007 = (int)(_1006) & 16777215;
      float _1008 = float((uint)(uint)(_1007));
      uint _1009 = _970 * -613502015;
      int _1010 = (int)(_1009) & 16777215;
      float _1011 = float((uint)(uint)(_1010));
      float _1012 = _1008 * _980;
      float _1013 = _1011 * _982;
      float _1014 = _1012 - _972;
      float _1015 = _1013 - _973;
      float _1016 = _1014 + _953;
      float _1017 = _1015 + _954;
      float4 _1018 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1016, _1017, _988), 0.0f);
      float _1020 = _955 - _1018.x;
      float _1021 = max(0.0f, _1020);
      float4 _1022 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1016, _1017, _988), _995);
      float _1024 = 1.0f - _1022.x;
      float _1025 = saturate(_1024);
      half4 _1026 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1016, _1017, _988), 0.0f);
      float _1030 = _1025 + _1000;
      float _1031 = _1021 + _994;
      uint _1032 = _970 * -556260145;
      int _1033 = (int)(_1032) & 16777215;
      float _1034 = float((uint)(uint)(_1033));
      uint _1035 = _970 * 902075297;
      int _1036 = (int)(_1035) & 16777215;
      float _1037 = float((uint)(uint)(_1036));
      float _1038 = _1034 * _980;
      float _1039 = _1037 * _982;
      float _1040 = _1038 - _972;
      float _1041 = _1039 - _973;
      float _1042 = _1040 + _953;
      float _1043 = _1041 + _954;
      float4 _1044 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1042, _1043, _988), 0.0f);
      float _1046 = _955 - _1044.x;
      float _1047 = max(0.0f, _1046);
      float4 _1048 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1042, _1043, _988), _995);
      float _1050 = 1.0f - _1048.x;
      float _1051 = saturate(_1050);
      half4 _1052 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1042, _1043, _988), 0.0f);
      float _1056 = _1030 + _1051;
      float _1057 = _1031 + _1047;
      uint _1058 = _970 * 1698214639;
      int _1059 = (int)(_1058) & 16777215;
      float _1060 = float((uint)(uint)(_1059));
      uint _1061 = _970 * 773027713;
      int _1062 = (int)(_1061) & 16777215;
      float _1063 = float((uint)(uint)(_1062));
      float _1064 = _1060 * _980;
      float _1065 = _1063 * _982;
      float _1066 = _1064 - _972;
      float _1067 = _1065 - _973;
      float _1068 = _1066 + _953;
      float _1069 = _1067 + _954;
      float4 _1070 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1068, _1069, _988), 0.0f);
      float _1072 = _955 - _1070.x;
      float _1073 = max(0.0f, _1072);
      float4 _1074 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1068, _1069, _988), _995);
      float _1076 = 1.0f - _1074.x;
      float _1077 = saturate(_1076);
      half4 _1078 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1068, _1069, _988), 0.0f);
      float _1082 = _1056 + _1077;
      float _1083 = _1057 + _1073;
      uint _1084 = _970 * 144866575;
      int _1085 = (int)(_1084) & 16777215;
      float _1086 = float((uint)(uint)(_1085));
      uint _1087 = _970 * 647683937;
      int _1088 = (int)(_1087) & 16777215;
      float _1089 = float((uint)(uint)(_1088));
      float _1090 = _1086 * _980;
      float _1091 = _1089 * _982;
      float _1092 = _1090 - _972;
      float _1093 = _1091 - _973;
      float _1094 = _1092 + _953;
      float _1095 = _1093 + _954;
      float4 _1096 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1094, _1095, _988), 0.0f);
      float _1098 = _955 - _1096.x;
      float _1099 = max(0.0f, _1098);
      float4 _1100 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1094, _1095, _988), _995);
      float _1102 = 1.0f - _1100.x;
      float _1103 = saturate(_1102);
      half4 _1104 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1094, _1095, _988), 0.0f);
      float _1108 = _1082 + _1103;
      float _1109 = _1083 + _1099;
      uint _1110 = _970 * 1284375343;
      int _1111 = (int)(_1110) & 16777215;
      float _1112 = float((uint)(uint)(_1111));
      uint _1113 = _970 * 229264193;
      int _1114 = (int)(_1113) & 16777215;
      float _1115 = float((uint)(uint)(_1114));
      float _1116 = _1112 * _980;
      float _1117 = _1115 * _982;
      float _1118 = _1116 - _972;
      float _1119 = _1117 - _973;
      float _1120 = _1118 + _953;
      float _1121 = _1119 + _954;
      float4 _1122 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1120, _1121, _988), 0.0f);
      float _1124 = _955 - _1122.x;
      float _1125 = max(0.0f, _1124);
      float4 _1126 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1120, _1121, _988), _995);
      float _1128 = 1.0f - _1126.x;
      float _1129 = saturate(_1128);
      half4 _1130 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1120, _1121, _988), 0.0f);
      float _1134 = _1108 + _1129;
      float _1135 = _1109 + _1125;
      uint _1136 = _970 * -1318861489;
      int _1137 = (int)(_1136) & 16777215;
      float _1138 = float((uint)(uint)(_1137));
      uint _1139 = _970 * 1537293089;
      int _1140 = (int)(_1139) & 16777215;
      float _1141 = float((uint)(uint)(_1140));
      float _1142 = _1138 * _980;
      float _1143 = _1141 * _982;
      float _1144 = _1142 - _972;
      float _1145 = _1143 - _973;
      float _1146 = _1144 + _953;
      float _1147 = _1145 + _954;
      float4 _1148 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1146, _1147, _988), 0.0f);
      float _1150 = _955 - _1148.x;
      float _1151 = max(0.0f, _1150);
      float4 _1152 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1146, _1147, _988), _995);
      float _1154 = 1.0f - _1152.x;
      float _1155 = saturate(_1154);
      half4 _1156 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1146, _1147, _988), 0.0f);
      float _1160 = _1134 + _1155;
      float _1161 = _1135 + _1151;
      uint _1162 = _970 * -1770241169;
      int _1163 = (int)(_1162) & 16777215;
      float _1164 = float((uint)(uint)(_1163));
      uint _1165 = _970 * 1357852417;
      int _1166 = (int)(_1165) & 16777215;
      float _1167 = float((uint)(uint)(_1166));
      float _1168 = _1164 * _980;
      float _1169 = _1167 * _982;
      float _1170 = _1168 - _972;
      float _1171 = _1169 - _973;
      float _1172 = _1170 + _953;
      float _1173 = _1171 + _954;
      float4 _1174 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1172, _1173, _988), 0.0f);
      float _1176 = _955 - _1174.x;
      float _1177 = max(0.0f, _1176);
      float4 _1178 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1172, _1173, _988), _995);
      float _1180 = 1.0f - _1178.x;
      float _1181 = saturate(_1180);
      half4 _1182 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1172, _1173, _988), 0.0f);
      float _1186 = _1160 + _1181;
      float _1187 = _1161 + _1177;
      uint _1188 = _970 * -601883249;
      int _1189 = (int)(_1188) & 16777215;
      float _1190 = float((uint)(uint)(_1189));
      uint _1191 = _970 * 1947444961;
      int _1192 = (int)(_1191) & 16777215;
      float _1193 = float((uint)(uint)(_1192));
      float _1194 = _1190 * _980;
      float _1195 = _1193 * _982;
      float _1196 = _1194 - _972;
      float _1197 = _1195 - _973;
      float _1198 = _1196 + _953;
      float _1199 = _1197 + _954;
      float4 _1200 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1198, _1199, _988), 0.0f);
      float _1202 = _955 - _1200.x;
      float _1203 = max(0.0f, _1202);
      float4 _1204 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1198, _1199, _988), _995);
      float _1206 = 1.0f - _1204.x;
      float _1207 = saturate(_1206);
      half4 _1208 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1198, _1199, _988), 0.0f);
      float _1212 = _1186 + _1207;
      float _1213 = _1187 + _1203;
      uint _1214 = _970 * 1166504879;
      int _1215 = (int)(_1214) & 16777215;
      float _1216 = float((uint)(uint)(_1215));
      uint _1217 = _970 * 1335763649;
      int _1218 = (int)(_1217) & 16777215;
      float _1219 = float((uint)(uint)(_1218));
      float _1220 = _1216 * _980;
      float _1221 = _1219 * _982;
      float _1222 = _1220 - _972;
      float _1223 = _1221 - _973;
      float _1224 = _1222 + _953;
      float _1225 = _1223 + _954;
      float4 _1226 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1224, _1225, _988), 0.0f);
      float _1228 = _955 - _1226.x;
      float _1229 = max(0.0f, _1228);
      float4 _1230 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1224, _1225, _988), _995);
      float _1232 = 1.0f - _1230.x;
      float _1233 = saturate(_1232);
      half4 _1234 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1224, _1225, _988), 0.0f);
      float _1238 = _1212 + _1233;
      float _1239 = _1213 + _1229;
      uint _1240 = _970 * -1696913969;
      int _1241 = (int)(_1240) & 16777215;
      float _1242 = float((uint)(uint)(_1241));
      uint _1243 = _970 * 1882071713;
      int _1244 = (int)(_1243) & 16777215;
      float _1245 = float((uint)(uint)(_1244));
      float _1246 = _1242 * _980;
      float _1247 = _1245 * _982;
      float _1248 = _1246 - _972;
      float _1249 = _1247 - _973;
      float _1250 = _1248 + _953;
      float _1251 = _1249 + _954;
      float4 _1252 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1250, _1251, _988), 0.0f);
      float _1254 = _955 - _1252.x;
      float _1255 = max(0.0f, _1254);
      float4 _1256 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1250, _1251, _988), _995);
      float _1258 = 1.0f - _1256.x;
      float _1259 = saturate(_1258);
      half4 _1260 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1250, _1251, _988), 0.0f);
      float _1264 = _1238 + _1259;
      float _1265 = _1239 + _1255;
      uint _1266 = _970 * -1959554065;
      int _1267 = (int)(_1266) & 16777215;
      float _1268 = float((uint)(uint)(_1267));
      uint _1269 = _970 * -1569511807;
      int _1270 = (int)(_1269) & 16777215;
      float _1271 = float((uint)(uint)(_1270));
      float _1272 = _1268 * _980;
      float _1273 = _1271 * _982;
      float _1274 = _1272 - _972;
      float _1275 = _1273 - _973;
      float _1276 = _1274 + _953;
      float _1277 = _1275 + _954;
      float4 _1278 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1276, _1277, _988), 0.0f);
      float _1280 = _955 - _1278.x;
      float _1281 = max(0.0f, _1280);
      float4 _1282 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1276, _1277, _988), _995);
      float _1284 = 1.0f - _1282.x;
      float _1285 = saturate(_1284);
      half4 _1286 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1276, _1277, _988), 0.0f);
      float _1290 = _1264 + _1285;
      float _1291 = _1265 + _1281;
      uint _1292 = _970 * 1318665743;
      int _1293 = (int)(_1292) & 16777215;
      float _1294 = float((uint)(uint)(_1293));
      uint _1295 = _970 * 1898753633;
      int _1296 = (int)(_1295) & 16777215;
      float _1297 = float((uint)(uint)(_1296));
      float _1298 = _1294 * _980;
      float _1299 = _1297 * _982;
      float _1300 = _1298 - _972;
      float _1301 = _1299 - _973;
      float _1302 = _1300 + _953;
      float _1303 = _1301 + _954;
      float4 _1304 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1302, _1303, _988), 0.0f);
      float _1306 = _955 - _1304.x;
      float _1307 = max(0.0f, _1306);
      float4 _1308 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1302, _1303, _988), _995);
      float _1310 = 1.0f - _1308.x;
      float _1311 = saturate(_1310);
      half4 _1312 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1302, _1303, _988), 0.0f);
      float _1316 = _1290 + _1311;
      float _1317 = _1291 + _1307;
      uint _1318 = _970 * 134521903;
      int _1319 = (int)(_1318) & 16777215;
      float _1320 = float((uint)(uint)(_1319));
      uint _1321 = _970 * -483771839;
      int _1322 = (int)(_1321) & 16777215;
      float _1323 = float((uint)(uint)(_1322));
      float _1324 = _1320 * _980;
      float _1325 = _1323 * _982;
      float _1326 = _1324 - _972;
      float _1327 = _1325 - _973;
      float _1328 = _1326 + _953;
      float _1329 = _1327 + _954;
      float4 _1330 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1328, _1329, _988), 0.0f);
      float _1332 = _955 - _1330.x;
      float _1333 = max(0.0f, _1332);
      float4 _1334 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1328, _1329, _988), _995);
      float _1336 = 1.0f - _1334.x;
      float _1337 = saturate(_1336);
      half4 _1338 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1328, _1329, _988), 0.0f);
      float _1342 = _1316 + _1337;
      float _1343 = _1317 + _1333;
      uint _1344 = _970 * -413252017;
      int _1345 = (int)(_1344) & 16777215;
      float _1346 = float((uint)(uint)(_1345));
      uint _1347 = _970 * 2034977313;
      int _1348 = (int)(_1347) & 16777215;
      float _1349 = float((uint)(uint)(_1348));
      float _1350 = _1346 * _980;
      float _1351 = _1349 * _982;
      float _1352 = _1350 - _972;
      float _1353 = _1351 - _973;
      float _1354 = _1352 + _953;
      float _1355 = _1353 + _954;
      float4 _1356 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1354, _1355, _988), 0.0f);
      float _1358 = _955 - _1356.x;
      float _1359 = max(0.0f, _1358);
      float4 _1360 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1354, _1355, _988), _995);
      float _1362 = 1.0f - _1360.x;
      float _1363 = saturate(_1362);
      half4 _1364 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1354, _1355, _988), 0.0f);
      float _1368 = _1342 + _1363;
      float _1369 = _1343 + _1359;
      uint _1370 = _970 * 192849007;
      int _1371 = (int)(_1370) & 16777215;
      float _1372 = float((uint)(uint)(_1371));
      uint _1373 = _970 * 1820286465;
      int _1374 = (int)(_1373) & 16777215;
      float _1375 = float((uint)(uint)(_1374));
      float _1376 = _1372 * _980;
      float _1377 = _1375 * _982;
      float _1378 = _1376 - _972;
      float _1379 = _1377 - _973;
      float _1380 = _1378 + _953;
      float _1381 = _1379 + _954;
      float4 _1382 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1380, _1381, _988), 0.0f);
      float _1384 = _955 - _1382.x;
      float _1385 = max(0.0f, _1384);
      float4 _1386 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1380, _1381, _988), _995);
      float _1388 = 1.0f - _1386.x;
      float _1389 = saturate(_1388);
      half4 _1390 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1380, _1381, _988), 0.0f);
      float _1394 = _1368 + _1389;
      float _1395 = _1369 + _1385;
      float _1396 = _1394 * 0.0625f;
      float _1397 = _1395 * 0.0625f;
      half _1398 = _1390.x * 2.0h;
      half _1399 = _1026.x + _1002.x;
      half _1400 = _1399 + _1052.x;
      half _1401 = _1400 + _1078.x;
      half _1402 = _1401 + _1104.x;
      half _1403 = _1402 + _1130.x;
      half _1404 = _1403 + _1156.x;
      half _1405 = _1404 + _1182.x;
      half _1406 = _1405 + _1208.x;
      half _1407 = _1406 + _1234.x;
      half _1408 = _1407 + _1260.x;
      half _1409 = _1408 + _1286.x;
      half _1410 = _1409 + _1312.x;
      half _1411 = _1410 + _1338.x;
      half _1412 = _1411 + _1364.x;
      half _1413 = _1412 + _1398;
      half _1414 = _1390.y * 2.0h;
      half _1415 = _1026.y + _1002.y;
      half _1416 = _1415 + _1052.y;
      half _1417 = _1416 + _1078.y;
      half _1418 = _1417 + _1104.y;
      half _1419 = _1418 + _1130.y;
      half _1420 = _1419 + _1156.y;
      half _1421 = _1420 + _1182.y;
      half _1422 = _1421 + _1208.y;
      half _1423 = _1422 + _1234.y;
      half _1424 = _1423 + _1260.y;
      half _1425 = _1424 + _1286.y;
      half _1426 = _1425 + _1312.y;
      half _1427 = _1426 + _1338.y;
      half _1428 = _1427 + _1364.y;
      half _1429 = _1428 + _1414;
      half _1430 = _1390.z * 2.0h;
      half _1431 = _1026.z + _1002.z;
      half _1432 = _1431 + _1052.z;
      half _1433 = _1432 + _1078.z;
      half _1434 = _1433 + _1104.z;
      half _1435 = _1434 + _1130.z;
      half _1436 = _1435 + _1156.z;
      half _1437 = _1436 + _1182.z;
      half _1438 = _1437 + _1208.z;
      half _1439 = _1438 + _1234.z;
      half _1440 = _1439 + _1260.z;
      half _1441 = _1440 + _1286.z;
      half _1442 = _1441 + _1312.z;
      half _1443 = _1442 + _1338.z;
      half _1444 = _1443 + _1364.z;
      half _1445 = _1444 + _1430;
      float _1446 = float(_1413);
      float _1447 = float(_1429);
      float _1448 = float(_1445);
      float _1449 = _1446 * 0.05882352963089943f;
      float _1450 = _1447 * 0.05882352963089943f;
      float _1451 = _1448 * 0.05882352963089943f;
      half _1452 = half(_1449);
      half _1453 = half(_1450);
      half _1454 = half(_1451);
      bool _1455 = (_811 == 1);
      if (_1455) {
        float _1457 = float(_1452);
        float _1458 = float(_1453);
        float _1459 = float(_1454);
        float _1460 = -0.0f - _696;
        float _1461 = _1457 * _1460;
        float _1462 = _1458 * _1460;
        float _1463 = _1459 * _1460;
        float _1464 = _1457 + _696;
        float _1465 = _1464 + _1461;
        float _1466 = _1458 + _696;
        float _1467 = _1466 + _1462;
        float _1468 = _1459 + _696;
        float _1469 = _1468 + _1463;
        half _1470 = half(_1465);
        half _1471 = half(_1467);
        half _1472 = half(_1469);
        _1593 = _1396;
        _1594 = _1397;
        _1595 = _1470;
        _1596 = _1471;
        _1597 = _1472;
      } else {
        _1593 = _1396;
        _1594 = _1397;
        _1595 = _1452;
        _1596 = _1453;
        _1597 = _1454;
      }
    }
    bool _1598 = (_810 != 0);
    float _1599 = select(_1598, _1593, 1.0f);
    float _1600 = min(_553, _1599);
    bool _1601 = (_694 != 0);
    float _1602 = _1594 * 400.0f;
    float _1603 = select(_1598, _1602, 4e+06f);
    float _1604 = select(_1601, _1603, 1.0f);
    float _1605 = _1604 + 0.9800000190734863f;
    float _1606 = select(_169, _1605, _1604);
    if (_169) {
      bool _1610 = (_nearFieldShadowFlag.x > 0.0f);
      [branch]
      if (_1610) {
        bool _1614 = (_shadowAOParams.w > 0.0f);
        if (_1614) {
          float _1632 = (_nearFieldShadowViewProjCompacted[0].x) * _149;
          float _1633 = mad((_nearFieldShadowViewProjCompacted[0].y), _150, _1632);
          float _1634 = mad((_nearFieldShadowViewProjCompacted[0].z), _151, _1633);
          float _1635 = _1634 + (_nearFieldShadowViewProjCompacted[0].w);
          float _1636 = (_nearFieldShadowViewProjCompacted[1].x) * _149;
          float _1637 = mad((_nearFieldShadowViewProjCompacted[1].y), _150, _1636);
          float _1638 = mad((_nearFieldShadowViewProjCompacted[1].z), _151, _1637);
          float _1639 = _1638 + (_nearFieldShadowViewProjCompacted[1].w);
          float _1640 = (_nearFieldShadowViewProjCompacted[2].x) * _149;
          float _1641 = mad((_nearFieldShadowViewProjCompacted[2].y), _150, _1640);
          float _1642 = mad((_nearFieldShadowViewProjCompacted[2].z), _151, _1641);
          float _1643 = _1642 + (_nearFieldShadowViewProjCompacted[2].w);
          _1674 = _1635;
          _1675 = _1639;
          _1676 = _1643;
        } else {
          float _1661 = (_nearFieldShadowViewProj[0].x) * _149;
          float _1662 = mad((_nearFieldShadowViewProj[0].y), _150, _1661);
          float _1663 = mad((_nearFieldShadowViewProj[0].z), _151, _1662);
          float _1664 = _1663 + (_nearFieldShadowViewProj[0].w);
          float _1665 = (_nearFieldShadowViewProj[1].x) * _149;
          float _1666 = mad((_nearFieldShadowViewProj[1].y), _150, _1665);
          float _1667 = mad((_nearFieldShadowViewProj[1].z), _151, _1666);
          float _1668 = _1667 + (_nearFieldShadowViewProj[1].w);
          float _1669 = (_nearFieldShadowViewProj[2].x) * _149;
          float _1670 = mad((_nearFieldShadowViewProj[2].y), _150, _1669);
          float _1671 = mad((_nearFieldShadowViewProj[2].z), _151, _1670);
          float _1672 = _1671 + (_nearFieldShadowViewProj[2].w);
          _1674 = _1664;
          _1675 = _1668;
          _1676 = _1672;
        }
        bool _1677 = (_1674 > 1.0f);
        bool _1678 = (_1675 > 1.0f);
        bool _1679 = (_1676 > 1.0f);
        bool _1680 = (_1674 < -1.0f);
        bool _1681 = (_1675 < -1.0f);
        bool _1682 = (_1676 < 0.0f);
        bool _1683 = (_1680) || (_1677);
        bool _1684 = (_1681) || (_1678);
        bool _1687 = ((_1683) || (_1684) || (_1682) || (_1679));
        if (!_1687) {
          float _1689 = float((uint)(uint)(_frameNumber.x));
          float _1690 = _1689 * 92.0f;
          float _1691 = _1689 * 71.0f;
          float _1692 = _1690 + _57;
          float _1693 = _1691 + _58;
          float _1694 = _1692 * 0.0078125f;
          float _1695 = _1693 * 0.0078125f;
          float _1696 = frac(_1694);
          float _1697 = frac(_1695);
          float _1698 = _1696 * 128.0f;
          float _1699 = _1697 * 128.0f;
          float _1700 = _1698 + -64.34062194824219f;
          float _1701 = _1699 + -72.46562194824219f;
          float _1702 = _1700 * _1700;
          float _1703 = _1701 * _1701;
          float _1704 = _1701 * _1700;
          float _1705 = dot(float3(_1702, _1703, _1704), float3(20.390625f, 60.703125f, 2.4281208515167236f));
          float _1706 = frac(_1705);
          float _1707 = _1706 * 51540816.0f;
          float _1708 = _1706 * 287478368.0f;
          uint _1709 = uint(_1707);
          uint _1710 = uint(_1708);
          if (_949) {
            int _1715 = ((int)((((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
            int _1716 = (uint)((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) >> 5;
            int _1718 = _1715 ^ (_1716 + -939442524);
            _1721 = ((int)((uint)(_1718) + ((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))))))));
          } else {
            _1721 = ((int)((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))))));
          }
          uint _1722 = _1721 * 48271;
          int _1723 = (int)(_1722) & 16777215;
          float _1724 = float((uint)(uint)(_1723));
          float _1725 = _1724 * 3.814637693722034e-06f;
          uint _1726 = uint(_1725);
          float _1727 = float((uint)_1726);
          float _1728 = _1727 * 0.015625f;
          int _1729 = (int)(_1709) & 65535;
          float _1730 = float((uint)(uint)(_1729));
          float _1731 = _1730 * 1.52587890625e-05f;
          float _1732 = _1728 + _1731;
          float _1733 = frac(_1732);
          int _1734 = reversebits(_1726);
          int _1735 = _1734 ^ (int)(_1710);
          float _1736 = float((uint)(uint)(_1735));
          float _1737 = _1733 * 2.0f;
          float _1738 = _1736 * 4.656612873077393e-10f;
          float _1739 = _1737 + -1.0f;
          float _1740 = _1738 + -1.0f;
          float _1741 = dot(float2(_1739, _1740), float2(_1739, _1740));
          float _1742 = rsqrt(_1741);
          float _1743 = _1742 * _1739;
          float _1744 = _1740 * _1742;
          float _1745 = -0.0f - _1744;
          float _1746 = _1676 + -3.9999998989515007e-05f;
          if (_949) {
            int _1751 = ((int)((((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
            int _1752 = (uint)((uint)(_946) + ((uint)(_930) + ((uint)(_914) + ((uint)(_898) + ((uint)(_882) + ((uint)(_866) + ((uint)(_850) + ((uint)(_834) + (uint)(_frameNumber.x))))))))) >> 5;
            int _1754 = _1751 ^ (_1752 + -939442524);
            _1757 = ((int)((uint)(_1754) + ((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819))))))))));
          } else {
            _1757 = ((int)((uint)(_938) + ((uint)(_922) + ((uint)(_906) + ((uint)(_890) + ((uint)(_874) + ((uint)(_858) + ((uint)(_842) + ((uint)(_826) + _819)))))))));
          }
          uint _1758 = _1757 * 48271;
          int _1759 = (int)(_1758) & 16777215;
          float _1760 = float((uint)(uint)(_1759));
          float _1761 = _1760 * 9.530782563160756e-07f;
          uint _1762 = uint(_1761);
          if (_1614) {
            float _1766 = _nearFieldShadowBoundsMax.w * 0.00048828125f;
            float _1767 = min(0.0003000000142492354f, _1766);
            float _1768 = _1767 / _nearFieldShadowBoundsMax.w;
            float _1769 = max(3.0517578125e-05f, _1768);
            _1771 = _1769;
          } else {
            _1771 = 0.00048828125f;
          }
          _1784 = 0.0f;
          _1785 = 0;
          while(true) {
            int _1788 = ((int)(((uint)(_1785) << 2) + _1762)) & 15;
            uint _1789 = _1788 * 2;
            float _1792 = _global_0[((int)(0u + _1789))];
            uint _1793 = _1788 * 2;
            float _1796 = _global_0[((int)(1u + _1793))];
            float _1797 = _1792 * _1771;
            float _1798 = _1796 * _1771;
            float _1799 = _1797 * _1743;
            float _1800 = mad(_1744, _1798, _1799);
            float _1801 = _1797 * _1745;
            float _1802 = mad(_1743, _1798, _1801);
            float _1803 = _1674 * 0.5f;
            float _1804 = _1675 * 0.5f;
            float _1805 = _1803 + 0.5f;
            float _1806 = 0.5f - _1804;
            float _1807 = _1805 + _1800;
            float _1808 = _1806 + _1802;
            float _1811 = __3__36__0__0__g_nearFieldShadowDepth.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float2(_1807, _1808), _1746);
            float _1813 = 1.0f - _1811.x;
            float _1814 = _1813 + _1784;
            bool _1816 = ((_1785 + 1) == 4);
            float _1773 = _1814 * 0.25f;
            bool __defer_1783_1875 = false;
            if (!_1816) {
              _1784 = _1814;
              _1785 = (_1785 + 1);
              continue;
            }
            if (__defer_1783_1875) {
              _1880 = 0.0f;
              _1881 = 0;
              while(true) {
                int _1884 = ((int)(((uint)(_1881) << 2) + _1762)) & 15;
                uint _1885 = _1884 * 2;
                float _1888 = _global_0[((int)(0u + _1885))];
                uint _1889 = _1884 * 2;
                float _1892 = _global_0[((int)(1u + _1889))];
                float _1893 = _1888 * _1771;
                float _1894 = _1892 * _1771;
                float _1895 = _1893 * _1743;
                float _1896 = mad(_1744, _1894, _1895);
                float _1897 = _1893 * _1745;
                float _1898 = mad(_1743, _1894, _1897);
                float _1899 = _1876 * 0.5f;
                float _1900 = _1877 * 0.5f;
                float _1901 = _1899 + 0.5f;
                float _1902 = 0.5f - _1900;
                float _1903 = _1901 + _1896;
                float _1904 = _1902 + _1898;
                float _1907 = __3__36__0__0__g_nearFieldShadowDepth.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1903, _1904), 0.0f);
                float _1909 = _1878 - _1907.x;
                float _1910 = max(0.0f, _1909);
                float _1911 = _1910 + _1880;
                bool _1913 = ((_1881 + 1) == 4);
                if (!_1913) {
                  _1880 = _1911;
                  _1881 = (_1881 + 1);
                  continue;
                }
                float _1915 = _1911 * 25.0f;
                float _1916 = max(0.0020000000949949026f, _1915);
                float _1917 = min(_1600, _1773);
                float _1918 = _1606 + -0.9800000190734863f;
                float _1919 = max(_1918, _1916);
                _1921 = _1917;
                _1922 = _1919;
                break;
                break;
              }
            }
            float _1774 = _100 * 0.012000000104308128f;
            float _1775 = _101 * 0.012000000104308128f;
            float _1776 = _102 * 0.012000000104308128f;
            float _1777 = _149 - _1774;
            float _1778 = _150 - _1775;
            float _1779 = _151 - _1776;
            bool _1782 = (_shadowAOParams.w > 0.0f);
            if (_1782) {
              float _1834 = (_nearFieldShadowViewProjCompacted[0].x) * _1777;
              float _1835 = mad((_nearFieldShadowViewProjCompacted[0].y), _1778, _1834);
              float _1836 = mad((_nearFieldShadowViewProjCompacted[0].z), _1779, _1835);
              float _1837 = _1836 + (_nearFieldShadowViewProjCompacted[0].w);
              float _1838 = (_nearFieldShadowViewProjCompacted[1].x) * _1777;
              float _1839 = mad((_nearFieldShadowViewProjCompacted[1].y), _1778, _1838);
              float _1840 = mad((_nearFieldShadowViewProjCompacted[1].z), _1779, _1839);
              float _1841 = _1840 + (_nearFieldShadowViewProjCompacted[1].w);
              float _1842 = (_nearFieldShadowViewProjCompacted[2].x) * _1777;
              float _1843 = mad((_nearFieldShadowViewProjCompacted[2].y), _1778, _1842);
              float _1844 = mad((_nearFieldShadowViewProjCompacted[2].z), _1779, _1843);
              float _1845 = _1844 + (_nearFieldShadowViewProjCompacted[2].w);
              _1876 = _1837;
              _1877 = _1841;
              _1878 = _1845;
            } else {
              float _1863 = (_nearFieldShadowViewProj[0].x) * _1777;
              float _1864 = mad((_nearFieldShadowViewProj[0].y), _1778, _1863);
              float _1865 = mad((_nearFieldShadowViewProj[0].z), _1779, _1864);
              float _1866 = _1865 + (_nearFieldShadowViewProj[0].w);
              float _1867 = (_nearFieldShadowViewProj[1].x) * _1777;
              float _1868 = mad((_nearFieldShadowViewProj[1].y), _1778, _1867);
              float _1869 = mad((_nearFieldShadowViewProj[1].z), _1779, _1868);
              float _1870 = _1869 + (_nearFieldShadowViewProj[1].w);
              float _1871 = (_nearFieldShadowViewProj[2].x) * _1777;
              float _1872 = mad((_nearFieldShadowViewProj[2].y), _1778, _1871);
              float _1873 = mad((_nearFieldShadowViewProj[2].z), _1779, _1872);
              float _1874 = _1873 + (_nearFieldShadowViewProj[2].w);
              _1876 = _1866;
              _1877 = _1870;
              _1878 = _1874;
            }
            _1880 = 0.0f;
            _1881 = 0;
            while(true) {
              int _1884 = ((int)(((uint)(_1881) << 2) + _1762)) & 15;
              uint _1885 = _1884 * 2;
              float _1888 = _global_0[((int)(0u + _1885))];
              uint _1889 = _1884 * 2;
              float _1892 = _global_0[((int)(1u + _1889))];
              float _1893 = _1888 * _1771;
              float _1894 = _1892 * _1771;
              float _1895 = _1893 * _1743;
              float _1896 = mad(_1744, _1894, _1895);
              float _1897 = _1893 * _1745;
              float _1898 = mad(_1743, _1894, _1897);
              float _1899 = _1876 * 0.5f;
              float _1900 = _1877 * 0.5f;
              float _1901 = _1899 + 0.5f;
              float _1902 = 0.5f - _1900;
              float _1903 = _1901 + _1896;
              float _1904 = _1902 + _1898;
              float _1907 = __3__36__0__0__g_nearFieldShadowDepth.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_1903, _1904), 0.0f);
              float _1909 = _1878 - _1907.x;
              float _1910 = max(0.0f, _1909);
              float _1911 = _1910 + _1880;
              bool _1913 = ((_1881 + 1) == 4);
              if (!_1913) {
                _1880 = _1911;
                _1881 = (_1881 + 1);
                continue;
              }
              float _1915 = _1911 * 25.0f;
              float _1916 = max(0.0020000000949949026f, _1915);
              float _1917 = min(_1600, _1773);
              float _1918 = _1606 + -0.9800000190734863f;
              float _1919 = max(_1918, _1916);
              _1921 = _1917;
              _1922 = _1919;
              break;
            }
            break;
          }
        } else {
          _1921 = _1600;
          _1922 = _1605;
        }
      } else {
        _1921 = _1600;
        _1922 = _1605;
      }
    } else {
      _1921 = _1600;
      _1922 = _1604;
    }
    float _1923 = saturate(_1922);
    float _1924 = log2(_1923);
    float _1925 = _1924 * 0.45454543828964233f;
    float _1926 = exp2(_1925);
    float _1927 = _1926 * _553;
    float _1928 = 1.0f - _553;
    float _1929 = _1928 + _1927;
    float _1930 = saturate(_1929);
    float _1933 = _shadowAOParams.x * _1921;
    float _1934 = _1921 - _1933;
    float _1935 = _1934 + _shadowAOParams.x;
    float _1936 = _149 * _153;
    float _1937 = -0.0f - _1936;
    float _1938 = _150 * _153;
    float _1939 = -0.0f - _1938;
    float _1940 = _151 * _153;
    float _1941 = -0.0f - _1940;
    float _1942 = dot(float3(_100, _101, _102), float3(_1937, _1939, _1941));
    bool _1943 = (_1935 > 0.0f);
    [branch]
    if (_1943) {
      int _1945 = _73 & 126;
      bool _1946 = (_1945 == 64);
      bool _1947 = (_77 == 66);
      bool _1948 = (_1946) || (_1947);
      float _1949 = select(_1948, 2.0f, 4.0f);
      float _1950 = select(_1948, 12.0f, 2.0f);
      bool _1953 = (_sunDirection.y > 0.0f);
      if ((_1953) || ((!(_1953)) && ((_sunDirection.y > _moonDirection.y)))) {
        _1965 = _sunDirection.x;
        _1966 = _sunDirection.y;
        _1967 = _sunDirection.z;
      } else {
        _1965 = _moonDirection.x;
        _1966 = _moonDirection.y;
        _1967 = _moonDirection.z;
      }
      int _1968 = ((int)(((uint)((_46 | _48) << 3)) + SV_GroupThreadID.x)) & 3;
      int _1971 = ((_1968 << 1) | _1968) & 5;
      int _1972 = ((int)(((uint)(((_44 << 2) | _51) << 3)) + SV_GroupThreadID.y)) & 3;
      int _1976 = (((_1972 << 1) | _1972) << 1) & 10;
      int _1980 = ((int)((_165 + ((uint)(_1976 | _1971))) << 2)) & -858993460;
      int _1981 = (uint)(_165 + ((uint)(_1976 | _1971))) >> 2;
      int _1982 = _1981 & 858993459;
      int _1985 = ((int)(((uint)(_1980 | _1982)) << 1)) & 10;
      int _1986 = (uint)((uint)(_1980 | _1982)) >> 1;
      int _1987 = _1986 & 21;
      float _1991 = float((uint)(uint)(_frameNumber.x));
      float _1992 = _1991 * 92.0f;
      float _1993 = _1991 * 71.0f;
      float _1994 = _1992 + _57;
      float _1995 = _1993 + _58;
      float _1996 = _1994 * 0.0078125f;
      float _1997 = _1995 * 0.0078125f;
      float _1998 = frac(_1996);
      float _1999 = frac(_1997);
      float _2000 = _1998 * 128.0f;
      float _2001 = _1999 * 128.0f;
      float _2002 = _2000 + -64.34062194824219f;
      float _2003 = _2001 + -72.46562194824219f;
      float _2004 = _2002 * _2002;
      float _2005 = _2003 * _2003;
      float _2006 = _2003 * _2002;
      float _2007 = dot(float3(_2004, _2005, _2006), float3(20.390625f, 60.703125f, 2.4281208515167236f));
      float _2008 = frac(_2007);
      float _2009 = _2008 * 51540816.0f;
      float _2010 = _2008 * 287478368.0f;
      uint _2011 = uint(_2009);
      uint _2012 = uint(_2010);
      float _2013 = float((uint)((uint)(_1985 | _1987)));
      float _2014 = _2013 * 0.03125f;
      int _2015 = (int)(_2011) & 65535;
      float _2016 = float((uint)(uint)(_2015));
      float _2017 = _2016 * 1.52587890625e-05f;
      float _2018 = _2017 + _2014;
      float _2019 = frac(_2018);
      int _2020 = reversebits((float)(_1985 | _1987));
      int _2021 = _2020 ^ (int)(_2012);
      float _2022 = float((uint)(uint)(_2021));
      float _2024 = _2019 * 6.2831854820251465f;
      float _2025 = 1.0f - _shadowAOParams.z;
      float _2026 = _2025 * 2.3283064365386963e-10f;
      float _2027 = _2026 * _2022;
      float _2028 = _2027 + _shadowAOParams.z;
      float _2029 = _2028 * _2028;
      float _2030 = 1.0f - _2029;
      float _2031 = sqrt(_2030);
      float _2032 = sin(_2024);
      float _2033 = cos(_2024);
      float _2034 = _2033 * _2031;
      float _2035 = _2032 * _2031;
      bool _2036 = (_1967 >= 0.0f);
      float _2037 = select(_2036, 1.0f, -1.0f);
      float _2038 = _2037 + _1967;
      float _2039 = 1.0f / _2038;
      float _2040 = -0.0f - _2039;
      float _2041 = _1966 * _2040;
      float _2042 = _2041 * _1965;
      float _2043 = _2037 * _1965;
      float _2044 = _2043 * _1965;
      float _2045 = _2044 * _2040;
      float _2046 = _2045 + 1.0f;
      float _2047 = _2041 * _1966;
      float _2048 = _2037 + _2047;
      float _2049 = -0.0f - _1966;
      float _2050 = _2046 * _2034;
      float _2051 = mad(_2035, _2042, _2050);
      float _2052 = mad(_2028, _1965, _2051);
      float _2053 = _2034 * _2037;
      float _2054 = _2053 * _2042;
      float _2055 = mad(_2035, _2048, _2054);
      float _2056 = mad(_2028, _1966, _2055);
      float _2057 = _2043 * _2034;
      float _2058 = -0.0f - _2057;
      float _2059 = mad(_2035, _2049, _2058);
      float _2060 = mad(_2028, _1967, _2059);
      // ── Contact shadow direction stabilization ─────────────────────────
      // RenoDX: use stable light direction to eliminate tile seam artifacts
      if (CONTACT_SHADOW_QUALITY == 1.f) {
        _2052 = _1965;
        _2056 = _1966;
        _2060 = _1967;
      }
      // ──────────────────────────────────────────────────────────────────
      float _2061 = _112 * 0.0024999999441206455f;
      float _2062 = _2061 + 0.25f;
      float _2063 = min(0.5f, _2062);
      float _2064 = abs(_1966);
      float _2065 = _1950 - _1949;
      float _2066 = _2064 * _2065;
      float _2067 = _2066 + _1949;
      // RenoDX: foliage ray distance scale 0.01 → 0.05 (vanilla foliage reach was ~2cm, now ~10cm)
      float _2068 = select(_169, (CONTACT_SHADOW_QUALITY == 1.f ? 0.05000000074505806f : 0.009999999776482582f), 0.10000000149011612f);
      float _2069 = _2067 * _2068;
      if (!_169) {
        bool _2072 = ((uint)(_77 + -11) < (uint)9);
        float _2073 = select(_2072, 0.00800000037997961f, 0.029999999329447746f);
        float _2074 = _112 * _2073;
        float _2075 = max(_2074, _2069);
        _2077 = _2075;
      } else {
        _2077 = _2069;
      }
      float _2078 = _112 * 0.009999999776482582f;
      float _2079 = saturate(_1942);
      float _2080 = 1.0f - _2079;
      float _2081 = _2078 * _2080;
      float _2082 = _2081 + 0.009999999776482582f;
      float _2083 = saturate(_2082);
      bool _2087 = ((_77 != 15) && ((uint)(_77 + -12) < (uint)7));
      bool _2090 = (_terrainNormalParams.z > 0.0f);
      if (_2090) {
        uint _2092 = _frameNumber.x * 73;
        int _2093 = (int)(_2092) & 255;
        float _2094 = float((uint)(uint)(_2093));
        float _2095 = _2094 * 32.665000915527344f;
        float _2096 = _2094 * 11.8149995803833f;
        float _2097 = _2095 + _57;
        float _2098 = _2096 + _58;
        float _2099 = dot(float2(_2097, _2098), float2(0.0671105608344078f, 0.005837149918079376f));
        float _2100 = frac(_2099);
        float _2101 = _2100 * 52.98291778564453f;
        float _2102 = frac(_2101);
        _2255 = _2102;
      } else {
        float _2106 = _bufferSizeAndInvSize.x * _58;
        float _2107 = _2106 + _57;
        uint _2108 = uint(_2107);
        int _2112 = ((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)));
        int _2113 = (uint)((uint)(_frameNumber.x)) >> 5;
        int _2115 = _2112 ^ (_2113 + -939442524);
        int _2120 = ((int)(((_2108 + (uint)(_2115)) << 4) + (uint)(-1383041155))) ^ ((int)((_2108 + (uint)(_2115)) + (uint)(-1640531527)));
        int _2121 = (uint)(_2108 + (uint)(_2115)) >> 5;
        int _2123 = _2120 ^ ((int)((uint)(_2121) + 2123724318u));
        int _2128 = ((int)((((uint)(_2123) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_2123) + (uint)(_frameNumber.x)) + 1013904242u));
        int _2129 = (uint)((uint)(_2123) + (uint)(_frameNumber.x)) >> 5;
        int _2131 = _2128 ^ (_2129 + -939442524);
        int _2136 = ((int)((((uint)(_2131) + (_2108 + (uint)(_2115))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_2131) + (_2108 + (uint)(_2115))) + 1013904242u));
        int _2137 = (uint)((uint)(_2131) + (_2108 + (uint)(_2115))) >> 5;
        int _2139 = _2136 ^ ((int)((uint)(_2137) + 2123724318u));
        int _2144 = ((int)((((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
        int _2145 = (uint)((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))) >> 5;
        int _2147 = _2144 ^ (_2145 + -939442524);
        int _2152 = ((int)((((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))) + (uint)(-626627285)));
        int _2153 = (uint)((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))) >> 5;
        int _2155 = _2152 ^ ((int)((uint)(_2153) + 2123724318u));
        int _2160 = ((int)((((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))) + 2027808484u));
        int _2161 = (uint)((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))) >> 5;
        int _2163 = _2160 ^ (_2161 + -939442524);
        int _2168 = ((int)((((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))) + 2027808484u));
        int _2169 = (uint)((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))) >> 5;
        int _2171 = _2168 ^ ((int)((uint)(_2169) + 2123724318u));
        int _2176 = ((int)((((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))) + 387276957u));
        int _2177 = (uint)((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))) >> 5;
        int _2179 = _2176 ^ (_2177 + -939442524);
        int _2184 = ((int)((((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))))) + 387276957u));
        int _2185 = (uint)((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))))) >> 5;
        int _2187 = _2184 ^ ((int)((uint)(_2185) + 2123724318u));
        int _2192 = ((int)((((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
        int _2193 = (uint)((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))))) >> 5;
        int _2195 = _2192 ^ (_2193 + -939442524);
        int _2200 = ((int)((((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))))) + (uint)(-1253254570)));
        int _2201 = (uint)((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))))) >> 5;
        int _2203 = _2200 ^ ((int)((uint)(_2201) + 2123724318u));
        int _2208 = ((int)((((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))))) + 1401181199u));
        int _2209 = (uint)((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))))) >> 5;
        int _2211 = _2208 ^ (_2209 + -939442524);
        int _2216 = ((int)((((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))))))) + 1401181199u));
        int _2217 = (uint)((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))))))) >> 5;
        int _2219 = _2216 ^ ((int)((uint)(_2217) + 2123724318u));
        int _2224 = ((int)((((uint)(_2219) + ((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_2219) + ((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
        int _2225 = (uint)((uint)(_2219) + ((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x)))))))) >> 5;
        int _2227 = _2224 ^ (_2225 + -939442524);
        int _2232 = ((int)((((uint)(_2227) + ((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_2227) + ((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))))))) + (uint)(-239350328)));
        int _2233 = (uint)((uint)(_2227) + ((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))))))) >> 5;
        int _2235 = _2232 ^ ((int)((uint)(_2233) + 2123724318u));
        int _2237 = ((int)((uint)(_2227) + ((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))))))))) & 16777215;
        bool _2238 = (_2237 == 0);
        if (_2238) {
          int _2243 = ((int)((((uint)(_2235) + ((uint)(_2219) + ((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_2235) + ((uint)(_2219) + ((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
          int _2244 = (uint)((uint)(_2235) + ((uint)(_2219) + ((uint)(_2203) + ((uint)(_2187) + ((uint)(_2171) + ((uint)(_2155) + ((uint)(_2139) + ((uint)(_2123) + (uint)(_frameNumber.x))))))))) >> 5;
          int _2246 = _2243 ^ (_2244 + -939442524);
          _2249 = ((int)((uint)(_2246) + ((uint)(_2227) + ((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115)))))))))));
        } else {
          _2249 = ((int)((uint)(_2227) + ((uint)(_2211) + ((uint)(_2195) + ((uint)(_2179) + ((uint)(_2163) + ((uint)(_2147) + ((uint)(_2131) + (_2108 + (uint)(_2115))))))))));
        }
        uint _2250 = _2249 * 48271;
        int _2251 = (int)(_2250) & 16777215;
        float _2252 = float((uint)(uint)(_2251));
        float _2253 = _2252 * 5.960464477539063e-08f;
        _2255 = _2253;
      }
      bool _2256 = (_1947) || (_2087);
      if (_2256) {
        // RenoDX: foliage initial ray offset 10× → 2× (vanilla skipped nearby occluders entirely)
        float _2258 = _2255 * (CONTACT_SHADOW_QUALITY == 1.f ? 2.0f : 10.0f);
        _2268 = _2258;
      } else {
        bool _2260 = (_77 == 15);
        if (_2260) {
          float _2262 = _112 * 0.0010000000474974513f;
          float _2263 = saturate(_2262);
          float _2264 = _2263 * 9.0f;
          float _2265 = 10.0f - _2264;
          float _2266 = _2265 * _2255;
          _2268 = _2266;
        } else {
          _2268 = _2255;
        }
      }
      float _2269 = abs(_2056);
      float _2270 = _2269 * 0.05000000074505806f;
      float _2271 = 0.10000000149011612f - _2270;
      bool _2272 = (_1945 == 12);
      if (_2272) {
        _2281 = _2271;
      } else {
        bool _2274 = ((uint)_77 > (uint)15);
        if (_2274) {
          bool _2278 = (((uint)_77 < (uint)20) || (_77 == 107));
          if (_2278) {
            _2281 = _2271;
          } else {
            _2281 = 0.0f;
          }
        } else {
          _2281 = 0.0f;
        }
      }
      if (!_169) {
        float _2283 = _2281 * _153;
        float _2284 = _2283 * _149;
        float _2285 = _2283 * _150;
        float _2286 = _2283 * _151;
        float _2287 = _149 - _2284;
        float _2288 = _150 - _2285;
        float _2289 = _151 - _2286;
        _2291 = _2287;
        _2292 = _2288;
        _2293 = _2289;
      } else {
        _2291 = _149;
        _2292 = _150;
        _2293 = _151;
      }
      if (!_2090) {
        float _2295 = _112 * 0.0625f;
        float _2296 = saturate(_2295);
        float _2297 = _2296 * 0.05000000074505806f;
        float _2298 = _2297 * _100;
        float _2299 = _2297 * _101;
        float _2300 = _2297 * _102;
        _2302 = _2298;
        _2303 = _2299;
        _2304 = _2300;
      } else {
        _2302 = 0.0f;
        _2303 = 0.0f;
        _2304 = 0.0f;
      }
      float _2305 = _2302 + _2291;
      float _2306 = _2303 + _2292;
      float _2307 = _2304 + _2293;
      bool _2308 = (_112 < 8.0f);
      float _2317 = (_viewRelative[2].x) * _2305;
      float _2318 = mad((_viewRelative[2].y), _2306, _2317);
      float _2319 = mad((_viewRelative[2].z), _2307, _2318);
      float _2320 = _2319 + (_viewRelative[2].w);
      float _2321 = (_viewRelative[2].x) * _2052;
      float _2322 = mad((_viewRelative[2].y), _2056, _2321);
      float _2323 = mad((_viewRelative[2].z), _2060, _2322);
      float _2324 = _2323 * _2077;
      float _2325 = _2324 + _2320;
      bool _2328 = (_2325 < _nearFarProj.x);
      if (_2308) {
        float _2330 = _nearFarProj.x - _2320;
        float _2331 = _2330 / _2323;
        float _2332 = select(_2328, _2331, _2077);
        float _2353 = (_viewProjRelative[0].x) * _2305;
        float _2354 = mad((_viewProjRelative[0].y), _2306, _2353);
        float _2355 = mad((_viewProjRelative[0].z), _2307, _2354);
        float _2356 = _2355 + (_viewProjRelative[0].w);
        float _2357 = (_viewProjRelative[1].x) * _2305;
        float _2358 = mad((_viewProjRelative[1].y), _2306, _2357);
        float _2359 = mad((_viewProjRelative[1].z), _2307, _2358);
        float _2360 = _2359 + (_viewProjRelative[1].w);
        float _2361 = (_viewProjRelative[2].x) * _2305;
        float _2362 = mad((_viewProjRelative[2].y), _2306, _2361);
        float _2363 = mad((_viewProjRelative[2].z), _2307, _2362);
        float _2364 = _2363 + (_viewProjRelative[2].w);
        float _2365 = (_viewProjRelative[3].x) * _2305;
        float _2366 = mad((_viewProjRelative[3].y), _2306, _2365);
        float _2367 = mad((_viewProjRelative[3].z), _2307, _2366);
        float _2368 = _2367 + (_viewProjRelative[3].w);
        float _2369 = _2332 * _2052;
        float _2370 = _2332 * _2056;
        float _2371 = _2332 * _2060;
        float _2372 = _2369 + _2305;
        float _2373 = _2370 + _2306;
        float _2374 = _2371 + _2307;
        float _2375 = (_viewProjRelative[0].x) * _2372;
        float _2376 = mad((_viewProjRelative[0].y), _2373, _2375);
        float _2377 = mad((_viewProjRelative[0].z), _2374, _2376);
        float _2378 = _2377 + (_viewProjRelative[0].w);
        float _2379 = (_viewProjRelative[1].x) * _2372;
        float _2380 = mad((_viewProjRelative[1].y), _2373, _2379);
        float _2381 = mad((_viewProjRelative[1].z), _2374, _2380);
        float _2382 = _2381 + (_viewProjRelative[1].w);
        float _2383 = (_viewProjRelative[2].x) * _2372;
        float _2384 = mad((_viewProjRelative[2].y), _2373, _2383);
        float _2385 = mad((_viewProjRelative[2].z), _2374, _2384);
        float _2386 = _2385 + (_viewProjRelative[2].w);
        float _2387 = (_viewProjRelative[3].x) * _2372;
        float _2388 = mad((_viewProjRelative[3].y), _2373, _2387);
        float _2389 = mad((_viewProjRelative[3].z), _2374, _2388);
        float _2390 = _2389 + (_viewProjRelative[3].w);
        float _2391 = _2356 / _2368;
        float _2392 = _2360 / _2368;
        float _2393 = _2364 / _2368;
        float _2394 = _2378 / _2390;
        float _2395 = _2382 / _2390;
        float _2396 = _2386 / _2390;
        float _2397 = _2394 - _2391;
        float _2398 = _2395 - _2392;
        float _2399 = _2396 - _2393;
        float _2400 = abs(_2397);
        float _2401 = abs(_2398);
        float _2402 = _bufferSizeAndInvSize.x * 0.5f;
        float _2403 = _2402 * _2400;
        float _2404 = _bufferSizeAndInvSize.y * 0.5f;
        float _2405 = _2404 * _2401;
        float _2406 = max(_2403, _2405);
        // RenoDX: near-branch step subdivision halved for 16-step ray march (vanilla: 8 steps at 1/8 span)
        float _2407 = _2406 * (CONTACT_SHADOW_QUALITY == 1.f ? 0.0625f : 0.125f);
        float _2408 = min(1.0f, _2407);
        float _2409 = 1.0f / _2408;
        float _2410 = max((CONTACT_SHADOW_QUALITY == 1.f ? 0.0625f : 0.125f), _2409);
        float _2411 = _2410 * _2399;
        float _2412 = _2391 * 0.5f;
        float _2413 = _2392 * 0.5f;
        float _2414 = _2412 + 0.5f;
        float _2415 = 0.5f - _2413;
        float _2419 = mad((_proj[2].z), _112, 0.0f);
        float _2420 = mad((_proj[3].z), _112, 0.0f);
        float _2421 = _2419 + _2364;
        float _2422 = _2420 + _2368;
        float _2423 = _2421 / _2422;
        float _2424 = _2393 - _2423;
        float _2425 = abs(_2411);
        float _2426 = max(_2425, _2424);
        float _2427 = _2063 * (CONTACT_SHADOW_QUALITY == 1.f ? 0.0625f : 0.125f);
        float _2428 = _2427 * _2426;
        float _2429 = _2397 * (CONTACT_SHADOW_QUALITY == 1.f ? 0.03125f : 0.0625f);
        float _2430 = _2429 * _2410;
        float _2431 = _2398 * (CONTACT_SHADOW_QUALITY == 1.f ? -0.03125f : -0.0625f);
        float _2432 = _2431 * _2410;
        float _2433 = _2411 * (CONTACT_SHADOW_QUALITY == 1.f ? 0.0625f : 0.125f);
        float _2434 = abs(_2430);
        float _2435 = abs(_2432);
        float _2436 = _2434 * _bufferSizeAndInvSize.x;
        float _2437 = _2435 * _bufferSizeAndInvSize.y;
        float _2438 = max(_2436, _2437);
        float _2439 = 1.0f / _2438;
        float _2440 = max(_2268, _2439);
        float _2441 = _2440 * _2430;
        float _2442 = _2440 * _2432;
        float _2443 = _2440 * _2433;
        float _2444 = _2414 + _2441;
        float _2445 = _2415 + _2442;
        float _2446 = _2443 + _2393;
        float _2447 = 0.5f / _bufferSizeAndInvSize.x;
        _2449 = 0;
        _2450 = _2444;
        _2451 = _2445;
        _2452 = _2446;
        _2453 = _2268;
        _2454 = _2083;
        _2455 = 0;
        _2456 = 1.0f;
        _2457 = 0.0f;
        while(true) {
          float _2458 = 1.0f - _2447;
          float _2459 = max(_2450, _2447);
          float _2460 = min(_2459, _2458);
          float _2461 = _2460 * _bufferSizeAndInvSize.x;
          float _2462 = _2451 * _bufferSizeAndInvSize.y;
          int _2463 = int(_2461);
          int _2464 = int(_2462);
          uint _2466 = __3__36__0__0__g_depthStencil.Load(int3(_2463, _2464, 0));
          int _2468 = (uint)((uint)(_2466.x)) >> 24;
          int _2469 = _2466.x & 16777215;
          float _2470 = float((uint)(uint)(_2469));
          float _2471 = _2470 * 5.960465188081798e-08f;
          int _2472 = _2468 & 127;
          bool _2473 = (_2455 == 0);
          float _2474 = select(_2473, 1.0f, _2454);
          float _2477 = max(1.0000000116860974e-07f, _2471);
          float _2478 = _nearFarProj.x / _2477;
          float _2479 = _2452 - _2471;
          float _2480 = max(1.0000000116860974e-07f, _2452);
          float _2481 = _nearFarProj.x / _2480;
          float _2482 = _2478 - _2481;
          float _2483 = _2479 + _2428;
          float _2484 = abs(_2483);
          bool _2485 = (_2484 < _2428);
          int _2486 = (int)(uint)((int)(_2485));
          if (_2485) {
            int _2488 = _2468 & 126;
            bool _2489 = (_2488 == 66);
            bool _2491 = ((uint)(_2472 + -5) < (uint)2);
            bool _2493 = ((uint)(_2472 + -27) < (uint)2);
            int _2494 = _2468 & 125;
            bool _2495 = (_2494 == 105);
            bool _2499 = ((_2472 == 18) || ((uint)(_2472 + -19) < (uint)2));
            bool _2502 = ((_2472 == 106) || (_2495) || (_2499));
            bool _2507 = ((_2472 == 107) || ((_2472 == 26) || (_2493) || (_2502)));
            bool _2508 = (_2491) || (_2507);
            bool _2513 = ((_2472 == 7) || ((_2472 == 54) || (_2489) || (_2508)));
            if (_2513) {
              _2520 = true;
              float _2521 = select(_2520, -0.07999999821186066f, -1.0f);
              bool _2522 = (_2482 < 0.0f);
              bool _2523 = (_2482 > _2521);
              bool _2524 = (_2522) && (_2523);
              int _2525 = (int)(uint)((int)(_2524));
              _2527 = _2525;
            } else {
              bool _2516 = ((uint)(_2472 + -53) < (uint)14);
              if (_2516) {
                bool _2518 = (_2478 < 32.0f);
                _2520 = _2518;
                float _2521 = select(_2520, -0.07999999821186066f, -1.0f);
                bool _2522 = (_2482 < 0.0f);
                bool _2523 = (_2482 > _2521);
                bool _2524 = (_2522) && (_2523);
                int _2525 = (int)(uint)((int)(_2524));
                _2527 = _2525;
              } else {
                _2527 = _2486;
              }
            }
          } else {
            _2527 = _2486;
          }
          bool _2528 = (_2527 == 0);
          if (!_2528) {
            bool _2530 = ((uint)_2472 > (uint)11);
            if (_2530) {
              bool _2532 = ((uint)_2472 < (uint)18);
              if (!_2532) {
                bool _2541 = ((_2472 == 18) || ((_2472 == 107) || ((uint)(_2472 + -19) < (uint)2)));
                if (!_2541) {
                  bool _2543 = (_2472 == 66);
                  if (!_2543) {
                    _2546 = 0.0f;
                  } else {
                    _2546 = 0.10000000149011612f;
                  }
                } else {
                  _2546 = 0.15000000596046448f;
                }
              } else {
                _2546 = 0.10000000149011612f;
              }
            } else {
              bool _2534 = (_2472 == 11);
              if (!_2534) {
                _2546 = 0.0f;
              } else {
                _2546 = 0.10000000149011612f;
              }
            }
            float _2547 = _2478 * 0.015625f;
            float _2548 = saturate(_2547);
            float _2549 = 1.0f - _2548;
            float _2550 = _2548 * _2546;
            float _2551 = _2549 + _2550;
            float _2552 = _2551 * _2551;
            float _2553 = _2552 * _2546;
            float _2554 = 1.0f - _2553;
            float _2555 = saturate(_2554);
            float _2556 = 1.0f - _2457;
            float _2557 = _2555 * _2556;
            // RenoDX: 30% softer contact shadow accumulation per step
            float _2558 = (CONTACT_SHADOW_QUALITY == 1.f ? _2557 * 0.7f : _2557) + _2457;
            float _2559 = saturate(_2558);
            _2561 = _2472;
            _2562 = _2559;
          } else {
            _2561 = _2449;
            _2562 = _2457;
          }
          bool _2563 = (_2562 > 0.949999988079071f);
          [branch]
          if (_2563) {
            if (!_2473) {
              float _2566 = _2456 - _2479;
              float _2567 = _2456 / _2566;
              float _2568 = saturate(_2567);
              float _2569 = min(_2453, _2474);
              float _2570 = _2568 - _2569;
              _2592 = _2570;
            } else {
              _2592 = 0.0f;
            }
            float _2593 = _2592 * _2430;
            float _2594 = _2592 * _2432;
            float _2595 = _2592 * _2433;
            float _2596 = _2593 + _2450;
            float _2597 = _2594 + _2451;
            float _2598 = _2595 + _2452;
            _2872 = _2472;
            _2873 = _2562;
            _2874 = _2596;
            _2875 = _2597;
            _2876 = _2598;
            _2877 = _2471;
          } else {
            // RenoDX: near-branch loop count 8 → 16 steps
            bool _2572 = ((uint)_2455 < (uint)(CONTACT_SHADOW_QUALITY == 1.f ? 15 : 7));
            if (_2572) {
              float _2574 = abs(_2433);
              float _2575 = min(_2574, _2479);
              float _2576 = _2474 * _2430;
              float _2577 = _2474 * _2432;
              float _2578 = _2474 * _2433;
              float _2579 = _2576 + _2450;
              float _2580 = _2577 + _2451;
              float _2581 = _2578 + _2452;
              float _2582 = _2474 + _2453;
              _2584 = _2579;
              _2585 = _2580;
              _2586 = _2581;
              _2587 = _2582;
              _2588 = _2575;
            } else {
              _2584 = _2450;
              _2585 = _2451;
              _2586 = _2452;
              _2587 = _2453;
              _2588 = _2456;
            }
            bool _2590 = ((uint)(_2455 + 1) < (uint)(CONTACT_SHADOW_QUALITY == 1.f ? 16 : 8));  // RenoDX: near-branch loop termination
            if (_2590) {
              _2449 = _2561;
              _2450 = _2584;
              _2451 = _2585;
              _2452 = _2586;
              _2453 = _2587;
              _2454 = _2474;
              _2455 = (_2455 + 1);
              _2456 = _2588;
              _2457 = _2562;
              continue;
            } else {
              _2872 = _2561;
              _2873 = _2562;
              _2874 = _2450;
              _2875 = _2451;
              _2876 = _2452;
              _2877 = _2471;
            }
          }
          break;
        }
      } else {
        float _2600 = _nearFarProj.x - _2320;
        float _2601 = _2600 / _2323;
        float _2602 = select(_2328, _2601, _2077);
        float _2623 = (_viewProjRelative[0].x) * _2305;
        float _2624 = mad((_viewProjRelative[0].y), _2306, _2623);
        float _2625 = mad((_viewProjRelative[0].z), _2307, _2624);
        float _2626 = _2625 + (_viewProjRelative[0].w);
        float _2627 = (_viewProjRelative[1].x) * _2305;
        float _2628 = mad((_viewProjRelative[1].y), _2306, _2627);
        float _2629 = mad((_viewProjRelative[1].z), _2307, _2628);
        float _2630 = _2629 + (_viewProjRelative[1].w);
        float _2631 = (_viewProjRelative[2].x) * _2305;
        float _2632 = mad((_viewProjRelative[2].y), _2306, _2631);
        float _2633 = mad((_viewProjRelative[2].z), _2307, _2632);
        float _2634 = _2633 + (_viewProjRelative[2].w);
        float _2635 = (_viewProjRelative[3].x) * _2305;
        float _2636 = mad((_viewProjRelative[3].y), _2306, _2635);
        float _2637 = mad((_viewProjRelative[3].z), _2307, _2636);
        float _2638 = _2637 + (_viewProjRelative[3].w);
        float _2639 = _2602 * _2052;
        float _2640 = _2602 * _2056;
        float _2641 = _2602 * _2060;
        float _2642 = _2639 + _2305;
        float _2643 = _2640 + _2306;
        float _2644 = _2641 + _2307;
        float _2645 = (_viewProjRelative[0].x) * _2642;
        float _2646 = mad((_viewProjRelative[0].y), _2643, _2645);
        float _2647 = mad((_viewProjRelative[0].z), _2644, _2646);
        float _2648 = _2647 + (_viewProjRelative[0].w);
        float _2649 = (_viewProjRelative[1].x) * _2642;
        float _2650 = mad((_viewProjRelative[1].y), _2643, _2649);
        float _2651 = mad((_viewProjRelative[1].z), _2644, _2650);
        float _2652 = _2651 + (_viewProjRelative[1].w);
        float _2653 = (_viewProjRelative[2].x) * _2642;
        float _2654 = mad((_viewProjRelative[2].y), _2643, _2653);
        float _2655 = mad((_viewProjRelative[2].z), _2644, _2654);
        float _2656 = _2655 + (_viewProjRelative[2].w);
        float _2657 = (_viewProjRelative[3].x) * _2642;
        float _2658 = mad((_viewProjRelative[3].y), _2643, _2657);
        float _2659 = mad((_viewProjRelative[3].z), _2644, _2658);
        float _2660 = _2659 + (_viewProjRelative[3].w);
        float _2661 = _2626 / _2638;
        float _2662 = _2630 / _2638;
        float _2663 = _2634 / _2638;
        float _2664 = _2648 / _2660;
        float _2665 = _2652 / _2660;
        float _2666 = _2656 / _2660;
        float _2667 = _2664 - _2661;
        float _2668 = _2665 - _2662;
        float _2669 = _2666 - _2663;
        float _2670 = abs(_2667);
        float _2671 = abs(_2668);
        float _2672 = _bufferSizeAndInvSize.x * 0.5f;
        float _2673 = _2672 * _2670;
        float _2674 = _bufferSizeAndInvSize.y * 0.5f;
        float _2675 = _2674 * _2671;
        float _2676 = max(_2673, _2675);
        // RenoDX: far-branch step subdivision halved for 16-step ray march (vanilla: 8 steps at 1/16 span)
        float _2677 = _2676 * (CONTACT_SHADOW_QUALITY == 1.f ? 0.0625f : 0.125f);
        float _2678 = min(1.0f, _2677);
        float _2679 = 1.0f / _2678;
        float _2680 = max((CONTACT_SHADOW_QUALITY == 1.f ? 0.0625f : 0.125f), _2679);
        float _2681 = _2680 * _2669;
        float _2682 = _2661 * 0.5f;
        float _2683 = _2662 * 0.5f;
        float _2684 = _2682 + 0.5f;
        float _2685 = 0.5f - _2683;
        float _2689 = mad((_proj[2].z), _112, 0.0f);
        float _2690 = mad((_proj[3].z), _112, 0.0f);
        float _2691 = _2689 + _2634;
        float _2692 = _2690 + _2638;
        float _2693 = _2691 / _2692;
        float _2694 = _2663 - _2693;
        float _2695 = abs(_2681);
        float _2696 = max(_2695, _2694);
        float _2697 = _2063 * (CONTACT_SHADOW_QUALITY == 1.f ? 0.03125f : 0.0625f);
        float _2698 = _2697 * _2696;
        float _2699 = _2667 * (CONTACT_SHADOW_QUALITY == 1.f ? 0.03125f : 0.0625f);
        float _2700 = _2699 * _2680;
        float _2701 = _2668 * (CONTACT_SHADOW_QUALITY == 1.f ? -0.03125f : -0.0625f);
        float _2702 = _2701 * _2680;
        float _2703 = _2681 * (CONTACT_SHADOW_QUALITY == 1.f ? 0.0625f : 0.125f);
        float _2704 = abs(_2700);
        float _2705 = abs(_2702);
        float _2706 = _2704 * _bufferSizeAndInvSize.x;
        float _2707 = _2705 * _bufferSizeAndInvSize.y;
        float _2708 = max(_2706, _2707);
        float _2709 = 1.0f / _2708;
        float _2710 = max(_2268, _2709);
        float _2711 = _2710 * _2700;
        float _2712 = _2710 * _2702;
        float _2713 = _2710 * _2703;
        float _2714 = _2684 + _2711;
        float _2715 = _2685 + _2712;
        float _2716 = _2713 + _2663;
        float _2717 = 0.5f / _bufferSizeAndInvSize.x;
        _2719 = 0;
        _2720 = _2083;
        _2721 = _2268;
        _2722 = _2714;
        _2723 = _2715;
        _2724 = _2716;
        _2725 = 0;
        _2726 = 1.0f;
        _2727 = 0.0f;
        while(true) {
          float _2728 = 1.0f - _2717;
          float _2729 = max(_2722, _2717);
          float _2730 = min(_2729, _2728);
          float _2731 = _2730 * _bufferSizeAndInvSize.x;
          float _2732 = _2723 * _bufferSizeAndInvSize.y;
          int _2733 = int(_2731);
          int _2734 = int(_2732);
          uint _2736 = __3__36__0__0__g_depthStencil.Load(int3(_2733, _2734, 0));
          int _2738 = (uint)((uint)(_2736.x)) >> 24;
          int _2739 = _2736.x & 16777215;
          float _2740 = float((uint)(uint)(_2739));
          float _2741 = _2740 * 5.960465188081798e-08f;
          int _2742 = _2738 & 127;
          bool _2743 = (_2719 == 0);
          float _2744 = select(_2743, 1.0f, _2720);
          float _2745 = _2724 - _2741;
          float _2748 = max(1.0000000116860974e-07f, _2741);
          float _2749 = _nearFarProj.x / _2748;
          float _2750 = max(1.0000000116860974e-07f, _2724);
          float _2751 = _nearFarProj.x / _2750;
          float _2752 = _2749 - _2751;
          float _2753 = _2745 + _2698;
          float _2754 = abs(_2753);
          bool _2755 = (_2754 < _2698);
          int _2756 = (int)(uint)((int)(_2755));
          if (_2755) {
            int _2758 = _2738 & 126;
            bool _2759 = (_2758 == 66);
            bool _2761 = ((uint)(_2742 + -5) < (uint)2);
            bool _2763 = ((uint)(_2742 + -27) < (uint)2);
            int _2764 = _2738 & 125;
            bool _2765 = (_2764 == 105);
            bool _2769 = ((_2742 == 18) || ((uint)(_2742 + -19) < (uint)2));
            bool _2772 = ((_2742 == 106) || (_2765) || (_2769));
            bool _2777 = ((_2742 == 107) || ((_2742 == 26) || (_2763) || (_2772)));
            bool _2778 = (_2761) || (_2777);
            bool _2783 = ((_2742 == 7) || ((_2742 == 54) || (_2759) || (_2778)));
            if (_2783) {
              _2790 = true;
              float _2791 = select(_2790, -0.07999999821186066f, -1.0f);
              bool _2792 = (_2752 < 0.0f);
              bool _2793 = (_2752 > _2791);
              bool _2794 = (_2792) && (_2793);
              int _2795 = (int)(uint)((int)(_2794));
              _2797 = _2795;
            } else {
              bool _2786 = ((uint)(_2742 + -53) < (uint)14);
              if (_2786) {
                bool _2788 = (_2749 < 32.0f);
                _2790 = _2788;
                float _2791 = select(_2790, -0.07999999821186066f, -1.0f);
                bool _2792 = (_2752 < 0.0f);
                bool _2793 = (_2752 > _2791);
                bool _2794 = (_2792) && (_2793);
                int _2795 = (int)(uint)((int)(_2794));
                _2797 = _2795;
              } else {
                _2797 = _2756;
              }
            }
          } else {
            _2797 = _2756;
          }
          bool _2798 = (_2797 == 0);
          if (!_2798) {
            bool _2800 = ((uint)_2742 > (uint)11);
            if (_2800) {
              bool _2802 = ((uint)_2742 < (uint)18);
              if (!_2802) {
                bool _2811 = ((_2742 == 18) || ((_2742 == 107) || ((uint)(_2742 + -19) < (uint)2)));
                if (!_2811) {
                  bool _2813 = (_2742 == 66);
                  if (!_2813) {
                    _2816 = 0.0f;
                  } else {
                    _2816 = 0.10000000149011612f;
                  }
                } else {
                  _2816 = 0.15000000596046448f;
                }
              } else {
                _2816 = 0.10000000149011612f;
              }
            } else {
              bool _2804 = (_2742 == 11);
              if (!_2804) {
                _2816 = 0.0f;
              } else {
                _2816 = 0.10000000149011612f;
              }
            }
            float _2817 = _2749 * 0.015625f;
            float _2818 = saturate(_2817);
            float _2819 = 1.0f - _2818;
            float _2820 = _2818 * _2816;
            float _2821 = _2819 + _2820;
            float _2822 = _2821 * _2821;
            float _2823 = _2822 * _2816;
            float _2824 = 1.0f - _2823;
            float _2825 = saturate(_2824);
            float _2826 = 1.0f - _2727;
            float _2827 = _2825 * _2826;
            // RenoDX: 30% softer contact shadow accumulation per step
            float _2828 = (CONTACT_SHADOW_QUALITY == 1.f ? _2827 * 0.7f : _2827) + _2727;
            float _2829 = saturate(_2828);
            _2831 = _2742;
            _2832 = _2829;
          } else {
            _2831 = _2725;
            _2832 = _2727;
          }
          bool _2833 = (_2832 > 0.949999988079071f);
          [branch]
          if (_2833) {
            if (!_2743) {
              float _2836 = _2726 - _2745;
              float _2837 = _2726 / _2836;
              float _2838 = saturate(_2837);
              float _2839 = min(_2721, _2744);
              float _2840 = _2838 - _2839;
              _2862 = _2840;
            } else {
              _2862 = 0.0f;
            }
            float _2863 = _2862 * _2700;
            float _2864 = _2862 * _2702;
            float _2865 = _2862 * _2703;
            float _2866 = _2863 + _2722;
            float _2867 = _2864 + _2723;
            float _2868 = _2865 + _2724;
            _2872 = _2742;
            _2873 = _2832;
            _2874 = _2866;
            _2875 = _2867;
            _2876 = _2868;
            _2877 = _2741;
          } else {
            // RenoDX: far-branch loop count 8 → 16 steps
            bool _2842 = ((uint)_2719 < (uint)(CONTACT_SHADOW_QUALITY == 1.f ? 15 : 7));
            if (_2842) {
              float _2844 = abs(_2703);
              float _2845 = min(_2844, _2745);
              float _2846 = _2744 * _2700;
              float _2847 = _2744 * _2702;
              float _2848 = _2744 * _2703;
              float _2849 = _2722 + _2846;
              float _2850 = _2723 + _2847;
              float _2851 = _2724 + _2848;
              float _2852 = _2721 + _2744;
              _2854 = _2852;
              _2855 = _2849;
              _2856 = _2850;
              _2857 = _2851;
              _2858 = _2845;
            } else {
              _2854 = _2721;
              _2855 = _2722;
              _2856 = _2723;
              _2857 = _2724;
              _2858 = _2726;
            }
            bool _2860 = ((uint)(_2719 + 1) < (uint)(CONTACT_SHADOW_QUALITY == 1.f ? 16 : 8));  // RenoDX: far-branch loop termination
            if (_2860) {
              _2719 = (_2719 + 1);
              _2720 = _2744;
              _2721 = _2854;
              _2722 = _2855;
              _2723 = _2856;
              _2724 = _2857;
              _2725 = _2831;
              _2726 = _2858;
              _2727 = _2832;
              continue;
            } else {
              _2872 = _2831;
              _2873 = _2832;
              _2874 = 0.0f;
              _2875 = 0.0f;
              _2876 = -1.0f;
              _2877 = 0.0f;
            }
          }
          break;
        }
      }
      float _2878 = _112 * 0.01899999938905239f;
      float _2879 = _2878 + 0.10000000149011612f;
      bool _2880 = (_2876 > 0.0f);
      bool _2881 = (_2873 > 0.0f);
      if (_2880) {
        bool _2883 = (_2874 <= 1.0f);
        bool _2884 = (_2875 <= 1.0f);
        bool _2885 = (_2874 >= 0.0f);
        bool _2886 = (_2875 >= 0.0f);
        bool _2889 = ((_2885) && (_2883) && (_2886) && (_2884));
        bool _2890 = (_2881) || (_2889);
        if (_2890) {
          float _2893 = _2874 * 2.0f;
          float _2894 = _2875 * 2.0f;
          float _2895 = _2893 + -1.0f;
          float _2896 = 1.0f - _2894;
          float _2917 = (_invViewProjRelative[0].x) * _2895;
          float _2918 = mad((_invViewProjRelative[0].y), _2896, _2917);
          float _2919 = mad((_invViewProjRelative[0].z), _2876, _2918);
          float _2920 = _2919 + (_invViewProjRelative[0].w);
          float _2921 = (_invViewProjRelative[1].x) * _2895;
          float _2922 = mad((_invViewProjRelative[1].y), _2896, _2921);
          float _2923 = mad((_invViewProjRelative[1].z), _2876, _2922);
          float _2924 = _2923 + (_invViewProjRelative[1].w);
          float _2925 = (_invViewProjRelative[2].x) * _2895;
          float _2926 = mad((_invViewProjRelative[2].y), _2896, _2925);
          float _2927 = mad((_invViewProjRelative[2].z), _2876, _2926);
          float _2928 = _2927 + (_invViewProjRelative[2].w);
          float _2929 = (_invViewProjRelative[3].x) * _2895;
          float _2930 = mad((_invViewProjRelative[3].y), _2896, _2929);
          float _2931 = mad((_invViewProjRelative[3].z), _2876, _2930);
          float _2932 = _2931 + (_invViewProjRelative[3].w);
          float _2933 = _2920 / _2932;
          float _2934 = _2924 / _2932;
          float _2935 = _2928 / _2932;
          float _2938 = max(1.0000000116860974e-07f, _2876);
          float _2939 = _nearFarProj.x / _2938;
          float _2940 = max(1.0000000116860974e-07f, _2877);
          float _2941 = _nearFarProj.x / _2940;
          float _2942 = _2941 - _2939;
          bool _2943 = (_2872 == 2);
          if (!_2943) {
            bool _2945 = (_2872 == 3);
            if (_2945) {
              _2958 = 0.0f;
              _2960 = _2958;
            } else {
              bool _2947 = (_2872 == 21);
              if (_2947) {
                bool _2956 = (_77 == 21);
                if (!_2956) {
                  _2958 = 0.0f;
                  _2960 = _2958;
                } else {
                  _2960 = 20.0f;
                }
              } else {
                bool _2951 = (_2872 == 22);
                float _2952 = select(_2951, 0.0f, 1.0f);
                bool _2953 = (_77 == 22);
                bool _2954 = (_2953) && (_2951);
                if (!_2954) {
                  _2958 = _2952;
                  _2960 = _2958;
                } else {
                  _2960 = 20.0f;
                }
              }
            }
          } else {
            bool _2949 = (_77 == 2);
            if (!_2949) {
              _2958 = 0.0f;
              _2960 = _2958;
            } else {
              _2960 = 20.0f;
            }
          }
          float _2961 = _2960 * _2942;
          float _2962 = _2879 + _2961;
          float _2963 = min(0.0f, _2962);
          float _2964 = _2963 * 1.4426950216293335f;
          float _2965 = exp2(_2964);
          float _2966 = saturate(_2965);
          bool _2967 = (_2873 == 1.0f);
          if (_2967) {
            float _2969 = _2933 - _2305;
            float _2970 = _2934 - _2306;
            float _2971 = _2935 - _2307;
            float _2972 = dot(float3(_2052, _2056, _2060), float3(_2969, _2970, _2971));
            float _2973 = max(0.0f, _2972);
            float _2974 = _2077 * 0.9375f;
            float _2975 = _2974 - _2973;
            float _2976 = _112 * 0.015625f;
            float _2977 = _2976 + 1.5f;
            float _2978 = _2975 * _2977;
            float _2979 = _2978 / _2077;
            float _2980 = _2979 * 0.9375f;
            float _2981 = saturate(_2980);
            _2983 = _2981;
          } else {
            _2983 = _2873;
          }
          float _2984 = _2983 * _2966;
          int _2985 = _2872 & -2;
          bool _2986 = (_2985 == 6);
          if (!_2986) {
            bool _2988 = (_77 == 33);
            bool __defer_2987_2997 = false;
            if ((((_2988) && ((_2872 == 33))) || (!(_2988) && ((((_77 == 55))) && (((_2872 == 55))))))) {
              float _2996 = _2984 * 0.009999999776482582f;
              _3062 = _2996;
            } else {
              __defer_2987_2997 = true;
            }
            if (__defer_2987_2997) {
              bool _2998 = (_2985 == 66);
              bool _2999 = (_2872 == 54);
              bool _3000 = (_2999) || (_2998);
              if (!(_3000) || ((_3000) && (!((((_1945 == 66))) || (((_77 == 54))))))) {
                if (!_169) {
                  bool _3054 = ((uint)((int)((uint)(_2872) + (uint)(-53))) < (uint)15);
                  if (_3054) {
                    float _3056 = _112 * 0.03125f;
                    float _3057 = saturate(_3056);
                    _3059 = _3057;
                  } else {
                    _3059 = 1.0f;
                  }
                  float _3060 = _3059 * _2984;
                  _3062 = _3060;
                } else {
                  _3062 = _2984;
                }
              } else {
                float _3009 = _bufferSizeAndInvSize.x * _2874;
                float _3010 = _bufferSizeAndInvSize.y * _2875;
                int _3011 = int(_3009);
                int _3012 = int(_3010);
                uint4 _3014 = __3__36__0__0__g_baseColor.Load(int3(_3011, _3012, 0));
                int _3017 = (uint)((uint)(_3014.x)) >> 8;
                int _3018 = _3017 & 255;
                float _3019 = float((uint)(uint)(_3018));
                float _3020 = _3019 * 0.003921568859368563f;
                int _3021 = _3014.x & 255;
                float _3022 = float((uint)(uint)(_3021));
                float _3023 = _3022 * 0.003921568859368563f;
                int _3024 = (uint)((uint)(_3014.y)) >> 8;
                int _3025 = _3024 & 255;
                float _3026 = float((uint)(uint)(_3025));
                float _3027 = _3026 * 0.003921568859368563f;
                float _3028 = _3020 * _3020;
                float _3029 = _3023 * _3023;
                float _3030 = _3027 * _3027;
                float _3031 = _3028 * 0.6131200194358826f;
                float _3032 = _3028 * 0.07020000368356705f;
                float _3033 = _3028 * 0.02061999961733818f;
                float _3034 = _3029 * 0.3395099937915802f;
                float _3035 = _3029 * 0.9163600206375122f;
                float _3036 = _3029 * 0.10958000272512436f;
                float _3037 = _3031 + _3034;
                float _3038 = _3032 + _3035;
                float _3039 = _3033 + _3036;
                float _3040 = _3030 * 0.047370001673698425f;
                float _3041 = _3030 * 0.013450000435113907f;
                float _3042 = _3030 * 0.8697999715805054f;
                float _3043 = _3037 + _3040;
                float _3044 = _3038 + _3041;
                float _3045 = _3039 + _3042;
                float _3046 = dot(float3(_3043, _3044, _3045), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
                float _3047 = _3046 * 0.875f;
                float _3048 = 1.0f - _3047;
                float _3049 = saturate(_3048);
                float _3050 = _3049 * _2984;
                _3062 = _3050;
              }
            }
          } else {
            float _2996 = _2984 * 0.009999999776482582f;
            _3062 = _2996;
          }
        } else {
          _3062 = 0.0f;
        }
      } else {
        if (_2881) {
          float _2893 = _2874 * 2.0f;
          float _2894 = _2875 * 2.0f;
          float _2895 = _2893 + -1.0f;
          float _2896 = 1.0f - _2894;
          float _2917 = (_invViewProjRelative[0].x) * _2895;
          float _2918 = mad((_invViewProjRelative[0].y), _2896, _2917);
          float _2919 = mad((_invViewProjRelative[0].z), _2876, _2918);
          float _2920 = _2919 + (_invViewProjRelative[0].w);
          float _2921 = (_invViewProjRelative[1].x) * _2895;
          float _2922 = mad((_invViewProjRelative[1].y), _2896, _2921);
          float _2923 = mad((_invViewProjRelative[1].z), _2876, _2922);
          float _2924 = _2923 + (_invViewProjRelative[1].w);
          float _2925 = (_invViewProjRelative[2].x) * _2895;
          float _2926 = mad((_invViewProjRelative[2].y), _2896, _2925);
          float _2927 = mad((_invViewProjRelative[2].z), _2876, _2926);
          float _2928 = _2927 + (_invViewProjRelative[2].w);
          float _2929 = (_invViewProjRelative[3].x) * _2895;
          float _2930 = mad((_invViewProjRelative[3].y), _2896, _2929);
          float _2931 = mad((_invViewProjRelative[3].z), _2876, _2930);
          float _2932 = _2931 + (_invViewProjRelative[3].w);
          float _2933 = _2920 / _2932;
          float _2934 = _2924 / _2932;
          float _2935 = _2928 / _2932;
          float _2938 = max(1.0000000116860974e-07f, _2876);
          float _2939 = _nearFarProj.x / _2938;
          float _2940 = max(1.0000000116860974e-07f, _2877);
          float _2941 = _nearFarProj.x / _2940;
          float _2942 = _2941 - _2939;
          bool _2943 = (_2872 == 2);
          if (!_2943) {
            bool _2945 = (_2872 == 3);
            if (_2945) {
              _2958 = 0.0f;
              _2960 = _2958;
            } else {
              bool _2947 = (_2872 == 21);
              if (_2947) {
                bool _2956 = (_77 == 21);
                if (!_2956) {
                  _2958 = 0.0f;
                  _2960 = _2958;
                } else {
                  _2960 = 20.0f;
                }
              } else {
                bool _2951 = (_2872 == 22);
                float _2952 = select(_2951, 0.0f, 1.0f);
                bool _2953 = (_77 == 22);
                bool _2954 = (_2953) && (_2951);
                if (!_2954) {
                  _2958 = _2952;
                  _2960 = _2958;
                } else {
                  _2960 = 20.0f;
                }
              }
            }
          } else {
            bool _2949 = (_77 == 2);
            if (!_2949) {
              _2958 = 0.0f;
              _2960 = _2958;
            } else {
              _2960 = 20.0f;
            }
          }
          float _2961 = _2960 * _2942;
          float _2962 = _2879 + _2961;
          float _2963 = min(0.0f, _2962);
          float _2964 = _2963 * 1.4426950216293335f;
          float _2965 = exp2(_2964);
          float _2966 = saturate(_2965);
          bool _2967 = (_2873 == 1.0f);
          if (_2967) {
            float _2969 = _2933 - _2305;
            float _2970 = _2934 - _2306;
            float _2971 = _2935 - _2307;
            float _2972 = dot(float3(_2052, _2056, _2060), float3(_2969, _2970, _2971));
            float _2973 = max(0.0f, _2972);
            float _2974 = _2077 * 0.9375f;
            float _2975 = _2974 - _2973;
            float _2976 = _112 * 0.015625f;
            float _2977 = _2976 + 1.5f;
            float _2978 = _2975 * _2977;
            float _2979 = _2978 / _2077;
            float _2980 = _2979 * 0.9375f;
            float _2981 = saturate(_2980);
            _2983 = _2981;
          } else {
            _2983 = _2873;
          }
          float _2984 = _2983 * _2966;
          int _2985 = _2872 & -2;
          bool _2986 = (_2985 == 6);
          if (!_2986) {
            bool _2988 = (_77 == 33);
            bool __defer_2987_2997 = false;
            if ((((_2988) && ((_2872 == 33))) || (!(_2988) && ((((_77 == 55))) && (((_2872 == 55))))))) {
              float _2996 = _2984 * 0.009999999776482582f;
              _3062 = _2996;
            } else {
              __defer_2987_2997 = true;
            }
            if (__defer_2987_2997) {
              bool _2998 = (_2985 == 66);
              bool _2999 = (_2872 == 54);
              bool _3000 = (_2999) || (_2998);
              if (!(_3000) || ((_3000) && (!((((_1945 == 66))) || (((_77 == 54))))))) {
                if (!_169) {
                  bool _3054 = ((uint)((int)((uint)(_2872) + (uint)(-53))) < (uint)15);
                  if (_3054) {
                    float _3056 = _112 * 0.03125f;
                    float _3057 = saturate(_3056);
                    _3059 = _3057;
                  } else {
                    _3059 = 1.0f;
                  }
                  float _3060 = _3059 * _2984;
                  _3062 = _3060;
                } else {
                  _3062 = _2984;
                }
              } else {
                float _3009 = _bufferSizeAndInvSize.x * _2874;
                float _3010 = _bufferSizeAndInvSize.y * _2875;
                int _3011 = int(_3009);
                int _3012 = int(_3010);
                uint4 _3014 = __3__36__0__0__g_baseColor.Load(int3(_3011, _3012, 0));
                int _3017 = (uint)((uint)(_3014.x)) >> 8;
                int _3018 = _3017 & 255;
                float _3019 = float((uint)(uint)(_3018));
                float _3020 = _3019 * 0.003921568859368563f;
                int _3021 = _3014.x & 255;
                float _3022 = float((uint)(uint)(_3021));
                float _3023 = _3022 * 0.003921568859368563f;
                int _3024 = (uint)((uint)(_3014.y)) >> 8;
                int _3025 = _3024 & 255;
                float _3026 = float((uint)(uint)(_3025));
                float _3027 = _3026 * 0.003921568859368563f;
                float _3028 = _3020 * _3020;
                float _3029 = _3023 * _3023;
                float _3030 = _3027 * _3027;
                float _3031 = _3028 * 0.6131200194358826f;
                float _3032 = _3028 * 0.07020000368356705f;
                float _3033 = _3028 * 0.02061999961733818f;
                float _3034 = _3029 * 0.3395099937915802f;
                float _3035 = _3029 * 0.9163600206375122f;
                float _3036 = _3029 * 0.10958000272512436f;
                float _3037 = _3031 + _3034;
                float _3038 = _3032 + _3035;
                float _3039 = _3033 + _3036;
                float _3040 = _3030 * 0.047370001673698425f;
                float _3041 = _3030 * 0.013450000435113907f;
                float _3042 = _3030 * 0.8697999715805054f;
                float _3043 = _3037 + _3040;
                float _3044 = _3038 + _3041;
                float _3045 = _3039 + _3042;
                float _3046 = dot(float3(_3043, _3044, _3045), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
                float _3047 = _3046 * 0.875f;
                float _3048 = 1.0f - _3047;
                float _3049 = saturate(_3048);
                float _3050 = _3049 * _2984;
                _3062 = _3050;
              }
            }
          } else {
            float _2996 = _2984 * 0.009999999776482582f;
            _3062 = _2996;
          }
        } else {
          _3062 = 0.0f;
        }
      }
      float _3063 = 1.0f - _3062;
      float _3064 = saturate(_3063);
      _3066 = _3064;
    } else {
      _3066 = 1.0f;
    }
    float _3067 = min(_1935, _3066);

    // ── Micro Detail Depth-Bias Shadows ───────────────────────────────
    // Use raw (un-jittered) light direction to avoid tile mismatch:
    // _2052/_2056/_2060 include a per-dispatch cone jitter derived from
    // _shadowAOParams.z (push constant), which can differ between the
    // two SceneShadowTiled variants. _1965/_1966/_1967 come straight
    // from _sunDirection/_moonDirection (scene cbuffer) and are stable.
    #define MICRO_PIXEL_X_FLOAT   _57
    #define MICRO_PIXEL_Y_FLOAT   _58
    #define MICRO_LINEAR_DEPTH    _112
    #define MICRO_CONTACT_SHADOW  _3066
    #define MICRO_STENCIL         _77
    #define MICRO_LIGHT_DIR_X     _1965
    #define MICRO_LIGHT_DIR_Y     _1966
    #define MICRO_LIGHT_DIR_Z     _1967
    #define MICRO_WORLD_POS_X     _2291
    #define MICRO_WORLD_POS_Y     _2292
    #define MICRO_WORLD_POS_Z     _2293
    #include "../shadows/micro_detail_shadows.hlsli"
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
    // ──────────────────────────────────────────────────────────────────

    // ────────────────── Screen edge contact shadow fade ───────────────
    if (CONTACT_SHADOW_QUALITY == 1.f && _3066 < 1.0f) {
      float2 _screenUV = float2((_57 + 0.5f) * _bufferSizeAndInvSize.z,
                                 (_58 + 0.5f) * _bufferSizeAndInvSize.w);
      float2 _edgeDist = min(_screenUV, 1.0f - _screenUV);
      float _edgeFade = saturate(min(_edgeDist.x, _edgeDist.y) * 10.0f);
      _3066 = lerp(lerp(1.0f, _3066, 0.5f), _3066, _edgeFade);
    }

    _3067 = min(_1935, _3066);
    _3081 = float(half(_3067 * float(_1595)));
    _3082 = float(half(_3067 * float(_1596)));
    _3083 = float(half(_3067 * float(_1597)));
    _3084 = saturate((1.0f - _553) + (exp2(log2(saturate(_1922)) * 0.45454543828964233f) * _553));
  }
  half _3085 = half(_3081);
  half _3086 = half(_3082);
  half _3087 = half(_3083);
  half _3088 = half(_3084);
  __3__38__0__1__g_shadowColorResultUAV[int2(((int)(((uint)((_46 | _48) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((_44 << 2) | _51) << 3)) + SV_GroupThreadID.y)))] = half4(_3085, _3086, _3087, _3088);
}