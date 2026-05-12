#include "../tonemap.hlsli"

struct PostProcessOutlineExampleStruct {
  uint _outlineColor;
  float _outlineSize;
};


Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

Texture2D<uint> __3__36__0__0__g_CustomRenderPassValue : register(t69, space36);

Texture2D<float4> __3__36__0__0__g_CustomRenderPassDepth : register(t70, space36);

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__SceneConstantBuffer : register(b16, space35) {
  uint4 __3__35__0__0__SceneConstantBuffer_raw[172];
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__35__0__0__ExposureConstantBuffer : register(b31, space35) {
  float4 _exposure0 : packoffset(c000.x);
  float4 _exposure1 : packoffset(c001.x);
  float4 _exposure2 : packoffset(c002.x);
  float4 _exposure3 : packoffset(c003.x);
  float4 _exposure4 : packoffset(c004.x);
};
#endif

#if 0 // Provided by tonemap.hlsli
cbuffer __3__1__0__0__GlobalPushConstants : register(b0, space1) {
  float4 _postProcessParams : packoffset(c000.x);
  float4 _postProcessParams1 : packoffset(c001.x);
  float4 _toneMapParams0 : packoffset(c002.x);
  float4 _toneMapParams1 : packoffset(c003.x);
  float4 _colorGradingParams : packoffset(c004.x);
  float4 _colorCorrectionParams : packoffset(c005.x);
  float4 _localToneMappingParams : packoffset(c006.x);
  float4 _etcParams : packoffset(c007.x);
  float4 _userImageAdjust : packoffset(c008.x);
  float4 _slopeParams : packoffset(c009.x);
  float4 _offsetParams : packoffset(c010.x);
  float4 _powerParams : packoffset(c011.x);
  int _colorBlindParam : packoffset(c012.x);
  int _nightToneParm : packoffset(c012.y);
  int2 _padding : packoffset(c012.z);
};
#endif

cbuffer __3__1__0__0__PostProcessSizeConstant : register(b1, space1) {
  float4 _srcTargetSizeAndInv : packoffset(c000.x);
  float4 _destTargetSizAndInv : packoffset(c001.x);
};

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessOutlineExample {
  PostProcessOutlineExampleStruct BindlessParameters_PostProcessOutlineExample;
};

typedef BindlessParameters_PostProcessOutlineExample BindlessParameters_PostProcessOutlineExample_t;
ConstantBuffer<BindlessParameters_PostProcessOutlineExample_t> BindlessParameters_PostProcessOutlineExample[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _724;
  float _725;
  float _726;
  float _740;
  float _945;
  float _946;
  float _947;
  float _1040;
  float _1041;
  float _1042;
  float _1162;
  float _1163;
  float _1164;
  float _1185;
  float _1186;
  float _1187;
  float _1220;
  float _1221;
  float _1222;
  float _1236;
  float _1237;
  float _1238;
  uint2 _28;
  bool _56;
  float _58;
  int _65;
  float _73;
  float4 _76;
  float _83;
  float _84;
  float _102;
  float _103;
  float4 _105;
  float _112;
  float _113;
  float4 _132;
  float _139;
  float _140;
  float _158;
  float4 _160;
  float _167;
  float _168;
  float4 _187;
  float _194;
  float _195;
  int _231;
  float _239;
  float4 _242;
  float _249;
  float _250;
  float _268;
  float _269;
  float4 _271;
  float _278;
  float _279;
  float4 _298;
  float _305;
  float _306;
  float _324;
  float4 _326;
  float _333;
  float _334;
  float4 _353;
  float _360;
  float _361;
  int _397;
  float _405;
  float4 _408;
  float _415;
  float _416;
  float _434;
  float _435;
  float4 _437;
  float _444;
  float _445;
  float4 _464;
  float _471;
  float _472;
  float _490;
  float4 _492;
  float _499;
  float _500;
  float4 _519;
  float _526;
  float _527;
  int _563;
  float _571;
  float4 _574;
  float _581;
  float _582;
  float _600;
  float _601;
  float4 _603;
  float _610;
  float _611;
  float4 _630;
  float _637;
  float _638;
  float _656;
  float4 _658;
  float _665;
  float _666;
  float4 _685;
  float _692;
  float _693;
  uint _727;
  float _749;
  float _798;
  float _799;
  float _800;
  float _802;
  float _809;
  float _810;
  float _811;
  float _830;
  float _831;
  float _832;
  float _833;
  float _834;
  float _835;
  float _836;
  float _837;
  float _838;
  float _884;
  float _885;
  float _886;
  float _887;
  float _888;
  float _889;
  float _890;
  float _907;
  float _908;
  float _909;
  float _910;
  float _916;
  float _919;
  float _926;
  float _927;
  float _928;
  float _957;
  float _982;
  float _983;
  float _984;
  float _1003;
  float _1004;
  float _1005;
  float _1011;
  float _1015;
  float _1016;
  float _1017;
  float _1018;
  float _1023;
  float _1048;
  float _1052;
  float _1053;
  float _1054;
  float _1055;
  int _1096;
  float _1151;
  float _1175;
  float _1176;
  float _1180;
  float _1227;
  float _1248;
  float _1249;
  float _1250;
  float _20[36];
  if (_passIndex == 0) {
    __3__36__0__0__g_CustomRenderPassValue.GetDimensions(_28.x, _28.y);
    _56 = (((((uint)(__3__36__0__0__g_CustomRenderPassValue.Load(int3(int((float((int)(int(float((int)((int)(_28.x)))))) + 0.5f) * TEXCOORD.x), int((float((int)(int(float((int)((int)(_28.y)))))) + 0.5f) * TEXCOORD.y), 0)))).x) & 255) == 30);
    _58 = select(_56, (((float4)(__3__36__0__0__g_CustomRenderPassDepth.Load(int3(int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].x) * TEXCOORD.x), int(asfloat(__3__35__0__0__SceneConstantBuffer_raw[147u].y) * TEXCOORD.y), 0)))).x), 0.0f);
    _724 = select(_56, 1.0f, 0.0f);
    _725 = _58;
    _726 = _58;
  } else {
    if (_passIndex == 1) {
      _65 = WaveReadLaneFirst(_materialIndex);
      _73 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_65 < (uint)170000), _65, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineSize);
      _76 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
      _83 = (pow(_76.x, 0.012683313339948654f));
      _84 = (pow(_76.y, 0.012683313339948654f));
      _102 = _73 * (1.0f / _destTargetSizAndInv.x);
      _103 = _102 * 1.384615421295166f;
      _105 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_103 + TEXCOORD.x), TEXCOORD.y));
      _112 = (pow(_105.x, 0.012683313339948654f));
      _113 = (pow(_105.y, 0.012683313339948654f));
      _132 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _103), TEXCOORD.y));
      _139 = (pow(_132.x, 0.012683313339948654f));
      _140 = (pow(_132.y, 0.012683313339948654f));
      _158 = _102 * 3.230769157409668f;
      _160 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_158 + TEXCOORD.x), TEXCOORD.y));
      _167 = (pow(_160.x, 0.012683313339948654f));
      _168 = (pow(_160.y, 0.012683313339948654f));
      _187 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _158), TEXCOORD.y));
      _194 = (pow(_187.x, 0.012683313339948654f));
      _195 = (pow(_187.y, 0.012683313339948654f));
      _724 = ((((exp2(log2(max(0.0f, (_139 + -0.8359375f)) / (18.8515625f - (_139 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_112 + -0.8359375f)) / (18.8515625f - (_112 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_83 + -0.8359375f)) / (18.8515625f - (_83 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_194 + -0.8359375f)) / (18.8515625f - (_194 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_167 + -0.8359375f)) / (18.8515625f - (_167 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
      _725 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_84 + -0.8359375f)) / (18.8515625f - (_84 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_113 + -0.8359375f)) / (18.8515625f - (_113 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_140 + -0.8359375f)) / (18.8515625f - (_140 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_168 + -0.8359375f)) / (18.8515625f - (_168 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_195 + -0.8359375f)) / (18.8515625f - (_195 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
      _726 = 0.0f;
    } else {
      if (_passIndex == 2) {
        _231 = WaveReadLaneFirst(_materialIndex);
        _239 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_231 < (uint)170000), _231, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineSize);
        _242 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
        _249 = (pow(_242.x, 0.012683313339948654f));
        _250 = (pow(_242.y, 0.012683313339948654f));
        _268 = _239 * (1.0f / _destTargetSizAndInv.y);
        _269 = _268 * 1.384615421295166f;
        _271 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_269 + TEXCOORD.y)));
        _278 = (pow(_271.x, 0.012683313339948654f));
        _279 = (pow(_271.y, 0.012683313339948654f));
        _298 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _269)));
        _305 = (pow(_298.x, 0.012683313339948654f));
        _306 = (pow(_298.y, 0.012683313339948654f));
        _324 = _268 * 3.230769157409668f;
        _326 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_324 + TEXCOORD.y)));
        _333 = (pow(_326.x, 0.012683313339948654f));
        _334 = (pow(_326.y, 0.012683313339948654f));
        _353 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _324)));
        _360 = (pow(_353.x, 0.012683313339948654f));
        _361 = (pow(_353.y, 0.012683313339948654f));
        _724 = ((((exp2(log2(max(0.0f, (_305 + -0.8359375f)) / (18.8515625f - (_305 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_278 + -0.8359375f)) / (18.8515625f - (_278 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_249 + -0.8359375f)) / (18.8515625f - (_249 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_360 + -0.8359375f)) / (18.8515625f - (_360 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_333 + -0.8359375f)) / (18.8515625f - (_333 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
        _725 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_250 + -0.8359375f)) / (18.8515625f - (_250 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_279 + -0.8359375f)) / (18.8515625f - (_279 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_306 + -0.8359375f)) / (18.8515625f - (_306 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_334 + -0.8359375f)) / (18.8515625f - (_334 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_361 + -0.8359375f)) / (18.8515625f - (_361 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
        _726 = 0.0f;
      } else {
        if (_passIndex == 3) {
          _397 = WaveReadLaneFirst(_materialIndex);
          _405 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_397 < (uint)170000), _397, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineSize);
          _408 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
          _415 = (pow(_408.x, 0.012683313339948654f));
          _416 = (pow(_408.y, 0.012683313339948654f));
          _434 = _405 * (1.0f / _destTargetSizAndInv.x);
          _435 = _434 * 1.384615421295166f;
          _437 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_435 + TEXCOORD.x), TEXCOORD.y));
          _444 = (pow(_437.x, 0.012683313339948654f));
          _445 = (pow(_437.y, 0.012683313339948654f));
          _464 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _435), TEXCOORD.y));
          _471 = (pow(_464.x, 0.012683313339948654f));
          _472 = (pow(_464.y, 0.012683313339948654f));
          _490 = _434 * 3.230769157409668f;
          _492 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((_490 + TEXCOORD.x), TEXCOORD.y));
          _499 = (pow(_492.x, 0.012683313339948654f));
          _500 = (pow(_492.y, 0.012683313339948654f));
          _519 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2((TEXCOORD.x - _490), TEXCOORD.y));
          _526 = (pow(_519.x, 0.012683313339948654f));
          _527 = (pow(_519.y, 0.012683313339948654f));
          _724 = ((((exp2(log2(max(0.0f, (_471 + -0.8359375f)) / (18.8515625f - (_471 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_444 + -0.8359375f)) / (18.8515625f - (_444 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_415 + -0.8359375f)) / (18.8515625f - (_415 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_526 + -0.8359375f)) / (18.8515625f - (_526 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_499 + -0.8359375f)) / (18.8515625f - (_499 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
          _725 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_416 + -0.8359375f)) / (18.8515625f - (_416 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_445 + -0.8359375f)) / (18.8515625f - (_445 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_472 + -0.8359375f)) / (18.8515625f - (_472 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_500 + -0.8359375f)) / (18.8515625f - (_500 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_527 + -0.8359375f)) / (18.8515625f - (_527 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
          _726 = 0.0f;
        } else {
          if (_passIndex == 4) {
            _563 = WaveReadLaneFirst(_materialIndex);
            _571 = WaveReadLaneFirst(BindlessParameters_PostProcessOutlineExample[((int)((uint)(select(((uint)_563 < (uint)170000), _563, 0)) + 0u))].BindlessParameters_PostProcessOutlineExample._outlineSize);
            _574 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
            _581 = (pow(_574.x, 0.012683313339948654f));
            _582 = (pow(_574.y, 0.012683313339948654f));
            _600 = _571 * (1.0f / _destTargetSizAndInv.y);
            _601 = _600 * 1.384615421295166f;
            _603 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_601 + TEXCOORD.y)));
            _610 = (pow(_603.x, 0.012683313339948654f));
            _611 = (pow(_603.y, 0.012683313339948654f));
            _630 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _601)));
            _637 = (pow(_630.x, 0.012683313339948654f));
            _638 = (pow(_630.y, 0.012683313339948654f));
            _656 = _600 * 3.230769157409668f;
            _658 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (_656 + TEXCOORD.y)));
            _665 = (pow(_658.x, 0.012683313339948654f));
            _666 = (pow(_658.y, 0.012683313339948654f));
            _685 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, (TEXCOORD.y - _656)));
            _692 = (pow(_685.x, 0.012683313339948654f));
            _693 = (pow(_685.y, 0.012683313339948654f));
            _724 = ((((exp2(log2(max(0.0f, (_637 + -0.8359375f)) / (18.8515625f - (_637 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_610 + -0.8359375f)) / (18.8515625f - (_610 * 18.6875f))) * 6.277394771575928f)) * 3162.162353515625f) + (exp2(log2(max(0.0f, (_581 + -0.8359375f)) / (18.8515625f - (_581 * 18.6875f))) * 6.277394771575928f) * 2270.270263671875f)) + ((exp2(log2(max(0.0f, (_692 + -0.8359375f)) / (18.8515625f - (_692 * 18.6875f))) * 6.277394771575928f) + exp2(log2(max(0.0f, (_665 + -0.8359375f)) / (18.8515625f - (_665 * 18.6875f))) * 6.277394771575928f)) * 702.7026977539062f));
            _725 = max(max(max(max(max(0.0f, (exp2(log2(max(0.0f, (_582 + -0.8359375f)) / (18.8515625f - (_582 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_611 + -0.8359375f)) / (18.8515625f - (_611 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_638 + -0.8359375f)) / (18.8515625f - (_638 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_666 + -0.8359375f)) / (18.8515625f - (_666 * 18.6875f))) * 6.277394771575928f) * 10000.0f)), (exp2(log2(max(0.0f, (_693 + -0.8359375f)) / (18.8515625f - (_693 * 18.6875f))) * 6.277394771575928f) * 10000.0f));
            _726 = 0.0f;
          } else {
            _724 = 0.0f;
            _725 = 0.0f;
            _726 = 0.0f;
          }
        }
      }
    }
  }
  _727 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _740 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _727, 0)))).x) & 127))) + 0.5f);
  } else {
    _740 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_724, _725, _726));
    _1162 = output_color.x;
    _1163 = output_color.y;
    _1164 = output_color.z;
  } else {
    _1162 = _724;
    _1163 = _725;
    _1164 = _726;
  }
  if (_etcParams.y > 1.0f) {
    _1175 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1176 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1180 = saturate(1.0f - (dot(float2(_1175, _1176), float2(_1175, _1176)) * saturate(_etcParams.y + -1.0f)));
    _1185 = (_1180 * _1162);
    _1186 = (_1180 * _1163);
    _1187 = (_1180 * _1164);
  } else {
    _1185 = _1162;
    _1186 = _1163;
    _1187 = _1164;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1220 = select((_1185 <= 0.0031308000907301903f), (_1185 * 12.920000076293945f), (((pow(_1185, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1221 = select((_1186 <= 0.0031308000907301903f), (_1186 * 12.920000076293945f), (((pow(_1186, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1222 = select((_1187 <= 0.0031308000907301903f), (_1187 * 12.920000076293945f), (((pow(_1187, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1220 = _1185;
    _1221 = _1186;
    _1222 = _1187;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1227 = float((uint)_727);
    if (!(_1227 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1227 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1236 = _1220;
        _1237 = _1221;
        _1238 = _1222;
      } else {
        _1236 = 0.0f;
        _1237 = 0.0f;
        _1238 = 0.0f;
      }
    } else {
      _1236 = 0.0f;
      _1237 = 0.0f;
      _1238 = 0.0f;
    }
  } else {
    _1236 = _1220;
    _1237 = _1221;
    _1238 = _1222;
  }
  _1248 = exp2(log2(_1236 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1249 = exp2(log2(_1237 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1250 = exp2(log2(_1238 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1248 * 18.6875f) + 1.0f)) * ((_1248 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1249 * 18.6875f) + 1.0f)) * ((_1249 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1250 * 18.6875f) + 1.0f)) * ((_1250 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _740;
  return SV_Target;
}