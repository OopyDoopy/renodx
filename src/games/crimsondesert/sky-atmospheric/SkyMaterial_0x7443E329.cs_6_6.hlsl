#include "../shared.h"
#include "../lighting/diffuse_brdf.hlsli"
#include "aurora_common.hlsli"
#include "moon_common.hlsli"

struct PostProcessSkyStruct {
  uint _moonTexture;
  uint _milkyWayTexture;
  float _milkyWayRatio;
  float _starRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_texSkyInscatter : register(t1, space36);

Texture2D<float4> __3__36__0__0__g_texSkyExtinction : register(t75, space36);

Texture3D<float4> __3__36__0__0__g_texFroxel : register(t83, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t13, space36);

Texture2D<float> __3__36__0__0__g_depthHalf : register(t16, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t17, space36);

Texture2D<uint> __3__36__0__0__g_tileData : register(t37, space36);

RWTexture2D<float4> __3__38__0__1__g_postProcessUAV : register(u0, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b14, space35) {
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

cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b24, space35) {
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

cbuffer __3__35__0__0__PrecomputedAmbientConstantBuffer : register(b25, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b26, space35) {
  uint4 g_tileIndex[4096] : packoffset(c000.x);
};

cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _postProcessParams : packoffset(c000.x);
  float4 _postProcessParams1 : packoffset(c001.x);
  float4 _toneMapParams0 : packoffset(c002.x);
  float4 _toneMapParams1 : packoffset(c003.x);
  float4 _colorGradingParams : packoffset(c004.x);
  float4 _colorCorrectionParams : packoffset(c005.x);
  float4 _localToneMappingParams : packoffset(c006.x);
  float4 _etcParams : packoffset(c007.x);
  float4 _userImageAdjust : packoffset(c008.x);
  float4 _slopeParams : packoffset(c009.x);
  float4 _offsetParams : packoffset(c010.x);
  float4 _powerParams : packoffset(c011.x);
  int _colorBlindParam : packoffset(c012.x);
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

ConstantBuffer<PostProcessSkyStruct> BindlessParameters_PostProcessSky[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

SamplerState __0__4__0__0__g_staticPointClamp : register(s10, space4);

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int _17[4];
  int _27 = (int)(SV_GroupID.x) & 15;
  int _28 = (uint)((uint)(_27)) >> 2;
  _17[0] = ((g_tileIndex[(SV_GroupID.x) >> 7]).x);
  _17[1] = ((g_tileIndex[(SV_GroupID.x) >> 7]).y);
  _17[2] = ((g_tileIndex[(SV_GroupID.x) >> 7]).z);
  _17[3] = ((g_tileIndex[(SV_GroupID.x) >> 7]).w);
  int _46 = _17[(((uint)(SV_GroupID.x) >> 5) & 3)];
  int _50 = select((((int)(SV_GroupID.x) & 16) == 0), _46, ((uint)((uint)(_46)) >> 16));
  uint _62 = __3__36__0__0__g_tileData.Load(int3(((uint)((((uint)((_27 - (_28 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_50) << 5)) & 8160))) >> 5), ((uint)((((uint)(_28 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_50)) >> 3) & 8160))) >> 5), 0));
  bool _65 = ((_62.x & 3) == 0);
  float _66 = float((uint)((((uint)((_27 - (_28 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_50) << 5)) & 8160))));
  float _67 = float((uint)((((uint)(_28 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_50)) >> 3) & 8160))));
  float _73 = (_66 + 0.5f) * _bufferSizeAndInvSize.z;
  float _74 = (_67 + 0.5f) * _bufferSizeAndInvSize.w;
  bool _81;
  float _387;
  float _402;
  float _403;
  float _404;
  float _434;
  float _435;
  float _436;
  float _437;
  float _590;
  float _591;
  float _592;
  int _673;
  float _674;
  float _675;
  float _676;
  int _677;
  int _678;
  int _679;
  int _727;
  float _728;
  float _729;
  float _730;
  float _731;
  float _780;
  float _781;
  float _800;
  float _801;
  float _802;
  float _803;
  float _804;
  float _805;
  float _806;
  [branch]
  if (!_65) {
    float _77 = __3__36__0__0__g_depth.Load(int3(((int)((((uint)((_27 - (_28 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_50) << 5)) & 8160)))), ((int)((((uint)(_28 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_50)) >> 3) & 8160)))), 0));
    _81 = (!(_77.x < 1.0000000116860974e-07f));
  } else {
    _81 = false;
  }
  uint2 _83 = __3__36__0__0__g_stencil.Load(int3(((int)((((uint)((_27 - (_28 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_50) << 5)) & 8160)))), ((int)((((uint)(_28 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_50)) >> 3) & 8160)))), 0));
  int _85 = _83.x & 127;
  if (!((_81) && ((_85 != 10)))) {
    float _92 = (_73 * 2.0f) + -1.0f;
    float _95 = ((1.0f - _74) * 2.0f) + -1.0f;
    float _131 = ((_invViewProjRelative[3].w) + (_invViewProjRelative[3].z)) + mad((_invViewProjRelative[3].y), _95, ((_invViewProjRelative[3].x) * _92));
    float _132 = ((mad((_invViewProjRelative[0].y), _95, ((_invViewProjRelative[0].x) * _92)) + (_invViewProjRelative[0].z)) + (_invViewProjRelative[0].w)) / _131;
    float _133 = (((_invViewProjRelative[1].w) + (_invViewProjRelative[1].z)) + mad((_invViewProjRelative[1].y), _95, ((_invViewProjRelative[1].x) * _92))) / _131;
    float _134 = (((_invViewProjRelative[2].w) + (_invViewProjRelative[2].z)) + mad((_invViewProjRelative[2].y), _95, ((_invViewProjRelative[2].x) * _92))) / _131;
    float _136 = rsqrt(dot(float3(_132, _133, _134), float3(_132, _133, _134)));
    float _137 = _136 * _132;
    float _138 = _136 * _133;
    float _139 = _136 * _134;
    float _145 = ((_earthAxisTilt + 90.0f) - _latitude) * 0.01745329238474369f;
    float _146 = sin(_145);
    float _147 = cos(_145);
    float _151 = (_time.w * 0.2617993950843811f) + -3.1415927410125732f;
    float _152 = sin(_151);
    float _153 = cos(_151);
    float _154 = 1.0f - _153;
    float _155 = _154 * _146;
    float _156 = _154 * _147;
    float _157 = _152 * _146;
    float _158 = _152 * _147;
    float _168 = mad((-0.0f - _157), _139, mad(_158, _138, (_153 * _137)));
    float _172 = mad((_156 * _146), _139, mad(((_155 * _146) + _153), _138, (-0.0f - (_137 * _158))));
    float _175 = mad(((_156 * _147) + _153), _139, mad((_155 * _147), _138, (_157 * _137)));
    float _177 = atan(_175 / _168);
    bool _180 = (_168 < 0.0f);
    bool _181 = (_168 == 0.0f);
    bool _182 = (_175 >= 0.0f);
    bool _183 = (_175 < 0.0f);
    int _196 = WaveReadLaneFirst(_materialIndex);
    int _204 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(select(((uint)_196 < (uint)170000), _196, 0)) + 0u))]._milkyWayTexture);
    float4 _211 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_204 < (uint)65000), _204, 0)) + 0u))].SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(select(((_181) && (_182)), 0.75f, select(((_181) && (_183)), 0.25f, ((select(((_180) && (_183)), (_177 + -3.1415927410125732f), select(((_180) && (_182)), (_177 + 3.1415927410125732f), _177)) * 0.15915493667125702f) + 0.5f))), (acos(_172) * 0.31830987334251404f)), 0.0f);
    float _221 = float((int)(int(_168 * 2000.0f)));
    float _222 = float((int)(int(_172 * 2000.0f)));
    float _223 = float((int)(int(_175 * 2000.0f)));
    float _236 = frac((sin((_222 * 5.0000002374872565e-05f) + (_221 * 0.008500000461935997f)) * 10000.0f) * (abs(sin((_222 * 0.006500000134110451f) + (_221 * 0.0005000000237487257f))) + 0.10000000149011612f));
    float _248 = frac((sin((_236 * 17.0f) + (_223 * 5.0000002374872565e-05f)) * 10000.0f) * (abs(sin(_236 + (_223 * 0.006500000134110451f))) + 0.10000000149011612f));
    float _255 = float((int)(int(_168 * 1500.0f)));
    float _256 = float((int)(int(_172 * 1500.0f)));
    float _257 = float((int)(int(_175 * 1500.0f)));
    float _270 = frac((sin((_256 * 6.666666740784422e-05f) + (_255 * 0.01133333332836628f)) * 10000.0f) * (abs(sin((_256 * 0.008666666224598885f) + (_255 * 0.0006666666595265269f))) + 0.10000000149011612f));
    float _282 = frac((sin((_270 * 17.0f) + (_257 * 6.666666740784422e-05f)) * 10000.0f) * (abs(sin(_270 + (_257 * 0.008666666224598885f))) + 0.10000000149011612f));
    float _286 = saturate((_248 + -0.699999988079071f) * 3.3333332538604736f) * 1.5f;
    float _290 = (_286 * _211.x) + _211.x;
    float _291 = (_286 * _211.y) + _211.y;
    float _292 = (_286 * _211.z) + _211.z;
    float _296 = saturate((_282 + -0.9800000190734863f) * 50.00004959106445f) * 9.0f;
    int _303 = WaveReadLaneFirst(_materialIndex);
    float _311 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(select(((uint)_303 < (uint)170000), _303, 0)) + 0u))]._milkyWayRatio);
    int _324 = WaveReadLaneFirst(_materialIndex);
    float _333 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(select(((uint)_324 < (uint)170000), _324, 0)) + 0u))]._starRatio) * ((saturate((_282 + -0.9994999766349792f) * 1999.906494140625f) * 3.0f) + (saturate((_248 + -0.9990000128746033f) * 1000.0128784179688f) * 0.10000000149011612f));
    float _334 = _333 + (_311 * ((_290 * _296) + _290));
    float _335 = _333 + (_311 * ((_291 * _296) + _291));
    float _336 = _333 + (_311 * ((_292 * _296) + _292));
    float _sunViewDot = dot(float3(_137, _138, _139), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z));
    float _sunRadiusVanilla = _sunSizeAngle * 0.01745329238474369f;
    float _sunAngle = acos(clamp(_sunViewDot, -1.0f, 1.0f));
    float _355, _356, _357;
    if (SUN_IMPROVEMENTS == 1.f) {
      float _sunRadius = _sunRadiusVanilla * 2.5f;
      float _sunRadiusR = _sunRadius;
      float _sunRadiusG = _sunRadius * 1.01f;
      float _sunRadiusB = _sunRadius * 1.02f;
      float _pixelAngle = _sunRadius * 0.05f;
      float _sunEdgeR = 1.0f - smoothstep(_sunRadiusR - _pixelAngle, _sunRadiusR + _pixelAngle, _sunAngle);
      float _sunEdgeG = 1.0f - smoothstep(_sunRadiusG - _pixelAngle, _sunRadiusG + _pixelAngle, _sunAngle);
      float _sunEdgeB = 1.0f - smoothstep(_sunRadiusB - _pixelAngle, _sunRadiusB + _pixelAngle, _sunAngle);

      float _sunDiskR = saturate(_sunAngle / max(_sunRadius, 1e-6f));
      float _sunDiskMu = sqrt(1.0f - _sunDiskR * _sunDiskR);
      float _sunLimbDark = pow(max(0.001f, _sunDiskMu), 0.6f);
      float _sunMaskR = _sunEdgeR * _sunLimbDark;
      float _sunMaskG = _sunEdgeG * _sunLimbDark;
      float _sunMaskB = _sunEdgeB * ((_sunLimbDark * 0.92f) + 0.08f);
      float _sunLum = min(1e+06f, _precomputedAmbient7.x);

      float _coronaR = max(0.0f, _sunAngle - _sunRadiusR) / max(_sunRadius, 1e-6f);
      float _corona = (_sunLum * 0.006f) / (1.0f + (_coronaR * _coronaR * 10.0f));
      _corona *= saturate(_sunDirection.y * 5.0f);
      float _coronaContribR = _corona * 1.10f;
      float _coronaContribG = _corona * 0.95f;
      float _coronaContribB = _corona * 0.75f;

      float _g = _miePhaseConst;
      float _g2 = _g * _g;
      float _denom = max(1e-6f, 1.0f + _g2 - (2.0f * _g * _sunViewDot));
      float _hg = (1.0f - _g2) / (_denom * sqrt(_denom));
      float _hgResidual = max(0.0f, (_hg * 0.07957747f) - 0.07957747f);
      float _gauss = exp((-0.5f * (_sunAngle * _sunAngle)) / (0.087f * 0.087f));
      float _diskMask = smoothstep(_sunRadius * 0.8f, _sunRadius * 1.5f, _sunAngle);
      float _mieHalo = _sunLum * (_mieAerosolDensity * 2e-5f) * _hgResidual * _gauss * _diskMask * saturate(_sunDirection.y * 5.0f);

      _355 = (_sunMaskR * (_sunLum - _334)) + _334 + _coronaContribR + _mieHalo;
      _356 = (_sunMaskG * (_sunLum - _335)) + _335 + _coronaContribG + _mieHalo;
      _357 = (_sunMaskB * (_sunLum - _336)) + _336 + _coronaContribB + _mieHalo;
    } else {
      float _sunMask = select((_sunViewDot > _sunSizeAngleCosine), 1.0f, 0.0f);
      float _sunLum = min(1e+06f, _precomputedAmbient7.x);
      _355 = (_sunMask * (_sunLum - _334)) + _334;
      _356 = (_sunMask * (_sunLum - _335)) + _335;
      _357 = (_sunMask * (_sunLum - _336)) + _336;
    }
    float _moonSizeScale = renodx::math::Select(MOON_ADJUSTMENTS == 1.f, max(1.0f, MOON_DISK_SIZE), 1.0f);
    float _moonSizeAngleAdjusted = _moonSizeAngle * _moonSizeScale;
    float _365 = sin(_moonSizeAngleAdjusted * 0.01745329238474369f);
    float _366 = -0.0f - _moonDirection.x;
    float _367 = -0.0f - _moonDirection.y;
    float _368 = -0.0f - _moonDirection.z;
    float _369 = dot(float3(_137, _138, _139), float3(_137, _138, _139));
    float _371 = dot(float3(_366, _367, _368), float3(_137, _138, _139)) * 2.0f;
    float _378 = (_371 * _371) - ((_369 * 4.0f) * (dot(float3(_366, _367, _368), float3(_366, _367, _368)) - (_365 * _365)));
    if (!(_378 < 0.0f)) {
      _387 = (((-0.0f - _371) - sqrt(_378)) / (_369 * 2.0f));
    } else {
      _387 = -1.0f;
    }
    if (!(!(_387 >= 0.0f))) {
      float _393 = (_387 * _137) - _moonDirection.x;
      float _394 = (_387 * _138) - _moonDirection.y;
      float _395 = (_387 * _139) - _moonDirection.z;
      float _397 = rsqrt(dot(float3(_393, _394, _395), float3(_393, _394, _395)));
      _402 = (_397 * _393);
      _403 = (_397 * _394);
      _404 = (_397 * _395);
    } else {
      _402 = 0.0f;
      _403 = 0.0f;
      _404 = 0.0f;
    }
    float _406 = rsqrt(dot(float3(_moonDirection.x, _moonDirection.y, _moonDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z)));
    if (dot(float3(_137, _138, _139), float3((_406 * _moonDirection.x), (_406 * _moonDirection.y), (_406 * _moonDirection.z))) > cos(_moonSizeAngleAdjusted * 0.01745329238474369f)) {
      float3 _sphereN = float3(_402, _403, _404);
      float3 _sunDir = float3(_sunDirection.x, _sunDirection.y, _sunDirection.z);
      float _moonRaw = _precomputedAmbient7.z;
      float _moonLum = _moonRaw;
      if (MOON_ADJUSTMENTS == 1.f) {
        _moonLum *= 0.01f;
      }
      float _moonNdotL = saturate(dot(_sphereN, _sunDir));
      float _moonShading;
      if (MOON_ADJUSTMENTS == 1.f) {
        static const float MOON_ROUGHNESS = 0.9f;
        float3 _viewDir = float3(_137, _138, _139);
        float _NdotV = saturate(dot(_sphereN, -_viewDir));
        float _LdotV = dot(_sunDir, -_viewDir);
        float _eonScalar = EON_DiffuseScalar(_moonNdotL, _NdotV, _LdotV, MOON_ROUGHNESS);
        float _eonShading = _moonNdotL * _eonScalar * 1.3f;
        float3 _moonFwd = float3(_406 * _moonDirection.x, _406 * _moonDirection.y, _406 * _moonDirection.z);
        float _NdotV_moon = saturate(dot(_sphereN, _moonFwd));
        float _limbDark = MoonLimbDarkening(_NdotV_moon, MOON_LIMB_DARKENING);
        float _innerGlow = MoonInnerGlow(_NdotV_moon, MOON_GLOW_STRENGTH);
        float _brightMul = MoonBrightnessMultiplier(AE_DYNAMISM_HIGH, MOON_BRIGHTNESS);
        _moonShading = (_eonShading * _limbDark + _innerGlow) * _brightMul;
      } else {
        _moonShading = _moonNdotL;
      }
      float _moonDiskLight = _moonShading * _moonLum;
      _434 = renodx::math::Select(MOON_ADJUSTMENTS == 1.f, _moonDiskLight * 0.35f, _moonDiskLight);
      _435 = 1.0f;
      _436 = ((dot(float3(_402, _403, _404), float3(_moonRight.x, _moonRight.y, _moonRight.z)) * 0.5f) + 0.5f);
      _437 = ((dot(float3(_402, _403, _404), float3(_moonUp.x, _moonUp.y, _moonUp.z)) * 0.5f) + 0.5f);
    } else {
      _434 = 0.0f;
      _435 = 0.0f;
      _436 = 0.0f;
      _437 = 0.0f;
    }
    int _438 = WaveReadLaneFirst(_materialIndex);
    int _446 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(select(((uint)_438 < (uint)170000), _438, 0)) + 0u))]._moonTexture);
    float4 _453 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_446 < (uint)65000), _446, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_436, _437));
    float _466 = (((_453.x * _434) - _355) * _435) + _355;
    float _467 = (((_453.y * _434) - _356) * _435) + _356;
    float _468 = (((_453.z * _434) - _357) * _435) + _357;
    float _471 = floor(_time.x);
    if (frac(sqrt(abs(_471 * 0.36841699481010437f)) * 3734.421875f) < 0.10000000149011612f) {
      float _479 = _471 + 60.0f;
      float _495 = (frac(sin(_479 * 22.037681579589844f) * 435.5429992675781f) * 2.0f) + -1.0f;
      float _496 = (frac(sin(_479 * 85.1673583984375f) * 435.5429992675781f) * 2.0f) + -1.0f;
      float _497 = (frac(sin(_479 * 124.43804168701172f) * 435.5429992675781f) * 2.0f) + -1.0f;
      float _499 = rsqrt(dot(float3(_495, _496, _497), float3(_495, _496, _497)));
      float _500 = _499 * _495;
      float _501 = _499 * _496;
      float _502 = _497 * _499;
      if (dot(float3(_168, _172, _175), float3(_500, _501, _502)) > 0.9900000095367432f) {
        float _506 = frac(_time.x);
        float _516 = frac(sin(_471 * 22.037681579589844f) * 435.5429992675781f);
        float _517 = frac(sin(_471 * 85.1673583984375f) * 435.5429992675781f);
        float _518 = frac(sin(_471 * 124.43804168701172f) * 435.5429992675781f);
        float _527 = saturate(_506 * 1.5f) * 100.0f;
        float _528 = _527 * ((_516 * 0.5f) + -0.25f);
        float _529 = _527 * ((_517 * 0.5f) + -0.25f);
        float _530 = _527 * ((_518 * 0.5f) + -0.25f);
        float _531 = _168 * 100.0f;
        float _532 = _172 * 100.0f;
        float _535 = (_528 * _532) - (_529 * _531);
        if (!(abs(_535) < 0.05000000074505806f)) {
          float _550 = ((_500 + 0.125f) - (_516 * 0.25f)) * -100.0f;
          float _551 = ((_501 + 0.125f) - (_517 * 0.25f)) * -100.0f;
          float _555 = ((_550 * _532) - (_551 * _531)) / _535;
          float _560 = _555 * _530;
          if (!(abs((_560 + (((_502 + 0.125f) - (_518 * 0.25f)) * 100.0f)) - ((_175 * 100.0f) * (((_529 * _550) - (_528 * _551)) / _535))) > 0.05000000074505806f)) {
            float _571 = dot(float3((_555 * _528), (_555 * _529), _560), float3(_528, _529, _530)) / dot(float3(_528, _529, _530), float3(_528, _529, _530));
            if (((_571 >= 0.0f)) && ((_571 <= 1.0f))) {
              float _576 = _571 * _571;
              float _577 = _576 * _576;
              float _582 = 1.0f - saturate((_506 + -0.5f) * 2.0f);
              float _584 = (_577 * _577) * (_582 * _582);
              float _585 = _584 * _584;
              _590 = (_585 + _466);
              _591 = (_585 + _467);
              _592 = (_585 + _468);
            } else {
              _590 = _466;
              _591 = _467;
              _592 = _468;
            }
          } else {
            _590 = _466;
            _591 = _467;
            _592 = _468;
          }
        } else {
          _590 = _466;
          _591 = _467;
          _592 = _468;
        }
      } else {
        _590 = _466;
        _591 = _467;
        _592 = _468;
      }
    } else {
      _590 = _466;
      _591 = _467;
      _592 = _468;
    }
    float _609 = 1.0f - (_74 * 2.0f);
    float _645 = mad((_invViewProjRelative[3].z), 1.0000000116860974e-07f, mad((_invViewProjRelative[3].y), _609, ((_invViewProjRelative[3].x) * _92))) + (_invViewProjRelative[3].w);
    float _646 = (mad((_invViewProjRelative[0].z), 1.0000000116860974e-07f, mad((_invViewProjRelative[0].y), _609, ((_invViewProjRelative[0].x) * _92))) + (_invViewProjRelative[0].w)) / _645;
    float _647 = (mad((_invViewProjRelative[1].z), 1.0000000116860974e-07f, mad((_invViewProjRelative[1].y), _609, ((_invViewProjRelative[1].x) * _92))) + (_invViewProjRelative[1].w)) / _645;
    float _648 = (mad((_invViewProjRelative[2].z), 1.0000000116860974e-07f, mad((_invViewProjRelative[2].y), _609, ((_invViewProjRelative[2].x) * _92))) + (_invViewProjRelative[2].w)) / _645;
    float _654 = sqrt(((_647 * _647) + (_646 * _646)) + (_648 * _648));
    if (_654 > 128.0f) {
      float _659 = _nearFarProj.x * 1e+07f;
      float _663 = 2.0f / _bufferSizeAndInvSize.x;
      float _664 = 2.0f / _bufferSizeAndInvSize.y;
      [branch]
      if (!_65) {
        _673 = 1;
        _674 = _659;
        _675 = _659;
        _676 = _659;
        _677 = 0;
        _678 = 0;
        _679 = 0;
        while(true) {
          int _680 = _679 * (((((int)((((uint)(_28 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_50)) >> 3) & 8160)))) % 2) << 1) + -1);
          float _683 = (float((int)(_680)) * _664) + _74;
          float _686 = __3__36__0__0__g_depthHalf.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_73, _683), 0.0f);
          float _691 = _nearFarProj.x / max(1.0000000116860974e-07f, _686.x);
          float _695 = abs(_691 - _659);
          bool _696 = (_695 < _676);
          float _700 = select(_696, _695, _676);
          float _705 = __3__36__0__0__g_depthHalf.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(((float((int)(((((int)((((uint)((_27 - (_28 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_50) << 5)) & 8160)))) % 2) << 1) + -1)) * _663) + _73), _683), 0.0f);
          float _708 = _nearFarProj.x / max(1.0000000116860974e-07f, _705.x);
          float _709 = min(min(_674, _691), _708);
          float _710 = max(max(_675, _691), _708);
          float _712 = abs(_708 - _659);
          bool _713 = (_712 < _700);
          int _716 = select(_713, ((int)(uint)((int)(_705.x < 1.0000000116860974e-07f))), select(_696, ((int)(uint)((int)(_686.x < 1.0000000116860974e-07f))), _673));
          int _718 = select(_713, (((((int)((((uint)((_27 - (_28 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_50) << 5)) & 8160)))) % 2) << 1) + -1), select(_696, 0, _677));
          int _720 = select(((_713) || (_696)), _680, _678);
          if (!((_679 + 1) == 2)) {
            _673 = _716;
            _674 = _709;
            _675 = _710;
            _676 = select(_713, _712, _700);
            _677 = _718;
            _678 = _720;
            _679 = (_679 + 1);
            continue;
          }
          _727 = _716;
          _728 = _709;
          _729 = _710;
          _730 = float((int)(_718));
          _731 = float((int)(_720));
          break;
        }
      } else {
        _727 = 1;
        _728 = _659;
        _729 = _659;
        _730 = 0.0f;
        _731 = 0.0f;
      }
      if (!(((_729 - _728) / _729) > ((max(0.0f, (_728 + -20000.0f)) * 9.999999747378752e-05f) + 0.10000000149011612f))) {
        uint _748 = uint(((_bufferSizeAndInvSize.x * _67) + _66) + float((uint)((uint)(((int)(_frameNumber.x * 11)) & 1023))));
        int _749 = (uint)(_748) >> 1;
        int _751 = (uint)(_748) >> 3;
        float _763 = float((uint)_748);
        float _766 = 0.33676624298095703f / sqrt(_763 + -0.30000001192092896f);
        float _771 = ((float((uint)((uint)(((int)(_749 * -1029531031)) ^ _751))) * 2.3283064365386963e-10f) + -0.5f) * ((_763 * 0.7548776268959045f) + _766);
        float _772 = ((float((uint)((uint)(((int)((((int)(_749 * 1103515245)) ^ 1) * 1103515245)) ^ _751))) * 2.3283064365386963e-10f) + -0.5f) * ((_763 * 0.5698402523994446f) + _766);
        _780 = ((-0.5f - floor(_771)) + _771);
        _781 = ((-0.5f - floor(_772)) + _772);
      } else {
        _780 = _730;
        _781 = _731;
      }
      float _784 = (_780 * _663) + _73;
      float _785 = (_781 * _664) + _74;
      float4 _788 = __3__36__0__0__g_texSkyInscatter.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_784, _785), 0.0f);
      float4 _793 = __3__36__0__0__g_texSkyExtinction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_784, _785), 0.0f);
      _800 = _788.x;
      _801 = _788.y;
      _802 = _788.z;
      _803 = _793.x;
      _804 = _793.y;
      _805 = _793.z;
      _806 = select((_727 != 0), 1.0f, 0.0f);
    } else {
      _800 = 0.0f;
      _801 = 0.0f;
      _802 = 0.0f;
      _803 = 1.0f;
      _804 = 1.0f;
      _805 = 1.0f;
      _806 = 1.0f;
    }
    uint _821 = uint(((_bufferSizeAndInvSize.x * _67) + _66) + float((uint)((uint)(((int)(_frameNumber.x * 101)) & 1023))));
    int _822 = (uint)(_821) >> 1;
    int _824 = (uint)(_821) >> 3;
    float _836 = float((uint)_821);
    float _839 = 0.33676624298095703f / sqrt(_836 + -0.30000001192092896f);
    float _844 = ((float((uint)((uint)(((int)(_822 * -1029531031)) ^ _824))) * 2.3283064365386963e-10f) + -0.5f) * ((_836 * 0.7548776268959045f) + _839);
    float _845 = ((float((uint)((uint)(((int)((((int)(_822 * 1103515245)) ^ 1) * 1103515245)) ^ _824))) * 2.3283064365386963e-10f) + -0.5f) * ((_836 * 0.5698402523994446f) + _839);
    float _849 = float((uint)((uint)(_frameNumber.x & 1023)));
    float4 _892 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(min((1.0f - ((float((bool)(uint)((_bufferSizeAndInvSize.x - (_etcParams.y * 4.0f)) > 0.0f)) + 0.5f) / _etcParams.y)), ((((-0.5f - floor(_844)) + _844) / _etcParams.y) + _73)), min((1.0f - ((float((bool)(uint)((_bufferSizeAndInvSize.y - (_etcParams.z * 4.0f)) > 0.0f)) + 0.5f) / _etcParams.z)), ((((-0.5f - floor(_845)) + _845) / _etcParams.z) + _74)), ((max(0.0f, (log2((max(0.0f, _654) * 0.04351966083049774f) + 1.0f) * 17.673004150390625f)) - frac(frac(dot(float2(((_849 * 32.665000915527344f) + _66), ((_849 * 11.8149995803833f) + _67)), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f)) / _etcParams.w)), 0.0f);
    float _924 = mad((_projToPrevProj[3].z), 0.009999999776482582f, mad((_projToPrevProj[3].y), _609, ((_projToPrevProj[3].x) * _92))) + (_projToPrevProj[3].w);
    float _927 = ((mad((_projToPrevProj[0].z), 0.009999999776482582f, mad((_projToPrevProj[0].y), _609, ((_projToPrevProj[0].x) * _92))) + (_projToPrevProj[0].w)) / _924) - _92;
    float _928 = ((mad((_projToPrevProj[1].z), 0.009999999776482582f, mad((_projToPrevProj[1].y), _609, ((_projToPrevProj[1].x) * _92))) + (_projToPrevProj[1].w)) / _924) - _609;
    float _934 = dot(float3(_803, _804, _805), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f)) * _892.w;
    float _937 = saturate(1.0f - (sqrt((_928 * _928) + (_927 * _927)) * 20.0f));
    bool _941 = (_85 == 10);
    float _945 = select(_941, 1.0f, _892.w);
    float _952 = _945 * _806;
    float _finalR = (((_945 * _800) + select(_941, 0.0f, _892.x)) + ((_803 * (((_591 * 0.3395099937915802f) + (_590 * 0.6131200194358826f)) + (_592 * 0.047370001673698425f))) * _952));
    float _finalG = (((_945 * _801) + select(_941, 0.0f, _892.y)) + ((_804 * (((_591 * 0.9163600206375122f) + (_590 * 0.07020000368356705f)) + (_592 * 0.013450000435113907f))) * _952));
    float _finalB = (((_945 * _802) + select(_941, 0.0f, _892.z)) + ((_805 * (((_591 * 0.10958000272512436f) + (_590 * 0.02061999961733818f)) + (_592 * 0.8697999715805054f))) * _952));

    [branch]
    if (AURORA_BOREALIS_ENABLED) {
      float3 aurora = ComputeAurora(
        float3(_137, _138, _139),
        _time.x,
        ComputeNightGate(_sunDirection.y),
        _frameNumber.x,
        uint2((uint)_66, (uint)_67),
        _ssaoRandomDirection
      );
      aurora *= float3(_803, _804, _805);
      aurora *= _945;
      float moonWashout = 1.f - saturate(_precomputedAmbient7.z * 0.0005f);
      aurora *= lerp(1.f, moonWashout, 0.3f);
      aurora *= AuroraBrightnessDampening(AE_DYNAMISM_HIGH);

      _finalR += mad(aurora.r, 0.6131200194358826f, mad(aurora.g, 0.3395099937915802f, aurora.b * 0.047370001673698425f));
      _finalG += mad(aurora.r, 0.07020000368356705f, mad(aurora.g, 0.9163600206375122f, aurora.b * 0.013450000435113907f));
      _finalB += mad(aurora.r, 0.02061999961733818f, mad(aurora.g, 0.10958000272512436f, aurora.b * 0.8697999715805054f));
    }

    __3__38__0__1__g_postProcessUAV[int2(((int)((((uint)((_27 - (_28 << 2)) << 3)) + SV_GroupThreadID.x) + ((uint)(((int)((uint)(_50) << 5)) & 8160)))), ((int)((((uint)(_28 << 3)) + SV_GroupThreadID.y) + ((uint)(((uint)((uint)(_50)) >> 3) & 8160)))))] = float4(_finalR, _finalG, _finalB, ((_937 + _934) - (_937 * _934)));
  }
}
