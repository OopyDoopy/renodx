#include "./common.hlsl"

[[vk::binding(0, 1)]] Sampler2D gBufferMap;

[[vk::binding(0, 2)]] RWTexture2D<float4> gOutTexture0;

[[vk::binding(1, 1)]] Sampler3D gHdrLut;

[numthreads(8, 8, 1)]
void main(uint3 tid: SV_DispatchThreadID)
{
  uint2 dim;
  gOutTexture0.GetDimensions(dim.x, dim.y);

  float2 uv = (float2(tid.xy) + float2(0.5, 0.5)) / float2(dim);
  float4 _504 = gBufferMap.SampleLevel(uv, 0.0);

  float4 hdr_color = _504;
  hdr_color.xyz = CustomGammaDecode(hdr_color.xyz);
  if (RENODX_TONE_MAP_TYPE != 1) {
    hdr_color.xyz = renodx::draw::SwapChainPass(hdr_color.xyz, uv);
  }
  else {
    float3 _519 = hdr_color.xyz * 3.0f;
    float4 _1410;
    _1410.x = _519.x;
    _1410.y = _519.y;
    _1410.z = _519.z;
    float3 _544 = max(float3(0.0), mul(float3x3(float3(0.627399981021881103515625, 0.329299986362457275390625, 0.0432999990880489349365234375), float3(0.069099999964237213134765625, 0.91949999332427978515625, 0.011400000192224979400634765625), float3(0.01640000008046627044677734375, 0.087999999523162841796875, 0.895600020885467529296875)), _1410.xyz));
    float4 _1416;
    _1416.x = _544.x;
    _1416.y = _544.y;
    _1416.z = _544.z;
    float3 _557 = clamp(fma(_1416.xyz, fma(_1416.xyz, fma(_1416.xyz, fma(_1416.xyz, (_1416.xyz * 533095.75) + float3(47438308.0), float3(29063622.0)), float3(575216.75)), float3(383.091033935546875)), float3(0.000487781013362109661102294921875)) / fma(_1416.xyz, fma(_1416.xyz, fma(_1416.xyz, (_1416.xyz * 66391356.0) + float3(81884528.0), float3(4182885.0)), float3(10668.404296875)), float3(1.0)), float3(0.0), float3(1.0));
    float4 _1422;
    _1422.x = _557.x;
    _1422.y = _557.y;
    _1422.z = _557.z;
    float3 _567 = _1422.xyz * 1.01587307453155517578125;
    float4 _1428;
    _1428.x = _567.x;
    _1428.y = _567.y;
    _1428.z = _567.z;
    float3 _578 = _1428.xyz + float3(0.0078125);
    float4 _1434;
    _1434.x = _578.x;
    _1434.y = _578.y;
    _1434.z = _578.z;
    float4 _592 = gHdrLut.SampleLevel(_1434.xyz, 0.0);
    float4 _1440;
    _1440.x = _592.x;
    _1440.y = _592.y;
    _1440.z = _592.z;
    float3 _1071 = pow(_1440.xyz, float3(0.0126833133399486541748046875));
    float3 _1089 = (pow(max(_1071 - float3(0.8359375), float3(0.0)) / (float3(18.8515625) - (_1071 * 18.6875)), float3(6.277394771575927734375)) * 10000.0) * float3(0.00999999977648258209228515625);
    float4 _1505;
    _1505.x = _1089.x;
    _1505.y = _1089.y;
    _1505.z = _1089.z;
    float3 _627 = mul(float3x3(float3(1.660500049591064453125, -0.58770000934600830078125, -0.072800002992153167724609375), float3(-0.124600000679492950439453125, 1.13300001621246337890625, -0.008399999700486660003662109375), float3(-0.01820000074803829193115234375, -0.100599996745586395263671875, 1.1187000274658203125)), _1505.xyz);
    float4 _1511;
    _1511.x = _627.x;
    _1511.y = _627.y;
    _1511.z = _627.z;
    hdr_color.xyz = _1511.xyz * 1.25;
  }

  gOutTexture0[tid.xy] = hdr_color;
}