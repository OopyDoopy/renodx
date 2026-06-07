#include "../common.hlsl"

Texture2D<float4> t0 : register(t0);

Texture1D<float> t1 : register(t1);

Texture3D<float4> t2 : register(t2);

Texture2D<float> t4 : register(t4);

Texture2D<float4> t5 : register(t5);

cbuffer cb0 : register(b0) {
  float4 ImageProcTexDimConstBuffer_000[23] : packoffset(c000.x);
  float4 ImageProcTexDimConstBuffer_368 : packoffset(c023.x);
  int ImageProcTexDimConstBuffer_384 : packoffset(c024.x);
  float ImageProcTexDimConstBuffer_388 : packoffset(c024.y);
  int2 ImageProcTexDimConstBuffer_392 : packoffset(c024.z);
  int2 ImageProcTexDimConstBuffer_400 : packoffset(c025.x);
  float2 ImageProcTexDimConstBuffer_408 : packoffset(c025.z);
  int2 ImageProcTexDimConstBuffer_416 : packoffset(c026.x);
  float2 ImageProcTexDimConstBuffer_424 : packoffset(c026.z);
  float2 ImageProcTexDimConstBuffer_432 : packoffset(c027.x);
  float2 ImageProcTexDimConstBuffer_440 : packoffset(c027.z);
  float2 ImageProcTexDimConstBuffer_448 : packoffset(c028.x);
  float2 ImageProcTexDimConstBuffer_456 : packoffset(c028.z);
  float2 ImageProcTexDimConstBuffer_464 : packoffset(c029.x);
  int ImageProcTexDimConstBuffer_472 : packoffset(c029.z);
  int ImageProcTexDimConstBuffer_476 : packoffset(c029.w);
};

