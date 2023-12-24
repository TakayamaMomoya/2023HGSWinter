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
 228;
 -320.23104;381.11258;-20.00240;,
 319.84573;381.11258;-20.00240;,
 319.84573;21.06904;-20.00240;,
 -320.23104;21.06904;-20.00240;,
 319.84573;381.11258;-20.00240;,
 319.84573;381.11258;20.00240;,
 319.84573;21.06904;20.00240;,
 319.84573;21.06904;-20.00240;,
 319.84573;381.11258;20.00240;,
 -320.23104;381.11258;20.00240;,
 -320.23104;21.06904;20.00240;,
 319.84573;21.06904;20.00240;,
 -320.23104;381.11258;20.00240;,
 -320.23104;381.11258;-20.00240;,
 -320.23104;21.06904;-20.00240;,
 -320.23104;21.06904;20.00240;,
 319.84573;381.11258;-20.00240;,
 -320.23104;381.11258;-20.00240;,
 -320.23104;21.06904;-20.00240;,
 319.84573;21.06904;-20.00240;,
 304.42266;381.65953;-20.00240;,
 304.42181;367.51580;-14.14384;,
 -304.80789;367.51585;-14.14384;,
 -304.80811;381.65953;-20.00240;,
 304.42266;361.65726;0.00000;,
 -304.80811;361.65735;0.00000;,
 304.42181;367.51580;14.14384;,
 -304.80789;367.51585;14.14384;,
 304.42259;381.65953;20.00240;,
 -304.80811;381.65953;20.00240;,
 304.42234;395.80364;14.14384;,
 -304.80745;395.80364;14.14384;,
 304.42269;401.66216;-0.00000;,
 -304.80811;401.66216;-0.00000;,
 304.42242;395.80364;-14.14384;,
 -304.80745;395.80364;-14.14384;,
 304.42266;381.65953;-20.00240;,
 -304.80811;381.65953;-20.00240;,
 -319.97037;372.49490;-9.16481;,
 -319.97071;381.65997;-12.96087;,
 -319.97071;381.65982;0.00000;,
 -319.97078;368.69857;0.00000;,
 -319.97071;381.65982;0.00000;,
 -319.97037;372.49490;9.16481;,
 -319.97071;381.65982;0.00000;,
 -319.97071;381.65997;12.96087;,
 -319.97071;381.65982;0.00000;,
 -319.96985;390.82493;9.16494;,
 -319.97071;381.65982;0.00000;,
 -319.97071;394.62044;-0.00000;,
 -319.97071;381.65982;0.00000;,
 -319.96985;390.82493;-9.16494;,
 -319.97071;381.65982;0.00000;,
 -319.97071;381.65997;-12.96087;,
 -319.97071;381.65982;0.00000;,
 320.75384;381.65938;-11.27156;,
 320.75306;373.68917;-7.97035;,
 322.42940;381.65943;0.00001;,
 320.75384;370.38807;0.00001;,
 322.42940;381.65943;0.00001;,
 320.75306;373.68917;7.97037;,
 322.42940;381.65943;0.00001;,
 320.75381;381.65943;11.27159;,
 322.42940;381.65943;0.00001;,
 320.75357;389.63011;7.97028;,
 322.42940;381.65943;0.00001;,
 320.75389;392.93118;0.00002;,
 322.42940;381.65943;0.00001;,
 320.75367;389.63011;-7.97026;,
 322.42940;381.65943;0.00001;,
 320.75384;381.65938;-11.27156;,
 322.42940;381.65943;0.00001;,
 320.38301;31.55588;-20.00240;,
 306.23912;31.55632;-14.14384;,
 306.23912;371.45677;-14.14384;,
 320.38301;371.45716;-20.00240;,
 300.38064;31.55588;0.00000;,
 300.38064;371.45716;0.00000;,
 306.23912;31.55632;14.14384;,
 306.23912;371.45677;14.14384;,
 320.38301;31.55591;20.00240;,
 320.38301;371.45716;20.00240;,
 334.52693;31.55607;14.14384;,
 334.52703;371.45667;14.14384;,
 340.38543;31.55576;-0.00000;,
 340.38545;371.45721;-0.00000;,
 334.52693;31.55603;-14.14384;,
 334.52703;371.45667;-14.14384;,
 320.38301;31.55588;-20.00240;,
 320.38301;371.45716;-20.00240;,
 311.21805;379.91585;-9.16481;,
 320.38318;379.91600;-12.96087;,
 320.38311;379.91614;0.00000;,
 307.42217;379.91605;0.00000;,
 320.38311;379.91614;0.00000;,
 311.21805;379.91585;9.16481;,
 320.38311;379.91614;0.00000;,
 320.38318;379.91600;12.96087;,
 320.38311;379.91614;0.00000;,
 329.54825;379.91575;9.16494;,
 320.38311;379.91614;0.00000;,
 333.34407;379.91614;-0.00000;,
 320.38311;379.91614;0.00000;,
 329.54825;379.91575;-9.16494;,
 320.38311;379.91614;0.00000;,
 320.38318;379.91600;-12.96087;,
 320.38311;379.91614;0.00000;,
 320.38289;22.44432;-11.27156;,
 312.41258;22.44467;-7.97035;,
 320.38299;21.50947;0.00001;,
 309.11145;22.44431;0.00001;,
 320.38299;21.50947;0.00001;,
 312.41258;22.44467;7.97037;,
 320.38299;21.50947;0.00001;,
 320.38289;22.44432;11.27159;,
 320.38299;21.50947;0.00001;,
 328.35374;22.44446;7.97028;,
 320.38299;21.50947;0.00001;,
 331.65450;22.44420;0.00002;,
 320.38299;21.50947;0.00001;,
 328.35374;22.44446;-7.97026;,
 320.38299;21.50947;0.00001;,
 320.38289;22.44432;-11.27156;,
 320.38299;21.50947;0.00001;,
 304.42266;20.86855;-20.00240;,
 304.42181;6.72455;-14.14384;,
 -304.80789;6.72457;-14.14384;,
 -304.80811;20.86855;-20.00240;,
 304.42266;0.86609;0.00000;,
 -304.80811;0.86616;0.00000;,
 304.42181;6.72455;14.14384;,
 -304.80789;6.72457;14.14384;,
 304.42259;20.86855;20.00240;,
 -304.80811;20.86855;20.00240;,
 304.42234;35.01228;14.14384;,
 -304.80745;35.01238;14.14384;,
 304.42269;40.87092;-0.00000;,
 -304.80811;40.87100;-0.00000;,
 304.42242;35.01228;-14.14384;,
 -304.80745;35.01238;-14.14384;,
 304.42266;20.86855;-20.00240;,
 -304.80811;20.86855;-20.00240;,
 -319.97037;11.70352;-9.16481;,
 -319.97071;20.86887;-12.96087;,
 -319.97071;20.86876;0.00000;,
 -319.97078;7.90771;0.00000;,
 -319.97071;20.86876;0.00000;,
 -319.97037;11.70352;9.16481;,
 -319.97071;20.86876;0.00000;,
 -319.97071;20.86887;12.96087;,
 -319.97071;20.86876;0.00000;,
 -319.96985;30.03364;9.16494;,
 -319.97071;20.86876;0.00000;,
 -319.97071;33.82957;-0.00000;,
 -319.97071;20.86876;0.00000;,
 -319.96985;30.03364;-9.16494;,
 -319.97071;20.86876;0.00000;,
 -319.97071;20.86887;-12.96087;,
 -319.97071;20.86876;0.00000;,
 320.75384;20.86838;-11.27156;,
 320.75306;12.89802;-7.97035;,
 322.42940;20.86851;0.00001;,
 320.75384;9.59702;0.00001;,
 322.42940;20.86851;0.00001;,
 320.75306;12.89802;7.97037;,
 322.42940;20.86851;0.00001;,
 320.75381;20.86843;11.27159;,
 322.42940;20.86851;0.00001;,
 320.75357;28.83901;7.97028;,
 322.42940;20.86851;0.00001;,
 320.75389;32.14014;0.00002;,
 322.42940;20.86851;0.00001;,
 320.75367;28.83901;-7.97026;,
 322.42940;20.86851;0.00001;,
 320.75384;20.86838;-11.27156;,
 322.42940;20.86851;0.00001;,
 -319.99747;31.55588;-20.00240;,
 -334.14139;31.55632;-14.14384;,
 -334.14139;371.45677;-14.14384;,
 -319.99747;371.45716;-20.00240;,
 -339.99991;31.55588;0.00000;,
 -339.99991;371.45716;0.00000;,
 -334.14139;31.55632;14.14384;,
 -334.14139;371.45677;14.14384;,
 -319.99747;31.55591;20.00240;,
 -319.99747;371.45716;20.00240;,
 -305.85357;31.55607;14.14384;,
 -305.85352;371.45667;14.14384;,
 -299.99512;31.55576;-0.00000;,
 -299.99510;371.45721;-0.00000;,
 -305.85357;31.55603;-14.14384;,
 -305.85352;371.45667;-14.14384;,
 -319.99747;31.55588;-20.00240;,
 -319.99747;371.45716;-20.00240;,
 -329.16253;379.91585;-9.16481;,
 -319.99734;379.91600;-12.96087;,
 -319.99744;379.91614;0.00000;,
 -332.95850;379.91605;0.00000;,
 -319.99744;379.91614;0.00000;,
 -329.16253;379.91585;9.16481;,
 -319.99744;379.91614;0.00000;,
 -319.99734;379.91600;12.96087;,
 -319.99744;379.91614;0.00000;,
 -310.83243;379.91575;9.16494;,
 -319.99744;379.91614;0.00000;,
 -307.03653;379.91614;-0.00000;,
 -319.99744;379.91614;0.00000;,
 -310.83243;379.91575;-9.16494;,
 -319.99744;379.91614;0.00000;,
 -319.99734;379.91600;-12.96087;,
 -319.99744;379.91614;0.00000;,
 -319.99764;22.44432;-11.27156;,
 -327.96827;22.44467;-7.97035;,
 -319.99756;21.50947;0.00001;,
 -331.26907;22.44431;0.00001;,
 -319.99756;21.50947;0.00001;,
 -327.96827;22.44467;7.97037;,
 -319.99756;21.50947;0.00001;,
 -319.99764;22.44432;11.27159;,
 -319.99756;21.50947;0.00001;,
 -312.02713;22.44446;7.97028;,
 -319.99756;21.50947;0.00001;,
 -308.72601;22.44420;0.00002;,
 -319.99756;21.50947;0.00001;,
 -312.02713;22.44446;-7.97026;,
 -319.99756;21.50947;0.00001;,
 -319.99764;22.44432;-11.27156;,
 -319.99756;21.50947;0.00001;;
 
 166;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,14,15;,
 4;12,5,16,17;,
 4;18,19,6,15;,
 4;20,21,22,23;,
 4;21,24,25,22;,
 4;24,26,27,25;,
 4;26,28,29,27;,
 4;28,30,31,29;,
 4;30,32,33,31;,
 4;32,34,35,33;,
 4;34,36,37,35;,
 4;38,39,23,22;,
 3;40,39,38;,
 4;41,38,22,25;,
 3;42,38,41;,
 4;43,41,25,27;,
 3;44,41,43;,
 4;45,43,27,29;,
 3;46,43,45;,
 4;47,45,29,31;,
 3;48,45,47;,
 4;49,47,31,33;,
 3;50,47,49;,
 4;51,49,33,35;,
 3;52,49,51;,
 4;53,51,35,37;,
 3;54,51,53;,
 4;55,56,21,20;,
 3;57,56,55;,
 4;56,58,24,21;,
 3;59,58,56;,
 4;58,60,26,24;,
 3;61,60,58;,
 4;60,62,28,26;,
 3;63,62,60;,
 4;62,64,30,28;,
 3;65,64,62;,
 4;64,66,32,30;,
 3;67,66,64;,
 4;66,68,34,32;,
 3;69,68,66;,
 4;68,70,36,34;,
 3;71,70,68;,
 4;72,73,74,75;,
 4;73,76,77,74;,
 4;76,78,79,77;,
 4;78,80,81,79;,
 4;80,82,83,81;,
 4;82,84,85,83;,
 4;84,86,87,85;,
 4;86,88,89,87;,
 4;90,91,75,74;,
 3;92,91,90;,
 4;93,90,74,77;,
 3;94,90,93;,
 4;95,93,77,79;,
 3;96,93,95;,
 4;97,95,79,81;,
 3;98,95,97;,
 4;99,97,81,83;,
 3;100,97,99;,
 4;101,99,83,85;,
 3;102,99,101;,
 4;103,101,85,87;,
 3;104,101,103;,
 4;105,103,87,89;,
 3;106,103,105;,
 4;107,108,73,72;,
 3;109,108,107;,
 4;108,110,76,73;,
 3;111,110,108;,
 4;110,112,78,76;,
 3;113,112,110;,
 4;112,114,80,78;,
 3;115,114,112;,
 4;114,116,82,80;,
 3;117,116,114;,
 4;116,118,84,82;,
 3;119,118,116;,
 4;118,120,86,84;,
 3;121,120,118;,
 4;120,122,88,86;,
 3;123,122,120;,
 4;124,125,126,127;,
 4;125,128,129,126;,
 4;128,130,131,129;,
 4;130,132,133,131;,
 4;132,134,135,133;,
 4;134,136,137,135;,
 4;136,138,139,137;,
 4;138,140,141,139;,
 4;142,143,127,126;,
 3;144,143,142;,
 4;145,142,126,129;,
 3;146,142,145;,
 4;147,145,129,131;,
 3;148,145,147;,
 4;149,147,131,133;,
 3;150,147,149;,
 4;151,149,133,135;,
 3;152,149,151;,
 4;153,151,135,137;,
 3;154,151,153;,
 4;155,153,137,139;,
 3;156,153,155;,
 4;157,155,139,141;,
 3;158,155,157;,
 4;159,160,125,124;,
 3;161,160,159;,
 4;160,162,128,125;,
 3;163,162,160;,
 4;162,164,130,128;,
 3;165,164,162;,
 4;164,166,132,130;,
 3;167,166,164;,
 4;166,168,134,132;,
 3;169,168,166;,
 4;168,170,136,134;,
 3;171,170,168;,
 4;170,172,138,136;,
 3;173,172,170;,
 4;172,174,140,138;,
 3;175,174,172;,
 4;176,177,178,179;,
 4;177,180,181,178;,
 4;180,182,183,181;,
 4;182,184,185,183;,
 4;184,186,187,185;,
 4;186,188,189,187;,
 4;188,190,191,189;,
 4;190,192,193,191;,
 4;194,195,179,178;,
 3;196,195,194;,
 4;197,194,178,181;,
 3;198,194,197;,
 4;199,197,181,183;,
 3;200,197,199;,
 4;201,199,183,185;,
 3;202,199,201;,
 4;203,201,185,187;,
 3;204,201,203;,
 4;205,203,187,189;,
 3;206,203,205;,
 4;207,205,189,191;,
 3;208,205,207;,
 4;209,207,191,193;,
 3;210,207,209;,
 4;211,212,177,176;,
 3;213,212,211;,
 4;212,214,180,177;,
 3;215,214,212;,
 4;214,216,182,180;,
 3;217,216,214;,
 4;216,218,184,182;,
 3;219,218,216;,
 4;218,220,186,184;,
 3;221,220,218;,
 4;220,222,188,186;,
 3;223,222,220;,
 4;222,224,190,188;,
 3;225,224,222;,
 4;224,226,192,190;,
 3;227,226,224;;
 
 MeshMaterialList {
  3;
  166;
  0,
  1,
  1,
  1,
  1,
  1,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2;;
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\tutorial.png";
   }
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\tutorial_01.png";
   }
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\TEXTURE\\tetsu02.jpg";
   }
  }
 }
 MeshNormals {
  158;
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.245025;-0.000012;-0.969517;,
  0.245022;-0.685555;-0.685549;,
  0.245023;-0.969517;0.000000;,
  0.245022;-0.685555;0.685550;,
  0.245025;-0.000010;0.969517;,
  0.245027;0.685550;0.685553;,
  0.245027;0.969516;0.000001;,
  0.245028;0.685550;-0.685553;,
  -0.217091;-0.000000;-0.976151;,
  -0.217091;-0.690242;-0.690244;,
  -0.217088;-0.976152;0.000000;,
  -0.217091;-0.690242;0.690244;,
  -0.217091;-0.000000;0.976151;,
  -0.217088;0.690246;0.690242;,
  -0.217089;0.976152;-0.000000;,
  -0.217088;0.690246;-0.690242;,
  -0.421193;0.000005;-0.906971;,
  -0.421191;-0.641322;-0.641330;,
  -0.421188;-0.906973;0.000000;,
  -0.421191;-0.641322;0.641330;,
  -0.421193;0.000005;0.906971;,
  -0.421187;0.641332;0.641322;,
  -0.421188;0.906973;0.000000;,
  -0.421187;0.641332;-0.641322;,
  -1.000000;0.000015;-0.000000;,
  1.000000;-0.000020;0.000002;,
  0.826222;-0.000032;-0.563345;,
  0.826200;-0.398370;-0.398365;,
  0.826220;-0.563347;0.000000;,
  0.826200;-0.398369;0.398366;,
  0.826221;-0.000027;0.563345;,
  0.826218;0.398347;0.398351;,
  0.826224;0.563341;0.000005;,
  0.826221;0.398344;-0.398348;,
  -1.000000;0.000028;0.000000;,
  -1.000000;-0.000016;-0.000021;,
  -1.000000;0.000006;0.000000;,
  -1.000000;-0.000016;0.000021;,
  -1.000000;0.000028;-0.000000;,
  -1.000000;0.000047;0.000047;,
  -1.000000;0.000000;-0.000000;,
  -1.000000;0.000047;-0.000047;,
  -0.000006;-0.379566;-0.925164;,
  -0.654193;-0.379564;-0.654189;,
  -0.925165;-0.379564;-0.000000;,
  -0.654192;-0.379564;0.654189;,
  -0.000006;-0.379565;0.925165;,
  0.654193;-0.379564;0.654188;,
  0.925166;-0.379562;0.000001;,
  0.654191;-0.379568;-0.654188;,
  0.000000;0.345424;-0.938447;,
  -0.663584;0.345424;-0.663580;,
  -0.938448;0.345422;-0.000000;,
  -0.663583;0.345425;0.663580;,
  0.000000;0.345424;0.938447;,
  0.663584;0.345418;0.663583;,
  0.938450;0.345414;-0.000000;,
  0.663584;0.345418;-0.663583;,
  0.000004;0.910215;-0.414137;,
  -0.292843;0.910212;-0.292843;,
  -0.414137;0.910215;-0.000000;,
  -0.292842;0.910213;0.292843;,
  0.000004;0.910215;0.414137;,
  0.292847;0.910208;0.292852;,
  0.414139;0.910214;-0.000000;,
  0.292846;0.910208;-0.292852;,
  0.000001;1.000000;-0.000000;,
  -0.000009;-1.000000;0.000000;,
  -0.000013;-0.906133;-0.422993;,
  -0.299114;-0.906125;-0.299112;,
  -0.422994;-0.906133;-0.000000;,
  -0.299114;-0.906125;0.299112;,
  -0.000013;-0.906133;0.422994;,
  0.299104;-0.906130;0.299106;,
  0.422993;-0.906133;0.000001;,
  0.299101;-0.906132;-0.299104;,
  0.245026;-0.000005;-0.969516;,
  0.245025;-0.685554;-0.685549;,
  0.245027;-0.969516;0.000000;,
  0.245025;-0.685554;0.685550;,
  0.245025;-0.000003;0.969517;,
  0.245023;0.685552;0.685553;,
  0.245021;0.969518;0.000001;,
  0.245024;0.685552;-0.685552;,
  -0.217091;0.000008;-0.976151;,
  -0.217093;-0.690244;-0.690242;,
  -0.217091;-0.976151;0.000000;,
  -0.217093;-0.690244;0.690242;,
  -0.217091;0.000008;0.976151;,
  -0.217087;0.690244;0.690244;,
  -0.217088;0.976152;0.000000;,
  -0.217087;0.690244;-0.690244;,
  -0.421192;0.000012;-0.906971;,
  -0.421197;-0.641325;-0.641323;,
  -0.421193;-0.906971;0.000000;,
  -0.421197;-0.641325;0.641323;,
  -0.421192;0.000012;0.906971;,
  -0.421184;0.641329;0.641328;,
  -0.421188;0.906973;0.000000;,
  -0.421185;0.641329;-0.641327;,
  -1.000000;0.000015;0.000000;,
  1.000000;-0.000019;0.000002;,
  0.826222;-0.000028;-0.563344;,
  0.826202;-0.398368;-0.398363;,
  0.826222;-0.563344;-0.000000;,
  0.826202;-0.398367;0.398364;,
  0.826221;-0.000023;0.563346;,
  0.826215;0.398350;0.398354;,
  0.826221;0.563346;0.000004;,
  0.826218;0.398348;-0.398350;,
  -1.000000;0.000028;0.000000;,
  -1.000000;-0.000016;-0.000021;,
  -1.000000;0.000006;0.000000;,
  -1.000000;-0.000016;0.000021;,
  -1.000000;0.000028;-0.000000;,
  -1.000000;0.000047;0.000047;,
  -1.000000;0.000000;0.000000;,
  -1.000000;0.000047;-0.000047;,
  -0.000003;-0.379565;-0.925165;,
  -0.654193;-0.379562;-0.654190;,
  -0.925166;-0.379562;0.000000;,
  -0.654193;-0.379562;0.654189;,
  -0.000003;-0.379564;0.925165;,
  0.654190;-0.379567;0.654189;,
  0.925164;-0.379567;0.000000;,
  0.654190;-0.379568;-0.654189;,
  0.000002;0.345421;-0.938448;,
  -0.663582;0.345421;-0.663583;,
  -0.938448;0.345420;0.000000;,
  -0.663582;0.345421;0.663583;,
  0.000002;0.345421;0.938448;,
  0.663584;0.345418;0.663583;,
  0.938449;0.345419;0.000000;,
  0.663584;0.345419;-0.663583;,
  0.000005;0.910214;-0.414139;,
  -0.292843;0.910211;-0.292846;,
  -0.414138;0.910214;0.000000;,
  -0.292843;0.910211;0.292846;,
  0.000005;0.910214;0.414139;,
  0.292846;0.910208;0.292853;,
  0.414135;0.910215;0.000000;,
  0.292845;0.910208;-0.292852;,
  0.000001;1.000000;0.000000;,
  -0.000009;-1.000000;0.000000;,
  -0.000010;-0.906132;-0.422994;,
  -0.299115;-0.906125;-0.299111;,
  -0.422997;-0.906131;0.000000;,
  -0.299115;-0.906125;0.299111;,
  -0.000009;-0.906132;0.422994;,
  0.299101;-0.906131;0.299108;,
  0.422987;-0.906136;0.000000;,
  0.299101;-0.906131;-0.299107;;
  166;
  4;0,0,0,0;,
  4;1,1,1,1;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;4,4,4,4;,
  4;5,5,5,5;,
  4;6,7,15,14;,
  4;7,8,16,15;,
  4;8,9,17,16;,
  4;9,10,18,17;,
  4;10,11,19,18;,
  4;11,12,20,19;,
  4;12,13,21,20;,
  4;13,6,14,21;,
  4;23,22,14,15;,
  3;30,40,41;,
  4;24,23,15,16;,
  3;30,41,42;,
  4;25,24,16,17;,
  3;30,42,43;,
  4;26,25,17,18;,
  3;30,43,44;,
  4;27,26,18,19;,
  3;30,44,45;,
  4;28,27,19,20;,
  3;30,45,46;,
  4;29,28,20,21;,
  3;30,46,47;,
  4;22,29,21,14;,
  3;30,47,40;,
  4;32,33,7,6;,
  3;31,33,32;,
  4;33,34,8,7;,
  3;31,34,33;,
  4;34,35,9,8;,
  3;31,35,34;,
  4;35,36,10,9;,
  3;31,36,35;,
  4;36,37,11,10;,
  3;31,37,36;,
  4;37,38,12,11;,
  3;31,38,37;,
  4;38,39,13,12;,
  3;31,39,38;,
  4;39,32,6,13;,
  3;31,32,39;,
  4;48,49,57,56;,
  4;49,50,58,57;,
  4;50,51,59,58;,
  4;51,52,60,59;,
  4;52,53,61,60;,
  4;53,54,62,61;,
  4;54,55,63,62;,
  4;55,48,56,63;,
  4;65,64,56,57;,
  3;72,64,65;,
  4;66,65,57,58;,
  3;72,65,66;,
  4;67,66,58,59;,
  3;72,66,67;,
  4;68,67,59,60;,
  3;72,67,68;,
  4;69,68,60,61;,
  3;72,68,69;,
  4;70,69,61,62;,
  3;72,69,70;,
  4;71,70,62,63;,
  3;72,70,71;,
  4;64,71,63,56;,
  3;72,71,64;,
  4;74,75,49,48;,
  3;73,75,74;,
  4;75,76,50,49;,
  3;73,76,75;,
  4;76,77,51,50;,
  3;73,77,76;,
  4;77,78,52,51;,
  3;73,78,77;,
  4;78,79,53,52;,
  3;73,79,78;,
  4;79,80,54,53;,
  3;73,80,79;,
  4;80,81,55,54;,
  3;73,81,80;,
  4;81,74,48,55;,
  3;73,74,81;,
  4;82,83,91,90;,
  4;83,84,92,91;,
  4;84,85,93,92;,
  4;85,86,94,93;,
  4;86,87,95,94;,
  4;87,88,96,95;,
  4;88,89,97,96;,
  4;89,82,90,97;,
  4;99,98,90,91;,
  3;106,116,117;,
  4;100,99,91,92;,
  3;106,117,118;,
  4;101,100,92,93;,
  3;106,118,119;,
  4;102,101,93,94;,
  3;106,119,120;,
  4;103,102,94,95;,
  3;106,120,121;,
  4;104,103,95,96;,
  3;106,121,122;,
  4;105,104,96,97;,
  3;106,122,123;,
  4;98,105,97,90;,
  3;106,123,116;,
  4;108,109,83,82;,
  3;107,109,108;,
  4;109,110,84,83;,
  3;107,110,109;,
  4;110,111,85,84;,
  3;107,111,110;,
  4;111,112,86,85;,
  3;107,112,111;,
  4;112,113,87,86;,
  3;107,113,112;,
  4;113,114,88,87;,
  3;107,114,113;,
  4;114,115,89,88;,
  3;107,115,114;,
  4;115,108,82,89;,
  3;107,108,115;,
  4;124,125,133,132;,
  4;125,126,134,133;,
  4;126,127,135,134;,
  4;127,128,136,135;,
  4;128,129,137,136;,
  4;129,130,138,137;,
  4;130,131,139,138;,
  4;131,124,132,139;,
  4;141,140,132,133;,
  3;148,140,141;,
  4;142,141,133,134;,
  3;148,141,142;,
  4;143,142,134,135;,
  3;148,142,143;,
  4;144,143,135,136;,
  3;148,143,144;,
  4;145,144,136,137;,
  3;148,144,145;,
  4;146,145,137,138;,
  3;148,145,146;,
  4;147,146,138,139;,
  3;148,146,147;,
  4;140,147,139,132;,
  3;148,147,140;,
  4;150,151,125,124;,
  3;149,151,150;,
  4;151,152,126,125;,
  3;149,152,151;,
  4;152,153,127,126;,
  3;149,153,152;,
  4;153,154,128,127;,
  3;149,154,153;,
  4;154,155,129,128;,
  3;149,155,154;,
  4;155,156,130,129;,
  3;149,156,155;,
  4;156,157,131,130;,
  3;149,157,156;,
  4;157,150,124,131;,
  3;149,150,157;;
 }
 MeshTextureCoords {
  228;
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.062500;1.000000;,
  0.250000;1.000000;,
  0.187500;1.000000;,
  0.375000;1.000000;,
  0.312500;1.000000;,
  0.500000;1.000000;,
  0.437500;1.000000;,
  0.625000;1.000000;,
  0.562500;1.000000;,
  0.750000;1.000000;,
  0.687500;1.000000;,
  0.875000;1.000000;,
  0.812500;1.000000;,
  1.000000;1.000000;,
  0.937500;1.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.062500;0.000000;,
  0.250000;0.000000;,
  0.187500;0.000000;,
  0.375000;0.000000;,
  0.312500;0.000000;,
  0.500000;0.000000;,
  0.437500;0.000000;,
  0.625000;0.000000;,
  0.562500;0.000000;,
  0.750000;0.000000;,
  0.687500;0.000000;,
  0.875000;0.000000;,
  0.812500;0.000000;,
  1.000000;0.000000;,
  0.937500;0.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.062500;1.000000;,
  0.250000;1.000000;,
  0.187500;1.000000;,
  0.375000;1.000000;,
  0.312500;1.000000;,
  0.500000;1.000000;,
  0.437500;1.000000;,
  0.625000;1.000000;,
  0.562500;1.000000;,
  0.750000;1.000000;,
  0.687500;1.000000;,
  0.875000;1.000000;,
  0.812500;1.000000;,
  1.000000;1.000000;,
  0.937500;1.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.062500;0.000000;,
  0.250000;0.000000;,
  0.187500;0.000000;,
  0.375000;0.000000;,
  0.312500;0.000000;,
  0.500000;0.000000;,
  0.437500;0.000000;,
  0.625000;0.000000;,
  0.562500;0.000000;,
  0.750000;0.000000;,
  0.687500;0.000000;,
  0.875000;0.000000;,
  0.812500;0.000000;,
  1.000000;0.000000;,
  0.937500;0.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.062500;1.000000;,
  0.250000;1.000000;,
  0.187500;1.000000;,
  0.375000;1.000000;,
  0.312500;1.000000;,
  0.500000;1.000000;,
  0.437500;1.000000;,
  0.625000;1.000000;,
  0.562500;1.000000;,
  0.750000;1.000000;,
  0.687500;1.000000;,
  0.875000;1.000000;,
  0.812500;1.000000;,
  1.000000;1.000000;,
  0.937500;1.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.062500;0.000000;,
  0.250000;0.000000;,
  0.187500;0.000000;,
  0.375000;0.000000;,
  0.312500;0.000000;,
  0.500000;0.000000;,
  0.437500;0.000000;,
  0.625000;0.000000;,
  0.562500;0.000000;,
  0.750000;0.000000;,
  0.687500;0.000000;,
  0.875000;0.000000;,
  0.812500;0.000000;,
  1.000000;0.000000;,
  0.937500;0.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.062500;1.000000;,
  0.250000;1.000000;,
  0.187500;1.000000;,
  0.375000;1.000000;,
  0.312500;1.000000;,
  0.500000;1.000000;,
  0.437500;1.000000;,
  0.625000;1.000000;,
  0.562500;1.000000;,
  0.750000;1.000000;,
  0.687500;1.000000;,
  0.875000;1.000000;,
  0.812500;1.000000;,
  1.000000;1.000000;,
  0.937500;1.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.062500;0.000000;,
  0.250000;0.000000;,
  0.187500;0.000000;,
  0.375000;0.000000;,
  0.312500;0.000000;,
  0.500000;0.000000;,
  0.437500;0.000000;,
  0.625000;0.000000;,
  0.562500;0.000000;,
  0.750000;0.000000;,
  0.687500;0.000000;,
  0.875000;0.000000;,
  0.812500;0.000000;,
  1.000000;0.000000;,
  0.937500;0.000000;;
 }
}
