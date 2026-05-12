#include "../tonemap.hlsli"

struct PostProcessTransition_CDStruct {
  uint _chapterNoiseTex;
  uint _chapterCardTex;
  uint _lensDirtTex;
  float _chapterTransition;
  uint _sceneTintColor;
  uint _chapterCardColor;
  uint _chapterBackgroundColor;
};


Texture2D<float4> __0__7__0__0__g_bindlessTextures[] : register(t0, space7);

Texture2D<float4> __3__36__0__0__g_postProcessSizeColor : register(t36, space36);

Texture2D<float4> __3__36__0__0__g_sceneColor : register(t28, space36);

Texture2D<uint2> __3__36__0__0__g_stencil : register(t29, space36);

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

cbuffer __3__1__0__0__PostProcessMaterialIndex : register(b2, space1) {
  int _materialIndex : packoffset(c000.x);
  int _passIndex : packoffset(c000.y);
};

struct BindlessParameters_PostProcessTransition_CD {
  PostProcessTransition_CDStruct BindlessParameters_PostProcessTransition_CD;
};

typedef BindlessParameters_PostProcessTransition_CD BindlessParameters_PostProcessTransition_CD_t;
ConstantBuffer<BindlessParameters_PostProcessTransition_CD_t> BindlessParameters_PostProcessTransition_CD[] : register(b0, space100);

SamplerState __0__4__0__0__g_staticBilinearWrap : register(s0, space4);

