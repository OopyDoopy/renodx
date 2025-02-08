// ---- Created with 3Dmigoto v1.4.1 on Thu Feb  6 18:54:44 2025

cbuffer cbHdrLut : register(b4)
{
  float4 g_vHdrLutInfo : packoffset(c0);
  float4 g_vNeutralTonemapperParams0 : packoffset(c1);
  float4 g_vNeutralTonemapperParams1 : packoffset(c2);
}

Texture3D<float3> g_tInputMap : register(t0);
Texture3D<float3> g_tYrgbLut : register(t1);
RWTexture3D<float3> g_uRwOutputLut : register(u0);


// 3Dmigoto declarations
#define cmp -


//[numthreads(4, 4, 4)]
// void main(uint3 vThreadID: SV_DispatchThreadID) {
// // Needs manual fix for instruction:
// // unknown dcl_: dcl_uav_typed_texture3d (float,float,float,float) u0
//   float4 r0,r1,r2,r3,r4,r5,r6,r7;
//   uint4 bitmask, uiDest;
//   float4 fDest;

// // Needs manual fix for instruction:
// // unknown dcl_: dcl_thread_group 4, 4, 4
//   r0.xyz = vThreadID.xyz;
//   r0.w = 0;
//   r1.xyz = g_tInputMap.Load(r0.xyzw).xyz;
//   r0.xyz = g_tYrgbLut.Load(r0.xyzw).xyz;
//   r0.w = (int)g_vHdrLutInfo.z;
//   switch (r0.w) {
//     case 0.f :    r0.w = dot(float3(1.70507967,-0.624233425,-0.0808462128), r1.xyz);
//     r1.w = dot(float3(-0.129700527,1.1384685,-0.00876801647), r1.xyz);
//     r2.x = dot(float3(-0.0241668653,-0.124614917,1.14878178), r1.xyz);
//     r2.y = g_vHdrLutInfo.x / g_vHdrLutInfo.y;
//     r3.xyz = cmp(r0.xyz < float3(0,0,0));
//     r2.yzw = abs(r0.xyz) / r2.yyy;
//     r0.w = r0.w * r0.x;
//     r4.xw = r3.xx ? r2.yy : r0.ww;
//     r0.w = r1.w * r0.y;
//     r4.y = r3.y ? r2.z : r0.w;
//     r0.w = r2.x * r0.z;
//     r4.z = r3.z ? r2.w : r0.w;
//     r2.xyzw = max(float4(0,0,0,0), r4.xyzw);
//   // No code for instruction (needs manual fix):
//     //store_uav_typed u0.xyzw, vThreadID.xyzz, r2.xyzw
// 	u0[vThreadID.xyz] = r2.xyzw;
//     break;
//     case 1.f :    r2.x = dot(float3(1.70507967,-0.624233425,-0.0808462128), r1.xyz);
//     r2.y = dot(float3(-0.129700527,1.1384685,-0.00876801647), r1.xyz);
//     r2.z = dot(float3(-0.0241668653,-0.124614917,1.14878178), r1.xyz);
//     r3.xy = g_vHdrLutInfo.xy / g_vHdrLutInfo.yx;
//     r4.xyzw = cmp(float4(0.5,0.5,0.5,0.5) < r2.xyzx);
//     r5.xyzw = float4(-0.5,-0.5,-0.5,-0.5) + r2.xyzx;
//     r5.xyzw = float4(-0.13750352,-0.13750352,-0.13750352,-0.13750352) * r5.xyzw;
//     r5.xyzw = exp2(r5.xyzw);
//     r0.w = -1 + r3.x;
//     r5.xyzw = -r5.xyzw * r0.wwww + r3.xxxx;
//     r4.xyzw = r4.xyzw ? r5.xyzw : float4(1,1,1,1);
//     r2.xyzw = r2.xyzx / r4.wyzw;
//     r2.xyzw = max(float4(0,0,0,0), r2.xyzw);
//     r3.zw = g_vNeutralTonemapperParams1.xy * g_vNeutralTonemapperParams0.ww;
//     r0.w = g_vNeutralTonemapperParams0.z * g_vNeutralTonemapperParams0.y;
//     r1.w = g_vNeutralTonemapperParams0.x * g_vNeutralTonemapperParams1.z + r0.w;
//     r1.w = g_vNeutralTonemapperParams1.z * r1.w + r3.z;
//     r5.x = g_vNeutralTonemapperParams0.x * g_vNeutralTonemapperParams1.z + g_vNeutralTonemapperParams0.y;
//     r5.x = g_vNeutralTonemapperParams1.z * r5.x + r3.w;
//     r1.w = r1.w / r5.x;
//     r5.x = g_vNeutralTonemapperParams1.x / g_vNeutralTonemapperParams1.y;
//     r1.w = -r5.x + r1.w;
//     r1.w = 1 / r1.w;
//     r2.xyzw = r2.xyzw * r1.wwww;
//     r6.xyzw = g_vNeutralTonemapperParams0.xxxx * r2.wyzw + r0.wwww;
//     r6.xyzw = r2.wyzw * r6.xyzw + r3.zzzz;
//     r7.xyzw = g_vNeutralTonemapperParams0.xxxx * r2.wyzw + g_vNeutralTonemapperParams0.yyyy;
//     r2.xyzw = r2.xyzw * r7.xyzw + r3.wwww;
//     r2.xyzw = r6.xyzw / r2.xyzw;
//     r2.xyzw = r2.xyzw + -r5.xxxx;
//     r0.w = r1.w / g_vNeutralTonemapperParams1.w;
//     r2.xyzw = r2.xyzw * r0.wwww;
//     r2.xyzw = r2.xyzw * r4.xyzw;
//     r2.xyzw = r2.xyzw * r3.yyyy;
//     r4.xyzw = cmp(r0.xyzx < float4(0,0,0,0));
//     r3.xyzw = abs(r0.xyzx) / r3.xxxx;
//     r2.xyzw = r2.xyzw * r0.xyzx;
//     r2.xyzw = r4.xyzw ? r3.xyzw : r2.xyzw;
//     r2.xyzw = max(float4(0,0,0,0), r2.xyzw);
//   // No code for instruction (needs manual fix):
//     //store_uav_typed u0.xyzw, vThreadID.xyzz, r2.xyzw
// 	u0[vThreadID.xyz] = r2.xyzw;
//     break;
//     case 2 :    case 4 :    r2.y = dot(float3(0.695452213,0.140678704,0.163869068), r1.xyz);
//     r3.y = dot(float3(0.0447945632,0.859671116,0.0955343172), r1.xyz);
//     r4.w = dot(float3(-0.00552588282,0.00402521016,1.00150073), r1.xyz);
//     r0.w = cmp(r2.y < r3.y);
//     if (r0.w != 0) {
//       r0.w = cmp(r3.y < r4.w);
//       r4.y = r4.w + -r2.y;
//       r1.w = cmp(0 < r4.y);
//       r2.w = -r3.y + r2.y;
//       r2.w = 60 * r2.w;
//       r2.w = r2.w / r4.y;
//       r2.w = 240 + r2.w;
//       r4.x = r1.w ? r2.w : 0;
//       r1.w = cmp(r2.y < r4.w);
//       r5.z = r3.y + -r2.y;
//       r2.w = cmp(0 < r5.z);
//       r3.w = 60 * r4.y;
//       r5.y = r3.w / r5.z;
//       r5.y = 120 + r5.y;
//       r5.x = r2.w ? r5.y : 0;
//       r6.z = -r4.w + r3.y;
//       r2.w = cmp(0 < r6.z);
//       r3.w = r3.w / r6.z;
//       r3.w = 120 + r3.w;
//       r6.x = r2.w ? r3.w : 0;
//       r3.xz = r1.ww ? r5.xz : r6.xz;
//       r3.xzw = r0.www ? r4.wyx : r3.yzx;
//     } else {
//       r0.w = cmp(r2.y < r4.w);
//       r5.z = r4.w + -r3.y;
//       r1.w = cmp(0 < r5.z);
//       r6.z = -r3.y + r2.y;
//       r2.w = 60 * r6.z;
//       r2.w = r2.w / r5.z;
//       r2.w = 240 + r2.w;
//       r5.x = r1.w ? r2.w : 0;
//       r1.w = cmp(r3.y < r4.w);
//       r2.w = cmp(0 < r6.z);
//       r4.x = -r4.w + r3.y;
//       r4.x = 60 * r4.x;
//       r5.w = r4.x / r6.z;
//       r6.x = r2.w ? r5.w : 0;
//       r7.z = -r4.w + r2.y;
//       r2.w = cmp(0 < r7.z);
//       r4.x = r4.x / r7.z;
//       r7.x = r2.w ? r4.x : 0;
//       r2.xz = r1.ww ? r6.xz : r7.xz;
//       r5.y = r4.w;
//       r3.xzw = r0.www ? r5.yzx : r2.yzx;
//     }
//     r0.w = cmp(r3.w < 0);
//     r1.w = cmp(360 < r3.w);
//     r2.xz = float2(360,-360) + r3.ww;
//     r1.w = r1.w ? r2.z : r3.w;
//     r0.w = r0.w ? r2.x : r1.w;
//     r1.w = cmp(r3.x == 0.000000);
//     r2.x = r3.z / r3.x;
//     r1.w = r1.w ? 0 : r2.x;
//     r2.x = r4.w + -r3.y;
//     r2.z = r3.y + -r2.y;
//     r2.z = r3.y * r2.z;
//     r2.x = r4.w * r2.x + r2.z;
//     r2.z = -r4.w + r2.y;
//     r2.x = r2.y * r2.z + r2.x;
//     r2.x = sqrt(r2.x);
//     r2.z = r3.y + r2.y;
//     r2.z = r2.z + r4.w;
//     r2.x = r2.z + r2.x;
//     r2.x = 1.75 + r2.x;
//     r2.z = 0.333333343 * r2.x;
//     r2.w = -0.400000006 + r1.w;
//     r3.x = 2.5 * r2.w;
//     r3.x = 1 + -abs(r3.x);
//     r3.x = max(0, r3.x);
//     r2.w = cmp(r2.w >= 0);
//     r2.w = r2.w ? 1 : -1;
//     r3.x = -r3.x * r3.x + 1;
//     r2.w = r2.w * r3.x + 1;
//     r3.x = 0.0250000004 * r2.w;
//     r3.z = cmp(0.159999996 >= r2.x);
//     r2.w = r2.w * 0.0250000004 + 1;
//     r2.x = cmp(r2.x >= 0.479999989);
//     r2.z = 0.0799999982 / r2.z;
//     r2.z = -0.5 + r2.z;
//     r2.z = r3.x * r2.z + 1;
//     r2.x = r2.x ? 1 : r2.z;
//     r2.x = r3.z ? r2.w : r2.x;
//     r4.y = r2.y;
//     r4.z = r3.y;
//     r3.yzw = r4.yzw * r2.xxx;
//     r2.y = cmp(r0.w < -180);
//     r2.z = cmp(180 < r0.w);
//     r4.xz = float2(360,-360) + r0.ww;
//     r0.w = r2.z ? r4.z : r0.w;
//     r0.w = r2.y ? r4.x : r0.w;
//     r0.w = 2.43902445 * r0.w;
//     r0.w = 1 + -abs(r0.w);
//     r0.w = max(0, r0.w);
//     r2.y = r0.w * -2 + 3;
//     r0.w = r0.w * r0.w;
//     r0.w = r2.y * r0.w;
//     r0.w = r0.w * r0.w;
//     r0.w = r0.w * r1.w;
//     r1.w = -r4.y * r2.x + 0.0299999993;
//     r0.w = r1.w * r0.w;
//     r3.x = r0.w * 0.180000007 + r3.y;
//     r2.xyz = max(float3(0,0,0), r3.xzw);
//     r2.xyz = min(float3(65504,65504,65504), r2.xyz);
//     r3.x = dot(float3(1.45143926,-0.236510754,-0.214928567), r2.xyz);
//     r3.y = dot(float3(-0.0765537769,1.17622972,-0.0996759236), r2.xyz);
//     r3.z = dot(float3(0.00831614807,-0.00603244966,0.997716308), r2.xyz);
//     r2.xyz = max(float3(0,0,0), r3.xyz);
//     r2.xyz = min(float3(65504,65504,65504), r2.xyz);
//     r0.w = dot(r2.xyz, float3(0.272228986,0.674081981,0.0536894985));
//     r2.xyz = r2.xyz + -r0.www;
//     r2.xyz = r2.xyz * float3(0.959999979,0.959999979,0.959999979) + r0.www;
//     r3.xy = g_vHdrLutInfo.xy / g_vHdrLutInfo.yx;
//     r4.xyz = cmp(float3(0.5,0.5,0.5) < r2.xyz);
//     r5.xyz = float3(-0.5,-0.5,-0.5) + r2.xyz;
//     r5.xyz = float3(-0.13750352,-0.13750352,-0.13750352) * r5.xyz;
//     r5.xyz = exp2(r5.xyz);
//     r0.w = -1 + r3.x;
//     r5.xyz = -r5.xyz * r0.www + r3.xxx;
//     r4.xyz = r4.xyz ? r5.xyz : float3(1,1,1);
//     r2.xyz = r2.xyz / r4.xyz;
//     r5.xyz = r2.xyz * float3(30.9882221,30.9882221,30.9882221) + float3(1.19912136,1.19912136,1.19912136);
//     r5.xyz = r5.xyz * r2.xyz;
//     r6.xyz = r2.xyz * float3(32.667881,32.667881,32.667881) + float3(9.87056255,9.87056255,9.87056255);
//     r2.xyz = r2.xyz * r6.xyz + float3(8.97784805,8.97784805,8.97784805);
//     r2.xyz = r5.xyz / r2.xyz;
//     r2.xyz = r2.xyz * r4.xyz;
//     r0.w = dot(float3(0.662454188,0.134004205,0.156187683), r2.xyz);
//     r1.w = dot(float3(0.272228718,0.674081743,0.0536895171), r2.xyz);
//     r2.x = dot(float3(-0.00557464967,0.0040607336,1.01033914), r2.xyz);
//     r2.y = r1.w + r0.w;
//     r2.x = r2.y + r2.x;
//     r2.x = max(1.00000001e-10, r2.x);
//     r0.w = r0.w / r2.x;
//     r2.x = r1.w / r2.x;
//     r1.w = log2(r1.w);
//     r1.w = 0.981100023 * r1.w;
//     r4.y = exp2(r1.w);
//     r1.w = max(1.00000001e-10, r2.x);
//     r1.w = r4.y / r1.w;
//     r4.x = r1.w * r0.w;
//     r0.w = 1 + -r0.w;
//     r0.w = r0.w + -r2.x;
//     r4.z = r0.w * r1.w;
//     r2.x = dot(float3(1.6410234,-0.324803293,-0.236424699), r4.xyz);
//     r2.y = dot(float3(-0.663662851,1.61533165,0.0167563483), r4.xyz);
//     r2.z = dot(float3(0.0117218941,-0.00828444213,0.988394856), r4.xyz);
//     r0.w = dot(r2.xyz, float3(0.272228986,0.674081981,0.0536894985));
//     r2.xyz = r2.xyz + -r0.www;
//     r2.xyz = r2.xyz * float3(0.930000007,0.930000007,0.930000007) + r0.www;
//     r4.x = dot(float3(0.662454188,0.134004205,0.156187683), r2.xyz);
//     r4.y = dot(float3(0.272228718,0.674081743,0.0536895171), r2.xyz);
//     r4.z = dot(float3(-0.00557464967,0.0040607336,1.01033914), r2.xyz);
//     r5.x = dot(float3(0.988232493,-0.00788563583,0.0167578701), r4.xyz);
//     r5.y = dot(float3(-0.00569321448,0.998692274,0.00667246478), r4.xyz);
//     r5.z = dot(float3(0.000352954201,0.00112296687,1.07808423), r4.xyz);
//     r0.w = (int)g_vHdrLutInfo.w;
//     switch (r0.w) {
//       case 0 :      r2.x = dot(float3(3.2409699,-1.5373832,-0.498610765), r5.xyz);
//       r2.y = dot(float3(-0.969243646,1.8759675,0.0415550582), r5.xyz);
//       r2.z = dot(float3(0.0556300804,-0.203976959,1.05697155), r5.xyz);
//       break;
//       case 1 :      r2.x = dot(float3(1.7166512,-0.35567078,-0.253366292), r5.xyz);
//       r2.y = dot(float3(-0.66668433,1.61648118,0.0157685466), r5.xyz);
//       r2.z = dot(float3(0.0176398568,-0.042770613,0.942103148), r5.xyz);
//       break;
//       case 2 :      r2.x = dot(float3(2.42140508,-0.872936487,-0.393461466), r5.xyz);
//       r2.y = dot(float3(-0.831189752,1.76404297,0.0238428935), r5.xyz);
//       r2.z = dot(float3(0.0305964444,-0.162594378,1.04082072), r5.xyz);
//       break;
//       default :
//       break;
//     }
//     r2.xyzw = r2.xyzx;
//     r2.xyzw = r2.xyzw * r3.yyyy;
//     r4.xyzw = cmp(r0.xyzx < float4(0,0,0,0));
//     r3.xyzw = abs(r0.xyzx) / r3.xxxx;
//     r2.xyzw = r2.xyzw * r0.xyzx;
//     r2.xyzw = r4.xyzw ? r3.xyzw : r2.xyzw;
//     r2.xyzw = max(float4(0,0,0,0), r2.xyzw);
//   // No code for instruction (needs manual fix):
//     //store_uav_typed u0.xyzw, vThreadID.xyzz, r2.xyzw
// 	u0[vThreadID.xyz] = r2.xyzw;
//     break;
//     case 3 :    r2.x = dot(float3(1.70507967,-0.624233425,-0.0808462128), r1.xyz);
//     r2.y = dot(float3(-0.129700527,1.1384685,-0.00876801647), r1.xyz);
//     r2.z = dot(float3(-0.0241668653,-0.124614917,1.14878178), r1.xyz);
//     r3.xy = g_vHdrLutInfo.xy / g_vHdrLutInfo.yx;
//     r4.xyzw = cmp(float4(0.5,0.5,0.5,0.5) < r2.xyzx);
//     r5.xyzw = float4(-0.5,-0.5,-0.5,-0.5) + r2.xyzx;
//     r5.xyzw = float4(-0.13750352,-0.13750352,-0.13750352,-0.13750352) * r5.xyzw;
//     r5.xyzw = exp2(r5.xyzw);
//     r0.w = -1 + r3.x;
//     r5.xyzw = -r5.xyzw * r0.wwww + r3.xxxx;
//     r4.xyzw = r4.xyzw ? r5.xyzw : float4(1,1,1,1);
//     r2.xyzw = r2.xyzx / r4.wyzw;
//     r3.zw = g_vNeutralTonemapperParams1.zz * float2(0.150000006,0.150000006) + float2(0.0500000007,0.5);
//     r3.zw = g_vNeutralTonemapperParams1.zz * r3.zw + float2(0.00400000019,0.0599999987);
//     r0.w = r3.z / r3.w;
//     r0.w = -0.0666666701 + r0.w;
//     r0.w = 1 / r0.w;
//     r2.xyzw = max(float4(0,0,0,0), r2.xyzw);
//     r5.xyzw = r2.wyzw * float4(0.150000006,0.150000006,0.150000006,0.150000006) + float4(0.0500000007,0.0500000007,0.0500000007,0.0500000007);
//     r5.xyzw = r2.wyzw * r5.xyzw + float4(0.00400000019,0.00400000019,0.00400000019,0.00400000019);
//     r6.xyzw = r2.wyzw * float4(0.150000006,0.150000006,0.150000006,0.150000006) + float4(0.5,0.5,0.5,0.5);
//     r2.xyzw = r2.xyzw * r6.xyzw + float4(0.0599999987,0.0599999987,0.0599999987,0.0599999987);
//     r2.xyzw = r5.xyzw / r2.xyzw;
//     r2.xyzw = float4(-0.0666666701,-0.0666666701,-0.0666666701,-0.0666666701) + r2.xyzw;
//     r2.xyzw = r2.xyzw * r0.wwww;
//     r2.xyzw = r2.xyzw * r4.xyzw;
//     r2.xyzw = r2.xyzw * r3.yyyy;
//     r4.xyzw = cmp(r0.xyzx < float4(0,0,0,0));
//     r3.xyzw = abs(r0.xyzx) / r3.xxxx;
//     r0.xyzw = r2.xyzw * r0.xyzx;
//     r0.xyzw = r4.xyzw ? r3.xyzw : r0.xyzw;
//     r0.xyzw = max(float4(0,0,0,0), r0.xyzw);
//   // No code for instruction (needs manual fix):
//     //store_uav_typed u0.xyzw, vThreadID.xyzz, r0.xyzw
// 	u0[vThreadID.xyz] = r0.xyzw;
//     break;
//     default :
//   // No code for instruction (needs manual fix):
//     //store_uav_typed u0.xyzw, vThreadID.xyzz, r1.xyzx
// 	u0[vThreadID.xyz] = r1.xyzx;
//     break;
//   }
//   return;
// }