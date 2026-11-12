#include "../common.hlsl"

Texture2D<float4> t0 : register(t0);
Texture1D<float> t1 : register(t1);
Texture3D<float4> t2 : register(t2);
Texture2D<float> t4 : register(t4);
Texture2D<float4> t5 : register(t5);

cbuffer cb0 : register(b0) {
  float2 ImageProcTexDimConstBuffer_368 : packoffset(c023.x);
  float2 ImageProcTexDimConstBuffer_456 : packoffset(c028.z);
  float2 ImageProcTexDimConstBuffer_464 : packoffset(c029.x);
};

cbuffer cb1 : register(b1) {
  float4 ImageProcPostProcessConstBuffer_256[4] : packoffset(c016.x);
  float4 ImageProcPostProcessConstBuffer_768 : packoffset(c048.x);
  float ImageProcPostProcessConstBuffer_1296 : packoffset(c081.x);
  float ImageProcPostProcessConstBuffer_1304 : packoffset(c081.z);
  float ImageProcPostProcessConstBuffer_1368 : packoffset(c085.z);
  float ImageProcPostProcessConstBuffer_1372 : packoffset(c085.w);
  float ImageProcPostProcessConstBuffer_1376 : packoffset(c086.x);
  int ImageProcPostProcessConstBuffer_1380 : packoffset(c086.y);
  int ImageProcPostProcessConstBuffer_1384 : packoffset(c086.z);
  int ImageProcPostProcessConstBuffer_1388 : packoffset(c086.w);
};

SamplerState s0 : register(s0);
SamplerState s2 : register(s2);

float4 main(
    noperspective float4 SV_Position : SV_Position,
    linear float4 TexCoord : TexCoord,
    linear float4 TexCoord_4 : TexCoord4,
    linear float4 TexCoord_1 : TexCoord1,
    linear float4 TexCoord_2 : TexCoord2,
    linear float4 TexCoord_3 : TexCoord3) : SV_Target {
  float3 color = t0.SampleLevel(s0, TexCoord.xy, 0.0f).rgb;
  if (ImageProcPostProcessConstBuffer_1380 == 1 && ImageProcPostProcessConstBuffer_1388 == 0) {
    if (CUSTOM_FILM_GRAIN_TYPE == 0) {
      uint2 dimensions;
      t5.GetDimensions(dimensions.x, dimensions.y);
      float3 grain = t5.Sample(s2, (ImageProcTexDimConstBuffer_368 / (float2(dimensions) * ImageProcPostProcessConstBuffer_1376)) * TexCoord.xy).rgb;
      float luminance = dot(color / (color + 1.0f), float3(0.21267099678516388f, 0.7151600122451782f, 0.0721689984202385f));
      float strength = lerp(luminance, 1.0f, ImageProcPostProcessConstBuffer_1372) * ImageProcPostProcessConstBuffer_1368;
      grain = strength * (grain - 1.0f) + 1.0f;
      color = lerp(color, ImageProcPostProcessConstBuffer_1384 == 1 ? grain : grain * color, CUSTOM_FILM_GRAIN_STRENGTH);
    } else if (CUSTOM_FILM_GRAIN_TYPE == 1) {
      color = ApplyPostProcessing(color, TexCoord.xy);
    }
  } else if (CUSTOM_FILM_GRAIN_TYPE == 2) {
    color = ApplyPostProcessing(color, TexCoord.xy);
  }

  float mask = t4.SampleLevel(s0, min(max(ImageProcTexDimConstBuffer_456 * TexCoord.xy, 0.0f), ImageProcTexDimConstBuffer_464), 0.0f);
  if (ImageProcPostProcessConstBuffer_1296 > 0.0f && !(mask > 0.5f)) {
    float3 lut_coord = sqrt(saturate(color / ImageProcPostProcessConstBuffer_1304)) * 0.999755859375f + 0.0001220703125f;
    lut_coord = float3(t1.SampleLevel(s0, lut_coord.x, 0.0f), t1.SampleLevel(s0, lut_coord.y, 0.0f), t1.SampleLevel(s0, lut_coord.z, 0.0f));
    color = t2.SampleLevel(s0, lut_coord, 0.0f).rgb;
  }

  color = float3(
      dot(ImageProcPostProcessConstBuffer_256[0].xyz, color) + ImageProcPostProcessConstBuffer_256[0].w,
      dot(ImageProcPostProcessConstBuffer_256[1].xyz, color) + ImageProcPostProcessConstBuffer_256[1].w,
      dot(ImageProcPostProcessConstBuffer_256[2].xyz, color) + ImageProcPostProcessConstBuffer_256[2].w);
  float dither = frac(frac(dot(TexCoord.zw, float2(0.0671105608344078f, 0.005837149918079376f))) * 52.98291778564453f) * 0.003921568859368563f - 0.0019607844296842813f;
  return float4(max(EncodeDisplay(color) * ImageProcPostProcessConstBuffer_768.x + dither, 0.0f), 0.0f);
}
