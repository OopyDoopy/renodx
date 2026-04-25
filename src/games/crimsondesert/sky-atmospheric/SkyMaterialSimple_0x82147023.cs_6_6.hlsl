#include "../shared.h"
#include "aurora_common.hlsli"

struct PostProcessSkyStruct {
  uint _moonTexture;
  uint _milkyWayTexture;
  float _milkyWayRatio;
  float _starRatio;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float> __3__36__0__0__g_depth : register(t13, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t17, space36);

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

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float _14 = __3__36__0__0__g_depth.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  uint2 _17 = __3__36__0__0__g_stencil.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  int _19 = _17.x & 127;
  bool _20 = !(_14.x < 1.0000000116860974e-07f);
  bool _21 = (_19 != 10);
  bool _22 = (_20) && (_21);
  if (!_22) {
    float _25 = float((uint)SV_DispatchThreadID.y);
    float _26 = _25 + 0.5f;
    float _28 = _26 * _bufferSizeAndInvSize.w;
    float _29 = float((uint)SV_DispatchThreadID.x);
    float _30 = _29 + 0.5f;
    float _41 = _earthAxisTilt + 90.0f;
    float _42 = _41 - _latitude;
    float _43 = _42 * 0.01745329238474369f;
    float _44 = sin(_43);
    float _45 = cos(_43);
    float _48 = _time.w * 0.2617993950843811f;
    float _49 = _48 + -3.1415927410125732f;
    float _50 = sin(_49);
    float _51 = cos(_49);
    float _52 = 1.0f - _51;
    float _53 = _52 * _44;
    float _54 = _52 * _45;
    float _55 = _50 * _44;
    float _56 = _50 * _45;
    float _57 = -0.0f - _55;
    float _58 = _53 * _44;
    float _59 = _58 + _51;
    float _60 = _54 * _44;
    float _61 = _53 * _45;
    float _62 = _54 * _45;
    float _63 = _62 + _51;
    float _64 = _30 * 2.0f;
    float _65 = _64 * _bufferSizeAndInvSize.z;
    float _66 = _65 + -1.0f;
    float _67 = 1.0f - _28;
    float _68 = _67 * 2.0f;
    float _69 = _68 + -1.0f;
    float _90 = (_invViewProjRelative[0].x) * _66;
    float _91 = mad((_invViewProjRelative[0].y), _69, _90);
    float _92 = _91 + (_invViewProjRelative[0].z);
    float _93 = _92 + (_invViewProjRelative[0].w);
    float _94 = (_invViewProjRelative[1].x) * _66;
    float _95 = mad((_invViewProjRelative[1].y), _69, _94);
    float _96 = (_invViewProjRelative[1].w) + (_invViewProjRelative[1].z);
    float _97 = _96 + _95;
    float _98 = (_invViewProjRelative[2].x) * _66;
    float _99 = mad((_invViewProjRelative[2].y), _69, _98);
    float _100 = (_invViewProjRelative[2].w) + (_invViewProjRelative[2].z);
    float _101 = _100 + _99;
    float _102 = (_invViewProjRelative[3].x) * _66;
    float _103 = mad((_invViewProjRelative[3].y), _69, _102);
    float _104 = (_invViewProjRelative[3].w) + (_invViewProjRelative[3].z);
    float _105 = _104 + _103;
    float _106 = _93 / _105;
    float _107 = _97 / _105;
    float _108 = _101 / _105;
    float _109 = dot(float3(_106, _107, _108), float3(_106, _107, _108));
    float _110 = rsqrt(_109);
    float _111 = _110 * _106;
    float _112 = _110 * _107;
    float _113 = _110 * _108;
    float _114 = _111 * _51;
    float _115 = mad(_56, _112, _114);
    float _116 = mad(_57, _113, _115);
    float _117 = _56 * _111;
    float _118 = -0.0f - _117;
    float _119 = mad(_59, _112, _118);
    float _120 = mad(_60, _113, _119);
    float _121 = _111 * _55;
    float _122 = mad(_61, _112, _121);
    float _123 = mad(_63, _113, _122);
    float _124 = _123 / _116;
    float _125 = atan(_124);
    float _126 = _125 + 3.1415927410125732f;
    float _127 = _125 + -3.1415927410125732f;
    bool _128 = (_116 < 0.0f);
    bool _129 = (_116 == 0.0f);
    bool _130 = (_123 >= 0.0f);
    bool _131 = (_123 < 0.0f);
    bool _132 = (_128) && (_130);
    float _133 = select(_132, _126, _125);
    bool _134 = (_128) && (_131);
    float _135 = select(_134, _127, _133);
    bool _136 = (_129) && (_131);
    bool _137 = (_129) && (_130);
    float _138 = _135 * 0.15915493667125702f;
    float _139 = _138 + 0.5f;
    float _140 = select(_136, 0.25f, _139);
    float _141 = select(_137, 0.75f, _140);
    float _142 = acos(_120);
    float _143 = _142 * 0.31830987334251404f;
    int _144 = WaveReadLaneFirst(_materialIndex);
    bool _145 = ((uint)_144 < (uint)170000);
    int _146 = select(_145, _144, 0);
    int _152 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(_146) + 0u))]._milkyWayTexture);
    bool _153 = ((uint)_152 < (uint)65000);
    int _154 = select(_153, _152, 0);
    float4 _159 = __0__7__0__0__g_bindlessTextures[((int)((uint)(_154) + 0u))].SampleLevel(__0__4__0__0__g_staticBilinearClamp, float2(_141, _143), 0.0f);
    int _163 = WaveReadLaneFirst(_materialIndex);
    bool _164 = ((uint)_163 < (uint)170000);
    int _165 = select(_164, _163, 0);
    float _171 = WaveReadLaneFirst(BindlessParameters_PostProcessSky[((int)((uint)(_165) + 0u))]._milkyWayRatio);
    float _172 = _171 * _159.x;
    float _173 = _171 * _159.y;
    float _174 = _171 * _159.z;

    // --- Aurora borealis (sky probe variant) ---
    // This shader feeds the environment probe at night for specular/GI. We add aurora here
    // so the scene at night gets some aurora tinting but heavily modulate so metals/specular
    // get a subtle tint. The visible aurora comes from SkyMaterial_0xF8D46E3A at
    // full strength.
    [branch]
    if (AURORA_BOREALIS_ENABLED) {
      float nightGate = ComputeNightGate(_sunDirection.y);
      float3 aurora = ComputeAurora(
        float3(_111, _112, _113), _time.x, nightGate, _frameNumber.x,
        uint2(SV_DispatchThreadID.x, SV_DispatchThreadID.y)
      );
      float transmittance = ChapmanTransmittance(0.f, _113, _rayleighScaledHeight, _earthRadius);
      aurora = clamp(aurora, 0.f, 10.f) * transmittance;
      aurora *= AuroraBrightnessDampening(AE_DYNAMISM_HIGH);

      // Modulation for sky probe
      aurora *= AURORA_GI_ENERGY;
      _172 += aurora.r;
      _173 += aurora.g;
      _174 += aurora.b;
    }

    float _175 = _172 * 0.6131200194358826f;
    float _176 = _172 * 0.07020000368356705f;
    float _177 = _172 * 0.02061999961733818f;
    float _178 = _173 * 0.3395099937915802f;
    float _179 = _173 * 0.9163600206375122f;
    float _180 = _173 * 0.10958000272512436f;
    float _181 = _175 + _178;
    float _182 = _176 + _179;
    float _183 = _177 + _180;
    float _184 = _174 * 0.047370001673698425f;
    float _185 = _174 * 0.013450000435113907f;
    float _186 = _174 * 0.8697999715805054f;
    float _187 = _181 + _184;
    float _188 = _182 + _185;
    float _189 = _183 + _186;
    __3__38__0__1__g_postProcessUAV[int2((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y))] = float4(_187, _188, _189, _postProcessParams.x);
  }
}
