#include "./sunshafts_generate_common.hlsli"

float4 main(noperspective float4 SV_Position : SV_Position) : SV_Target {
  return GenerateSunshafts(SV_Position, 20);
}
