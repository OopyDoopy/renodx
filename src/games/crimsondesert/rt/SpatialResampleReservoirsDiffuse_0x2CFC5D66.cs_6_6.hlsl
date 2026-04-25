#include "../shared.h"

// RenoDX: R2 
uint _rndx_pcg(uint v) {
  uint state = v * 747796405u + 2891336453u;
  uint word  = ((state >> ((state >> 28u) + 4u)) ^ state) * 277803737u;
  return (word >> 22u) ^ word;
}
float2 _rndx_sample_noise(uint2 pixelCoord, float frameIndex, uint streamIndex = 0u) {
  // Stream Index decorrelates different sampling uses across pipeline stages
  uint h = _rndx_pcg(pixelCoord.x + pixelCoord.y * 8192u + streamIndex * 65537u);
  float off1 = float(h) * (1.0f / 4294967296.0f);
  float off2 = float(_rndx_pcg(h)) * (1.0f / 4294967296.0f);
  float n = frameIndex;
  return frac(float2(off1 + n * 0.7548776662466927f,
                     off2 + n * 0.5698402909980532f));
}

Texture2D<uint> __3__36__0__0__g_sceneNormal : register(t51, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t42, space36);

Texture2D<uint4> __3__36__0__0__g_diffuseGIReservoirHitGeometry : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_diffuseGIReservoirRadiance : register(t30, space36);

RWTexture2D<float4> __3__38__0__1__g_raytracingHitResultUAV : register(u43, space38);

RWTexture2D<float> __3__38__0__1__g_raytracingDiffuseRayInversePDFUAV : register(u44, space38);

RWTexture2D<half4> __3__38__0__1__g_diffuseResultUAV : register(u12, space38);

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

