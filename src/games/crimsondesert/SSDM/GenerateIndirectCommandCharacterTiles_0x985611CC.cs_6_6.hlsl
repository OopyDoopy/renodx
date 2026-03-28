RWByteAddressBuffer __3__39__0__1__g_hardwareRasterizerCounterBufferUAV : register(u2, space39);

[numthreads(1, 1, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  int4 _3 = asint(__3__39__0__1__g_hardwareRasterizerCounterBufferUAV.Load4(0));
  __3__39__0__1__g_hardwareRasterizerCounterBufferUAV.Store(0, asuint(_3.x));
  __3__39__0__1__g_hardwareRasterizerCounterBufferUAV.Store(4, asuint(1));
  __3__39__0__1__g_hardwareRasterizerCounterBufferUAV.Store(8, asuint(1));
}