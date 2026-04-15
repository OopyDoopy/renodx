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

ConstantBuffer<MaterialOverrideParametersStruct> BindlessParameters_MaterialOverrideParameters[] : register(b0, space101);

ConstantBuffer<TranslucentParametersStruct> BindlessParameters_TranslucentParameters[] : register(b0, space100);

SamplerState __0__95__0__0__g_samplerAnisotropicWrap : register(s8, space95);

struct OutputSignature {
  uint4 SV_Target : SV_Target;
  float4 SV_Target_1 : SV_Target1;
  float4 SV_Target_2 : SV_Target2;
  float4 SV_Target_3 : SV_Target3;
};

OutputSignature main(
  noperspective float4 SV_Position : SV_Position,
  linear float4 TEXCOORD : TEXCOORD,
  linear half4 TEXCOORD_1 : TEXCOORD1,
  linear half4 TEXCOORD_2 : TEXCOORD2,
  linear half4 COLOR : COLOR,
  linear half4 TEXCOORD_3 : TEXCOORD3,
  nointerpolation uint TEXCOORD_5 : TEXCOORD5,
  nointerpolation uint TEXCOORD_6 : TEXCOORD6,
  nointerpolation uint2 TEXCOORD_7 : TEXCOORD7,
  nointerpolation uint SV_IsFrontFace : SV_IsFrontFace
) {
  uint4 SV_Target;
  float4 SV_Target_1;
  float4 SV_Target_2;
  float4 SV_Target_3;
  half _15 = rsqrt(dot(half3(TEXCOORD_1.x, TEXCOORD_1.y, TEXCOORD_1.z), half3(TEXCOORD_1.x, TEXCOORD_1.y, TEXCOORD_1.z)));
  float _22 = select((SV_IsFrontFace != 0), 1.0f, -1.0f);
  float _23 = float(_15 * TEXCOORD_1.x) * _22;
  float _24 = float(_15 * TEXCOORD_1.y) * _22;
  float _25 = float(_15 * TEXCOORD_1.z) * _22;
  half _27 = rsqrt(dot(half3(TEXCOORD_2.x, TEXCOORD_2.y, TEXCOORD_2.z), half3(TEXCOORD_2.x, TEXCOORD_2.y, TEXCOORD_2.z)));
  float _31 = float(_27 * TEXCOORD_2.x);
  float _32 = float(_27 * TEXCOORD_2.y);
  float _33 = float(_27 * TEXCOORD_2.z);
  int _36 = select(((uint)TEXCOORD_5 < (uint)170000), TEXCOORD_5, 0);
  int _42 = WaveReadLaneFirst(BindlessParameters_MaterialOverrideParameters[((int)((uint)(_36) + 0u))]._baseColorTexture);
  float4 _49 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_42 < (uint)65000), _42, 0)) + 0u))].Sample(__0__95__0__0__g_samplerAnisotropicWrap, float2(TEXCOORD.x, TEXCOORD.y));
  int _56 = WaveReadLaneFirst(BindlessParameters_MaterialOverrideParameters[((int)((uint)(_36) + 0u))]._materialTexture);
  float4 _63 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_56 < (uint)65000), _56, 0)) + 0u))].Sample(__0__95__0__0__g_samplerAnisotropicWrap, float2(TEXCOORD.x, TEXCOORD.y));
  int _69 = WaveReadLaneFirst(BindlessParameters_MaterialOverrideParameters[((int)((uint)(_36) + 0u))]._normalTexture);
  float4 _76 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_69 < (uint)65000), _69, 0)) + 0u))].Sample(__0__95__0__0__g_samplerAnisotropicWrap, float2(TEXCOORD.x, TEXCOORD.y));
  float _81 = (_76.x * 2.0f) + -0.9960784316062927f;
  float _82 = (_76.y * 2.0f) + -0.9960784316062927f;
  float _86 = sqrt(saturate(1.0f - dot(float2(_81, _82), float2(_81, _82))));
  int _97 = WaveReadLaneFirst(TEXCOORD_5);
  float _107 = float((uint)((uint)(((uint)((uint)(BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._tintColor)) >> 16) & 255)));
  float _110 = float((uint)((uint)(((uint)((uint)(BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._tintColor)) >> 8) & 255)));
  float _112 = float((uint)((uint)((BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._tintColor) & 255)));
  float _166 = _82 * float(TEXCOORD_2.w);
  float _174 = ((_86 * _23) + (_81 * _31)) + (_166 * ((_33 * _24) - (_32 * _25)));
  float _176 = ((_86 * _24) + (_81 * _32)) + (_166 * ((_31 * _25) - (_33 * _23)));
  float _178 = ((_86 * _25) + (_81 * _33)) + (_166 * ((_32 * _23) - (_31 * _24)));
  float _180 = rsqrt(dot(float3(_174, _176, _178), float3(_174, _176, _178)));
  float _187 = float(half(_180 * _174));
  float _188 = float(half(_180 * _176));
  float _189 = float(half(_180 * _178));
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
  float _191 = rsqrt(dot(float3(_187, _188, _189), float3(_187, _188, _189)));
  float _192 = _191 * _187;
  float _193 = _191 * _188;
  float _194 = _191 * _189;
  float _204 = rsqrt(dot(float3(_23, _24, _25), float3(_23, _24, _25))) * 0.5f;
  float _223 = float((uint)uint(round(saturate((_204 * _23) + 0.5f) * 1022.0f)));
  float _224 = float((uint)uint(round(saturate((_204 * _24) + 0.5f) * 1022.0f)));
  float _225 = float((uint)uint(round(saturate((_204 * _25) + 0.5f) * 1022.0f)));
  float _238 = (saturate(_223 * 0.000978473573923111f) * 2.0f) + -1.0f;
  float _239 = (saturate(_224 * 0.000978473573923111f) * 2.0f) + -1.0f;
  float _240 = (saturate(_225 * 0.000978473573923111f) * 2.0f) + -1.0f;
  float _242 = rsqrt(dot(float3(_238, _239, _240), float3(_238, _239, _240)));
  float _243 = _242 * _238;
  float _244 = _242 * _239;
  float _245 = _240 * _242;
  float _247 = saturate(dot(float3(_192, _193, _194), float3(_243, _244, _245)));
  float _249 = select((_245 >= 0.0f), 1.0f, -1.0f);
  float _252 = -0.0f - (1.0f / (_249 + _245));
  float _253 = _244 * _252;
  float _254 = _253 * _243;
  float _275;
  float _276;
  float _277;
  if (!(_247 > 0.9999989867210388f)) {
    float _267 = dot(float3(_192, _193, _194), float3(((((_243 * _243) * _252) * _249) + 1.0f), (_254 * _249), (-0.0f - (_249 * _243))));
    float _268 = dot(float3(_192, _193, _194), float3(_254, (_249 + (_253 * _244)), (-0.0f - _244)));
    float _270 = rsqrt(dot(float3(_267, _268, _247), float3(_267, _268, _247)));
    _275 = (_270 * _267);
    _276 = (_270 * _268);
    _277 = (_270 * _247);
  } else {
    _275 = 0.0f;
    _276 = 0.0f;
    _277 = 1.0f;
  }
  float _285 = 0.5f / ((abs(_276) + abs(_275)) + saturate(_277));
  SV_Target.x = 65535u;
  SV_Target.y = min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round(saturate(_63.z) * 255.0f)))))) | 65280));
  SV_Target.z = min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round((BindlessParameters_TranslucentParameters[((int)((uint)(_36) + 0u))]._thickness) * 255.0f)))))) | ((int)(min((uint)(255), (uint)((int)(uint(round(saturate(_63.y) * 255.0f))))) << 8))));
  SV_Target.w = min((uint)(65535), (uint)((int)(min((uint)(255), (uint)((int)(uint(round(saturate((_285 * (_275 - _276)) + 0.5f) * 255.0f)))))) | ((int)(min((uint)(255), (uint)((int)(uint(round(saturate((_285 * (_276 + _275)) + 0.5f) * 255.0f))))) << 8))));
  SV_Target_1.x = (_223 * 0.0009775171056389809f);
  SV_Target_1.y = (_224 * 0.0009775171056389809f);
  SV_Target_1.z = (_225 * 0.0009775171056389809f);
  SV_Target_1.w = 0.0f;
  SV_Target_2.x = 1.0f;
  SV_Target_2.y = 1.0f;
  SV_Target_2.z = 1.0f;
  SV_Target_2.w = _63.z;
  SV_Target_3.x = float(half((select(((_107 * 0.003921568859368563f) < 0.040449999272823334f), (_107 * 0.0003035269910469651f), exp2(log2((_107 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _49.x) * (BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._brightness)));
  SV_Target_3.y = float(half((select(((_110 * 0.003921568859368563f) < 0.040449999272823334f), (_110 * 0.0003035269910469651f), exp2(log2((_110 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _49.y) * (BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._brightness)));
  SV_Target_3.z = float(half((select(((_112 * 0.003921568859368563f) < 0.040449999272823334f), (_112 * 0.0003035269910469651f), exp2(log2((_112 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f)) * _49.z) * (BindlessParameters_MaterialOverrideParameters[((int)((uint)(select(((uint)_97 < (uint)170000), _97, 0)) + 0u))]._brightness)));
  SV_Target_3.w = saturate((BindlessParameters_TranslucentParameters[((int)((uint)(_36) + 0u))]._extinctionCoefficient) * 0.10000000149011612f);
  OutputSignature output_signature = { SV_Target, SV_Target_1, SV_Target_2, SV_Target_3 };
  return output_signature;
}