cbuffer __3__1__0__0__RenderVoxelConstants : register(b0, space1) {
  float4 _renderParams : packoffset(c000.x);
  float4 _renderParams2 : packoffset(c001.x);
  float4 _cubemapViewPosRelative : packoffset(c002.x);
  float4 _lightingParams : packoffset(c003.x);
  float4 _tiledRadianceCacheParams : packoffset(c004.x);
  float _rtaoIntensity : packoffset(c005.x);
};

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float _14 = float((uint)SV_DispatchThreadID.x);
  float _15 = float((uint)SV_DispatchThreadID.y);
  float _16 = _14 + 0.5f;
  float _17 = _15 + 0.5f;
  float _24 = _bufferSizeAndInvSize.x * _15;
  float _25 = _24 + _14;
  uint _26 = uint(_25);
  int _30 = ((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)));
  int _31 = (uint)((uint)(_frameNumber.x)) >> 5;
  int _33 = _30 ^ (_31 + -939442524);
  int _38 = ((int)((((uint)(_33) + _26) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_33) + _26) + (uint)(-1640531527)));
  int _39 = (uint)((uint)(_33) + _26) >> 5;
  int _41 = _38 ^ ((int)((uint)(_39) + 2123724318u));
  int _46 = ((int)((((uint)(_41) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_41) + (uint)(_frameNumber.x)) + 1013904242u));
  int _47 = (uint)((uint)(_41) + (uint)(_frameNumber.x)) >> 5;
  int _49 = _46 ^ (_47 + -939442524);
  int _54 = ((int)((((uint)(_49) + ((uint)(_33) + _26)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_49) + ((uint)(_33) + _26)) + 1013904242u));
  int _55 = (uint)((uint)(_49) + ((uint)(_33) + _26)) >> 5;
  int _57 = _54 ^ ((int)((uint)(_55) + 2123724318u));
  int _62 = ((int)((((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
  int _63 = (uint)((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))) >> 5;
  int _65 = _62 ^ (_63 + -939442524);
  int _70 = ((int)((((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))) + (uint)(-626627285)));
  int _71 = (uint)((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))) >> 5;
  int _73 = _70 ^ ((int)((uint)(_71) + 2123724318u));
  int _78 = ((int)((((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))) + 2027808484u));
  int _79 = (uint)((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))) >> 5;
  int _81 = _78 ^ (_79 + -939442524);
  int _86 = ((int)((((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))) + 2027808484u));
  int _87 = (uint)((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))) >> 5;
  int _89 = _86 ^ ((int)((uint)(_87) + 2123724318u));
  int _94 = ((int)((((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))) + 387276957u));
  int _95 = (uint)((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))) >> 5;
  int _97 = _94 ^ (_95 + -939442524);
  int _102 = ((int)((((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))))) + 387276957u));
  int _103 = (uint)((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))))) >> 5;
  int _105 = _102 ^ ((int)((uint)(_103) + 2123724318u));
  int _110 = ((int)((((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
  int _111 = (uint)((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))))) >> 5;
  int _113 = _110 ^ (_111 + -939442524);
  int _118 = ((int)((((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))))) + (uint)(-1253254570)));
  int _119 = (uint)((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))))) >> 5;
  int _121 = _118 ^ ((int)((uint)(_119) + 2123724318u));
  int _126 = ((int)((((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))))) + 1401181199u));
  int _127 = (uint)((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))))) >> 5;
  int _129 = _126 ^ (_127 + -939442524);
  int _134 = ((int)((((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))))))) + 1401181199u));
  int _135 = (uint)((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))))))) >> 5;
  int _137 = _134 ^ ((int)((uint)(_135) + 2123724318u));
  int _142 = ((int)((((uint)(_137) + ((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_137) + ((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
  int _143 = (uint)((uint)(_137) + ((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x)))))))) >> 5;
  int _145 = _142 ^ (_143 + -939442524);
  int _150 = ((int)((((uint)(_145) + ((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_145) + ((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))))))) + (uint)(-239350328)));
  int _151 = (uint)((uint)(_145) + ((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))))))) >> 5;
  int _153 = _150 ^ ((int)((uint)(_151) + 2123724318u));
  int _155 = ((int)((uint)(_145) + ((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))))))))) & 16777215;
  bool _156 = (_155 == 0);
  int _167;
  int _322;
  float _323;
  float _324;
  float _325;
  float _326;
  float _327;
  float _328;
  int _357;
  float _358;
  float _359;
  float _360;
  float _361;
  int _362;
  float _363;
  float _364;
  int _365;
  int _603;
  float _604;
  float _605;
  float _606;
  float _607;
  int _608;
  float _609;
  float _610;
  if (_156) {
    int _161 = ((int)((((uint)(_153) + ((uint)(_137) + ((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_153) + ((uint)(_137) + ((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
    int _162 = (uint)((uint)(_153) + ((uint)(_137) + ((uint)(_121) + ((uint)(_105) + ((uint)(_89) + ((uint)(_73) + ((uint)(_57) + ((uint)(_41) + (uint)(_frameNumber.x))))))))) >> 5;
    int _164 = _161 ^ (_162 + -939442524);
    _167 = ((int)((uint)(_164) + ((uint)(_145) + ((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26))))))))));
  } else {
    _167 = ((int)((uint)(_145) + ((uint)(_129) + ((uint)(_113) + ((uint)(_97) + ((uint)(_81) + ((uint)(_65) + ((uint)(_49) + ((uint)(_33) + _26)))))))));
  }
  uint _169 = __3__36__0__0__g_depthOpaque.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  int _171 = _169.x & 16777215;
  float _172 = float((uint)(uint)(_171));
  float _173 = _172 * 5.960465188081798e-08f;
  uint _175 = __3__36__0__0__g_sceneNormal.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  int _177 = (uint)((uint)(_175.x)) >> 10;
  int _178 = (uint)((uint)(_175.x)) >> 20;
  int _179 = _175.x & 1023;
  int _180 = _177 & 1023;
  int _181 = _178 & 1023;
  float _182 = float((uint)(uint)(_179));
  float _183 = float((uint)(uint)(_180));
  float _184 = float((uint)(uint)(_181));
  float _185 = _182 * 0.001956947147846222f;
  float _186 = _183 * 0.001956947147846222f;
  float _187 = _184 * 0.001956947147846222f;
  float _188 = _185 + -1.0f;
  float _189 = _186 + -1.0f;
  float _190 = _187 + -1.0f;
  float _191 = min(1.0f, _188);
  float _192 = min(1.0f, _189);
  float _193 = min(1.0f, _190);
  float _194 = dot(float3(_191, _192, _193), float3(_191, _192, _193));
  float _195 = rsqrt(_194);
  float _196 = _195 * _191;
  float _197 = _195 * _192;
  float _198 = _195 * _193;
  float _200 = _16 * 2.0f;
  float _201 = _200 * _bufferSizeAndInvSize.z;
  float _202 = _201 + -1.0f;
  float _203 = _bufferSizeAndInvSize.w * 2.0f;
  float _204 = _203 * _17;
  float _205 = 1.0f - _204;
  float _206 = max(1.0000000116860974e-07f, _173);
  float _227 = (_invViewProjRelative[0].x) * _202;
  float _228 = mad((_invViewProjRelative[0].y), _205, _227);
  float _229 = mad((_invViewProjRelative[0].z), _206, _228);
  float _230 = _229 + (_invViewProjRelative[0].w);
  float _231 = (_invViewProjRelative[1].x) * _202;
  float _232 = mad((_invViewProjRelative[1].y), _205, _231);
  float _233 = mad((_invViewProjRelative[1].z), _206, _232);
  float _234 = _233 + (_invViewProjRelative[1].w);
  float _235 = (_invViewProjRelative[2].x) * _202;
  float _236 = mad((_invViewProjRelative[2].y), _205, _235);
  float _237 = mad((_invViewProjRelative[2].z), _206, _236);
  float _238 = _237 + (_invViewProjRelative[2].w);
  float _239 = (_invViewProjRelative[3].x) * _202;
  float _240 = mad((_invViewProjRelative[3].y), _205, _239);
  float _241 = mad((_invViewProjRelative[3].z), _206, _240);
  float _242 = _241 + (_invViewProjRelative[3].w);
  float _243 = _230 / _242;
  float _244 = _234 / _242;
  float _245 = _238 / _242;
  float _246 = _198 * 511.0f;
  float _247 = _246 + 511.5f;
  uint _248 = uint(_247);
  float _249 = _197 * 511.0f;
  float _250 = _249 + 511.5f;
  uint _251 = uint(_250);
  float _252 = _196 * 511.0f;
  float _253 = _252 + 511.5f;
  uint _254 = uint(_253);
  int _255 = (int)(_254) & 1023;
  uint4 _257 = __3__36__0__0__g_diffuseGIReservoirHitGeometry.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  uint2 _262 = __3__36__0__0__g_diffuseGIReservoirRadiance.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  int _265 = (int)(_251) & 1023;
  int _266 = (int)(_248) & 1023;
  float _267 = float((uint)(uint)(_255));
  float _268 = float((uint)(uint)(_265));
  float _269 = float((uint)(uint)(_266));
  float _270 = _267 * 0.001956947147846222f;
  float _271 = _268 * 0.001956947147846222f;
  float _272 = _269 * 0.001956947147846222f;
  float _273 = _270 + -1.0f;
  float _274 = _271 + -1.0f;
  float _275 = _272 + -1.0f;
  float _276 = min(1.0f, _273);
  float _277 = min(1.0f, _274);
  float _278 = min(1.0f, _275);
  float _279 = dot(float3(_276, _277, _278), float3(_276, _277, _278));
  float _280 = rsqrt(_279);
  float _281 = _280 * _276;
  float _282 = _280 * _277;
  float _283 = _280 * _278;
  float _284 = asfloat(_257.x);
  float _285 = asfloat(_257.y);
  float _286 = asfloat(_257.z);
  int _287 = (uint)((uint)(_262.x)) >> 16;
  float _288 = f16tof32((uint)(_287));
  int _289 = _262.x & 1023;
  float _290 = asfloat(_262.y);
  float _291 = _284 - _243;
  float _292 = _285 - _244;
  float _293 = _286 - _245;
  float _294 = dot(float3(_291, _292, _293), float3(_291, _292, _293));
  float _295 = rsqrt(_294);
  float _296 = _295 * _291;
  float _297 = _295 * _292;
  float _298 = _295 * _293;
  float _299 = dot(float3(_281, _282, _283), float3(_296, _297, _298));
  float _300 = max(0.10000000149011612f, _299);
  float _301 = _288 * 0.31830987334251404f;
  float _302 = _301 * _300;
  float _303 = float((uint)(uint)(_289));
  float _304 = _303 * _290;
  float _305 = _304 * _302;
  float _308 = _nearFarProj.x / _206;
  float _309 = max(0.5f, _308);
  bool _312 = (_renderParams.x > 0.0f);
  float _313 = select(_312, 64.0f, 8.0f);
  uint _314 = max((uint)(1), (uint)(_289));
  int _315 = 16 / (int)(_314);
  uint _316 = max((uint)(8), (uint)(_315));

  // ============================================================
  // RenoDX: SPMIS Spatial Resampling (rt_quality >= 1)
  // Stochastic Pairwise MIS for large kernel unbiased spatial reuse.
  // 24 R2 blue-noise disk-sampled neighbors, pairwise MIS weights,
  // adaptive radius, Jacobian corrected domain transfer.
  //
  // Griefs the game because of only 1spp, causes a lot of boiling
  // ============================================================
  if (RR_ENABLED == 1.f && RT_QUALITY >= 1.f) {
    static const int   SPMIS_N     = 24;
    static const float SPMIS_INV_N = 1.0f / 24.0f;
    static const float SPMIS_PI    = 3.14159265358979f;

    float3 spmis_P   = float3(_243, _244, _245);
    float3 spmis_Nq  = float3(_280 * _276, _280 * _277, _280 * _278);
    float  spmis_Wq  = asfloat(_262.y);

    float  spmis_sum_w    = 0.0f;
    float  spmis_sel_lum  = _288;
    float3 spmis_sel_hit  = float3(_284, _285, _286);
    float  spmis_sel_phat = _302;
    uint   spmis_rng      = (uint)_167;

    float spmis_self_mis = 1.0f / (1.0f + float(_289) * SPMIS_INV_N);
    float spmis_w_self   = spmis_self_mis * spmis_Wq * _302;
    spmis_sum_w          = spmis_w_self;

    float spmis_radius = select((_renderParams.x > 0.0f),
                                select((_289 <= 4), 48.0f, 32.0f),
                                select((_289 <= 4), 12.0f, 8.0f));

    for (int spmis_i = 0; spmis_i < SPMIS_N; spmis_i++) {
      float2 spmis_xi = _rndx_sample_noise(SV_DispatchThreadID.xy,
                                            float(_frameNumber.x),
                                            3u + (uint)spmis_i);
      float spmis_r     = spmis_radius * sqrt(spmis_xi.x);
      float spmis_theta = 2.0f * SPMIS_PI * spmis_xi.y;
      int spmis_nx = int(SV_DispatchThreadID.x) + int(spmis_r * cos(spmis_theta));
      int spmis_ny = int(SV_DispatchThreadID.y) + int(spmis_r * sin(spmis_theta));

      if (spmis_nx < 0 || spmis_nx >= int(_bufferSizeAndInvSize.x) ||
          spmis_ny < 0 || spmis_ny >= int(_bufferSizeAndInvSize.y)) continue;
      if (spmis_nx == int(SV_DispatchThreadID.x) &&
          spmis_ny == int(SV_DispatchThreadID.y)) continue;

      uint spmis_d_raw = __3__36__0__0__g_depthOpaque.Load(int3(spmis_nx, spmis_ny, 0)).x;
      uint spmis_n_raw = __3__36__0__0__g_sceneNormal.Load(int3(spmis_nx, spmis_ny, 0)).x;

      float spmis_snx = min(1.0f, float(spmis_n_raw & 1023u)          * 0.001956947147846222f - 1.0f);
      float spmis_sny = min(1.0f, float((spmis_n_raw >> 10u) & 1023u) * 0.001956947147846222f - 1.0f);
      float spmis_snz = min(1.0f, float((spmis_n_raw >> 20u) & 1023u) * 0.001956947147846222f - 1.0f);

      float spmis_ndc_x = ((float(spmis_nx) + 0.5f) * 2.0f * _bufferSizeAndInvSize.z) - 1.0f;
      float spmis_ndc_y = 1.0f - ((float(spmis_ny) + 0.5f) * 2.0f * _bufferSizeAndInvSize.w);
      float spmis_depth = max(1.0000000116860974e-07f,
                              float(spmis_d_raw & 16777215u) * 5.960465188081798e-08f);
      float4 spmis_wh = mul(_invViewProjRelative,
                            float4(spmis_ndc_x, spmis_ndc_y, spmis_depth, 1.0f));
      float3 spmis_Ps = spmis_wh.xyz / spmis_wh.w;

      if (abs(dot(float3(_196, _197, _198), spmis_Ps - spmis_P))
          > max(0.5f, _nearFarProj.x / _206)) continue;

      float spmis_ns_s = rsqrt(dot(float3(spmis_snx, spmis_sny, spmis_snz),
                                   float3(spmis_snx, spmis_sny, spmis_snz))) * 511.0f;
      float spmis_rnx = min(1.0f, float(uint(spmis_ns_s * spmis_snx + 511.5f) & 1023u)
                                   * 0.001956947147846222f - 1.0f);
      float spmis_rny = min(1.0f, float(uint(spmis_ns_s * spmis_sny + 511.5f) & 1023u)
                                   * 0.001956947147846222f - 1.0f);
      float spmis_rnz = min(1.0f, float(uint(spmis_ns_s * spmis_snz + 511.5f) & 1023u)
                                   * 0.001956947147846222f - 1.0f);
      float  spmis_rn_inv = rsqrt(dot(float3(spmis_rnx, spmis_rny, spmis_rnz),
                                       float3(spmis_rnx, spmis_rny, spmis_rnz)));
      float3 spmis_Ns = float3(spmis_rn_inv * spmis_rnx,
                                spmis_rn_inv * spmis_rny,
                                spmis_rn_inv * spmis_rnz);

      if (dot(float3(_196, _197, _198), spmis_Ns) < 0.0f) continue;

      uint4 spmis_hg = __3__36__0__0__g_diffuseGIReservoirHitGeometry.Load(
                            int3(spmis_nx, spmis_ny, 0));
      uint2 spmis_hr = __3__36__0__0__g_diffuseGIReservoirRadiance.Load(
                            int3(spmis_nx, spmis_ny, 0));
      float3 spmis_hitPos = float3(asfloat(spmis_hg.x),
                                    asfloat(spmis_hg.y),
                                    asfloat(spmis_hg.z));
      float spmis_lum_s = f16tof32(spmis_hr.x >> 16u);
      int   spmis_M_s   = spmis_hr.x & 1023;
      float spmis_W_s   = asfloat(spmis_hr.y);

      float spmis_hnx = min(1.0f, float(spmis_hg.w & 1023u)          * 0.001956947147846222f - 1.0f);
      float spmis_hny = min(1.0f, float((spmis_hg.w >> 10u) & 1023u) * 0.001956947147846222f - 1.0f);
      float spmis_hnz = min(1.0f, float((spmis_hg.w >> 20u) & 1023u) * 0.001956947147846222f - 1.0f);
      float  spmis_hn_inv = rsqrt(dot(float3(spmis_hnx, spmis_hny, spmis_hnz),
                                       float3(spmis_hnx, spmis_hny, spmis_hnz)));
      float3 spmis_hitN = float3(spmis_hn_inv * spmis_hnx,
                                  spmis_hn_inv * spmis_hny,
                                  spmis_hn_inv * spmis_hnz);

      float3 spmis_d_cq    = spmis_hitPos - spmis_P;
      float  spmis_dsq_cq  = dot(spmis_d_cq, spmis_d_cq);
      float3 spmis_dir_cq  = spmis_d_cq * rsqrt(spmis_dsq_cq);
      float  spmis_cos_q   = max(0.10000000149011612f, dot(spmis_Nq, spmis_dir_cq));
      float  spmis_phat_q  = spmis_lum_s * 0.31830987334251404f * spmis_cos_q;

      float3 spmis_d_sq    = spmis_hitPos - spmis_Ps;
      float  spmis_dsq_sq  = dot(spmis_d_sq, spmis_d_sq);
      float3 spmis_dir_sq  = spmis_d_sq * rsqrt(spmis_dsq_sq);
      float  spmis_cos_s   = max(0.10000000149011612f, dot(spmis_Ns, spmis_dir_sq));
      float  spmis_phat_s  = spmis_lum_s * 0.31830987334251404f * spmis_cos_s;

      float spmis_cos_hq = abs(dot(spmis_dir_cq, spmis_hitN));
      float spmis_cos_hs = abs(dot(spmis_dir_sq, spmis_hitN));

      float spmis_J_num   = spmis_cos_hq * spmis_dsq_sq;
      float spmis_J_denom = spmis_cos_hs * spmis_dsq_cq;
      float spmis_J = (spmis_J_denom > 1e-10f)
                       ? clamp(spmis_J_num / spmis_J_denom, 0.0f, 4.0f)
                       : 0.0f;

      if (spmis_cos_hq < 1e-4f) continue;

      float spmis_denom = spmis_phat_q
                           + SPMIS_INV_N * float(spmis_M_s) * spmis_phat_s * spmis_J;
      float spmis_mis = (spmis_denom > 1e-10f) ? (spmis_phat_q / spmis_denom) : 0.0f;

      float spmis_w_i = spmis_mis * spmis_W_s * spmis_phat_q;
      spmis_sum_w += spmis_w_i;
      spmis_rng = _rndx_pcg(spmis_rng + (uint)spmis_i);
      float spmis_u = float(spmis_rng) * (1.0f / 4294967296.0f);
      if (spmis_u * spmis_sum_w <= spmis_w_i) {
        spmis_sel_lum  = spmis_lum_s;
        spmis_sel_hit  = spmis_hitPos;
        spmis_sel_phat = spmis_phat_q;
      }
    }

    float spmis_Wf = (spmis_sel_phat > 1e-10f) ? (spmis_sum_w / spmis_sel_phat) : 0.0f;
    spmis_Wf = saturate(spmis_Wf);

    float  spmis_out = max(0.0f, spmis_sel_lum * spmis_Wf);
    half   spmis_h   = half(spmis_out);
    float3 spmis_d   = spmis_sel_hit - spmis_P;
    float  spmis_len = sqrt(dot(spmis_d, spmis_d));
    float  spmis_inv = 1.0f / max(9.999999974752427e-07f, spmis_len);

    int2 spmis_px = int2(int(SV_DispatchThreadID.x), int(SV_DispatchThreadID.y));
    __3__38__0__1__g_diffuseResultUAV[spmis_px] = half4(spmis_h, spmis_h, spmis_h, 0.0h);
    __3__38__0__1__g_raytracingHitResultUAV[spmis_px] =
        float4(spmis_d.x * spmis_inv, spmis_d.y * spmis_inv, spmis_d.z * spmis_inv, spmis_len);
    __3__38__0__1__g_raytracingDiffuseRayInversePDFUAV[spmis_px] = spmis_Wf;
    return;
  }
  // ============================================================
  // Vanilla RIS path (unchanged)
  // ============================================================
  bool _317 = ((int)(_316) == 0);
  if (!_317) {
    uint _319 = _167 * 48271;
    _357 = _289;
    _358 = _288;
    _359 = _284;
    _360 = _285;
    _361 = _286;
    _362 = (int)(_319);
    _363 = _302;
    _364 = _305;
    _365 = 0;
    while(true) {
      uint _366 = _362 * 48271;
      int _367 = (int)(_366) & 16777215;
      float _368 = float((uint)(uint)(_367));
      float _369 = _368 * 1.1920928955078125e-07f;
      float _370 = _369 + -1.0f;
      uint _371 = _362 * -1964877855;
      int _372 = (int)(_371) & 16777215;
      float _373 = float((uint)(uint)(_372));
      float _374 = _373 * 1.1920928955078125e-07f;
      float _375 = _374 + -1.0f;
      float _376 = _370 * _313;
      int _377 = int(_376);
      float _379 = _375 * _313;
      int _380 = int(_379);
      float _382 = _bufferSizeAndInvSize.x + -1.0f;
      float _383 = _bufferSizeAndInvSize.y + -1.0f;
      // RenoDX: R2+CP blue noise for spatial neighbor selection
      int _390, _391;
      if (RR_ENABLED == 1.f && RT_QUALITY >= 1.f) {
        float2 _rndx_nbr = _rndx_sample_noise(SV_DispatchThreadID.xy, _frameNumber.x, 3u + _365);
        _390 = int(min(max(float(int((_rndx_nbr.x * 2.0f - 1.0f) * _313) + (int)(SV_DispatchThreadID.x)), 0.0f), _382));
        _391 = int(min(max(float(int((_rndx_nbr.y * 2.0f - 1.0f) * _313) + (int)(SV_DispatchThreadID.y)), 0.0f), _383));
      } else {
        float _384 = float((int)(_377 + (int)(SV_DispatchThreadID.x)));
        float _385 = float((int)(_380 + (int)(SV_DispatchThreadID.y)));
        float _386 = max(_384, 0.0f);
        float _387 = max(_385, 0.0f);
        float _388 = min(_386, _382);
        float _389 = min(_387, _383);
        _390 = int(_388);
        _391 = int(_389);
      }
      uint _393 = __3__36__0__0__g_depthOpaque.Load(int3(_390, _391, 0));
      int _395 = _393.x & 16777215;
      float _396 = float((uint)(uint)(_395));
      float _397 = _396 * 5.960465188081798e-08f;
      uint _399 = __3__36__0__0__g_sceneNormal.Load(int3(_390, _391, 0));
      int _401 = (uint)((uint)(_399.x)) >> 10;
      int _402 = (uint)((uint)(_399.x)) >> 20;
      int _403 = _399.x & 1023;
      int _404 = _401 & 1023;
      int _405 = _402 & 1023;
      float _406 = float((uint)(uint)(_403));
      float _407 = float((uint)(uint)(_404));
      float _408 = float((uint)(uint)(_405));
      float _409 = _406 * 0.001956947147846222f;
      float _410 = _407 * 0.001956947147846222f;
      float _411 = _408 * 0.001956947147846222f;
      float _412 = _409 + -1.0f;
      float _413 = _410 + -1.0f;
      float _414 = _411 + -1.0f;
      float _415 = min(1.0f, _412);
      float _416 = min(1.0f, _413);
      float _417 = min(1.0f, _414);
      float _418 = dot(float3(_415, _416, _417), float3(_415, _416, _417));
      float _419 = rsqrt(_418);
      float _420 = float((int)(_390));
      float _421 = float((int)(_391));
      float _422 = _420 + 0.5f;
      float _423 = _421 + 0.5f;
      float _427 = _422 * 2.0f;
      float _428 = _427 * _bufferSizeAndInvSize.z;
      float _429 = _428 + -1.0f;
      float _430 = _423 * 2.0f;
      float _431 = _430 * _bufferSizeAndInvSize.w;
      float _432 = 1.0f - _431;
      float _433 = max(1.0000000116860974e-07f, _397);
      float _454 = _429 * (_invViewProjRelative[0].x);
      float _455 = mad((_invViewProjRelative[0].y), _432, _454);
      float _456 = mad((_invViewProjRelative[0].z), _433, _455);
      float _457 = _456 + (_invViewProjRelative[0].w);
      float _458 = _429 * (_invViewProjRelative[1].x);
      float _459 = mad((_invViewProjRelative[1].y), _432, _458);
      float _460 = mad((_invViewProjRelative[1].z), _433, _459);
      float _461 = _460 + (_invViewProjRelative[1].w);
      float _462 = _429 * (_invViewProjRelative[2].x);
      float _463 = mad((_invViewProjRelative[2].y), _432, _462);
      float _464 = mad((_invViewProjRelative[2].z), _433, _463);
      float _465 = _464 + (_invViewProjRelative[2].w);
      float _466 = _429 * (_invViewProjRelative[3].x);
      float _467 = mad((_invViewProjRelative[3].y), _432, _466);
      float _468 = mad((_invViewProjRelative[3].z), _433, _467);
      float _469 = _468 + (_invViewProjRelative[3].w);
      float _470 = _457 / _469;
      float _471 = _461 / _469;
      float _472 = _465 / _469;
      float _473 = _419 * 511.0f;
      float _474 = _473 * _417;
      float _475 = _474 + 511.5f;
      uint _476 = uint(_475);
      float _477 = _473 * _416;
      float _478 = _477 + 511.5f;
      uint _479 = uint(_478);
      float _480 = _473 * _415;
      float _481 = _480 + 511.5f;
      uint _482 = uint(_481);
      int _483 = (int)(_482) & 1023;
      uint4 _485 = __3__36__0__0__g_diffuseGIReservoirHitGeometry.Load(int3(_390, _391, 0));
      uint2 _491 = __3__36__0__0__g_diffuseGIReservoirRadiance.Load(int3(_390, _391, 0));
      int _494 = (int)(_479) & 1023;
      int _495 = (int)(_476) & 1023;
      float _496 = float((uint)(uint)(_483));
      float _497 = float((uint)(uint)(_494));
      float _498 = float((uint)(uint)(_495));
      float _499 = _496 * 0.001956947147846222f;
      float _500 = _497 * 0.001956947147846222f;
      float _501 = _498 * 0.001956947147846222f;
      float _502 = _499 + -1.0f;
      float _503 = _500 + -1.0f;
      float _504 = _501 + -1.0f;
      float _505 = min(1.0f, _502);
      float _506 = min(1.0f, _503);
      float _507 = min(1.0f, _504);
      float _508 = dot(float3(_505, _506, _507), float3(_505, _506, _507));
      float _509 = rsqrt(_508);
      float _510 = asfloat(_485.x);
      float _511 = asfloat(_485.y);
      float _512 = asfloat(_485.z);
      int _513 = (uint)((uint)(_485.w)) >> 10;
      int _514 = (uint)((uint)(_485.w)) >> 20;
      int _515 = _485.w & 1023;
      int _516 = _513 & 1023;
      int _517 = _514 & 1023;
      float _518 = float((uint)(uint)(_515));
      float _519 = float((uint)(uint)(_516));
      float _520 = float((uint)(uint)(_517));
      float _521 = _518 * 0.001956947147846222f;
      float _522 = _519 * 0.001956947147846222f;
      float _523 = _520 * 0.001956947147846222f;
      float _524 = _521 + -1.0f;
      float _525 = _522 + -1.0f;
      float _526 = _523 + -1.0f;
      float _527 = min(1.0f, _524);
      float _528 = min(1.0f, _525);
      float _529 = min(1.0f, _526);
      float _530 = dot(float3(_527, _528, _529), float3(_527, _528, _529));
      float _531 = rsqrt(_530);
      float _532 = _531 * _527;
      float _533 = _531 * _528;
      float _534 = _531 * _529;
      int _535 = (uint)((uint)(_491.x)) >> 16;
      float _536 = f16tof32((uint)(_535));
      int _537 = _491.x & 1023;
      float _538 = asfloat(_491.y);
      float _539 = _470 - _243;
      float _540 = _471 - _244;
      float _541 = _472 - _245;
      float _542 = dot(float3(_196, _197, _198), float3(_539, _540, _541));
      float _543 = abs(_542);
      bool _544 = (_543 > _309);
      if (!_544) {
        float _546 = _509 * _507;
        float _547 = _509 * _506;
        float _548 = _509 * _505;
        float _549 = dot(float3(_196, _197, _198), float3(_548, _547, _546));
        bool _550 = (_549 < 0.0f);
        if (!_550) {
          float _552 = _510 - _470;
          float _553 = _511 - _471;
          float _554 = _512 - _472;
          float _555 = _510 - _243;
          float _556 = _511 - _244;
          float _557 = _512 - _245;
          float _558 = dot(float3(_555, _556, _557), float3(_555, _556, _557));
          float _559 = dot(float3(_552, _553, _554), float3(_552, _553, _554));
          float _560 = rsqrt(_559);
          float _561 = _560 * _552;
          float _562 = _560 * _553;
          float _563 = _560 * _554;
          float _564 = rsqrt(_558);
          float _565 = dot(float3(_561, _562, _563), float3(_532, _533, _534));
          float _566 = _558 * _565;
          bool _567 = !(_566 >= -0.0f);
          if (_567) {
            float _569 = -0.0f - _566;
            float _570 = _564 * _555;
            float _571 = _564 * _556;
            float _572 = _564 * _557;
            float _573 = dot(float3(_570, _571, _572), float3(_532, _533, _534));
            float _574 = _559 * _573;
            float _575 = -0.0f - _574;
            float _576 = _575 / _569;
            float _577 = max(_576, 0.0f);
            float _578 = min(_577, 1.0f);
            bool _579 = !(_578 <= 0.0f);
            if (_579) {
              float _581 = dot(float3(_196, _197, _198), float3(_570, _571, _572));
              float _582 = max(0.10000000149011612f, _581);
              float _583 = _536 * 0.31830987334251404f;
              float _584 = _583 * _582;
              float _585 = float((uint)(uint)(_537));
              float _586 = _585 * _538;
              float _587 = _586 * _578;
              float _588 = _587 * _584;
              uint _589 = _362 * -856141137;
              int _590 = (int)(_589) & 16777215;
              float _591 = float((uint)(uint)(_590));
              float _592 = _591 * 5.960464477539063e-08f;
              float _593 = _588 + _364;
              float _595 = _592 * _593;
              bool _596 = (_595 <= _588);
              float _597 = select(_596, _510, _359);
              float _598 = select(_596, _511, _360);
              float _599 = select(_596, _512, _361);
              float _600 = select(_596, _536, _358);
              float _601 = select(_596, _584, _363);
              _603 = ((int)((uint)(_537) + (uint)(_357)));
              _604 = _600;
              _605 = _597;
              _606 = _598;
              _607 = _599;
              _608 = (int)(_589);
              _609 = _601;
              _610 = _593;
            } else {
              _603 = _357;
              _604 = _358;
              _605 = _359;
              _606 = _360;
              _607 = _361;
              _608 = (int)(_371);
              _609 = _363;
              _610 = _364;
            }
          } else {
            _603 = _357;
            _604 = _358;
            _605 = _359;
            _606 = _360;
            _607 = _361;
            _608 = (int)(_371);
            _609 = _363;
            _610 = _364;
          }
        } else {
          _603 = _357;
          _604 = _358;
          _605 = _359;
          _606 = _360;
          _607 = _361;
          _608 = (int)(_371);
          _609 = _363;
          _610 = _364;
        }
      } else {
        _603 = _357;
        _604 = _358;
        _605 = _359;
        _606 = _360;
        _607 = _361;
        _608 = (int)(_371);
        _609 = _363;
        _610 = _364;
      }
      bool _612 = (((int)((uint)(_365) + 1u)) == (int)(_316));
      if (!_612) {
        _357 = _603;
        _358 = _604;
        _359 = _605;
        _360 = _606;
        _361 = _607;
        _362 = _608;
        _363 = _609;
        _364 = _610;
        _365 = ((int)((uint)(_365) + 1u));
        continue;
      }
      _322 = _603;
      _323 = _604;
      _324 = _605;
      _325 = _606;
      _326 = _607;
      _327 = _609;
      _328 = _610;
      break;
    }
  } else {
    _322 = _289;
    _323 = _288;
    _324 = _284;
    _325 = _285;
    _326 = _286;
    _327 = _302;
    _328 = _305;
  }
  float _329 = float((uint)(uint)(_322));
  float _330 = _327 * _329;
  bool _331 = (_330 == 0.0f);
  float _332 = _328 / _330;
  float _333 = select(_331, 0.0f, _332);
  float _334 = saturate(_333);
  float _335 = _323 * _334;
  float _336 = -0.0f - _335;
  float _337 = min(0.0f, _336);
  float _338 = _324 - _243;
  float _339 = _325 - _244;
  float _340 = _326 - _245;
  float _341 = _338 * _338;
  float _342 = _339 * _339;
  float _343 = _342 + _341;
  float _344 = _340 * _340;
  float _345 = _343 + _344;
  float _346 = sqrt(_345);
  float _347 = max(9.999999974752427e-07f, _346);
  float _348 = _338 / _347;
  float _349 = _339 / _347;
  float _350 = _340 / _347;
  half _351 = half(_337);
  half _352 = -0.0h - _351;
  __3__38__0__1__g_diffuseResultUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = half4(_352, _352, _352, 0.0h);
  __3__38__0__1__g_raytracingHitResultUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4(_348, _349, _350, _346);
  __3__38__0__1__g_raytracingDiffuseRayInversePDFUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = _334;
}