#include "../shared.h"

Texture2D<uint> __3__36__0__0__g_tileMask16 : register(t35, space36);

RWStructuredBuffer<uint> __3__39__0__1__g_hardwareRasterizerIndexBufferUAV : register(u6, space39);

RWByteAddressBuffer __3__39__0__1__g_hardwareRasterizerCounterBufferUAV : register(u2, space39);

[numthreads(8, 8, 1)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {

  // SSDM is disable toggle
  //
  // Need to figure out how to fix the actual issue but SSDM is a PITA atm
  if (DISABLE_SSDM > 0.5f) return;

  uint _7 = __3__36__0__0__g_tileMask16.Load(int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), 0));
  [branch]
  if (_7.x == 0) {
    uint _15; __3__39__0__1__g_hardwareRasterizerCounterBufferUAV.InterlockedAdd(0u, 1, _15);
    __3__39__0__1__g_hardwareRasterizerIndexBufferUAV[(int)(_15)] = (((int)(SV_DispatchThreadID.y << 16)) | ((int)(SV_DispatchThreadID.x) & 65535));
  }
}
