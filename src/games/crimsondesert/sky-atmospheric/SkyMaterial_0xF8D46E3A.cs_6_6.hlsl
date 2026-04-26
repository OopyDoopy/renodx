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

Texture2D<float4> __3__36__0__0__g_texSkyExtinction : register(t70, space36);

Texture3D<float4> __3__36__0__0__g_texFroxel : register(t84, space36);

Texture2D<float> __3__36__0__0__g_depth : register(t13, space36);

Texture2D<float> __3__36__0__0__g_depthHalf : register(t16, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t17, space36);

Texture2D<uint> __3__36__0__0__g_tileData : register(t37, space36);

RWTexture2D<float4> __3__38__0__1__g_postProcessUAV : register(u0, space38);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b11, space35) {
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

cbuffer __3__35__0__0__AtmosphereConstantBuffer : register(b13, space35) {
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

cbuffer __3__35__0__0__PrecomputedAmbientConstantBuffer : register(b27, space35) {
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

cbuffer __3__35__0__0__TileConstantBuffer : register(b28, space35) {
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
  int3 _padding : packoffset(c012.y);
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
  int _30 = _27 - (_28 << 2);
  int _33 = (uint)(SV_GroupID.x) >> 4;
  int _34 = (uint)(SV_GroupID.x) >> 6;
  int _35 = _33 & 3;
  _17[0] = ((g_tileIndex[_34]).x);
  _17[1] = ((g_tileIndex[_34]).y);
  _17[2] = ((g_tileIndex[_34]).z);
  _17[3] = ((g_tileIndex[_34]).w);
  int _46 = _17[_35];
  int _47 = (uint)((uint)(_46)) >> 16;
  int _49 = ((int)((uint)(_46) << 5)) & 2097120;
  // Precompute pixel coordinates for reuse (aurora, UAV write, etc.)
  uint _pixelX = ((uint)(_49) + SV_GroupThreadID.x) + ((uint)(_30 << 3));
  uint _pixelY = (((uint)(_28 << 3)) + SV_GroupThreadID.y) + ((uint)(_47 << 5));
  int _55 = (uint)(_pixelX) >> 5;
  int _56 = (uint)(_pixelY) >> 5;
  uint _58 = __3__36__0__0__g_tileData.Load(int3(_55, _56, 0));
  int _60 = _58.x & 3;
  bool _61 = (_60 == 0);
  float _62 = float((uint)_pixelX);
  float _63 = float((uint)_pixelY);
  float _64 = _62 + 0.5f;
  float _65 = _63 + 0.5f;
  float _69 = _64 * _bufferSizeAndInvSize.z;
  float _70 = _65 * _bufferSizeAndInvSize.w;
  bool _77;
  float _383;
  float _398;
  float _399;
  float _400;
  float _430;
  float _431;
  float _432;
  float _433;
  float _586;
  float _587;
  float _588;
  int _669;
  float _670;
  float _671;
  float _672;
  int _673;
  int _674;
  int _675;
  int _723;
  float _724;
  float _725;
  float _726;
  float _727;
  float _776;
  float _777;
  float _796;
  float _797;
  float _798;
  float _799;
  float _800;
  float _801;
  float _802;
  [branch]
  if (!_61) {
    float _73 = __3__36__0__0__g_depth.Load(int3(((int)_pixelX), ((int)_pixelY), 0));
    bool _75 = !(_73.x < 1.0000000116860974e-07f);
    _77 = _75;
  } else {
    _77 = false;
  }
  uint2 _79 = __3__36__0__0__g_stencil.Load(int3(((int)_pixelX), ((int)_pixelY), 0));
  int _81 = _79.x & 127;
  bool _82 = (_81 != 10);
  bool _83 = (_77) && (_82);
  if (!_83) {
    float _87 = _69 * 2.0f;
    float _88 = _87 + -1.0f;
    float _89 = 1.0f - _70;
    float _90 = _89 * 2.0f;
    float _91 = _90 + -1.0f;
    float _112 = (_invViewProjRelative[0].x) * _88;
    float _113 = mad((_invViewProjRelative[0].y), _91, _112);
    float _114 = _113 + (_invViewProjRelative[0].z);
    float _115 = _114 + (_invViewProjRelative[0].w);
    float _116 = (_invViewProjRelative[1].x) * _88;
    float _117 = mad((_invViewProjRelative[1].y), _91, _116);
    float _118 = (_invViewProjRelative[1].w) + (_invViewProjRelative[1].z);
    float _119 = _118 + _117;
    float _120 = (_invViewProjRelative[2].x) * _88;
    float _121 = mad((_invViewProjRelative[2].y), _91, _120);
    float _122 = (_invViewProjRelative[2].w) + (_invViewProjRelative[2].z);
    float _123 = _122 + _121;
    float _124 = (_invViewProjRelative[3].x) * _88;
    float _125 = mad((_invViewProjRelative[3].y), _91, _124);
    float _126 = (_invViewProjRelative[3].w) + (_invViewProjRelative[3].z);
    float _127 = _126 + _125;
    float _128 = _115 / _127;
    float _129 = _119 / _127;
    float _130 = _123 / _127;
    float _131 = dot(float3(_128, _129, _130), float3(_128, _129, _130));
    float _132 = rsqrt(_131);
    float _133 = _132 * _128;
    float _134 = _132 * _129;
    float _135 = _132 * _130;
    float _139 = _earthAxisTilt + 90.0f;
    float _140 = _139 - _latitude;
    float _141 = _140 * 0.01745329238474369f;
    float _142 = sin(_141);
    float _143 = cos(_141);
    float _146 = _time.w * 0.2617993950843811f;
    float _147 = _146 + -3.1415927410125732f;
    float _148 = sin(_147);
    float _149 = cos(_147);
    float _150 = 1.0f - _149;
    float _151 = _150 * _142;
    float _152 = _150 * _143;
    float _153 = _148 * _142;
    float _154 = _148 * _143;
    float _155 = -0.0f - _153;
    float _156 = _151 * _142;
    float _157 = _156 + _149;
    float _158 = _152 * _142;
    float _159 = _151 * _143;
    float _160 = _152 * _143;
    float _161 = _160 + _149;
    float _162 = _149 * _133;
    float _163 = mad(_154, _134, _162);
    float _164 = mad(_155, _135, _163);
    float _165 = _133 * _154;
    float _166 = -0.0f - _165;
    float _167 = mad(_157, _134, _166);
    float _168 = mad(_158, _135, _167);
    float _169 = _153 * _133;
    float _170 = mad(_159, _134, _169);
    float _171 = mad(_161, _135, _170);
    float _172 = _171 / _164;
    float _173 = atan(_172);
    float _174 = _173 + 3.1415927410125732f;
    float _175 = _173 + -3.1415927410125732f;
    bool _176 = (_164 < 0.0f);
    bool _177 = (_164 == 0.0f);
    bool _178 = (_171 >= 0.0f);
    bool _179 = (_171 < 0.0f);
    bool _180 = (_176) && (_178);
    float _181 = select(_180, _174, _173);
    bool _182 = (_176) && (_179);
    float _183 = select(_182, _175, _181);
    bool _184 = (_177) && (_179);
    bool _185 = (_177) && (_178);
    float _186 = _183 * 0.15915493667125702f;
    float _187 = _186 + 0.5f;
    float _188 = select(_184, 0.25f, _187);
    float _189 = select(_185, 0.75f, _188);
    float _190 = acos(_168);
    float _191 = _190 * 0.31830987334251404f;
    int _192 = WaveReadLaneFirst(_materialIndex);
    bool _193 = ((uint)_192 < (uint)170000);
    int _194 = select(_193, _192, 0);
    int _200 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(_194) + 0u))]._milkyWayTexture);
    bool _201 = ((uint)_200 < (uint)65000);
    int _202 = select(_201, _200, 0);
    float4 _207 = __0__7__0__0__g_bindlessTextures[((int)((uint)(_202) + 0u))].SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_189, _191), 0.0f);
    float _211 = _164 * 2000.0f;
    float _212 = _168 * 2000.0f;
    float _213 = _171 * 2000.0f;
    int _214 = int(_211);
    int _215 = int(_212);
    int _216 = int(_213);
    float _217 = float((int)(_214));
    float _218 = float((int)(_215));
    float _219 = float((int)(_216));
    float _220 = _217 * 0.0005000000237487257f;
    float _221 = _217 * 0.008500000461935997f;
    float _222 = _218 * 5.0000002374872565e-05f;
    float _223 = _222 + _221;
    float _224 = sin(_223);
    float _225 = _224 * 10000.0f;
    float _226 = _218 * 0.006500000134110451f;
    float _227 = _226 + _220;
    float _228 = sin(_227);
    float _229 = abs(_228);
    float _230 = _229 + 0.10000000149011612f;
    float _231 = _225 * _230;
    float _232 = frac(_231);
    float _233 = _232 * 17.0f;
    float _234 = _219 * 5.0000002374872565e-05f;
    float _235 = _233 + _234;
    float _236 = sin(_235);
    float _237 = _236 * 10000.0f;
    float _238 = _219 * 0.006500000134110451f;
    float _239 = _232 + _238;
    float _240 = sin(_239);
    float _241 = abs(_240);
    float _242 = _241 + 0.10000000149011612f;
    float _243 = _237 * _242;
    float _244 = frac(_243);
    float _245 = _164 * 1500.0f;
    float _246 = _168 * 1500.0f;
    float _247 = _171 * 1500.0f;
    int _248 = int(_245);
    int _249 = int(_246);
    int _250 = int(_247);
    float _251 = float((int)(_248));
    float _252 = float((int)(_249));
    float _253 = float((int)(_250));
    float _254 = _251 * 0.0006666666595265269f;
    float _255 = _251 * 0.01133333332836628f;
    float _256 = _252 * 6.666666740784422e-05f;
    float _257 = _256 + _255;
    float _258 = sin(_257);
    float _259 = _258 * 10000.0f;
    float _260 = _252 * 0.008666666224598885f;
    float _261 = _260 + _254;
    float _262 = sin(_261);
    float _263 = abs(_262);
    float _264 = _263 + 0.10000000149011612f;
    float _265 = _259 * _264;
    float _266 = frac(_265);
    float _267 = _266 * 17.0f;
    float _268 = _253 * 6.666666740784422e-05f;
    float _269 = _267 + _268;
    float _270 = sin(_269);
    float _271 = _270 * 10000.0f;
    float _272 = _253 * 0.008666666224598885f;
    float _273 = _266 + _272;
    float _274 = sin(_273);
    float _275 = abs(_274);
    float _276 = _275 + 0.10000000149011612f;
    float _277 = _271 * _276;
    float _278 = frac(_277);
    float _279 = _244 + -0.699999988079071f;
    float _280 = _279 * 3.3333332538604736f;
    float _281 = saturate(_280);
    float _282 = _281 * 1.5f;
    float _283 = _282 * _207.x;
    float _284 = _282 * _207.y;
    float _285 = _282 * _207.z;
    float _286 = _283 + _207.x;
    float _287 = _284 + _207.y;
    float _288 = _285 + _207.z;
    float _289 = _278 + -0.9800000190734863f;
    float _290 = _289 * 50.00004959106445f;
    float _291 = saturate(_290);
    float _292 = _291 * 9.0f;
    float _293 = _286 * _292;
    float _294 = _287 * _292;
    float _295 = _288 * _292;
    float _296 = _293 + _286;
    float _297 = _294 + _287;
    float _298 = _295 + _288;
    int _299 = WaveReadLaneFirst(_materialIndex);
    bool _300 = ((uint)_299 < (uint)170000);
    int _301 = select(_300, _299, 0);
    float _307 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(_301) + 0u))]._milkyWayRatio);
    float _308 = _307 * _296;
    float _309 = _307 * _297;
    float _310 = _307 * _298;
    float _311 = _244 + -0.9990000128746033f;
    float _312 = _311 * 1000.0128784179688f;
    float _313 = saturate(_312);
    float _314 = _313 * 0.10000000149011612f;
    float _315 = _278 + -0.9994999766349792f;
    float _316 = _315 * 1999.906494140625f;
    float _317 = saturate(_316);
    float _318 = _317 * 3.0f;
    float _319 = _318 + _314;
    int _320 = WaveReadLaneFirst(_materialIndex);
    bool _321 = ((uint)_320 < (uint)170000);
    int _322 = select(_321, _320, 0);
    float _328 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(_322) + 0u))]._starRatio);
    float _329 = _328 * _319;
    float _330 = _329 + _308;
    float _331 = _329 + _309;
    float _332 = _329 + _310;
    float _337 = dot(float3(_133, _134, _135), float3(_sunDirection.x, _sunDirection.y, _sunDirection.z));
    float _340 = _sunSizeAngle * 0.01745329238474369f;
    float _341 = acos(clamp(_337, -1.0f, 1.0f));
    float _353, _354, _355;
    if (SUN_MOON_ADJUSTMENTS == 1.f) {

      float _sunRadius = _340 * 2.5f;

      // --- DEBUG TOGGLES: set to 0 to disable each feature for isolation testing ---
      #define SUN_ENABLE_CHROMATIC_DISPERSION 1
      #define SUN_ENABLE_LIMB_DARKENING       1
      #define SUN_ENABLE_CORONA               1
      #define SUN_ENABLE_MIE_HALO             1
      #define SUN_ENABLE_LUM_REDUCTION        0

      // --- Chromatic edge dispersion -------------------------------------------
      // Blue channel is refracted ~2% wider than red at the limb for atmospheric dispersion.
      #if SUN_ENABLE_CHROMATIC_DISPERSION
      float _sunRadiusR = _sunRadius;
      float _sunRadiusG = _sunRadius * 1.01f;
      float _sunRadiusB = _sunRadius * 1.02f;
      #else
      float _sunRadiusR = _sunRadius;
      float _sunRadiusG = _sunRadius;
      float _sunRadiusB = _sunRadius;
      #endif
      float _pixelAngle = _sunRadius * 0.05f;
      float _sunEdgeR = 1.0f - smoothstep(_sunRadiusR - _pixelAngle, _sunRadiusR + _pixelAngle, _341);
      float _sunEdgeG = 1.0f - smoothstep(_sunRadiusG - _pixelAngle, _sunRadiusG + _pixelAngle, _341);
      float _sunEdgeB = 1.0f - smoothstep(_sunRadiusB - _pixelAngle, _sunRadiusB + _pixelAngle, _341);

      // --- Limb darkening via Hestroffer power law --------------------------------
      #if SUN_ENABLE_LIMB_DARKENING
      float _r = saturate(_341 / max(_sunRadius, 1e-6f));
      float _mu = sqrt(1.0f - _r * _r);
      float _limbDark = pow(max(0.001f, _mu), 0.6f);
      #else
      float _limbDark = 1.0f;
      #endif

      // Sun disk colour: warm center (5778K-ish) very slightly to the limb.
      float _sunMaskR = _sunEdgeR * _limbDark;
      float _sunMaskG = _sunEdgeG * _limbDark;
      float _sunMaskB = _sunEdgeB * (_limbDark * 0.92f + 0.08f);

      // Added 10x brightness reduction so that postprocess bloom doesnt blow out the sun
      #if SUN_ENABLE_LUM_REDUCTION
      float _sunLum = min(100000.0f, _precomputedAmbient7.x) * 0.1f;
      #else
      float _sunLum = min(1e+06f, _precomputedAmbient7.x);
      #endif

      // --- K corona: falloff past the disk rim ---------------
      // Mimics electron scattering corona: independent of bloom 
      #if SUN_ENABLE_CORONA
      float _coronaR = max(0.0f, _341 - _sunRadiusR) / max(_sunRadius, 1e-6f);
      float _corona  = _sunLum * 0.006f / (1.0f + _coronaR * _coronaR * 10.0f);
      // Gate corona by sun elevation so it vanishes below the horizon,
      // matching the Mie halo behaviour. Without this a bright ass
      // gradient is present in the night sky where the sun set.
      float _coronaElev = saturate(_sunDirection.y * 5.0f);
      _corona *= _coronaElev;
      // Corona is slightly warm and tints channels accordingly.
      float _coronaContribR = _corona * 1.10f;
      float _coronaContribG = _corona * 0.95f;
      float _coronaContribB = _corona * 0.75f;
      #else
      float _coronaContribR = 0.0f;
      float _coronaContribG = 0.0f;
      float _coronaContribB = 0.0f;
      #endif

      // ---- Circumsolar aureole --------------------
      //
      // The atmospheric inscatter LUT already ray marches full Mie scattering with
      // the HG phase function
      //
      // We just add the missing mie halo for the sun, since the base game doesnt apply one
      //
      #if SUN_ENABLE_MIE_HALO
      float _mieHalo;
      {
        float _g       = _miePhaseConst;
        float _g2      = _g * _g;
        float _denom   = max(1e-6f, 1.0f + _g2 - 2.0f * _g * _337);
        float _HG      = (1.0f - _g2) / (_denom * sqrt(_denom)); 
        float _HG_4pi  = _HG * 0.07957747f;                       
        float _HG_iso  = 0.07957747f;
        float _HG_residual = max(0.0f, _HG_4pi - _HG_iso);
        float _sigma   = 0.087f;
        float _gauss   = exp(-0.5f * (_341 * _341) / (_sigma * _sigma));
        float _diskMask = smoothstep(_sunRadius * 0.8f, _sunRadius * 1.5f, _341);
        float _sunElev = saturate(_sunDirection.y * 5.0f);
        float _beta_sca = _mieAerosolDensity * 2e-5f;
        _mieHalo = _sunLum * _beta_sca * _HG_residual * _gauss * _diskMask * _sunElev;
      }
      #else
      float _mieHalo = 0.0f;
      #endif

      _353 = _sunMaskR * (_sunLum - _330) + _330 + _coronaContribR + _mieHalo;
      _354 = _sunMaskG * (_sunLum - _331) + _331 + _coronaContribG + _mieHalo;
      _355 = _sunMaskB * (_sunLum - _332) + _332 + _coronaContribB + _mieHalo;
    } else {
      // Vanilla: Just a hard binary disk + original luminance cap
      bool _342 = (_341 < _340);
      float _343 = select(_342, 1.0f, 0.0f);
      float _346 = min(1e+06f, _precomputedAmbient7.x);
      _353 = _343 * (_346 - _330) + _330;
      _354 = _343 * (_346 - _331) + _331;
      _355 = _343 * (_346 - _332) + _332;
    }
    // Moon size: Is now scalable via slider
    float _moonSizeAngleAdj = _moonSizeAngle * max(1.0f, MOON_DISK_SIZE);
    float _362 = _moonSizeAngleAdj * 0.01745329238474369f;
    float _363 = sin(_362);
    float _364 = -0.0f - _moonDirection.x;
    float _365 = -0.0f - _moonDirection.y;
    float _366 = -0.0f - _moonDirection.z;
    float _367 = dot(float3(_133, _134, _135), float3(_133, _134, _135));
    float _368 = dot(float3(_364, _365, _366), float3(_133, _134, _135));
    float _369 = _368 * 2.0f;
    float _370 = dot(float3(_364, _365, _366), float3(_364, _365, _366));
    float _371 = _363 * _363;
    float _372 = _370 - _371;
    float _373 = _369 * _369;
    float _374 = _367 * 4.0f;
    float _375 = _374 * _372;
    float _376 = _373 - _375;
    bool _377 = (_376 < 0.0f);
    if (!_377) {
      float _379 = sqrt(_376);
      float _380 = -0.0f - _369;
      float _381 = _380 - _379;
      float _382 = _367 * 2.0f;
      float _383_val = _381 / _382;
      _383 = _383_val;
    } else {
      _383 = -1.0f;
    }
    bool _386 = !(_383 >= 0.0f);
    if (!_386) {
      float _388 = _383 * _133;
      float _389 = _383 * _134;
      float _390 = _383 * _135;
      float _391 = _388 - _moonDirection.x;
      float _392 = _389 - _moonDirection.y;
      float _393 = _390 - _moonDirection.z;
      float _394 = dot(float3(_391, _392, _393), float3(_391, _392, _393));
      float _395 = rsqrt(_394);
      float _396 = _395 * _391;
      float _397 = _395 * _392;
      float _398_val = _395 * _393;
      _398 = _396;
      _399 = _397;
      _400 = _398_val;
    } else {
      _398 = 0.0f;
      _399 = 0.0f;
      _400 = 0.0f;
    }
    float _401 = dot(float3(_moonDirection.x, _moonDirection.y, _moonDirection.z), float3(_moonDirection.x, _moonDirection.y, _moonDirection.z));
    float _402 = rsqrt(_401);
    float _403 = _402 * _moonDirection.x;
    float _404 = _402 * _moonDirection.y;
    float _405 = _402 * _moonDirection.z;
    float _408 = dot(float3(_133, _134, _135), float3(_403, _404, _405));
    float _409 = acos(_408);
    bool _410 = (_409 < _362);
    if (_410) {
      float3 _sphereN = float3(_398, _399, _400);

      float _412 = dot(_sphereN, float3(_sunDirection.x, _sunDirection.y, _sunDirection.z));
      float _413 = saturate(_412);
      float _418 = dot(_sphereN, float3(_moonRight.x, _moonRight.y, _moonRight.z));
      float _423 = dot(_sphereN, float3(_moonUp.x, _moonUp.y, _moonUp.z));
      float _424 = _418 * 0.5f;
      float _425 = _423 * 0.5f;
      float _426 = _424 + 0.5f;
      float _427 = _425 + 0.5f;

      // Moon luminance: flat 100x brightness reduction to prevent brickwalling.
      // Seems Pearl Abyss just ctrl c + ctrl V'd the sun luminance code and forgot to adjust the moon's
      // Goofy ahh moment
      float _moonRaw = _precomputedAmbient7.z;
      float _moonLum = renodx::math::Select(
        (SUN_MOON_ADJUSTMENTS == 1.f), 
        (_moonRaw * 0.01f),              // 100x reduction
        (_moonRaw));                     // vanilla

      float _moonShading;
      if (SUN_MOON_ADJUSTMENTS == 1.f) {
        // ---- EON diffuse BRDF ----
        static const float MOON_ROUGHNESS = 0.9f;
        float3 _sunDir  = float3(_sunDirection.x, _sunDirection.y, _sunDirection.z);
        float3 _viewDir = float3(_133, _134, _135);
        float _NdotL = _413;
        float _NdotV = saturate(dot(_sphereN, -_viewDir));
        float _LdotV = dot(_sunDir, -_viewDir);
        float _eonScalar = EON_DiffuseScalar(_NdotL, _NdotV, _LdotV, MOON_ROUGHNESS);

        static const float EON_ENERGY_COMPENSATION = 1.30f;
        float _eonShading = _NdotL * _eonScalar * EON_ENERGY_COMPENSATION;

        float3 _moonFwd = float3(_403, _404, _405);
        float _NdotV_moon = saturate(dot(_sphereN, _moonFwd));
        float _limbDark = MoonLimbDarkening(_NdotV_moon, MOON_LIMB_DARKENING);
        float _innerGlow = MoonInnerGlow(_NdotV_moon, MOON_GLOW_STRENGTH);
        float _brightMul = MoonBrightnessMultiplier(AE_DYNAMISM_HIGH, MOON_BRIGHTNESS);

        _moonShading = (_eonShading * _limbDark + _innerGlow) * _brightMul;
      } else {
        // Vanilla
        _moonShading = _413;
      }

      float _429 = _moonShading * _moonLum;
      _430 = _429;
      _431 = 1.0f;
      _432 = _426;
      _433 = _427;
    } else {
      _430 = 0.0f;
      _431 = 0.0f;
      _432 = 0.0f;
      _433 = 0.0f;
    }
    int _434 = WaveReadLaneFirst(_materialIndex);
    bool _435 = ((uint)_434 < (uint)170000);
    int _436 = select(_435, _434, 0);
    int _442 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(_436) + 0u))]._moonTexture);
    bool _443 = ((uint)_442 < (uint)65000);
    int _444 = select(_443, _442, 0);
    float4 _449 = __0__7__0__0__g_bindlessTextures[((int)((uint)(_444) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(_432, _433));
    float _453 = _449.x * _430;
    float _454 = _449.y * _430;
    float _455 = _449.z * _430;
    float _456 = _453 - _353;
    float _457 = _454 - _354;
    float _458 = _455 - _355;
    float _459 = _456 * _431;
    float _460 = _457 * _431;
    float _461 = _458 * _431;
    float _462 = _459 + _353;
    float _463 = _460 + _354;
    float _464 = _461 + _355;

    float _467 = floor(_time.x);
    float _468 = _467 * 0.36841699481010437f;
    float _469 = abs(_468);
    float _470 = sqrt(_469);
    float _471 = _470 * 3734.421875f;
    float _472 = frac(_471);
    bool _473 = (_472 < 0.10000000149011612f);
    if (_473) {
      float _475 = _467 + 60.0f;
      float _476 = _475 * 22.037681579589844f;
      float _477 = _475 * 85.1673583984375f;
      float _478 = _475 * 124.43804168701172f;
      float _479 = sin(_476);
      float _480 = sin(_477);
      float _481 = sin(_478);
      float _482 = _479 * 435.5429992675781f;
      float _483 = _480 * 435.5429992675781f;
      float _484 = _481 * 435.5429992675781f;
      float _485 = frac(_482);
      float _486 = frac(_483);
      float _487 = frac(_484);
      float _488 = _485 * 2.0f;
      float _489 = _486 * 2.0f;
      float _490 = _487 * 2.0f;
      float _491 = _488 + -1.0f;
      float _492 = _489 + -1.0f;
      float _493 = _490 + -1.0f;
      float _494 = dot(float3(_491, _492, _493), float3(_491, _492, _493));
      float _495 = rsqrt(_494);
      float _496 = _495 * _491;
      float _497 = _495 * _492;
      float _498 = _493 * _495;
      float _499 = dot(float3(_164, _168, _171), float3(_496, _497, _498));
      bool _500 = (_499 > 0.9900000095367432f);
      if (_500) {
        float _502 = frac(_time.x);
        float _503 = _467 * 22.037681579589844f;
        float _504 = _467 * 85.1673583984375f;
        float _505 = _467 * 124.43804168701172f;
        float _506 = sin(_503);
        float _507 = sin(_504);
        float _508 = sin(_505);
        float _509 = _506 * 435.5429992675781f;
        float _510 = _507 * 435.5429992675781f;
        float _511 = _508 * 435.5429992675781f;
        float _512 = frac(_509);
        float _513 = frac(_510);
        float _514 = frac(_511);
        float _515 = _512 * 0.5f;
        float _516 = _515 + -0.25f;
        float _517 = _513 * 0.5f;
        float _518 = _517 + -0.25f;
        float _519 = _514 * 0.5f;
        float _520 = _519 + -0.25f;
        float _521 = _502 * 1.5f;
        float _522 = saturate(_521);
        float _523 = _522 * 100.0f;
        float _524 = _523 * _516;
        float _525 = _523 * _518;
        float _526 = _523 * _520;
        float _527 = _164 * 100.0f;
        float _528 = _168 * 100.0f;
        float _529 = _524 * _528;
        float _530 = _525 * _527;
        float _531 = _529 - _530;
        float _532 = abs(_531);
        bool _533 = (_532 < 0.05000000074505806f);
        if (!_533) {
          float _535 = _514 * 0.25f;
          float _536 = _498 + 0.125f;
          float _537 = _536 - _535;
          float _538 = _537 * 100.0f;
          float _539 = _513 * 0.25f;
          float _540 = _497 + 0.125f;
          float _541 = _540 - _539;
          float _542 = _512 * 0.25f;
          float _543 = _496 + 0.125f;
          float _544 = _543 - _542;
          float _545 = _171 * 100.0f;
          float _546 = _544 * -100.0f;
          float _547 = _541 * -100.0f;
          float _548 = _546 * _528;
          float _549 = _547 * _527;
          float _550 = _548 - _549;
          float _551 = _550 / _531;
          float _552 = _525 * _546;
          float _553 = _524 * _547;
          float _554 = _552 - _553;
          float _555 = _554 / _531;
          float _556 = _551 * _526;
          float _557 = _556 + _538;
          float _558 = _545 * _555;
          float _559 = _557 - _558;
          float _560 = abs(_559);
          bool _561 = (_560 > 0.05000000074505806f);
          if (!_561) {
            float _563 = _551 * _524;
            float _564 = _551 * _525;
            float _565 = dot(float3(_563, _564, _556), float3(_524, _525, _526));
            float _566 = dot(float3(_524, _525, _526), float3(_524, _525, _526));
            float _567 = _565 / _566;
            bool _570 = ((_567 >= 0.0f) && (_567 <= 1.0f));
            if (_570) {
              float _572 = _567 * _567;
              float _573 = _572 * _572;
              float _574 = _573 * _573;
              float _575 = _502 + -0.5f;
              float _576 = _575 * 2.0f;
              float _577 = saturate(_576);
              float _578 = 1.0f - _577;
              float _579 = _578 * _578;
              float _580 = _574 * _579;
              float _581 = _580 * _580;
              float _582 = _581 + _462;
              float _583 = _581 + _463;
              float _584 = _581 + _464;
              _586 = _582;
              _587 = _583;
              _588 = _584;
            } else {
              _586 = _462;
              _587 = _463;
              _588 = _464;
            }
          } else {
            _586 = _462;
            _587 = _463;
            _588 = _464;
          }
        } else {
          _586 = _462;
          _587 = _463;
          _588 = _464;
        }
      } else {
        _586 = _462;
        _587 = _463;
        _588 = _464;
      }
    } else {
      _586 = _462;
      _587 = _463;
      _588 = _464;
    }
    float _589 = _586 * 0.6131200194358826f;
    float _590 = _586 * 0.07020000368356705f;
    float _591 = _586 * 0.02061999961733818f;
    float _592 = _587 * 0.3395099937915802f;
    float _593 = _587 * 0.9163600206375122f;
    float _594 = _587 * 0.10958000272512436f;
    float _595 = _592 + _589;
    float _596 = _593 + _590;
    float _597 = _594 + _591;
    float _598 = _588 * 0.047370001673698425f;
    float _599 = _588 * 0.013450000435113907f;
    float _600 = _588 * 0.8697999715805054f;
    float _601 = _595 + _598;
    float _602 = _596 + _599;
    float _603 = _597 + _600;
    float _604 = _70 * 2.0f;
    float _605 = 1.0f - _604;
    float _626 = (_invViewProjRelative[0].x) * _88;
    float _627 = mad((_invViewProjRelative[0].y), _605, _626);
    float _628 = mad((_invViewProjRelative[0].z), 1.0000000116860974e-07f, _627);
    float _629 = _628 + (_invViewProjRelative[0].w);
    float _630 = (_invViewProjRelative[1].x) * _88;
    float _631 = mad((_invViewProjRelative[1].y), _605, _630);
    float _632 = mad((_invViewProjRelative[1].z), 1.0000000116860974e-07f, _631);
    float _633 = _632 + (_invViewProjRelative[1].w);
    float _634 = (_invViewProjRelative[2].x) * _88;
    float _635 = mad((_invViewProjRelative[2].y), _605, _634);
    float _636 = mad((_invViewProjRelative[2].z), 1.0000000116860974e-07f, _635);
    float _637 = _636 + (_invViewProjRelative[2].w);
    float _638 = (_invViewProjRelative[3].x) * _88;
    float _639 = mad((_invViewProjRelative[3].y), _605, _638);
    float _640 = mad((_invViewProjRelative[3].z), 1.0000000116860974e-07f, _639);
    float _641 = _640 + (_invViewProjRelative[3].w);
    float _642 = _629 / _641;
    float _643 = _633 / _641;
    float _644 = _637 / _641;
    float _645 = _642 * _642;
    float _646 = _643 * _643;
    float _647 = _646 + _645;
    float _648 = _644 * _644;
    float _649 = _647 + _648;
    float _650 = sqrt(_649);
    bool _651 = (_650 > 128.0f);
    if (_651) {
      float _655 = _nearFarProj.x * 1e+07f;
      float _659 = 2.0f / _bufferSizeAndInvSize.x;
      float _660 = 2.0f / _bufferSizeAndInvSize.y;
      [branch]
      if (!_61) {
        int _662 = ((int)_pixelX) % 2;
        int _663 = ((int)_pixelY) % 2;
        _669 = 1;
        _670 = _655;
        _671 = _655;
        _672 = _655;
        _673 = 0;
        _674 = 0;
        _675 = 0;
        while(true) {
          int _676 = _675 * ((_663 << 1) + -1);
          float _677 = float((int)(_676));
          float _678 = _677 * _660;
          float _679 = _678 + _70;
          float _682 = __3__36__0__0__g_depthHalf.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_69, _679), 0.0f);
          float _686 = max(1.0000000116860974e-07f, _682.x);
          float _687 = _nearFarProj.x / _686;
          float _688 = min(_670, _687);
          float _689 = max(_671, _687);
          float _690 = _687 - _655;
          float _691 = abs(_690);
          bool _692 = (_691 < _672);
          bool _693 = (_682.x < 1.0000000116860974e-07f);
          int _694 = (int)(uint)((int)(_693));
          int _695 = select(_692, _694, _669);
          float _696 = select(_692, _691, _672);
          int _697 = select(_692, 0, _673);
          float _698 = float((int)((_662 << 1) + -1));
          float _699 = _698 * _659;
          float _700 = _699 + _69;
          float _701 = __3__36__0__0__g_depthHalf.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_700, _679), 0.0f);
          float _703 = max(1.0000000116860974e-07f, _701.x);
          float _704 = _nearFarProj.x / _703;
          float _705 = min(_688, _704);
          float _706 = max(_689, _704);
          float _707 = _704 - _655;
          float _708 = abs(_707);
          bool _709 = (_708 < _696);
          bool _710 = (_701.x < 1.0000000116860974e-07f);
          int _711 = (int)(uint)((int)(_710));
          int _712 = select(_709, _711, _695);
          float _713 = select(_709, _708, _696);
          int _714 = select(_709, ((_662 << 1) + -1), _697);
          bool _715 = (_709) || (_692);
          int _716 = select(_715, _676, _674);
          bool _718 = ((_675 + 1) == 2);
          if (!_718) {
            _669 = _712;
            _670 = _705;
            _671 = _706;
            _672 = _713;
            _673 = _714;
            _674 = _716;
            _675 = (_675 + 1);
            continue;
          }
          float _720 = float((int)(_714));
          float _721 = float((int)(_716));
          _723 = _712;
          _724 = _705;
          _725 = _706;
          _726 = _720;
          _727 = _721;
          break;
        }
      } else {
        _723 = 1;
        _724 = _655;
        _725 = _655;
        _726 = 0.0f;
        _727 = 0.0f;
      }
      float _728 = _725 - _724;
      float _729 = _728 / _725;
      float _730 = _724 + -20000.0f;
      float _731 = max(0.0f, _730);
      float _732 = _731 * 9.999999747378752e-05f;
      float _733 = _732 + 0.10000000149011612f;
      bool _734 = (_729 > _733);
      if (!_734) {
        float _736 = _bufferSizeAndInvSize.x * _63;
        float _737 = _736 + _62;
        uint _740 = _frameNumber.x * 11;
        int _741 = (int)(_740) & 1023;
        float _742 = float((uint)(uint)(_741));
        float _743 = _737 + _742;
        uint _744 = uint(_743);
        int _745 = (uint)(_744) >> 1;
        uint _746 = _745 * -1029531031;
        int _747 = (uint)(_744) >> 3;
        int _748 = (int)(_746) ^ _747;
        float _749 = float((uint)(uint)(_748));
        float _750 = _749 * 2.3283064365386963e-10f;
        uint _751 = _745 * 1103515245;
        int _752 = (int)(_751) ^ 1;
        uint _753 = _752 * 1103515245;
        int _754 = (int)(_753) ^ _747;
        float _755 = float((uint)(uint)(_754));
        float _756 = _755 * 2.3283064365386963e-10f;
        float _757 = _750 + -0.5f;
        float _758 = _756 + -0.5f;
        float _759 = float((uint)_744);
        float _760 = _759 + -0.30000001192092896f;
        float _761 = sqrt(_760);
        float _762 = 0.33676624298095703f / _761;
        float _763 = _759 * 0.7548776268959045f;
        float _764 = _759 * 0.5698402523994446f;
        float _765 = _763 + _762;
        float _766 = _764 + _762;
        float _767 = _757 * _765;
        float _768 = _758 * _766;
        float _769 = floor(_767);
        float _770 = floor(_768);
        float _771 = -0.5f - _769;
        float _772 = _771 + _767;
        float _773 = -0.5f - _770;
        float _774 = _773 + _768;
        _776 = _772;
        _777 = _774;
      } else {
        _776 = _726;
        _777 = _727;
      }
      float _778 = _776 * _659;
      float _779 = _777 * _660;
      float _780 = _778 + _69;
      float _781 = _779 + _70;
      float4 _784 = __3__36__0__0__g_texSkyInscatter.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_780, _781), 0.0f);
      float4 _789 = __3__36__0__0__g_texSkyExtinction.SampleLevel(__0__4__0__0__g_staticPointClamp, float2(_780, _781), 0.0f);
      bool _793 = (_723 != 0);
      float _794 = select(_793, 1.0f, 0.0f);
      _796 = _784.x;
      _797 = _784.y;
      _798 = _784.z;
      _799 = _789.x;
      _800 = _789.y;
      _801 = _789.z;
      _802 = _794;
    } else {
      _796 = 0.0f;
      _797 = 0.0f;
      _798 = 0.0f;
      _799 = 1.0f;
      _800 = 1.0f;
      _801 = 1.0f;
      _802 = 1.0f;
    }
    float _809 = _bufferSizeAndInvSize.x * _63;
    float _810 = _809 + _62;
    uint _813 = _frameNumber.x * 101;
    int _814 = (int)(_813) & 1023;
    float _815 = float((uint)(uint)(_814));
    float _816 = _810 + _815;
    uint _817 = uint(_816);
    int _818 = (uint)(_817) >> 1;
    uint _819 = _818 * -1029531031;
    int _820 = (uint)(_817) >> 3;
    int _821 = (int)(_819) ^ _820;
    float _822 = float((uint)(uint)(_821));
    float _823 = _822 * 2.3283064365386963e-10f;
    uint _824 = _818 * 1103515245;
    int _825 = (int)(_824) ^ 1;
    uint _826 = _825 * 1103515245;
    int _827 = (int)(_826) ^ _820;
    float _828 = float((uint)(uint)(_827));
    float _829 = _828 * 2.3283064365386963e-10f;
    float _830 = _823 + -0.5f;
    float _831 = _829 + -0.5f;
    float _832 = float((uint)_817);
    float _833 = _832 + -0.30000001192092896f;
    float _834 = sqrt(_833);
    float _835 = 0.33676624298095703f / _834;
    float _836 = _832 * 0.7548776268959045f;
    float _837 = _832 * 0.5698402523994446f;
    float _838 = _836 + _835;
    float _839 = _837 + _835;
    float _840 = _830 * _838;
    float _841 = _831 * _839;
    float _842 = floor(_840);
    float _843 = floor(_841);
    int _844 = _frameNumber.x & 1023;
    float _845 = float((uint)(uint)(_844));
    float _846 = _845 * 32.665000915527344f;
    float _847 = _845 * 11.8149995803833f;
    float _848 = _846 + _62;
    float _849 = _847 + _63;
    float _850 = dot(float2(_848, _849), float2(0.0671105608344078f, 0.005837149918079376f));
    float _851 = frac(_850);
    float _852 = _851 * 52.98291778564453f;
    float _853 = frac(_852);
    float _854 = max(0.0f, _650);
    float _855 = _854 * 0.04351966083049774f;
    float _856 = _855 + 1.0f;
    float _857 = log2(_856);
    float _858 = _857 * 17.673004150390625f;
    float _859 = max(0.0f, _858);
    float _860 = _859 - _853;
    float _861 = -0.5f - _842;
    float _862 = _861 + _840;
    float _863 = -0.5f - _843;
    float _864 = _863 + _841;
    float _865 = _862 / _etcParams.y;
    float _866 = _864 / _etcParams.z;
    float _867 = _865 + _69;
    float _868 = _866 + _70;
    float _869 = _860 / _etcParams.w;
    float _871 = _etcParams.y * 4.0f;
    float _872 = _etcParams.z * 4.0f;
    float _873 = _bufferSizeAndInvSize.x - _871;
    float _874 = _bufferSizeAndInvSize.y - _872;
    bool _875 = (_873 > 0.0f);
    bool _876 = (_874 > 0.0f);
    float _877 = float((bool)(uint)(_875));
    float _878 = float((bool)(uint)(_876));
    float _879 = _877 + 0.5f;
    float _880 = _878 + 0.5f;
    float _881 = _879 / _etcParams.y;
    float _882 = _880 / _etcParams.z;
    float _883 = 1.0f - _881;
    float _884 = 1.0f - _882;
    float _885 = min(_883, _867);
    float _886 = min(_884, _868);
    float4 _888 = __3__36__0__0__g_texFroxel.SampleLevel(__0__4__0__0__g_staticBilinearClamp, float3(_885, _886, _869), 0.0f);
    float _909 = (_projToPrevProj[0].x) * _88;
    float _910 = mad((_projToPrevProj[0].y), _605, _909);
    float _911 = mad((_projToPrevProj[0].z), 0.009999999776482582f, _910);
    float _912 = _911 + (_projToPrevProj[0].w);
    float _913 = (_projToPrevProj[1].x) * _88;
    float _914 = mad((_projToPrevProj[1].y), _605, _913);
    float _915 = mad((_projToPrevProj[1].z), 0.009999999776482582f, _914);
    float _916 = _915 + (_projToPrevProj[1].w);
    float _917 = (_projToPrevProj[3].x) * _88;
    float _918 = mad((_projToPrevProj[3].y), _605, _917);
    float _919 = mad((_projToPrevProj[3].z), 0.009999999776482582f, _918);
    float _920 = _919 + (_projToPrevProj[3].w);
    float _921 = _912 / _920;
    float _922 = _916 / _920;
    float _923 = _921 - _88;
    float _924 = _922 - _605;
    float _925 = _923 * _923;
    float _926 = _924 * _924;
    float _927 = _926 + _925;
    float _928 = sqrt(_927);
    float _929 = dot(float3(_799, _800, _801), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
    float _930 = _929 * _888.w;
    float _931 = _928 * 20.0f;
    float _932 = 1.0f - _931;
    float _933 = saturate(_932);
    float _934 = _933 * _930;
    float _935 = _933 + _930;
    float _936 = _935 - _934;
    bool _937 = (_81 == 10);
    float _938 = select(_937, 0.0f, _888.x);
    float _939 = select(_937, 0.0f, _888.y);
    float _940 = select(_937, 0.0f, _888.z);
    float _941 = select(_937, 1.0f, _888.w);
    float _942 = _941 * _796;
    float _943 = _941 * _797;
    float _944 = _941 * _798;
    float _945 = _942 + _938;
    float _946 = _943 + _939;
    float _947 = _944 + _940;
    float _948 = _941 * _802;
    float _949 = _799 * _601;
    float _950 = _949 * _948;
    float _951 = _800 * _602;
    float _952 = _951 * _948;
    float _953 = _801 * _603;
    float _954 = _953 * _948;
    float _955 = _945 + _950;
    float _956 = _946 + _952;
    float _957 = _947 + _954;

    // --- Aurora borealis ---
    // Additive after final compositing but before UAV write.
    // Do NOT gate on _135 > 0 (viewDir.z). Y is up and Z is horizontal,
    // had an issue where gating on Z cuts the sky in half
    [branch]
    if (AURORA_BOREALIS_ENABLED) {
      float nightGate = ComputeNightGate(_sunDirection.y);
      float3 aurora = ComputeAurora(
        float3(_133, _134, _135), _time.x, nightGate, _frameNumber.x,
        uint2(_pixelX, _pixelY), _ssaoRandomDirection
      );

      // Full RGB atmospheric extinction — wavelength dependent absorption
      // Previously only used green
      aurora *= float3(_799, _800, _801);

      // Volumetric fog occlusion — dim aurora behind fog/mist
      aurora *= _941;

      // Moon luminance washout — bright moonlight washes out faint aurora
      float moonLum = _precomputedAmbient7.z;
      float moonWashout = 1.f - saturate(moonLum * 0.0005f);
      aurora *= lerp(1.f, moonWashout, 0.3f);

      aurora *= AuroraBrightnessDampening(AE_DYNAMISM_HIGH);

      _955 += mad(aurora.r, 0.6131200194358826f, mad(aurora.g, 0.3395099937915802f, aurora.b * 0.047370001673698425f));
      _956 += mad(aurora.r, 0.07020000368356705f, mad(aurora.g, 0.9163600206375122f, aurora.b * 0.013450000435113907f));
      _957 += mad(aurora.r, 0.02061999961733818f, mad(aurora.g, 0.10958000272512436f, aurora.b * 0.8697999715805054f));
    }

    __3__38__0__1__g_postProcessUAV[int2(((int)_pixelX), ((int)_pixelY))] = float4(_955, _956, _957, _936);
  }
}