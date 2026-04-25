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
  int _16[4];
  float _24[2];
  float _25[2];
  float _26[2];
  int _27 = (uint)(SV_GroupID.x) >> 4;
  int _28 = (uint)(SV_GroupID.x) >> 6;
  int _29 = _27 & 3;
  _16[0] = ((g_tileIndex[_28]).x);
  _16[1] = ((g_tileIndex[_28]).y);
  _16[2] = ((g_tileIndex[_28]).z);
  _16[3] = ((g_tileIndex[_28]).w);
  int _40 = _16[_29];
  int _41 = (uint)((uint)(_40)) >> 16;
  int _43 = ((int)((uint)(_40) << 2)) & 262140;
  int _45 = (int)(SV_GroupID.x) & 3;
  int _47 = (uint)(SV_GroupID.x) >> 2;
  int _48 = _47 & 3;
  float _54 = float((uint)(((uint)((_43 | _45) << 3)) + SV_GroupThreadID.x));
  float _55 = float((uint)(((uint)(((_41 << 2) | _48) << 3)) + SV_GroupThreadID.y));
  float _56 = _54 + 0.5f;
  float _57 = _55 + 0.5f;
  float _61 = _bufferSizeAndInvSize.z * 2.0f;
  float _62 = _61 * _56;
  float _63 = _62 + -1.0f;
  float _64 = _bufferSizeAndInvSize.w * 2.0f;
  float _65 = _64 * _57;
  float _66 = 1.0f - _65;
  uint _68 = __3__36__0__0__g_depthStencil.Load(int3(((int)(((uint)((_43 | _45) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((_41 << 2) | _48) << 3)) + SV_GroupThreadID.y)), 0));
  int _70 = (uint)((uint)(_68.x)) >> 24;
  int _71 = _68.x & 16777215;
  float _72 = float((uint)(uint)(_71));
  float _73 = _72 * 5.960465188081798e-08f;
  int _74 = _70 & 127;
  uint _76 = __3__36__0__0__g_sceneNormal.Load(int3(((int)(((uint)((_43 | _45) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((_41 << 2) | _48) << 3)) + SV_GroupThreadID.y)), 0));
  int _78 = (uint)((uint)(_76.x)) >> 10;
  int _79 = (uint)((uint)(_76.x)) >> 20;
  int _80 = _76.x & 1023;
  int _81 = _78 & 1023;
  int _82 = _79 & 1023;
  float _83 = float((uint)(uint)(_80));
  float _84 = float((uint)(uint)(_81));
  float _85 = float((uint)(uint)(_82));
  float _86 = _83 * 0.001956947147846222f;
  float _87 = _84 * 0.001956947147846222f;
  float _88 = _85 * 0.001956947147846222f;
  float _89 = _86 + -1.0f;
  float _90 = _87 + -1.0f;
  float _91 = _88 + -1.0f;
  float _92 = min(1.0f, _89);
  float _93 = min(1.0f, _90);
  float _94 = min(1.0f, _91);
  float _95 = dot(float3(_92, _93, _94), float3(_92, _93, _94));
  float _96 = rsqrt(_95);
  float _97 = _96 * _92;
  float _98 = _96 * _93;
  float _99 = _96 * _94;
  bool _100 = (_73 < 1.0000000116860974e-07f);
  bool _101 = (_73 == 1.0f);
  bool _102 = (_100) || (_101);
  int _371;
  float _550;
  float _624;
  int _625;
  float _626;
  float _690;
  int _691;
  int _692;
  float _693;
  float _755;
  int _756;
  int _757;
  float _806;
  int _807;
  int _808;
  int _967;
  int _1487;
  float _1590;
  float _1591;
  half _1592;
  half _1593;
  half _1594;
  float _1646;
  float _1647;
  float _1648;
  float _1756;
  int _1793;
  float _1799;
  float _1812;
  float _1825;
  float _1835;
  float _1836;
  float _1837;
  float _1846;
  float _1847;
  float _1848;
  int _1991;
  float _1992;
  float _1993;
  float _1994;
  float _1995;
  float _1996;
  int _1997;
  float _1998;
  float _1999;
  bool _2062;
  int _2069;
  float _2088;
  float _2104;
  int _2111;
  float _2112;
  float _2134;
  float _2135;
  float _2136;
  float _2137;
  float _2138;
  float _2142;
  int _2269;
  float _2270;
  float _2271;
  float _2272;
  float _2273;
  float _2274;
  int _2275;
  float _2276;
  float _2277;
  bool _2340;
  int _2347;
  float _2366;
  float _2382;
  int _2389;
  float _2390;
  float _2412;
  float _2413;
  float _2414;
  float _2415;
  float _2416;
  float _2420;
  int _2430;
  float _2431;
  float _2432;
  float _2433;
  float _2434;
  float _2435;
  float _2496;
  float _2498;
  float _2521;
  float _2594;
  float _2597;
  float _2601;
  float _2616;
  float _2617;
  float _2618;
  float _2619;
  if (_102) {
    float _104 = select(_101, 0.0f, 1.0f);
    _2616 = _104;
    _2617 = _104;
    _2618 = _104;
    _2619 = _104;
  } else {
    float _108 = max(1.0000000116860974e-07f, _73);
    float _109 = _nearFarProj.x / _108;
    float _130 = (_invViewProjRelative[0].x) * _63;
    float _131 = mad((_invViewProjRelative[0].y), _66, _130);
    float _132 = mad((_invViewProjRelative[0].z), _108, _131);
    float _133 = _132 + (_invViewProjRelative[0].w);
    float _134 = (_invViewProjRelative[1].x) * _63;
    float _135 = mad((_invViewProjRelative[1].y), _66, _134);
    float _136 = mad((_invViewProjRelative[1].z), _108, _135);
    float _137 = _136 + (_invViewProjRelative[1].w);
    float _138 = (_invViewProjRelative[2].x) * _63;
    float _139 = mad((_invViewProjRelative[2].y), _66, _138);
    float _140 = mad((_invViewProjRelative[2].z), _108, _139);
    float _141 = _140 + (_invViewProjRelative[2].w);
    float _142 = (_invViewProjRelative[3].x) * _63;
    float _143 = mad((_invViewProjRelative[3].y), _66, _142);
    float _144 = mad((_invViewProjRelative[3].z), _108, _143);
    float _145 = _144 + (_invViewProjRelative[3].w);
    float _146 = _133 / _145;
    float _147 = _137 / _145;
    float _148 = _141 / _145;
    float _149 = dot(float3(_146, _147, _148), float3(_146, _147, _148));
    float _150 = rsqrt(_149);
    _24[0] = 0.0f;
    _25[0] = 0.0f;
    _26[0] = 0.0f;
    _24[1] = 0.0f;
    _25[1] = 0.0f;
    _26[1] = 0.0f;
    uint _162 = _frameNumber.x * 1551;
    bool _166 = ((_74 == 57) || ((uint)(_74 + -53) < (uint)15));
    float _183 = (_terrainShadowProjRelativeTexScale[0].x) * _146;
    float _184 = mad((_terrainShadowProjRelativeTexScale[0].y), _147, _183);
    float _185 = mad((_terrainShadowProjRelativeTexScale[0].z), _148, _184);
    float _186 = _185 + (_terrainShadowProjRelativeTexScale[0].w);
    float _187 = (_terrainShadowProjRelativeTexScale[1].x) * _146;
    float _188 = mad((_terrainShadowProjRelativeTexScale[1].y), _147, _187);
    float _189 = mad((_terrainShadowProjRelativeTexScale[1].z), _148, _188);
    float _190 = _189 + (_terrainShadowProjRelativeTexScale[1].w);
    float _191 = (_terrainShadowProjRelativeTexScale[2].x) * _146;
    float _192 = mad((_terrainShadowProjRelativeTexScale[2].y), _147, _191);
    float _193 = mad((_terrainShadowProjRelativeTexScale[2].z), _148, _192);
    float _194 = _193 + (_terrainShadowProjRelativeTexScale[2].w);
    float _195 = saturate(_186);
    bool _196 = (_195 == _186);
    if (_196) {
      float _198 = saturate(_190);
      bool _203 = ((_194 >= 9.999999747378752e-05f) && ((_194 <= 1.0f) && (_198 == _190)));
      if (_203) {
        float _205 = float((uint)(uint)(_frameNumber.x));
        float _206 = _205 * 92.0f;
        float _207 = _205 * 71.0f;
        float _208 = _206 + _54;
        float _209 = _207 + _55;
        float _210 = _208 * 0.0078125f;
        float _211 = _209 * 0.0078125f;
        float _212 = frac(_210);
        float _213 = frac(_211);
        float _214 = _212 * 128.0f;
        float _215 = _213 * 128.0f;
        float _216 = _214 + -64.34062194824219f;
        float _217 = _215 + -72.46562194824219f;
        float _218 = _216 * _216;
        float _219 = _217 * _217;
        float _220 = _217 * _216;
        float _221 = dot(float3(_218, _219, _220), float3(20.390625f, 60.703125f, 2.4281208515167236f));
        float _222 = frac(_221);
        float _223 = _222 * 51540816.0f;
        float _224 = _222 * 287478368.0f;
        uint _225 = uint(_223);
        uint _226 = uint(_224);
        float _228 = _55 * _bufferSizeAndInvSize.x;
        float _229 = _228 + _54;
        uint _230 = uint(_229);
        int _234 = ((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)));
        int _235 = (uint)((uint)(_frameNumber.x)) >> 5;
        int _237 = _234 ^ (_235 + -939442524);
        int _242 = ((int)((((uint)(_237) + _230) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_237) + _230) + (uint)(-1640531527)));
        int _243 = (uint)((uint)(_237) + _230) >> 5;
        int _245 = _242 ^ ((int)((uint)(_243) + 2123724318u));
        int _250 = ((int)((((uint)(_245) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_245) + (uint)(_frameNumber.x)) + 1013904242u));
        int _251 = (uint)((uint)(_245) + (uint)(_frameNumber.x)) >> 5;
        int _253 = _250 ^ (_251 + -939442524);
        int _258 = ((int)((((uint)(_253) + ((uint)(_237) + _230)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_253) + ((uint)(_237) + _230)) + 1013904242u));
        int _259 = (uint)((uint)(_253) + ((uint)(_237) + _230)) >> 5;
        int _261 = _258 ^ ((int)((uint)(_259) + 2123724318u));
        int _266 = ((int)((((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
        int _267 = (uint)((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))) >> 5;
        int _269 = _266 ^ (_267 + -939442524);
        int _274 = ((int)((((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))) + (uint)(-626627285)));
        int _275 = (uint)((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))) >> 5;
        int _277 = _274 ^ ((int)((uint)(_275) + 2123724318u));
        int _282 = ((int)((((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))) + 2027808484u));
        int _283 = (uint)((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))) >> 5;
        int _285 = _282 ^ (_283 + -939442524);
        int _290 = ((int)((((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))) + 2027808484u));
        int _291 = (uint)((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))) >> 5;
        int _293 = _290 ^ ((int)((uint)(_291) + 2123724318u));
        int _298 = ((int)((((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))) + 387276957u));
        int _299 = (uint)((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))) >> 5;
        int _301 = _298 ^ (_299 + -939442524);
        int _306 = ((int)((((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))))) + 387276957u));
        int _307 = (uint)((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))))) >> 5;
        int _309 = _306 ^ ((int)((uint)(_307) + 2123724318u));
        int _314 = ((int)((((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
        int _315 = (uint)((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))))) >> 5;
        int _317 = _314 ^ (_315 + -939442524);
        int _322 = ((int)((((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))))) + (uint)(-1253254570)));
        int _323 = (uint)((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))))) >> 5;
        int _325 = _322 ^ ((int)((uint)(_323) + 2123724318u));
        int _330 = ((int)((((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))))) + 1401181199u));
        int _331 = (uint)((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))))) >> 5;
        int _333 = _330 ^ (_331 + -939442524);
        int _338 = ((int)((((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))))))) + 1401181199u));
        int _339 = (uint)((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))))))) >> 5;
        int _341 = _338 ^ ((int)((uint)(_339) + 2123724318u));
        int _346 = ((int)((((uint)(_341) + ((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_341) + ((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
        int _347 = (uint)((uint)(_341) + ((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x)))))))) >> 5;
        int _349 = _346 ^ (_347 + -939442524);
        int _354 = ((int)((((uint)(_349) + ((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_349) + ((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))))))) + (uint)(-239350328)));
        int _355 = (uint)((uint)(_349) + ((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))))))) >> 5;
        int _357 = _354 ^ ((int)((uint)(_355) + 2123724318u));
        int _359 = ((int)((uint)(_349) + ((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))))))))) & 16777215;
        bool _360 = (_359 == 0);
        if (_360) {
          int _365 = ((int)((((uint)(_357) + ((uint)(_341) + ((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_357) + ((uint)(_341) + ((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
          int _366 = (uint)((uint)(_357) + ((uint)(_341) + ((uint)(_325) + ((uint)(_309) + ((uint)(_293) + ((uint)(_277) + ((uint)(_261) + ((uint)(_245) + (uint)(_frameNumber.x))))))))) >> 5;
          int _368 = _365 ^ (_366 + -939442524);
          _371 = ((int)((uint)(_368) + ((uint)(_349) + ((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230))))))))));
        } else {
          _371 = ((int)((uint)(_349) + ((uint)(_333) + ((uint)(_317) + ((uint)(_301) + ((uint)(_285) + ((uint)(_269) + ((uint)(_253) + ((uint)(_237) + _230)))))))));
        }
        uint _372 = _371 * 48271;
        int _373 = (int)(_372) & 16777215;
        float _374 = float((uint)(uint)(_373));
        float _375 = _374 * 3.814637693722034e-06f;
        uint _376 = uint(_375);
        float _377 = float((uint)_376);
        float _378 = _377 * 0.015625f;
        int _379 = (int)(_225) & 65535;
        float _380 = float((uint)(uint)(_379));
        float _381 = _380 * 1.52587890625e-05f;
        float _382 = _378 + _381;
        float _383 = frac(_382);
        int _384 = reversebits(_376);
        int _385 = _384 ^ (int)(_226);
        float _386 = float((uint)(uint)(_385));
        float _387 = _383 * 2.0f;
        float _388 = _386 * 4.656612873077393e-10f;
        float _389 = _387 + -1.0f;
        float _390 = _388 + -1.0f;
        float _391 = dot(float2(_389, _390), float2(_389, _390));
        float _392 = rsqrt(_391);
        float _393 = _390 * _392;
        float _397 = _383 * 0.0009765625f;
        float _398 = _397 + -0.00048828125f;
        float _399 = _398 * _392;
        float _400 = _399 * (_jitterOffset[0].x);
        float _401 = _393 * 0.00048828125f;
        float _402 = _401 * (_jitterOffset[0].y);
        float _403 = _400 + _186;
        float _404 = _402 + _190;
        float _405 = _403 * 1024.0f;
        float _406 = _404 * 1024.0f;
        float _407 = _405 + -0.5f;
        float _408 = _406 + -0.5f;
        float _409 = frac(_407);
        float _410 = frac(_408);
        float4 _413 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_403, _404));
        float _418 = _194 + -0.004999999888241291f;
        bool _419 = (_413.w > _418);
        bool _420 = (_413.z > _418);
        bool _421 = (_413.x > _418);
        bool _422 = (_413.y > _418);
        float _423 = select(_419, 1.0f, 0.0f);
        float _424 = select(_420, 1.0f, 0.0f);
        float _425 = select(_421, 1.0f, 0.0f);
        float _426 = select(_422, 1.0f, 0.0f);
        float _427 = _426 - _425;
        float _428 = _427 * _409;
        float _429 = _428 + _425;
        float _430 = _424 - _423;
        float _431 = _430 * _409;
        float _432 = _431 + _423;
        float _433 = _429 - _432;
        float _434 = _433 * _410;
        float _435 = _434 + _432;
        float _436 = saturate(_435);
        float _440 = (_jitterOffset[1].x) * _399;
        float _441 = (_jitterOffset[1].y) * _401;
        float _442 = _440 + _186;
        float _443 = _441 + _190;
        float _444 = _442 * 1024.0f;
        float _445 = _443 * 1024.0f;
        float _446 = _444 + -0.5f;
        float _447 = _445 + -0.5f;
        float _448 = frac(_446);
        float _449 = frac(_447);
        float4 _450 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_442, _443));
        bool _455 = (_450.w > _418);
        bool _456 = (_450.z > _418);
        bool _457 = (_450.x > _418);
        bool _458 = (_450.y > _418);
        float _459 = select(_455, 1.0f, 0.0f);
        float _460 = select(_456, 1.0f, 0.0f);
        float _461 = select(_457, 1.0f, 0.0f);
        float _462 = select(_458, 1.0f, 0.0f);
        float _463 = _462 - _461;
        float _464 = _463 * _448;
        float _465 = _464 + _461;
        float _466 = _460 - _459;
        float _467 = _466 * _448;
        float _468 = _467 + _459;
        float _469 = _465 - _468;
        float _470 = _469 * _449;
        float _471 = _470 + _468;
        float _472 = saturate(_471);
        float _473 = _472 + _436;
        float _477 = (_jitterOffset[2].x) * _399;
        float _478 = (_jitterOffset[2].y) * _401;
        float _479 = _477 + _186;
        float _480 = _478 + _190;
        float _481 = _479 * 1024.0f;
        float _482 = _480 * 1024.0f;
        float _483 = _481 + -0.5f;
        float _484 = _482 + -0.5f;
        float _485 = frac(_483);
        float _486 = frac(_484);
        float4 _487 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_479, _480));
        bool _492 = (_487.w > _418);
        bool _493 = (_487.z > _418);
        bool _494 = (_487.x > _418);
        bool _495 = (_487.y > _418);
        float _496 = select(_492, 1.0f, 0.0f);
        float _497 = select(_493, 1.0f, 0.0f);
        float _498 = select(_494, 1.0f, 0.0f);
        float _499 = select(_495, 1.0f, 0.0f);
        float _500 = _499 - _498;
        float _501 = _500 * _485;
        float _502 = _501 + _498;
        float _503 = _497 - _496;
        float _504 = _503 * _485;
        float _505 = _504 + _496;
        float _506 = _502 - _505;
        float _507 = _506 * _486;
        float _508 = _507 + _505;
        float _509 = saturate(_508);
        float _510 = _473 + _509;
        float _514 = (_jitterOffset[3].x) * _399;
        float _515 = (_jitterOffset[3].y) * _401;
        float _516 = _514 + _186;
        float _517 = _515 + _190;
        float _518 = _516 * 1024.0f;
        float _519 = _517 * 1024.0f;
        float _520 = _518 + -0.5f;
        float _521 = _519 + -0.5f;
        float _522 = frac(_520);
        float _523 = frac(_521);
        float4 _524 = __3__36__0__0__g_terrainShadowDepth.GatherRed(__0__4__0__0__g_staticPointClamp, float2(_516, _517));
        bool _529 = (_524.w > _418);
        bool _530 = (_524.z > _418);
        bool _531 = (_524.x > _418);
        bool _532 = (_524.y > _418);
        float _533 = select(_529, 1.0f, 0.0f);
        float _534 = select(_530, 1.0f, 0.0f);
        float _535 = select(_531, 1.0f, 0.0f);
        float _536 = select(_532, 1.0f, 0.0f);
        float _537 = _536 - _535;
        float _538 = _537 * _522;
        float _539 = _538 + _535;
        float _540 = _534 - _533;
        float _541 = _540 * _522;
        float _542 = _541 + _533;
        float _543 = _539 - _542;
        float _544 = _543 * _523;
        float _545 = _544 + _542;
        float _546 = saturate(_545);
        float _547 = _510 + _546;
        float _548 = _547 * 0.25f;
        _550 = _548;
      } else {
        _550 = 1.0f;
      }
    } else {
      _550 = 1.0f;
    }
    float _553 = _146 * _146;
    float _554 = _147 * _147;
    float _555 = _554 + _553;
    float _556 = _148 * _148;
    float _557 = _555 + _556;
    float _558 = sqrt(_557);
    float _575 = (_dynamicShadowProjRelativeTexScale[1][0].x) * _146;
    float _576 = mad((_dynamicShadowProjRelativeTexScale[1][0].y), _147, _575);
    float _577 = mad((_dynamicShadowProjRelativeTexScale[1][0].z), _148, _576);
    float _578 = _577 + (_dynamicShadowProjRelativeTexScale[1][0].w);
    float _579 = (_dynamicShadowProjRelativeTexScale[1][1].x) * _146;
    float _580 = mad((_dynamicShadowProjRelativeTexScale[1][1].y), _147, _579);
    float _581 = mad((_dynamicShadowProjRelativeTexScale[1][1].z), _148, _580);
    float _582 = _581 + (_dynamicShadowProjRelativeTexScale[1][1].w);
    float _583 = (_dynamicShadowProjRelativeTexScale[1][2].x) * _146;
    float _584 = mad((_dynamicShadowProjRelativeTexScale[1][2].y), _147, _583);
    float _585 = mad((_dynamicShadowProjRelativeTexScale[1][2].z), _148, _584);
    float _586 = _585 + (_dynamicShadowProjRelativeTexScale[1][2].w);
    float _587 = 4.0f / _dynmaicShadowSizeAndInvSize.y;
    float _588 = 1.0f - _587;
    bool _589 = !(_578 >= _587);
    bool _590 = !(_578 <= _588);
    bool _591 = (_590) || (_589);
    bool _592 = !(_582 <= _588);
    bool _593 = (_591) || (_592);
    if (!_593) {
      bool _601 = ((_558 < 128.0f) && ((_586 >= -1.0f) && ((_586 <= 1.0f) && (_582 >= _587))));
      if (_601) {
        float _603 = _578 * 2.0f;
        float _604 = _582 * 2.0f;
        float _605 = _603 + -1.0f;
        float _606 = _604 + -1.0f;
        float _607 = abs(_605);
        float _608 = abs(_606);
        float _609 = _607 + -0.8999999761581421f;
        float _610 = _608 + -0.8999999761581421f;
        float _611 = _609 * 10.0f;
        float _612 = _610 * 10.0f;
        float _613 = max(0.0f, _611);
        float _614 = max(0.0f, _612);
        float _615 = _613 * _613;
        float _616 = _614 * _614;
        float _617 = _616 + _615;
        float _618 = sqrt(_617);
        _24[1] = _578;
        _25[1] = _582;
        _26[1] = _586;
        bool _621 = (_terrainNormalParams.y > 0.0f);
        float _622 = select(_621, 1.9999999494757503e-05f, 7.999999797903001e-05f);
        _624 = _622;
        _625 = 1;
        _626 = _618;
      } else {
        _624 = 0.0f;
        _625 = 0;
        _626 = 0.0f;
      }
    } else {
      _624 = 0.0f;
      _625 = 0;
      _626 = 0.0f;
    }
    float _643 = (_dynamicShadowProjRelativeTexScale[0][0].x) * _146;
    float _644 = mad((_dynamicShadowProjRelativeTexScale[0][0].y), _147, _643);
    float _645 = mad((_dynamicShadowProjRelativeTexScale[0][0].z), _148, _644);
    float _646 = _645 + (_dynamicShadowProjRelativeTexScale[0][0].w);
    float _647 = (_dynamicShadowProjRelativeTexScale[0][1].x) * _146;
    float _648 = mad((_dynamicShadowProjRelativeTexScale[0][1].y), _147, _647);
    float _649 = mad((_dynamicShadowProjRelativeTexScale[0][1].z), _148, _648);
    float _650 = _649 + (_dynamicShadowProjRelativeTexScale[0][1].w);
    float _651 = (_dynamicShadowProjRelativeTexScale[0][2].x) * _146;
    float _652 = mad((_dynamicShadowProjRelativeTexScale[0][2].y), _147, _651);
    float _653 = mad((_dynamicShadowProjRelativeTexScale[0][2].z), _148, _652);
    float _654 = _653 + (_dynamicShadowProjRelativeTexScale[0][2].w);
    bool _655 = !(_646 <= _588);
    bool _656 = !(_646 >= _587);
    bool _657 = (_656) || (_655);
    bool _658 = !(_650 <= _588);
    bool _659 = (_657) || (_658);
    if (!_659) {
      bool _667 = ((_558 < 128.0f) && ((_654 >= -1.0f) && ((_650 >= _587) && (_654 <= 1.0f))));
      if (_667) {
        float _669 = _646 * 2.0f;
        float _670 = _650 * 2.0f;
        float _671 = _669 + -1.0f;
        float _672 = _670 + -1.0f;
        float _673 = abs(_671);
        float _674 = abs(_672);
        float _675 = _673 + -0.8999999761581421f;
        float _676 = _674 + -0.8999999761581421f;
        float _677 = _675 * 10.0f;
        float _678 = _676 * 10.0f;
        float _679 = max(0.0f, _677);
        float _680 = max(0.0f, _678);
        float _681 = _679 * _679;
        float _682 = _680 * _680;
        float _683 = _682 + _681;
        float _684 = sqrt(_683);
        _24[0] = _646;
        _25[0] = _650;
        _26[0] = _654;
        bool _687 = (_terrainNormalParams.y > 0.0f);
        float _688 = select(_687, 4.999999873689376e-06f, 1.9999999494757503e-05f);
        _690 = _688;
        _691 = 1;
        _692 = 0;
        _693 = _684;
      } else {
        _690 = _624;
        _691 = _625;
        _692 = _625;
        _693 = _626;
      }
    } else {
      _690 = _624;
      _691 = _625;
      _692 = _625;
      _693 = _626;
    }
    bool _694 = (_691 == 0);
    [branch]
    if (_694) {
      float _702 = _viewPos.x + _146;
      float _703 = _viewPos.y + _147;
      float _704 = _viewPos.z + _148;
      float _709 = _702 - (_staticShadowPosition[1].x);
      float _710 = _703 - (_staticShadowPosition[1].y);
      float _711 = _704 - (_staticShadowPosition[1].z);
      float _728 = (_shadowProjRelativeTexScale[1][0].x) * _709;
      float _729 = mad((_shadowProjRelativeTexScale[1][0].y), _710, _728);
      float _730 = mad((_shadowProjRelativeTexScale[1][0].z), _711, _729);
      float _731 = _730 + (_shadowProjRelativeTexScale[1][0].w);
      float _732 = (_shadowProjRelativeTexScale[1][1].x) * _709;
      float _733 = mad((_shadowProjRelativeTexScale[1][1].y), _710, _732);
      float _734 = mad((_shadowProjRelativeTexScale[1][1].z), _711, _733);
      float _735 = _734 + (_shadowProjRelativeTexScale[1][1].w);
      float _736 = (_shadowProjRelativeTexScale[1][2].x) * _709;
      float _737 = mad((_shadowProjRelativeTexScale[1][2].y), _710, _736);
      float _738 = mad((_shadowProjRelativeTexScale[1][2].z), _711, _737);
      float _739 = _738 + (_shadowProjRelativeTexScale[1][2].w);
      float _740 = 2.0f / _shadowSizeAndInvSize.y;
      float _741 = 1.0f - _740;
      bool _742 = !(_731 >= _740);
      bool _743 = !(_731 <= _741);
      bool _744 = (_743) || (_742);
      bool _745 = !(_735 <= _741);
      bool _746 = (_744) || (_745);
      if (!_746) {
        bool _752 = ((_739 >= 9.999999747378752e-05f) && ((_739 <= 1.0f) && (_735 >= _740)));
        if (_752) {
          _24[1] = _731;
          _25[1] = _735;
          _26[1] = _739;
          _755 = 0.00019999999494757503f;
          _756 = 1;
          _757 = 1;
        } else {
          _755 = _690;
          _756 = 0;
          _757 = _692;
        }
      } else {
        _755 = _690;
        _756 = 0;
        _757 = _692;
      }
      float _762 = _702 - (_staticShadowPosition[0].x);
      float _763 = _703 - (_staticShadowPosition[0].y);
      float _764 = _704 - (_staticShadowPosition[0].z);
      float _781 = (_shadowProjRelativeTexScale[0][0].x) * _762;
      float _782 = mad((_shadowProjRelativeTexScale[0][0].y), _763, _781);
      float _783 = mad((_shadowProjRelativeTexScale[0][0].z), _764, _782);
      float _784 = _783 + (_shadowProjRelativeTexScale[0][0].w);
      float _785 = (_shadowProjRelativeTexScale[0][1].x) * _762;
      float _786 = mad((_shadowProjRelativeTexScale[0][1].y), _763, _785);
      float _787 = mad((_shadowProjRelativeTexScale[0][1].z), _764, _786);
      float _788 = _787 + (_shadowProjRelativeTexScale[0][1].w);
      float _789 = (_shadowProjRelativeTexScale[0][2].x) * _762;
      float _790 = mad((_shadowProjRelativeTexScale[0][2].y), _763, _789);
      float _791 = mad((_shadowProjRelativeTexScale[0][2].z), _764, _790);
      float _792 = _791 + (_shadowProjRelativeTexScale[0][2].w);
      bool _793 = !(_784 <= _741);
      bool _794 = !(_784 >= _740);
      bool _795 = (_794) || (_793);
      bool _796 = !(_788 <= _741);
      bool _797 = (_795) || (_796);
      if (!_797) {
        bool _803 = ((_792 >= 9.999999747378752e-05f) && ((_788 >= _740) && (_792 <= 1.0f)));
        if (_803) {
          _24[0] = _784;
          _25[0] = _788;
          _26[0] = _792;
          _806 = 0.00019999999494757503f;
          _807 = 1;
          _808 = 0;
        } else {
          _806 = _755;
          _807 = _756;
          _808 = _757;
        }
      } else {
        _806 = _755;
        _807 = _756;
        _808 = _757;
      }
    } else {
      _806 = _690;
      _807 = 1;
      _808 = _692;
    }
    float _814 = _55 * _bufferSizeAndInvSize.x;
    float _815 = _814 + _54;
    uint _816 = uint(_815);
    int _820 = ((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)));
    int _821 = (uint)((uint)(_frameNumber.x)) >> 5;
    int _823 = _820 ^ (_821 + -939442524);
    int _828 = ((int)((((uint)(_823) + _816) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_823) + _816) + (uint)(-1640531527)));
    int _829 = (uint)((uint)(_823) + _816) >> 5;
    int _831 = _828 ^ ((int)((uint)(_829) + 2123724318u));
    int _836 = ((int)((((uint)(_831) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_831) + (uint)(_frameNumber.x)) + 1013904242u));
    int _837 = (uint)((uint)(_831) + (uint)(_frameNumber.x)) >> 5;
    int _839 = _836 ^ (_837 + -939442524);
    int _844 = ((int)((((uint)(_839) + ((uint)(_823) + _816)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_839) + ((uint)(_823) + _816)) + 1013904242u));
    int _845 = (uint)((uint)(_839) + ((uint)(_823) + _816)) >> 5;
    int _847 = _844 ^ ((int)((uint)(_845) + 2123724318u));
    int _852 = ((int)((((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    int _853 = (uint)((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))) >> 5;
    int _855 = _852 ^ (_853 + -939442524);
    int _860 = ((int)((((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))) + (uint)(-626627285)));
    int _861 = (uint)((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))) >> 5;
    int _863 = _860 ^ ((int)((uint)(_861) + 2123724318u));
    int _868 = ((int)((((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _869 = (uint)((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))) >> 5;
    int _871 = _868 ^ (_869 + -939442524);
    int _876 = ((int)((((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))) + 2027808484u));
    int _877 = (uint)((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))) >> 5;
    int _879 = _876 ^ ((int)((uint)(_877) + 2123724318u));
    int _884 = ((int)((((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))) + 387276957u));
    int _885 = (uint)((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))) >> 5;
    int _887 = _884 ^ (_885 + -939442524);
    int _892 = ((int)((((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))) + 387276957u));
    int _893 = (uint)((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))) >> 5;
    int _895 = _892 ^ ((int)((uint)(_893) + 2123724318u));
    int _900 = ((int)((((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
    int _901 = (uint)((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))))) >> 5;
    int _903 = _900 ^ (_901 + -939442524);
    int _908 = ((int)((((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))) + (uint)(-1253254570)));
    int _909 = (uint)((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))) >> 5;
    int _911 = _908 ^ ((int)((uint)(_909) + 2123724318u));
    int _916 = ((int)((((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))) + 1401181199u));
    int _917 = (uint)((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))) >> 5;
    int _919 = _916 ^ (_917 + -939442524);
    int _924 = ((int)((((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))))) + 1401181199u));
    int _925 = (uint)((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))))) >> 5;
    int _927 = _924 ^ ((int)((uint)(_925) + 2123724318u));
    int _932 = ((int)((((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
    int _933 = (uint)((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x)))))))) >> 5;
    int _935 = _932 ^ (_933 + -939442524);
    int _940 = ((int)((((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))))) + (uint)(-239350328)));
    int _941 = (uint)((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))))) >> 5;
    int _943 = _940 ^ ((int)((uint)(_941) + 2123724318u));
    int _945 = ((int)((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))))))) & 16777215;
    bool _946 = (_945 == 0);
    [branch]
    if (_694) {
      float _1474 = _24[_808];
      float _1475 = _25[_808];
      float _1476 = _26[_808];
      if (_946) {
        int _1481 = ((int)((((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
        int _1482 = (uint)((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) >> 5;
        int _1484 = _1481 ^ (_1482 + -939442524);
        _1487 = ((int)((uint)(_1484) + ((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))))))));
      } else {
        _1487 = ((int)((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))))));
      }
      float _1488 = _shadowSizeAndInvSize.z * 2.0f;
      float _1489 = _shadowSizeAndInvSize.w * 2.0f;
      uint _1490 = _1487 * 48271;
      int _1491 = (int)(_1490) & 16777215;
      float _1492 = float((uint)(uint)(_1491));
      uint _1493 = _1487 * -1964877855;
      int _1494 = (int)(_1493) & 16777215;
      float _1495 = float((uint)(uint)(_1494));
      float _1496 = _shadowSizeAndInvSize.z * 2.384185791015625e-07f;
      float _1497 = _1492 * _1496;
      float _1498 = _shadowSizeAndInvSize.w * 2.384185791015625e-07f;
      float _1499 = _1495 * _1498;
      float _1500 = _1497 - _1488;
      float _1501 = _1499 - _1489;
      float _1502 = _1500 + _1474;
      float _1503 = _1501 + _1475;
      float _1504 = float((uint)(uint)(_808));
      float4 _1507 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1502, _1503, _1504), 0.0f);
      float _1509 = _1476 - _1507.x;
      float _1510 = max(0.0f, _1509);
      float _1511 = _1476 - _806;
      float4 _1513 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1502, _1503, _1504), _1511);
      float _1515 = 1.0f - _1513.x;
      float _1516 = saturate(_1515);
      uint _1517 = _1487 * -856141137;
      int _1518 = (int)(_1517) & 16777215;
      float _1519 = float((uint)(uint)(_1518));
      uint _1520 = _1487 * -613502015;
      int _1521 = (int)(_1520) & 16777215;
      float _1522 = float((uint)(uint)(_1521));
      float _1523 = _1519 * _1496;
      float _1524 = _1522 * _1498;
      float _1525 = _1523 - _1488;
      float _1526 = _1524 - _1489;
      float _1527 = _1525 + _1474;
      float _1528 = _1526 + _1475;
      float4 _1529 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1527, _1528, _1504), 0.0f);
      float _1531 = _1476 - _1529.x;
      float _1532 = max(0.0f, _1531);
      float4 _1533 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1527, _1528, _1504), _1511);
      float _1535 = 1.0f - _1533.x;
      float _1536 = saturate(_1535);
      float _1537 = _1536 + _1516;
      float _1538 = _1532 + _1510;
      uint _1539 = _1487 * -556260145;
      int _1540 = (int)(_1539) & 16777215;
      float _1541 = float((uint)(uint)(_1540));
      uint _1542 = _1487 * 902075297;
      int _1543 = (int)(_1542) & 16777215;
      float _1544 = float((uint)(uint)(_1543));
      float _1545 = _1541 * _1496;
      float _1546 = _1544 * _1498;
      float _1547 = _1545 - _1488;
      float _1548 = _1546 - _1489;
      float _1549 = _1547 + _1474;
      float _1550 = _1548 + _1475;
      float4 _1551 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1549, _1550, _1504), 0.0f);
      float _1553 = _1476 - _1551.x;
      float _1554 = max(0.0f, _1553);
      float4 _1555 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1549, _1550, _1504), _1511);
      float _1557 = 1.0f - _1555.x;
      float _1558 = saturate(_1557);
      float _1559 = _1537 + _1558;
      float _1560 = _1538 + _1554;
      uint _1561 = _1487 * 1698214639;
      int _1562 = (int)(_1561) & 16777215;
      float _1563 = float((uint)(uint)(_1562));
      uint _1564 = _1487 * 773027713;
      int _1565 = (int)(_1564) & 16777215;
      float _1566 = float((uint)(uint)(_1565));
      float _1567 = _1563 * _1496;
      float _1568 = _1566 * _1498;
      float _1569 = _1567 - _1488;
      float _1570 = _1568 - _1489;
      float _1571 = _1569 + _1474;
      float _1572 = _1570 + _1475;
      float4 _1573 = __3__36__0__0__g_shadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1571, _1572, _1504), 0.0f);
      float _1575 = _1476 - _1573.x;
      float _1576 = max(0.0f, _1575);
      float4 _1577 = __3__36__0__0__g_shadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1571, _1572, _1504), _1511);
      float _1579 = 1.0f - _1577.x;
      float _1580 = saturate(_1579);
      float _1581 = _1559 + _1580;
      float _1582 = _1560 + _1576;
      float _1583 = _1581 * 0.25f;
      float _1584 = _1582 * 0.25f;
      float _1585 = _1583 * _1583;
      float _1586 = _1584 * _1584;
      float _1587 = saturate(_1585);
      float _1588 = saturate(_1586);
      _1590 = _1587;
      _1591 = _1588;
      _1592 = 1.0h;
      _1593 = 1.0h;
      _1594 = 1.0h;
    } else {
      float _950 = _24[_808];
      float _951 = _25[_808];
      float _952 = _26[_808];
      bool _953 = (_808 == 0);
      float _954 = select(_953, 2.5f, 1.0f);
      float _955 = _954 * 0.75f;
      float _956 = select(_166, _955, _954);
      if (_946) {
        int _961 = ((int)((((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
        int _962 = (uint)((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) >> 5;
        int _964 = _961 ^ (_962 + -939442524);
        _967 = ((int)((uint)(_964) + ((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))))))));
      } else {
        _967 = ((int)((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))))));
      }
      float _968 = _956 * 0.6600000262260437f;
      float _969 = _968 * _dynmaicShadowSizeAndInvSize.z;
      float _970 = _968 * _dynmaicShadowSizeAndInvSize.w;
      uint _971 = _967 * 48271;
      int _972 = (int)(_971) & 16777215;
      float _973 = float((uint)(uint)(_972));
      uint _974 = _967 * -1964877855;
      int _975 = (int)(_974) & 16777215;
      float _976 = float((uint)(uint)(_975));
      float _977 = _969 * 1.1920928955078125e-07f;
      float _978 = _973 * _977;
      float _979 = _970 * 1.1920928955078125e-07f;
      float _980 = _976 * _979;
      float _981 = _978 - _969;
      float _982 = _980 - _970;
      float _983 = _981 + _950;
      float _984 = _982 + _951;
      float _985 = float((uint)(uint)(_808));
      float4 _988 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_983, _984, _985), 0.0f);
      float _990 = _952 - _988.x;
      float _991 = max(0.0f, _990);
      float _992 = _952 - _806;
      float4 _994 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_983, _984, _985), _992);
      float _996 = 1.0f - _994.x;
      float _997 = saturate(_996);
      half4 _999 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_983, _984, _985), 0.0f);
      uint _1003 = _967 * -856141137;
      int _1004 = (int)(_1003) & 16777215;
      float _1005 = float((uint)(uint)(_1004));
      uint _1006 = _967 * -613502015;
      int _1007 = (int)(_1006) & 16777215;
      float _1008 = float((uint)(uint)(_1007));
      float _1009 = _1005 * _977;
      float _1010 = _1008 * _979;
      float _1011 = _1009 - _969;
      float _1012 = _1010 - _970;
      float _1013 = _1011 + _950;
      float _1014 = _1012 + _951;
      float4 _1015 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1013, _1014, _985), 0.0f);
      float _1017 = _952 - _1015.x;
      float _1018 = max(0.0f, _1017);
      float4 _1019 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1013, _1014, _985), _992);
      float _1021 = 1.0f - _1019.x;
      float _1022 = saturate(_1021);
      half4 _1023 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1013, _1014, _985), 0.0f);
      float _1027 = _1022 + _997;
      float _1028 = _1018 + _991;
      uint _1029 = _967 * -556260145;
      int _1030 = (int)(_1029) & 16777215;
      float _1031 = float((uint)(uint)(_1030));
      uint _1032 = _967 * 902075297;
      int _1033 = (int)(_1032) & 16777215;
      float _1034 = float((uint)(uint)(_1033));
      float _1035 = _1031 * _977;
      float _1036 = _1034 * _979;
      float _1037 = _1035 - _969;
      float _1038 = _1036 - _970;
      float _1039 = _1037 + _950;
      float _1040 = _1038 + _951;
      float4 _1041 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1039, _1040, _985), 0.0f);
      float _1043 = _952 - _1041.x;
      float _1044 = max(0.0f, _1043);
      float4 _1045 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1039, _1040, _985), _992);
      float _1047 = 1.0f - _1045.x;
      float _1048 = saturate(_1047);
      half4 _1049 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1039, _1040, _985), 0.0f);
      float _1053 = _1027 + _1048;
      float _1054 = _1028 + _1044;
      uint _1055 = _967 * 1698214639;
      int _1056 = (int)(_1055) & 16777215;
      float _1057 = float((uint)(uint)(_1056));
      uint _1058 = _967 * 773027713;
      int _1059 = (int)(_1058) & 16777215;
      float _1060 = float((uint)(uint)(_1059));
      float _1061 = _1057 * _977;
      float _1062 = _1060 * _979;
      float _1063 = _1061 - _969;
      float _1064 = _1062 - _970;
      float _1065 = _1063 + _950;
      float _1066 = _1064 + _951;
      float4 _1067 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1065, _1066, _985), 0.0f);
      float _1069 = _952 - _1067.x;
      float _1070 = max(0.0f, _1069);
      float4 _1071 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1065, _1066, _985), _992);
      float _1073 = 1.0f - _1071.x;
      float _1074 = saturate(_1073);
      half4 _1075 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1065, _1066, _985), 0.0f);
      float _1079 = _1053 + _1074;
      float _1080 = _1054 + _1070;
      uint _1081 = _967 * 144866575;
      int _1082 = (int)(_1081) & 16777215;
      float _1083 = float((uint)(uint)(_1082));
      uint _1084 = _967 * 647683937;
      int _1085 = (int)(_1084) & 16777215;
      float _1086 = float((uint)(uint)(_1085));
      float _1087 = _1083 * _977;
      float _1088 = _1086 * _979;
      float _1089 = _1087 - _969;
      float _1090 = _1088 - _970;
      float _1091 = _1089 + _950;
      float _1092 = _1090 + _951;
      float4 _1093 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1091, _1092, _985), 0.0f);
      float _1095 = _952 - _1093.x;
      float _1096 = max(0.0f, _1095);
      float4 _1097 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1091, _1092, _985), _992);
      float _1099 = 1.0f - _1097.x;
      float _1100 = saturate(_1099);
      half4 _1101 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1091, _1092, _985), 0.0f);
      float _1105 = _1079 + _1100;
      float _1106 = _1080 + _1096;
      uint _1107 = _967 * 1284375343;
      int _1108 = (int)(_1107) & 16777215;
      float _1109 = float((uint)(uint)(_1108));
      uint _1110 = _967 * 229264193;
      int _1111 = (int)(_1110) & 16777215;
      float _1112 = float((uint)(uint)(_1111));
      float _1113 = _1109 * _977;
      float _1114 = _1112 * _979;
      float _1115 = _1113 - _969;
      float _1116 = _1114 - _970;
      float _1117 = _1115 + _950;
      float _1118 = _1116 + _951;
      float4 _1119 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1117, _1118, _985), 0.0f);
      float _1121 = _952 - _1119.x;
      float _1122 = max(0.0f, _1121);
      float4 _1123 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1117, _1118, _985), _992);
      float _1125 = 1.0f - _1123.x;
      float _1126 = saturate(_1125);
      half4 _1127 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1117, _1118, _985), 0.0f);
      float _1131 = _1105 + _1126;
      float _1132 = _1106 + _1122;
      uint _1133 = _967 * -1318861489;
      int _1134 = (int)(_1133) & 16777215;
      float _1135 = float((uint)(uint)(_1134));
      uint _1136 = _967 * 1537293089;
      int _1137 = (int)(_1136) & 16777215;
      float _1138 = float((uint)(uint)(_1137));
      float _1139 = _1135 * _977;
      float _1140 = _1138 * _979;
      float _1141 = _1139 - _969;
      float _1142 = _1140 - _970;
      float _1143 = _1141 + _950;
      float _1144 = _1142 + _951;
      float4 _1145 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1143, _1144, _985), 0.0f);
      float _1147 = _952 - _1145.x;
      float _1148 = max(0.0f, _1147);
      float4 _1149 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1143, _1144, _985), _992);
      float _1151 = 1.0f - _1149.x;
      float _1152 = saturate(_1151);
      half4 _1153 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1143, _1144, _985), 0.0f);
      float _1157 = _1131 + _1152;
      float _1158 = _1132 + _1148;
      uint _1159 = _967 * -1770241169;
      int _1160 = (int)(_1159) & 16777215;
      float _1161 = float((uint)(uint)(_1160));
      uint _1162 = _967 * 1357852417;
      int _1163 = (int)(_1162) & 16777215;
      float _1164 = float((uint)(uint)(_1163));
      float _1165 = _1161 * _977;
      float _1166 = _1164 * _979;
      float _1167 = _1165 - _969;
      float _1168 = _1166 - _970;
      float _1169 = _1167 + _950;
      float _1170 = _1168 + _951;
      float4 _1171 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1169, _1170, _985), 0.0f);
      float _1173 = _952 - _1171.x;
      float _1174 = max(0.0f, _1173);
      float4 _1175 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1169, _1170, _985), _992);
      float _1177 = 1.0f - _1175.x;
      float _1178 = saturate(_1177);
      half4 _1179 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1169, _1170, _985), 0.0f);
      float _1183 = _1157 + _1178;
      float _1184 = _1158 + _1174;
      uint _1185 = _967 * -601883249;
      int _1186 = (int)(_1185) & 16777215;
      float _1187 = float((uint)(uint)(_1186));
      uint _1188 = _967 * 1947444961;
      int _1189 = (int)(_1188) & 16777215;
      float _1190 = float((uint)(uint)(_1189));
      float _1191 = _1187 * _977;
      float _1192 = _1190 * _979;
      float _1193 = _1191 - _969;
      float _1194 = _1192 - _970;
      float _1195 = _1193 + _950;
      float _1196 = _1194 + _951;
      float4 _1197 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1195, _1196, _985), 0.0f);
      float _1199 = _952 - _1197.x;
      float _1200 = max(0.0f, _1199);
      float4 _1201 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1195, _1196, _985), _992);
      float _1203 = 1.0f - _1201.x;
      float _1204 = saturate(_1203);
      half4 _1205 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1195, _1196, _985), 0.0f);
      float _1209 = _1183 + _1204;
      float _1210 = _1184 + _1200;
      uint _1211 = _967 * 1166504879;
      int _1212 = (int)(_1211) & 16777215;
      float _1213 = float((uint)(uint)(_1212));
      uint _1214 = _967 * 1335763649;
      int _1215 = (int)(_1214) & 16777215;
      float _1216 = float((uint)(uint)(_1215));
      float _1217 = _1213 * _977;
      float _1218 = _1216 * _979;
      float _1219 = _1217 - _969;
      float _1220 = _1218 - _970;
      float _1221 = _1219 + _950;
      float _1222 = _1220 + _951;
      float4 _1223 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1221, _1222, _985), 0.0f);
      float _1225 = _952 - _1223.x;
      float _1226 = max(0.0f, _1225);
      float4 _1227 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1221, _1222, _985), _992);
      float _1229 = 1.0f - _1227.x;
      float _1230 = saturate(_1229);
      half4 _1231 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1221, _1222, _985), 0.0f);
      float _1235 = _1209 + _1230;
      float _1236 = _1210 + _1226;
      uint _1237 = _967 * -1696913969;
      int _1238 = (int)(_1237) & 16777215;
      float _1239 = float((uint)(uint)(_1238));
      uint _1240 = _967 * 1882071713;
      int _1241 = (int)(_1240) & 16777215;
      float _1242 = float((uint)(uint)(_1241));
      float _1243 = _1239 * _977;
      float _1244 = _1242 * _979;
      float _1245 = _1243 - _969;
      float _1246 = _1244 - _970;
      float _1247 = _1245 + _950;
      float _1248 = _1246 + _951;
      float4 _1249 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1247, _1248, _985), 0.0f);
      float _1251 = _952 - _1249.x;
      float _1252 = max(0.0f, _1251);
      float4 _1253 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1247, _1248, _985), _992);
      float _1255 = 1.0f - _1253.x;
      float _1256 = saturate(_1255);
      half4 _1257 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1247, _1248, _985), 0.0f);
      float _1261 = _1235 + _1256;
      float _1262 = _1236 + _1252;
      uint _1263 = _967 * -1959554065;
      int _1264 = (int)(_1263) & 16777215;
      float _1265 = float((uint)(uint)(_1264));
      uint _1266 = _967 * -1569511807;
      int _1267 = (int)(_1266) & 16777215;
      float _1268 = float((uint)(uint)(_1267));
      float _1269 = _1265 * _977;
      float _1270 = _1268 * _979;
      float _1271 = _1269 - _969;
      float _1272 = _1270 - _970;
      float _1273 = _1271 + _950;
      float _1274 = _1272 + _951;
      float4 _1275 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1273, _1274, _985), 0.0f);
      float _1277 = _952 - _1275.x;
      float _1278 = max(0.0f, _1277);
      float4 _1279 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1273, _1274, _985), _992);
      float _1281 = 1.0f - _1279.x;
      float _1282 = saturate(_1281);
      half4 _1283 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1273, _1274, _985), 0.0f);
      float _1287 = _1261 + _1282;
      float _1288 = _1262 + _1278;
      uint _1289 = _967 * 1318665743;
      int _1290 = (int)(_1289) & 16777215;
      float _1291 = float((uint)(uint)(_1290));
      uint _1292 = _967 * 1898753633;
      int _1293 = (int)(_1292) & 16777215;
      float _1294 = float((uint)(uint)(_1293));
      float _1295 = _1291 * _977;
      float _1296 = _1294 * _979;
      float _1297 = _1295 - _969;
      float _1298 = _1296 - _970;
      float _1299 = _1297 + _950;
      float _1300 = _1298 + _951;
      float4 _1301 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1299, _1300, _985), 0.0f);
      float _1303 = _952 - _1301.x;
      float _1304 = max(0.0f, _1303);
      float4 _1305 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1299, _1300, _985), _992);
      float _1307 = 1.0f - _1305.x;
      float _1308 = saturate(_1307);
      half4 _1309 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1299, _1300, _985), 0.0f);
      float _1313 = _1287 + _1308;
      float _1314 = _1288 + _1304;
      uint _1315 = _967 * 134521903;
      int _1316 = (int)(_1315) & 16777215;
      float _1317 = float((uint)(uint)(_1316));
      uint _1318 = _967 * -483771839;
      int _1319 = (int)(_1318) & 16777215;
      float _1320 = float((uint)(uint)(_1319));
      float _1321 = _1317 * _977;
      float _1322 = _1320 * _979;
      float _1323 = _1321 - _969;
      float _1324 = _1322 - _970;
      float _1325 = _1323 + _950;
      float _1326 = _1324 + _951;
      float4 _1327 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1325, _1326, _985), 0.0f);
      float _1329 = _952 - _1327.x;
      float _1330 = max(0.0f, _1329);
      float4 _1331 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1325, _1326, _985), _992);
      float _1333 = 1.0f - _1331.x;
      float _1334 = saturate(_1333);
      half4 _1335 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1325, _1326, _985), 0.0f);
      float _1339 = _1313 + _1334;
      float _1340 = _1314 + _1330;
      uint _1341 = _967 * -413252017;
      int _1342 = (int)(_1341) & 16777215;
      float _1343 = float((uint)(uint)(_1342));
      uint _1344 = _967 * 2034977313;
      int _1345 = (int)(_1344) & 16777215;
      float _1346 = float((uint)(uint)(_1345));
      float _1347 = _1343 * _977;
      float _1348 = _1346 * _979;
      float _1349 = _1347 - _969;
      float _1350 = _1348 - _970;
      float _1351 = _1349 + _950;
      float _1352 = _1350 + _951;
      float4 _1353 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1351, _1352, _985), 0.0f);
      float _1355 = _952 - _1353.x;
      float _1356 = max(0.0f, _1355);
      float4 _1357 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1351, _1352, _985), _992);
      float _1359 = 1.0f - _1357.x;
      float _1360 = saturate(_1359);
      half4 _1361 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1351, _1352, _985), 0.0f);
      float _1365 = _1339 + _1360;
      float _1366 = _1340 + _1356;
      uint _1367 = _967 * 192849007;
      int _1368 = (int)(_1367) & 16777215;
      float _1369 = float((uint)(uint)(_1368));
      uint _1370 = _967 * 1820286465;
      int _1371 = (int)(_1370) & 16777215;
      float _1372 = float((uint)(uint)(_1371));
      float _1373 = _1369 * _977;
      float _1374 = _1372 * _979;
      float _1375 = _1373 - _969;
      float _1376 = _1374 - _970;
      float _1377 = _1375 + _950;
      float _1378 = _1376 + _951;
      float4 _1379 = __3__36__0__0__g_dynamicShadowDepthArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1377, _1378, _985), 0.0f);
      float _1381 = _952 - _1379.x;
      float _1382 = max(0.0f, _1381);
      float4 _1383 = __3__36__0__0__g_dynamicShadowDepthArray.SampleCmpLevelZero(__3__40__0__0__g_samplerShadow, float3(_1377, _1378, _985), _992);
      float _1385 = 1.0f - _1383.x;
      float _1386 = saturate(_1385);
      half4 _1387 = __3__36__0__0__g_dynamicShadowColorArray.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_1377, _1378, _985), 0.0f);
      float _1391 = _1365 + _1386;
      float _1392 = _1366 + _1382;
      float _1393 = _1391 * 0.0625f;
      float _1394 = _1392 * 0.0625f;
      half _1395 = _1387.x * 2.0h;
      half _1396 = _1023.x + _999.x;
      half _1397 = _1396 + _1049.x;
      half _1398 = _1397 + _1075.x;
      half _1399 = _1398 + _1101.x;
      half _1400 = _1399 + _1127.x;
      half _1401 = _1400 + _1153.x;
      half _1402 = _1401 + _1179.x;
      half _1403 = _1402 + _1205.x;
      half _1404 = _1403 + _1231.x;
      half _1405 = _1404 + _1257.x;
      half _1406 = _1405 + _1283.x;
      half _1407 = _1406 + _1309.x;
      half _1408 = _1407 + _1335.x;
      half _1409 = _1408 + _1361.x;
      half _1410 = _1409 + _1395;
      half _1411 = _1387.y * 2.0h;
      half _1412 = _1023.y + _999.y;
      half _1413 = _1412 + _1049.y;
      half _1414 = _1413 + _1075.y;
      half _1415 = _1414 + _1101.y;
      half _1416 = _1415 + _1127.y;
      half _1417 = _1416 + _1153.y;
      half _1418 = _1417 + _1179.y;
      half _1419 = _1418 + _1205.y;
      half _1420 = _1419 + _1231.y;
      half _1421 = _1420 + _1257.y;
      half _1422 = _1421 + _1283.y;
      half _1423 = _1422 + _1309.y;
      half _1424 = _1423 + _1335.y;
      half _1425 = _1424 + _1361.y;
      half _1426 = _1425 + _1411;
      half _1427 = _1387.z * 2.0h;
      half _1428 = _1023.z + _999.z;
      half _1429 = _1428 + _1049.z;
      half _1430 = _1429 + _1075.z;
      half _1431 = _1430 + _1101.z;
      half _1432 = _1431 + _1127.z;
      half _1433 = _1432 + _1153.z;
      half _1434 = _1433 + _1179.z;
      half _1435 = _1434 + _1205.z;
      half _1436 = _1435 + _1231.z;
      half _1437 = _1436 + _1257.z;
      half _1438 = _1437 + _1283.z;
      half _1439 = _1438 + _1309.z;
      half _1440 = _1439 + _1335.z;
      half _1441 = _1440 + _1361.z;
      half _1442 = _1441 + _1427;
      float _1443 = float(_1410);
      float _1444 = float(_1426);
      float _1445 = float(_1442);
      float _1446 = _1443 * 0.05882352963089943f;
      float _1447 = _1444 * 0.05882352963089943f;
      float _1448 = _1445 * 0.05882352963089943f;
      half _1449 = half(_1446);
      half _1450 = half(_1447);
      half _1451 = half(_1448);
      bool _1452 = (_808 == 1);
      if (_1452) {
        float _1454 = float(_1449);
        float _1455 = float(_1450);
        float _1456 = float(_1451);
        float _1457 = -0.0f - _693;
        float _1458 = _1454 * _1457;
        float _1459 = _1455 * _1457;
        float _1460 = _1456 * _1457;
        float _1461 = _1454 + _693;
        float _1462 = _1461 + _1458;
        float _1463 = _1455 + _693;
        float _1464 = _1463 + _1459;
        float _1465 = _1456 + _693;
        float _1466 = _1465 + _1460;
        half _1467 = half(_1462);
        half _1468 = half(_1464);
        half _1469 = half(_1466);
        _1590 = _1393;
        _1591 = _1394;
        _1592 = _1467;
        _1593 = _1468;
        _1594 = _1469;
      } else {
        _1590 = _1393;
        _1591 = _1394;
        _1592 = _1449;
        _1593 = _1450;
        _1594 = _1451;
      }
    }
    bool _1595 = (_807 != 0);
    float _1596 = select(_1595, _1590, 1.0f);
    float _1597 = min(_550, _1596);
    bool _1598 = (_691 != 0);
    float _1599 = _1591 * 400.0f;
    float _1600 = select(_1595, _1599, 4e+06f);
    float _1601 = select(_1598, _1600, 1.0f);
    float _1602 = _1601 + 0.9800000190734863f;
    float _1603 = select(_166, _1602, _1601);
    float _1604 = saturate(_1603);
    float _1605 = log2(_1604);
    float _1606 = _1605 * 0.45454543828964233f;
    float _1607 = exp2(_1606);
    float _1608 = _1607 * _550;
    float _1609 = 1.0f - _550;
    float _1610 = _1609 + _1608;
    float _1611 = saturate(_1610);
    float _1614 = _shadowAOParams.x * _1597;
    float _1615 = _1597 - _1614;
    float _1616 = _1615 + _shadowAOParams.x;
    float _1617 = _146 * _150;
    float _1618 = -0.0f - _1617;
    float _1619 = _147 * _150;
    float _1620 = -0.0f - _1619;
    float _1621 = _148 * _150;
    float _1622 = -0.0f - _1621;
    float _1623 = dot(float3(_97, _98, _99), float3(_1618, _1620, _1622));
    bool _1624 = (_1616 > 0.0f);
    [branch]
    if (_1624) {
      int _1626 = _70 & 126;
      bool _1627 = (_1626 == 64);
      bool _1628 = (_74 == 66);
      bool _1629 = (_1627) || (_1628);
      float _1630 = select(_1629, 2.0f, 4.0f);
      float _1631 = select(_1629, 12.0f, 2.0f);
      bool _1634 = (_sunDirection.y > 0.0f);
      if ((_1634) || ((!(_1634)) && ((_sunDirection.y > _moonDirection.y)))) {
        _1646 = _sunDirection.x;
        _1647 = _sunDirection.y;
        _1648 = _sunDirection.z;
      } else {
        _1646 = _moonDirection.x;
        _1647 = _moonDirection.y;
        _1648 = _moonDirection.z;
      }
      int _1649 = ((int)(((uint)((_43 | _45) << 3)) + SV_GroupThreadID.x)) & 3;
      int _1652 = ((_1649 << 1) | _1649) & 5;
      int _1653 = ((int)(((uint)(((_41 << 2) | _48) << 3)) + SV_GroupThreadID.y)) & 3;
      int _1657 = (((_1653 << 1) | _1653) << 1) & 10;
      int _1661 = ((int)((_162 + ((uint)(_1657 | _1652))) << 2)) & -858993460;
      int _1662 = (uint)(_162 + ((uint)(_1657 | _1652))) >> 2;
      int _1663 = _1662 & 858993459;
      int _1666 = ((int)(((uint)(_1661 | _1663)) << 1)) & 10;
      int _1667 = (uint)((uint)(_1661 | _1663)) >> 1;
      int _1668 = _1667 & 21;
      float _1670 = float((uint)(uint)(_frameNumber.x));
      float _1671 = _1670 * 92.0f;
      float _1672 = _1670 * 71.0f;
      float _1673 = _1671 + _54;
      float _1674 = _1672 + _55;
      float _1675 = _1673 * 0.0078125f;
      float _1676 = _1674 * 0.0078125f;
      float _1677 = frac(_1675);
      float _1678 = frac(_1676);
      float _1679 = _1677 * 128.0f;
      float _1680 = _1678 * 128.0f;
      float _1681 = _1679 + -64.34062194824219f;
      float _1682 = _1680 + -72.46562194824219f;
      float _1683 = _1681 * _1681;
      float _1684 = _1682 * _1682;
      float _1685 = _1682 * _1681;
      float _1686 = dot(float3(_1683, _1684, _1685), float3(20.390625f, 60.703125f, 2.4281208515167236f));
      float _1687 = frac(_1686);
      float _1688 = _1687 * 51540816.0f;
      float _1689 = _1687 * 287478368.0f;
      uint _1690 = uint(_1688);
      uint _1691 = uint(_1689);
      float _1692 = float((uint)((uint)(_1666 | _1668)));
      float _1693 = _1692 * 0.03125f;
      int _1694 = (int)(_1690) & 65535;
      float _1695 = float((uint)(uint)(_1694));
      float _1696 = _1695 * 1.52587890625e-05f;
      float _1697 = _1696 + _1693;
      float _1698 = frac(_1697);
      int _1699 = reversebits((float)(_1666 | _1668));
      int _1700 = _1699 ^ (int)(_1691);
      float _1701 = float((uint)(uint)(_1700));
      float _1703 = _1698 * 6.2831854820251465f;
      float _1704 = 1.0f - _shadowAOParams.z;
      float _1705 = _1704 * 2.3283064365386963e-10f;
      float _1706 = _1705 * _1701;
      float _1707 = _1706 + _shadowAOParams.z;
      float _1708 = _1707 * _1707;
      float _1709 = 1.0f - _1708;
      float _1710 = sqrt(_1709);
      float _1711 = sin(_1703);
      float _1712 = cos(_1703);
      float _1713 = _1712 * _1710;
      float _1714 = _1711 * _1710;
      bool _1715 = (_1648 >= 0.0f);
      float _1716 = select(_1715, 1.0f, -1.0f);
      float _1717 = _1716 + _1648;
      float _1718 = 1.0f / _1717;
      float _1719 = -0.0f - _1718;
      float _1720 = _1647 * _1719;
      float _1721 = _1720 * _1646;
      float _1722 = _1716 * _1646;
      float _1723 = _1722 * _1646;
      float _1724 = _1723 * _1719;
      float _1725 = _1724 + 1.0f;
      float _1726 = _1720 * _1647;
      float _1727 = _1716 + _1726;
      float _1728 = -0.0f - _1647;
      float _1729 = _1725 * _1713;
      float _1730 = mad(_1714, _1721, _1729);
      float _1731 = mad(_1707, _1646, _1730);
      float _1732 = _1713 * _1716;
      float _1733 = _1732 * _1721;
      float _1734 = mad(_1714, _1727, _1733);
      float _1735 = mad(_1707, _1647, _1734);
      float _1736 = _1722 * _1713;
      float _1737 = -0.0f - _1736;
      float _1738 = mad(_1714, _1728, _1737);
      float _1739 = mad(_1707, _1648, _1738);
      float _1740 = _109 * 0.0024999999441206455f;
      float _1741 = _1740 + 0.25f;
      float _1742 = min(0.5f, _1741);
      float _1743 = abs(_1647);
      float _1744 = _1631 - _1630;
      float _1745 = _1743 * _1744;
      float _1746 = _1745 + _1630;
      float _1747 = select(_166, 0.009999999776482582f, 0.10000000149011612f);
      float _1748 = _1746 * _1747;
      if (!_166) {
        bool _1751 = ((uint)(_74 + -11) < (uint)9);
        float _1752 = select(_1751, 0.00800000037997961f, 0.029999999329447746f);
        float _1753 = _109 * _1752;
        float _1754 = max(_1753, _1748);
        _1756 = _1754;
      } else {
        _1756 = _1748;
      }
      float _1757 = _109 * 0.009999999776482582f;
      float _1758 = saturate(_1623);
      float _1759 = 1.0f - _1758;
      float _1760 = _1757 * _1759;
      float _1761 = _1760 + 0.009999999776482582f;
      float _1762 = saturate(_1761);
      bool _1766 = ((_74 != 15) && ((uint)(_74 + -12) < (uint)7));
      bool _1769 = (_terrainNormalParams.z > 0.0f);
      if (_1769) {
        uint _1771 = _frameNumber.x * 73;
        int _1772 = (int)(_1771) & 255;
        float _1773 = float((uint)(uint)(_1772));
        float _1774 = _1773 * 32.665000915527344f;
        float _1775 = _1773 * 11.8149995803833f;
        float _1776 = _1774 + _54;
        float _1777 = _1775 + _55;
        float _1778 = dot(float2(_1776, _1777), float2(0.0671105608344078f, 0.005837149918079376f));
        float _1779 = frac(_1778);
        float _1780 = _1779 * 52.98291778564453f;
        float _1781 = frac(_1780);
        _1799 = _1781;
      } else {
        if (_946) {
          int _1787 = ((int)((((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
          int _1788 = (uint)((uint)(_943) + ((uint)(_927) + ((uint)(_911) + ((uint)(_895) + ((uint)(_879) + ((uint)(_863) + ((uint)(_847) + ((uint)(_831) + (uint)(_frameNumber.x))))))))) >> 5;
          int _1790 = _1787 ^ (_1788 + -939442524);
          _1793 = ((int)((uint)(_1790) + ((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816))))))))));
        } else {
          _1793 = ((int)((uint)(_935) + ((uint)(_919) + ((uint)(_903) + ((uint)(_887) + ((uint)(_871) + ((uint)(_855) + ((uint)(_839) + ((uint)(_823) + _816)))))))));
        }
        uint _1794 = _1793 * 48271;
        int _1795 = (int)(_1794) & 16777215;
        float _1796 = float((uint)(uint)(_1795));
        float _1797 = _1796 * 5.960464477539063e-08f;
        _1799 = _1797;
      }
      bool _1800 = (_1628) || (_1766);
      if (_1800) {
        float _1802 = _1799 * 10.0f;
        _1812 = _1802;
      } else {
        bool _1804 = (_74 == 15);
        if (_1804) {
          float _1806 = _109 * 0.0010000000474974513f;
          float _1807 = saturate(_1806);
          float _1808 = _1807 * 9.0f;
          float _1809 = 10.0f - _1808;
          float _1810 = _1809 * _1799;
          _1812 = _1810;
        } else {
          _1812 = _1799;
        }
      }
      float _1813 = abs(_1735);
      float _1814 = _1813 * 0.05000000074505806f;
      float _1815 = 0.10000000149011612f - _1814;
      bool _1816 = (_1626 == 12);
      if (_1816) {
        _1825 = _1815;
      } else {
        bool _1818 = ((uint)_74 > (uint)15);
        if (_1818) {
          bool _1822 = (((uint)_74 < (uint)20) || (_74 == 107));
          if (_1822) {
            _1825 = _1815;
          } else {
            _1825 = 0.0f;
          }
        } else {
          _1825 = 0.0f;
        }
      }
      if (!_166) {
        float _1827 = _1825 * _150;
        float _1828 = _1827 * _146;
        float _1829 = _1827 * _147;
        float _1830 = _1827 * _148;
        float _1831 = _146 - _1828;
        float _1832 = _147 - _1829;
        float _1833 = _148 - _1830;
        _1835 = _1831;
        _1836 = _1832;
        _1837 = _1833;
      } else {
        _1835 = _146;
        _1836 = _147;
        _1837 = _148;
      }
      if (!_1769) {
        float _1839 = _109 * 0.0625f;
        float _1840 = saturate(_1839);
        float _1841 = _1840 * 0.05000000074505806f;
        float _1842 = _1841 * _97;
        float _1843 = _1841 * _98;
        float _1844 = _1841 * _99;
        _1846 = _1842;
        _1847 = _1843;
        _1848 = _1844;
      } else {
        _1846 = 0.0f;
        _1847 = 0.0f;
        _1848 = 0.0f;
      }
      float _1849 = _1846 + _1835;
      float _1850 = _1847 + _1836;
      float _1851 = _1848 + _1837;
      bool _1852 = (_109 < 8.0f);
      float _1861 = (_viewRelative[2].x) * _1849;
      float _1862 = mad((_viewRelative[2].y), _1850, _1861);
      float _1863 = mad((_viewRelative[2].z), _1851, _1862);
      float _1864 = _1863 + (_viewRelative[2].w);
      float _1865 = (_viewRelative[2].x) * _1731;
      float _1866 = mad((_viewRelative[2].y), _1735, _1865);
      float _1867 = mad((_viewRelative[2].z), _1739, _1866);
      float _1868 = _1867 * _1756;
      float _1869 = _1868 + _1864;
      bool _1870 = (_1869 < _nearFarProj.x);
      if (_1852) {
        float _1872 = _nearFarProj.x - _1864;
        float _1873 = _1872 / _1867;
        float _1874 = select(_1870, _1873, _1756);
        float _1895 = (_viewProjRelative[0].x) * _1849;
        float _1896 = mad((_viewProjRelative[0].y), _1850, _1895);
        float _1897 = mad((_viewProjRelative[0].z), _1851, _1896);
        float _1898 = _1897 + (_viewProjRelative[0].w);
        float _1899 = (_viewProjRelative[1].x) * _1849;
        float _1900 = mad((_viewProjRelative[1].y), _1850, _1899);
        float _1901 = mad((_viewProjRelative[1].z), _1851, _1900);
        float _1902 = _1901 + (_viewProjRelative[1].w);
        float _1903 = (_viewProjRelative[2].x) * _1849;
        float _1904 = mad((_viewProjRelative[2].y), _1850, _1903);
        float _1905 = mad((_viewProjRelative[2].z), _1851, _1904);
        float _1906 = _1905 + (_viewProjRelative[2].w);
        float _1907 = (_viewProjRelative[3].x) * _1849;
        float _1908 = mad((_viewProjRelative[3].y), _1850, _1907);
        float _1909 = mad((_viewProjRelative[3].z), _1851, _1908);
        float _1910 = _1909 + (_viewProjRelative[3].w);
        float _1911 = _1874 * _1731;
        float _1912 = _1874 * _1735;
        float _1913 = _1874 * _1739;
        float _1914 = _1911 + _1849;
        float _1915 = _1912 + _1850;
        float _1916 = _1913 + _1851;
        float _1917 = (_viewProjRelative[0].x) * _1914;
        float _1918 = mad((_viewProjRelative[0].y), _1915, _1917);
        float _1919 = mad((_viewProjRelative[0].z), _1916, _1918);
        float _1920 = _1919 + (_viewProjRelative[0].w);
        float _1921 = (_viewProjRelative[1].x) * _1914;
        float _1922 = mad((_viewProjRelative[1].y), _1915, _1921);
        float _1923 = mad((_viewProjRelative[1].z), _1916, _1922);
        float _1924 = _1923 + (_viewProjRelative[1].w);
        float _1925 = (_viewProjRelative[2].x) * _1914;
        float _1926 = mad((_viewProjRelative[2].y), _1915, _1925);
        float _1927 = mad((_viewProjRelative[2].z), _1916, _1926);
        float _1928 = _1927 + (_viewProjRelative[2].w);
        float _1929 = (_viewProjRelative[3].x) * _1914;
        float _1930 = mad((_viewProjRelative[3].y), _1915, _1929);
        float _1931 = mad((_viewProjRelative[3].z), _1916, _1930);
        float _1932 = _1931 + (_viewProjRelative[3].w);
        float _1933 = _1898 / _1910;
        float _1934 = _1902 / _1910;
        float _1935 = _1906 / _1910;
        float _1936 = _1920 / _1932;
        float _1937 = _1924 / _1932;
        float _1938 = _1928 / _1932;
        float _1939 = _1936 - _1933;
        float _1940 = _1937 - _1934;
        float _1941 = _1938 - _1935;
        float _1942 = abs(_1939);
        float _1943 = abs(_1940);
        float _1944 = _bufferSizeAndInvSize.x * 0.5f;
        float _1945 = _1944 * _1942;
        float _1946 = _bufferSizeAndInvSize.y * 0.5f;
        float _1947 = _1946 * _1943;
        float _1948 = max(_1945, _1947);
        float _1949 = _1948 * 0.125f;
        float _1950 = min(1.0f, _1949);
        float _1951 = 1.0f / _1950;
        float _1952 = max(0.125f, _1951);
        float _1953 = _1952 * _1941;
        float _1954 = _1933 * 0.5f;
        float _1955 = _1934 * 0.5f;
        float _1956 = _1954 + 0.5f;
        float _1957 = 0.5f - _1955;
        float _1961 = mad((_proj[2].z), _109, 0.0f);
        float _1962 = mad((_proj[3].z), _109, 0.0f);
        float _1963 = _1961 + _1906;
        float _1964 = _1962 + _1910;
        float _1965 = _1963 / _1964;
        float _1966 = _1935 - _1965;
        float _1967 = abs(_1953);
        float _1968 = max(_1967, _1966);
        float _1969 = _1742 * 0.125f;
        float _1970 = _1969 * _1968;
        float _1971 = _1939 * 0.0625f;
        float _1972 = _1971 * _1952;
        float _1973 = _1940 * -0.0625f;
        float _1974 = _1973 * _1952;
        float _1975 = _1953 * 0.125f;
        float _1976 = abs(_1972);
        float _1977 = abs(_1974);
        float _1978 = _1976 * _bufferSizeAndInvSize.x;
        float _1979 = _1977 * _bufferSizeAndInvSize.y;
        float _1980 = max(_1978, _1979);
        float _1981 = 1.0f / _1980;
        float _1982 = max(_1812, _1981);
        float _1983 = _1982 * _1972;
        float _1984 = _1982 * _1974;
        float _1985 = _1982 * _1975;
        float _1986 = _1956 + _1983;
        float _1987 = _1957 + _1984;
        float _1988 = _1985 + _1935;
        float _1989 = 0.5f / _bufferSizeAndInvSize.x;
        _1991 = 0;
        _1992 = _1986;
        _1993 = _1987;
        _1994 = _1988;
        _1995 = _1812;
        _1996 = _1762;
        _1997 = 0;
        _1998 = 1.0f;
        _1999 = 0.0f;
        while(true) {
          float _2000 = 1.0f - _1989;
          float _2001 = max(_1992, _1989);
          float _2002 = min(_2001, _2000);
          float _2003 = _2002 * _bufferSizeAndInvSize.x;
          float _2004 = _1993 * _bufferSizeAndInvSize.y;
          int _2005 = int(_2003);
          int _2006 = int(_2004);
          uint _2008 = __3__36__0__0__g_depthStencil.Load(int3(_2005, _2006, 0));
          int _2010 = (uint)((uint)(_2008.x)) >> 24;
          int _2011 = _2008.x & 16777215;
          float _2012 = float((uint)(uint)(_2011));
          float _2013 = _2012 * 5.960465188081798e-08f;
          int _2014 = _2010 & 127;
          bool _2015 = (_1997 == 0);
          float _2016 = select(_2015, 1.0f, _1996);
          float _2019 = max(1.0000000116860974e-07f, _2013);
          float _2020 = _nearFarProj.x / _2019;
          float _2021 = _1994 - _2013;
          float _2022 = max(1.0000000116860974e-07f, _1994);
          float _2023 = _nearFarProj.x / _2022;
          float _2024 = _2020 - _2023;
          float _2025 = _2021 + _1970;
          float _2026 = abs(_2025);
          bool _2027 = (_2026 < _1970);
          int _2028 = (int)(uint)((int)(_2027));
          if (_2027) {
            int _2030 = _2010 & 126;
            bool _2031 = (_2030 == 66);
            bool _2033 = ((uint)(_2014 + -5) < (uint)2);
            bool _2035 = ((uint)(_2014 + -27) < (uint)2);
            int _2036 = _2010 & 125;
            bool _2037 = (_2036 == 105);
            bool _2041 = ((_2014 == 18) || ((uint)(_2014 + -19) < (uint)2));
            bool _2044 = ((_2014 == 106) || (_2037) || (_2041));
            bool _2049 = ((_2014 == 107) || ((_2014 == 26) || (_2035) || (_2044)));
            bool _2050 = (_2033) || (_2049);
            bool _2055 = ((_2014 == 7) || ((_2014 == 54) || (_2031) || (_2050)));
            if (_2055) {
              _2062 = true;
              float _2063 = select(_2062, -0.07999999821186066f, -1.0f);
              bool _2064 = (_2024 < 0.0f);
              bool _2065 = (_2024 > _2063);
              bool _2066 = (_2064) && (_2065);
              int _2067 = (int)(uint)((int)(_2066));
              _2069 = _2067;
            } else {
              bool _2058 = ((uint)(_2014 + -53) < (uint)14);
              if (_2058) {
                bool _2060 = (_2020 < 32.0f);
                _2062 = _2060;
                float _2063 = select(_2062, -0.07999999821186066f, -1.0f);
                bool _2064 = (_2024 < 0.0f);
                bool _2065 = (_2024 > _2063);
                bool _2066 = (_2064) && (_2065);
                int _2067 = (int)(uint)((int)(_2066));
                _2069 = _2067;
              } else {
                _2069 = _2028;
              }
            }
          } else {
            _2069 = _2028;
          }
          bool _2070 = (_2069 == 0);
          if (!_2070) {
            bool _2072 = ((uint)_2014 > (uint)11);
            if (_2072) {
              bool _2074 = ((uint)_2014 < (uint)18);
              if (!_2074) {
                bool _2083 = ((_2014 == 18) || ((_2014 == 107) || ((uint)(_2014 + -19) < (uint)2)));
                if (!_2083) {
                  bool _2085 = (_2014 == 66);
                  if (!_2085) {
                    _2088 = 0.0f;
                  } else {
                    _2088 = 0.10000000149011612f;
                  }
                } else {
                  _2088 = 0.15000000596046448f;
                }
              } else {
                _2088 = 0.10000000149011612f;
              }
            } else {
              bool _2076 = (_2014 == 11);
              if (!_2076) {
                _2088 = 0.0f;
              } else {
                _2088 = 0.10000000149011612f;
              }
            }
            float _2089 = _2020 * 0.015625f;
            float _2090 = saturate(_2089);
            float _2091 = 1.0f - _2090;
            float _2092 = _2090 * _2088;
            float _2093 = _2091 + _2092;
            float _2094 = _2093 * _2093;
            float _2095 = _2094 * _2088;
            float _2096 = 1.0f - _2095;
            float _2097 = saturate(_2096);
            if (_166) {
              float _2099 = -0.0f - _2024;
              float _2100 = _1995 * 0.004654859658330679f;
              float _2101 = _2099 / _2100;
              float _2102 = saturate(_2101);
              _2104 = _2102;
            } else {
              _2104 = 1.0f;
            }
            float _2105 = 1.0f - _1999;
            float _2106 = _2097 * _2105;
            float _2107 = _2106 * _2104;
            float _2108 = _2107 + _1999;
            float _2109 = saturate(_2108);
            _2111 = _2014;
            _2112 = _2109;
          } else {
            _2111 = _1991;
            _2112 = _1999;
          }
          bool _2113 = (_2112 > 0.949999988079071f);
          [branch]
          if (_2113) {
            if (!_2015) {
              float _2116 = _1998 - _2021;
              float _2117 = _1998 / _2116;
              float _2118 = saturate(_2117);
              float _2119 = min(_1995, _2016);
              float _2120 = _2118 - _2119;
              _2142 = _2120;
            } else {
              _2142 = 0.0f;
            }
            float _2143 = _2142 * _1972;
            float _2144 = _2142 * _1974;
            float _2145 = _2142 * _1975;
            float _2146 = _2143 + _1992;
            float _2147 = _2144 + _1993;
            float _2148 = _2145 + _1994;
            _2430 = _2014;
            _2431 = _2112;
            _2432 = _2146;
            _2433 = _2147;
            _2434 = _2148;
            _2435 = _2013;
          } else {
            bool _2122 = ((uint)_1997 < (uint)7);
            if (_2122) {
              float _2124 = abs(_1975);
              float _2125 = min(_2124, _2021);
              float _2126 = _2016 * _1972;
              float _2127 = _2016 * _1974;
              float _2128 = _2016 * _1975;
              float _2129 = _2126 + _1992;
              float _2130 = _2127 + _1993;
              float _2131 = _2128 + _1994;
              float _2132 = _2016 + _1995;
              _2134 = _2129;
              _2135 = _2130;
              _2136 = _2131;
              _2137 = _2132;
              _2138 = _2125;
            } else {
              _2134 = _1992;
              _2135 = _1993;
              _2136 = _1994;
              _2137 = _1995;
              _2138 = _1998;
            }
            bool _2140 = ((uint)(_1997 + 1) < (uint)8);
            if (_2140) {
              _1991 = _2111;
              _1992 = _2134;
              _1993 = _2135;
              _1994 = _2136;
              _1995 = _2137;
              _1996 = _2016;
              _1997 = (_1997 + 1);
              _1998 = _2138;
              _1999 = _2112;
              continue;
            } else {
              _2430 = _2111;
              _2431 = _2112;
              _2432 = _1992;
              _2433 = _1993;
              _2434 = _1994;
              _2435 = _2013;
            }
          }
          break;
        }
      } else {
        float _2150 = _nearFarProj.x - _1864;
        float _2151 = _2150 / _1867;
        float _2152 = select(_1870, _2151, _1756);
        float _2173 = (_viewProjRelative[0].x) * _1849;
        float _2174 = mad((_viewProjRelative[0].y), _1850, _2173);
        float _2175 = mad((_viewProjRelative[0].z), _1851, _2174);
        float _2176 = _2175 + (_viewProjRelative[0].w);
        float _2177 = (_viewProjRelative[1].x) * _1849;
        float _2178 = mad((_viewProjRelative[1].y), _1850, _2177);
        float _2179 = mad((_viewProjRelative[1].z), _1851, _2178);
        float _2180 = _2179 + (_viewProjRelative[1].w);
        float _2181 = (_viewProjRelative[2].x) * _1849;
        float _2182 = mad((_viewProjRelative[2].y), _1850, _2181);
        float _2183 = mad((_viewProjRelative[2].z), _1851, _2182);
        float _2184 = _2183 + (_viewProjRelative[2].w);
        float _2185 = (_viewProjRelative[3].x) * _1849;
        float _2186 = mad((_viewProjRelative[3].y), _1850, _2185);
        float _2187 = mad((_viewProjRelative[3].z), _1851, _2186);
        float _2188 = _2187 + (_viewProjRelative[3].w);
        float _2189 = _2152 * _1731;
        float _2190 = _2152 * _1735;
        float _2191 = _2152 * _1739;
        float _2192 = _2189 + _1849;
        float _2193 = _2190 + _1850;
        float _2194 = _2191 + _1851;
        float _2195 = (_viewProjRelative[0].x) * _2192;
        float _2196 = mad((_viewProjRelative[0].y), _2193, _2195);
        float _2197 = mad((_viewProjRelative[0].z), _2194, _2196);
        float _2198 = _2197 + (_viewProjRelative[0].w);
        float _2199 = (_viewProjRelative[1].x) * _2192;
        float _2200 = mad((_viewProjRelative[1].y), _2193, _2199);
        float _2201 = mad((_viewProjRelative[1].z), _2194, _2200);
        float _2202 = _2201 + (_viewProjRelative[1].w);
        float _2203 = (_viewProjRelative[2].x) * _2192;
        float _2204 = mad((_viewProjRelative[2].y), _2193, _2203);
        float _2205 = mad((_viewProjRelative[2].z), _2194, _2204);
        float _2206 = _2205 + (_viewProjRelative[2].w);
        float _2207 = (_viewProjRelative[3].x) * _2192;
        float _2208 = mad((_viewProjRelative[3].y), _2193, _2207);
        float _2209 = mad((_viewProjRelative[3].z), _2194, _2208);
        float _2210 = _2209 + (_viewProjRelative[3].w);
        float _2211 = _2176 / _2188;
        float _2212 = _2180 / _2188;
        float _2213 = _2184 / _2188;
        float _2214 = _2198 / _2210;
        float _2215 = _2202 / _2210;
        float _2216 = _2206 / _2210;
        float _2217 = _2214 - _2211;
        float _2218 = _2215 - _2212;
        float _2219 = _2216 - _2213;
        float _2220 = abs(_2217);
        float _2221 = abs(_2218);
        float _2222 = _bufferSizeAndInvSize.x * 0.5f;
        float _2223 = _2222 * _2220;
        float _2224 = _bufferSizeAndInvSize.y * 0.5f;
        float _2225 = _2224 * _2221;
        float _2226 = max(_2223, _2225);
        float _2227 = _2226 * 0.125f;
        float _2228 = min(1.0f, _2227);
        float _2229 = 1.0f / _2228;
        float _2230 = max(0.125f, _2229);
        float _2231 = _2230 * _2219;
        float _2232 = _2211 * 0.5f;
        float _2233 = _2212 * 0.5f;
        float _2234 = _2232 + 0.5f;
        float _2235 = 0.5f - _2233;
        float _2239 = mad((_proj[2].z), _109, 0.0f);
        float _2240 = mad((_proj[3].z), _109, 0.0f);
        float _2241 = _2239 + _2184;
        float _2242 = _2240 + _2188;
        float _2243 = _2241 / _2242;
        float _2244 = _2213 - _2243;
        float _2245 = abs(_2231);
        float _2246 = max(_2245, _2244);
        float _2247 = _1742 * 0.0625f;
        float _2248 = _2247 * _2246;
        float _2249 = _2217 * 0.0625f;
        float _2250 = _2249 * _2230;
        float _2251 = _2218 * -0.0625f;
        float _2252 = _2251 * _2230;
        float _2253 = _2231 * 0.125f;
        float _2254 = abs(_2250);
        float _2255 = abs(_2252);
        float _2256 = _2254 * _bufferSizeAndInvSize.x;
        float _2257 = _2255 * _bufferSizeAndInvSize.y;
        float _2258 = max(_2256, _2257);
        float _2259 = 1.0f / _2258;
        float _2260 = max(_1812, _2259);
        float _2261 = _2260 * _2250;
        float _2262 = _2260 * _2252;
        float _2263 = _2260 * _2253;
        float _2264 = _2234 + _2261;
        float _2265 = _2235 + _2262;
        float _2266 = _2263 + _2213;
        float _2267 = 0.5f / _bufferSizeAndInvSize.x;
        _2269 = 0;
        _2270 = _1762;
        _2271 = _1812;
        _2272 = _2264;
        _2273 = _2265;
        _2274 = _2266;
        _2275 = 0;
        _2276 = 1.0f;
        _2277 = 0.0f;
        while(true) {
          float _2278 = 1.0f - _2267;
          float _2279 = max(_2272, _2267);
          float _2280 = min(_2279, _2278);
          float _2281 = _2280 * _bufferSizeAndInvSize.x;
          float _2282 = _2273 * _bufferSizeAndInvSize.y;
          int _2283 = int(_2281);
          int _2284 = int(_2282);
          uint _2286 = __3__36__0__0__g_depthStencil.Load(int3(_2283, _2284, 0));
          int _2288 = (uint)((uint)(_2286.x)) >> 24;
          int _2289 = _2286.x & 16777215;
          float _2290 = float((uint)(uint)(_2289));
          float _2291 = _2290 * 5.960465188081798e-08f;
          int _2292 = _2288 & 127;
          bool _2293 = (_2269 == 0);
          float _2294 = select(_2293, 1.0f, _2270);
          float _2295 = _2274 - _2291;
          float _2298 = max(1.0000000116860974e-07f, _2291);
          float _2299 = _nearFarProj.x / _2298;
          float _2300 = max(1.0000000116860974e-07f, _2274);
          float _2301 = _nearFarProj.x / _2300;
          float _2302 = _2299 - _2301;
          float _2303 = _2295 + _2248;
          float _2304 = abs(_2303);
          bool _2305 = (_2304 < _2248);
          int _2306 = (int)(uint)((int)(_2305));
          if (_2305) {
            int _2308 = _2288 & 126;
            bool _2309 = (_2308 == 66);
            bool _2311 = ((uint)(_2292 + -5) < (uint)2);
            bool _2313 = ((uint)(_2292 + -27) < (uint)2);
            int _2314 = _2288 & 125;
            bool _2315 = (_2314 == 105);
            bool _2319 = ((_2292 == 18) || ((uint)(_2292 + -19) < (uint)2));
            bool _2322 = ((_2292 == 106) || (_2315) || (_2319));
            bool _2327 = ((_2292 == 107) || ((_2292 == 26) || (_2313) || (_2322)));
            bool _2328 = (_2311) || (_2327);
            bool _2333 = ((_2292 == 7) || ((_2292 == 54) || (_2309) || (_2328)));
            if (_2333) {
              _2340 = true;
              float _2341 = select(_2340, -0.07999999821186066f, -1.0f);
              bool _2342 = (_2302 < 0.0f);
              bool _2343 = (_2302 > _2341);
              bool _2344 = (_2342) && (_2343);
              int _2345 = (int)(uint)((int)(_2344));
              _2347 = _2345;
            } else {
              bool _2336 = ((uint)(_2292 + -53) < (uint)14);
              if (_2336) {
                bool _2338 = (_2299 < 32.0f);
                _2340 = _2338;
                float _2341 = select(_2340, -0.07999999821186066f, -1.0f);
                bool _2342 = (_2302 < 0.0f);
                bool _2343 = (_2302 > _2341);
                bool _2344 = (_2342) && (_2343);
                int _2345 = (int)(uint)((int)(_2344));
                _2347 = _2345;
              } else {
                _2347 = _2306;
              }
            }
          } else {
            _2347 = _2306;
          }
          bool _2348 = (_2347 == 0);
          if (!_2348) {
            bool _2350 = ((uint)_2292 > (uint)11);
            if (_2350) {
              bool _2352 = ((uint)_2292 < (uint)18);
              if (!_2352) {
                bool _2361 = ((_2292 == 18) || ((_2292 == 107) || ((uint)(_2292 + -19) < (uint)2)));
                if (!_2361) {
                  bool _2363 = (_2292 == 66);
                  if (!_2363) {
                    _2366 = 0.0f;
                  } else {
                    _2366 = 0.10000000149011612f;
                  }
                } else {
                  _2366 = 0.15000000596046448f;
                }
              } else {
                _2366 = 0.10000000149011612f;
              }
            } else {
              bool _2354 = (_2292 == 11);
              if (!_2354) {
                _2366 = 0.0f;
              } else {
                _2366 = 0.10000000149011612f;
              }
            }
            float _2367 = _2299 * 0.015625f;
            float _2368 = saturate(_2367);
            float _2369 = 1.0f - _2368;
            float _2370 = _2368 * _2366;
            float _2371 = _2369 + _2370;
            float _2372 = _2371 * _2371;
            float _2373 = _2372 * _2366;
            float _2374 = 1.0f - _2373;
            float _2375 = saturate(_2374);
            if (_166) {
              float _2377 = -0.0f - _2302;
              float _2378 = _2271 * 0.004654859658330679f;
              float _2379 = _2377 / _2378;
              float _2380 = saturate(_2379);
              _2382 = _2380;
            } else {
              _2382 = 1.0f;
            }
            float _2383 = 1.0f - _2277;
            float _2384 = _2375 * _2383;
            float _2385 = _2384 * _2382;
            float _2386 = _2385 + _2277;
            float _2387 = saturate(_2386);
            _2389 = _2292;
            _2390 = _2387;
          } else {
            _2389 = _2275;
            _2390 = _2277;
          }
          bool _2391 = (_2390 > 0.949999988079071f);
          [branch]
          if (_2391) {
            if (!_2293) {
              float _2394 = _2276 - _2295;
              float _2395 = _2276 / _2394;
              float _2396 = saturate(_2395);
              float _2397 = min(_2271, _2294);
              float _2398 = _2396 - _2397;
              _2420 = _2398;
            } else {
              _2420 = 0.0f;
            }
            float _2421 = _2420 * _2250;
            float _2422 = _2420 * _2252;
            float _2423 = _2420 * _2253;
            float _2424 = _2421 + _2272;
            float _2425 = _2422 + _2273;
            float _2426 = _2423 + _2274;
            _2430 = _2292;
            _2431 = _2390;
            _2432 = _2424;
            _2433 = _2425;
            _2434 = _2426;
            _2435 = _2291;
          } else {
            bool _2400 = ((uint)_2269 < (uint)7);
            if (_2400) {
              float _2402 = abs(_2253);
              float _2403 = min(_2402, _2295);
              float _2404 = _2294 * _2250;
              float _2405 = _2294 * _2252;
              float _2406 = _2294 * _2253;
              float _2407 = _2272 + _2404;
              float _2408 = _2273 + _2405;
              float _2409 = _2274 + _2406;
              float _2410 = _2271 + _2294;
              _2412 = _2410;
              _2413 = _2407;
              _2414 = _2408;
              _2415 = _2409;
              _2416 = _2403;
            } else {
              _2412 = _2271;
              _2413 = _2272;
              _2414 = _2273;
              _2415 = _2274;
              _2416 = _2276;
            }
            bool _2418 = ((uint)(_2269 + 1) < (uint)8);
            if (_2418) {
              _2269 = (_2269 + 1);
              _2270 = _2294;
              _2271 = _2412;
              _2272 = _2413;
              _2273 = _2414;
              _2274 = _2415;
              _2275 = _2389;
              _2276 = _2416;
              _2277 = _2390;
              continue;
            } else {
              _2430 = _2389;
              _2431 = _2390;
              _2432 = 0.0f;
              _2433 = 0.0f;
              _2434 = -1.0f;
              _2435 = 0.0f;
            }
          }
          break;
        }
      }
      float _2436 = _109 * 0.01899999938905239f;
      float _2437 = _2436 + 0.10000000149011612f;
      bool _2438 = (_2434 > 0.0f);
      bool _2439 = (_2431 > 0.0f);
      if (_2438) {
        bool _2441 = (_2432 <= 1.0f);
        bool _2442 = (_2433 <= 1.0f);
        bool _2443 = (_2432 >= 0.0f);
        bool _2444 = (_2433 >= 0.0f);
        bool _2447 = ((_2443) && (_2441) && (_2444) && (_2442));
        bool _2448 = (_2439) || (_2447);
        if (_2448) {
          float _2451 = _2432 * 2.0f;
          float _2452 = _2433 * 2.0f;
          float _2453 = _2451 + -1.0f;
          float _2454 = 1.0f - _2452;
          float _2455 = _2453 * (_invViewProjRelative[0].x);
          float _2456 = mad((_invViewProjRelative[0].y), _2454, _2455);
          float _2457 = mad((_invViewProjRelative[0].z), _2434, _2456);
          float _2458 = _2457 + (_invViewProjRelative[0].w);
          float _2459 = _2453 * (_invViewProjRelative[1].x);
          float _2460 = mad((_invViewProjRelative[1].y), _2454, _2459);
          float _2461 = mad((_invViewProjRelative[1].z), _2434, _2460);
          float _2462 = _2461 + (_invViewProjRelative[1].w);
          float _2463 = _2453 * (_invViewProjRelative[2].x);
          float _2464 = mad((_invViewProjRelative[2].y), _2454, _2463);
          float _2465 = mad((_invViewProjRelative[2].z), _2434, _2464);
          float _2466 = _2465 + (_invViewProjRelative[2].w);
          float _2467 = _2453 * (_invViewProjRelative[3].x);
          float _2468 = mad((_invViewProjRelative[3].y), _2454, _2467);
          float _2469 = mad((_invViewProjRelative[3].z), _2434, _2468);
          float _2470 = _2469 + (_invViewProjRelative[3].w);
          float _2471 = _2458 / _2470;
          float _2472 = _2462 / _2470;
          float _2473 = _2466 / _2470;
          float _2476 = max(1.0000000116860974e-07f, _2434);
          float _2477 = _nearFarProj.x / _2476;
          float _2478 = max(1.0000000116860974e-07f, _2435);
          float _2479 = _nearFarProj.x / _2478;
          float _2480 = _2479 - _2477;
          bool _2481 = (_2430 == 2);
          if (!_2481) {
            bool _2483 = (_2430 == 3);
            if (_2483) {
              _2496 = 0.0f;
              _2498 = _2496;
            } else {
              bool _2485 = (_2430 == 21);
              if (_2485) {
                bool _2494 = (_74 == 21);
                if (!_2494) {
                  _2496 = 0.0f;
                  _2498 = _2496;
                } else {
                  _2498 = 20.0f;
                }
              } else {
                bool _2489 = (_2430 == 22);
                float _2490 = select(_2489, 0.0f, 1.0f);
                bool _2491 = (_74 == 22);
                bool _2492 = (_2491) && (_2489);
                if (!_2492) {
                  _2496 = _2490;
                  _2498 = _2496;
                } else {
                  _2498 = 20.0f;
                }
              }
            }
          } else {
            bool _2487 = (_74 == 2);
            if (!_2487) {
              _2496 = 0.0f;
              _2498 = _2496;
            } else {
              _2498 = 20.0f;
            }
          }
          float _2499 = _2498 * _2480;
          float _2500 = _2437 + _2499;
          float _2501 = min(0.0f, _2500);
          float _2502 = _2501 * 1.4426950216293335f;
          float _2503 = exp2(_2502);
          float _2504 = saturate(_2503);
          bool _2505 = (_2431 == 1.0f);
          if (_2505) {
            float _2507 = _2471 - _1849;
            float _2508 = _2472 - _1850;
            float _2509 = _2473 - _1851;
            float _2510 = dot(float3(_1731, _1735, _1739), float3(_2507, _2508, _2509));
            float _2511 = max(0.0f, _2510);
            float _2512 = _1756 * 0.9375f;
            float _2513 = _2512 - _2511;
            float _2514 = _109 * 0.015625f;
            float _2515 = _2514 + 1.5f;
            float _2516 = _2513 * _2515;
            float _2517 = _2516 / _1756;
            float _2518 = _2517 * 0.9375f;
            float _2519 = saturate(_2518);
            _2521 = _2519;
          } else {
            _2521 = _2431;
          }
          float _2522 = _2521 * _2504;
          int _2523 = _2430 & -2;
          bool _2524 = (_2523 == 6);
          if (!_2524) {
            bool _2526 = (_74 == 33);
            bool __defer_2525_2535 = false;
            if ((((_2526) && ((_2430 == 33))) || (!(_2526) && ((((_74 == 55))) && (((_2430 == 55))))))) {
              float _2534 = _2522 * 0.009999999776482582f;
              _2597 = _2534;
            } else {
              __defer_2525_2535 = true;
            }
            if (__defer_2525_2535) {
              bool _2536 = (_2523 == 66);
              bool _2537 = (_2430 == 54);
              bool _2538 = (_2537) || (_2536);
              if (!(_2538) || ((_2538) && (!((((_1626 == 66))) || (((_74 == 54))))))) {
                if (!_166) {
                  bool _2589 = ((uint)((int)((uint)(_2430) + (uint)(-53))) < (uint)15);
                  if (_2589) {
                    float _2591 = _109 * 0.03125f;
                    float _2592 = saturate(_2591);
                    _2594 = _2592;
                  } else {
                    _2594 = 1.0f;
                  }
                  float _2595 = _2594 * _2522;
                  _2597 = _2595;
                } else {
                  _2597 = _2522;
                }
              } else {
                float _2544 = _2432 * _bufferSizeAndInvSize.x;
                float _2545 = _2433 * _bufferSizeAndInvSize.y;
                int _2546 = int(_2544);
                int _2547 = int(_2545);
                uint4 _2549 = __3__36__0__0__g_baseColor.Load(int3(_2546, _2547, 0));
                int _2552 = (uint)((uint)(_2549.x)) >> 8;
                int _2553 = _2552 & 255;
                float _2554 = float((uint)(uint)(_2553));
                float _2555 = _2554 * 0.003921568859368563f;
                int _2556 = _2549.x & 255;
                float _2557 = float((uint)(uint)(_2556));
                float _2558 = _2557 * 0.003921568859368563f;
                int _2559 = (uint)((uint)(_2549.y)) >> 8;
                int _2560 = _2559 & 255;
                float _2561 = float((uint)(uint)(_2560));
                float _2562 = _2561 * 0.003921568859368563f;
                float _2563 = _2555 * _2555;
                float _2564 = _2558 * _2558;
                float _2565 = _2562 * _2562;
                float _2566 = _2563 * 0.6131200194358826f;
                float _2567 = _2563 * 0.07020000368356705f;
                float _2568 = _2563 * 0.02061999961733818f;
                float _2569 = _2564 * 0.3395099937915802f;
                float _2570 = _2564 * 0.9163600206375122f;
                float _2571 = _2564 * 0.10958000272512436f;
                float _2572 = _2566 + _2569;
                float _2573 = _2567 + _2570;
                float _2574 = _2568 + _2571;
                float _2575 = _2565 * 0.047370001673698425f;
                float _2576 = _2565 * 0.013450000435113907f;
                float _2577 = _2565 * 0.8697999715805054f;
                float _2578 = _2572 + _2575;
                float _2579 = _2573 + _2576;
                float _2580 = _2574 + _2577;
                float _2581 = dot(float3(_2578, _2579, _2580), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
                float _2582 = _2581 * 0.875f;
                float _2583 = 1.0f - _2582;
                float _2584 = saturate(_2583);
                float _2585 = _2584 * _2522;
                _2597 = _2585;
              }
            }
          } else {
            float _2534 = _2522 * 0.009999999776482582f;
            _2597 = _2534;
          }
        } else {
          _2597 = 0.0f;
        }
      } else {
        if (_2439) {
          float _2451 = _2432 * 2.0f;
          float _2452 = _2433 * 2.0f;
          float _2453 = _2451 + -1.0f;
          float _2454 = 1.0f - _2452;
          float _2455 = _2453 * (_invViewProjRelative[0].x);
          float _2456 = mad((_invViewProjRelative[0].y), _2454, _2455);
          float _2457 = mad((_invViewProjRelative[0].z), _2434, _2456);
          float _2458 = _2457 + (_invViewProjRelative[0].w);
          float _2459 = _2453 * (_invViewProjRelative[1].x);
          float _2460 = mad((_invViewProjRelative[1].y), _2454, _2459);
          float _2461 = mad((_invViewProjRelative[1].z), _2434, _2460);
          float _2462 = _2461 + (_invViewProjRelative[1].w);
          float _2463 = _2453 * (_invViewProjRelative[2].x);
          float _2464 = mad((_invViewProjRelative[2].y), _2454, _2463);
          float _2465 = mad((_invViewProjRelative[2].z), _2434, _2464);
          float _2466 = _2465 + (_invViewProjRelative[2].w);
          float _2467 = _2453 * (_invViewProjRelative[3].x);
          float _2468 = mad((_invViewProjRelative[3].y), _2454, _2467);
          float _2469 = mad((_invViewProjRelative[3].z), _2434, _2468);
          float _2470 = _2469 + (_invViewProjRelative[3].w);
          float _2471 = _2458 / _2470;
          float _2472 = _2462 / _2470;
          float _2473 = _2466 / _2470;
          float _2476 = max(1.0000000116860974e-07f, _2434);
          float _2477 = _nearFarProj.x / _2476;
          float _2478 = max(1.0000000116860974e-07f, _2435);
          float _2479 = _nearFarProj.x / _2478;
          float _2480 = _2479 - _2477;
          bool _2481 = (_2430 == 2);
          if (!_2481) {
            bool _2483 = (_2430 == 3);
            if (_2483) {
              _2496 = 0.0f;
              _2498 = _2496;
            } else {
              bool _2485 = (_2430 == 21);
              if (_2485) {
                bool _2494 = (_74 == 21);
                if (!_2494) {
                  _2496 = 0.0f;
                  _2498 = _2496;
                } else {
                  _2498 = 20.0f;
                }
              } else {
                bool _2489 = (_2430 == 22);
                float _2490 = select(_2489, 0.0f, 1.0f);
                bool _2491 = (_74 == 22);
                bool _2492 = (_2491) && (_2489);
                if (!_2492) {
                  _2496 = _2490;
                  _2498 = _2496;
                } else {
                  _2498 = 20.0f;
                }
              }
            }
          } else {
            bool _2487 = (_74 == 2);
            if (!_2487) {
              _2496 = 0.0f;
              _2498 = _2496;
            } else {
              _2498 = 20.0f;
            }
          }
          float _2499 = _2498 * _2480;
          float _2500 = _2437 + _2499;
          float _2501 = min(0.0f, _2500);
          float _2502 = _2501 * 1.4426950216293335f;
          float _2503 = exp2(_2502);
          float _2504 = saturate(_2503);
          bool _2505 = (_2431 == 1.0f);
          if (_2505) {
            float _2507 = _2471 - _1849;
            float _2508 = _2472 - _1850;
            float _2509 = _2473 - _1851;
            float _2510 = dot(float3(_1731, _1735, _1739), float3(_2507, _2508, _2509));
            float _2511 = max(0.0f, _2510);
            float _2512 = _1756 * 0.9375f;
            float _2513 = _2512 - _2511;
            float _2514 = _109 * 0.015625f;
            float _2515 = _2514 + 1.5f;
            float _2516 = _2513 * _2515;
            float _2517 = _2516 / _1756;
            float _2518 = _2517 * 0.9375f;
            float _2519 = saturate(_2518);
            _2521 = _2519;
          } else {
            _2521 = _2431;
          }
          float _2522 = _2521 * _2504;
          int _2523 = _2430 & -2;
          bool _2524 = (_2523 == 6);
          if (!_2524) {
            bool _2526 = (_74 == 33);
            bool __defer_2525_2535 = false;
            if ((((_2526) && ((_2430 == 33))) || (!(_2526) && ((((_74 == 55))) && (((_2430 == 55))))))) {
              float _2534 = _2522 * 0.009999999776482582f;
              _2597 = _2534;
            } else {
              __defer_2525_2535 = true;
            }
            if (__defer_2525_2535) {
              bool _2536 = (_2523 == 66);
              bool _2537 = (_2430 == 54);
              bool _2538 = (_2537) || (_2536);
              if (!(_2538) || ((_2538) && (!((((_1626 == 66))) || (((_74 == 54))))))) {
                if (!_166) {
                  bool _2589 = ((uint)((int)((uint)(_2430) + (uint)(-53))) < (uint)15);
                  if (_2589) {
                    float _2591 = _109 * 0.03125f;
                    float _2592 = saturate(_2591);
                    _2594 = _2592;
                  } else {
                    _2594 = 1.0f;
                  }
                  float _2595 = _2594 * _2522;
                  _2597 = _2595;
                } else {
                  _2597 = _2522;
                }
              } else {
                float _2544 = _2432 * _bufferSizeAndInvSize.x;
                float _2545 = _2433 * _bufferSizeAndInvSize.y;
                int _2546 = int(_2544);
                int _2547 = int(_2545);
                uint4 _2549 = __3__36__0__0__g_baseColor.Load(int3(_2546, _2547, 0));
                int _2552 = (uint)((uint)(_2549.x)) >> 8;
                int _2553 = _2552 & 255;
                float _2554 = float((uint)(uint)(_2553));
                float _2555 = _2554 * 0.003921568859368563f;
                int _2556 = _2549.x & 255;
                float _2557 = float((uint)(uint)(_2556));
                float _2558 = _2557 * 0.003921568859368563f;
                int _2559 = (uint)((uint)(_2549.y)) >> 8;
                int _2560 = _2559 & 255;
                float _2561 = float((uint)(uint)(_2560));
                float _2562 = _2561 * 0.003921568859368563f;
                float _2563 = _2555 * _2555;
                float _2564 = _2558 * _2558;
                float _2565 = _2562 * _2562;
                float _2566 = _2563 * 0.6131200194358826f;
                float _2567 = _2563 * 0.07020000368356705f;
                float _2568 = _2563 * 0.02061999961733818f;
                float _2569 = _2564 * 0.3395099937915802f;
                float _2570 = _2564 * 0.9163600206375122f;
                float _2571 = _2564 * 0.10958000272512436f;
                float _2572 = _2566 + _2569;
                float _2573 = _2567 + _2570;
                float _2574 = _2568 + _2571;
                float _2575 = _2565 * 0.047370001673698425f;
                float _2576 = _2565 * 0.013450000435113907f;
                float _2577 = _2565 * 0.8697999715805054f;
                float _2578 = _2572 + _2575;
                float _2579 = _2573 + _2576;
                float _2580 = _2574 + _2577;
                float _2581 = dot(float3(_2578, _2579, _2580), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
                float _2582 = _2581 * 0.875f;
                float _2583 = 1.0f - _2582;
                float _2584 = saturate(_2583);
                float _2585 = _2584 * _2522;
                _2597 = _2585;
              }
            }
          } else {
            float _2534 = _2522 * 0.009999999776482582f;
            _2597 = _2534;
          }
        } else {
          _2597 = 0.0f;
        }
      }
      float _2598 = 1.0f - _2597;
      float _2599 = saturate(_2598);
      _2601 = _2599;
    } else {
      _2601 = 1.0f;
    }
    float _2602 = min(_1616, _2601);

    // ── Micro Detail Depth-Bias Shadows ───────────────────────────────
    #define MICRO_PIXEL_X_FLOAT   _54
    #define MICRO_PIXEL_Y_FLOAT   _55
    #define MICRO_LINEAR_DEPTH    _109
    #define MICRO_CONTACT_SHADOW  _2601
    #define MICRO_LIGHT_DIR_X     _1646
    #define MICRO_LIGHT_DIR_Y     _1647
    #define MICRO_LIGHT_DIR_Z     _1648
    #define MICRO_WORLD_POS_X     _1835
    #define MICRO_WORLD_POS_Y     _1836
    #define MICRO_WORLD_POS_Z     _1837
    #include "../shadows/micro_detail_shadows.hlsli"
    #undef MICRO_PIXEL_X_FLOAT
    #undef MICRO_PIXEL_Y_FLOAT
    #undef MICRO_LINEAR_DEPTH
    #undef MICRO_CONTACT_SHADOW
    #undef MICRO_LIGHT_DIR_X
    #undef MICRO_LIGHT_DIR_Y
    #undef MICRO_LIGHT_DIR_Z
    #undef MICRO_WORLD_POS_X
    #undef MICRO_WORLD_POS_Y
    #undef MICRO_WORLD_POS_Z
    // ──────────────────────────────────────────────────────────────────

    // ────────────────── Screen edge contact shadow fade ───────────────
    if (CONTACT_SHADOW_QUALITY == 1.f && _2601 < 1.0f) {
      float2 _screenUV = float2((_54 + 0.5f) * _bufferSizeAndInvSize.z,
                                 (_55 + 0.5f) * _bufferSizeAndInvSize.w);
      float2 _edgeDist = min(_screenUV, 1.0f - _screenUV);
      float _edgeFade = saturate(min(_edgeDist.x, _edgeDist.y) * 10.0f);
      _2601 = lerp(lerp(1.0f, _2601, 0.5f), _2601, _edgeFade);
    }

    _2602 = min(_1616, _2601);
    _2616 = float(half(_2602 * float(_1592)));
    _2617 = float(half(_2602 * float(_1593)));
    _2618 = float(half(_2602 * float(_1594)));
    _2619 = saturate((1.0f - _550) + (exp2(log2(saturate(_1603)) * 0.45454543828964233f) * _550));
  }
  half _2620 = half(_2616);
  half _2621 = half(_2617);
  half _2622 = half(_2618);
  half _2623 = half(_2619);
  __3__38__0__1__g_shadowColorResultUAV[int2(((int)(((uint)((_43 | _45) << 3)) + SV_GroupThreadID.x)), ((int)(((uint)(((_41 << 2) | _48) << 3)) + SV_GroupThreadID.y)))] = half4(_2620, _2621, _2622, _2623);
}