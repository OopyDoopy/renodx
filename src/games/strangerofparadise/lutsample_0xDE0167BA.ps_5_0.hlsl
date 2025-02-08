// ---- Created with 3Dmigoto v1.3.16 on Thu Feb 06 18:43:43 2025

cbuffer cbComposite : register(b2)
{
  float4 g_vSceneTexSize : packoffset(c0);
  float4 g_vCompositeInfo : packoffset(c1);
  float4 g_vSun2dInfo : packoffset(c2);
  float4 g_vEtcEffect : packoffset(c3);
  float4 g_vBloomInfo : packoffset(c4);
  float4 g_vLimbDarkenningInfo : packoffset(c5);
  float4 g_vFxaaParams : packoffset(c6);
  float4 g_vGammaCorrection : packoffset(c7);
  float4 g_vRadialBlurCenter : packoffset(c8);
  float4 g_vRadialBlurInfo : packoffset(c9);
  float4 g_vFxaaQualityParams : packoffset(c10);
  float4 g_vCompositeLastViewport : packoffset(c11);
  float4 g_vMaxUV : packoffset(c12);
  float4 g_vMinUV : packoffset(c13);
  float4 g_vP2V : packoffset(c14);
  float4x4 g_mV2W : packoffset(c15);
  float4 g_vDramaticHdrLutInfo0[2] : packoffset(c19);
  float4 g_vDramaticHdrLutInfo1[2] : packoffset(c21);
  float4 g_vDrawFixParams : packoffset(c23);
}

