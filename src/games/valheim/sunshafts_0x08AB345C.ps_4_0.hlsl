// ---- Created with 3Dmigoto v1.4.1 on Wed Jan 29 15:53:28 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[6];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  const float4 icb[] = { { 0.624630, 0.543370, 0.827900, 0},
                              { -0.134140, -0.944880, 0.954350, 0},
                              { 0.387720, -0.434750, 0.582530, 0},
                              { 0.121260, -0.192820, 0.227780, 0},
                              { -0.203880, 0.111330, 0.232300, 0},
                              { 0.831140, -0.292180, 0.881000, 0},
                              { 0.107590, -0.578390, 0.588310, 0},
                              { 0.282850, 0.790360, 0.839450, 0},
                              { -0.366220, 0.395160, 0.538760, 0},
                              { 0.755910, 0.219160, 0.787040, 0},
                              { -0.526100, 0.023860, 0.526640, 0},
                              { -0.882160, -0.244710, 0.915470, 0},
                              { -0.488880, -0.293300, 0.570110, 0},
                              { 0.440140, -0.085580, 0.448380, 0},
                              { 0.211790, 0.513730, 0.555670, 0},
                              { 0.054830, 0.957010, 0.958580, 0},
                              { -0.590010, -0.705090, 0.919380, 0},
                              { -0.800650, 0.246310, 0.837680, 0},
                              { -0.194240, -0.184020, 0.267570, 0},
                              { -0.436670, 0.767510, 0.883040, 0},
                              { 0.216660, 0.116020, 0.245770, 0},
                              { 0.156960, -0.856000, 0.870270, 0},
                              { -0.758210, 0.583630, 0.956820, 0},
                              { 0.992840, -0.029040, 0.993270, 0},
                              { -0.222340, -0.579070, 0.620290, 0},
                              { 0.550520, -0.669840, 0.867040, 0},
                              { 0.464310, 0.281150, 0.542800, 0},
                              { -0.072140, 0.605540, 0.609820, 0} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = w1.xy * cb0[4].xy + cb0[4].zw;
  r0.xyzw = t0.Sample(s0_s, r0.xy).xwyz;
  r1.xyzw = cb0[3].xyxy * r0.yyyy;
  r1.xyzw = cb0[5].wwww * r1.xyzw;
  r2.x = 0.25 * r0.y;
  r2.x = max(cb0[5].z, r2.x);
  r2.yzw = r2.xxx * r0.xzw;
  r3.x = 1.20000005;
  r4.xyz = r2.yzw;
  r0.z = r2.x;
  r0.w = 0;
  while (true) {
    r3.y = cmp((int)r0.w >= 28);
    if (r3.y != 0) break;

    int reno1 = 0; //replacing value of r0.w as int

    r5.xyzw = icb[reno1+0].xyxy * r1.xyzw;
    r3.z = icb[reno1+0].z;
    r5.xyzw = r5.xyzw / r3.xxzz;
    r5.xyzw = w1.xyxy + r5.xyzw;
    r5.xyzw = r5.xyzw * cb0[4].xyxy + cb0[4].zwzw;
    r6.xyzw = t0.Sample(s0_s, r5.xy).xyzw;
    r5.xyzw = t0.Sample(s0_s, r5.zw).xyzw;
    r3.y = r6.w + r5.w;
    r3.y = cmp(0 < r3.y);
    if (r3.y != 0) {
      r0.x = icb[reno1+0].z * r0.y;
      r7.x = r6.w;
      r7.y = r5.w;
      r3.yz = -r0.xy * float2(0.833333313,1) + r7.xy;
      r3.yz = float2(0.264999986,0.264999986) + r3.yz;
      r3.yz = saturate(float2(3.77358508,3.77358508) * r3.yz);
      r3.yz = float2(3.77358508, 3.77358508) * r3.yz;
      r7.xy = r3.yz * float2(-2,-2) + float2(3,3);
      r3.yz = r3.yz * r3.yz;
      r3.yz = r7.xy * r3.yz;
      r5.xyz = r5.xyz * r3.zzz;
      r5.xyz = r6.xyz * r3.yyy + r5.xyz;
      r4.xyz = r5.xyz + r4.xyz;
      r0.x = dot(r3.yz, float2(1,1));
      r0.z = r0.z + r0.x;
    }
    r0.w = (int)r0.w + 1;
  }
  o0.xyz = r4.xyz / r0.zzz;
  o0.w = 1;

  o0.w = 10;
  return;
}