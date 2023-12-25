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
 130;
 -43.98445;-3.74271;-0.21652;,
 -44.29408;-3.12198;-0.06697;,
 -43.02535;-2.64155;-0.20775;,
 -42.71377;-3.26619;-0.08012;,
 -41.86726;-1.93932;-0.10221;,
 -41.55303;-2.56926;-0.19157;,
 -40.56085;-1.53443;-0.26486;,
 -40.27259;-2.11231;0.02925;,
 -39.43289;-0.77178;-0.14972;,
 -39.11614;-1.40678;-0.14972;,
 -44.22733;-3.25580;0.62670;,
 -43.08232;-2.52734;0.49029;,
 -41.82737;-2.01928;0.60175;,
 -40.69213;-1.27124;0.38093;,
 -39.43289;-0.77178;0.55989;,
 -43.91769;-3.87654;0.47715;,
 -42.77074;-3.15198;0.61792;,
 -41.51315;-2.64922;0.51239;,
 -40.40387;-1.84913;0.67504;,
 -39.11614;-1.40678;0.55989;,
 -43.98445;-3.74271;-0.21652;,
 -42.71377;-3.26619;-0.08012;,
 -41.55303;-2.56926;-0.19157;,
 -40.27259;-2.11231;0.02925;,
 -39.11614;-1.40678;-0.14972;,
 -39.43289;-0.77178;0.55989;,
 -39.11614;-1.40678;0.55989;,
 -43.91769;-3.87654;0.47715;,
 -44.22733;-3.25580;0.62670;,
 -43.46023;3.23733;0.38748;,
 -43.19079;3.87654;0.53703;,
 -41.99998;3.22658;0.39626;,
 -42.27111;2.58334;0.52389;,
 -40.71289;2.80502;0.50179;,
 -40.98632;2.15632;0.41243;,
 -39.55487;2.07727;0.33914;,
 -39.80570;1.48218;0.63325;,
 -38.24156;1.71791;0.45429;,
 -38.51718;1.06402;0.45429;,
 -43.24888;3.73873;1.23071;,
 -41.95041;3.34419;1.09430;,
 -40.74760;2.72267;1.20576;,
 -39.44063;2.34829;0.98494;,
 -38.24156;1.71791;1.16390;,
 -43.51831;3.09952;1.08116;,
 -42.22154;2.70095;1.22193;,
 -41.02103;2.07398;1.11640;,
 -39.69146;1.75319;1.27905;,
 -38.51718;1.06402;1.16390;,
 -43.46023;3.23733;0.38748;,
 -42.27111;2.58334;0.52389;,
 -40.98632;2.15632;0.41243;,
 -39.80570;1.48218;0.63325;,
 -38.51718;1.06402;0.45429;,
 -38.24156;1.71791;1.16390;,
 -38.51718;1.06402;1.16390;,
 -43.51831;3.09952;1.08116;,
 -43.24888;3.73873;1.23071;,
 -35.68663;-0.97464;-0.78691;,
 -35.68663;0.65747;-0.43503;,
 -26.76497;0.33653;-0.76625;,
 -26.76497;-1.30586;-0.46596;,
 -17.84332;0.59877;-0.51795;,
 -17.84332;-1.05757;-0.72820;,
 -8.92166;0.07921;-0.90064;,
 -8.92166;-1.44025;-0.20864;,
 0.00000;0.50029;-0.62972;,
 0.00000;-1.16933;-0.62972;,
 -35.68663;0.30560;1.19709;,
 -26.76497;0.63682;0.87614;,
 -17.84332;0.38852;1.13837;,
 -8.92166;0.77121;0.61882;,
 0.00000;0.50029;1.03990;,
 -35.68663;-1.32652;0.84521;,
 -26.76497;-1.00557;1.17643;,
 -17.84332;-1.26781;0.92813;,
 -8.92166;-0.74826;1.31082;,
 0.00000;-1.16933;1.03990;,
 -35.68663;-0.97464;-0.78691;,
 -26.76497;-1.30586;-0.46596;,
 -17.84332;-1.05757;-0.72820;,
 -8.92166;-1.44025;-0.20864;,
 0.00000;-1.16933;-0.62972;,
 0.00000;0.50029;1.03990;,
 0.00000;-1.16933;1.03990;,
 -35.68663;-1.32652;0.84521;,
 -35.68663;0.30560;1.19709;,
 -39.44288;-2.23342;-0.91008;,
 -38.60846;2.54653;0.35781;,
 -34.66293;1.21031;1.16747;,
 -35.77342;-1.19842;-1.71369;,
 -39.44288;2.54653;1.71369;,
 -36.15524;1.84660;1.71369;,
 -39.43673;-1.56371;1.46481;,
 -35.42950;-1.81182;1.50673;,
 -39.44288;-2.23342;-0.91008;,
 -35.77342;-1.19842;-1.71369;,
 -36.15524;1.84660;1.71369;,
 -35.42950;-1.81182;1.50673;,
 -39.43673;-1.56371;1.46481;,
 -39.44288;2.54653;1.71369;,
 -44.44838;-0.25641;-0.21652;,
 -44.44838;0.43726;-0.06697;,
 -43.09861;0.30085;-0.20775;,
 -43.09861;-0.39719;-0.08012;,
 -41.74884;0.41231;-0.10221;,
 -41.74884;-0.29166;-0.19157;,
 -40.39906;0.19149;-0.26486;,
 -40.39906;-0.45430;0.02925;,
 -39.04930;0.37045;-0.14972;,
 -39.04930;-0.33916;-0.14972;,
 -44.44838;0.28771;0.62670;,
 -43.09861;0.42848;0.49029;,
 -41.74884;0.32295;0.60175;,
 -40.39906;0.48560;0.38093;,
 -39.04930;0.37045;0.55989;,
 -44.44838;-0.40597;0.47715;,
 -43.09861;-0.26956;0.61792;,
 -41.74884;-0.38101;0.51239;,
 -40.39906;-0.16020;0.67504;,
 -39.04930;-0.33916;0.55989;,
 -44.44838;-0.25641;-0.21652;,
 -43.09861;-0.39719;-0.08012;,
 -41.74884;-0.29166;-0.19157;,
 -40.39906;-0.45430;0.02925;,
 -39.04930;-0.33916;-0.14972;,
 -39.04930;0.37045;0.55989;,
 -39.04930;-0.33916;0.55989;,
 -44.44838;-0.40597;0.47715;,
 -44.44838;0.28771;0.62670;;
 
 78;
 4;0,1,2,3;,
 4;3,2,4,5;,
 4;5,4,6,7;,
 4;7,6,8,9;,
 4;1,10,11,2;,
 4;2,11,12,4;,
 4;4,12,13,6;,
 4;6,13,14,8;,
 4;10,15,16,11;,
 4;11,16,17,12;,
 4;12,17,18,13;,
 4;13,18,19,14;,
 4;15,20,21,16;,
 4;16,21,22,17;,
 4;17,22,23,18;,
 4;18,23,24,19;,
 4;9,8,25,26;,
 4;27,28,1,0;,
 4;29,30,31,32;,
 4;32,31,33,34;,
 4;34,33,35,36;,
 4;36,35,37,38;,
 4;30,39,40,31;,
 4;31,40,41,33;,
 4;33,41,42,35;,
 4;35,42,43,37;,
 4;39,44,45,40;,
 4;40,45,46,41;,
 4;41,46,47,42;,
 4;42,47,48,43;,
 4;44,49,50,45;,
 4;45,50,51,46;,
 4;46,51,52,47;,
 4;47,52,53,48;,
 4;38,37,54,55;,
 4;56,57,30,29;,
 4;58,59,60,61;,
 4;61,60,62,63;,
 4;63,62,64,65;,
 4;65,64,66,67;,
 4;59,68,69,60;,
 4;60,69,70,62;,
 4;62,70,71,64;,
 4;64,71,72,66;,
 4;68,73,74,69;,
 4;69,74,75,70;,
 4;70,75,76,71;,
 4;71,76,77,72;,
 4;73,78,79,74;,
 4;74,79,80,75;,
 4;75,80,81,76;,
 4;76,81,82,77;,
 4;67,66,83,84;,
 4;85,86,59,58;,
 4;87,88,89,90;,
 4;88,91,92,89;,
 4;91,93,94,92;,
 4;93,95,96,94;,
 4;90,89,97,98;,
 4;99,100,88,87;,
 4;101,102,103,104;,
 4;104,103,105,106;,
 4;106,105,107,108;,
 4;108,107,109,110;,
 4;102,111,112,103;,
 4;103,112,113,105;,
 4;105,113,114,107;,
 4;107,114,115,109;,
 4;111,116,117,112;,
 4;112,117,118,113;,
 4;113,118,119,114;,
 4;114,119,120,115;,
 4;116,121,122,117;,
 4;117,122,123,118;,
 4;118,123,124,119;,
 4;119,124,125,120;,
 4;110,109,126,127;,
 4;128,129,102,101;;
 
 MeshMaterialList {
  1;
  78;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
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
   0.398431;0.181961;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  92;
  -0.007035;0.014091;-0.999876;,
  0.002575;-0.005163;-0.999983;,
  0.039641;-0.079463;-0.996049;,
  0.080839;-0.162066;-0.983463;,
  0.094652;-0.189761;-0.977257;,
  -0.446311;0.894739;0.015746;,
  -0.446360;0.894835;-0.005772;,
  -0.444604;0.891314;-0.088803;,
  -0.438988;0.880050;-0.181110;,
  -0.436220;0.874496;-0.212058;,
  0.007031;-0.014090;0.999876;,
  -0.002576;0.005164;0.999983;,
  -0.039639;0.079463;0.996049;,
  -0.080839;0.162064;0.983463;,
  -0.094653;0.189759;0.977257;,
  0.006119;0.014512;-0.999876;,
  -0.002241;-0.005317;-0.999983;,
  -0.034492;-0.081829;-0.996049;,
  -0.070342;-0.166889;-0.983463;,
  -0.082362;-0.195408;-0.977257;,
  0.388361;0.921373;0.015752;,
  0.388404;0.921471;-0.005767;,
  0.386876;0.917846;-0.088798;,
  0.381991;0.906247;-0.181106;,
  0.379584;0.900527;-0.212056;,
  -0.006116;-0.014514;0.999876;,
  0.002240;0.005316;0.999983;,
  0.034490;0.081828;0.996050;,
  0.070345;0.166885;0.983464;,
  0.082368;0.195402;0.977258;,
  0.000000;0.015753;-0.999876;,
  -0.000000;-0.005768;-0.999983;,
  0.000000;-0.088801;-0.996049;,
  0.000000;-0.181108;-0.983463;,
  -0.000000;-0.212056;-0.977258;,
  -0.000000;0.999876;0.015750;,
  -0.000000;0.999983;-0.005769;,
  -0.000000;0.996049;-0.088800;,
  0.000000;0.983463;-0.181107;,
  -0.000000;0.977258;-0.212056;,
  0.000000;-0.015753;0.999876;,
  0.000000;0.005769;0.999983;,
  -0.000000;0.088803;0.996049;,
  -0.000000;0.181108;0.983463;,
  -0.000000;0.212055;0.977258;,
  0.040389;0.506874;-0.861074;,
  0.278340;0.960451;-0.007803;,
  -0.013491;-0.059860;0.998116;,
  -0.000005;0.015749;-0.999876;,
  -0.000000;-0.005770;-0.999983;,
  0.000003;-0.088802;-0.996049;,
  -0.000002;-0.181108;-0.983463;,
  -0.000005;-0.212056;-0.977257;,
  0.000002;0.999876;0.015749;,
  -0.000000;0.999983;-0.005770;,
  -0.000001;0.996049;-0.088801;,
  0.000001;0.983463;-0.181108;,
  0.000003;0.977257;-0.212056;,
  0.000002;-0.015748;0.999876;,
  -0.000000;0.005771;0.999983;,
  -0.000001;0.088800;0.996050;,
  0.000002;0.181105;0.983464;,
  0.000004;0.212054;0.977258;,
  0.446313;-0.894738;-0.015754;,
  0.446361;-0.894834;0.005770;,
  0.444604;-0.891314;0.088806;,
  0.438985;-0.880052;0.181109;,
  0.436216;-0.874499;0.212055;,
  0.894849;0.446369;0.000000;,
  -0.894849;-0.446369;0.000004;,
  -0.388365;-0.921371;-0.015748;,
  -0.388405;-0.921471;0.005771;,
  -0.386876;-0.917846;0.088799;,
  -0.381986;-0.906250;0.181102;,
  -0.379575;-0.900532;0.212050;,
  0.921487;-0.388409;-0.000000;,
  -0.921485;0.388415;0.000002;,
  0.000000;-0.999876;-0.015753;,
  -0.000000;-0.999983;0.005769;,
  -0.000000;-0.996049;0.088802;,
  0.000000;-0.983464;0.181106;,
  0.000000;-0.977258;0.212053;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  0.084034;-0.995877;0.034177;,
  0.845901;-0.157357;0.509598;,
  -0.948472;0.111220;-0.296700;,
  -0.000001;-0.999876;-0.015756;,
  0.000000;-0.999983;0.005770;,
  0.000001;-0.996049;0.088805;,
  -0.000000;-0.983464;0.181105;,
  -0.000001;-0.977259;0.212050;;
  78;
  4;0,0,1,1;,
  4;1,1,2,2;,
  4;2,2,3,3;,
  4;3,3,4,4;,
  4;5,5,6,6;,
  4;6,6,7,7;,
  4;7,7,8,8;,
  4;8,8,9,9;,
  4;10,10,11,11;,
  4;11,11,12,12;,
  4;12,12,13,13;,
  4;13,13,14,14;,
  4;63,63,64,64;,
  4;64,64,65,65;,
  4;65,65,66,66;,
  4;66,66,67,67;,
  4;68,68,68,68;,
  4;69,69,69,69;,
  4;15,15,16,16;,
  4;16,16,17,17;,
  4;17,17,18,18;,
  4;18,18,19,19;,
  4;20,20,21,21;,
  4;21,21,22,22;,
  4;22,22,23,23;,
  4;23,23,24,24;,
  4;25,25,26,26;,
  4;26,26,27,27;,
  4;27,27,28,28;,
  4;28,28,29,29;,
  4;70,70,71,71;,
  4;71,71,72,72;,
  4;72,72,73,73;,
  4;73,73,74,74;,
  4;75,75,75,75;,
  4;76,76,76,76;,
  4;30,30,31,31;,
  4;31,31,32,32;,
  4;32,32,33,33;,
  4;33,33,34,34;,
  4;35,35,36,36;,
  4;36,36,37,37;,
  4;37,37,38,38;,
  4;38,38,39,39;,
  4;40,40,41,41;,
  4;41,41,42,42;,
  4;42,42,43,43;,
  4;43,43,44,44;,
  4;77,77,78,78;,
  4;78,78,79,79;,
  4;79,79,80,80;,
  4;80,80,81,81;,
  4;82,82,82,82;,
  4;83,83,83,83;,
  4;45,45,45,45;,
  4;46,46,46,46;,
  4;47,47,47,47;,
  4;84,84,84,84;,
  4;85,85,85,85;,
  4;86,86,86,86;,
  4;48,48,49,49;,
  4;49,49,50,50;,
  4;50,50,51,51;,
  4;51,51,52,52;,
  4;53,53,54,54;,
  4;54,54,55,55;,
  4;55,55,56,56;,
  4;56,56,57,57;,
  4;58,58,59,59;,
  4;59,59,60,60;,
  4;60,60,61,61;,
  4;61,61,62,62;,
  4;87,87,88,88;,
  4;88,88,89,89;,
  4;89,89,90,90;,
  4;90,90,91,91;,
  4;82,82,82,82;,
  4;83,83,83,83;;
 }
 MeshTextureCoords {
  130;
  0.375000;1.000000;,
  0.375000;0.750000;,
  0.437500;0.750000;,
  0.437500;1.000000;,
  0.500000;0.750000;,
  0.500000;1.000000;,
  0.562500;0.750000;,
  0.562500;1.000000;,
  0.625000;0.750000;,
  0.625000;1.000000;,
  0.375000;0.500000;,
  0.437500;0.500000;,
  0.500000;0.500000;,
  0.562500;0.500000;,
  0.625000;0.500000;,
  0.375000;0.250000;,
  0.437500;0.250000;,
  0.500000;0.250000;,
  0.562500;0.250000;,
  0.625000;0.250000;,
  0.375000;0.000000;,
  0.437500;0.000000;,
  0.500000;0.000000;,
  0.562500;0.000000;,
  0.625000;0.000000;,
  0.875000;0.750000;,
  0.875000;1.000000;,
  0.125000;1.000000;,
  0.125000;0.750000;,
  0.375000;1.000000;,
  0.375000;0.750000;,
  0.437500;0.750000;,
  0.437500;1.000000;,
  0.500000;0.750000;,
  0.500000;1.000000;,
  0.562500;0.750000;,
  0.562500;1.000000;,
  0.625000;0.750000;,
  0.625000;1.000000;,
  0.375000;0.500000;,
  0.437500;0.500000;,
  0.500000;0.500000;,
  0.562500;0.500000;,
  0.625000;0.500000;,
  0.375000;0.250000;,
  0.437500;0.250000;,
  0.500000;0.250000;,
  0.562500;0.250000;,
  0.625000;0.250000;,
  0.375000;0.000000;,
  0.437500;0.000000;,
  0.500000;0.000000;,
  0.562500;0.000000;,
  0.625000;0.000000;,
  0.875000;0.750000;,
  0.875000;1.000000;,
  0.125000;1.000000;,
  0.125000;0.750000;,
  0.375000;1.000000;,
  0.375000;0.750000;,
  0.437500;0.750000;,
  0.437500;1.000000;,
  0.500000;0.750000;,
  0.500000;1.000000;,
  0.562500;0.750000;,
  0.562500;1.000000;,
  0.625000;0.750000;,
  0.625000;1.000000;,
  0.375000;0.500000;,
  0.437500;0.500000;,
  0.500000;0.500000;,
  0.562500;0.500000;,
  0.625000;0.500000;,
  0.375000;0.250000;,
  0.437500;0.250000;,
  0.500000;0.250000;,
  0.562500;0.250000;,
  0.625000;0.250000;,
  0.375000;0.000000;,
  0.437500;0.000000;,
  0.500000;0.000000;,
  0.562500;0.000000;,
  0.625000;0.000000;,
  0.875000;0.750000;,
  0.875000;1.000000;,
  0.125000;1.000000;,
  0.125000;0.750000;,
  0.375000;1.000000;,
  0.375000;0.750000;,
  0.625000;0.750000;,
  0.625000;1.000000;,
  0.375000;0.500000;,
  0.625000;0.500000;,
  0.375000;0.250000;,
  0.625000;0.250000;,
  0.375000;0.000000;,
  0.625000;0.000000;,
  0.875000;0.750000;,
  0.875000;1.000000;,
  0.125000;1.000000;,
  0.125000;0.750000;,
  0.375000;1.000000;,
  0.375000;0.750000;,
  0.437500;0.750000;,
  0.437500;1.000000;,
  0.500000;0.750000;,
  0.500000;1.000000;,
  0.562500;0.750000;,
  0.562500;1.000000;,
  0.625000;0.750000;,
  0.625000;1.000000;,
  0.375000;0.500000;,
  0.437500;0.500000;,
  0.500000;0.500000;,
  0.562500;0.500000;,
  0.625000;0.500000;,
  0.375000;0.250000;,
  0.437500;0.250000;,
  0.500000;0.250000;,
  0.562500;0.250000;,
  0.625000;0.250000;,
  0.375000;0.000000;,
  0.437500;0.000000;,
  0.500000;0.000000;,
  0.562500;0.000000;,
  0.625000;0.000000;,
  0.875000;0.750000;,
  0.875000;1.000000;,
  0.125000;1.000000;,
  0.125000;0.750000;;
 }
}