cbuffer cb1 : register(b1) {
  float4 ImageProcPostProcessConstBuffer_000 : packoffset(c000.x);
  float4 ImageProcPostProcessConstBuffer_016 : packoffset(c001.x);
  float4 ImageProcPostProcessConstBuffer_032 : packoffset(c002.x);
  float4 ImageProcPostProcessConstBuffer_048 : packoffset(c003.x);
  float4 ImageProcPostProcessConstBuffer_064 : packoffset(c004.x);
  float4 ImageProcPostProcessConstBuffer_080 : packoffset(c005.x);
  float4 ImageProcPostProcessConstBuffer_096 : packoffset(c006.x);
  float4 ImageProcPostProcessConstBuffer_112 : packoffset(c007.x);
  float4 ImageProcPostProcessConstBuffer_128 : packoffset(c008.x);
  float4 ImageProcPostProcessConstBuffer_144 : packoffset(c009.x);
  float4 ImageProcPostProcessConstBuffer_160 : packoffset(c010.x);
  float4 ImageProcPostProcessConstBuffer_176 : packoffset(c011.x);
  float4 ImageProcPostProcessConstBuffer_192 : packoffset(c012.x);
  float4 ImageProcPostProcessConstBuffer_208 : packoffset(c013.x);
  float4 ImageProcPostProcessConstBuffer_224 : packoffset(c014.x);
  float4 ImageProcPostProcessConstBuffer_240 : packoffset(c015.x);
  float4 ImageProcPostProcessConstBuffer_256[4] : packoffset(c016.x);
  float4 ImageProcPostProcessConstBuffer_320[4] : packoffset(c020.x);
  float4 ImageProcPostProcessConstBuffer_384[4] : packoffset(c024.x);
  float4 ImageProcPostProcessConstBuffer_448 : packoffset(c028.x);
  float4 ImageProcPostProcessConstBuffer_464 : packoffset(c029.x);
  float4 ImageProcPostProcessConstBuffer_480 : packoffset(c030.x);
  float ImageProcPostProcessConstBuffer_496 : packoffset(c031.x);
  float ImageProcPostProcessConstBuffer_500 : packoffset(c031.y);
  int ImageProcPostProcessConstBuffer_504 : packoffset(c031.z);
  int ImageProcPostProcessConstBuffer_508 : packoffset(c031.w);
  float4 ImageProcPostProcessConstBuffer_512[4][1] : packoffset(c032.x);
  float4 ImageProcPostProcessConstBuffer_576 : packoffset(c036.x);
  int4 ImageProcPostProcessConstBuffer_592 : packoffset(c037.x);
  float4 ImageProcPostProcessConstBuffer_608 : packoffset(c038.x);
  float4 ImageProcPostProcessConstBuffer_624 : packoffset(c039.x);
  float4 ImageProcPostProcessConstBuffer_640 : packoffset(c040.x);
  float4 ImageProcPostProcessConstBuffer_656 : packoffset(c041.x);
  float4 ImageProcPostProcessConstBuffer_672 : packoffset(c042.x);
  float4 ImageProcPostProcessConstBuffer_688 : packoffset(c043.x);
  float4 ImageProcPostProcessConstBuffer_704 : packoffset(c044.x);
  float4 ImageProcPostProcessConstBuffer_720 : packoffset(c045.x);
  float4 ImageProcPostProcessConstBuffer_736 : packoffset(c046.x);
  float4 ImageProcPostProcessConstBuffer_752 : packoffset(c047.x);
  float4 ImageProcPostProcessConstBuffer_768 : packoffset(c048.x);
  float4 ImageProcPostProcessConstBuffer_784 : packoffset(c049.x);
  float4 ImageProcPostProcessConstBuffer_800 : packoffset(c050.x);
  int ImageProcPostProcessConstBuffer_816 : packoffset(c051.x);
  float ImageProcPostProcessConstBuffer_820 : packoffset(c051.y);
  int ImageProcPostProcessConstBuffer_824 : packoffset(c051.z);
  float ImageProcPostProcessConstBuffer_828 : packoffset(c051.w);
  float4 ImageProcPostProcessConstBuffer_832[8] : packoffset(c052.x);
  float4 ImageProcPostProcessConstBuffer_960 : packoffset(c060.x);
  float ImageProcPostProcessConstBuffer_976 : packoffset(c061.x);
  float ImageProcPostProcessConstBuffer_980 : packoffset(c061.y);
  int ImageProcPostProcessConstBuffer_984 : packoffset(c061.z);
  int ImageProcPostProcessConstBuffer_988 : packoffset(c061.w);
  float ImageProcPostProcessConstBuffer_992 : packoffset(c062.x);
  float ImageProcPostProcessConstBuffer_996 : packoffset(c062.y);
  float ImageProcPostProcessConstBuffer_1000 : packoffset(c062.z);
  float ImageProcPostProcessConstBuffer_1004 : packoffset(c062.w);
  float4 ImageProcPostProcessConstBuffer_1008 : packoffset(c063.x);
  float4 ImageProcPostProcessConstBuffer_1024 : packoffset(c064.x);
  float4 ImageProcPostProcessConstBuffer_1040 : packoffset(c065.x);
  float4 ImageProcPostProcessConstBuffer_1056 : packoffset(c066.x);
  float4 ImageProcPostProcessConstBuffer_1072 : packoffset(c067.x);
  float4 ImageProcPostProcessConstBuffer_1088 : packoffset(c068.x);
  float4 ImageProcPostProcessConstBuffer_1104 : packoffset(c069.x);
  float4 ImageProcPostProcessConstBuffer_1120 : packoffset(c070.x);
  float4 ImageProcPostProcessConstBuffer_1136 : packoffset(c071.x);
  int ImageProcPostProcessConstBuffer_1152 : packoffset(c072.x);
  int ImageProcPostProcessConstBuffer_1156 : packoffset(c072.y);
  float ImageProcPostProcessConstBuffer_1160 : packoffset(c072.z);
  float ImageProcPostProcessConstBuffer_1164 : packoffset(c072.w);
  float ImageProcPostProcessConstBuffer_1168 : packoffset(c073.x);
  float ImageProcPostProcessConstBuffer_1172 : packoffset(c073.y);
  float ImageProcPostProcessConstBuffer_1176 : packoffset(c073.z);
  float ImageProcPostProcessConstBuffer_1180 : packoffset(c073.w);
  float4 ImageProcPostProcessConstBuffer_1184 : packoffset(c074.x);
  float ImageProcPostProcessConstBuffer_1200 : packoffset(c075.x);
  float ImageProcPostProcessConstBuffer_1204 : packoffset(c075.y);
  float ImageProcPostProcessConstBuffer_1208 : packoffset(c075.z);
  float ImageProcPostProcessConstBuffer_1212 : packoffset(c075.w);
  float ImageProcPostProcessConstBuffer_1216 : packoffset(c076.x);
  float ImageProcPostProcessConstBuffer_1220 : packoffset(c076.y);
  float ImageProcPostProcessConstBuffer_1224 : packoffset(c076.z);
  float ImageProcPostProcessConstBuffer_1228 : packoffset(c076.w);
  float ImageProcPostProcessConstBuffer_1232 : packoffset(c077.x);
  float ImageProcPostProcessConstBuffer_1236 : packoffset(c077.y);
  float ImageProcPostProcessConstBuffer_1240 : packoffset(c077.z);
  float ImageProcPostProcessConstBuffer_1244 : packoffset(c077.w);
  float ImageProcPostProcessConstBuffer_1248 : packoffset(c078.x);
  float ImageProcPostProcessConstBuffer_1252 : packoffset(c078.y);
  float ImageProcPostProcessConstBuffer_1256 : packoffset(c078.z);
  float ImageProcPostProcessConstBuffer_1260 : packoffset(c078.w);
  float ImageProcPostProcessConstBuffer_1264 : packoffset(c079.x);
  float ImageProcPostProcessConstBuffer_1268 : packoffset(c079.y);
  float ImageProcPostProcessConstBuffer_1272 : packoffset(c079.z);
  int ImageProcPostProcessConstBuffer_1276 : packoffset(c079.w);
  float4 ImageProcPostProcessConstBuffer_1280 : packoffset(c080.x);
  float ImageProcPostProcessConstBuffer_1296 : packoffset(c081.x);
  float ImageProcPostProcessConstBuffer_1300 : packoffset(c081.y);
  float ImageProcPostProcessConstBuffer_1304 : packoffset(c081.z);
  float ImageProcPostProcessConstBuffer_1308 : packoffset(c081.w);
  float ImageProcPostProcessConstBuffer_1312 : packoffset(c082.x);
  float ImageProcPostProcessConstBuffer_1316 : packoffset(c082.y);
  float ImageProcPostProcessConstBuffer_1320 : packoffset(c082.z);
  float ImageProcPostProcessConstBuffer_1324 : packoffset(c082.w);
  int ImageProcPostProcessConstBuffer_1328 : packoffset(c083.x);
  int ImageProcPostProcessConstBuffer_1332 : packoffset(c083.y);
  float ImageProcPostProcessConstBuffer_1336 : packoffset(c083.z);
  float ImageProcPostProcessConstBuffer_1340 : packoffset(c083.w);
  int ImageProcPostProcessConstBuffer_1344 : packoffset(c084.x);
  float ImageProcPostProcessConstBuffer_1348 : packoffset(c084.y);
  float ImageProcPostProcessConstBuffer_1352 : packoffset(c084.z);
  float ImageProcPostProcessConstBuffer_1356 : packoffset(c084.w);
  float ImageProcPostProcessConstBuffer_1360 : packoffset(c085.x);
  float ImageProcPostProcessConstBuffer_1364 : packoffset(c085.y);
  float ImageProcPostProcessConstBuffer_1368 : packoffset(c085.z);
  float ImageProcPostProcessConstBuffer_1372 : packoffset(c085.w);
  float ImageProcPostProcessConstBuffer_1376 : packoffset(c086.x);
  int ImageProcPostProcessConstBuffer_1380 : packoffset(c086.y);
  int ImageProcPostProcessConstBuffer_1384 : packoffset(c086.z);
  int ImageProcPostProcessConstBuffer_1388 : packoffset(c086.w);
};

