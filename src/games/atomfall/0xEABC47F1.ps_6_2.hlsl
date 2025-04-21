Texture2D<float4> t0 : register(t0);

cbuffer cb0 : register(b0) {
  float4 FrameConstants_000[4] : packoffset(c000.x);
  float4 FrameConstants_064[4] : packoffset(c004.x);
  float4 FrameConstants_128[4] : packoffset(c008.x);
  float4 FrameConstants_192[4] : packoffset(c012.x);
  float4 FrameConstants_256[4] : packoffset(c016.x);
  float4 FrameConstants_320[4] : packoffset(c020.x);
  float3 FrameConstants_384 : packoffset(c024.x);
  float FrameConstants_396 : packoffset(c024.w);
  float4 FrameConstants_400 : packoffset(c025.x);
  float2 FrameConstants_416 : packoffset(c026.x);
  float2 FrameConstants_424 : packoffset(c026.z);
  float2 FrameConstants_432 : packoffset(c027.x);
  float2 FrameConstants_440 : packoffset(c027.z);
  float4 FrameConstants_448[6] : packoffset(c028.x);
  int4 FrameConstants_544 : packoffset(c034.x);
  float4 FrameConstants_560 : packoffset(c035.x);
  float FrameConstants_576 : packoffset(c036.x);
  float FrameConstants_580 : packoffset(c036.y);
  float FrameConstants_584 : packoffset(c036.z);
  float FrameConstants_588 : packoffset(c036.w);
  float FrameConstants_592 : packoffset(c037.x);
  float FrameConstants_596 : packoffset(c037.y);
  int FrameConstants_600 : packoffset(c037.z);
  float FrameConstants_604 : packoffset(c037.w);
  float FrameConstants_608 : packoffset(c038.x);
  float3 FrameConstants_612 : packoffset(c038.y);
  float4 FrameConstants_624 : packoffset(c039.x);
  float FrameConstants_640 : packoffset(c040.x);
  float3 FrameConstants_644 : packoffset(c040.y);
  float FrameConstants_656 : packoffset(c041.x);
  float3 FrameConstants_660 : packoffset(c041.y);
  float FrameConstants_672 : packoffset(c042.x);
  float FrameConstants_676 : packoffset(c042.y);
  float FrameConstants_680 : packoffset(c042.z);
  float FrameConstants_684 : packoffset(c042.w);
  float FrameConstants_688 : packoffset(c043.x);
  float3 FrameConstants_692 : packoffset(c043.y);
  float FrameConstants_704 : packoffset(c044.x);
  float FrameConstants_708 : packoffset(c044.y);
  float2 FrameConstants_712 : packoffset(c044.z);
  float FrameConstants_720 : packoffset(c045.x);
  int FrameConstants_724 : packoffset(c045.y);
  int FrameConstants_728 : packoffset(c045.z);
};

float main(
  noperspective float4 SV_Position : SV_Position
) : SV_Target {
  float SV_Target;
  float4 _7 = t0.Load(int3(int(SV_Position.x), int(SV_Position.y), 0));
  SV_Target = (FrameConstants_440.x / (FrameConstants_440.y - _7.x));
  return SV_Target;
  //return 2;
}
