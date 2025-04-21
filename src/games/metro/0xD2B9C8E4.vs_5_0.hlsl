// ---- Created with 3Dmigoto v1.3.16 on Tue Mar 25 18:54:27 2025

cbuffer cb_main_matrices0 : register(b0)
{
  row_major float3x4 m_W : packoffset(c0);
  row_major float3x4 m_iW : packoffset(c3);
  row_major float3x4 m_WV : packoffset(c6);
  row_major float4x4 m_WVP : packoffset(c9);
}

cbuffer cb_main_matrices1 : register(b1)
{
  row_major float3x4 m_V : packoffset(c0);
  row_major float3x4 m_iV : packoffset(c3);
  row_major float4x4 m_P : packoffset(c6);
  row_major float4x4 m_iP : packoffset(c10);
  row_major float4x4 m_VP : packoffset(c14);
  row_major float4x4 m_iVP : packoffset(c18);
}

cbuffer cb_mblur : register(b7)
{
  row_major float4x4 mblur_current : packoffset(c0);
  row_major float4x4 mblur_previous : packoffset(c4);
  float4 mblur_blur : packoffset(c8);
}

cbuffer cb_bones : register(b8)
{
  int4 sbones_istep : packoffset(c0) = {4,4,4,4};
  float4 sbones_array[240] : packoffset(c1);
}

cbuffer cb_bones_prev : register(b13)
{
  row_major float3x4 prev_xform : packoffset(c0);
  float4 sbones_array_prev[240] : packoffset(c3);
}



// 3Dmigoto declarations
#define cmp -