SamplerState s0 : register(s0);

SamplerState s2 : register(s2);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float4 TexCoord : TexCoord,
  linear float4 TexCoord_4 : TexCoord4,
  linear float4 TexCoord_1 : TexCoord1,
  linear float4 TexCoord_2 : TexCoord2,
  linear float4 TexCoord_3 : TexCoord3
) : SV_Target {
  float4 SV_Target;
  float4 _18;
  float _26;
  float _27;
  float _28;
  float _29;
  float _38;
  float _39;
  float _51;
  float _153;
  float _154;
  float _155;
  float _216;
  float _217;
  float _218;
  float _291;
  float _292;
  float _293;
  float _57;
  float _59;
  float _60;
  float _61;
  float _62;
  float _63;
  float _65;
  float _66;
  float _67;
  float _69;
  float _70;
  float _71;
  float _77;
  float _78;
  float _81;
  float _82;
  float4 _85;
  float4 _89;
  float _93;
  float _94;
  float4 _97;
  float4 _101;
  float _106;
  float _108;
  float _110;
  float _112;
  float _114;
  float4 _117;
  float4 _122;
  float _126;
  float _140;
  float _141;
  float _142;
  uint2 _164;
  float4 _180;
  float _192;
  float _197;
  float _204;
  float _205;
  float _206;
  bool _208;
  float _221;
  float _222;
  float _237;
  float _238;
  float _239;
  float _240;
  float4 _286;
  float _312;
  float _316;
  float _320;
  float _326;
  _18 = t0.SampleLevel(s0, float2(TexCoord.x, TexCoord.y), 0.0f);
  _26 = TexCoord.x + -0.5f;
  _27 = TexCoord.y + -0.5f;
  _28 = ImageProcPostProcessConstBuffer_1212 * _26;
  _29 = ImageProcPostProcessConstBuffer_1216 * _27;
  _38 = ImageProcPostProcessConstBuffer_1228 * _28;
  _39 = _29 * ImageProcPostProcessConstBuffer_1228;
  _51 = ((ImageProcPostProcessConstBuffer_1232 - ImageProcPostProcessConstBuffer_1236) * exp2(log2(saturate(ImageProcPostProcessConstBuffer_1220 - sqrt((_29 * _29) + (_28 * _28)))) * ImageProcPostProcessConstBuffer_1248)) + ImageProcPostProcessConstBuffer_1236;
  [branch]
  if (!(_51 < 0.0f)) {
    _57 = _51 * ImageProcPostProcessConstBuffer_1244;
    _59 = rsqrt(dot(float2(_38, _39), float2(_38, _39)));
    _60 = _59 * _38;
    _61 = _59 * _39;
    _62 = 1.0f / ImageProcTexDimConstBuffer_368.x;
    _63 = 1.0f / ImageProcTexDimConstBuffer_368.y;
    _65 = (_62 * _57) * _60;
    _66 = _61 * _57;
    _67 = _66 * _63;
    _69 = (_62 * _51) * _61;
    _70 = _60 * _51;
    _71 = _70 * _63;
    _77 = TexCoord.x - ((_65 + _69) * 0.5f);
    _78 = TexCoord.y - ((_63 * (_66 - _70)) * 0.5f);
    _81 = _77 + _65;
    _82 = _78 + _67;
    _85 = t0.SampleLevel(s0, float2((_81 + _69), (_82 - _71)), 0.0f);
    _89 = t0.SampleLevel(s0, float2(_81, _82), 0.0f);
    _93 = _77 + (_65 * 0.5f);
    _94 = _78 + (_67 * 0.5f);
    _97 = t0.SampleLevel(s0, float2((_93 + _69), (_94 - _71)), 0.0f);
    _101 = t0.SampleLevel(s0, float2(_93, _94), 0.0f);
    _106 = (_101.x + _97.x) * 0.5f;
    _108 = (_101.y + _97.y) * 0.5f;
    _110 = (_101.z + _97.z) * 0.5f;
    _112 = (_89.y + _85.y) + _108;
    _114 = (_89.z + _85.z) + _110;
    _117 = t0.SampleLevel(s0, float2((_77 + _69), (_78 - _71)), 0.0f);
    _122 = t0.SampleLevel(s0, float2(_77, _78), 0.0f);
    _126 = (_106 + _117.x) + _122.x;
    _140 = (((_89.x + _85.x) + _106) + _126) * 0.1666666716337204f;
    _141 = (((_108 + _117.y) + _122.y) + _112) * 0.1666666716337204f;
    _142 = (((_110 + _117.z) + _122.z) + _114) * 0.1666666716337204f;
    _153 = ((((_126 * 0.3333333432674408f) - _140) * ImageProcPostProcessConstBuffer_1240) + _140);
    _154 = ((((_112 * 0.3333333432674408f) - _141) * ImageProcPostProcessConstBuffer_1240) + _141);
    _155 = ((((_114 * 0.3333333432674408f) - _142) * ImageProcPostProcessConstBuffer_1240) + _142);

    float3 chromatic_aberration = lerp(float3(_18.x, _18.y, _18.z), float3(_153, _154, _155), CUSTOM_CHROMATIC_ABERRATION);
    _153 = chromatic_aberration.x;
    _154 = chromatic_aberration.y;
    _155 = chromatic_aberration.z;
  } else {
    _153 = _18.x;
    _154 = _18.y;
    _155 = _18.z;
  }
  if ((ImageProcPostProcessConstBuffer_1380 == 1) && (ImageProcPostProcessConstBuffer_1388 == 0)) {
    if (CUSTOM_FILM_GRAIN_TYPE == 0) {
      t5.GetDimensions(_164.x, _164.y);
      _180 = t5.Sample(s2, float2(((ImageProcTexDimConstBuffer_368.x / (float((int)((int)(_164.x))) * ImageProcPostProcessConstBuffer_1376)) * TexCoord.x), ((ImageProcTexDimConstBuffer_368.y / (float((int)((int)(_164.y))) * ImageProcPostProcessConstBuffer_1376)) * TexCoord.y)));
      _192 = dot(float3((_153 / (_153 + 1.0f)), (_154 / (_154 + 1.0f)), (_155 / (_155 + 1.0f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _197 = (lerp(_192, 1.0f, ImageProcPostProcessConstBuffer_1372)) * ImageProcPostProcessConstBuffer_1368;
      _204 = (_197 * (_180.x + -1.0f)) + 1.0f;
      _205 = (_197 * (_180.y + -1.0f)) + 1.0f;
      _206 = (_197 * (_180.z + -1.0f)) + 1.0f;
      _208 = (ImageProcPostProcessConstBuffer_1384 == 1);
      _216 = select(_208, _204, (_204 * _153));
      _217 = select(_208, _205, (_205 * _154));
      _218 = select(_208, _206, (_206 * _155));

      float3 film_grain = lerp(float3(_153, _154, _155), float3(_216, _217, _218), CUSTOM_FILM_GRAIN_STRENGTH);
      _216 = film_grain.x;
      _217 = film_grain.y;
      _218 = film_grain.z;
    } else if (CUSTOM_FILM_GRAIN_TYPE == 1) {
      float3 film_grain = ApplyPostProcessing(float3(_153, _154, _155), TexCoord.xy);
      _216 = film_grain.x;
      _217 = film_grain.y;
      _218 = film_grain.z;
    }
  } else {
    _216 = _153;
    _217 = _154;
    _218 = _155;

    if (CUSTOM_FILM_GRAIN_TYPE == 2) {
      float3 film_grain = ApplyPostProcessing(float3(_153, _154, _155), TexCoord.xy);
      _216 = film_grain.x;
      _217 = film_grain.y;
      _218 = film_grain.z;
    }
  }
  _221 = ImageProcPostProcessConstBuffer_1252 * _26;
  _222 = ImageProcPostProcessConstBuffer_1256 * _27;
  _237 = exp2(log2(saturate(ImageProcPostProcessConstBuffer_1268 + saturate(ImageProcPostProcessConstBuffer_1260 - sqrt((_222 * _222) + (_221 * _221))))) * ImageProcPostProcessConstBuffer_1264);

  _237 = lerp(1.f, _237, CUSTOM_VIGNETTE);

  _238 = _237 * _216;
  _239 = _237 * _217;
  _240 = _237 * _218;
  if ((ImageProcPostProcessConstBuffer_1296 > 0.0f) && (!(((t4.SampleLevel(s0, float2(min(max((ImageProcTexDimConstBuffer_456.x * TexCoord.x), 0.0f), ImageProcTexDimConstBuffer_464.x), min(max((ImageProcTexDimConstBuffer_456.y * TexCoord.y), 0.0f), ImageProcTexDimConstBuffer_464.y)), 0.0f)).x) > 0.5f))) {
    _286 = t2.SampleLevel(s0, float3(((t1.SampleLevel(s0, float2(((sqrt(saturate(_238 / ImageProcPostProcessConstBuffer_1304)) * 0.999755859375f) + 0.0001220703125f), 0.0f), 0.0f)).x), ((t1.SampleLevel(s0, float2(((sqrt(saturate(_239 / ImageProcPostProcessConstBuffer_1304)) * 0.999755859375f) + 0.0001220703125f), 0.0f), 0.0f)).x), ((t1.SampleLevel(s0, float2(((sqrt(saturate(_240 / ImageProcPostProcessConstBuffer_1304)) * 0.999755859375f) + 0.0001220703125f), 0.0f), 0.0f)).x)), 0.0f);
    _291 = _286.x;
    _292 = _286.y;
    _293 = _286.z;
  } else {
    _291 = _238;
    _292 = _239;
    _293 = _240;
  }
  _312 = mad(_293, (ImageProcPostProcessConstBuffer_256[0].z), mad(_292, (ImageProcPostProcessConstBuffer_256[0].y), ((ImageProcPostProcessConstBuffer_256[0].x) * _291))) + (ImageProcPostProcessConstBuffer_256[0].w);
  _316 = mad(_293, (ImageProcPostProcessConstBuffer_256[1].z), mad(_292, (ImageProcPostProcessConstBuffer_256[1].y), ((ImageProcPostProcessConstBuffer_256[1].x) * _291))) + (ImageProcPostProcessConstBuffer_256[1].w);
  _320 = mad(_293, (ImageProcPostProcessConstBuffer_256[2].z), mad(_292, (ImageProcPostProcessConstBuffer_256[2].y), ((ImageProcPostProcessConstBuffer_256[2].x) * _291))) + (ImageProcPostProcessConstBuffer_256[2].w);
  _326 = (frac(frac(dot(float2(TexCoord.z, TexCoord.w), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) * 0.003921568859368563f) + -0.0019607844296842813f;
  SV_Target.x = max((exp2(log2(select((_312 <= 0.0031308000907301903f), (_312 * 12.920000076293945f), ((exp2(log2(abs(_312)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * ImageProcPostProcessConstBuffer_768.x) + _326), 0.0f);
  SV_Target.y = max((exp2(log2(select((_316 <= 0.0031308000907301903f), (_316 * 12.920000076293945f), ((exp2(log2(abs(_316)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * ImageProcPostProcessConstBuffer_768.x) + _326), 0.0f);
  SV_Target.z = max((exp2(log2(select((_320 <= 0.0031308000907301903f), (_320 * 12.920000076293945f), ((exp2(log2(abs(_320)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * ImageProcPostProcessConstBuffer_768.x) + _326), 0.0f);
  SV_Target.w = 0.0f;
  return SV_Target;
}