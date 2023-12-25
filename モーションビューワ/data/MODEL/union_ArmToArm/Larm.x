xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 201;
 58.19611;-4.84177;2.51745;,
 57.73560;-1.49443;2.68559;,
 54.80764;-1.92188;3.70806;,
 55.26825;-5.26928;3.53992;,
 52.01097;-2.24365;2.33968;,
 52.47141;-5.59107;2.17154;,
 50.98381;-2.27123;-0.61798;,
 51.44432;-5.61855;-0.78611;,
 52.32780;-1.98843;-3.43233;,
 52.78837;-5.33583;-3.60047;,
 55.25572;-1.56099;-4.45480;,
 55.71630;-4.90828;-4.62293;,
 58.05239;-1.23930;-3.08641;,
 58.51297;-4.58652;-3.25456;,
 59.07959;-1.21162;-0.12877;,
 59.54010;-4.55900;-0.29690;,
 55.49225;-5.08879;-0.54151;,
 55.03172;-1.74145;-0.37337;,
 51.42366;-6.04071;6.15483;,
 50.55687;3.89288;7.43745;,
 43.89050;3.80747;5.93562;,
 44.75721;-6.12595;4.65300;,
 37.22399;3.72210;4.43378;,
 38.09080;-6.21138;3.15117;,
 37.07415;4.01943;-4.29833;,
 37.94096;-5.91412;-5.58094;,
 37.29530;3.85527;-7.94308;,
 38.16206;-6.07821;-9.22572;,
 43.92929;4.00511;-8.33309;,
 44.79601;-5.92840;-9.61572;,
 50.59576;4.09050;-6.83126;,
 51.46244;-5.84299;-8.11388;,
 52.34491;4.21495;-0.85809;,
 53.21157;-5.71848;-2.14072;,
 51.62426;4.47329;-1.31566;,
 50.07599;4.30126;-5.78812;,
 44.01417;4.22365;-7.15370;,
 43.80051;4.37302;-3.07824;,
 49.99847;4.18032;6.22749;,
 43.93671;4.10267;4.86186;,
 37.98182;4.08731;-6.79907;,
 37.73872;4.29537;-4.44387;,
 37.87495;4.02498;3.49625;,
 50.98736;-6.14367;-7.13677;,
 52.53568;-5.97168;-2.66433;,
 44.71191;-6.07189;-4.42691;,
 44.92556;-6.22135;-8.50238;,
 50.90988;-6.26459;4.87880;,
 44.84810;-6.34224;3.51318;,
 38.65004;-6.14960;-5.79252;,
 38.89332;-6.35752;-8.14773;,
 38.78628;-6.41987;2.14757;,
 36.46843;-5.67310;3.44173;,
 36.19892;4.32615;4.44740;,
 29.38824;4.38665;5.00850;,
 29.65765;-5.61272;4.00283;,
 22.57753;4.44708;5.56960;,
 22.84702;-5.55223;4.56394;,
 19.82536;4.39533;-2.72398;,
 20.09491;-5.60404;-3.72964;,
 18.94213;4.07707;-6.25650;,
 19.21164;-5.92228;-7.26219;,
 25.15659;4.00547;-8.61445;,
 25.42608;-5.99392;-9.62012;,
 31.96730;3.94499;-9.17554;,
 32.23675;-6.05429;-10.18121;,
 35.42652;4.25684;-4.00926;,
 35.69601;-5.74240;-5.01494;,
 34.60667;4.51862;-4.24285;,
 31.78751;4.21377;-8.03619;,
 25.59456;4.26882;-7.52594;,
 26.61346;4.58950;-3.58435;,
 35.30901;4.58168;3.44680;,
 29.11598;4.63655;3.95700;,
 19.94368;4.33382;-5.38188;,
 20.42053;4.64453;-3.07415;,
 22.92307;4.69154;4.46721;,
 32.07085;-6.30041;-9.09364;,
 34.88998;-5.99552;-5.30032;,
 26.89678;-5.92463;-4.64181;,
 25.87780;-6.24542;-8.58342;,
 35.59233;-5.93248;2.38932;,
 29.39932;-5.87751;2.89953;,
 20.70389;-5.86967;-4.13159;,
 20.22703;-6.18029;-6.43933;,
 23.20637;-5.82266;3.40975;,
 57.46103;1.06333;3.16560;,
 57.00054;4.41071;3.33374;,
 54.07253;3.98315;4.35620;,
 54.53310;0.63585;4.18807;,
 51.27590;3.66137;2.98782;,
 51.73645;0.31408;2.81969;,
 50.24868;3.63392;0.03018;,
 50.70925;0.28654;-0.13795;,
 51.59275;3.91668;-2.78418;,
 52.05328;0.56927;-2.95232;,
 54.52061;4.34412;-3.80664;,
 54.98116;0.99676;-3.97478;,
 57.31737;4.66585;-2.43826;,
 57.77788;1.31853;-2.60640;,
 58.34450;4.69347;0.51937;,
 58.80505;1.34611;0.35124;,
 54.75716;0.81629;0.10664;,
 54.29661;4.16370;0.27478;,
 35.10279;-4.20746;2.38892;,
 38.13999;-4.04766;2.19685;,
 38.05267;-1.10624;3.26349;,
 35.01553;-1.26600;3.45557;,
 37.82028;1.72142;1.94161;,
 34.78310;1.56164;2.13367;,
 37.57900;2.77897;-0.99448;,
 34.54182;2.61915;-0.80240;,
 37.47004;1.44691;-3.82483;,
 34.43287;1.28704;-3.63275;,
 37.55735;-1.49454;-4.89147;,
 34.52015;-1.65432;-4.69940;,
 37.78976;-4.32219;-3.56959;,
 34.75254;-4.48198;-3.37751;,
 38.03110;-5.37977;-0.63351;,
 34.99390;-5.53953;-0.44143;,
 34.76780;-1.46017;-0.62191;,
 37.80499;-1.30041;-0.81399;,
 5.31282;-12.91725;7.44897;,
 5.42356;12.24989;9.49411;,
 3.81273;13.01775;0.03690;,
 3.70199;-12.14937;-2.00820;,
 2.20194;13.78565;-9.42033;,
 2.09120;-11.38155;-11.46544;,
 9.60793;13.87722;-9.75276;,
 9.49717;-11.29000;-11.79791;,
 19.78138;13.45858;-10.31946;,
 19.67062;-11.70856;-12.36446;,
 19.78140;13.45861;-10.31947;,
 22.99675;12.71055;-0.93417;,
 22.88595;-12.45667;-2.97923;,
 22.88595;-12.45667;-2.97922;,
 24.60762;11.94277;8.52302;,
 24.49678;-13.22447;6.47788;,
 13.29781;12.11830;11.91061;,
 13.18703;-13.04884;9.86551;,
 13.41719;12.84960;10.96810;,
 23.53008;12.63842;7.88548;,
 22.06535;13.33656;-0.71401;,
 11.52664;13.75069;-0.13105;,
 6.25708;12.96921;8.77081;,
 4.79233;13.66735;0.17132;,
 19.14162;14.01678;-9.24798;,
 10.06189;14.44893;-8.73042;,
 3.32766;14.36558;-8.42817;,
 23.41366;-13.82463;5.73508;,
 13.30057;-13.61341;8.81774;,
 11.41012;-12.71240;-2.28134;,
 21.94895;-13.12645;-2.86441;,
 6.14061;-13.49379;6.62041;,
 4.67588;-12.79560;-1.97908;,
 9.94539;-12.01412;-10.88082;,
 19.02514;-12.44635;-11.39830;,
 3.21114;-12.09736;-10.57857;,
 5.66313;-5.24204;6.80791;,
 5.33796;4.74707;7.79927;,
 1.66355;4.92815;8.53775;,
 1.98866;-5.06104;7.54636;,
 -2.01097;5.10914;9.27620;,
 -1.84837;0.11456;8.78052;,
 -1.68577;-4.88003;8.28484;,
 -3.65175;5.09327;1.03830;,
 -3.48593;0.00000;0.53283;,
 -3.46994;4.84470;-2.40354;,
 -3.30734;-0.14988;-2.89923;,
 0.17420;-5.32888;-5.91815;,
 -3.14474;-5.14446;-3.39493;,
 -0.15093;4.66030;-4.92678;,
 3.52350;4.47926;-5.66524;,
 3.84865;-5.50989;-6.65661;,
 4.76530;4.67869;-0.65326;,
 5.09043;-5.31055;-1.64463;,
 4.31240;4.95401;-0.86665;,
 3.44194;4.75254;-4.51968;,
 0.10077;4.91711;-3.84817;,
 0.00000;5.16649;0.00000;,
 4.83301;5.01623;6.81925;,
 1.49183;5.18084;7.49071;,
 -2.91718;5.08484;-1.55380;,
 -3.34122;5.33110;0.67147;,
 -1.84931;5.34548;8.16220;,
 3.78387;-5.75098;-5.56210;,
 4.65418;-5.54935;-1.90907;,
 0.34185;-5.33709;-1.04242;,
 0.44270;-5.58634;-4.89061;,
 5.17492;-5.48725;5.77681;,
 1.83378;-5.32267;6.44828;,
 -2.99931;-5.17237;-0.37093;,
 -2.57528;-5.41866;-2.59621;,
 -1.50742;-5.15804;7.11977;,
 -3.32655;-4.89588;0.04694;,
 22.88595;-12.45667;-2.97923;,
 22.88595;-12.45667;-2.97922;,
 22.88595;-12.45667;-2.97923;,
 19.78140;13.45861;-10.31947;,
 19.78138;13.45858;-10.31946;,
 19.78140;13.45861;-10.31947;;
 
 210;
 4;0,1,2,3;,
 4;3,2,4,5;,
 4;5,4,6,7;,
 4;7,6,8,9;,
 4;9,8,10,11;,
 4;11,10,12,13;,
 4;13,12,14,15;,
 4;15,14,1,0;,
 3;3,16,0;,
 3;5,16,3;,
 3;7,16,5;,
 3;9,16,7;,
 3;11,16,9;,
 3;13,16,11;,
 3;15,16,13;,
 3;0,16,15;,
 3;1,17,2;,
 3;2,17,4;,
 3;4,17,6;,
 3;6,17,8;,
 3;8,17,10;,
 3;10,17,12;,
 3;12,17,14;,
 3;14,17,1;,
 4;18,19,20,21;,
 4;21,20,22,23;,
 4;23,22,24,25;,
 4;25,24,26,27;,
 4;27,26,28,29;,
 4;29,28,30,31;,
 4;31,30,32,33;,
 4;33,32,19,18;,
 4;34,35,36,37;,
 4;38,34,37,39;,
 4;37,36,40,41;,
 4;39,37,41,42;,
 4;43,44,45,46;,
 4;44,47,48,45;,
 4;46,45,49,50;,
 4;45,48,51,49;,
 4;32,30,35,34;,
 4;30,28,36,35;,
 4;19,32,34,38;,
 4;20,19,38,39;,
 4;28,26,40,36;,
 4;26,24,41,40;,
 4;24,22,42,41;,
 4;22,20,39,42;,
 4;31,33,44,43;,
 4;29,31,43,46;,
 4;33,18,47,44;,
 4;18,21,48,47;,
 4;25,27,50,49;,
 4;27,29,46,50;,
 4;21,23,51,48;,
 4;23,25,49,51;,
 4;52,53,54,55;,
 4;55,54,56,57;,
 4;57,56,58,59;,
 4;59,58,60,61;,
 4;61,60,62,63;,
 4;63,62,64,65;,
 4;65,64,66,67;,
 4;67,66,53,52;,
 4;68,69,70,71;,
 4;72,68,71,73;,
 4;71,70,74,75;,
 4;73,71,75,76;,
 4;77,78,79,80;,
 4;78,81,82,79;,
 4;80,79,83,84;,
 4;79,82,85,83;,
 4;66,64,69,68;,
 4;64,62,70,69;,
 4;53,66,68,72;,
 4;54,53,72,73;,
 4;62,60,74,70;,
 4;60,58,75,74;,
 4;58,56,76,75;,
 4;56,54,73,76;,
 4;65,67,78,77;,
 4;63,65,77,80;,
 4;67,52,81,78;,
 4;52,55,82,81;,
 4;59,61,84,83;,
 4;61,63,80,84;,
 4;55,57,85,82;,
 4;57,59,83,85;,
 4;86,87,88,89;,
 4;89,88,90,91;,
 4;91,90,92,93;,
 4;93,92,94,95;,
 4;95,94,96,97;,
 4;97,96,98,99;,
 4;99,98,100,101;,
 4;101,100,87,86;,
 3;89,102,86;,
 3;91,102,89;,
 3;93,102,91;,
 3;95,102,93;,
 3;97,102,95;,
 3;99,102,97;,
 3;101,102,99;,
 3;86,102,101;,
 3;87,103,88;,
 3;88,103,90;,
 3;90,103,92;,
 3;92,103,94;,
 3;94,103,96;,
 3;96,103,98;,
 3;98,103,100;,
 3;100,103,87;,
 4;104,105,106,107;,
 4;107,106,108,109;,
 4;109,108,110,111;,
 4;111,110,112,113;,
 4;113,112,114,115;,
 4;115,114,116,117;,
 4;117,116,118,119;,
 4;119,118,105,104;,
 3;107,120,104;,
 3;109,120,107;,
 3;111,120,109;,
 3;113,120,111;,
 3;115,120,113;,
 3;117,120,115;,
 3;119,120,117;,
 3;104,120,119;,
 3;105,121,106;,
 3;106,121,108;,
 3;108,121,110;,
 3;110,121,112;,
 3;112,121,114;,
 3;114,121,116;,
 3;116,121,118;,
 3;118,121,105;,
 4;122,123,124,125;,
 4;125,124,126,127;,
 4;127,126,128,129;,
 4;129,128,130,131;,
 4;131,132,133,134;,
 4;135,133,136,137;,
 4;137,136,138,139;,
 4;139,138,123,122;,
 4;140,141,142,143;,
 4;144,140,143,145;,
 4;143,142,146,147;,
 4;145,143,147,148;,
 4;149,150,151,152;,
 4;150,153,154,151;,
 4;152,151,155,156;,
 4;151,154,157,155;,
 4;138,136,141,140;,
 4;136,133,142,141;,
 4;123,138,140,144;,
 4;124,123,144,145;,
 4;133,130,146,142;,
 4;130,128,147,146;,
 4;128,126,148,147;,
 4;126,124,145,148;,
 4;137,139,150,149;,
 4;135,137,149,152;,
 4;139,122,153,150;,
 4;122,125,154,153;,
 4;129,131,156,155;,
 4;131,135,152,156;,
 4;125,127,157,154;,
 4;127,129,155,157;,
 4;158,159,160,161;,
 3;162,163,160;,
 3;163,164,160;,
 3;160,164,161;,
 4;163,162,165,166;,
 4;166,165,167,168;,
 3;169,170,171;,
 3;171,170,167;,
 3;167,170,168;,
 4;169,171,172,173;,
 4;173,172,174,175;,
 4;175,174,159,158;,
 4;176,177,178,179;,
 4;180,176,179,181;,
 4;179,178,182,183;,
 4;181,179,183,184;,
 4;185,186,187,188;,
 4;186,189,190,187;,
 4;188,187,191,192;,
 4;187,190,193,191;,
 4;174,172,177,176;,
 4;172,171,178,177;,
 4;159,174,176,180;,
 4;160,159,180,181;,
 4;171,167,182,178;,
 4;167,165,183,182;,
 4;165,162,184,183;,
 4;162,160,181,184;,
 4;173,175,186,185;,
 4;169,173,185,188;,
 4;175,158,189,186;,
 4;158,161,190,189;,
 4;194,170,192,191;,
 4;170,169,188,192;,
 4;161,164,193,190;,
 4;164,194,191,193;,
 4;164,163,166,194;,
 4;194,166,168,170;,
 3;131,195,135;,
 3;196,197,133;,
 3;133,198,130;,
 3;199,200,131;;
 
 MeshMaterialList {
  1;
  210;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\union\\ArmToArm\\union_ArmToArm.png";
   }
  }
 }
 MeshNormals {
  269;
  0.662262;0.053573;0.747354;,
  -0.052762;-0.057334;0.996960;,
  -0.736979;-0.134655;0.662368;,
  -0.989278;-0.133076;-0.060169;,
  -0.662258;-0.053579;-0.747358;,
  0.052769;0.057340;-0.996959;,
  0.736975;0.134673;-0.662368;,
  0.989277;0.133084;0.060157;,
  0.131862;-0.990593;-0.036568;,
  -0.131855;0.990595;0.036557;,
  -0.215751;-0.143535;0.965841;,
  -0.215749;-0.143536;0.965841;,
  -0.215748;-0.143536;0.965842;,
  -0.996222;-0.084170;-0.021378;,
  -0.995215;-0.079507;-0.056798;,
  0.078134;0.134369;-0.987846;,
  0.215749;0.143535;-0.965842;,
  0.995179;0.091418;-0.035533;,
  0.110204;0.987155;-0.115669;,
  0.141598;0.989901;-0.006850;,
  -0.004345;0.993223;-0.116141;,
  -0.013649;0.999877;-0.007694;,
  0.063935;0.988997;0.133409;,
  -0.046222;0.987757;0.148997;,
  -0.121667;0.986213;-0.112161;,
  -0.184174;0.982681;-0.020453;,
  -0.158914;0.980758;0.113403;,
  0.162496;-0.980453;-0.110935;,
  0.191698;-0.981319;-0.016287;,
  0.013647;-0.999877;0.007694;,
  0.023174;-0.994135;-0.105636;,
  0.108188;-0.992179;0.062254;,
  -0.004201;-0.997149;0.075335;,
  -0.161020;-0.986905;0.009502;,
  -0.111062;-0.992369;-0.053556;,
  -0.112083;-0.992822;0.041726;,
  0.080855;-0.097584;0.991937;,
  0.080855;-0.097584;0.991938;,
  0.080856;-0.097583;0.991937;,
  -0.958230;-0.054073;0.280840;,
  -0.967790;-0.050884;0.246563;,
  -0.218882;0.091801;-0.971423;,
  -0.080854;0.097584;-0.991938;,
  0.940322;0.059047;-0.335123;,
  0.087736;0.977778;-0.190402;,
  0.150327;0.983948;-0.096168;,
  -0.021576;0.987368;-0.156969;,
  0.002133;0.998689;-0.051138;,
  0.118223;0.991126;0.060764;,
  0.017762;0.993933;0.108547;,
  -0.132453;0.984159;-0.117841;,
  -0.164708;0.986274;-0.011596;,
  -0.100558;0.988989;0.108576;,
  0.104696;-0.988700;-0.107292;,
  0.160881;-0.986638;-0.025729;,
  -0.002130;-0.998689;0.051142;,
  -0.026874;-0.997836;-0.060014;,
  0.104539;-0.991722;0.074560;,
  0.001146;-0.992678;0.120786;,
  -0.167982;-0.980251;0.104353;,
  -0.139297;-0.989808;0.029609;,
  -0.111759;-0.986375;0.120724;,
  0.662260;0.053573;0.747356;,
  -0.052773;-0.057339;0.996959;,
  -0.736973;-0.134670;0.662370;,
  -0.989276;-0.133090;-0.060159;,
  -0.662257;-0.053576;-0.747359;,
  0.052762;0.057337;-0.996960;,
  0.736974;0.134665;-0.662371;,
  0.989277;0.133083;0.060157;,
  0.131859;-0.990594;-0.036559;,
  -0.131858;0.990594;0.036565;,
  0.081900;-0.671769;0.736219;,
  0.060557;0.047473;0.997035;,
  0.003736;0.738905;0.673799;,
  -0.055282;0.997495;-0.044135;,
  -0.081913;0.671771;-0.736216;,
  -0.060559;-0.047470;-0.997035;,
  -0.003741;-0.738901;-0.673804;,
  0.055266;-0.997496;0.044132;,
  -0.996633;-0.052436;0.063034;,
  0.996633;0.052440;-0.063030;,
  -0.872036;-0.476966;0.109806;,
  -0.872165;0.452755;0.185313;,
  -0.872037;-0.476964;0.109805;,
  -0.872160;0.452765;0.185312;,
  -0.872038;-0.476963;0.109804;,
  -0.872156;0.452774;0.185312;,
  -0.052583;-0.401061;-0.914541;,
  -0.033508;0.546274;-0.836936;,
  0.062580;-0.798444;-0.598808;,
  -0.227820;0.398045;-0.888627;,
  0.874904;-0.455746;-0.163822;,
  0.911811;0.384710;-0.143525;,
  0.872164;-0.452757;-0.185314;,
  0.872044;0.476949;-0.109815;,
  -0.009161;-0.553181;0.833011;,
  0.004782;0.416515;0.909116;,
  0.281845;0.931953;0.228094;,
  0.015659;0.936004;0.351641;,
  0.306334;0.951924;-0.000317;,
  0.018280;0.996885;0.076717;,
  -0.260933;0.919073;0.295327;,
  -0.297803;0.946070;0.127536;,
  0.210261;0.959986;-0.184979;,
  0.004820;0.977959;-0.208741;,
  -0.217695;0.972367;-0.084323;,
  0.235250;-0.967584;0.091866;,
  -0.014989;-0.978302;0.206640;,
  -0.018286;-0.996885;-0.076715;,
  0.267488;-0.952423;-0.146088;,
  -0.247634;-0.958442;0.141652;,
  -0.285246;-0.958009;-0.029197;,
  -0.032891;-0.932145;-0.360589;,
  0.153219;-0.929430;-0.335685;,
  -0.203762;-0.948456;-0.242718;,
  0.986513;0.008938;-0.163438;,
  0.946330;0.022036;-0.322451;,
  0.191922;-0.090736;0.977207;,
  0.191925;-0.090737;0.977206;,
  0.191920;-0.090735;0.977207;,
  0.191921;-0.090736;0.977207;,
  0.191915;-0.090734;0.977208;,
  -0.867106;-0.492060;0.077490;,
  -0.996559;-0.039666;0.072773;,
  -0.884997;0.017366;-0.465273;,
  -0.946436;0.001234;-0.322888;,
  -0.407399;0.077052;-0.909994;,
  -0.476140;0.071485;-0.876459;,
  -0.191921;0.090736;-0.977207;,
  0.879494;-0.458642;-0.127031;,
  0.856553;0.494526;-0.147516;,
  0.202433;0.965844;-0.161761;,
  0.302196;0.950278;-0.075161;,
  -0.012259;0.988979;-0.147545;,
  0.036877;0.998406;-0.042730;,
  0.232023;0.971041;0.056960;,
  0.069937;0.992033;0.104786;,
  -0.182843;0.972997;-0.140875;,
  -0.237463;0.970942;-0.029725;,
  -0.135176;0.984825;0.108842;,
  0.159646;-0.982942;-0.091315;,
  0.259727;-0.965579;-0.014110;,
  -0.036875;-0.998406;0.042726;,
  -0.086808;-0.994040;-0.065948;,
  0.153991;-0.985206;0.075197;,
  -0.024281;-0.992185;0.122391;,
  -0.301528;-0.951643;0.058784;,
  -0.260721;-0.964953;-0.029834;,
  -0.208988;-0.970126;0.123208;,
  0.191915;-0.090734;0.977208;,
  -0.996559;-0.039666;0.072773;,
  -0.998503;-0.027834;-0.047080;,
  0.131867;-0.990593;-0.036569;,
  0.131865;-0.990593;-0.036564;,
  0.131858;-0.990594;-0.036576;,
  0.131851;-0.990595;-0.036564;,
  0.131865;-0.990593;-0.036558;,
  0.131871;-0.990592;-0.036572;,
  0.131862;-0.990593;-0.036574;,
  0.131860;-0.990594;-0.036567;,
  -0.131860;0.990594;0.036561;,
  -0.131854;0.990595;0.036553;,
  -0.131856;0.990595;0.036554;,
  -0.131856;0.990594;0.036563;,
  -0.131851;0.990595;0.036567;,
  -0.131841;0.990596;0.036563;,
  -0.131851;0.990596;0.036545;,
  -0.131868;0.990593;0.036548;,
  -0.995957;-0.088725;0.014069;,
  -0.061004;0.122583;-0.990582;,
  0.952160;0.119397;-0.281312;,
  0.975461;0.057675;0.212485;,
  0.293159;0.955984;-0.012318;,
  0.167320;0.973704;-0.154611;,
  -0.001944;0.983289;-0.182039;,
  0.106575;0.977317;0.183010;,
  -0.071253;0.962558;0.261543;,
  -0.177972;0.974514;-0.136563;,
  -0.348443;0.936964;-0.026176;,
  -0.227810;0.961685;0.152530;,
  0.239952;-0.953161;-0.184138;,
  0.364997;-0.930412;-0.033335;,
  0.039064;-0.965219;-0.258506;,
  0.152152;-0.982093;0.111098;,
  -0.028892;-0.982485;0.184089;,
  -0.331691;-0.943377;0.004575;,
  -0.171477;-0.978730;-0.112618;,
  -0.178511;-0.980677;0.080041;,
  -0.947447;-0.057193;0.314758;,
  -0.352642;0.084227;-0.931960;,
  0.826181;0.078378;-0.557927;,
  0.995183;0.035994;-0.091192;,
  0.292702;0.945150;-0.144970;,
  0.130329;0.960999;-0.243917;,
  -0.039189;0.974709;-0.220016;,
  0.173563;0.980143;0.095893;,
  0.027141;0.974091;0.224521;,
  -0.193688;0.973229;-0.123738;,
  -0.323975;0.945449;0.034154;,
  -0.154925;0.973649;0.167350;,
  0.157150;-0.966800;-0.201497;,
  0.322000;-0.941848;-0.096121;,
  -0.056981;-0.975633;-0.211881;,
  0.161284;-0.981034;0.107515;,
  0.010410;-0.972874;0.231103;,
  -0.331508;-0.931694;0.148487;,
  -0.214373;-0.976707;-0.009326;,
  -0.163448;-0.970639;0.176478;,
  0.131861;-0.990594;-0.036555;,
  0.131864;-0.990594;-0.036557;,
  0.131854;-0.990595;-0.036562;,
  0.131848;-0.990596;-0.036559;,
  0.131856;-0.990595;-0.036557;,
  0.131863;-0.990593;-0.036565;,
  0.131863;-0.990593;-0.036562;,
  0.131866;-0.990593;-0.036559;,
  -0.131865;0.990593;0.036571;,
  -0.131876;0.990591;0.036581;,
  -0.131867;0.990592;0.036591;,
  -0.131856;0.990594;0.036578;,
  -0.131854;0.990595;0.036554;,
  -0.131846;0.990596;0.036553;,
  -0.131846;0.990596;0.036546;,
  -0.131853;0.990595;0.036550;,
  -0.996632;-0.052437;0.063049;,
  -0.996633;-0.052439;0.063038;,
  -0.996633;-0.052434;0.063035;,
  -0.996634;-0.052421;0.063029;,
  -0.996634;-0.052425;0.063032;,
  -0.996633;-0.052437;0.063028;,
  -0.996632;-0.052447;0.063032;,
  -0.996632;-0.052450;0.063032;,
  0.996632;0.052449;-0.063033;,
  0.996632;0.052443;-0.063036;,
  0.996634;0.052432;-0.063027;,
  0.996634;0.052423;-0.063028;,
  0.996633;0.052429;-0.063032;,
  0.996633;0.052444;-0.063026;,
  0.996633;0.052452;-0.063027;,
  0.996632;0.052452;-0.063029;,
  -0.036094;-0.402220;-0.914832;,
  -0.044318;0.545401;-0.837003;,
  0.235045;-0.530861;0.814211;,
  0.270758;0.398339;0.876365;,
  -0.262114;0.404582;0.876133;,
  -0.254853;-0.541800;0.800938;,
  0.534910;0.836830;-0.116560;,
  -0.979428;-0.051255;0.195176;,
  -0.979428;-0.051256;0.195176;,
  0.881748;-0.428965;-0.196239;,
  0.612590;0.746149;-0.260758;,
  0.657714;0.751982;0.043987;,
  0.996925;0.039185;-0.067861;,
  -0.051248;0.974151;-0.220008;,
  0.091942;0.971301;0.219366;,
  -0.281531;0.944884;-0.167134;,
  -0.491081;0.871066;-0.009139;,
  -0.228708;0.958511;0.170146;,
  -0.144913;-0.968038;-0.204702;,
  -0.091942;-0.971300;-0.219368;,
  0.256019;-0.960709;0.107204;,
  -0.001307;-0.972730;0.231938;,
  -0.377894;-0.921704;-0.087515;,
  -0.290415;-0.939858;0.179796;,
  -0.979428;-0.051255;0.195175;,
  -0.226617;-0.973984;0.000000;,
  -0.732343;0.611468;0.299634;,
  -0.550345;0.070027;-0.831995;;
  210;
  4;0,0,1,1;,
  4;1,1,2,2;,
  4;2,2,3,3;,
  4;3,3,4,4;,
  4;4,4,5,5;,
  4;5,5,6,6;,
  4;6,6,7,7;,
  4;7,7,0,0;,
  3;153,8,154;,
  3;155,8,153;,
  3;156,8,155;,
  3;157,8,156;,
  3;158,8,157;,
  3;159,8,158;,
  3;160,8,159;,
  3;154,8,160;,
  3;161,9,162;,
  3;162,9,163;,
  3;163,9,164;,
  3;164,9,165;,
  3;165,9,166;,
  3;166,9,167;,
  3;167,9,168;,
  3;168,9,161;,
  4;10,10,11,11;,
  4;11,11,12,12;,
  4;169,169,13,13;,
  4;13,13,14,14;,
  4;170,170,15,15;,
  4;15,15,16,16;,
  4;171,171,17,17;,
  4;17,17,172,172;,
  4;19,18,20,21;,
  4;22,19,21,23;,
  4;21,20,24,25;,
  4;23,21,25,26;,
  4;27,28,29,30;,
  4;28,31,32,29;,
  4;30,29,33,34;,
  4;29,32,35,33;,
  4;173,174,18,19;,
  4;174,175,20,18;,
  4;176,173,19,22;,
  4;177,176,22,23;,
  4;175,178,24,20;,
  4;178,179,25,24;,
  4;179,180,26,25;,
  4;180,177,23,26;,
  4;181,182,28,27;,
  4;183,181,27,30;,
  4;182,184,31,28;,
  4;184,185,32,31;,
  4;186,187,34,33;,
  4;187,183,30,34;,
  4;185,188,35,32;,
  4;188,186,33,35;,
  4;36,36,37,37;,
  4;37,37,38,38;,
  4;189,189,39,39;,
  4;39,39,40,40;,
  4;190,190,41,41;,
  4;41,41,42,42;,
  4;191,191,43,43;,
  4;43,43,192,192;,
  4;45,44,46,47;,
  4;48,45,47,49;,
  4;47,46,50,51;,
  4;49,47,51,52;,
  4;53,54,55,56;,
  4;54,57,58,55;,
  4;56,55,59,60;,
  4;55,58,61,59;,
  4;193,194,44,45;,
  4;194,195,46,44;,
  4;196,193,45,48;,
  4;197,196,48,49;,
  4;195,198,50,46;,
  4;198,199,51,50;,
  4;199,200,52,51;,
  4;200,197,49,52;,
  4;201,202,54,53;,
  4;203,201,53,56;,
  4;202,204,57,54;,
  4;204,205,58,57;,
  4;206,207,60,59;,
  4;207,203,56,60;,
  4;205,208,61,58;,
  4;208,206,59,61;,
  4;62,62,63,63;,
  4;63,63,64,64;,
  4;64,64,65,65;,
  4;65,65,66,66;,
  4;66,66,67,67;,
  4;67,67,68,68;,
  4;68,68,69,69;,
  4;69,69,62,62;,
  3;209,70,210;,
  3;211,70,209;,
  3;212,70,211;,
  3;213,70,212;,
  3;214,70,213;,
  3;215,70,214;,
  3;216,70,215;,
  3;210,70,216;,
  3;217,71,218;,
  3;218,71,219;,
  3;219,71,220;,
  3;220,71,221;,
  3;221,71,222;,
  3;222,71,223;,
  3;223,71,224;,
  3;224,71,217;,
  4;72,72,73,73;,
  4;73,73,74,74;,
  4;74,74,75,75;,
  4;75,75,76,76;,
  4;76,76,77,77;,
  4;77,77,78,78;,
  4;78,78,79,79;,
  4;79,79,72,72;,
  3;225,80,226;,
  3;227,80,225;,
  3;228,80,227;,
  3;229,80,228;,
  3;230,80,229;,
  3;231,80,230;,
  3;232,80,231;,
  3;226,80,232;,
  3;233,81,234;,
  3;234,81,235;,
  3;235,81,236;,
  3;236,81,237;,
  3;237,81,238;,
  3;238,81,239;,
  3;239,81,240;,
  3;240,81,233;,
  4;82,83,85,84;,
  4;84,85,87,86;,
  4;241,242,89,88;,
  4;88,89,91,90;,
  4;117,117,93,116;,
  4;92,93,95,94;,
  4;243,244,97,96;,
  4;96,97,245,246;,
  4;99,98,100,101;,
  4;102,99,101,103;,
  4;101,100,104,105;,
  4;103,101,105,106;,
  4;107,108,109,110;,
  4;108,111,112,109;,
  4;110,109,113,114;,
  4;109,112,115,113;,
  4;97,244,98,99;,
  4;95,93,100,98;,
  4;245,97,99,102;,
  4;85,83,102,103;,
  4;93,247,104,100;,
  4;91,89,105,104;,
  4;89,242,106,105;,
  4;87,85,103,106;,
  4;243,96,108,107;,
  4;92,94,107,110;,
  4;96,246,111,108;,
  4;82,84,112,111;,
  4;88,90,114,113;,
  4;90,92,110,114;,
  4;84,86,115,112;,
  4;241,88,113,115;,
  4;118,118,120,119;,
  3;122,150,120;,
  3;150,121,120;,
  3;120,121,119;,
  4;248,249,124,151;,
  4;151,124,126,152;,
  3;127,125,128;,
  3;128,125,126;,
  3;126,125,152;,
  4;127,128,129,129;,
  4;250,251,131,130;,
  4;130,131,252,253;,
  4;133,132,134,135;,
  4;136,133,135,137;,
  4;135,134,138,139;,
  4;137,135,139,140;,
  4;141,142,143,144;,
  4;142,145,146,143;,
  4;144,143,147,148;,
  4;143,146,149,147;,
  4;131,251,132,133;,
  4;251,254,134,132;,
  4;252,131,133,136;,
  4;255,252,136,137;,
  4;254,256,138,134;,
  4;256,257,139,138;,
  4;257,258,140,139;,
  4;258,255,137,140;,
  4;250,130,142,141;,
  4;259,260,141,144;,
  4;130,261,145,142;,
  4;261,262,146,145;,
  4;123,263,148,147;,
  4;263,259,144,148;,
  4;262,264,149,146;,
  4;264,123,147,149;,
  4;265,248,151,123;,
  4;123,151,152,125;,
  3;90,266,266;,
  3;92,116,93;,
  3;267,267,267;,
  3;91,268,268;;
 }
 MeshTextureCoords {
  201;
  0.134068;0.448476;,
  0.134501;0.370463;,
  0.084734;0.370507;,
  0.084303;0.448521;,
  0.037408;0.368571;,
  0.036974;0.446586;,
  0.020246;0.365790;,
  0.019813;0.443803;,
  0.043299;0.363792;,
  0.042867;0.441806;,
  0.093065;0.363749;,
  0.092634;0.441760;,
  0.140391;0.365686;,
  0.139960;0.443696;,
  0.157554;0.368465;,
  0.157122;0.446478;,
  0.088468;0.445141;,
  0.088900;0.367128;,
  0.227301;0.960739;,
  0.216741;0.839714;,
  0.135522;0.840755;,
  0.146081;0.961777;,
  0.054301;0.841795;,
  0.064862;0.962818;,
  0.052476;0.838172;,
  0.063037;0.959196;,
  0.055170;0.840172;,
  0.065730;0.961196;,
  0.135995;0.838347;,
  0.146554;0.959370;,
  0.217215;0.837306;,
  0.227774;0.958330;,
  0.238526;0.835790;,
  0.249084;0.956813;,
  0.229745;0.832643;,
  0.210882;0.834738;,
  0.137029;0.835684;,
  0.134426;0.833864;,
  0.209938;0.836212;,
  0.136085;0.837158;,
  0.063534;0.837345;,
  0.060572;0.834810;,
  0.062232;0.838104;,
  0.221986;0.961993;,
  0.240849;0.959898;,
  0.145530;0.961119;,
  0.148132;0.962940;,
  0.221042;0.963466;,
  0.147189;0.964412;,
  0.071675;0.962065;,
  0.074639;0.964599;,
  0.073335;0.965358;,
  0.711112;0.956260;,
  0.707829;0.834435;,
  0.624851;0.833698;,
  0.628134;0.955524;,
  0.541874;0.832962;,
  0.545157;0.954787;,
  0.508343;0.833592;,
  0.511627;0.955419;,
  0.497582;0.837470;,
  0.500866;0.959296;,
  0.573295;0.838342;,
  0.576579;0.960169;,
  0.656273;0.839079;,
  0.659556;0.960904;,
  0.698418;0.835280;,
  0.701701;0.957104;,
  0.688429;0.832090;,
  0.654083;0.835804;,
  0.578631;0.835134;,
  0.591045;0.831227;,
  0.696986;0.831322;,
  0.621535;0.830653;,
  0.509785;0.834342;,
  0.515594;0.830556;,
  0.546084;0.829984;,
  0.657535;0.963903;,
  0.691881;0.960188;,
  0.594497;0.959324;,
  0.582082;0.963233;,
  0.700438;0.959420;,
  0.624986;0.958750;,
  0.519046;0.958655;,
  0.513237;0.962439;,
  0.549535;0.958082;,
  0.133968;0.448156;,
  0.134402;0.370142;,
  0.084634;0.370188;,
  0.084202;0.448200;,
  0.037308;0.368253;,
  0.036876;0.446264;,
  0.020145;0.365468;,
  0.019713;0.443482;,
  0.043200;0.363471;,
  0.042767;0.441486;,
  0.092965;0.363428;,
  0.092532;0.441441;,
  0.140292;0.365364;,
  0.139859;0.443377;,
  0.157454;0.368144;,
  0.157022;0.446158;,
  0.088368;0.444821;,
  0.088800;0.366806;,
  0.049386;0.448958;,
  0.143135;0.447040;,
  0.140440;0.411724;,
  0.046692;0.413642;,
  0.133267;0.377774;,
  0.039518;0.379693;,
  0.125819;0.365077;,
  0.032070;0.366996;,
  0.122456;0.381070;,
  0.028707;0.382990;,
  0.125151;0.416386;,
  0.031401;0.418305;,
  0.132324;0.450336;,
  0.038574;0.452254;,
  0.139774;0.463033;,
  0.046025;0.464952;,
  0.039046;0.415974;,
  0.132795;0.414055;,
  0.069524;0.961567;,
  0.070628;0.812749;,
  0.054556;0.808209;,
  0.053451;0.957027;,
  0.038484;0.803668;,
  0.037379;0.952486;,
  0.112378;0.803127;,
  0.111273;0.951945;,
  0.213885;0.805602;,
  0.212780;0.954420;,
  0.213885;0.805602;,
  0.245967;0.810025;,
  0.244862;0.958844;,
  0.244862;0.958844;,
  0.262040;0.814565;,
  0.260934;0.963384;,
  0.149195;0.813527;,
  0.148089;0.962346;,
  0.150386;0.809203;,
  0.251288;0.810452;,
  0.236674;0.806324;,
  0.131523;0.803875;,
  0.078945;0.808496;,
  0.064330;0.804368;,
  0.207502;0.802301;,
  0.116908;0.799746;,
  0.049716;0.800239;,
  0.250127;0.966933;,
  0.149222;0.965684;,
  0.130360;0.960356;,
  0.235513;0.962804;,
  0.077783;0.964977;,
  0.063168;0.960848;,
  0.115745;0.956227;,
  0.206340;0.958783;,
  0.048553;0.956719;,
  0.123438;0.454244;,
  0.120440;0.362144;,
  0.086562;0.360474;,
  0.089560;0.452575;,
  0.052683;0.358806;,
  0.054182;0.404856;,
  0.055681;0.450907;,
  0.037554;0.358952;,
  0.039083;0.405912;,
  0.039231;0.361244;,
  0.040730;0.407294;,
  0.072830;0.455045;,
  0.042229;0.453345;,
  0.069832;0.362944;,
  0.103711;0.364613;,
  0.106709;0.456714;,
  0.115160;0.362774;,
  0.118158;0.454876;,
  0.110985;0.360236;,
  0.102959;0.362093;,
  0.072153;0.360576;,
  0.071224;0.358277;,
  0.115785;0.359662;,
  0.084979;0.358145;,
  0.044327;0.359030;,
  0.040418;0.356759;,
  0.054173;0.356627;,
  0.106112;0.458937;,
  0.114136;0.457078;,
  0.074376;0.455121;,
  0.075306;0.457419;,
  0.118937;0.456505;,
  0.088132;0.454988;,
  0.043570;0.453602;,
  0.047480;0.455873;,
  0.057326;0.453470;,
  0.040553;0.451053;,
  0.228821;0.956632;,
  0.245414;0.884434;,
  0.245414;0.884434;,
  0.229926;0.807814;,
  0.213333;0.880011;,
  0.213333;0.880011;;
 }
}