void main(
  int4 v0 : POSITION0,
  float4 v1 : NORMAL0,
  float4 v2 : TANGENT0,
  float4 v3 : BINORMAL0,
  uint4 v4 : BONES0,
  float4 v5 : WEIGHTS0,
  int2 v6 : TEXCOORD0,
  out float4 o0 : SV_Position0,
  out float4 o1 : TEXCOORD0,
  out float3 o2 : TEXCOORD1)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = (int3)v0.xyz;
  r0.w = v4.z;
  r1.xyzw = sbones_array[r0.w].xyzw * v5.zzzz;
  r2.xy = (int2)v4.zz + int2(1,2);
  r3.xyzw = sbones_array[r2.x].xyzw * v5.zzzz;
  r4.xyzw = sbones_array[r2.y].xyzw * v5.zzzz;
  r2.z = cmp(0 < v5.y);
  if (r2.z != 0) {
    r2.w = v4.y;
    r5.xyzw = v5.yyyy * sbones_array[r2.w].xyzw + r1.xyzw;
    r6.xy = (int2)v4.yy + int2(1,2);
    r7.xyzw = v5.yyyy * sbones_array[r6.x].xyzw + r3.xyzw;
    r6.xyzw = v5.yyyy * sbones_array[r6.y].xyzw + r4.xyzw;
    r2.w = cmp(0 < v5.x);
    if (r2.w != 0) {
      r2.w = v4.x;
      r8.xyzw = v5.xxxx * sbones_array[r2.w].xyzw + r5.xyzw;
      r9.xyzw = (int4)v4.xxww + int4(1,2,1,2);
      r10.xyzw = v5.xxxx * sbones_array[r9.x].xyzw + r7.xyzw;
      r11.xyzw = v5.xxxx * sbones_array[r9.y].xyzw + r6.xyzw;
      r2.w = v4.w;
      r5.xyzw = v5.wwww * sbones_array[r2.w].xyzw + r8.xyzw;
      r7.xyzw = v5.wwww * sbones_array[r9.z].xyzw + r10.xyzw;
      r6.xyzw = v5.wwww * sbones_array[r9.w].xyzw + r11.xyzw;
    }
  } else {
    r5.xyzw = r1.xyzw;
    r7.xyzw = r3.xyzw;
    r6.xyzw = r4.xyzw;
  }
  r8.xyz = float3(0.000366210938,0.000366210938,0.000366210938) * r0.xyz;
  r8.w = 1;
  r5.x = dot(r5.xyzw, r8.xyzw);
  r5.y = dot(r7.xyzw, r8.xyzw);
  r5.z = dot(r6.xyzw, r8.xyzw);
  r0.xyzw = sbones_array_prev[r0.w].xyzw * v5.zzzz;
  r6.xyzw = sbones_array_prev[r2.x].xyzw * v5.zzzz;
  r7.xyzw = sbones_array_prev[r2.y].xyzw * v5.zzzz;
  if (r2.z != 0) {
    r1.w = v4.y;
    r0.xyzw = v5.yyyy * sbones_array_prev[r1.w].xyzw + r0.xyzw;
    r2.xy = (int2)v4.yy + int2(1,2);
    r6.xyzw = v5.yyyy * sbones_array_prev[r2.x].xyzw + r6.xyzw;
    r7.xyzw = v5.yyyy * sbones_array_prev[r2.y].xyzw + r7.xyzw;
    r1.w = cmp(0 < v5.x);
    if (r1.w != 0) {
      r1.w = v4.x;
      r9.xyzw = v5.xxxx * sbones_array_prev[r1.w].xyzw + r0.xyzw;
      r10.xyzw = (int4)v4.xxww + int4(1,2,1,2);
      r11.xyzw = v5.xxxx * sbones_array_prev[r10.x].xyzw + r6.xyzw;
      r12.xyzw = v5.xxxx * sbones_array_prev[r10.y].xyzw + r7.xyzw;
      r1.w = v4.w;
      r0.xyzw = v5.wwww * sbones_array_prev[r1.w].xyzw + r9.xyzw;
      r6.xyzw = v5.wwww * sbones_array_prev[r10.z].xyzw + r11.xyzw;
      r7.xyzw = v5.wwww * sbones_array_prev[r10.w].xyzw + r12.xyzw;
    }
  }
  r0.x = dot(r0.xyzw, r8.xyzw);
  r0.y = dot(r6.xyzw, r8.xyzw);
  r0.z = dot(r7.xyzw, r8.xyzw);
  if (r2.z != 0) {
    r1.w = v4.y;
    r1.xyz = v5.yyy * sbones_array[r1.w].xyz + r1.xyz;
    r2.xy = (int2)v4.yy + int2(1,2);
    r3.xyz = v5.yyy * sbones_array[r2.x].xyz + r3.xyz;
    r4.xyz = v5.yyy * sbones_array[r2.y].xyz + r4.xyz;
    r1.w = cmp(0 < v5.x);
    if (r1.w != 0) {
      r1.w = v4.x;
      r2.xyz = v5.xxx * sbones_array[r1.w].xyz + r1.xyz;
      r6.xyzw = (int4)v4.xxww + int4(1,2,1,2);
      r7.xyz = v5.xxx * sbones_array[r6.x].xyz + r3.xyz;
      r8.xyz = v5.xxx * sbones_array[r6.y].xyz + r4.xyz;
      r1.w = v4.w;
      r1.xyz = v5.www * sbones_array[r1.w].xyz + r2.xyz;
      r3.xyz = v5.www * sbones_array[r6.z].xyz + r7.xyz;
      r4.xyz = v5.www * sbones_array[r6.w].xyz + r8.xyz;
    }
  }
  r2.xyz = v1.zyx * float3(2,2,2) + float3(-1,-1,-1);
  r1.x = dot(r1.xyz, r2.xyz);
  r1.y = dot(r3.xyz, r2.xyz);
  r1.z = dot(r4.xyz, r2.xyz);
  r5.w = 1;
  r2.x = dot(m_W._m00_m01_m02_m03, r5.xyzw);
  r2.y = dot(m_W._m10_m11_m12_m13, r5.xyzw);
  r2.z = dot(m_W._m20_m21_m22_m23, r5.xyzw);
  r2.w = 1;
  r3.x = dot(m_VP._m00_m01_m02_m03, r2.xyzw);
  r3.y = dot(m_VP._m10_m11_m12_m13, r2.xyzw);
  r1.w = dot(m_VP._m30_m31_m32_m33, r2.xyzw);
  r0.w = 1;
  r4.x = dot(prev_xform._m00_m01_m02_m03, r0.xyzw);
  r4.y = dot(prev_xform._m10_m11_m12_m13, r0.xyzw);
  r4.z = dot(prev_xform._m20_m21_m22_m23, r0.xyzw);
  r4.w = 1;
  r0.x = dot(mblur_previous._m00_m01_m02_m03, r4.xyzw);
  r0.y = dot(mblur_previous._m10_m11_m12_m13, r4.xyzw);
  r0.z = dot(mblur_previous._m30_m31_m32_m33, r4.xyzw);
  r5.x = dot(m_W._m00_m01_m02, r1.xyz);
  r5.y = dot(m_W._m10_m11_m12, r1.xyz);
  r5.z = dot(m_W._m20_m21_m22, r1.xyz);
  r0.w = dot(r5.xyz, r5.xyz);
  r0.w = rsqrt(r0.w);
  r1.xyz = r5.xyz * r0.www;
  r4.xyz = -r4.xyz + r2.xyz;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = sqrt(r0.w);
  r0.w = 9.99999975e-006 + r0.w;
  r5.xyz = r4.xyz / r0.www;
  r0.w = dot(r5.xyz, r1.xyz);
  r0.w = max(-1, r0.w);
  r0.w = min(0, r0.w);
  r0.w = 0.5 * r0.w;
  r1.xyz = r4.xyz * r0.www;
  r2.xyz = r4.xyz * r0.www + r2.xyz;
  r0.w = dot(r1.xyz, r1.xyz);
  r0.w = sqrt(r0.w);
  r0.w = min(1, r0.w);
  o1.w = 1 + -r0.w;
  r2.w = 1;
  o2.x = dot(m_V._m00_m01_m02_m03, r2.xyzw);
  o2.y = dot(m_V._m10_m11_m12_m13, r2.xyzw);
  r0.w = dot(m_V._m20_m21_m22_m23, r2.xyzw);
  r1.x = 0.5 * r0.w;
  r1.x = r1.x * r1.x;
  r1.x = min(1, r1.x);
  r1.yz = r3.xy / r1.ww;
  r0.xy = r0.xy / r0.zz;
  r0.xy = r1.yz + -r0.xy;
  r0.xy = mblur_blur.xy * r0.xy;
  r0.xy = r0.xy * r1.xx;
  o1.xy = float2(0.125,0.125) * r0.xy;
  o0.x = dot(m_VP._m00_m01_m02_m03, r2.xyzw);
  o0.y = dot(m_VP._m10_m11_m12_m13, r2.xyzw);
  r0.x = dot(m_VP._m20_m21_m22_m23, r2.xyzw);
  o0.w = dot(m_VP._m30_m31_m32_m33, r2.xyzw);
  o0.z = -0.00100000005 + r0.x;
  o1.z = r0.w;
  o2.z = r0.w;
  return;
}