#include "../shared.h"

// RenoDX: R2 noise
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

Texture2D<uint> __3__36__0__0__g_sceneNormalPrev : register(t85, space36);

Texture2D<float2> __3__36__0__0__g_velocity : register(t74, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaque : register(t42, space36);

Texture2D<uint> __3__36__0__0__g_depthOpaquePrev : register(t87, space36);

Texture2D<uint2> __3__36__0__0__g_normalDepth : register(t71, space36);

Texture2D<float4> __3__36__0__0__g_raytracingNormal : register(t95, space36);

Texture2D<uint4> __3__36__0__0__g_diffuseGIReservoirHitGeometryPrev : register(t29, space36);

Texture2D<uint2> __3__36__0__0__g_diffuseGIReservoirRadiancePrev : register(t31, space36);

RWTexture2D<float4> __3__38__0__1__g_raytracingHitResultUAV : register(u43, space38);

RWTexture2D<float> __3__38__0__1__g_raytracingDiffuseRayInversePDFUAV : register(u44, space38);

RWTexture2D<half4> __3__38__0__1__g_diffuseResultUAV : register(u12, space38);

RWTexture2D<uint4> __3__38__0__1__g_diffuseGIReservoirHitGeometryUAV : register(u15, space38);

RWTexture2D<uint2> __3__38__0__1__g_diffuseGIReservoirRadianceUAV : register(u16, space38);

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

cbuffer __3__35__0__0__ExposureConstantBuffer : register(b34, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};

cbuffer __3__35__0__0__EnvironmentLightingHistoryConstantBuffer : register(b0, space35) {
  float4 _environmentLightingHistory[4] : packoffset(c000.x);
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
  float _25 = float((uint)SV_DispatchThreadID.x);
  float _26 = float((uint)SV_DispatchThreadID.y);
  float _27 = _25 + 0.5f;
  float _28 = _26 + 0.5f;
  float _32 = _bufferSizeAndInvSize.z * _27;
  float _33 = _28 * _bufferSizeAndInvSize.w;
  float _37 = _bufferSizeAndInvSize.x * _26;
  float _38 = _37 + _25;
  uint _39 = uint(_38);
  int _43 = ((int)(((uint)(_frameNumber.x) << 4) + (uint)(-1556008596))) ^ ((int)((uint)(_frameNumber.x) + (uint)(-1640531527)));
  int _44 = (uint)((uint)(_frameNumber.x)) >> 5;
  int _46 = _43 ^ (_44 + -939442524);
  int _51 = ((int)((((uint)(_46) + _39) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_46) + _39) + (uint)(-1640531527)));
  int _52 = (uint)((uint)(_46) + _39) >> 5;
  int _54 = _51 ^ ((int)((uint)(_52) + 2123724318u));
  int _59 = ((int)((((uint)(_54) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_54) + (uint)(_frameNumber.x)) + 1013904242u));
  int _60 = (uint)((uint)(_54) + (uint)(_frameNumber.x)) >> 5;
  int _62 = _59 ^ (_60 + -939442524);
  int _67 = ((int)((((uint)(_62) + ((uint)(_46) + _39)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_62) + ((uint)(_46) + _39)) + 1013904242u));
  int _68 = (uint)((uint)(_62) + ((uint)(_46) + _39)) >> 5;
  int _70 = _67 ^ ((int)((uint)(_68) + 2123724318u));
  int _75 = ((int)((((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
  int _76 = (uint)((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))) >> 5;
  int _78 = _75 ^ (_76 + -939442524);
  int _83 = ((int)((((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))) + (uint)(-626627285)));
  int _84 = (uint)((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))) >> 5;
  int _86 = _83 ^ ((int)((uint)(_84) + 2123724318u));
  int _91 = ((int)((((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))) + 2027808484u));
  int _92 = (uint)((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))) >> 5;
  int _94 = _91 ^ (_92 + -939442524);
  int _99 = ((int)((((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))) + 2027808484u));
  int _100 = (uint)((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))) >> 5;
  int _102 = _99 ^ ((int)((uint)(_100) + 2123724318u));
  int _107 = ((int)((((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))) + 387276957u));
  int _108 = (uint)((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))) >> 5;
  int _110 = _107 ^ (_108 + -939442524);
  int _115 = ((int)((((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))))) + 387276957u));
  int _116 = (uint)((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))))) >> 5;
  int _118 = _115 ^ ((int)((uint)(_116) + 2123724318u));
  int _123 = ((int)((((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
  int _124 = (uint)((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))))) >> 5;
  int _126 = _123 ^ (_124 + -939442524);
  int _131 = ((int)((((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))))) + (uint)(-1253254570)));
  int _132 = (uint)((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))))) >> 5;
  int _134 = _131 ^ ((int)((uint)(_132) + 2123724318u));
  int _139 = ((int)((((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))))) + 1401181199u));
  int _140 = (uint)((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))))) >> 5;
  int _142 = _139 ^ (_140 + -939442524);
  int _147 = ((int)((((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))))))) + 1401181199u));
  int _148 = (uint)((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))))))) >> 5;
  int _150 = _147 ^ ((int)((uint)(_148) + 2123724318u));
  int _155 = ((int)((((uint)(_150) + ((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_150) + ((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
  int _156 = (uint)((uint)(_150) + ((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x)))))))) >> 5;
  int _158 = _155 ^ (_156 + -939442524);
  int _163 = ((int)((((uint)(_158) + ((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_158) + ((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))))))) + (uint)(-239350328)));
  int _164 = (uint)((uint)(_158) + ((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))))))) >> 5;
  int _166 = _163 ^ ((int)((uint)(_164) + 2123724318u));
  int _168 = ((int)((uint)(_158) + ((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))))))))) & 16777215;
  bool _169 = (_168 == 0);
  int _180;
  bool _290;
  float _331;
  float _332;
  int _565;
  int _645;
  int _646;
  int _647;
  float _648;
  float _649;
  float _650;
  float _651;
  float _652;
  float _653;
  float _654;
  float _655;
  float _656;
  float _657;
  float _658;
  float _659;
  float _660;
  float _661;
  int _688;
  int _689;
  int _704;
  int _705;
  float _839;
  float _840;
  float _841;
  int _943;
  int _944;
  float _945;
  float _946;
  float _947;
  float _948;
  float _949;
  float _950;
  float _951;
  float _952;
  float _953;
  float _954;
  float _955;
  float _956;
  float _957;
  float _958;
  bool _962;
  int _963;
  int _964;
  float _965;
  float _966;
  float _967;
  float _968;
  float _969;
  float _970;
  float _971;
  float _972;
  float _973;
  float _974;
  float _975;
  float _976;
  float _977;
  float _978;
  float _1071;
  float _1072;
  float _1073;
  float _1074;
  float _1075;
  float _1076;
  float _1077;
  float _1078;
  float _1079;
  float _1080;
  float _1081;
  float _1082;
  float _1083;
  int _1084;
  float _1085;
  bool _1086;
  float _1160;
  float _1161;
  float _1162;
  float _1163;
  int _1164;
  int _1165;
  if (_169) {
    int _174 = ((int)((((uint)(_166) + ((uint)(_150) + ((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_166) + ((uint)(_150) + ((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
    int _175 = (uint)((uint)(_166) + ((uint)(_150) + ((uint)(_134) + ((uint)(_118) + ((uint)(_102) + ((uint)(_86) + ((uint)(_70) + ((uint)(_54) + (uint)(_frameNumber.x))))))))) >> 5;
    int _177 = _174 ^ (_175 + -939442524);
    _180 = ((int)((uint)(_177) + ((uint)(_158) + ((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39))))))))));
  } else {
    _180 = ((int)((uint)(_158) + ((uint)(_142) + ((uint)(_126) + ((uint)(_110) + ((uint)(_94) + ((uint)(_78) + ((uint)(_62) + ((uint)(_46) + _39)))))))));
  }
  uint _182 = __3__36__0__0__g_depthOpaque.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  int _184 = (uint)((uint)(_182.x)) >> 24;
  int _185 = _182.x & 16777215;
  float _186 = float((uint)(uint)(_185));
  float _187 = _186 * 5.960465188081798e-08f;
  int _188 = _184 & 127;
  uint _190 = __3__36__0__0__g_sceneNormal.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  int _192 = (uint)((uint)(_190.x)) >> 10;
  int _193 = (uint)((uint)(_190.x)) >> 20;
  int _194 = _190.x & 1023;
  int _195 = _192 & 1023;
  int _196 = _193 & 1023;
  float _197 = float((uint)(uint)(_194));
  float _198 = float((uint)(uint)(_195));
  float _199 = float((uint)(uint)(_196));
  float _200 = _197 * 0.001956947147846222f;
  float _201 = _198 * 0.001956947147846222f;
  float _202 = _199 * 0.001956947147846222f;
  float _203 = _200 + -1.0f;
  float _204 = _201 + -1.0f;
  float _205 = _202 + -1.0f;
  float _206 = min(1.0f, _203);
  float _207 = min(1.0f, _204);
  float _208 = min(1.0f, _205);
  float _209 = dot(float3(_206, _207, _208), float3(_206, _207, _208));
  float _210 = rsqrt(_209);
  float _211 = _210 * _206;
  float _212 = _210 * _207;
  float _213 = _210 * _208;
  bool _216 = ((_187 < 1.0000000116860974e-07f) || (_187 == 1.0f));
  if (_216) {
    __3__38__0__1__g_diffuseGIReservoirHitGeometryUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = int4(0, 0, 0, 0);
    __3__38__0__1__g_diffuseGIReservoirRadianceUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = int2(0, 0);
  } else {
    float _221 = _32 * 2.0f;
    float _222 = _221 + -1.0f;
    float _223 = _33 * 2.0f;
    float _224 = 1.0f - _223;
    float _225 = max(1.0000000116860974e-07f, _187);
    float _246 = (_invViewProjRelative[0].x) * _222;
    float _247 = mad((_invViewProjRelative[0].y), _224, _246);
    float _248 = mad((_invViewProjRelative[0].z), _225, _247);
    float _249 = _248 + (_invViewProjRelative[0].w);
    float _250 = (_invViewProjRelative[1].x) * _222;
    float _251 = mad((_invViewProjRelative[1].y), _224, _250);
    float _252 = mad((_invViewProjRelative[1].z), _225, _251);
    float _253 = _252 + (_invViewProjRelative[1].w);
    float _254 = (_invViewProjRelative[2].x) * _222;
    float _255 = mad((_invViewProjRelative[2].y), _224, _254);
    float _256 = mad((_invViewProjRelative[2].z), _225, _255);
    float _257 = _256 + (_invViewProjRelative[2].w);
    float _258 = (_invViewProjRelative[3].x) * _222;
    float _259 = mad((_invViewProjRelative[3].y), _224, _258);
    float _260 = mad((_invViewProjRelative[3].z), _225, _259);
    float _261 = _260 + (_invViewProjRelative[3].w);
    float _262 = _249 / _261;
    float _263 = _253 / _261;
    float _264 = _257 / _261;
    float _267 = _nearFarProj.x / _225;
    int _268 = _184 & 128;
    bool _269 = (_268 == 0);
    if (_269) {
      bool _271 = ((uint)_188 > (uint)52);
      if (_271) {
        bool _273 = ((uint)_188 < (uint)68);
        int _274 = _184 & 125;
        bool _275 = (_274 == 105);
        bool _276 = (_275) || (_273);
        if (!_276) {
          bool _288 = (_188 == 98);
          _290 = _288;
        } else {
          _290 = true;
        }
      } else {
        bool _278 = ((uint)_188 > (uint)10);
        if (_278) {
          bool _280 = ((uint)_188 < (uint)20);
          if (_280) {
            int _282 = _184 & 126;
            bool _283 = (_282 == 14);
            if (_283) {
              bool _288 = (_188 == 98);
              _290 = _288;
            } else {
              _290 = true;
            }
          } else {
            int _285 = _184 & 125;
            bool _286 = (_285 == 105);
            if (!_286) {
              bool _288 = (_188 == 98);
              _290 = _288;
            } else {
              _290 = true;
            }
          }
        } else {
          bool _288 = (_188 == 98);
          _290 = _288;
        }
      }
    } else {
      _290 = true;
    }
    float _307 = (_projToPrevProj[0].x) * _222;
    float _308 = mad((_projToPrevProj[0].y), _224, _307);
    float _309 = mad((_projToPrevProj[0].z), _187, _308);
    float _310 = _309 + (_projToPrevProj[0].w);
    float _311 = (_projToPrevProj[1].x) * _222;
    float _312 = mad((_projToPrevProj[1].y), _224, _311);
    float _313 = mad((_projToPrevProj[1].z), _187, _312);
    float _314 = _313 + (_projToPrevProj[1].w);
    float _315 = (_projToPrevProj[3].x) * _222;
    float _316 = mad((_projToPrevProj[3].y), _224, _315);
    float _317 = mad((_projToPrevProj[3].z), _187, _316);
    float _318 = _317 + (_projToPrevProj[3].w);
    float _319 = _310 / _318;
    float _320 = _314 / _318;
    float _321 = _319 - _222;
    float _322 = _320 - _224;
    if (_290) {
      float2 _325 = __3__36__0__0__g_velocity.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
      float _328 = _325.x * 2.0f;
      float _329 = _325.y * 2.0f;
      _331 = _328;
      _332 = _329;
    } else {
      _331 = _321;
      _332 = _322;
    }
    float _333 = _331 * 0.5f;
    float _334 = _332 * 0.5f;
    float _335 = _333 + _32;
    float _336 = _33 - _334;
    bool _340 = (_renderParams.x > 0.0f);

    // RenoDX: Area ReSTIR style subpixel tracking temporal reuse
    // The vanilla reprojection maps pixel centers between frames but
    // ignores that TAA jitter shifts the subpixel position each frame.
    float _rndx_jitter_delta_u = 0.0f;
    float _rndx_jitter_delta_v = 0.0f;
    if (RR_ENABLED == 1.f && RT_QUALITY >= 1.f) {
      _rndx_jitter_delta_u = (_temporalAAJitter.x - _temporalAAJitter.z) * 0.5f;
      _rndx_jitter_delta_v = (_temporalAAJitter.y - _temporalAAJitter.w) * 0.5f;
    }

    float _341 = (_335 + _rndx_jitter_delta_u) * _bufferSizeAndInvSize.x;
    float _342 = (_336 + _rndx_jitter_delta_v) * _bufferSizeAndInvSize.y;
    float _343 = floor(_341);
    float _344 = floor(_342);
    int _345 = int(_343);
    int _346 = int(_344);
    int _347 = (uint)(SV_DispatchThreadID.x) >> 1;
    int _348 = (uint)(SV_DispatchThreadID.y) >> 1;
    float _349 = _bufferSizeAndInvSize.x * 0.5f;
    int _350 = int(_349);
    uint _352 = _180 * 48271;
    int _353 = (int)(_352) & 16777215;
    float _354 = float((uint)(uint)(_353));
    float _355 = _354 * 5.358457428883412e-07f;
    float _356 = _355 + -4.0f;
    int _357 = int(_356);
    int _359 = max((_357 + _347), 0);
    int _360 = min(_359, (_350 + -1));
    float _361 = _bufferSizeAndInvSize.y * 0.5f;
    int _362 = int(_361);
    uint _364 = _180 * -1964877855;
    int _365 = (int)(_364) & 16777215;
    float _366 = float((uint)(uint)(_365));
    float _367 = _366 * 5.358457428883412e-07f;
    float _368 = _367 + -4.0f;
    int _369 = int(_368);
    int _371 = max((_369 + _348), 0);
    int _372 = min(_371, (_362 + -1));
    half4 _374 = __3__38__0__1__g_diffuseResultUAV.Load(int2(_360, _372));
    float _378 = float(_374.x);
    float _379 = float(_374.y);
    float _380 = float(_374.z);
    float4 _382 = __3__38__0__1__g_raytracingHitResultUAV.Load(int2(_360, _372));
    float _387 = dot(float3(_382.x, _382.y, _382.z), float3(_382.x, _382.y, _382.z));
    float _388 = rsqrt(_387);
    float _389 = _388 * _382.x;
    float _390 = _388 * _382.y;
    float _391 = _388 * _382.z;
    float4 _393 = __3__36__0__0__g_raytracingNormal.Load(int3(_360, _372, 0));
    bool _397 = (_382.w < 0.0f);
    float _398 = abs(_382.w);
    float _399 = _393.x * 2.0f;
    float _400 = _393.y * 2.0f;
    float _401 = _393.z * 2.0f;
    float _402 = _399 + -1.0f;
    float _403 = _400 + -1.0f;
    float _404 = _401 + -1.0f;
    float _405 = dot(float3(_402, _403, _404), float3(_402, _403, _404));
    float _406 = rsqrt(_405);
    float _407 = _402 * _406;
    float _408 = _403 * _406;
    float _409 = _404 * _406;
    bool _410 = (_407 == 0.0f);
    bool _411 = (_408 == 0.0f);
    bool _414 = ((_409 == 0.0f) && (_410) && (_411));
    bool _415 = _397 ^ _414;
    float _416 = -0.0f - _389;
    float _417 = -0.0f - _390;
    float _418 = -0.0f - _391;
    float _419 = select(_415, _407, _416);
    float _420 = select(_415, _408, _417);
    float _421 = select(_415, _409, _418);
    float _422 = _398 * _389;
    float _423 = _398 * _390;
    float _424 = _398 * _391;
    bool _428 = ((_188 == 57) || ((uint)(_188 + -53) < (uint)15));
    float _429 = select(_428, 0.019999999552965164f, 0.10000000149011612f);
    float _430 = _267 * _429;
    float _431 = max(0.10000000149011612f, _430);

    // RenoDX: Subpixel aware validation threshold relaxation
    // Widens world space distance threshold proportionally to jitter magnitude
    float _rndx_validation_threshold = _431;
    if (RR_ENABLED == 1.f && RT_QUALITY >= 1.f) {
      float _rndx_jitter_mag = sqrt(_rndx_jitter_delta_u * _rndx_jitter_delta_u
                                  + _rndx_jitter_delta_v * _rndx_jitter_delta_v);
      _rndx_validation_threshold = _431 + _267 * _rndx_jitter_mag * 2.0f;
    }

    float _432 = _rndx_validation_threshold * _rndx_validation_threshold;
    int _436 = ((int)(((uint)(_46) << 4) + (uint)(-1383041155))) ^ ((int)((uint)(_46) + (uint)(-1640531527)));
    int _437 = (uint)((uint)(_46)) >> 5;
    int _439 = _436 ^ ((int)((uint)(_437) + 2123724318u));
    int _444 = ((int)((((uint)(_439) + (uint)(_frameNumber.x)) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_439) + (uint)(_frameNumber.x)) + 1013904242u));
    int _445 = (uint)((uint)(_439) + (uint)(_frameNumber.x)) >> 5;
    int _447 = _444 ^ (_445 + -939442524);
    int _452 = ((int)((((uint)(_447) + (uint)(_46)) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_447) + (uint)(_46)) + 1013904242u));
    int _453 = (uint)((uint)(_447) + (uint)(_46)) >> 5;
    int _455 = _452 ^ ((int)((uint)(_453) + 2123724318u));
    int _460 = ((int)((((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))) + (uint)(-626627285)));
    int _461 = (uint)((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))) >> 5;
    int _463 = _460 ^ (_461 + -939442524);
    int _468 = ((int)((((uint)(_463) + ((uint)(_447) + (uint)(_46))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_463) + ((uint)(_447) + (uint)(_46))) + (uint)(-626627285)));
    int _469 = (uint)((uint)(_463) + ((uint)(_447) + (uint)(_46))) >> 5;
    int _471 = _468 ^ ((int)((uint)(_469) + 2123724318u));
    int _476 = ((int)((((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))) + 2027808484u));
    int _477 = (uint)((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))) >> 5;
    int _479 = _476 ^ (_477 + -939442524);
    int _484 = ((int)((((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))) + 2027808484u));
    int _485 = (uint)((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))) >> 5;
    int _487 = _484 ^ ((int)((uint)(_485) + 2123724318u));
    int _492 = ((int)((((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))) + 387276957u));
    int _493 = (uint)((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))) >> 5;
    int _495 = _492 ^ (_493 + -939442524);
    int _500 = ((int)((((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46))))) + 387276957u));
    int _501 = (uint)((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46))))) >> 5;
    int _503 = _500 ^ ((int)((uint)(_501) + 2123724318u));
    int _508 = ((int)((((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))))) + (uint)(-1253254570)));
    int _509 = (uint)((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))))) >> 5;
    int _511 = _508 ^ (_509 + -939442524);
    int _516 = ((int)((((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))))) + (uint)(-1253254570)));
    int _517 = (uint)((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))))) >> 5;
    int _519 = _516 ^ ((int)((uint)(_517) + 2123724318u));
    int _524 = ((int)((((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))))) + 1401181199u));
    int _525 = (uint)((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))))) >> 5;
    int _527 = _524 ^ (_525 + -939442524);
    int _532 = ((int)((((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46))))))) + 1401181199u));
    int _533 = (uint)((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46))))))) >> 5;
    int _535 = _532 ^ ((int)((uint)(_533) + 2123724318u));
    int _540 = ((int)((((uint)(_535) + ((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_535) + ((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))))))) + (uint)(-239350328)));
    int _541 = (uint)((uint)(_535) + ((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x)))))))) >> 5;
    int _543 = _540 ^ (_541 + -939442524);
    int _548 = ((int)((((uint)(_543) + ((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))))))) << 4) + (uint)(-1383041155))) ^ ((int)(((uint)(_543) + ((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))))))) + (uint)(-239350328)));
    int _549 = (uint)((uint)(_543) + ((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))))))) >> 5;
    int _551 = _548 ^ ((int)((uint)(_549) + 2123724318u));
    int _553 = ((int)((uint)(_543) + ((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46))))))))) & 16777215;
    bool _554 = (_553 == 0);
    if (_554) {
      int _559 = ((int)((((uint)(_551) + ((uint)(_535) + ((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))))))) << 4) + (uint)(-1556008596))) ^ ((int)(((uint)(_551) + ((uint)(_535) + ((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))))))) + (uint)(-1879881855)));
      int _560 = (uint)((uint)(_551) + ((uint)(_535) + ((uint)(_519) + ((uint)(_503) + ((uint)(_487) + ((uint)(_471) + ((uint)(_455) + ((uint)(_439) + (uint)(_frameNumber.x))))))))) >> 5;
      int _562 = _559 ^ (_560 + -939442524);
      _565 = ((int)((uint)(_562) + ((uint)(_543) + ((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46))))))))));
    } else {
      _565 = ((int)((uint)(_543) + ((uint)(_527) + ((uint)(_511) + ((uint)(_495) + ((uint)(_479) + ((uint)(_463) + ((uint)(_447) + (uint)(_46)))))))));
    }
    uint _566 = _565 * 48271;
    uint2 _568 = __3__36__0__0__g_normalDepth.Load(int3(_360, _372, 0));
    int _571 = _568.y & 16777215;
    float _572 = float((uint)(uint)(_571));
    float _573 = _572 * 5.960465188081798e-08f;
    int _574 = (uint)((uint)(_568.x)) >> 10;
    int _575 = (uint)((uint)(_568.x)) >> 20;
    int _576 = _568.x & 1023;
    int _577 = _574 & 1023;
    int _578 = _575 & 1023;
    float _579 = float((uint)(uint)(_576));
    float _580 = float((uint)(uint)(_577));
    float _581 = float((uint)(uint)(_578));
    float _582 = _579 * 0.001956947147846222f;
    float _583 = _580 * 0.001956947147846222f;
    float _584 = _581 * 0.001956947147846222f;
    float _585 = _582 + -1.0f;
    float _586 = _583 + -1.0f;
    float _587 = _584 + -1.0f;
    float _588 = min(1.0f, _585);
    float _589 = min(1.0f, _586);
    float _590 = min(1.0f, _587);
    float _591 = dot(float3(_588, _589, _590), float3(_588, _589, _590));
    float _592 = rsqrt(_591);
    float _593 = _592 * _588;
    float _594 = _592 * _589;
    float _595 = _592 * _590;
    float _596 = float((int)(_360));
    float _597 = float((int)(_372));
    float _598 = _596 + 0.5f;
    float _599 = _597 + 0.5f;
    float _600 = _bufferSizeAndInvSize.z * 4.0f;
    float _601 = _600 * _598;
    float _602 = _601 + -1.0f;
    float _603 = _bufferSizeAndInvSize.w * 4.0f;
    float _604 = _603 * _599;
    float _605 = 1.0f - _604;
    float _606 = max(1.0000000116860974e-07f, _573);
    float _607 = _602 * (_invViewProjRelative[0].x);
    float _608 = mad((_invViewProjRelative[0].y), _605, _607);
    float _609 = mad((_invViewProjRelative[0].z), _606, _608);
    float _610 = _609 + (_invViewProjRelative[0].w);
    float _611 = _602 * (_invViewProjRelative[1].x);
    float _612 = mad((_invViewProjRelative[1].y), _605, _611);
    float _613 = mad((_invViewProjRelative[1].z), _606, _612);
    float _614 = _613 + (_invViewProjRelative[1].w);
    float _615 = _602 * (_invViewProjRelative[2].x);
    float _616 = mad((_invViewProjRelative[2].y), _605, _615);
    float _617 = mad((_invViewProjRelative[2].z), _606, _616);
    float _618 = _617 + (_invViewProjRelative[2].w);
    float _619 = _602 * (_invViewProjRelative[3].x);
    float _620 = mad((_invViewProjRelative[3].y), _605, _619);
    float _621 = mad((_invViewProjRelative[3].z), _606, _620);
    float _622 = _621 + (_invViewProjRelative[3].w);
    float _623 = _610 / _622;
    float _624 = _614 / _622;
    float _625 = _618 / _622;
    float _626 = _623 + _422;
    float _627 = _624 + _423;
    float _628 = _625 + _424;
    float _629 = dot(float3(_378, _379, _380), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    float _631 = __3__38__0__1__g_raytracingDiffuseRayInversePDFUAV.Load(int2(_360, _372));
    float _633 = _631.x * 2.0f;
    float _634 = saturate(_633);
    uint _639 = _180 * -856141137;
    int _640 = (int)(_639) & 16777215;
    float _641 = float((uint)(uint)(_640));
    float _642 = _641 * 4.7624109811295057e-07f;
    uint _643 = uint(_642);
    _645 = 0;
    _646 = 0;
    _647 = 1;
    _648 = 1.0f;
    _649 = 0.0f;
    _650 = 0.0f;
    _651 = 0.0f;
    _652 = 0.0f;
    _653 = 0.0f;
    _654 = 0.0f;
    _655 = 0.0f;
    _656 = 0.0f;
    _657 = 0.0f;
    _658 = 0.0f;
    _659 = 0.0f;
    _660 = 0.0f;
    _661 = 0.0f;
    while(true) {
      bool _662 = (_645 == 4);
      if (!_662) {
        bool _664 = (_645 == 0);
        if (!_664) {
          int _667 = (uint)((uint)(_645) + _643) >> 1;
          int _668 = _667 & 1;
          int _669 = (uint)((uint)(_645) + _643) >> 2;
          int _670 = _669 & 1;
          int _671 = _670 ^ 1;
          int _673 = ((int)(((uint)(_645) + _643) << 1)) & 2;
          int _676 = 1 - (_668 << 1);
          int _678 = _668 ^ 1;
          int _680 = _676 * (_673 + -1);
          int _681 = 0 - (_671 | _668);
          int _682 = (_673 + -1) & _681;
          int _683 = 0 - (_671 | _678);
          int _684 = _680 & _683;
          _688 = ((int)((uint)(_682) + (uint)(_345)));
          _689 = ((int)((uint)(_684) + (uint)(_346)));
        } else {
          _688 = _345;
          _689 = _346;
        }
      } else {
        _688 = (int)(SV_DispatchThreadID.x);
        _689 = (int)(SV_DispatchThreadID.y);
      }
      int _690 = _645 & -5;
      bool _691 = (_690 == 0);
      bool _692 = (_340) && (_691);
      if (_692) {
        int _694 = (int)(_566) & 3;
        int _695 = (uint)(_566) >> 2;
        int _696 = _695 & 3;
        int _699 = ((int)((uint)(_688) + (uint)(_694))) ^ 3;
        int _700 = ((int)((uint)(_689) + (uint)(_696))) ^ 3;
        uint _701 = (uint)(_699) - (uint)(_694);
        uint _702 = (uint)(_700) - (uint)(_696);
        _704 = (int)(_701);
        _705 = (int)(_702);
      } else {
        _704 = _688;
        _705 = _689;
      }
      float _706 = float((int)(_704));
      float _707 = float((int)(_705));
      float _708 = _bufferSizeAndInvSize.x + -1.0f;
      float _709 = _bufferSizeAndInvSize.y + -1.0f;
      bool _710 = (_706 > _708);
      bool _711 = (_707 > _709);
      bool _712 = ((int)_704 < (int)0);
      bool _713 = ((int)_705 < (int)0);
      bool _716 = ((_712) || (_710) || (_713) || (_711));
      bool __defer_703_942 = false;
      if (_716) {
        _943 = _646;
        _944 = _647;
        _945 = _648;
        _946 = _649;
        _947 = _650;
        _948 = _651;
        _949 = _652;
        _950 = _653;
        _951 = _654;
        _952 = _655;
        _953 = _656;
        _954 = _657;
        _955 = _658;
        _956 = _659;
        _957 = _660;
        _958 = _661;
        __defer_703_942 = true;
      } else {
        uint _719 = __3__36__0__0__g_depthOpaquePrev.Load(int3(_704, _705, 0));
        int _721 = _719.x & 16777215;
        float _722 = float((uint)(uint)(_721));
        float _723 = _722 * 5.960465188081798e-08f;
        uint _725 = __3__36__0__0__g_sceneNormalPrev.Load(int3(_704, _705, 0));
        int _727 = (uint)((uint)(_725.x)) >> 10;
        int _728 = (uint)((uint)(_725.x)) >> 20;
        int _729 = _725.x & 1023;
        int _730 = _727 & 1023;
        int _731 = _728 & 1023;
        float _732 = float((uint)(uint)(_729));
        float _733 = float((uint)(uint)(_730));
        float _734 = float((uint)(uint)(_731));
        float _735 = _732 * 0.001956947147846222f;
        float _736 = _733 * 0.001956947147846222f;
        float _737 = _734 * 0.001956947147846222f;
        float _738 = _735 + -1.0f;
        float _739 = _736 + -1.0f;
        float _740 = _737 + -1.0f;
        float _741 = min(1.0f, _738);
        float _742 = min(1.0f, _739);
        float _743 = min(1.0f, _740);
        float _744 = dot(float3(_741, _742, _743), float3(_741, _742, _743));
        float _745 = rsqrt(_744);
        float _746 = _706 + 0.5f;
        float _747 = _707 + 0.5f;
        float _751 = _746 * 2.0f;
        float _752 = _751 * _bufferSizeAndInvSize.z;
        float _753 = _752 + -1.0f;
        float _754 = _747 * 2.0f;
        float _755 = _754 * _bufferSizeAndInvSize.w;
        float _756 = 1.0f - _755;
        float _757 = max(1.0000000116860974e-07f, _723);
        if (_662) {
          float _779 = (_invViewProjRelative[0].x) * _753;
          float _780 = mad((_invViewProjRelative[0].y), _756, _779);
          float _781 = mad((_invViewProjRelative[0].z), _757, _780);
          float _782 = _781 + (_invViewProjRelative[0].w);
          float _783 = (_invViewProjRelative[1].x) * _753;
          float _784 = mad((_invViewProjRelative[1].y), _756, _783);
          float _785 = mad((_invViewProjRelative[1].z), _757, _784);
          float _786 = _785 + (_invViewProjRelative[1].w);
          float _787 = (_invViewProjRelative[2].x) * _753;
          float _788 = mad((_invViewProjRelative[2].y), _756, _787);
          float _789 = mad((_invViewProjRelative[2].z), _757, _788);
          float _790 = _789 + (_invViewProjRelative[2].w);
          float _791 = (_invViewProjRelative[3].x) * _753;
          float _792 = mad((_invViewProjRelative[3].y), _756, _791);
          float _793 = mad((_invViewProjRelative[3].z), _757, _792);
          float _794 = _793 + (_invViewProjRelative[3].w);
          float _795 = _782 / _794;
          float _796 = _786 / _794;
          float _797 = _790 / _794;
          _839 = _795;
          _840 = _796;
          _841 = _797;
        } else {
          float _819 = (_invViewProjRelativePrev[0].x) * _753;
          float _820 = mad((_invViewProjRelativePrev[0].y), _756, _819);
          float _821 = mad((_invViewProjRelativePrev[0].z), _757, _820);
          float _822 = _821 + (_invViewProjRelativePrev[0].w);
          float _823 = (_invViewProjRelativePrev[1].x) * _753;
          float _824 = mad((_invViewProjRelativePrev[1].y), _756, _823);
          float _825 = mad((_invViewProjRelativePrev[1].z), _757, _824);
          float _826 = _825 + (_invViewProjRelativePrev[1].w);
          float _827 = (_invViewProjRelativePrev[2].x) * _753;
          float _828 = mad((_invViewProjRelativePrev[2].y), _756, _827);
          float _829 = mad((_invViewProjRelativePrev[2].z), _757, _828);
          float _830 = _829 + (_invViewProjRelativePrev[2].w);
          float _831 = (_invViewProjRelativePrev[3].x) * _753;
          float _832 = mad((_invViewProjRelativePrev[3].y), _756, _831);
          float _833 = mad((_invViewProjRelativePrev[3].z), _757, _832);
          float _834 = _833 + (_invViewProjRelativePrev[3].w);
          float _835 = _822 / _834;
          float _836 = _826 / _834;
          float _837 = _830 / _834;
          _839 = _835;
          _840 = _836;
          _841 = _837;
        }
        float _842 = _745 * 511.0f;
        float _843 = _842 * _743;
        float _844 = _843 + 511.5f;
        uint _845 = uint(_844);
        float _846 = _842 * _742;
        float _847 = _846 + 511.5f;
        uint _848 = uint(_847);
        float _849 = _842 * _741;
        float _850 = _849 + 511.5f;
        uint _851 = uint(_850);
        int _852 = (int)(_851) & 1023;
        uint4 _854 = __3__36__0__0__g_diffuseGIReservoirHitGeometryPrev.Load(int3(_704, _705, 0));
        uint2 _860 = __3__36__0__0__g_diffuseGIReservoirRadiancePrev.Load(int3(_704, _705, 0));
        int _863 = (int)(_848) & 1023;
        int _864 = (int)(_845) & 1023;
        float _865 = float((uint)(uint)(_852));
        float _866 = float((uint)(uint)(_863));
        float _867 = float((uint)(uint)(_864));
        float _868 = _865 * 0.001956947147846222f;
        float _869 = _866 * 0.001956947147846222f;
        float _870 = _867 * 0.001956947147846222f;
        float _871 = _868 + -1.0f;
        float _872 = _869 + -1.0f;
        float _873 = _870 + -1.0f;
        float _874 = min(1.0f, _871);
        float _875 = min(1.0f, _872);
        float _876 = min(1.0f, _873);
        float _877 = dot(float3(_874, _875, _876), float3(_874, _875, _876));
        float _878 = rsqrt(_877);
        float _879 = _878 * _874;
        float _880 = _878 * _875;
        float _881 = _878 * _876;
        float _882 = asfloat(_854.x);
        float _883 = asfloat(_854.y);
        float _884 = asfloat(_854.z);
        int _885 = (uint)((uint)(_854.w)) >> 10;
        int _886 = (uint)((uint)(_854.w)) >> 20;
        int _887 = _854.w & 1023;
        int _888 = _885 & 1023;
        int _889 = _886 & 1023;
        float _890 = float((uint)(uint)(_887));
        float _891 = float((uint)(uint)(_888));
        float _892 = float((uint)(uint)(_889));
        float _893 = _890 * 0.001956947147846222f;
        float _894 = _891 * 0.001956947147846222f;
        float _895 = _892 * 0.001956947147846222f;
        float _896 = _893 + -1.0f;
        float _897 = _894 + -1.0f;
        float _898 = _895 + -1.0f;
        float _899 = min(1.0f, _896);
        float _900 = min(1.0f, _897);
        float _901 = min(1.0f, _898);
        float _902 = dot(float3(_899, _900, _901), float3(_899, _900, _901));
        float _903 = rsqrt(_902);
        float _904 = _903 * _899;
        float _905 = _903 * _900;
        float _906 = _903 * _901;
        int _907 = (uint)((uint)(_860.x)) >> 16;
        float _908 = f16tof32((uint)(_907));
        int _909 = _860.x & 1023;
        int _910 = (uint)((uint)(_860.x)) >> 10;
        int _911 = _910 & 63;
        float _912 = asfloat(_860.y);
        float _913 = _839 - _diffViewPosAccurate.x;
        float _914 = _840 - _diffViewPosAccurate.y;
        float _915 = _841 - _diffViewPosAccurate.z;
        float _916 = _882 - _diffViewPosAccurate.x;
        float _917 = _883 - _diffViewPosAccurate.y;
        float _918 = _884 - _diffViewPosAccurate.z;
        float _919 = _913 - _262;
        float _920 = _914 - _263;
        float _921 = _915 - _264;
        float _922 = dot(float3(_919, _920, _921), float3(_919, _920, _921));
        float _923 = dot(float3(_879, _880, _881), float3(_211, _212, _213));
        float _928 = dot(float3(_viewDir.x, _viewDir.y, _viewDir.z), float3(_913, _914, _915));
        bool _929 = (_922 > _432);
        bool __branch_chain_838;
        if (_929) {
          _943 = _911;
          _944 = _909;
          _945 = _912;
          _946 = _908;
          _947 = _904;
          _948 = _905;
          _949 = _906;
          _950 = _916;
          _951 = _917;
          _952 = _918;
          _953 = _879;
          _954 = _880;
          _955 = _881;
          _956 = _913;
          _957 = _914;
          _958 = _915;
          __branch_chain_838 = true;
        } else {
          float _931 = _928 - _267;
          float _932 = abs(_931);
          float _933 = _267 * 0.019999999552965164f;
          float _934 = max(0.5f, _933);
          bool _937 = ((_928 <= 0.20000000298023224f) || (_932 >= _934));
          if (_937) {
            _943 = _911;
            _944 = _909;
            _945 = _912;
            _946 = _908;
            _947 = _904;
            _948 = _905;
            _949 = _906;
            _950 = _916;
            _951 = _917;
            _952 = _918;
            _953 = _879;
            _954 = _880;
            _955 = _881;
            _956 = _913;
            _957 = _914;
            _958 = _915;
            __branch_chain_838 = true;
          } else {
            bool _939 = !_662;
            bool _940 = (_923 <= 0.0f);
            bool _941 = (_940) && (_939);
            if (_941) {
              _943 = _911;
              _944 = _909;
              _945 = _912;
              _946 = _908;
              _947 = _904;
              _948 = _905;
              _949 = _906;
              _950 = _916;
              _951 = _917;
              _952 = _918;
              _953 = _879;
              _954 = _880;
              _955 = _881;
              _956 = _913;
              _957 = _914;
              _958 = _915;
              __branch_chain_838 = true;
            } else {
              _962 = true;
              _963 = _911;
              _964 = _909;
              _965 = _912;
              _966 = _908;
              _967 = _904;
              _968 = _905;
              _969 = _906;
              _970 = _916;
              _971 = _917;
              _972 = _918;
              _973 = _879;
              _974 = _880;
              _975 = _881;
              _976 = _913;
              _977 = _914;
              _978 = _915;
              __branch_chain_838 = false;
            }
          }
        }
        if (__branch_chain_838) {
          __defer_703_942 = true;
        }
      }
      if (__defer_703_942) {
        bool _960 = ((uint)(_645 + 1) < (uint)5);
        if (_960) {
          _645 = (_645 + 1);
          _646 = _943;
          _647 = _944;
          _648 = _945;
          _649 = _946;
          _650 = _947;
          _651 = _948;
          _652 = _949;
          _653 = _950;
          _654 = _951;
          _655 = _952;
          _656 = _953;
          _657 = _954;
          _658 = _955;
          _659 = _956;
          _660 = _957;
          _661 = _958;
          continue;
        } else {
          _962 = false;
          _963 = _943;
          _964 = _944;
          _965 = _945;
          _966 = _946;
          _967 = _947;
          _968 = _948;
          _969 = _949;
          _970 = _950;
          _971 = _951;
          _972 = _952;
          _973 = _953;
          _974 = _954;
          _975 = _955;
          _976 = _956;
          _977 = _957;
          _978 = _958;
        }
      }
      float _983 = (_environmentLightingHistory[1].w) + _temporalReprojectionParams.w;
      float _984 = saturate(_983);
      float _989 = _970 - _262;
      float _990 = _971 - _263;
      float _991 = _972 - _264;
      float _993 = dot(float3((_970 - _976), (_971 - _977), (_972 - _978)), float3((_970 - _976), (_971 - _977), (_972 - _978)));
      float _995 = dot(float3(_989, _990, _991), float3(_989, _990, _991));
      float _998 = rsqrt(_995);
      float _999 = rsqrt(_993);
      float _1000 = _995 * dot(float3(_999 * (_970 - _976), _999 * (_971 - _977), _999 * (_972 - _978)), float3(_967, _968, _969));
      float _1004 = _998 * _989;
      float _1005 = _998 * _990;
      float _1006 = _998 * _991;
      float _1012 = min(max(((-0.0f - (_993 * dot(float3(_1004, _1005, _1006), float3(_967, _968, _969)))) / (-0.0f - _1000)), 0.0f), 1.0f);
      if (!(_962) || ((_962) && (!(!(((dot(float3((_970 - _262), (_971 - _263), (_972 - _264)), float3((_970 - _262), (_971 - _263), (_972 - _264)))) * (dot(float3(((rsqrt((dot(float3((_970 - _976), (_971 - _977), (_972 - _978)), float3((_970 - _976), (_971 - _977), (_972 - _978)))))) * (_970 - _976)), ((rsqrt((dot(float3((_970 - _976), (_971 - _977), (_972 - _978)), float3((_970 - _976), (_971 - _977), (_972 - _978)))))) * (_971 - _977)), ((rsqrt((dot(float3((_970 - _976), (_971 - _977), (_972 - _978)), float3((_970 - _976), (_971 - _977), (_972 - _978)))))) * (_972 - _978))), float3(_967, _968, _969)))) >= -0.0f)))) || (((_962) && (!(((dot(float3((_970 - _262), (_971 - _263), (_972 - _264)), float3((_970 - _262), (_971 - _263), (_972 - _264)))) * (dot(float3(((rsqrt((dot(float3((_970 - _976), (_971 - _977), (_972 - _978)), float3((_970 - _976), (_971 - _977), (_972 - _978)))))) * (_970 - _976)), ((rsqrt((dot(float3((_970 - _976), (_971 - _977), (_972 - _978)), float3((_970 - _976), (_971 - _977), (_972 - _978)))))) * (_971 - _977)), ((rsqrt((dot(float3((_970 - _976), (_971 - _977), (_972 - _978)), float3((_970 - _976), (_971 - _977), (_972 - _978)))))) * (_972 - _978))), float3(_967, _968, _969)))) >= -0.0f))) && (((min((max(((-0.0f - (_993 * (dot(float3((_998 * _989), (_998 * _990), (_998 * _991)), float3(_967, _968, _969))))) / (-0.0f - _1000)), 0.0f)), 1.0f)) == 0.0f)))) {
        float _1140 = _421 * 511.0f;
        float _1141 = _1140 + 511.5f;
        uint _1142 = uint(_1141);
        int _1144 = ((int)(_1142 << 20)) & 1072693248;
        float _1145 = _420 * 511.0f;
        float _1146 = _1145 + 511.5f;
        uint _1147 = uint(_1146);
        int _1149 = ((int)(_1147 << 10)) & 1047552;
        float _1150 = _419 * 511.0f;
        float _1151 = _1150 + 511.5f;
        uint _1152 = uint(_1151);
        int _1153 = (int)(_1152) & 1023;
        uint _1156 = f32tof16(_629);
        _1160 = _634;
        _1161 = _626;
        _1162 = _627;
        _1163 = _628;
        _1164 = ((_1149 | _1153) | _1144);
        _1165 = (((int)(_1156 << 16)) | 1025);
      } else {
        float _1015 = dot(float3(_211, _212, _213), float3(_1004, _1005, _1006));
        float _1016 = max(0.10000000149011612f, _1015);
        float _1017 = _966 * 0.31830987334251404f;
        float _1018 = _1017 * _1016;
        float _1019 = float((uint)(uint)(_964));
        float _1020 = _1019 * _965;
        float _1021 = _1020 * _1012;
        float _1022 = _1021 * _1018;
        float _1023 = _626 - _262;
        float _1024 = _627 - _263;
        float _1025 = _628 - _264;
        float _1026 = dot(float3(_1023, _1024, _1025), float3(_1023, _1024, _1025));
        float _1027 = rsqrt(_1026);
        float _1028 = _1027 * _1023;
        float _1029 = _1027 * _1024;
        float _1030 = _1027 * _1025;
        float _1031 = dot(float3(_211, _212, _213), float3(_1028, _1029, _1030));
        float _1032 = max(0.10000000149011612f, _1031);
        float _1033 = _629 * 0.31830987334251404f;
        float _1034 = _1033 * _1032;
        float _1035 = _1034 * _634;
        uint _1036 = _180 * -613502015;
        int _1037 = (int)(_1036) & 16777215;
        float _1038 = float((uint)(uint)(_1037));
        float _1039 = _1038 * 5.960464477539063e-08f;
        float _1040 = 1.0f - _984;
        float _1041 = select(_340, 1.0f, _1040);
        float _1042 = _1039 * _1041;
        bool _1044 = (_renderParams.y > 0.0f);
        // RenoDX: Smooth exposure M cap sigmoid replaces linear cliff
        float _1052;
        if (RR_ENABLED == 1.f && RT_QUALITY >= 1.f) {
          float _rndx_t = rcp(1.0f + exp(-6.0f * (_exposure3.w - 0.5f)));
          _1052 = renodx::math::Select(((_428) || (_1044)), 32.0f, lerp(256.0f, 64.0f, _rndx_t));
        } else {
          float _1047 = _exposure3.w * 10.0f;
          float _1048 = saturate(_1047);
          float _1049 = _1048 * 192.0f;
          float _1050 = 256.0f - _1049;
          bool _1051 = (_428) || (_1044);
          _1052 = select(_1051, 32.0f, _1050);
        }
        uint _1053 = _180 * -556260145;
        int _1054 = (int)(_1053) & 16777215;
        float _1055 = float((uint)(uint)(_1054));
        float _1056 = _1055 * 5.960464477539063e-08f;
        float _1057 = float((uint)(uint)(_963));
        bool _1058 = (_1057 > _1052);
        float _1059 = 1.0f / _1052;
        bool _1060 = (_1056 < _1059);
        bool _1061 = (_1060) || (_1058);
        float _1062 = select(_1061, 0.0f, _1022);
        int _1063 = select(_1061, 0, _964);
        float _1064 = _1062 + _1035;
        float _1066 = _1042 * _1064;
        bool _1067 = !(_1066 <= _1035);
        if (_1067) {
          float _1069 = select(_1061, 0.0f, _966);
          _1071 = _976;
          _1072 = _977;
          _1073 = _978;
          _1074 = _973;
          _1075 = _974;
          _1076 = _975;
          _1077 = _970;
          _1078 = _971;
          _1079 = _972;
          _1080 = _967;
          _1081 = _968;
          _1082 = _969;
          _1083 = _1069;
          _1084 = _963;
          _1085 = _1018;
          _1086 = false;
        } else {
          _1071 = _623;
          _1072 = _624;
          _1073 = _625;
          _1074 = _593;
          _1075 = _594;
          _1076 = _595;
          _1077 = _626;
          _1078 = _627;
          _1079 = _628;
          _1080 = _419;
          _1081 = _420;
          _1082 = _421;
          _1083 = _629;
          _1084 = 0;
          _1085 = _1034;
          _1086 = true;
        }
        float _1087 = _1077 - _1071;
        float _1088 = _1078 - _1072;
        float _1089 = _1079 - _1073;
        float _1090 = dot(float3(_1087, _1088, _1089), float3(_1087, _1088, _1089));
        float _1091 = rsqrt(_1090);
        float _1092 = _1091 * _1087;
        float _1093 = _1091 * _1088;
        float _1094 = _1091 * _1089;
        float _1095 = dot(float3(_1074, _1075, _1076), float3(_1092, _1093, _1094));
        float _1096 = max(0.10000000149011612f, _1095);
        float _1097 = _1083 * 0.31830987334251404f;
        float _1098 = _1097 * _1096;
        float _1099 = select(_1086, _1085, _1098);
        float _1100 = float((uint)(uint)(_1063));
        float _1101 = _1098 * _1100;
        float _1102 = _1101 + _1085;
        float _1103 = _1102 * _1085;
        float _1106 = _exposure4.y * _1083;
        bool _1107 = (_1103 == 0.0f);
        float _1108 = _1099 * _1064;
        float _1109 = _1108 / _1103;
        float _1110 = select(_1107, 0.0f, _1109);
        float _1111 = saturate(_1110);
        uint _1112 = min((uint)(1023), (uint)((int)((uint)(_1063) + 1u)));
        float _1114 = _1082 * 511.0f;
        float _1115 = _1114 + 511.5f;
        uint _1116 = uint(_1115);
        int _1118 = ((int)(_1116 << 20)) & 1072693248;
        float _1119 = _1081 * 511.0f;
        float _1120 = _1119 + 511.5f;
        uint _1121 = uint(_1120);
        int _1123 = ((int)(_1121 << 10)) & 1047552;
        float _1124 = _1080 * 511.0f;
        float _1125 = _1124 + 511.5f;
        uint _1126 = uint(_1125);
        int _1127 = (int)(_1126) & 1023;
        uint _1130 = min((uint)(63), (uint)((int)((uint)(_1084) + 1u)));
        int _1131 = (int)(_1130) & 63;
        uint _1132 = min((uint)(1023), (uint)((int)(_1112)));
        int _1134 = ((int)(_1132 << 10)) & 1047552;
        uint _1136 = f32tof16(_1106);
        _1160 = _1111;
        _1161 = _1077;
        _1162 = _1078;
        _1163 = _1079;
        _1164 = ((_1123 | _1127) | _1118);
        _1165 = ((_1134 | _1131) | ((int)(_1136 << 16)));
      }
      int _1166 = asint(_1163);
      int _1167 = asint(_1162);
      int _1168 = asint(_1161);
      int _1169 = asint(_1160);
      __3__38__0__1__g_diffuseGIReservoirHitGeometryUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = int4(_1168, _1167, _1166, _1164);
      __3__38__0__1__g_diffuseGIReservoirRadianceUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = int2(_1165, _1169);
      break;
    }
  }
}