#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.4.1 on Wed Jan 29 15:53:32 2025
Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[13];
}

float3 SampleLutPQ(float3 color) {
  float3 pq_color = saturate(LutEncode(color));
  const float texel_size = cb0[12].x;
  const float slice = cb0[12].y;
  const float max_index = cb0[12].z;

  const float z_position = pq_color.z * max_index;
  const float z_integer = floor(z_position);
  const float z_fraction = z_position - z_integer;
  const float2 uv = float2(
      z_integer * slice + pq_color.x * max_index * texel_size + texel_size * 0.5f,
      pq_color.y * max_index * slice + slice * 0.5f);

  const float3 color0 = t5.SampleLevel(s5_s, uv, 0).rgb;
  const float3 color1 = t5.SampleLevel(s5_s, uv + float2(slice, 0), 0).rgb;
  return lerp(color0, color1, z_fraction);
}

// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  float2 w2 : TEXCOORD3,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s1_s, v1.xy).xyzw;
  r0.yz = v1.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r0.yz, r0.yz);
  r0.yz = r0.yz * r0.ww;

  r0.yz = cb0[7].xx * r0.yz;  // Chromatic Aberration intensity
  r0.yz *= CUSTOM_CHROMATIC_ABERRATION;

  r1.xy = cb0[2].zw * -r0.yz;
  r1.xy = float2(0.5,0.5) * r1.xy;
  r0.w = dot(r1.xy, r1.xy);
  r0.w = sqrt(r0.w);
  r0.w = (int)r0.w;
  r0.w = max(3, (int)r0.w);
  r0.w = min(16, (int)r0.w);
  r1.x = (int)r0.w;
  r0.yz = -r0.yz / r1.xx;
  r2.yw = float2(0,0);
  r1.yzw = float3(0,0,0);
  r4.xy = v1.xy;
  r3.xyzw = float4(0,0,0,0);
  while (true) {
    r4.z = cmp((int)r3.w >= (int)r0.w);
    if (r4.z != 0) break;
    r4.z = (int)r3.w;
    r4.z = 0.5 + r4.z;
    r2.x = r4.z / r1.x;
    r4.zw = r4.xy * cb0[3].xy + cb0[3].zw;
    r5.xyzw = t1.SampleLevel(s0_s, r4.zw, 0).xyzw;
    r6.xyzw = t2.SampleLevel(s2_s, r2.xy, 0).xyzw;
    r1.yzw = r5.zxy * r6.zxy + r1.yzw;
    r3.xyz = r6.zxy + r3.xyz;
    r4.xy = r4.xy + r0.yz;
    r3.w = (int)r3.w + 1;
  }
  r0.yzw = r1.yzw / r3.xyz;
  r1.xyzw = float4(1,1,-1,0) * cb0[10].xyxy;
  r3.xyzw = -r1.xywy * cb0[11].xxxx + w2.xyxy;
  r4.xyzw = t3.Sample(s3_s, r3.xy).xyzw;
  r3.xyzw = t3.Sample(s3_s, r3.zw).xyzw;
  r3.xyz = r3.zxy * float3(2,2,2) + r4.zxy;
  r2.xy = -r1.zy * cb0[11].xx + w2.xy;
  r4.xyzw = t3.Sample(s3_s, r2.xy).xyzw;
  r3.xyz = r4.zxy + r3.xyz;
  r4.xyzw = r1.zwxw * cb0[11].xxxx + w2.xyxy;
  r5.xyzw = t3.Sample(s3_s, r4.xy).xyzw;
  r3.xyz = r5.zxy * float3(2,2,2) + r3.xyz;
  r5.xyzw = t3.Sample(s3_s, w2.xy).xyzw;
  r3.xyz = r5.zxy * float3(4,4,4) + r3.xyz;
  r4.xyzw = t3.Sample(s3_s, r4.zw).xyzw;
  r3.xyz = r4.zxy * float3(2,2,2) + r3.xyz;
  r4.xyzw = r1.zywy * cb0[11].xxxx + w2.xyxy;
  r5.xyzw = t3.Sample(s3_s, r4.xy).xyzw;
  r3.xyz = r5.zxy + r3.xyz;
  r4.xyzw = t3.Sample(s3_s, r4.zw).xyzw;
  r3.xyz = r4.zxy * float3(2,2,2) + r3.xyz;
  r1.xy = r1.xy * cb0[11].xx + w2.xy;
  r1.xyzw = t3.Sample(s3_s, r1.xy).xyzw;
  r1.xyz = r3.xyz + r1.zxy;

  r1.xyz = cb0[11].yyy * r1.xyz;  // Bloom intensity
  r1.xyz *= CUSTOM_BLOOM;

  r1.xyz = float3(0.0625,0.0625,0.0625) * r1.xyz;
  r0.xyz = r0.yzw * r0.xxx + r1.xyz;
  r3.xyzw = t4.Sample(s4_s, v2.xy).xyzw;
  r3.xyz = cb0[11].zzz * r3.zxy;

  r3.xyz *= CUSTOM_LENS_DIRT;

  r0.xyz = r1.xyz * r3.xyz + r0.xyz;
  r0.xyz = cb0[12].www * r0.xyz;

  float3 untonemapped = r0.gbr;

  float3 graded_color = SampleLutPQ(untonemapped);
  if (RENODX_TONE_MAP_TYPE == 0.f) {
    o0.rgb = saturate(graded_color);
  } else {
    float3 lut_black = SampleLutPQ(float3(0, 0, 0));
    float3 lut_mid = SampleLutPQ(lut_black);
    graded_color = ApplySceneGradeLUT(
        untonemapped,
        graded_color,
        lut_black,
        lut_mid);
    o0.rgb = graded_color;
  }

  o0.w = 1;
  return;
}