SamplerState sampleLinear_s : register(s7);
SamplerState samplePoint_s : register(s8);
Texture2D<float4> g_tSceneMap : register(t0);
Texture2D<float4> g_tLensFlareMap : register(t1);
Texture2D<float4> g_tExposureScaleInfo : register(t2);
Texture3D<float4> g_tHdrLut : register(t3);
Texture3D<float4> g_tLdrLut : register(t4);
Texture3D<float4> g_tDramaticHdrLut0 : register(t5);
Texture2D<float4> g_tDramaticHdrLutMask0 : register(t6);
Texture3D<float4> g_tDramaticHdrLut1 : register(t9);
Texture2D<float4> g_tDramaticHdrLutMask1 : register(t10);
Texture2D<float4> g_tSceneDepth : register(t11);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_Position0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  const float4 icb[] = { { 0, 0, 1.000000, 0},
                              { 0, 1.000000, 0, 0},
                              { 1.000000, 0, 0, 0},
                              { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 1.000000, 0, 0},
                              { 1.000000, 0, 0, 0},
                              { 1.000000, 0, 1.000000, 0},
                              { 1.000000, 0, 1.000000, 0},
                              { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0 < g_vSun2dInfo.z);
  r0.y = cmp(0 < g_vLimbDarkenningInfo.w);
  r0.zw = cmp(float2(0,0) < g_vDrawFixParams.xy);
  r1.x = cmp(g_vCompositeInfo.z < 0);
  r1.y = g_tExposureScaleInfo.Load(float3(0,0,0)).x;
  r1.zw = cmp(float2(0,0) < g_vCompositeInfo.zy);
  r1.z = r1.z ? g_vCompositeInfo.z : 1;
  r1.x = r1.x ? r1.y : r1.z;
  r1.yz = v1.xy * g_vCompositeLastViewport.zw + g_vCompositeLastViewport.xy;
  r2.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r1.yz, 0).xyz;
  r2.xyz = min(float3(65024,65024,65024), r2.xyz);
  r2.w = cmp(0 < g_vEtcEffect.x);
  if (r2.w != 0) {
    r2.w = (uint)g_vEtcEffect.y;
    r3.xy = r1.yz * float2(2,2) + float2(-1,-1);
    r3.z = dot(r3.xy, r3.xy);
    r3.xy = r3.xy * r3.zz;
    r3.xy = g_vEtcEffect.xx * r3.xy;
    r3.zw = g_vSceneTexSize.xy * -r3.xy;
    r3.zw = float2(0.5,0.5) * r3.zw;
    r3.z = dot(r3.zw, r3.zw);
    r3.z = sqrt(r3.z);
    r3.z = (int)r3.z;
    r3.z = max(3, (int)r3.z);
    r3.z = min(16, (int)r3.z);
    r3.w = (int)r3.z;
    r3.xy = -r3.xy / r3.ww;
    r4.xyz = icb[(int)r2.w+0].xyz * r2.xyz;
    r5.xy = (int2)r2.ww + int2(1, 2);
    r6.xyz = icb[(int)r5.x + 0].xyz + -icb[(int)r2.w + 0].xyz;
    r5.yzw = icb[(int)r5.y + 0].xyz + -icb[(int)r5.x+0].xyz;
    r7.xyz = r4.xyz;
    r8.xyz = icb[(int)r2.w+0].xyz;
    r9.xy = r1.yz;
    r4.w = 1;
    while (true) {
      r6.w = cmp((int)r4.w >= (int)r3.z);
      if (r6.w != 0) break;
      r9.xy = r9.xy + r3.xy;
      r10.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, r9.xy, 0).xyz;
      r10.xyz = min(float3(65024,65024,65024), r10.xyz);
      r6.w = (int)r4.w;
      r6.w = r6.w / r3.w;
      r7.w = cmp(r6.w < 0.5);
      if (r7.w != 0) {
        r7.w = r6.w + r6.w;
        r11.xyz = r7.www * r6.xyz + icb[(int)r2.w+0].xyz;
      } else {
        r6.w = r6.w * 2 + -1;
        r11.xyz = r6.www * r5.yzw + icb[(int)r5.x+0].xyz;
      }
      r7.xyz = r10.xyz * r11.xyz + r7.xyz;
      r8.xyz = r11.xyz + r8.xyz;
      r4.w = (int)r4.w + 1;
    }
    r2.xyz = r7.xyz / r8.xyz;
  }
  r2.xyz = r2.xyz * r1.xxx;
  if (r0.z != 0) {
    r0.z = dot(v0.xy, float2(171,231));
    r3.xyz = float3(0.00970873795,0.0140845068,0.010309278) * r0.zzz;
    r3.xyz = frac(r3.xyz);
    r3.xyz = r3.xyz * float3(0.00392156886,0.00392156886,0.00392156886) + r2.xyz;
    r3.xyz = float3(-0.00196078443,-0.00196078443,-0.00196078443) + r3.xyz;
    r2.xyz = max(float3(0,0,0), r3.xyz);
  }
  if (r0.x != 0) {
    r3.xyz = g_tSceneMap.SampleLevel(sampleLinear_s, g_vSun2dInfo.xy, 0).xyz;
    r3.xyz = min(float3(65024,65024,65024), r3.xyz);
    r3.xyz = r3.xyz * r1.xxx;
    r4.xyz = g_tLensFlareMap.SampleLevel(sampleLinear_s, r1.yz, 0).xyz;
    r4.xyz = min(float3(65024,65024,65024), r4.xyz);
    r0.x = dot(r3.xyz, float3(0.222014993,0.706655025,0.0713300034));
    r0.x = cmp(g_vEtcEffect.w < r0.x);
    r0.x = r0.x ? g_vEtcEffect.z : 0;
    r3.xyz = r4.xyz * r3.xyz;
    r2.xyz = r3.xyz * r0.xxx + r2.xyz;
  }
  if (r0.y != 0) {
    r0.yz = float2(-0.5,-0.5) + r1.yz;
    r0.x = g_vCompositeInfo.x * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.y = sqrt(r0.x);
    r0.y = -g_vLimbDarkenningInfo.y + r0.y;
    r0.z = cmp(0 < r0.y);
    r0.y = saturate(-r0.y * g_vLimbDarkenningInfo.z + 1);
    r0.y = r0.z ? r0.y : 1;
    r0.z = cmp(0 < r0.y);
    r0.x = g_vLimbDarkenningInfo.x + r0.x;
    r0.x = g_vLimbDarkenningInfo.x / r0.x;
    r0.x = r0.x * r0.x;
    r0.x = r0.z ? r0.x : 1;
    r0.x = r0.x * r0.y;
    r0.y = 1 + -g_vLimbDarkenningInfo.w;
    r0.x = r0.x * g_vLimbDarkenningInfo.w + r0.y;
    r2.xyz = r2.xyz * r0.xxx;
  }
  r0.xyz = r2.xyz * float3(1.00006652,1.00006652,1.00006652) + float3(-0.00391646381,-0.00391646381,-0.00391646381);
  r0.xyz = r0.www ? r0.xyz : r2.xyz;

  float3 untonemapped = r0.rgb;

  //linear to log
  r0.xyz = r0.xyz * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  r0.xyz = log2(r0.xyz);
  r0.xyz = saturate(r0.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));

  r2.xyz = g_tHdrLut.SampleLevel(sampleLinear_s, r0.xyz, 0).xyz;
  if (g_vDramaticHdrLutInfo0[0].w != 0) {
    r0.w = g_tSceneDepth.SampleLevel(samplePoint_s, r1.yz, 0).x;
    r0.w = g_vP2V.x + r0.w;
    r0.w = g_vP2V.y / r0.w;
    r1.x = (int)g_vDramaticHdrLutInfo0[0].w & 2;
    r3.xy = r1.yz * float2(2,-2) + float2(-1,1);
    r3.xy = g_vP2V.zw * r3.xy;
    r3.xy = r3.xy * -r0.ww;
    r2.w = g_mV2W._m11 * r3.y;
    r2.w = g_mV2W._m10 * r3.x + r2.w;
    r2.w = g_mV2W._m12 * r0.w + r2.w;
    r2.w = g_mV2W._m13 + r2.w;
    r1.x = r1.x ? r2.w : 0;
  } else {
    r0.w = 0;
    r1.x = 0;
  }
  r2.w = cmp(0 < g_vDramaticHdrLutInfo0[0].x);
  if (r2.w != 0) {
    r2.w = cmp(0 < g_vDramaticHdrLutInfo0[0].y);
    if (r2.w != 0) {
      r2.w = (int)g_vDramaticHdrLutInfo0[0].z & 0x0000ffff;
      if (r2.w == 0) {
        r2.w = g_tDramaticHdrLutMask0.SampleLevel(sampleLinear_s, r1.yz, 0).x;
        r2.w = g_vDramaticHdrLutInfo0[0].x * r2.w;
      } else {
        if (8 == 0) r3.x = 0; else if (8+16 < 32) {         r3.x = (uint)g_vDramaticHdrLutInfo0[0].z << (32-(8 + 16)); r3.x = (uint)r3.x >> (32-8);        } else r3.x = (uint)g_vDramaticHdrLutInfo0[0].z >> 16;
        if (r3.x != 0) {
          r3.y = -r0.w * g_vDramaticHdrLutInfo0[1].x + g_vDramaticHdrLutInfo0[1].y;
          r3.z = cmp(r3.y >= 0);
          r3.w = cmp(1 >= r3.y);
          r3.z = r3.w ? r3.z : 0;
          r3.z = r3.z ? 1.000000 : 0;

          // r3.w = saturate(r3.y);
          r3.w = r3.y;

          r4.x = -1.44269502 * r3.w;
          r4.x = exp2(r4.x);
          r4.x = 1 + -r4.x;
          r5.xyzw = cmp((int4)r3.xxxx == int4(1,2,3,4));
          r3.x = r3.w * r3.w;
          r3.x = -1.44269502 * r3.x;
          r3.x = exp2(r3.x);
          r3.x = 1 + -r3.x;
          r3.x = r5.w ? r3.x : r3.y;
          r3.x = r5.z ? r4.x : r3.x;
          r3.x = r5.y ? r3.w : r3.x;
          r3.x = r5.x ? r3.z : r3.x;
          r2.w = g_vDramaticHdrLutInfo0[0].x * r3.x;
        } else {
          r2.w = g_vDramaticHdrLutInfo0[0].x;
        }
        r3.x = (uint)g_vDramaticHdrLutInfo0[0].z >> 24;
        if (r3.x != 0) {
          r3.y = r1.x * g_vDramaticHdrLutInfo0[1].z + g_vDramaticHdrLutInfo0[1].w;
          r3.z = cmp(r3.y >= 0);
          r3.w = cmp(1 >= r3.y);
          r3.z = r3.w ? r3.z : 0;
          r3.z = r3.z ? 1.000000 : 0;

          // r3.w = saturate(r3.y);
          r3.w = r3.y;


          r4.x = -1.44269502 * r3.w;
          r4.x = exp2(r4.x);
          r4.x = 1 + -r4.x;
          r5.xyzw = cmp((int4)r3.xxxx == int4(1,2,3,4));
          r3.x = r3.w * r3.w;
          r3.x = -1.44269502 * r3.x;
          r3.x = exp2(r3.x);
          r3.x = 1 + -r3.x;
          r3.x = r5.w ? r3.x : r3.y;
          r3.x = r5.z ? r4.x : r3.x;
          r3.x = r5.y ? r3.w : r3.x;
          r3.x = r5.x ? r3.z : r3.x;
          r2.w = r3.x * r2.w;
        }
      }
      r2.w = -g_vDramaticHdrLutInfo0[0].x + r2.w;
      r2.w = g_vDramaticHdrLutInfo0[0].y * r2.w + g_vDramaticHdrLutInfo0[0].x;
    } else {
      r2.w = g_vDramaticHdrLutInfo0[0].x;
    }
    r3.xyz = g_tDramaticHdrLut0.SampleLevel(sampleLinear_s, r0.xyz, 0).xyz;
    r3.xyz = r3.xyz + -r2.xyz;
    r2.xyz = r2.www * r3.xyz + r2.xyz;
  }
  r2.w = cmp(0 < g_vDramaticHdrLutInfo1[0].x);
  if (r2.w != 0) {
    r2.w = cmp(0 < g_vDramaticHdrLutInfo1[0].y);
    if (r2.w != 0) {
      r2.w = (int)g_vDramaticHdrLutInfo1[0].z & 0x0000ffff;
      if (r2.w == 0) {
        r1.y = g_tDramaticHdrLutMask1.SampleLevel(sampleLinear_s, r1.yz, 0).x;
        r1.y = g_vDramaticHdrLutInfo1[0].x * r1.y;
      } else {
        if (8 == 0) r1.z = 0; else if (8+16 < 32) {         r1.z = (uint)g_vDramaticHdrLutInfo1[0].z << (32-(8 + 16)); r1.z = (uint)r1.z >> (32-8);        } else r1.z = (uint)g_vDramaticHdrLutInfo1[0].z >> 16;
        if (r1.z != 0) {
          r0.w = -r0.w * g_vDramaticHdrLutInfo1[1].x + g_vDramaticHdrLutInfo1[1].y;
          r2.w = cmp(r0.w >= 0);
          r3.x = cmp(1 >= r0.w);
          r2.w = r2.w ? r3.x : 0;
          r2.w = r2.w ? 1.000000 : 0;

          //r3.x = saturate(r0.w);
          r3.x = r0.w;

          r3.y = -1.44269502 * r3.x;
          r3.y = exp2(r3.y);
          r3.y = 1 + -r3.y;
          r4.xyzw = cmp((int4)r1.zzzz == int4(1,2,3,4));
          r1.z = r3.x * r3.x;
          r1.z = -1.44269502 * r1.z;
          r1.z = exp2(r1.z);
          r1.z = 1 + -r1.z;
          r0.w = r4.w ? r1.z : r0.w;
          r0.w = r4.z ? r3.y : r0.w;
          r0.w = r4.y ? r3.x : r0.w;
          r0.w = r4.x ? r2.w : r0.w;
          r1.y = g_vDramaticHdrLutInfo1[0].x * r0.w;
        } else {
          r1.y = g_vDramaticHdrLutInfo1[0].x;
        }
        r0.w = (uint)g_vDramaticHdrLutInfo1[0].z >> 24;
        if (r0.w != 0) {
          r1.x = r1.x * g_vDramaticHdrLutInfo1[1].z + g_vDramaticHdrLutInfo1[1].w;
          r1.z = cmp(r1.x >= 0);
          r2.w = cmp(1 >= r1.x);
          r1.z = r1.z ? r2.w : 0;
          r1.z = r1.z ? 1.000000 : 0;

          //r2.w = saturate(r1.x);
          r2.w = r1.x;

          r3.x = -1.44269502 * r2.w;
          r3.x = exp2(r3.x);
          r3.x = 1 + -r3.x;
          r4.xyzw = cmp((int4)r0.wwww == int4(1,2,3,4));
          r0.w = r2.w * r2.w;
          r0.w = -1.44269502 * r0.w;
          r0.w = exp2(r0.w);
          r0.w = 1 + -r0.w;
          r0.w = r4.w ? r0.w : r1.x;
          r0.w = r4.z ? r3.x : r0.w;
          r0.w = r4.y ? r2.w : r0.w;
          r0.w = r4.x ? r1.z : r0.w;
          r1.y = r1.y * r0.w;
        }
      }
      r0.w = -g_vDramaticHdrLutInfo1[0].x + r1.y;
      r0.w = g_vDramaticHdrLutInfo1[0].y * r0.w + g_vDramaticHdrLutInfo1[0].x;
    } else {
      r0.w = g_vDramaticHdrLutInfo1[0].x;
    }
    r0.xyz = g_tDramaticHdrLut1.SampleLevel(sampleLinear_s, r0.xyz, 0).xyz;
    r0.xyz = r0.xyz + -r2.xyz;
    r2.xyz = r0.www * r0.xyz + r2.xyz;
  }
  if (r1.w != 0) {
    // r0.xyz = saturate(r2.xyz);
    r0.xyz = r2.xyz;

    r0.xyz = log2(r0.xyz);
    r0.xyz = float3(0.454545468,0.454545468,0.454545468) * r0.xyz;
    r0.xyz = exp2(r0.xyz);
    r0.xyz = g_tLdrLut.SampleLevel(sampleLinear_s, r0.xyz, 0).xyz;
    r0.xyz = r0.xyz + -r2.xyz;
    r2.xyz = g_vCompositeInfo.yyy * r0.xyz + r2.xyz;
  }
  r0.x = cmp(g_vGammaCorrection.x != 1.000000);
  r0.yzw = log2(abs(r2.xyz));
  r0.yzw = g_vGammaCorrection.xxx * r0.yzw;
  r0.yzw = exp2(r0.yzw);
  r0.xyz = r0.xxx ? r0.yzw : r2.xyz;
  o0.xyz = g_vRadialBlurCenter.zzz * r0.xyz;
  o0.w = 1;

  o0.rgb = untonemapped;
  return;
}