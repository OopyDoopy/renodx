#include "../common.hlsl"

struct SunOcclusionStruct {
  int SunOcclusionStruct_000;
  int SunOcclusionStruct_004;
  float SunOcclusionStruct_008;
  int SunOcclusionStruct_012;
};


Texture2D<float3> t0 : register(t0);

Texture2D<float3> t1 : register(t1);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t5 : register(t5);

StructuredBuffer<SunOcclusionStruct> t7 : register(t7);

Texture2D<float4> t8 : register(t8);

Texture2D<float4> t9 : register(t9);

Texture2D<float4> t13 : register(t13);

Texture2D<float4> t14 : register(t14);

Texture2D<float4> t19 : register(t19);

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

SamplerState s1 : register(s1);

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
  float3 _32;
  float4 _40;
  float _46;
  float3 _60;
  float _69;
  float _70;
  float _71;
  float _111;
  float _112;
  float _113;
  float _152;
  float _153;
  float _154;
  float _171;
  float _172;
  float _173;
  float _193;
  float _194;
  float _195;
  float _257;
  float _258;
  float _259;
  float _354;
  float _355;
  float _356;
  float _92;
  float _103;
  float _121;
  float _122;
  float4 _124;
  float4 _132;
  bool _141;
  float4 _160;
  float _174;
  float _175;
  float _176;
  float _188;
  uint2 _204;
  float4 _221;
  float _233;
  float _238;
  float _245;
  float _246;
  float _247;
  bool _249;
  float _294;
  float _327;
  float _328;
  float _334;
  _32 = t0.SampleLevel(s1, float2((ImageProcTexDimConstBuffer_424.x * TexCoord.x), (ImageProcTexDimConstBuffer_424.y * TexCoord.y)), 0.0f);
  _40 = t14.Sample(s0, float2(TexCoord.x, TexCoord.y));
  _46 = (1.0f - _40.w) * ImageProcPostProcessConstBuffer_980;
  _60 = t1.Sample(s0, float2(TexCoord_4.x, TexCoord_4.y));
  _69 = ((_46 * _32.x) + (ImageProcPostProcessConstBuffer_980 * _40.x)) + (ImageProcPostProcessConstBuffer_980 * _60.x);
  _70 = ((_46 * _32.y) + (ImageProcPostProcessConstBuffer_980 * _40.y)) + (ImageProcPostProcessConstBuffer_980 * _60.y);
  _71 = ((_46 * _32.z) + (ImageProcPostProcessConstBuffer_980 * _40.z)) + (ImageProcPostProcessConstBuffer_980 * _60.z);
  if (ImageProcPostProcessConstBuffer_480.w > 0.0f) {
    _92 = t7[0].SunOcclusionStruct_008;
    _103 = (((_92 + -1.0f) * ImageProcPostProcessConstBuffer_496) + 1.0f) * exp2(log2(abs(((float4)(t2.Sample(s0, float2(((ImageProcPostProcessConstBuffer_720.x * TexCoord.x) + ImageProcPostProcessConstBuffer_720.z), ((ImageProcPostProcessConstBuffer_720.y * TexCoord.y) + ImageProcPostProcessConstBuffer_720.w))))).x)) * ImageProcPostProcessConstBuffer_480.w);
    _111 = ((_103 * ImageProcPostProcessConstBuffer_480.x) + _69);
    _112 = ((_103 * ImageProcPostProcessConstBuffer_480.y) + _70);
    _113 = ((_103 * ImageProcPostProcessConstBuffer_480.z) + _71);
  } else {
    _111 = _69;
    _112 = _70;
    _113 = _71;
  }
  if (!(ImageProcPostProcessConstBuffer_816 == 0)) {
    _121 = ImageProcTexDimConstBuffer_408.x * TexCoord.x;
    _122 = ImageProcTexDimConstBuffer_408.y * TexCoord.y;
    _124 = t8.SampleLevel(s0, float2(_121, _122), 0.0f);
    _132 = t9.SampleLevel(s0, float2(_121, _122), 0.0f);
    _141 = ((asint((((_124.x + _124.y) + _124.z) * ImageProcPostProcessConstBuffer_980)) & 2139095040) == 2139095040);
    _152 = (select(_141, 0.0f, (_124.x * ImageProcPostProcessConstBuffer_980)) + (_132.x * _111));
    _153 = (select(_141, 0.0f, (_124.y * ImageProcPostProcessConstBuffer_980)) + (_132.y * _112));
    _154 = (select(_141, 0.0f, (_124.z * ImageProcPostProcessConstBuffer_980)) + (_132.z * _113));
  } else {
    _152 = _111;
    _153 = _112;
    _154 = _113;
  }
  if (ImageProcPostProcessConstBuffer_688.x > 0.0f) {
    _160 = t5.Sample(s0, float2(TexCoord.x, TexCoord.y));
    _171 = ((_160.x * ImageProcPostProcessConstBuffer_980) + _152);
    _172 = ((_160.y * ImageProcPostProcessConstBuffer_980) + _153);
    _173 = ((_160.z * ImageProcPostProcessConstBuffer_980) + _154);
  } else {
    _171 = _152;
    _172 = _153;
    _173 = _154;
  }
  _174 = _171 * TexCoord_1.w;
  _175 = _172 * TexCoord_1.w;
  _176 = _173 * TexCoord_1.w;
  if (!(ImageProcPostProcessConstBuffer_988 == 0)) {
    _188 = (ImageProcPostProcessConstBuffer_996 * ((((float4)(t13.SampleLevel(s0, float2(TexCoord.x, TexCoord.y), 0.0f))).x) + -1.0f)) + 1.0f;
    _193 = (_188 * _174);
    _194 = (_188 * _175);
    _195 = (_188 * _176);
  } else {
    _193 = _174;
    _194 = _175;
    _195 = _176;
  }
  if (!((ImageProcPostProcessConstBuffer_1380 != 1) || (ImageProcPostProcessConstBuffer_1388 == 0))) {
    if (CUSTOM_FILM_GRAIN_TYPE == 0) {
      uint2 _204; t19.GetDimensions(_204.x, _204.y);
      _221 = t19.Sample(s2, float2(((ImageProcTexDimConstBuffer_368.x / (float((int)((int)(_204.x))) * ImageProcPostProcessConstBuffer_1376)) * TexCoord.x), ((ImageProcTexDimConstBuffer_368.y / (float((int)((int)(_204.y))) * ImageProcPostProcessConstBuffer_1376)) * TexCoord.y)));
      _233 = dot(float3((_193 / (_193 + 1.0f)), (_194 / (_194 + 1.0f)), (_195 / (_195 + 1.0f))), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      _238 = (lerp(_233, 1.0f, ImageProcPostProcessConstBuffer_1372)) * ImageProcPostProcessConstBuffer_1368;
      _245 = (_238 * (_221.x + -1.0f)) + 1.0f;
      _246 = (_238 * (_221.y + -1.0f)) + 1.0f;
      _247 = (_238 * (_221.z + -1.0f)) + 1.0f;
      _249 = (ImageProcPostProcessConstBuffer_1384 == 1);
      float3 film_grain = lerp(float3(_193, _194, _195), float3(
          select(_249, _245, (_245 * _193)),
          select(_249, _246, (_246 * _194)),
          select(_249, _247, (_247 * _195))), CUSTOM_FILM_GRAIN_STRENGTH);
      _257 = film_grain.x;
      _258 = film_grain.y;
      _259 = film_grain.z;
    } else if (CUSTOM_FILM_GRAIN_TYPE == 1) {
      float3 film_grain = ApplyPostProcessing(float3(_193, _194, _195), TexCoord.xy);
      _257 = film_grain.x;
      _258 = film_grain.y;
      _259 = film_grain.z;
    } else {
      _257 = _193;
      _258 = _194;
      _259 = _195;
    }
  } else {
    _257 = _193;
    _258 = _194;
    _259 = _195;

    if (CUSTOM_FILM_GRAIN_TYPE == 2) {
      float3 film_grain = ApplyPostProcessing(float3(_193, _194, _195), TexCoord.xy);
      _257 = film_grain.x;
      _258 = film_grain.y;
      _259 = film_grain.z;
    }
  }
  if (!(ImageProcPostProcessConstBuffer_160.w > 0.0f)) {
    [branch]
    if (ImageProcPostProcessConstBuffer_208.w > 0.0f) {
      _294 = TexCoord_1.y + 0.5f;
      _327 = (dot(float2((lerp(ImageProcPostProcessConstBuffer_128.x, ImageProcPostProcessConstBuffer_176.x, _294)), (lerp(ImageProcPostProcessConstBuffer_128.y, ImageProcPostProcessConstBuffer_176.y, _294))), float2(TexCoord_1.x, TexCoord_1.y)) + ImageProcPostProcessConstBuffer_144.x) + ((ImageProcPostProcessConstBuffer_192.x - ImageProcPostProcessConstBuffer_144.x) * _294);
      _328 = (lerp(ImageProcPostProcessConstBuffer_144.y, ImageProcPostProcessConstBuffer_192.y, _294)) + dot(float2((lerp(ImageProcPostProcessConstBuffer_128.z, ImageProcPostProcessConstBuffer_176.z, _294)), (lerp(ImageProcPostProcessConstBuffer_128.w, ImageProcPostProcessConstBuffer_176.w, _294))), float2(TexCoord_1.x, TexCoord_1.y));
      _334 = saturate(exp2(log2(dot(float2(_327, _328), float2(_327, _328))) * (lerp(ImageProcPostProcessConstBuffer_144.w, ImageProcPostProcessConstBuffer_192.w, _294)))) * (lerp(ImageProcPostProcessConstBuffer_160.w, ImageProcPostProcessConstBuffer_208.w, _294));
      _354 = (saturate(1.0f - (_334 * ((1.0f - ImageProcPostProcessConstBuffer_160.x) - ((ImageProcPostProcessConstBuffer_208.x - ImageProcPostProcessConstBuffer_160.x) * _294)))) * _257);
      _355 = (saturate(1.0f - (_334 * ((1.0f - ImageProcPostProcessConstBuffer_160.y) - ((ImageProcPostProcessConstBuffer_208.y - ImageProcPostProcessConstBuffer_160.y) * _294)))) * _258);
      _356 = (saturate(1.0f - (_334 * ((1.0f - ImageProcPostProcessConstBuffer_160.z) - ((ImageProcPostProcessConstBuffer_208.z - ImageProcPostProcessConstBuffer_160.z) * _294)))) * _259);
    } else {
      _354 = _257;
      _355 = _258;
      _356 = _259;
    }
  } else {
    _294 = TexCoord_1.y + 0.5f;
    _327 = (dot(float2((lerp(ImageProcPostProcessConstBuffer_128.x, ImageProcPostProcessConstBuffer_176.x, _294)), (lerp(ImageProcPostProcessConstBuffer_128.y, ImageProcPostProcessConstBuffer_176.y, _294))), float2(TexCoord_1.x, TexCoord_1.y)) + ImageProcPostProcessConstBuffer_144.x) + ((ImageProcPostProcessConstBuffer_192.x - ImageProcPostProcessConstBuffer_144.x) * _294);
    _328 = (lerp(ImageProcPostProcessConstBuffer_144.y, ImageProcPostProcessConstBuffer_192.y, _294)) + dot(float2((lerp(ImageProcPostProcessConstBuffer_128.z, ImageProcPostProcessConstBuffer_176.z, _294)), (lerp(ImageProcPostProcessConstBuffer_128.w, ImageProcPostProcessConstBuffer_176.w, _294))), float2(TexCoord_1.x, TexCoord_1.y));
    _334 = saturate(exp2(log2(dot(float2(_327, _328), float2(_327, _328))) * (lerp(ImageProcPostProcessConstBuffer_144.w, ImageProcPostProcessConstBuffer_192.w, _294)))) * (lerp(ImageProcPostProcessConstBuffer_160.w, ImageProcPostProcessConstBuffer_208.w, _294));
    _354 = (saturate(1.0f - (_334 * ((1.0f - ImageProcPostProcessConstBuffer_160.x) - ((ImageProcPostProcessConstBuffer_208.x - ImageProcPostProcessConstBuffer_160.x) * _294)))) * _257);
    _355 = (saturate(1.0f - (_334 * ((1.0f - ImageProcPostProcessConstBuffer_160.y) - ((ImageProcPostProcessConstBuffer_208.y - ImageProcPostProcessConstBuffer_160.y) * _294)))) * _258);
    _356 = (saturate(1.0f - (_334 * ((1.0f - ImageProcPostProcessConstBuffer_160.z) - ((ImageProcPostProcessConstBuffer_208.z - ImageProcPostProcessConstBuffer_160.z) * _294)))) * _259);
  }
  SV_Target.x = _354;
  SV_Target.y = _355;
  SV_Target.z = _356;
  SV_Target.w = 0.0f;
  return SV_Target;
}