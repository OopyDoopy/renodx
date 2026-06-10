#include "../common.hlsl"

Texture2D<float4> t0 : register(t0);

Texture1D<float> t1 : register(t1);

Texture3D<float4> t2 : register(t2);

Texture3D<float4> t3 : register(t3);

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
  float4 _19;
  float _84;
  float _85;
  float _86;
  float _137;
  float _138;
  float _139;
  float _140;
  float _141;
  float _142;
  float _181;
  float _182;
  float _183;
  float _197;
  float _198;
  float _199;
  float _258;
  float _259;
  float _260;
  float _349;
  float _350;
  float _351;
  uint2 _31;
  float4 _48;
  float _60;
  float _65;
  float _72;
  float _73;
  float _74;
  bool _76;
  bool _106;
  float _125;
  float _127;
  float _129;
  float4 _132;
  float _161;
  float _165;
  float _169;
  bool _172;
  float4 _176;
  float _203;
  float _205;
  float _207;
  float _210;
  float _211;
  float _212;
  float _218;
  float _221;
  float _224;
  float _242;
  float _247;
  float _273;
  float _274;
  float _275;
  _19 = t0.SampleLevel(s0, float2(TexCoord.x, TexCoord.y), 0.0f);
  if ((ImageProcPostProcessConstBuffer_1380 == 1) && (ImageProcPostProcessConstBuffer_1388 == 0)) {
    if (CUSTOM_FILM_GRAIN_TYPE == 0) {
      uint2 _31; t5.GetDimensions(_31.x, _31.y);
      _48 = t5.Sample(s2, float2(((ImageProcTexDimConstBuffer_368.x / (float((int)((int)(_31.x))) * ImageProcPostProcessConstBuffer_1376)) * TexCoord.x), ((ImageProcTexDimConstBuffer_368.y / (float((int)((int)(_31.y))) * ImageProcPostProcessConstBuffer_1376)) * TexCoord.y)));
      _60 = dot(float3((_19.x / (_19.x + 1.0f)), (_19.y / (_19.y + 1.0f)), (_19.z / (_19.z + 1.0f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _65 = (lerp(_60, 1.0f, ImageProcPostProcessConstBuffer_1372)) * ImageProcPostProcessConstBuffer_1368;
      _72 = (_65 * (_48.x + -1.0f)) + 1.0f;
      _73 = (_65 * (_48.y + -1.0f)) + 1.0f;
      _74 = (_65 * (_48.z + -1.0f)) + 1.0f;
      _76 = (ImageProcPostProcessConstBuffer_1384 == 1);
      _84 = lerp(_19.x, select(_76, _72, (_72 * _19.x)), CUSTOM_FILM_GRAIN_STRENGTH);
      _85 = lerp(_19.y, select(_76, _73, (_73 * _19.y)), CUSTOM_FILM_GRAIN_STRENGTH);
      _86 = lerp(_19.z, select(_76, _74, (_74 * _19.z)), CUSTOM_FILM_GRAIN_STRENGTH);
    } else if (CUSTOM_FILM_GRAIN_TYPE == 1) {
      float3 film_grain = ApplyPostProcessing(_19.rgb, TexCoord.xy);
      _84 = film_grain.x;
      _85 = film_grain.y;
      _86 = film_grain.z;
    }
  } else {
    _84 = _19.x;
    _85 = _19.y;
    _86 = _19.z;

    if (CUSTOM_FILM_GRAIN_TYPE == 2) {
      float3 film_grain = ApplyPostProcessing(_19.rgb, TexCoord.xy);
      _84 = film_grain.x;
      _85 = film_grain.y;
      _86 = film_grain.z;
    }
  }
  _106 = (((t4.SampleLevel(s0, float2(min(max((ImageProcTexDimConstBuffer_456.x * TexCoord.x), 0.0f), ImageProcTexDimConstBuffer_464.x), min(max((ImageProcTexDimConstBuffer_456.y * TexCoord.y), 0.0f), ImageProcTexDimConstBuffer_464.y)), 0.0f)).x) > 0.5f) || (!(ImageProcPostProcessConstBuffer_1296 > 0.0f));
  if (!(_106)) {
    _125 = t1.SampleLevel(s0, float2(((sqrt(saturate(_84 / ImageProcPostProcessConstBuffer_1304)) * 0.999755859375f) + 0.0001220703125f), 0.0f), 0.0f);
    _127 = t1.SampleLevel(s0, float2(((sqrt(saturate(_85 / ImageProcPostProcessConstBuffer_1304)) * 0.999755859375f) + 0.0001220703125f), 0.0f), 0.0f);
    _129 = t1.SampleLevel(s0, float2(((sqrt(saturate(_86 / ImageProcPostProcessConstBuffer_1304)) * 0.999755859375f) + 0.0001220703125f), 0.0f), 0.0f);
    _132 = t2.SampleLevel(s0, float3(_125.x, _127.x, _129.x), 0.0f);
    _137 = _125.x;
    _138 = _127.x;
    _139 = _129.x;
    _140 = _132.x;
    _141 = _132.y;
    _142 = _132.z;
  } else {
    _137 = _84;
    _138 = _85;
    _139 = _86;
    _140 = _84;
    _141 = _85;
    _142 = _86;
  }
  _161 = mad(_142, (ImageProcPostProcessConstBuffer_256[0].z), mad(_141, (ImageProcPostProcessConstBuffer_256[0].y), ((ImageProcPostProcessConstBuffer_256[0].x) * _140))) + (ImageProcPostProcessConstBuffer_256[0].w);
  _165 = mad(_142, (ImageProcPostProcessConstBuffer_256[1].z), mad(_141, (ImageProcPostProcessConstBuffer_256[1].y), ((ImageProcPostProcessConstBuffer_256[1].x) * _140))) + (ImageProcPostProcessConstBuffer_256[1].w);
  _169 = mad(_142, (ImageProcPostProcessConstBuffer_256[2].z), mad(_141, (ImageProcPostProcessConstBuffer_256[2].y), ((ImageProcPostProcessConstBuffer_256[2].x) * _140))) + (ImageProcPostProcessConstBuffer_256[2].w);
  _172 = (ImageProcPostProcessConstBuffer_752.y > 0.0f);
  [branch]
  if (_172) {
    do {
      _181 = _137;
      _182 = _138;
      _183 = _139;
      if (!(_106)) {
        _176 = t3.SampleLevel(s0, float3(_137, _138, _139), 0.0f);
        _181 = _176.x;
        _182 = _176.y;
        _183 = _176.z;
      }
      _197 = (mad(_183, (ImageProcPostProcessConstBuffer_256[0].z), mad(_182, (ImageProcPostProcessConstBuffer_256[0].y), (_181 * (ImageProcPostProcessConstBuffer_256[0].x)))) + (ImageProcPostProcessConstBuffer_256[0].w));
      _198 = (mad(_183, (ImageProcPostProcessConstBuffer_256[1].z), mad(_182, (ImageProcPostProcessConstBuffer_256[1].y), (_181 * (ImageProcPostProcessConstBuffer_256[1].x)))) + (ImageProcPostProcessConstBuffer_256[1].w));
      _199 = (mad(_183, (ImageProcPostProcessConstBuffer_256[2].z), mad(_182, (ImageProcPostProcessConstBuffer_256[2].y), (_181 * (ImageProcPostProcessConstBuffer_256[2].x)))) + (ImageProcPostProcessConstBuffer_256[2].w));
    } while (false);
  } else {
    _197 = _137;
    _198 = _138;
    _199 = _139;
  }
  _203 = frac(frac(dot(float2(TexCoord.z, TexCoord.w), float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f);
  _205 = (_203 * 0.003921568859368563f) + -0.0019607844296842813f;
  _207 = (_203 * 0.0009775171056389809f) + -0.0004887585528194904f;

  [branch]
  if (_172 && RENODX_TONE_MAP_TYPE == 0) {
    _210 = _197 * ImageProcPostProcessConstBuffer_752.x;
    _211 = _198 * ImageProcPostProcessConstBuffer_752.x;
    _212 = _199 * ImageProcPostProcessConstBuffer_752.x;
    _218 = mad(0.04331360012292862f, _212, mad(0.3292819857597351f, _211, (_210 * 0.627403974533081f)));
    _221 = mad(0.011361200362443924f, _212, mad(0.9195399880409241f, _211, (_210 * 0.06909699738025665f)));
    _224 = mad(0.8955950140953064f, _212, mad(0.08801320195198059f, _211, (_210 * 0.01639159955084324f)));
    do {
      _258 = _218;
      _259 = _221;
      _260 = _224;
      [branch]
      if (ImageProcPostProcessConstBuffer_784.x > 0.0f) {
        _242 = saturate((max(max(_210, _211), _212) - ImageProcPostProcessConstBuffer_784.y) / (ImageProcPostProcessConstBuffer_784.z - ImageProcPostProcessConstBuffer_784.y));
        _247 = 1.0f - ImageProcPostProcessConstBuffer_784.x;
        _258 = (((((1.0f - _242) * _218) + (_242 * mad(0.047561999410390854f, _212, mad(0.19859300553798676f, _211, (_210 * 0.7538449764251709f))))) * ImageProcPostProcessConstBuffer_784.x) + (_218 * _247));
        _259 = ((ImageProcPostProcessConstBuffer_784.x * mad(0.012477199546992779f, _212, mad(0.9417769908905029f, _211, (_210 * 0.045745600014925f)))) + (_221 * _247));
        _260 = ((ImageProcPostProcessConstBuffer_784.x * mad(0.9836069941520691f, _212, mad(0.017604099586606026f, _211, (_210 * -0.0012105499627068639f)))) + (_224 * _247));
      }
      _273 = exp2(log2(saturate(_258 * 9.999999747378752e-05f)) * 0.1593017578125f);
      _274 = exp2(log2(saturate(_259 * 9.999999747378752e-05f)) * 0.1593017578125f);
      _275 = exp2(log2(saturate(_260 * 9.999999747378752e-05f)) * 0.1593017578125f);
      _349 = (saturate(exp2(log2(((_273 * 18.8515625f) + 0.8359375f) / ((_273 * 18.6875f) + 1.0f)) * 78.84375f)) + _207);
      _350 = (saturate(exp2(log2(((_274 * 18.8515625f) + 0.8359375f) / ((_274 * 18.6875f) + 1.0f)) * 78.84375f)) + _207);
      _351 = (saturate(exp2(log2(((_275 * 18.8515625f) + 0.8359375f) / ((_275 * 18.6875f) + 1.0f)) * 78.84375f)) + _207);
    } while (false);
  } else if (_172 && RENODX_TONE_MAP_TYPE != 0) {
    SV_Target.xyz = HDREncodePQ(float3(_197, _198, _199));
    SV_Target.w = 0.0f;
    return SV_Target;
  } else {
    _349 = (exp2(log2(select((_161 <= 0.0031308000907301903f), (_161 * 12.920000076293945f), ((exp2(log2(abs(_161)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * ImageProcPostProcessConstBuffer_768.x) + _205);
    _350 = (exp2(log2(select((_165 <= 0.0031308000907301903f), (_165 * 12.920000076293945f), ((exp2(log2(abs(_165)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * ImageProcPostProcessConstBuffer_768.x) + _205);
    _351 = (exp2(log2(select((_169 <= 0.0031308000907301903f), (_169 * 12.920000076293945f), ((exp2(log2(abs(_169)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f))) * ImageProcPostProcessConstBuffer_768.x) + _205);
  }
  SV_Target.x = max(_349, 0.0f);
  SV_Target.y = max(_350, 0.0f);
  SV_Target.z = max(_351, 0.0f);
  SV_Target.w = 0.0f;
  return SV_Target;
}