SamplerState __0__4__0__0__g_staticBilinearClamp : register(s3, space4);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  precise noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) : SV_Target {
  float4 SV_Target;
  float _24;
  float4 _27;
  float _37;
  float _38;
  float _39;
  float _61;
  float _62;
  float _63;
  int _67;
  float _75;
  bool _76;
  float _77;
  float _79;
  float _178;
  float _251;
  float _324;
  float _603;
  float _686;
  float _925;
  float _926;
  float _927;
  float _993;
  float _994;
  float _995;
  float _1009;
  float _1214;
  float _1215;
  float _1216;
  float _1309;
  float _1310;
  float _1311;
  float _1431;
  float _1432;
  float _1433;
  float _1454;
  float _1455;
  float _1456;
  float _1489;
  float _1490;
  float _1491;
  float _1505;
  float _1506;
  float _1507;
  float _82;
  int _90;
  int _98;
  float4 _105;
  float _109;
  float _111;
  float _113;
  float _114;
  float _116;
  float _120;
  float _121;
  float _123;
  float _124;
  float _125;
  float _126;
  float _127;
  float _137;
  float _138;
  float _139;
  float _149;
  float _150;
  float _153;
  float _165;
  float _166;
  float _187;
  float _188;
  float _189;
  float _191;
  float _193;
  float _197;
  float _198;
  float _199;
  float _200;
  float _210;
  float _211;
  float _212;
  float _222;
  float _223;
  float _226;
  float _238;
  float _239;
  float _260;
  float _261;
  float _262;
  float _264;
  float _266;
  float _270;
  float _271;
  float _272;
  float _273;
  float _283;
  float _284;
  float _285;
  float _295;
  float _296;
  float _299;
  float _311;
  float _312;
  float _333;
  float _334;
  float _335;
  int _336;
  int _344;
  float _347;
  float _350;
  float _352;
  float _377;
  float _378;
  float _379;
  int _380;
  int _388;
  float _391;
  float _394;
  float _396;
  float _421;
  float _422;
  float _423;
  int _424;
  int _432;
  float _435;
  float _438;
  float _440;
  float _465;
  float _466;
  float _467;
  float4 _472;
  float _482;
  float _483;
  float _484;
  float _509;
  float _510;
  float _511;
  float _530;
  float _538;
  float _540;
  float _541;
  float _542;
  float _552;
  float _553;
  float _554;
  float _563;
  float _564;
  float _571;
  bool _573;
  float _576;
  float _590;
  float _591;
  float _612;
  float _613;
  float _616;
  float _620;
  float _621;
  float _622;
  float _624;
  float _625;
  float _635;
  float _636;
  float _637;
  float _646;
  float _647;
  float _654;
  bool _656;
  float _659;
  float _673;
  float _674;
  float _695;
  float _696;
  float _699;
  float _707;
  float _714;
  float _715;
  float _716;
  float _717;
  float _720;
  float _724;
  float _731;
  float _735;
  float _736;
  float _737;
  float _740;
  float _743;
  float _747;
  float _748;
  float _750;
  float _751;
  float _760;
  float _761;
  float _764;
  float _770;
  float _771;
  float _773;
  float _774;
  float _776;
  float _779;
  int _782;
  int _790;
  float4 _797;
  int _799;
  int _807;
  float _816;
  float _817;
  float _823;
  float _828;
  float _842;
  float _844;
  float _851;
  float _852;
  float _853;
  float _854;
  float _864;
  float _866;
  int _870;
  int _878;
  float4 _885;
  float _898;
  float _905;
  float _920;
  float _943;
  float _944;
  float _945;
  float _946;
  float _959;
  float _960;
  float _961;
  float _962;
  float _967;
  float _977;
  float _978;
  float _979;
  float _982;
  uint _996;
  float _1018;
  float _1067;
  float _1068;
  float _1069;
  float _1071;
  float _1078;
  float _1079;
  float _1080;
  float _1099;
  float _1100;
  float _1101;
  float _1102;
  float _1103;
  float _1104;
  float _1105;
  float _1106;
  float _1107;
  float _1153;
  float _1154;
  float _1155;
  float _1156;
  float _1157;
  float _1158;
  float _1159;
  float _1176;
  float _1177;
  float _1178;
  float _1179;
  float _1185;
  float _1188;
  float _1195;
  float _1196;
  float _1197;
  float _1226;
  float _1251;
  float _1252;
  float _1253;
  float _1272;
  float _1273;
  float _1274;
  float _1280;
  float _1284;
  float _1285;
  float _1286;
  float _1287;
  float _1292;
  float _1317;
  float _1321;
  float _1322;
  float _1323;
  float _1324;
  int _1365;
  float _1420;
  float _1444;
  float _1445;
  float _1449;
  float _1496;
  float _1517;
  float _1518;
  float _1519;
  float _18[36];
  _24 = asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].x) / asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y);
  _27 = __3__36__0__0__g_sceneColor.Sample(__0__4__0__0__g_staticBilinearClamp, float2(TEXCOORD.x, TEXCOORD.y));
  _37 = (pow(_27.x, 0.012683313339948654f));
  _38 = (pow(_27.y, 0.012683313339948654f));
  _39 = (pow(_27.z, 0.012683313339948654f));
  _61 = exp2(log2(max(0.0f, (_37 + -0.8359375f)) / (18.8515625f - (_37 * 18.6875f))) * 6.277394771575928f);
  _62 = exp2(log2(max(0.0f, (_38 + -0.8359375f)) / (18.8515625f - (_38 * 18.6875f))) * 6.277394771575928f);
  _63 = exp2(log2(max(0.0f, (_39 + -0.8359375f)) / (18.8515625f - (_39 * 18.6875f))) * 6.277394771575928f);
  _67 = WaveReadLaneFirst(_materialIndex);
  _75 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_67 < (uint)170000), _67, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterTransition);
  _76 = (_75 > 0.5f);
  _77 = _75 * 2.0f;
  _79 = select(_76, (2.0f - _77), _77);
  if (_79 > 0.0f) {
    _82 = _24 * TEXCOORD.x;
    _90 = WaveReadLaneFirst(_materialIndex);
    _98 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_90 < (uint)170000), _90, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterNoiseTex);
    _105 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_98 < (uint)65000), _98, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(((_82 * 4.0f) - ((_79 * TEXCOORD.x) * rsqrt(TEXCOORD.x * TEXCOORD.x))), (TEXCOORD.y * 4.0f)));
    _109 = (_105.x * 0.009999999776482582f) + -0.004980391822755337f;
    _111 = (_105.y * 0.009999999776482582f) + -0.004980391822755337f;
    _113 = (_105.y * 0.03999999910593033f) + -0.019921567291021347f;
    _114 = saturate(_79);
    _116 = saturate(_114 * 2.0f);
    _120 = TEXCOORD.x + -0.5f;
    _121 = select(_76, -1.0f, 1.0f) + _120;
    _123 = TEXCOORD.y + -0.5f;
    _124 = (_109 * _116) + _123;
    _125 = ((_113 * _116) + _121) * _24;
    _126 = _125 * 32.0f;
    _127 = _124 * 32.0f;
    _137 = frac(sin(dot(float2((ceil(_126 + 0.5f) * 0.125f), (ceil(_127 + 0.5f) * 0.125f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    _138 = round(_126);
    _139 = round(_127);
    _149 = saturate(((0.25f - (_114 * 3.0f)) + (sqrt((_139 * _139) + (_138 * _138)) * 0.03125f)) * 0.800000011920929f);
    _150 = 1.0f - _149;
    if (!(_150 < 0.0010000000474974513f)) {
      _153 = _150 * -9.6875f;
      _165 = _149 * 0.1666666716337204f;
      _166 = _150 * 0.3125f;
      _178 = float((bool)((uint)((abs((_166 * ((_125 * (_153 + 32.0f)) - _138)) * (1.0f - frac(_137 * 7.0f))) < _165) && (abs((_166 * ((_124 * (_153 + 32.0f)) - _139)) * frac(_137 * 3.0f)) < _165))));
    } else {
      _178 = 1.0f;
    }
    _187 = saturate(1.0f - abs((saturate(_150 - ((_137 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    _188 = _187 * _187;
    _189 = _188 * _188;
    _191 = saturate(_79 + -0.0833333358168602f);
    _193 = saturate(_191 * 2.0f);
    _197 = (_193 * _109) + _123;
    _198 = ((_193 * _113) + _121) * _24;
    _199 = _198 * 16.0f;
    _200 = _197 * 16.0f;
    _210 = frac(sin(dot(float2((ceil(_199 + 0.5f) * 0.25f), (ceil(_200 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    _211 = round(_199);
    _212 = round(_200);
    _222 = saturate(((0.25f - (_191 * 3.0f)) + (sqrt((_212 * _212) + (_211 * _211)) * 0.0625f)) * 0.800000011920929f);
    _223 = 1.0f - _222;
    if (!(_223 < 0.0010000000474974513f)) {
      _226 = _223 * -4.6875f;
      _238 = _222 * 0.1666666716337204f;
      _239 = _223 * 0.3125f;
      _251 = float((bool)((uint)((abs((_239 * ((_198 * (_226 + 16.0f)) - _211)) * (1.0f - frac(_210 * 7.0f))) < _238) && (abs((_239 * ((_197 * (_226 + 16.0f)) - _212)) * frac(_210 * 3.0f)) < _238))));
    } else {
      _251 = 1.0f;
    }
    _260 = saturate(1.0f - abs((saturate(_223 - ((_210 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    _261 = _260 * _260;
    _262 = _261 * _261;
    _264 = saturate(_79 + -0.1666666716337204f);
    _266 = saturate(_264 * 2.0f);
    _270 = (_266 * _109) + _123;
    _271 = ((_266 * _113) + _121) * _24;
    _272 = _271 * 10.666666984558105f;
    _273 = _270 * 10.666666984558105f;
    _283 = frac(sin(dot(float2((ceil(_272 + 0.5f) * 0.375f), (ceil(_273 + 0.5f) * 0.375f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
    _284 = round(_272);
    _285 = round(_273);
    _295 = saturate(((0.25f - (_264 * 3.0f)) + (sqrt((_285 * _285) + (_284 * _284)) * 0.09375f)) * 0.800000011920929f);
    _296 = 1.0f - _295;
    if (!(_296 < 0.0010000000474974513f)) {
      _299 = _296 * -3.0208334922790527f;
      _311 = _295 * 0.1666666716337204f;
      _312 = _296 * 0.3125f;
      _324 = float((bool)((uint)((abs((_312 * ((_271 * (_299 + 10.666666984558105f)) - _284)) * (1.0f - frac(_283 * 7.0f))) < _311) && (abs((_312 * ((_270 * (_299 + 10.666666984558105f)) - _285)) * frac(_283 * 3.0f)) < _311))));
    } else {
      _324 = 1.0f;
    }
    _333 = saturate(1.0f - abs((saturate(_296 - ((_283 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
    _334 = _333 * _333;
    _335 = _334 * _334;
    _336 = WaveReadLaneFirst(_materialIndex);
    _344 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_336 < (uint)170000), _336, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterBackgroundColor);
    _347 = float((uint)((uint)(((uint)(_344) >> 16) & 255)));
    _350 = float((uint)((uint)(((uint)(_344) >> 8) & 255)));
    _352 = float((uint)((uint)(_344 & 255)));
    _377 = select(((_347 * 0.003921568859368563f) < 0.040449999272823334f), (_347 * 0.0003035269910469651f), exp2(log2((_347 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _378 = select(((_350 * 0.003921568859368563f) < 0.040449999272823334f), (_350 * 0.0003035269910469651f), exp2(log2((_350 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _379 = select(((_352 * 0.003921568859368563f) < 0.040449999272823334f), (_352 * 0.0003035269910469651f), exp2(log2((_352 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _380 = WaveReadLaneFirst(_materialIndex);
    _388 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_380 < (uint)170000), _380, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterCardColor);
    _391 = float((uint)((uint)(((uint)(_388) >> 16) & 255)));
    _394 = float((uint)((uint)(((uint)(_388) >> 8) & 255)));
    _396 = float((uint)((uint)(_388 & 255)));
    _421 = select(((_391 * 0.003921568859368563f) < 0.040449999272823334f), (_391 * 0.0003035269910469651f), exp2(log2((_391 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _422 = select(((_394 * 0.003921568859368563f) < 0.040449999272823334f), (_394 * 0.0003035269910469651f), exp2(log2((_394 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _423 = select(((_396 * 0.003921568859368563f) < 0.040449999272823334f), (_396 * 0.0003035269910469651f), exp2(log2((_396 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _424 = WaveReadLaneFirst(_materialIndex);
    _432 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_424 < (uint)170000), _424, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._sceneTintColor);
    _435 = float((uint)((uint)(((uint)(_432) >> 16) & 255)));
    _438 = float((uint)((uint)(((uint)(_432) >> 8) & 255)));
    _440 = float((uint)((uint)(_432 & 255)));
    _465 = select(((_435 * 0.003921568859368563f) < 0.040449999272823334f), (_435 * 0.0003035269910469651f), exp2(log2((_435 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _466 = select(((_438 * 0.003921568859368563f) < 0.040449999272823334f), (_438 * 0.0003035269910469651f), exp2(log2((_438 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _467 = select(((_440 * 0.003921568859368563f) < 0.040449999272823334f), (_440 * 0.0003035269910469651f), exp2(log2((_440 * 0.0037171270232647657f) + 0.052132703363895416f) * 2.4000000953674316f));
    _472 = __3__36__0__0__g_postProcessSizeColor.Sample(__0__4__0__0__g_staticBilinearWrap, float2((_109 + TEXCOORD.x), (_111 + TEXCOORD.y)));
    _482 = (pow(_472.x, 0.012683313339948654f));
    _483 = (pow(_472.y, 0.012683313339948654f));
    _484 = (pow(_472.z, 0.012683313339948654f));
    _509 = exp2(log2(max(0.0f, (_482 + -0.8359375f)) / (18.8515625f - (_482 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _510 = exp2(log2(max(0.0f, (_483 + -0.8359375f)) / (18.8515625f - (_483 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    _511 = exp2(log2(max(0.0f, (_484 + -0.8359375f)) / (18.8515625f - (_484 * 18.6875f))) * 6.277394771575928f) * 10000.0f;
    if (_79 > 0.20000000298023224f) {
      _530 = _24 * _120;
      _538 = ((((0.5f - TEXCOORD.y) + _530) * 0.7071067690849304f) + _113) + _109;
      _540 = (((_530 + _123) * 0.7071067690849304f) + _109) + _111;
      _541 = _538 * 16.0f;
      _542 = _540 * 16.0f;
      _552 = frac(sin(dot(float2((ceil(_541 + 0.5f) * 0.25f), (ceil(_542 + 0.5f) * 0.25f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      _553 = round(_541);
      _554 = round(_542);
      _563 = saturate(((0.800000011920929f - (_79 * 0.800000011920929f)) + (sqrt((_554 * _554) + (_553 * _553)) * 0.0625f)) * 1.25f);
      _564 = 1.0f - _563;
      if (!(_564 < 0.0010000000474974513f)) {
        _571 = sin((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _552) + 0.800000011920929f);
        _573 = (frac(_552) > 0.5f);
        _576 = _564 * -3.0f;
        _590 = _563 * 0.1666666716337204f;
        _591 = _564 * 0.20000000298023224f;
        _603 = float((bool)((uint)((abs(((1.0f - frac(_552 * 7.0f)) * _591) * (((_538 * (_576 + 16.0f)) - _553) + select(_573, _571, 0.0f))) < _590) && (abs((frac(_552 * 3.0f) * _591) * (((_540 * (_576 + 16.0f)) - _554) + select(_573, 0.0f, _571))) < _590))));
      } else {
        _603 = 1.0f;
      }
      _612 = saturate(1.0f - abs((saturate(_564 - ((_552 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      _613 = _612 * _612;
      _616 = (_603 * 0.2999999523162842f) * (_613 * _613);
      _620 = (_616 * _377) + _377;
      _621 = (_616 * _378) + _378;
      _622 = (_616 * _379) + _379;
      _624 = _538 * 8.0f;
      _625 = _540 * 8.0f;
      _635 = frac(sin(dot(float2((ceil(_624 + 0.5f) * 0.5f), (ceil(_625 + 0.5f) * 0.5f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.546875f);
      _636 = round(_624);
      _637 = round(_625);
      _646 = saturate(((1.25f - (_79 * 1.4249999523162842f)) + (sqrt((_637 * _637) + (_636 * _636)) * 0.125f)) * 0.800000011920929f);
      _647 = 1.0f - _646;
      if (!(_647 < 0.0010000000474974513f)) {
        _654 = sin((asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * _635) + 1.25f);
        _656 = (frac(_635) > 0.5f);
        _659 = _647 * -2.1875f;
        _673 = _646 * 0.1666666716337204f;
        _674 = _647 * 0.3125f;
        _686 = float((bool)((uint)((abs(((1.0f - frac(_635 * 7.0f)) * _674) * (((_538 * (_659 + 8.0f)) - _636) + select(_656, _654, 0.0f))) < _673) && (abs((frac(_635 * 3.0f) * _674) * (((_540 * (_659 + 8.0f)) - _637) + select(_656, 0.0f, _654))) < _673))));
      } else {
        _686 = 1.0f;
      }
      _695 = saturate(1.0f - abs((saturate(_647 - ((_635 + -0.5f) * 0.125f)) * 3.0f) + -2.0f));
      _696 = _695 * _695;
      _699 = (_686 * 0.6000000238418579f) * (_696 * _696);
      _707 = _123 * _123;
      _714 = 1.0f - (exp2(log2(sqrt((_530 * _530) + _707)) * 1.5f) * 0.75f);
      _715 = ((_699 * _620) + _620) * _714;
      _716 = ((_699 * _621) + _621) * _714;
      _717 = ((_699 * _622) + _622) * _714;
      _720 = saturate((_79 + -0.5f) * 2.0f);
      _724 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.015707964077591896f) + 0.7853981852531433f;
      _731 = saturate((exp2(log2(1.0f - _720) * 2.5f) + -0.05000000074505806f) * 1.1111111640930176f);
      _735 = (_731 * _731) * (3.0f - (_731 * 2.0f));
      _736 = _735 * 0.5f;
      _737 = 1.0f - _736;
      _740 = _735 * -0.25f;
      _743 = (_24 + -1.0f) * 0.5f;
      _747 = ((-0.5f - _740) + (_737 * _82)) - (_737 * _743);
      _748 = cos(_724);
      _750 = ((_737 * TEXCOORD.y) - _740) + -0.5f;
      _751 = sin(_724);
      _760 = (asfloat(__3__35__0__0__SceneConstantBuffer_raw[0u].x) * 0.03141592815518379f) + 1.5707963705062866f;
      _761 = 0.6000000238418579f - _736;
      _764 = _735 * 0.25f;
      _770 = ((_764 + -0.30000001192092896f) + (_761 * _82)) - (_761 * _743);
      _771 = cos(_760);
      _773 = ((_761 * TEXCOORD.y) - (-0.20000000298023224f - _764)) + -0.5f;
      _774 = sin(_760);
      _776 = (_770 * _771) - (_773 * _774);
      _779 = (_770 * _774) + (_773 * _771);
      _782 = WaveReadLaneFirst(_materialIndex);
      _790 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_782 < (uint)170000), _782, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterCardTex);
      _797 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_790 < (uint)65000), _790, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2(((0.5f - (_750 * _751)) + (_747 * _748)), (((_750 * _748) + 0.5f) + (_747 * _751))));
      _799 = WaveReadLaneFirst(_materialIndex);
      _807 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_799 < (uint)170000), _799, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._chapterCardTex);
      _816 = abs(_776);
      _817 = _816 * 120.0f;
      _823 = abs(_779);
      _828 = _823 * 120.0f;
      _842 = saturate((saturate(((saturate(_828 + -56.0f) * saturate(60.0f - _828)) * saturate(10.0f - (_816 * 20.0f))) + ((saturate(_817 + -54.0f) * saturate(58.0f - _817)) * saturate(10.0f - (_823 * 20.0f)))) * 0.5f) + (((float4)(__0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_807 < (uint)65000), _807, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearClamp, float2((_776 + 0.5f), (_779 + 0.5f))))).x));
      _844 = (_797.x * _797.x) * _720;
      _851 = (_844 * (_421 - _715)) + _715;
      _852 = (_844 * (_422 - _716)) + _716;
      _853 = (_844 * (_423 - _717)) + _717;
      _854 = _842 * _720;
      _864 = abs(_120);
      _866 = 1.0f - (_864 * 0.800000011920929f);
      _870 = WaveReadLaneFirst(_materialIndex);
      _878 = WaveReadLaneFirst(BindlessParameters_PostProcessTransition_CD[((int)((uint)(select(((uint)_870 < (uint)170000), _870, 0)) + 0u))].BindlessParameters_PostProcessTransition_CD._lensDirtTex);
      _885 = __0__7__0__0__g_bindlessTextures[((int)((uint)(select(((uint)_878 < (uint)65000), _878, 0)) + 0u))].Sample(__0__4__0__0__g_staticBilinearWrap, float2(_82, TEXCOORD.y));
      _898 = saturate(_864 * 2.0f) * exp2(log2(saturate(sqrt(_707 + (_120 * _120)))) * 6.0f);
      _905 = saturate(((_686 + _603) + _797.x) + _842);
      _920 = max(0.0010000000474974513f, _exposure0.x);
      _925 = ((((((((_854 * (_421 - _851)) + _851) * _866) - _377) + (_898 * _885.x)) * _905) + _377) / _920);
      _926 = ((((((((_854 * (_422 - _852)) + _852) * _866) - _378) + (_898 * _885.y)) * _905) + _378) / _920);
      _927 = ((((((((_854 * (_423 - _853)) + _853) * _866) - _379) + (_898 * _885.z)) * _905) + _379) / _920);
    } else {
      _925 = _377;
      _926 = _378;
      _927 = _379;
    }
    _943 = 1.0f - ((_335 * _335) * (_324 * 0.5f));
    _944 = ((((_509 * _465) - _925) * _324) + _925) * _943;
    _945 = ((((_510 * _466) - _926) * _324) + _926) * _943;
    _946 = ((((_511 * _467) - _927) * _324) + _927) * _943;
    _959 = 1.0f - ((_262 * _262) * (_251 * 0.5f));
    _960 = ((((_509 * (((_465 + -1.0f) * 0.5f) + 1.0f)) - _944) * _251) + _944) * _959;
    _961 = ((((_510 * (((_466 + -1.0f) * 0.5f) + 1.0f)) - _945) * _251) + _945) * _959;
    _962 = ((((_511 * (((_467 + -1.0f) * 0.5f) + 1.0f)) - _946) * _251) + _946) * _959;
    _967 = ((saturate(_79 * 4.0f) * 10000.0f) + 10000.0f) * (1.0f - ((_189 * _189) * (_178 * 0.5f)));
    _977 = (((_967 * _61) - _960) * _178) + _960;
    _978 = (((_967 * _62) - _961) * _178) + _961;
    _979 = (((_967 * _63) - _962) * _178) + _962;
    _982 = saturate((_79 * 15.0f) + -14.0f);
    _993 = (lerp(_977, _925, _982));
    _994 = (lerp(_978, _926, _982));
    _995 = (lerp(_979, _927, _982));
  } else {
    _993 = (_61 * 10000.0f);
    _994 = (_62 * 10000.0f);
    _995 = (_63 * 10000.0f);
  }
  _996 = uint(SV_Position.y);
  if (_etcParams.y == 1.0f) {
    _1009 = (float((uint)((uint)((((uint2)(__3__36__0__0__g_stencil.Load(int3((int)(uint(SV_Position.x)), _996, 0)))).x) & 127))) + 0.5f);
  } else {
    _1009 = 1.0f;
  }
  if (_localToneMappingParams.w > 0.0f) {
    float3 output_color = TonemapReplacer(float3(_993, _994, _995));
    _1431 = output_color.x;
    _1432 = output_color.y;
    _1433 = output_color.z;
  } else {
    _1431 = _993;
    _1432 = _994;
    _1433 = _995;
  }
  if (_etcParams.y > 1.0f) {
    _1444 = abs((TEXCOORD.x * 2.0f) + -1.0f);
    _1445 = abs((TEXCOORD.y * 2.0f) + -1.0f);
    _1449 = saturate(1.0f - (dot(float2(_1444, _1445), float2(_1444, _1445)) * saturate(_etcParams.y + -1.0f)));
    _1454 = (_1449 * _1431);
    _1455 = (_1449 * _1432);
    _1456 = (_1449 * _1433);
  } else {
    _1454 = _1431;
    _1455 = _1432;
    _1456 = _1433;
  }
  if ((_localToneMappingParams.w > 0.0f) && (_etcParams.z > 0.0f)) {
    _1489 = select((_1454 <= 0.0031308000907301903f), (_1454 * 12.920000076293945f), (((pow(_1454, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1490 = select((_1455 <= 0.0031308000907301903f), (_1455 * 12.920000076293945f), (((pow(_1455, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1491 = select((_1456 <= 0.0031308000907301903f), (_1456 * 12.920000076293945f), (((pow(_1456, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
  } else {
    _1489 = _1454;
    _1490 = _1455;
    _1491 = _1456;
  }
  if (!(_etcParams.y < 1.0f)) {
    _1496 = float((uint)_996);
    if (!(_1496 < asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
      if (_1496 < (asfloat(__3__35__0__0__SceneConstantBuffer_raw[3u].y) - asfloat(__3__35__0__0__SceneConstantBuffer_raw[9u].w))) {
        _1505 = _1489;
        _1506 = _1490;
        _1507 = _1491;
      } else {
        _1505 = 0.0f;
        _1506 = 0.0f;
        _1507 = 0.0f;
      }
    } else {
      _1505 = 0.0f;
      _1506 = 0.0f;
      _1507 = 0.0f;
    }
  } else {
    _1505 = _1489;
    _1506 = _1490;
    _1507 = _1491;
  }
  _1517 = exp2(log2(_1505 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1518 = exp2(log2(_1506 * 9.999999747378752e-05f) * 0.1593017578125f);
  _1519 = exp2(log2(_1507 * 9.999999747378752e-05f) * 0.1593017578125f);
  SV_Target.x = exp2(log2((1.0f / ((_1517 * 18.6875f) + 1.0f)) * ((_1517 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.y = exp2(log2((1.0f / ((_1518 * 18.6875f) + 1.0f)) * ((_1518 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.z = exp2(log2((1.0f / ((_1519 * 18.6875f) + 1.0f)) * ((_1519 * 18.8515625f) + 0.8359375f)) * 78.84375f);
  SV_Target.w = _1009;
  return SV_Target;
}