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
 182;
 -1.23058;-4.77762;3.51720;,
 -0.06096;4.43626;2.05302;,
 18.47888;3.78798;4.53166;,
 18.63424;-5.42590;5.99584;,
 -1.33264;5.27454;6.80328;,
 17.20722;4.62624;9.28194;,
 -2.50228;-3.93936;8.26746;,
 17.36258;-4.58764;10.74610;,
 2.88454;-4.23034;1.23904;,
 3.56134;-3.23776;2.28944;,
 2.08620;-3.23776;3.23776;,
 2.08620;-4.23034;1.75226;,
 0.61104;-3.23776;2.28944;,
 1.28784;-4.23034;1.23904;,
 0.00000;-3.23776;-0.00000;,
 0.95716;-4.23034;-0.00000;,
 0.61104;-3.23776;-2.28944;,
 1.28784;-4.23034;-1.23904;,
 2.08620;-3.23776;-3.23776;,
 2.08620;-4.23034;-1.75226;,
 3.56134;-3.23776;-2.28944;,
 2.88454;-4.23034;-1.23904;,
 4.17238;-3.23776;-0.00000;,
 3.21522;-4.23034;-0.00000;,
 4.01358;-1.75226;2.99130;,
 2.08620;-1.75226;4.23034;,
 0.15882;-1.75226;2.99130;,
 -0.63954;-1.75226;0.00000;,
 0.15882;-1.75226;-2.99130;,
 2.08620;-1.75226;-4.23034;,
 4.01358;-1.75226;-2.99130;,
 4.81192;-1.75226;-0.00000;,
 4.17238;0.00000;3.23776;,
 2.08620;0.00000;4.57888;,
 0.00000;0.00000;3.23776;,
 -0.86410;0.00000;0.00000;,
 0.00000;0.00000;-3.23776;,
 2.08620;0.00000;-4.57888;,
 4.17238;0.00000;-3.23776;,
 5.03650;0.00000;0.00000;,
 4.01358;1.75226;2.99130;,
 2.08620;1.75226;4.23034;,
 0.15882;1.75226;2.99130;,
 -0.63954;1.75226;0.00000;,
 0.15882;1.75226;-2.99130;,
 2.08620;1.75226;-4.23034;,
 4.01358;1.75226;-2.99130;,
 4.81192;1.75226;0.00000;,
 3.56134;3.23776;2.28944;,
 2.08620;3.23776;3.23776;,
 0.61104;3.23776;2.28944;,
 0.00000;3.23776;0.00000;,
 0.61104;3.23776;-2.28944;,
 2.08620;3.23776;-3.23776;,
 3.56134;3.23776;-2.28944;,
 4.17238;3.23776;0.00000;,
 2.88454;4.23034;1.23904;,
 2.08620;4.23034;1.75226;,
 1.28784;4.23034;1.23904;,
 0.95716;4.23034;0.00000;,
 1.28784;4.23034;-1.23904;,
 2.08620;4.23034;-1.75226;,
 2.88454;4.23034;-1.23904;,
 3.21522;4.23034;0.00000;,
 2.08620;-4.57888;-0.00000;,
 2.08620;4.57888;0.00000;,
 17.56642;-4.23034;2.53782;,
 18.24322;-3.23776;3.58822;,
 16.76806;-3.23776;4.53654;,
 16.76806;-4.23034;3.05104;,
 15.29290;-3.23776;3.58822;,
 15.96972;-4.23034;2.53782;,
 14.68188;-3.23776;1.29878;,
 15.63904;-4.23034;1.29878;,
 15.29290;-3.23776;-0.99066;,
 15.96972;-4.23034;0.05974;,
 16.76806;-3.23776;-1.93898;,
 16.76806;-4.23034;-0.45350;,
 18.24322;-3.23776;-0.99066;,
 17.56642;-4.23034;0.05974;,
 18.85426;-3.23776;1.29878;,
 17.89710;-4.23034;1.29878;,
 18.69544;-1.75226;4.29008;,
 16.76806;-1.75226;5.52912;,
 14.84068;-1.75226;4.29008;,
 14.04234;-1.75226;1.29878;,
 14.84068;-1.75226;-1.69252;,
 16.76806;-1.75226;-2.93156;,
 18.69544;-1.75226;-1.69252;,
 19.49380;-1.75226;1.29878;,
 18.85426;0.00000;4.53654;,
 16.76806;0.00000;5.87766;,
 14.68188;0.00000;4.53654;,
 13.81776;0.00000;1.29878;,
 14.68188;0.00000;-1.93898;,
 16.76806;0.00000;-3.28012;,
 18.85426;0.00000;-1.93898;,
 19.71838;0.00000;1.29878;,
 18.69544;1.75226;4.29008;,
 16.76806;1.75226;5.52912;,
 14.84068;1.75226;4.29008;,
 14.04234;1.75226;1.29878;,
 14.84068;1.75226;-1.69252;,
 16.76806;1.75226;-2.93156;,
 18.69544;1.75226;-1.69252;,
 19.49380;1.75226;1.29878;,
 18.24322;3.23776;3.58822;,
 16.76806;3.23776;4.53654;,
 15.29290;3.23776;3.58822;,
 14.68188;3.23776;1.29878;,
 15.29290;3.23776;-0.99066;,
 16.76806;3.23776;-1.93898;,
 18.24322;3.23776;-0.99066;,
 18.85426;3.23776;1.29878;,
 17.56642;4.23034;2.53782;,
 16.76806;4.23034;3.05104;,
 15.96972;4.23034;2.53782;,
 15.63904;4.23034;1.29878;,
 15.96972;4.23034;0.05974;,
 16.76806;4.23034;-0.45350;,
 17.56642;4.23034;0.05974;,
 17.89710;4.23034;1.29878;,
 16.76806;-4.57888;1.29878;,
 16.76806;4.57888;1.29878;,
 -1.29648;-4.77762;-6.90182;,
 -2.12494;4.43628;-6.57898;,
 21.39120;3.78798;-4.63760;,
 21.73622;-5.42590;-3.20712;,
 -0.53994;5.27454;-3.61572;,
 19.33426;4.62622;-1.13708;,
 -1.07516;-3.93936;-2.15156;,
 20.59378;-4.58764;0.32708;,
 79.00256;-10.64466;-0.51840;,
 80.64979;-3.93572;-2.11260;,
 67.27550;-1.95670;3.29502;,
 62.13486;-10.43224;5.78460;,
 80.96718;-2.13544;-5.19392;,
 81.28458;-3.32404;-8.30746;,
 67.01926;1.46128;-9.21472;,
 67.91224;1.74720;-3.08668;,
 79.63734;-6.68768;-8.53072;,
 61.80634;-6.05072;-10.25178;,
 75.27712;-14.53704;-8.00020;,
 78.13038;-15.26186;-5.05388;,
 57.65094;-18.00134;2.11868;,
 56.68582;-14.79544;-6.77720;,
 19.56580;10.37996;-2.48110;,
 24.24696;8.10132;-7.96438;,
 24.59020;-6.14948;-6.20082;,
 17.11038;-3.12448;1.05938;,
 79.31994;-8.84442;-3.59970;,
 48.37338;-15.20154;5.31262;,
 42.57244;-15.75156;-4.92248;,
 44.88418;-5.34570;-8.44458;,
 44.18424;5.48122;-8.68198;,
 45.15926;8.58194;-0.62292;,
 46.55602;8.66874;8.18408;,
 48.33496;-1.39922;12.08852;,
 36.19256;-15.64240;12.92788;,
 38.11084;-17.87652;0.75692;,
 37.05210;-5.24206;-5.18068;,
 36.04664;8.57102;-7.22856;,
 33.93430;13.06264;4.26102;,
 34.04464;14.30286;12.33180;,
 35.09174;1.41106;17.42014;,
 19.78740;-12.35010;6.97682;,
 25.23876;-15.91270;-1.62434;,
 30.24290;-19.07602;-0.79368;,
 24.23906;-16.02236;9.76248;,
 30.59882;6.57762;-11.24670;,
 31.18518;-6.27706;-6.07660;,
 24.60856;11.82022;-1.58862;,
 18.60508;14.93502;8.94244;,
 17.12132;13.34552;4.71020;,
 14.79158;0.94674;10.94754;,
 18.17518;2.39278;14.85880;,
 77.99887;-16.46176;-2.03118;,
 56.94210;-18.21338;5.73258;,
 49.33624;-12.01420;13.35018;,
 36.10888;-12.14468;20.31728;,
 18.24918;-10.71862;19.39548;,
 17.34294;-9.38456;14.16812;;
 
 188;
 4;0,1,2,3;,
 4;1,4,5,2;,
 4;4,6,7,5;,
 4;6,0,3,7;,
 4;3,2,5,7;,
 4;6,4,1,0;,
 4;8,9,10,11;,
 4;11,10,12,13;,
 4;13,12,14,15;,
 4;15,14,16,17;,
 4;17,16,18,19;,
 4;19,18,20,21;,
 4;21,20,22,23;,
 4;23,22,9,8;,
 4;9,24,25,10;,
 4;10,25,26,12;,
 4;12,26,27,14;,
 4;14,27,28,16;,
 4;16,28,29,18;,
 4;18,29,30,20;,
 4;20,30,31,22;,
 4;22,31,24,9;,
 4;24,32,33,25;,
 4;25,33,34,26;,
 4;26,34,35,27;,
 4;27,35,36,28;,
 4;28,36,37,29;,
 4;29,37,38,30;,
 4;30,38,39,31;,
 4;31,39,32,24;,
 4;32,40,41,33;,
 4;33,41,42,34;,
 4;34,42,43,35;,
 4;35,43,44,36;,
 4;36,44,45,37;,
 4;37,45,46,38;,
 4;38,46,47,39;,
 4;39,47,40,32;,
 4;40,48,49,41;,
 4;41,49,50,42;,
 4;42,50,51,43;,
 4;43,51,52,44;,
 4;44,52,53,45;,
 4;45,53,54,46;,
 4;46,54,55,47;,
 4;47,55,48,40;,
 4;48,56,57,49;,
 4;49,57,58,50;,
 4;50,58,59,51;,
 4;51,59,60,52;,
 4;52,60,61,53;,
 4;53,61,62,54;,
 4;54,62,63,55;,
 4;55,63,56,48;,
 3;11,64,8;,
 3;13,64,11;,
 3;15,64,13;,
 3;17,64,15;,
 3;19,64,17;,
 3;21,64,19;,
 3;23,64,21;,
 3;8,64,23;,
 3;56,65,57;,
 3;57,65,58;,
 3;58,65,59;,
 3;59,65,60;,
 3;60,65,61;,
 3;61,65,62;,
 3;62,65,63;,
 3;63,65,56;,
 4;66,67,68,69;,
 4;69,68,70,71;,
 4;71,70,72,73;,
 4;73,72,74,75;,
 4;75,74,76,77;,
 4;77,76,78,79;,
 4;79,78,80,81;,
 4;81,80,67,66;,
 4;67,82,83,68;,
 4;68,83,84,70;,
 4;70,84,85,72;,
 4;72,85,86,74;,
 4;74,86,87,76;,
 4;76,87,88,78;,
 4;78,88,89,80;,
 4;80,89,82,67;,
 4;82,90,91,83;,
 4;83,91,92,84;,
 4;84,92,93,85;,
 4;85,93,94,86;,
 4;86,94,95,87;,
 4;87,95,96,88;,
 4;88,96,97,89;,
 4;89,97,90,82;,
 4;90,98,99,91;,
 4;91,99,100,92;,
 4;92,100,101,93;,
 4;93,101,102,94;,
 4;94,102,103,95;,
 4;95,103,104,96;,
 4;96,104,105,97;,
 4;97,105,98,90;,
 4;98,106,107,99;,
 4;99,107,108,100;,
 4;100,108,109,101;,
 4;101,109,110,102;,
 4;102,110,111,103;,
 4;103,111,112,104;,
 4;104,112,113,105;,
 4;105,113,106,98;,
 4;106,114,115,107;,
 4;107,115,116,108;,
 4;108,116,117,109;,
 4;109,117,118,110;,
 4;110,118,119,111;,
 4;111,119,120,112;,
 4;112,120,121,113;,
 4;113,121,114,106;,
 3;69,122,66;,
 3;71,122,69;,
 3;73,122,71;,
 3;75,122,73;,
 3;77,122,75;,
 3;79,122,77;,
 3;81,122,79;,
 3;66,122,81;,
 3;114,123,115;,
 3;115,123,116;,
 3;116,123,117;,
 3;117,123,118;,
 3;118,123,119;,
 3;119,123,120;,
 3;120,123,121;,
 3;121,123,114;,
 4;124,125,126,127;,
 4;125,128,129,126;,
 4;128,130,131,129;,
 4;130,124,127,131;,
 4;127,126,129,131;,
 4;130,128,125,124;,
 4;132,133,134,135;,
 4;136,137,138,139;,
 4;137,140,141,138;,
 4;142,143,144,145;,
 4;146,147,148,149;,
 4;140,137,136,150;,
 4;151,152,145,144;,
 4;153,154,138,141;,
 4;138,154,155,139;,
 4;134,156,157,135;,
 4;158,159,152,151;,
 4;160,161,154,153;,
 4;154,161,162,155;,
 4;156,163,164,157;,
 4;165,166,167,168;,
 4;148,147,169,170;,
 4;169,147,146,171;,
 4;172,173,174,175;,
 4;170,169,161,160;,
 4;161,169,171,162;,
 4;163,172,175,164;,
 4;168,167,159,158;,
 4;176,132,135,177;,
 4;157,178,177,135;,
 4;164,179,178,157;,
 4;175,180,179,164;,
 4;174,181,180,175;,
 4;149,148,166,165;,
 4;167,166,148,170;,
 4;159,167,170,160;,
 4;152,159,160,153;,
 4;145,152,153,141;,
 4;140,142,145,141;,
 4;142,140,150,143;,
 4;133,136,139,134;,
 4;155,156,134,139;,
 4;162,163,156,155;,
 4;171,172,163,162;,
 4;146,173,172,171;,
 4;174,173,146,149;,
 4;181,174,149,165;,
 4;180,181,165,168;,
 4;179,180,168,158;,
 4;178,179,158,151;,
 4;177,178,151,144;,
 4;143,176,177,144;,
 4;150,132,176,143;,
 4;136,133,132,150;;
 
 MeshMaterialList {
  1;
  188;
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
    "data\\TEXTURE\\enemy\\riot\\riot_UV.jpg";
   }
  }
 }
 MeshNormals {
  210;
  0.121103;-0.161964;-0.979337;,
  0.055728;0.985700;-0.159026;,
  -0.121103;0.161963;0.979338;,
  0.382563;-0.887320;0.257506;,
  0.000002;-0.925854;0.377880;,
  -0.382560;-0.887321;0.257506;,
  -0.522312;-0.852754;0.000000;,
  -0.382560;-0.887321;-0.257506;,
  0.000002;-0.925854;-0.377880;,
  0.382563;-0.887320;-0.257506;,
  0.522315;-0.852753;-0.000000;,
  0.641048;-0.622934;0.448341;,
  0.000002;-0.711704;0.702479;,
  -0.641048;-0.622933;0.448344;,
  -0.832112;-0.554607;0.000000;,
  -0.641048;-0.622933;-0.448344;,
  0.000002;-0.711704;-0.702479;,
  0.641048;-0.622934;-0.448341;,
  0.832111;-0.554610;-0.000000;,
  0.770513;-0.313515;0.554994;,
  0.000001;-0.386512;0.922285;,
  -0.770512;-0.313513;0.554995;,
  -0.964479;-0.264161;0.000000;,
  -0.770513;-0.313513;-0.554995;,
  0.000001;-0.386512;-0.922285;,
  0.770513;-0.313515;-0.554994;,
  0.964478;-0.264164;-0.000000;,
  0.808656;-0.000000;0.588282;,
  0.540760;0.000000;0.841177;,
  -0.808655;-0.000000;0.588283;,
  -1.000000;0.000000;0.000000;,
  -0.808655;-0.000000;-0.588283;,
  -0.540758;0.000000;-0.841178;,
  0.808656;-0.000000;-0.588282;,
  1.000000;0.000000;0.000000;,
  0.770513;0.313515;0.554994;,
  0.510000;0.332468;0.793326;,
  -0.770513;0.313513;0.554995;,
  -0.964479;0.264161;0.000000;,
  -0.770513;0.313513;-0.554995;,
  -0.509997;0.332468;-0.793327;,
  0.770513;0.313515;-0.554994;,
  0.964478;0.264164;0.000000;,
  0.641048;0.622934;0.448341;,
  0.000002;0.711705;0.702479;,
  -0.641048;0.622933;0.448344;,
  -0.832112;0.554607;0.000000;,
  -0.641048;0.622933;-0.448344;,
  0.000002;0.711705;-0.702479;,
  0.641048;0.622934;-0.448341;,
  0.832111;0.554610;0.000000;,
  0.382563;0.887320;0.257506;,
  0.000002;0.925854;0.377880;,
  -0.382560;0.887321;0.257506;,
  -0.522312;0.852754;0.000000;,
  -0.382560;0.887321;-0.257506;,
  0.000002;0.925854;-0.377880;,
  0.382563;0.887320;-0.257506;,
  0.522315;0.852753;0.000000;,
  0.000002;-1.000000;0.000000;,
  0.000002;1.000000;0.000000;,
  0.382559;-0.887321;0.257506;,
  -0.000002;-0.925855;0.377880;,
  -0.382561;-0.887321;0.257504;,
  -0.522312;-0.852754;-0.000000;,
  -0.382564;-0.887320;-0.257504;,
  -0.000002;-0.925855;-0.377880;,
  0.382562;-0.887320;-0.257506;,
  0.522312;-0.852755;-0.000000;,
  0.641047;-0.622934;0.448343;,
  -0.000001;-0.711705;0.702479;,
  -0.641048;-0.622935;0.448340;,
  -0.832111;-0.554609;-0.000000;,
  -0.641050;-0.622934;-0.448340;,
  -0.000001;-0.711703;-0.702480;,
  0.641049;-0.622932;-0.448343;,
  0.832112;-0.554608;-0.000000;,
  0.770512;-0.313515;0.554996;,
  -0.000001;-0.386511;0.922285;,
  -0.770514;-0.313513;0.554994;,
  -0.964479;-0.264160;-0.000000;,
  -0.770514;-0.313514;-0.554993;,
  -0.000001;-0.386514;-0.922284;,
  0.770512;-0.313516;-0.554995;,
  0.964478;-0.264164;0.000000;,
  0.808654;-0.000000;0.588285;,
  0.540758;0.000000;0.841178;,
  -0.808655;-0.000000;0.588282;,
  -1.000000;0.000000;-0.000000;,
  -0.808657;0.000000;-0.588281;,
  -0.540763;0.000000;-0.841175;,
  0.808655;-0.000000;-0.588283;,
  1.000000;0.000000;0.000000;,
  0.770512;0.313515;0.554996;,
  0.509997;0.332468;0.793327;,
  -0.770514;0.313513;0.554994;,
  -0.964479;0.264160;-0.000000;,
  -0.770514;0.313514;-0.554993;,
  -0.510000;0.332469;-0.793325;,
  0.770512;0.313516;-0.554995;,
  0.964478;0.264164;0.000000;,
  0.641047;0.622934;0.448343;,
  -0.000001;0.711705;0.702479;,
  -0.641048;0.622935;0.448340;,
  -0.832111;0.554609;-0.000000;,
  -0.641050;0.622934;-0.448340;,
  -0.000001;0.711703;-0.702480;,
  0.641049;0.622932;-0.448343;,
  0.832112;0.554608;-0.000000;,
  0.382559;0.887321;0.257506;,
  -0.000002;0.925855;0.377880;,
  -0.382561;0.887321;0.257504;,
  -0.522312;0.852754;-0.000000;,
  -0.382564;0.887320;-0.257504;,
  -0.000002;0.925855;-0.377880;,
  0.382562;0.887320;-0.257506;,
  0.522312;0.852755;-0.000000;,
  -0.000002;-1.000000;0.000001;,
  -0.000002;1.000000;0.000001;,
  0.118625;-0.052091;-0.991572;,
  0.053936;0.966966;-0.249133;,
  -0.112614;0.152029;0.981940;,
  0.342638;-0.266328;0.900926;,
  0.432303;-0.185291;0.882486;,
  0.378921;0.492564;0.783453;,
  0.420302;0.561773;0.712571;,
  0.297925;0.933791;-0.198182;,
  0.258264;0.941902;-0.214756;,
  0.364802;-0.592900;-0.717906;,
  -0.067932;-0.720377;-0.690248;,
  0.041516;-0.997940;-0.048910;,
  0.479351;0.041706;0.876631;,
  -0.183782;-0.024598;-0.982659;,
  0.464867;0.705336;0.535164;,
  0.136513;-0.981197;0.136442;,
  0.183182;0.233077;0.955049;,
  0.059160;-0.175052;-0.982780;,
  0.144314;0.400889;0.904689;,
  -0.540887;-0.626544;-0.561145;,
  -0.923130;-0.367547;0.112873;,
  -0.515674;-0.168661;-0.840020;,
  -0.979531;0.194289;0.052636;,
  -0.284382;-0.954437;0.090419;,
  0.093418;-0.253723;-0.962755;,
  -0.567965;0.382187;0.728937;,
  -0.078841;0.265935;0.960761;,
  0.361749;-0.088526;0.928063;,
  0.419047;-0.017916;0.907788;,
  0.454748;0.168740;0.874489;,
  0.164494;0.317911;0.933742;,
  -0.570529;0.282525;0.771152;,
  -0.994014;0.021521;0.107113;,
  -0.492702;-0.304569;-0.815158;,
  0.093220;-0.329831;-0.939426;,
  -0.054525;-0.277793;-0.959092;,
  -0.259003;-0.167891;-0.951173;,
  -0.015098;-0.109385;-0.993885;,
  0.361449;-0.163317;-0.917977;,
  0.330815;0.929712;0.161856;,
  0.322390;0.943450;0.077251;,
  0.310707;0.943129;-0.118186;,
  0.182574;0.945009;-0.271338;,
  -0.030816;0.925948;-0.376393;,
  -0.867992;0.000565;-0.496578;,
  -0.891922;-0.186699;-0.411848;,
  -0.785221;-0.594757;-0.172317;,
  -0.353761;-0.920645;0.165125;,
  0.106521;-0.955492;0.275115;,
  -0.004741;-0.993965;0.109592;,
  -0.113833;-0.984631;-0.132451;,
  0.021809;-0.965999;-0.257625;,
  0.959181;-0.262308;-0.105675;,
  -0.052132;-0.985740;0.159994;,
  0.966895;0.055869;0.248982;,
  -0.959423;0.078767;-0.270746;,
  -0.540758;0.000000;0.841178;,
  0.540760;0.000000;-0.841177;,
  -0.509997;0.332468;0.793327;,
  0.510000;0.332468;-0.793326;,
  -0.540760;0.000000;0.841177;,
  0.540761;0.000000;-0.841176;,
  -0.509999;0.332466;0.793327;,
  0.509999;0.332470;-0.793325;,
  -0.055465;-0.979492;0.193697;,
  0.915466;0.137092;0.378321;,
  -0.965930;0.015493;0.258339;,
  0.085922;0.049521;-0.995070;,
  0.016252;0.051879;-0.998521;,
  0.930763;-0.349827;0.106311;,
  0.953322;-0.300404;0.030565;,
  0.234417;0.928160;-0.289079;,
  0.154404;0.912364;-0.379145;,
  -0.023834;0.890397;-0.454560;,
  -0.104898;0.861608;-0.496616;,
  -0.117785;0.891379;-0.437687;,
  -0.680015;-0.641762;0.354572;,
  0.092484;-0.400264;-0.911721;,
  -0.167431;-0.374297;-0.912068;,
  -0.328095;-0.308545;-0.892834;,
  0.945239;-0.217825;-0.243055;,
  0.208478;0.965021;-0.158971;,
  -0.037594;0.954720;-0.295122;,
  -0.130138;0.917117;-0.376777;,
  0.074165;-0.909675;0.408645;,
  -0.052129;-0.961639;0.269319;,
  -0.156801;-0.986885;-0.038354;,
  0.031032;-0.977133;-0.210353;,
  0.977090;-0.210776;-0.029483;,
  0.984863;-0.172810;-0.013468;,
  0.967598;-0.248371;-0.045447;;
  188;
  4;0,0,0,0;,
  4;1,1,1,1;,
  4;2,2,2,2;,
  4;172,172,172,172;,
  4;173,173,173,173;,
  4;174,174,174,174;,
  4;3,11,12,4;,
  4;4,12,13,5;,
  4;5,13,14,6;,
  4;6,14,15,7;,
  4;7,15,16,8;,
  4;8,16,17,9;,
  4;9,17,18,10;,
  4;10,18,11,3;,
  4;11,19,20,12;,
  4;12,20,21,13;,
  4;13,21,22,14;,
  4;14,22,23,15;,
  4;15,23,24,16;,
  4;16,24,25,17;,
  4;17,25,26,18;,
  4;18,26,19,11;,
  4;19,27,28,20;,
  4;20,175,29,21;,
  4;21,29,30,22;,
  4;22,30,31,23;,
  4;23,31,32,24;,
  4;24,176,33,25;,
  4;25,33,34,26;,
  4;26,34,27,19;,
  4;27,35,36,28;,
  4;175,177,37,29;,
  4;29,37,38,30;,
  4;30,38,39,31;,
  4;31,39,40,32;,
  4;176,178,41,33;,
  4;33,41,42,34;,
  4;34,42,35,27;,
  4;35,43,44,36;,
  4;177,44,45,37;,
  4;37,45,46,38;,
  4;38,46,47,39;,
  4;39,47,48,40;,
  4;178,48,49,41;,
  4;41,49,50,42;,
  4;42,50,43,35;,
  4;43,51,52,44;,
  4;44,52,53,45;,
  4;45,53,54,46;,
  4;46,54,55,47;,
  4;47,55,56,48;,
  4;48,56,57,49;,
  4;49,57,58,50;,
  4;50,58,51,43;,
  3;4,59,3;,
  3;5,59,4;,
  3;6,59,5;,
  3;7,59,6;,
  3;8,59,7;,
  3;9,59,8;,
  3;10,59,9;,
  3;3,59,10;,
  3;51,60,52;,
  3;52,60,53;,
  3;53,60,54;,
  3;54,60,55;,
  3;55,60,56;,
  3;56,60,57;,
  3;57,60,58;,
  3;58,60,51;,
  4;61,69,70,62;,
  4;62,70,71,63;,
  4;63,71,72,64;,
  4;64,72,73,65;,
  4;65,73,74,66;,
  4;66,74,75,67;,
  4;67,75,76,68;,
  4;68,76,69,61;,
  4;69,77,78,70;,
  4;70,78,79,71;,
  4;71,79,80,72;,
  4;72,80,81,73;,
  4;73,81,82,74;,
  4;74,82,83,75;,
  4;75,83,84,76;,
  4;76,84,77,69;,
  4;77,85,86,78;,
  4;78,179,87,79;,
  4;79,87,88,80;,
  4;80,88,89,81;,
  4;81,89,90,82;,
  4;82,180,91,83;,
  4;83,91,92,84;,
  4;84,92,85,77;,
  4;85,93,94,86;,
  4;179,181,95,87;,
  4;87,95,96,88;,
  4;88,96,97,89;,
  4;89,97,98,90;,
  4;180,182,99,91;,
  4;91,99,100,92;,
  4;92,100,93,85;,
  4;93,101,102,94;,
  4;181,102,103,95;,
  4;95,103,104,96;,
  4;96,104,105,97;,
  4;97,105,106,98;,
  4;182,106,107,99;,
  4;99,107,108,100;,
  4;100,108,101,93;,
  4;101,109,110,102;,
  4;102,110,111,103;,
  4;103,111,112,104;,
  4;104,112,113,105;,
  4;105,113,114,106;,
  4;106,114,115,107;,
  4;107,115,116,108;,
  4;108,116,109,101;,
  3;62,117,61;,
  3;63,117,62;,
  3;64,117,63;,
  3;65,117,64;,
  3;66,117,65;,
  3;67,117,66;,
  3;68,117,67;,
  3;61,117,68;,
  3;109,118,110;,
  3;110,118,111;,
  3;111,118,112;,
  3;112,118,113;,
  3;113,118,114;,
  3;114,118,115;,
  3;115,118,116;,
  3;116,118,109;,
  4;119,119,119,119;,
  4;120,120,120,120;,
  4;121,121,121,121;,
  4;183,183,183,183;,
  4;184,184,184,184;,
  4;185,185,185,185;,
  4;146,124,125,147;,
  4;158,126,127,159;,
  4;186,157,156,187;,
  4;128,170,169,129;,
  4;163,140,152,164;,
  4;188,188,189,171;,
  4;168,130,129,169;,
  4;155,132,187,156;,
  4;127,190,160,159;,
  4;125,133,148,147;,
  4;167,134,130,168;,
  4;154,136,132,155;,
  4;190,191,161,160;,
  4;133,137,149,148;,
  4;165,138,142,166;,
  4;152,140,143,153;,
  4;192,193,194,162;,
  4;144,141,151,150;,
  4;153,143,136,154;,
  4;191,192,162,161;,
  4;137,144,150,149;,
  4;166,142,134,167;,
  4;122,146,147,123;,
  4;148,131,123,147;,
  4;149,135,131,148;,
  4;150,145,135,149;,
  4;151,139,195,150;,
  4;164,152,138,165;,
  4;196,138,152,153;,
  4;197,196,153,154;,
  4;198,197,154,155;,
  4;129,198,155,156;,
  4;157,128,129,156;,
  4;128,157,171,199;,
  4;124,158,159,125;,
  4;160,133,125,159;,
  4;161,200,133,160;,
  4;162,201,200,161;,
  4;194,202,201,162;,
  4;151,141,163,164;,
  4;139,151,164,165;,
  4;195,139,165,166;,
  4;203,195,166,167;,
  4;204,203,167,168;,
  4;205,204,168,169;,
  4;170,206,205,169;,
  4;171,207,208,199;,
  4;189,209,207,171;;
 }
 MeshTextureCoords {
  182;
  0.073488;0.691443;,
  0.092130;0.401359;,
  0.387629;0.421769;,
  0.390105;0.711853;,
  0.071861;0.374968;,
  0.367360;0.395378;,
  0.053219;0.665052;,
  0.369836;0.685462;,
  0.267223;0.301047;,
  0.301517;0.268640;,
  0.226769;0.268640;,
  0.226769;0.301047;,
  0.152020;0.268640;,
  0.186315;0.301047;,
  0.121059;0.268640;,
  0.169559;0.301047;,
  0.152020;0.268640;,
  0.186315;0.301047;,
  0.226769;0.268640;,
  0.226769;0.301047;,
  0.301517;0.268640;,
  0.267223;0.301047;,
  0.332479;0.268640;,
  0.283979;0.301047;,
  0.324432;0.220140;,
  0.226769;0.220140;,
  0.129105;0.220140;,
  0.088652;0.220140;,
  0.129105;0.220140;,
  0.226769;0.220140;,
  0.324432;0.220140;,
  0.364886;0.220140;,
  0.332479;0.162930;,
  0.226769;0.162930;,
  0.121059;0.162930;,
  0.077272;0.162930;,
  0.121059;0.162930;,
  0.226769;0.162930;,
  0.332479;0.162930;,
  0.376266;0.162930;,
  0.324432;0.105720;,
  0.226769;0.105720;,
  0.129105;0.105720;,
  0.088652;0.105720;,
  0.129105;0.105720;,
  0.226769;0.105720;,
  0.324432;0.105720;,
  0.364886;0.105720;,
  0.301517;0.057219;,
  0.226769;0.057219;,
  0.152020;0.057219;,
  0.121059;0.057219;,
  0.152020;0.057219;,
  0.226769;0.057219;,
  0.301517;0.057219;,
  0.332479;0.057219;,
  0.267223;0.024813;,
  0.226769;0.024813;,
  0.186315;0.024813;,
  0.169559;0.024813;,
  0.186315;0.024813;,
  0.226769;0.024813;,
  0.267223;0.024813;,
  0.283979;0.024813;,
  0.226769;0.312426;,
  0.226769;0.013433;,
  0.261553;0.284249;,
  0.291042;0.256383;,
  0.226767;0.256383;,
  0.226767;0.284249;,
  0.162491;0.256383;,
  0.191981;0.284249;,
  0.135867;0.256383;,
  0.177573;0.284249;,
  0.162491;0.256383;,
  0.191981;0.284249;,
  0.226767;0.256383;,
  0.226767;0.284249;,
  0.291042;0.256383;,
  0.261553;0.284249;,
  0.317666;0.256383;,
  0.275961;0.284249;,
  0.310747;0.214678;,
  0.226767;0.214678;,
  0.142787;0.214678;,
  0.108001;0.214678;,
  0.142787;0.214678;,
  0.226767;0.214678;,
  0.310747;0.214678;,
  0.345533;0.214678;,
  0.317666;0.165483;,
  0.226767;0.165483;,
  0.135867;0.165483;,
  0.098216;0.165483;,
  0.135867;0.165483;,
  0.226767;0.165483;,
  0.317666;0.165483;,
  0.355318;0.165483;,
  0.310747;0.116289;,
  0.226767;0.116289;,
  0.142787;0.116289;,
  0.108001;0.116289;,
  0.142787;0.116289;,
  0.226767;0.116289;,
  0.310747;0.116289;,
  0.345533;0.116289;,
  0.291042;0.074584;,
  0.226767;0.074584;,
  0.162491;0.074584;,
  0.135867;0.074584;,
  0.162491;0.074584;,
  0.226767;0.074584;,
  0.291042;0.074584;,
  0.317666;0.074584;,
  0.261553;0.046718;,
  0.226767;0.046718;,
  0.191981;0.046718;,
  0.177573;0.046718;,
  0.191981;0.046718;,
  0.226767;0.046718;,
  0.261553;0.046718;,
  0.275961;0.046718;,
  0.226767;0.294034;,
  0.226767;0.036932;,
  0.092760;0.674793;,
  0.082379;0.417337;,
  0.377049;0.435451;,
  0.381373;0.692907;,
  0.102240;0.393914;,
  0.351275;0.412029;,
  0.095534;0.651370;,
  0.367057;0.669485;,
  0.898774;0.835013;,
  0.907354;0.766691;,
  0.837688;0.746537;,
  0.810911;0.832849;,
  0.909007;0.748357;,
  0.910661;0.760461;,
  0.836354;0.711729;,
  0.841005;0.708817;,
  0.902080;0.794716;,
  0.809200;0.788229;,
  0.879368;0.874652;,
  0.894231;0.882033;,
  0.787554;0.909931;,
  0.782527;0.877283;,
  0.589171;0.620904;,
  0.613555;0.644109;,
  0.615342;0.789235;,
  0.576380;0.758429;,
  0.900427;0.816680;,
  0.739228;0.881419;,
  0.709011;0.887020;,
  0.721053;0.781050;,
  0.717407;0.670791;,
  0.722486;0.639214;,
  0.729761;0.638330;,
  0.739028;0.740860;,
  0.675779;0.885908;,
  0.685771;0.908660;,
  0.680256;0.779994;,
  0.675018;0.639326;,
  0.664016;0.593584;,
  0.664590;0.580954;,
  0.670045;0.712241;,
  0.590325;0.852380;,
  0.618721;0.888661;,
  0.644787;0.920875;,
  0.613513;0.889778;,
  0.646641;0.659626;,
  0.649696;0.790534;,
  0.615438;0.606237;,
  0.584166;0.574516;,
  0.576437;0.590703;,
  0.564302;0.716969;,
  0.581927;0.702243;,
  0.893546;0.894252;,
  0.783862;0.912090;,
  0.744244;0.848960;,
  0.675343;0.850289;,
  0.582312;0.835766;,
  0.577592;0.822180;;
 }
}
