#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.4.1 on Mon Sep  8 09:20:54 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[18];
}




// 3Dmigoto declarations
#define cmp -


/*
// Decompiled reference implementation. Keep this block for comparison with
// the readable implementation below; the equivalence tests cover its
// arithmetic stages and intentionally omit texture filtering.
void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.yz = -cb0[17].yz + v1.xy;
  r1.x = cb0[17].x * r0.y;
  r0.x = frac(r1.x);
  r1.x = r0.x / cb0[17].x;
  r0.w = -r1.x + r0.y;
  // r0.xyz = r0.xzw * cb0[17].www + float3(-0.386036009,-0.386036009,-0.386036009);
  r0.xyz = r0.xzw * cb0[17].www;

  r0.xyz = LutDecode(r0.xyz); //switch to PQ

  // arri decode start
  // r0.xyz = r0.xyz + float3(-0.386036009, -0.386036009, -0.386036009);
  // r0.xyz = float3(13.6054821, 13.6054821, 13.6054821) * r0.xyz;
  // r0.xyz = exp2(r0.xyz);
  // r0.xyz = float3(-0.0479959995, -0.0479959995, -0.0479959995) + r0.xyz;
  // r0.xyz = float3(0.179999992, 0.179999992, 0.179999992) * r0.xyz;
  // arri decode end

  //bt709 to ap0
  r1.x = dot(float3(0.439700991, 0.382977992, 0.177334994), r0.xyz);
  r1.y = dot(float3(0.0897922963, 0.813422978, 0.0967615992), r0.xyz);
  r1.z = dot(float3(0.0175439995, 0.111543998, 0.870703995), r0.xyz);

  r0.xyz = max(float3(0,0,0), r1.xyz);
  r0.xyz = min(float3(65504,65504,65504), r0.xyz);
  r1.xyz = r0.xyz * float3(0.5,0.5,0.5) + float3(1.525878e-05,1.525878e-05,1.525878e-05);
  r1.xyz = log2(r1.xyz);
  r1.xyz = float3(9.72000027,9.72000027,9.72000027) + r1.xyz;
  r1.xyz = float3(0.0570776239,0.0570776239,0.0570776239) * r1.xyz;
  r2.xyz = log2(r0.xyz);
  r0.xyz = cmp(r0.xyz < float3(3.05175708e-05,3.05175708e-05,3.05175708e-05));
  r2.xyz = float3(9.72000027,9.72000027,9.72000027) + r2.xyz;
  r2.xyz = float3(0.0570776239,0.0570776239,0.0570776239) * r2.xyz;
  r0.xyz = r0.xyz ? r1.xyz : r2.xyz;
  r0.xyz = r0.xyz * cb0[10].xyz + cb0[8].xyz;
  r1.xyz = log2(r0.xyz);
  r1.xyz = cb0[9].xyz * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = cmp(float3(0,0,0) < r0.xyz);
  r0.xyz = r2.xyz ? r1.xyz : r0.xyz;
  r0.w = cmp(r0.y >= r0.z);
  r0.w = r0.w ? 1.000000 : 0;
  r1.xy = r0.zy;
  r2.xy = -r1.xy + r0.yz;
  r1.zw = float2(-1,0.666666687);
  r2.zw = float2(1,-1);
  r1.xyzw = r0.wwww * r2.xywz + r1.xywz;
  r0.w = cmp(r0.x >= r1.x);
  r0.w = r0.w ? 1.000000 : 0;
  r2.z = r1.w;
  r1.w = r0.x;
  r2.xyw = r1.wyx;
  r2.xyzw = r2.xyzw + -r1.xyzw;
  r1.xyzw = r0.wwww * r2.xyzw + r1.xyzw;
  r0.w = min(r1.w, r1.y);
  r0.w = r1.x + -r0.w;
  r2.x = r0.w * 6 + 9.99999975e-05;
  r1.y = r1.w + -r1.y;
  r1.y = r1.y / r2.x;
  r1.y = r1.z + r1.y;
  r1.x = 9.99999975e-05 + r1.x;
  r2.z = r0.w / r1.x;
  r2.x = abs(r1.y);
  r2.yw = float2(0.25,0.25);
  r1.xyzw = t0.Sample(s0_s, r2.xy).yxzw;
  r2.xyzw = t0.Sample(s0_s, r2.zw).zxyw;
  r2.x = saturate(r2.x);
  r0.w = r2.x + r2.x;
  r1.x = saturate(r1.x);
  r1.x = r1.x + r1.x;
  r0.w = r1.x * r0.w;
  r1.x = dot(r0.xyz, float3(0.212599993,0.715200007,0.0722000003));
  r0.xyz = -r1.xxx + r0.xyz;
  r1.yw = float2(0.25,0.25);
  r2.xyzw = t0.Sample(s0_s, r1.xy).wxyz;
  r2.x = saturate(r2.x);
  r1.y = r2.x + r2.x;
  r0.w = r1.y * r0.w;
  r0.w = cb0[11].x * r0.w;
  r0.xyz = r0.www * r0.xyz + r1.xxx;
  r0.xyz = float3(-0.413588405,-0.413588405,-0.413588405) + r0.xyz;
  r0.xyz = r0.xyz * cb0[11].yyy + float3(0.413588405,0.413588405,0.413588405);
  r2.xyzw = cmp(r0.xxyy < float4(-0.301369876,1.46799636,-0.301369876,1.46799636));
  r0.xyw = r0.xyz * float3(17.5200005,17.5200005,17.5200005) + float3(-9.72000027,-9.72000027,-9.72000027);
  r1.xy = cmp(r0.zz < float2(-0.301369876,1.46799636));
  r0.xyz = exp2(r0.xyw);
  r2.yw = r2.yw ? r0.xy : float2(65504,65504);
  r0.xyw = float3(-1.52587891e-05,-1.52587891e-05,-1.52587891e-05) + r0.xyz;
  r0.z = r1.y ? r0.z : 65504;
  r0.xyw = r0.xyw + r0.xyw;
  r2.xy = r2.xz ? r0.xy : r2.yw;
  r2.z = r1.x ? r0.w : r0.z;
  r0.x = dot(float3(1.45143926,-0.236510754,-0.214928567), r2.xyz);
  r0.y = dot(float3(-0.0765537769,1.17622972,-0.0996759236), r2.xyz);
  r0.z = dot(float3(0.00831614807,-0.00603244966,0.997716308), r2.xyz);
  r2.x = dot(float3(0.390404999,0.549941003,0.00892631989), r0.xyz);
  r2.y = dot(float3(0.070841603,0.963172019,0.00135775004), r0.xyz);
  r2.z = dot(float3(0.0231081992,0.128021002,0.936245024), r0.xyz);
  r0.xyz = cb0[4].xyz * r2.xyz;
  r2.x = dot(float3(2.85846996,-1.62879002,-0.0248910002), r0.xyz);
  r2.y = dot(float3(-0.210181996,1.15820003,0.000324280991), r0.xyz);
  r2.z = dot(float3(-0.0418119989,-0.118169002,1.06867003), r0.xyz);
  r0.xyz = float3(1,1,1) + -cb0[5].xyz;
  r0.xyz = cb0[7].xyz * r0.xyz;
  r3.xyz = cb0[7].xyz * cb0[5].xyz;
  r0.xyz = r2.xyz * r0.xyz + r3.xyz;
  r2.xyz = log2(r0.xyz);
  r2.xyz = cb0[6].xyz * r2.xyz;
  r2.xyz = exp2(r2.xyz);
  r3.xyz = cmp(float3(0,0,0) < r0.xyz);
  r0.xyz = r3.xyz ? r2.xyz : r0.xyz;
  r0.xyw = max(float3(0,0,0), r0.yzx);
  r1.x = cmp(r0.x >= r0.y);
  r1.x = r1.x ? 1.000000 : 0;
  r2.xy = r0.yx;
  r3.xy = -r2.xy + r0.xy;
  r2.zw = float2(-1,0.666666687);
  r3.zw = float2(1,-1);
  r2.xyzw = r1.xxxx * r3.xyzw + r2.xyzw;
  r1.x = cmp(r0.w >= r2.x);
  r1.x = r1.x ? 1.000000 : 0;
  r0.xyz = r2.xyw;
  r2.xyw = r0.wyx;
  r2.xyzw = r2.xyzw + -r0.xyzw;
  r0.xyzw = r1.xxxx * r2.xyzw + r0.xyzw;
  r1.x = min(r0.w, r0.y);
  r1.x = -r1.x + r0.x;
  r1.y = r1.x * 6 + 9.99999975e-05;
  r0.y = r0.w + -r0.y;
  r0.y = r0.y / r1.y;
  r0.y = r0.z + r0.y;
  r1.z = cb0[10].w + abs(r0.y);
  r2.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r2.x = saturate(r2.x);
  r0.y = -0.5 + r2.x;
  r0.y = r1.z + r0.y;
  r0.z = cmp(1 < r0.y);
  r1.yz = float2(1,-1) + r0.yy;
  r0.z = r0.z ? r1.z : r0.y;
  r0.y = cmp(r0.y < 0);
  r0.y = r0.y ? r1.y : r0.z;
  r0.yzw = float3(1,0.666666687,0.333333343) + r0.yyy;
  r0.yzw = frac(r0.yzw);
  r0.yzw = r0.yzw * float3(6,6,6) + float3(-3,-3,-3);
  r0.yzw = saturate(float3(-1,-1,-1) + abs(r0.yzw));
  r0.yzw = float3(-1,-1,-1) + r0.yzw;
  r1.y = 9.99999975e-05 + r0.x;
  r1.x = r1.x / r1.y;
  r0.yzw = r1.xxx * r0.yzw + float3(1,1,1);
  r0.xyz = r0.xxx * r0.yzw;
  r1.x = dot(r0.xyz, cb0[12].xyz);
  r1.y = dot(r0.xyz, cb0[13].xyz);
  r1.z = dot(r0.xyz, cb0[14].xyz);

  float3 untonemappedap1 = r1.xyz;
  float3 untonemapped = renodx::color::bt709::from::AP1(r1.xyz);

  r0.y = dot(float3(0.695452213,0.140678704,0.163869068), r1.xyz);
  r0.z = dot(float3(0.0447945632,0.859671116,0.0955343172), r1.xyz);
  r0.w = dot(float3(-0.00552588282,0.00402521016,1.00150073), r1.xyz);
  r1.xyz = r0.wzy + -r0.zyw;
  r1.xy = r1.xy * r0.wz;
  r0.x = r1.x + r1.y;
  r0.x = r0.y * r1.z + r0.x;
  r0.x = sqrt(r0.x);
  r1.x = r0.w + r0.z;
  r1.x = r1.x + r0.y;
  r0.x = r0.x * 1.75 + r1.x;
  r1.x = 0.333333343 * r0.x;
  r1.x = 0.0799999982 / r1.x;
  r1.y = min(r0.z, r0.w);
  r1.y = min(r1.y, r0.y);
  r1.z = max(r0.z, r0.w);
  r1.z = max(r1.z, r0.y);
  r1.yzw = max(float3(1.00000001e-10,1.00000001e-10,0.00999999978), r1.yzz);
  r1.y = r1.z + -r1.y;
  r1.y = r1.y / r1.w;
  r1.xz = float2(-0.5,-0.400000006) + r1.xy;
  r1.w = cmp(0 < r1.z);
  r2.x = cmp(r1.z < 0);
  r1.z = 2.5 * r1.z;
  r1.z = 1 + -abs(r1.z);
  r1.z = max(0, r1.z);
  r1.z = -r1.z * r1.z + 1;
  r1.w = (int)-r1.w + (int)r2.x;
  r1.w = (int)r1.w;
  r1.z = r1.w * r1.z + 1;
  r1.z = 0.0250000004 * r1.z;
  r1.x = r1.z * r1.x;
  r1.w = cmp(r0.x >= 0.479999989);
  r0.x = cmp(0.159999996 >= r0.x);
  r1.x = r1.w ? 0 : r1.x;
  r0.x = r0.x ? r1.z : r1.x;
  r0.x = 1 + r0.x;
  r2.yzw = r0.yzw * r0.xxx;
  r0.y = -r0.y * r0.x + 0.0299999993;
  r0.z = r0.z * r0.x + -r2.w;
  r0.z = 1.73205078 * r0.z;
  r1.x = r2.y * 2 + -r2.z;
  r0.x = -r0.w * r0.x + r1.x;
  r0.w = max(abs(r0.z), abs(r0.x));
  r0.w = 1 / r0.w;
  r1.x = min(abs(r0.z), abs(r0.x));
  r0.w = r1.x * r0.w;
  r1.x = r0.w * r0.w;
  r1.z = r1.x * 0.0208350997 + -0.0851330012;
  r1.z = r1.x * r1.z + 0.180141002;
  r1.z = r1.x * r1.z + -0.330299497;
  r1.x = r1.x * r1.z + 0.999866009;
  r1.z = r1.x * r0.w;
  r1.z = r1.z * -2 + 1.57079637;
  r1.w = cmp(abs(r0.x) < abs(r0.z));
  r1.z = r1.w ? r1.z : 0;
  r0.w = r0.w * r1.x + r1.z;
  r1.x = cmp(r0.x < -r0.x);
  r1.x = r1.x ? -3.141593 : 0;
  r0.w = r1.x + r0.w;
  r1.x = min(r0.z, r0.x);
  r0.x = max(r0.z, r0.x);
  r0.x = cmp(r0.x >= -r0.x);
  r0.z = cmp(r1.x < -r1.x);
  r0.x = r0.x ? r0.z : 0;
  r0.x = r0.x ? -r0.w : r0.w;
  r0.x = 57.2957802 * r0.x;
  r0.zw = cmp(r2.zw == r2.yz);
  r0.z = r0.w ? r0.z : 0;
  r0.x = r0.z ? 0 : r0.x;
  r0.z = cmp(r0.x < 0);
  r0.w = 360 + r0.x;
  r0.x = r0.z ? r0.w : r0.x;
  r0.z = cmp(180 < r0.x);
  r1.xz = float2(360,-360) + r0.xx;
  r0.z = r0.z ? r1.z : r0.x;
  r0.x = cmp(r0.x < -180);
  r0.x = r0.x ? r1.x : r0.z;
  r0.x = 0.0148148146 * r0.x;
  r0.x = 1 + -abs(r0.x);
  r0.x = max(0, r0.x);
  r0.z = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r0.z * r0.x;
  r0.x = r0.x * r0.x;
  r0.x = r0.x * r1.y;
  r0.x = r0.x * r0.y;
  r2.x = r0.x * 0.180000007 + r2.y;
  r0.x = dot(float3(1.45143926,-0.236510754,-0.214928567), r2.xzw);
  r0.y = dot(float3(-0.0765537769,1.17622972,-0.0996759236), r2.xzw);
  r0.z = dot(float3(0.00831614807,-0.00603244966,0.997716308), r2.xzw);
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = dot(r0.xyz, float3(0.272228986,0.674081981,0.0536894985));
  r0.xyz = r0.xyz + -r0.www;
  r0.xyz = r0.xyz * float3(0.959999979,0.959999979,0.959999979) + r0.www;
  r1.xyz = r0.xyz * float3(278.508514,278.508514,278.508514) + float3(10.7771997,10.7771997,10.7771997);
  r1.xyz = r1.xyz * r0.xyz;
  r2.xyz = r0.xyz * float3(293.604492,293.604492,293.604492) + float3(88.7121964,88.7121964,88.7121964);
  r0.xyz = r0.xyz * r2.xyz + float3(80.6889038,80.6889038,80.6889038);
  r0.xyz = r1.xyz / r0.xyz;
  r1.x = dot(float3(0.662454188,0.134004205,0.156187683), r0.xyz);
  r1.z = dot(float3(-0.00557464967,0.0040607336,1.01033914), r0.xyz);
  r1.y = dot(float3(0.272228718,0.674081743,0.0536895171), r0.xyz);
  r0.x = dot(r1.xyz, float3(1,1,1));
  r0.x = max(9.99999975e-05, r0.x);
  r0.xy = r1.xy / r0.xx;
  r0.w = max(0, r1.y);
  r0.w = min(65504, r0.w);
  r0.w = log2(r0.w);
  r0.w = 0.981100023 * r0.w;
  r1.y = exp2(r0.w);
  r0.w = 1 + -r0.x;
  r0.z = r0.w + -r0.y;
  r0.y = max(9.99999975e-05, r0.y);
  r0.y = r1.y / r0.y;
  r1.xz = r0.xz * r0.yy;
  r0.x = dot(float3(1.6410234,-0.324803293,-0.236424699), r1.xyz);
  r0.y = dot(float3(-0.663662851,1.61533165,0.0167563483), r1.xyz);
  r0.z = dot(float3(0.0117218941,-0.00828444213,0.988394856), r1.xyz);
  r0.w = dot(r0.xyz, float3(0.272228986,0.674081981,0.0536894985));
  r0.xyz = r0.xyz + -r0.www;
  r0.xyz = r0.xyz * float3(0.930000007,0.930000007,0.930000007) + r0.www;
  r1.x = dot(float3(0.662454188,0.134004205,0.156187683), r0.xyz);
  r1.y = dot(float3(0.272228718,0.674081743,0.0536895171), r0.xyz);
  r1.z = dot(float3(-0.00557464967,0.0040607336,1.01033914), r0.xyz);
  r0.x = dot(float3(0.987223983,-0.00611326983,0.0159533005), r1.xyz);
  r0.y = dot(float3(-0.00759836007,1.00186002,0.00533019984), r1.xyz);
  r0.z = dot(float3(0.00307257008,-0.00509594986,1.08168006), r1.xyz);
  r1.x = dot(float3(3.2409699,-1.5373832,-0.498610765), r0.xyz);
  r1.y = dot(float3(-0.969243646,1.8759675,0.0415550582), r0.xyz);
  r1.z = dot(float3(0.0556300804,-0.203976959,1.05697155), r0.xyz);

  float3 tonemapped_bt709 = r1.rgb;

  r0.xyz = float3(0.00390625,0.00390625,0.00390625) + r1.xyz;
  r0.w = 0.75;
  r1.xyzw = t0.Sample(s0_s, r0.xw).wxyz;
  r1.x = saturate(r1.x);
  r2.xyzw = t0.Sample(s0_s, r0.yw).xyzw;
  r0.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
  r1.z = saturate(r0.w);
  r1.y = saturate(r2.w);
  r0.xyz = float3(0.00390625,0.00390625,0.00390625) + r1.xyz;
  r0.w = 0.75;
  r1.xyzw = t0.Sample(s0_s, r0.xw).xyzw;
  o0.x = saturate(r1.x);
  r1.xyzw = t0.Sample(s0_s, r0.yw).xyzw;
  r0.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
  o0.z = saturate(r0.z);
  o0.y = saturate(r1.y);
  o0.w = 1;
  return;
}
  */

  static const float3 ACESCC_MIDDLE_GRAY = float3(0.413588405, 0.413588405, 0.413588405);
  static const float3 BT709_LUMA = float3(0.212599993, 0.715200007, 0.0722000003);

  float3 MultiplyColorMatrix(float3 color, float3 row0, float3 row1, float3 row2) {
    return float3(dot(row0, color), dot(row1, color), dot(row2, color));
  }

  float3 BuildLutCoordinate(float2 uv, float4 layout) {
    float2 local_uv = uv - layout.yz;
    float fractional_slice = frac(layout.x * local_uv.x);
    float slice_origin = local_uv.x - fractional_slice / layout.x;
    return float3(fractional_slice, local_uv.y, slice_origin) * layout.www;
  }

  float EncodeAcesCcChannel(float color) {
    const float low_value = log2(color * 0.5 + 1.525878e-05);
    const float high_value = log2(color);
    const float low_encoded = (low_value + 9.72000027) * 0.0570776239;
    const float high_encoded = (high_value + 9.72000027) * 0.0570776239;
    return color < 3.05175708e-05 ? low_encoded : high_encoded;
  }

  float3 EncodeAcesCc(float3 color) {
    return float3(
        EncodeAcesCcChannel(color.x),
        EncodeAcesCcChannel(color.y),
        EncodeAcesCcChannel(color.z));
  }

  float DecodeAcesCcChannel(float encoded) {
    const float decoded_value = exp2(encoded * 17.5200005 - 9.72000027);
    if (encoded < -0.301369876) {
      return (decoded_value - 1.52587891e-05) * 2;
    }
    if (encoded < 1.46799636) {
      return decoded_value;
    }
    return 65504;
  }

  float3 DecodeAcesCc(float3 encoded) {
    return float3(
        DecodeAcesCcChannel(encoded.x),
        DecodeAcesCcChannel(encoded.y),
        DecodeAcesCcChannel(encoded.z));
  }

  float3 ApplyLogDomainGrade(float3 color) {
    color = color * cb0[10].xyz + cb0[8].xyz;
    float3 graded = exp2(cb0[9].xyz * log2(color));
    return float3(
        color.x > 0 ? graded.x : color.x,
        color.y > 0 ? graded.y : color.y,
        color.z > 0 ? graded.z : color.z);
  }

  float3 ApplySampledSaturation(float3 color) {
    // This is the decompiled RGB-to-HSV swizzle expressed as named values.
    // The original starts with (B, G, -1, 2/3), then adds (G-B, B-G, 1, -1)
    // when green is the larger channel.
    const float3 hsv_input = color;
    float4 hsv = float4(hsv_input.z, hsv_input.y, -1, 0.666666687);
    // The decompiled instruction uses r2.xywz + r1.xywz here. This puts
    // (2/3, -2/3) in the z/w delta, not the ordinary (1, -1) hue delta.
    const float4 green_branch = float4(
      hsv_input.y - hsv_input.z,
      hsv_input.z - hsv_input.y,
      0.666666687,
      -0.666666687);
    hsv += (hsv_input.y >= hsv_input.z ? 1 : 0) * green_branch;

    const float red_is_larger = hsv_input.x >= hsv.x ? 1 : 0;
    const float4 before_red_selection = float4(hsv.x, hsv.y, hsv.w, hsv_input.x);
    const float4 red_branch = float4(
      hsv_input.x,
      before_red_selection.y,
      hsv.z,
      before_red_selection.x);
    hsv = before_red_selection + red_is_larger * (red_branch - before_red_selection);

    const float chroma = hsv.x - min(hsv.w, hsv.y);
    const float hue = abs(hsv.z + (hsv.w - hsv.y) / (chroma * 6 + 1.0e-04));
    const float saturation = chroma / (hsv.x + 1.0e-04);

    const float hue_curve = saturate(t0.Sample(s0_s, float2(hue, 0.25)).y) * 2;
    const float chroma_curve = saturate(t0.Sample(s0_s, float2(saturation, 0.25)).z) * 2;
    const float luminance = dot(color, BT709_LUMA);
    const float luminance_curve = saturate(t0.Sample(s0_s, float2(luminance, 0.25)).w) * 2;
    const float chroma_strength = cb0[11].x * hue_curve * chroma_curve * luminance_curve;

    return float3(luminance, luminance, luminance)
        + (color - float3(luminance, luminance, luminance)) * chroma_strength;
  }

  float3 ApplyAcesCcContrast(float3 color) {
    return (color - ACESCC_MIDDLE_GRAY) * cb0[11].yyy + ACESCC_MIDDLE_GRAY;
  }

  float3 ApplyWhiteBalance(float3 color) {
    color = MultiplyColorMatrix(
        color,
        float3(0.390404999, 0.549941003, 0.00892631989),
        float3(0.070841603, 0.963172019, 0.00135775004),
        float3(0.0231081992, 0.128021002, 0.936245024));
    color *= cb0[4].xyz;
    return MultiplyColorMatrix(
        color,
        float3(2.85846996, -1.62879002, -0.0248910002),
        float3(-0.210181996, 1.15820003, 0.000324280991),
        float3(-0.0418119989, -0.118169002, 1.06867003));
  }

  float3 ApplyLiftGammaGain(float3 color) {
    const float3 gain_factor = cb0[7].xyz * (1 - cb0[5].xyz);
    const float3 gain_lift = cb0[7].xyz * cb0[5].xyz;
    const float3 adjusted = color * gain_factor + gain_lift;
    const float3 gamma_adjusted = exp2(cb0[6].xyz * log2(adjusted));
    return float3(
        adjusted.x > 0 ? gamma_adjusted.x : adjusted.x,
        adjusted.y > 0 ? gamma_adjusted.y : adjusted.y,
        adjusted.z > 0 ? gamma_adjusted.z : adjusted.z);
  }

  float3 ApplyHueCurve(float3 color) {
    const float3 non_negative = max(color.yzx, float3(0, 0, 0));
    float4 hsv = float4(non_negative.y, non_negative.x, -1, 0.666666687);
    // This stage uses the ordinary xyzw branch; its unusual input swizzle is
    // already represented by non_negative = max(color.yzx, 0).
    const float4 green_branch = float4(
      non_negative.x - non_negative.y,
      non_negative.y - non_negative.x,
      1,
      -1);
    hsv += (non_negative.x >= non_negative.y ? 1 : 0) * green_branch;

    const float red_is_larger = non_negative.z >= hsv.x ? 1 : 0;
    const float4 before_red_selection = float4(hsv.x, hsv.y, hsv.w, non_negative.z);
    const float4 red_branch = float4(
      non_negative.z,
      before_red_selection.y,
      hsv.z,
      before_red_selection.x);
    hsv = before_red_selection + red_is_larger * (red_branch - before_red_selection);

    const float chroma = hsv.x - min(hsv.w, hsv.y);
    const float hue = hsv.z + (hsv.w - hsv.y) / (chroma * 6 + 1.0e-04);
    const float saturation = chroma / (hsv.x + 1.0e-04);
    const float hue_position = cb0[10].w + abs(hue);
    float adjusted_hue = hue_position - 0.5 + saturate(
        t0.Sample(s0_s, float2(hue_position, 0.25)).x);
    if (adjusted_hue > 1) adjusted_hue -= 1;
    if (adjusted_hue < 0) adjusted_hue += 1;

    float3 hue_channels = frac(adjusted_hue + float3(1, 0.666666687, 0.333333343));
    hue_channels = saturate(-1 + abs(hue_channels * 6 - 3)) - 1;
    hue_channels = saturation * hue_channels + 1;
    return hsv.x * hue_channels;
  }

  float3 ApplyChannelMix(float3 color) {
    return float3(
        dot(color, cb0[12].xyz),
        dot(color, cb0[13].xyz),
        dot(color, cb0[14].xyz));
  }

  float ApplyMasterCurveSample(float value) {
    return RENODX_TONE_MAP_TYPE == 0.f ? saturate(value) : value;
  }

  float3 ApplyAcesDisplayTransform(float3 ap1_color) {
    float3 working = MultiplyColorMatrix(
        ap1_color,
        float3(0.695452213, 0.140678704, 0.163869068),
        float3(0.0447945632, 0.859671116, 0.0955343172),
        float3(-0.00552588282, 0.00402521016, 1.00150073));

    const float3 differences = float3(
      working.z - working.y,
      working.y - working.x,
      working.x - working.z);
    float glow_metric = differences.x * working.z + differences.y * working.y
              + differences.z * working.x;
    glow_metric = sqrt(glow_metric) * 1.75 + dot(working, float3(1, 1, 1));

    const float hue_scale = 0.08 / (glow_metric / 3);
    const float minimum = max(1.0e-10, min(working.x, min(working.y, working.z)));
    const float maximum = max(1.0e-10, max(working.x, max(working.y, working.z)));
    const float chroma = (maximum - minimum) / max(maximum, 0.01);
    float hue_adjustment = hue_scale - 0.5;
    const float chroma_offset = chroma - 0.4;
    const float chroma_sign = chroma_offset > 0 ? 1 : chroma_offset < 0 ? -1 : 0;
    const float chroma_shape = 1 - pow(max(0, 1 - abs(2.5 * chroma_offset)), 2);
    const float chroma_scale = 0.025 * (1 - chroma_sign * chroma_shape);
    hue_adjustment *= chroma_scale;
    if (glow_metric >= 0.48) hue_adjustment = 0;
    if (glow_metric <= 0.16) hue_adjustment = chroma_scale;

    const float scale = 1 + hue_adjustment;
    const float3 scaled = working * scale;
    const float glow_y = 0.03 - scaled.x;
    float hue_x = (2 * scaled.x - scaled.y) - scaled.z;
    float hue_z = (scaled.y - scaled.z) * 1.73205078;

    const float hue_max = max(abs(hue_z), abs(hue_x));
    const float hue_min = min(abs(hue_z), abs(hue_x));
    const float hue_ratio = hue_min / hue_max;
    const float hue_ratio_squared = hue_ratio * hue_ratio;
    float atan_approx = hue_ratio_squared * 0.0208350997 - 0.0851330012;
    atan_approx = hue_ratio_squared * atan_approx + 0.180141002;
    atan_approx = hue_ratio_squared * atan_approx - 0.330299497;
    atan_approx = hue_ratio_squared * atan_approx + 0.999866009;
    float hue_angle = hue_ratio * atan_approx;
    if (abs(hue_x) < abs(hue_z)) hue_angle = 1.57079637 - hue_angle;
    if (hue_x < 0) hue_angle -= 3.141593;
    if ((max(hue_z, hue_x) >= 0) && (min(hue_z, hue_x) < 0)) hue_angle = -hue_angle;
    hue_angle *= 57.2957802;
    if (scaled.x == scaled.y && scaled.y == scaled.z) hue_angle = 0;
    if (hue_angle < 0) hue_angle += 360;
    if (hue_angle > 180) hue_angle -= 360;
    if (hue_angle < -180) hue_angle += 360;

    float hue_weight = max(0, 1 - abs(hue_angle * 0.0148148146));
    hue_weight = hue_weight * hue_weight * (3 - 2 * hue_weight);
    hue_weight = hue_weight * hue_weight * chroma * glow_y;
    const float3 glow_color = float3(scaled.x + hue_weight * 0.18, scaled.y, scaled.z);

    float3 color = MultiplyColorMatrix(
        float3(glow_color.x, glow_color.y, glow_color.z),
        float3(1.45143926, -0.236510754, -0.214928567),
        float3(-0.0765537769, 1.17622972, -0.0996759236),
        float3(0.00831614807, -0.00603244966, 0.997716308));
    color = max(color, float3(0, 0, 0));
    const float luminance = dot(color, float3(0.272228986, 0.674081981, 0.0536894985));
      color = (color - float3(luminance, luminance, luminance)) * 0.96
        + float3(luminance, luminance, luminance);

    const float3 numerator = color * (color * 278.508514 + 10.7771997);
    const float3 denominator = color * (color * 293.604492 + 88.7121964) + 80.6889038;
    color = numerator / denominator;

    float3 ap1 = float3(
        dot(float3(0.662454188, 0.134004205, 0.156187683), color),
        dot(float3(0.272228718, 0.674081743, 0.0536895171), color),
        dot(float3(-0.00557464967, 0.0040607336, 1.01033914), color));
    const float sum = max(1.0e-04, dot(ap1, float3(1, 1, 1)));
    const float2 chromaticity = ap1.xy / sum;
    const float luminance_power = exp2(
        0.981100023 * log2(min(65504, max(0, ap1.y))));
    const float ratio = luminance_power / max(1.0e-04, chromaticity.y);
    const float3 adapted = float3(chromaticity.x * ratio, ap1.y, (1 - chromaticity.x - chromaticity.y) * ratio);

    color = MultiplyColorMatrix(
        adapted,
        float3(1.6410234, -0.324803293, -0.236424699),
        float3(-0.663662851, 1.61533165, 0.0167563483),
        float3(0.0117218941, -0.00828444213, 0.988394856));
    const float adapted_luminance = dot(color, float3(0.272228986, 0.674081981, 0.0536894985));
    color = (color - adapted_luminance) * 0.93 + adapted_luminance;
    color = MultiplyColorMatrix(
      color,
      float3(0.662454188, 0.134004205, 0.156187683),
      float3(0.272228718, 0.674081743, 0.0536895171),
      float3(-0.00557464967, 0.0040607336, 1.01033914));
    color = MultiplyColorMatrix(
        color,
        float3(0.987223983, -0.00611326983, 0.0159533005),
        float3(-0.00759836007, 1.00186002, 0.00533019984),
        float3(0.00307257008, -0.00509594986, 1.08168006));
    return MultiplyColorMatrix(
        color,
        float3(3.2409699, -1.5373832, -0.498610765),
        float3(-0.969243646, 1.8759675, 0.0415550582),
        float3(0.0556300804, -0.203976959, 1.05697155));
  }

  void main(
      float4 position : SV_POSITION0,
      float2 uv : TEXCOORD0,
      float2 auxiliary_uv : TEXCOORD1,
      out float4 output_color : SV_Target0) {
    float3 lut_color = BuildLutCoordinate(uv, cb0[17]);
    lut_color = LutDecode(lut_color);
    lut_color = MultiplyColorMatrix(
        lut_color,
        float3(0.439700991, 0.382977992, 0.177334994),
        float3(0.0897922963, 0.813422978, 0.0967615992),
        float3(0.0175439995, 0.111543998, 0.870703995));
    lut_color = max(0, min(65504, lut_color));
    lut_color = EncodeAcesCc(lut_color);
    lut_color = ApplyLogDomainGrade(lut_color);
    lut_color = ApplySampledSaturation(lut_color);
    lut_color = ApplyAcesCcContrast(lut_color);
    lut_color = DecodeAcesCc(lut_color);
    lut_color = MultiplyColorMatrix(
        lut_color,
        float3(1.45143926, -0.236510754, -0.214928567),
        float3(-0.0765537769, 1.17622972, -0.0996759236),
        float3(0.00831614807, -0.00603244966, 0.997716308));
    lut_color = ApplyWhiteBalance(lut_color);
    lut_color = ApplyLiftGammaGain(lut_color);
    lut_color = ApplyHueCurve(lut_color);
    lut_color = ApplyChannelMix(lut_color);

    float3 master_curve_input;
    float master_curve_scale = 1.f;
    float gamut_compression_scale = 1.f;
    if (RENODX_TONE_MAP_TYPE == 0.f) {
      master_curve_input = ApplyAcesDisplayTransform(lut_color);
    } else {
      float3 working_bt709 = renodx::color::bt709::from::AP1(lut_color);
      const float grayscale = renodx::color::y::from::BT709(working_bt709);
      gamut_compression_scale = renodx::color::correct::ComputeGamutCompressionScale(
          working_bt709,
          grayscale);
      working_bt709 = renodx::color::correct::GamutCompress(
          working_bt709,
          grayscale,
          gamut_compression_scale);
      master_curve_scale = renodx::tonemap::neutwo::ComputeMaxChannelScale(working_bt709);
      master_curve_input = working_bt709 * master_curve_scale;
    }

    float3 master_coordinates = master_curve_input + 0.00390625;
    float3 master_curves = float3(
        ApplyMasterCurveSample(t0.Sample(s0_s, float2(master_coordinates.x, 0.75)).w),
        ApplyMasterCurveSample(t0.Sample(s0_s, float2(master_coordinates.y, 0.75)).w),
        ApplyMasterCurveSample(t0.Sample(s0_s, float2(master_coordinates.z, 0.75)).w));
    float3 channel_coordinates = master_curves + 0.00390625;
    float3 graded_curve_output = float3(
        ApplyMasterCurveSample(t0.Sample(s0_s, float2(channel_coordinates.x, 0.75)).x),
        ApplyMasterCurveSample(t0.Sample(s0_s, float2(channel_coordinates.y, 0.75)).y),
        ApplyMasterCurveSample(t0.Sample(s0_s, float2(channel_coordinates.z, 0.75)).z));

    if (RENODX_TONE_MAP_TYPE != 0.f) {
      graded_curve_output /= master_curve_scale;
      graded_curve_output = renodx::color::correct::GamutDecompress(
          graded_curve_output,
          gamut_compression_scale);
    }

    output_color = float4(graded_curve_output, 1);
  }