struct MaterialOverrideParametersStruct {
  uint _baseColorTexture;
  uint _normalTexture;
  uint _materialTexture;
  uint _heightTexture;
  float _brightness;
  uint _tintColor;
  uint _impostorTintColor;
  uint _emissiveTexture;
  uint _emissiveIntensityTexture;
  int _placementId;
  float _terrainBlend;
  uint _excludeWeatherShadeOnlyDynamic;
  uint _materialInfo;
  float _opticalOpacity;
  float _audioObstruction;
  uint _ignoreRaytracing;
  uint _useSpawnOnOwner;
};

struct TranslucentParametersStruct {
  float _refractiveIndex;
  float _thickness;
  float _extinctionCoefficient;
  float _extinctionTint;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

cbuffer __3__35__0__0__SceneConstantBuffer : register(b17, space35) {
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

ConstantBuffer<MaterialOverrideParametersStruct> BindlessParameters_MaterialOverrideParameters[] : register(b0, space101);

ConstantBuffer<TranslucentParametersStruct> BindlessParameters_TranslucentParameters[] : register(b0, space100);

SamplerState __0__95__0__0__g_samplerAnisotropicWrap : register(s8, space95);

struct OutputSignature {
  uint4 SV_Target : SV_Target;
  float4 SV_Target_1 : SV_Target1;
  float4 SV_Target_2 : SV_Target2;
  float4 SV_Target_3 : SV_Target3;
  float2 SV_Target_4 : SV_Target4;
};

OutputSignature main(
  noperspective float4 SV_Position : SV_Position,
  linear float4 TEXCOORD : TEXCOORD,
  linear half4 TEXCOORD_1 : TEXCOORD1,
  linear half4 TEXCOORD_2 : TEXCOORD2,
  linear half4 COLOR : COLOR,
  linear half4 TEXCOORD_3 : TEXCOORD3,
  linear float4 TEXCOORD_4 : TEXCOORD4,
  nointerpolation uint TEXCOORD_5 : TEXCOORD5,
  nointerpolation uint TEXCOORD_6 : TEXCOORD6,
  nointerpolation uint2 TEXCOORD_7 : TEXCOORD7,
  nointerpolation uint SV_IsFrontFace : SV_IsFrontFace
) {
  uint4 SV_Target;
  float4 SV_Target_1;
  float4 SV_Target_2;
  float4 SV_Target_3;
  float2 SV_Target_4;
  half _22 = rsqrt(dot(half3(TEXCOORD_1.x, TEXCOORD_1.y, TEXCOORD_1.z), half3(TEXCOORD_1.x, TEXCOORD_1.y, TEXCOORD_1.z)));
  float _29 = select((SV_IsFrontFace != 0), 1.0f, -1.0f);
  float _30 = float(_22 * TEXCOORD_1.x) * _29;
  float _31 = float(_22 * TEXCOORD_1.y) * _29;
  float _32 = float(_22 * TEXCOORD_1.z) * _29;
  half _34 = rsqrt(dot(half3(TEXCOORD_2.x, TEXCOORD_2.y, TEXCOORD_2.z), half3(TEXCOORD_2.x, TEXCOORD_2.y, TEXCOORD_2.z)));
  float _38 = float(_34 * TEXCOORD_2.x);
  float _39 = float(_34 * TEXCOORD_2.y);
  float _40 = float(_34 * TEXCOORD_2.z);
  int _43 = select(((uint)TEXCOORD_5 < (uint)170000), TEXCOORD_5, 0);
  int _49 = WaveReadLaneFirst(BindlessParameters_MaterialOverrideParameters[((int)((uint)(_43) + 0u))]._baseColorTexture);
  float4 _56 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_49 < (uint)65000), _49, 0)) + 0u))].Sample(__0__95__0__0__g_samplerAnisotropicWrap, float2(TEXCOORD.x, TEXCOORD.y));
  int _63 = WaveReadLaneFirst(BindlessParameters_MaterialOverrideParameters[((int)((uint)(_43) + 0u))]._materialTexture);
  float4 _70 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_63 < (uint)65000), _63, 0)) + 0u))].Sample(__0__95__0__0__g_samplerAnisotropicWrap, float2(TEXCOORD.x, TEXCOORD.y));
  int _76 = WaveReadLaneFirst(BindlessParameters_MaterialOverrideParameters[((int)((uint)(_43) + 0u))]._normalTexture);
  float4 _83 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_76 < (uint)65000), _76, 0)) + 0u))].Sample(__0__95__0__0__g_samplerAnisotropicWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _88 = (_83.x * 2.0f) + -0.9960784316062927f;
  float _89 = (_83.y * 2.0f) + -0.9960784316062927f;
  float _93 = sqrt(saturate(1.0f - dot(float2(_88, _89), float2(_88, _89))));
  int _104 = WaveReadLaneFirst(TEXCOORD_5);
  float _114 = float((uint)((uint)(((uint)((uint)(BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_104 < (uint)170000), _104, 0)) + 0u))]._tintColor)) >> 16) & 255)));
  float _117 = float((uint)((uint)(((uint)((uint)(BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_104 < (uint)170000), _104, 0)) + 0u))]._tintColor)) >> 8) & 255)));
  float _119 = float((uint)((uint)((BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_104 < (uint)170000), _104, 0)) + 0u))]._tintColor) & 255)));
  float _173 = _89 * float(TEXCOORD_2.w);
  float _181 = ((_93 * _30) + (_88 * _38)) + (_173 * ((_40 * _31) - (_39 * _32)));
  float _183 = ((_93 * _31) + (_88 * _39)) + (_173 * ((_38 * _32) - (_40 * _30)));
  float _185 = ((_93 * _32) + (_88 * _40)) + (_173 * ((_39 * _30) - (_38 * _31)));
  float _187 = rsqrt(dot(float3(_181, _183, _185), float3(_181, _183, _185)));
  float _194 = float(half(_187 * _181));
  float _195 = float(half(_187 * _183));
  float _196 = float(half(_187 * _185));
  SV_Target.x = 0u;
  SV_Target.y = 0u;
  SV_Target.z = 0u;
  SV_Target.w = 0u;
  SV_Target_1.x = 0.0f;
  SV_Target_1.y = 0.0f;
  SV_Target_1.z = 0.0f;
  SV_Target_1.w = 0.0f;
  SV_Target_2.x = 0.0f;
  SV_Target_2.y = 0.0f;
  SV_Target_2.z = 0.0f;
  SV_Target_2.w = 0.0f;
  SV_Target_3.x = 0.0f;
  SV_Target_3.y = 0.0f;
  SV_Target_3.z = 0.0f;
  SV_Target_3.w = 0.0f;
  SV_Target_4.x = 0.0f;
  SV_Target_4.y = 0.0f;
  float _198 = rsqrt(dot(float3(_194, _195, _196), float3(_194, _195, _196)));
  float _199 = _198 * _194;
  float _200 = _198 * _195;
  float _201 = _198 * _196;
  float _211 = rsqrt(dot(float3(_30, _31, _32), float3(_30, _31, _32))) * 0.5f;
  float _230 = float((uint)uint(round(saturate((_211 * _30) + 0.5f) * 1022.0f)));
  float _231 = float((uint)uint(round(saturate((_211 * _31) + 0.5f) * 1022.0f)));
  float _232 = float((uint)uint(round(saturate((_211 * _32) + 0.5f) * 1022.0f)));
  float _245 = (saturate(_230 * 0.000978473573923111f) * 2.0f) + -1.0f;
  float _246 = (saturate(_231 * 0.000978473573923111f) * 2.0f) + -1.0f;
  float _247 = (saturate(_232 * 0.000978473573923111f) * 2.0f) + -1.0f;
  float _249 = rsqrt(dot(float3(_245, _246, _247), float3(_245, _246, _247)));
  float _250 = _249 * _245;
  float _251 = _249 * _246;
  float _252 = _247 * _249;
  float _254 = saturate(dot(float3(_199, _200, _201), float3(_250, _251, _252)));
  float _256 = select((_252 >= 0.0f), 1.0f, -1.0f);
  float _259 = -0.0f - (1.0f / (_256 + _252));
  float _260 = _251 * _259;
  float _261 = _260 * _250;
  float _282;
  float _283;
  float _284;
  if (!(_254 > 0.9999989867210388f)) {
    float _274 = dot(float3(_199, _200, _201), float3(((((_250 * _250) * _259) * _256) + 1.0f), (_261 * _256), (-0.0f - (_256 * _250))));
    float _275 = dot(float3(_199, _200, _201), float3(_261, (_256 + (_260 * _251)), (-0.0f - _251)));
    float _277 = rsqrt(dot(float3(_274, _275, _254), float3(_274, _275, _254)));
    _282 = (_277 * _274);
    _283 = (_277 * _275);
    _284 = (_277 * _254);
  } else {
    _282 = 0.0f;
    _283 = 0.0f;
    _284 = 1.0f;
  }
  float _292 = 0.5f / ((abs(_283) + abs(_282)) + saturate(_284));
  SV_Target.x = 65535u;
  SV_Target.y = min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round(saturate(_70.z) * 255.0f)))))) | 65280));
  SV_Target.z = min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round((BindlessParameters_TranslucentParameters[((int)((uint)(_43) + 0u))]._thickness) * 255.0f)))))) | ((int)(min((uint)(255), (uint)((int)(uint(round(saturate(_70.y) * 255.0f))))) << 8))));
  SV_Target.w = min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round(saturate((_292 * (_282 - _283)) + 0.5f) * 255.0f)))))) | ((int)(min((uint)(255), (uint)((int)(uint(round(saturate((_292 * (_283 + _282)) + 0.5f) * 255.0f))))) << 8))));
  SV_Target_1.x = (_230 * 0.0009775171056389809f);
  SV_Target_1.y = (_231 * 0.0009775171056389809f);
  SV_Target_1.z = (_232 * 0.0009775171056389809f);
  SV_Target_1.w = 0.0f;
  SV_Target_2.x = 1.0f;
  SV_Target_2.y = 1.0f;
  SV_Target_2.z = 1.0f;
  SV_Target_2.w = _70.z;
  SV_Target_3.x = float(half((select(((_114 * 0.003921568859368563f) < 0.040449999272823334f), (_114 * 0.0003035269910469651f), exp2(log2((_114 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _56.x) * (BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_104 < (uint)170000), _104, 0)) + 0u))]._brightness)));
  SV_Target_3.y = float(half((select(((_117 * 0.003921568859368563f) < 0.040449999272823334f), (_117 * 0.0003035269910469651f), exp2(log2((_117 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _56.y) * (BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_104 < (uint)170000), _104, 0)) + 0u))]._brightness)));
  SV_Target_3.z = float(half((select(((_119 * 0.003921568859368563f) < 0.040449999272823334f), (_119 * 0.0003035269910469651f), exp2(log2((_119 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _56.z) * (BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_104 < (uint)170000), _104, 0)) + 0u))]._brightness)));
  SV_Target_3.w = saturate((BindlessParameters_TranslucentParameters[((int)((uint)(_43) + 0u))]._extinctionCoefficient) * 0.10000000149011612f);
  SV_Target_4.x = ((((TEXCOORD_4.x / TEXCOORD_4.w) - _temporalAAJitterParams.z) - ((SV_Position.x * 2.0f) * _bufferSizeAndInvSize.z)) * 0.5f);
  SV_Target_4.y = ((((TEXCOORD_4.y / TEXCOORD_4.w) - _temporalAAJitterParams.w) + ((SV_Position.y * 2.0f) * _bufferSizeAndInvSize.w)) * 0.5f);
  OutputSignature output_signature = { SV_Target, SV_Target_1, SV_Target_2, SV_Target_3, SV_Target_4 };
  return output_signature;
}