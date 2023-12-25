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
 164;
 11.74299;0.00000;11.71662;,
 6.78390;17.72366;6.72914;,
 0.02636;17.34211;8.08303;,
 0.02636;0.00000;16.56979;,
 -6.78390;17.72366;6.72914;,
 -11.69026;0.00000;11.71662;,
 -8.94192;14.94207;1.41443;,
 -16.54342;0.00000;0.00000;,
 -7.18551;16.59485;-3.02728;,
 -11.69026;0.00000;-11.71662;,
 0.02636;16.56721;-7.34314;,
 0.02636;0.00000;-16.56979;,
 6.96315;16.59485;-3.28782;,
 11.74299;0.00000;-11.71662;,
 8.99466;14.94207;1.41443;,
 16.59616;0.00000;0.00000;,
 0.02636;-4.11083;11.38301;,
 0.02636;-4.11642;-0.00000;,
 8.07537;-4.11083;8.04901;,
 -8.02264;-4.11083;8.04900;,
 -11.35664;-4.11083;0.00000;,
 -8.02264;-4.11083;-8.04901;,
 0.02636;-4.11083;-11.38300;,
 8.07538;-4.11083;-8.04901;,
 11.40937;-4.11083;-0.00000;,
 0.02636;3.19763;0.00000;,
 8.21684;11.62413;-0.15236;,
 6.72766;11.62413;-0.15236;,
 6.72766;13.29931;-0.15236;,
 8.21684;13.29931;-0.15236;,
 6.72766;14.97450;-0.15236;,
 8.21684;14.97450;-0.15236;,
 6.72766;14.97450;1.02533;,
 8.21684;14.97450;1.02533;,
 6.72766;14.97450;2.94286;,
 8.21684;14.97450;2.94286;,
 6.72766;13.29931;3.19801;,
 8.21684;13.29931;3.19801;,
 6.72766;11.62413;3.19801;,
 8.21684;11.62413;3.19801;,
 6.72766;11.13722;1.02533;,
 8.21684;11.13722;1.02533;,
 6.68932;11.31124;1.07045;,
 6.68932;11.75402;3.04608;,
 6.68932;13.27726;3.04608;,
 6.68932;13.27726;1.07045;,
 6.68932;11.75402;-0.00042;,
 6.68932;13.27726;-0.00042;,
 6.68932;14.80051;2.81406;,
 6.68932;14.80051;1.07045;,
 6.68932;14.80051;-0.00042;,
 8.25517;11.75402;3.04608;,
 8.25517;11.31124;1.07045;,
 8.25518;13.27726;1.07045;,
 8.25517;13.27726;3.04608;,
 8.25517;11.75402;-0.00042;,
 8.25517;13.27726;-0.00042;,
 8.25517;14.80051;1.07045;,
 8.25517;14.80051;2.81406;,
 8.25517;14.80051;-0.00042;,
 -8.21684;11.62413;-0.15236;,
 -8.21684;13.29931;-0.15236;,
 -6.72766;13.29931;-0.15236;,
 -6.72766;11.62413;-0.15236;,
 -8.21684;14.97450;-0.15236;,
 -6.72766;14.97450;-0.15236;,
 -8.21684;14.97450;1.02533;,
 -6.72766;14.97450;1.02533;,
 -8.21684;14.97450;2.94286;,
 -6.72766;14.97450;2.94286;,
 -8.21684;13.29931;3.19801;,
 -6.72766;13.29931;3.19801;,
 -8.21684;11.62413;3.19801;,
 -6.72766;11.62413;3.19801;,
 -8.21684;11.13722;1.02533;,
 -6.72766;11.13722;1.02533;,
 -6.68932;11.31124;1.07045;,
 -6.68932;13.27726;1.07045;,
 -6.68932;13.27726;3.04608;,
 -6.68932;11.75402;3.04608;,
 -6.68932;11.75402;-0.00042;,
 -6.68932;13.27726;-0.00042;,
 -6.68932;14.80051;1.07045;,
 -6.68932;14.80051;2.81406;,
 -6.68932;14.80051;-0.00042;,
 -8.25517;11.75402;3.04608;,
 -8.25517;13.27726;3.04608;,
 -8.25517;13.27726;1.07045;,
 -8.25517;11.31124;1.07045;,
 -8.25517;13.27726;-0.00042;,
 -8.25517;11.75402;-0.00042;,
 -8.25517;14.80051;2.81406;,
 -8.25517;14.80051;1.07045;,
 -8.25517;14.80051;-0.00042;,
 0.00000;17.68707;-5.40365;,
 5.50014;17.68707;-2.06802;,
 5.50014;16.05259;-2.06802;,
 0.00000;16.05259;-5.40365;,
 0.00000;17.68707;5.20098;,
 5.50014;17.68707;5.20098;,
 0.00000;16.05259;5.20098;,
 5.50014;16.05259;5.20098;,
 -5.50014;16.05259;5.20098;,
 -5.50014;17.68707;5.20098;,
 -5.50014;17.68707;-2.06802;,
 -5.50014;16.05259;-2.06802;,
 0.00000;23.03171;-6.05699;,
 6.23101;23.50054;-2.43230;,
 7.11545;18.18392;-3.24821;,
 0.00000;17.64334;-7.33579;,
 0.00000;25.16886;5.35506;,
 4.15801;25.16886;4.66717;,
 4.15801;25.16886;-0.98445;,
 0.00000;25.16886;-3.42791;,
 0.00000;17.30555;8.08303;,
 6.78390;17.71391;6.72914;,
 6.13915;23.10225;6.13030;,
 0.00000;22.69388;8.01455;,
 0.00000;17.30555;-6.16820;,
 6.55296;17.30555;-2.20961;,
 5.77986;17.30555;5.37526;,
 0.00000;17.30555;5.37526;,
 -6.78390;17.71391;6.72914;,
 -6.13915;23.10225;6.13030;,
 -6.23101;23.50054;-2.43230;,
 -7.11545;18.18392;-3.24821;,
 -5.77986;17.30555;5.37526;,
 -6.55296;17.30555;-2.20961;,
 -4.15801;25.16886;-0.98445;,
 -4.15801;25.16886;4.66717;,
 -0.89399;21.31502;-6.36321;,
 -0.23881;42.67672;-19.18888;,
 0.23880;42.67672;-19.18888;,
 0.89399;21.31502;-6.36321;,
 -0.23880;43.49409;-17.48992;,
 0.23881;43.49409;-17.48992;,
 -0.89399;23.91039;-0.96870;,
 0.89399;23.91039;-0.96870;,
 0.00000;16.14843;-6.72043;,
 5.94594;16.14843;-2.16611;,
 5.94594;7.23696;-4.00493;,
 0.00000;7.23696;-8.55925;,
 0.00000;16.14843;4.90656;,
 5.94594;16.14843;4.90656;,
 0.00000;7.23696;8.97377;,
 6.57878;7.23696;6.13503;,
 5.61796;16.14843;6.13503;,
 0.00000;16.14843;7.36350;,
 6.90676;7.23696;4.90656;,
 0.00000;7.23696;4.90656;,
 6.84644;7.23696;-4.00493;,
 6.84644;16.14843;-2.16611;,
 -6.57878;7.23696;6.13503;,
 -5.61796;16.14843;6.13503;,
 -6.84644;16.14843;-2.16611;,
 -6.84644;7.23696;-4.00493;,
 -6.90676;7.23696;4.90656;,
 -5.94594;7.23696;-4.00493;,
 -5.94594;16.14843;-2.16611;,
 -5.94594;16.14843;4.90656;,
 0.00000;16.14843;4.90656;,
 0.00000;16.14843;-6.72043;,
 -5.94594;16.14843;-2.16611;,
 -5.94594;16.14843;4.90656;;
 
 158;
 4;0,1,2,3;,
 4;3,2,4,5;,
 4;5,4,6,7;,
 4;7,6,8,9;,
 4;9,8,10,11;,
 4;11,10,12,13;,
 4;13,12,14,15;,
 4;15,14,1,0;,
 3;16,17,18;,
 3;19,17,16;,
 3;20,17,19;,
 3;21,17,20;,
 3;22,17,21;,
 3;23,17,22;,
 3;24,17,23;,
 3;18,17,24;,
 3;1,25,2;,
 3;2,25,4;,
 3;4,25,6;,
 3;6,25,8;,
 3;8,25,10;,
 3;10,25,12;,
 3;12,25,14;,
 3;14,25,1;,
 4;3,16,18,0;,
 4;5,19,16,3;,
 4;7,20,19,5;,
 4;9,21,20,7;,
 4;11,22,21,9;,
 4;13,23,22,11;,
 4;15,24,23,13;,
 4;0,18,24,15;,
 4;26,27,28,29;,
 4;29,28,30,31;,
 4;31,30,32,33;,
 4;33,32,34,35;,
 4;35,34,36,37;,
 4;37,36,38,39;,
 4;39,38,40,41;,
 4;41,40,27,26;,
 4;42,43,44,45;,
 4;46,42,45,47;,
 4;45,44,48,49;,
 4;47,45,49,50;,
 4;51,52,53,54;,
 4;52,55,56,53;,
 4;54,53,57,58;,
 4;53,56,59,57;,
 4;40,38,43,42;,
 4;38,36,44,43;,
 4;27,40,42,46;,
 4;28,27,46,47;,
 4;36,34,48,44;,
 4;34,32,49,48;,
 4;32,30,50,49;,
 4;30,28,47,50;,
 4;39,41,52,51;,
 4;37,39,51,54;,
 4;41,26,55,52;,
 4;26,29,56,55;,
 4;33,35,58,57;,
 4;35,37,54,58;,
 4;29,31,59,56;,
 4;31,33,57,59;,
 4;60,61,62,63;,
 4;61,64,65,62;,
 4;64,66,67,65;,
 4;66,68,69,67;,
 4;68,70,71,69;,
 4;70,72,73,71;,
 4;72,74,75,73;,
 4;74,60,63,75;,
 4;76,77,78,79;,
 4;80,81,77,76;,
 4;77,82,83,78;,
 4;81,84,82,77;,
 4;85,86,87,88;,
 4;88,87,89,90;,
 4;86,91,92,87;,
 4;87,92,93,89;,
 4;75,76,79,73;,
 4;73,79,78,71;,
 4;63,80,76,75;,
 4;62,81,80,63;,
 4;71,78,83,69;,
 4;69,83,82,67;,
 4;67,82,84,65;,
 4;65,84,81,62;,
 4;72,85,88,74;,
 4;70,86,85,72;,
 4;74,88,90,60;,
 4;60,90,89,61;,
 4;66,92,91,68;,
 4;68,91,86,70;,
 4;61,89,93,64;,
 4;64,93,92,66;,
 4;94,95,96,97;,
 4;98,99,95,94;,
 4;100,101,99,98;,
 4;97,96,101,100;,
 4;96,95,99,101;,
 4;102,103,104,105;,
 4;102,105,97,100;,
 4;103,102,100,98;,
 4;104,103,98,94;,
 4;105,104,94,97;,
 4;106,107,108,109;,
 4;110,111,112,113;,
 4;114,115,116,117;,
 4;118,119,120,121;,
 4;108,107,116,115;,
 4;122,123,124,125;,
 4;126,127,118,121;,
 4;123,122,114,117;,
 4;128,129,110,113;,
 4;125,124,106,109;,
 4;110,117,116,111;,
 4;120,115,114,121;,
 4;119,108,115,120;,
 4;111,116,107,112;,
 4;112,107,108,119;,
 4;126,122,125,127;,
 4;127,125,124,128;,
 4;128,124,123,129;,
 4;129,123,117,110;,
 4;121,114,122,126;,
 4;118,109,108,119;,
 4;119,108,107,112;,
 4;112,107,106,113;,
 4;127,125,109,118;,
 4;113,106,124,128;,
 4;128,124,125,127;,
 4;130,131,132,133;,
 4;131,134,135,132;,
 4;134,136,137,135;,
 4;136,130,133,137;,
 4;133,132,135,137;,
 4;136,134,131,130;,
 4;138,139,140,141;,
 4;142,143,139,138;,
 4;144,145,146,147;,
 4;141,140,148,149;,
 4;150,151,146,145;,
 4;152,153,154,155;,
 4;156,157,141,149;,
 4;153,152,144,147;,
 4;158,159,160,161;,
 4;157,162,138,141;,
 4;142,147,146,143;,
 4;148,145,144,149;,
 4;140,150,145,148;,
 4;143,146,151,139;,
 4;139,151,150,140;,
 4;156,152,155,157;,
 4;157,155,154,162;,
 4;162,154,153,163;,
 4;163,153,147,142;,
 4;149,144,152,156;;
 
 MeshMaterialList {
  1;
  158;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
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
    "body_UV_Blue.jpg";
   }
  }
 }
 MeshNormals {
  174;
  0.636483;0.417462;0.648548;,
  0.000255;0.405465;0.914111;,
  -0.637791;0.416704;0.647750;,
  -0.916613;0.399774;-0.000635;,
  -0.671404;0.475617;-0.568335;,
  -0.001900;0.524221;-0.851580;,
  0.663152;0.478734;-0.575364;,
  0.913482;0.406838;-0.005856;,
  0.000323;0.595002;-0.803724;,
  0.228975;-0.946119;0.228975;,
  -0.000000;-0.946119;0.323820;,
  -0.000000;-1.000000;0.000000;,
  -0.228975;-0.946119;0.228975;,
  -0.323820;-0.946119;0.000000;,
  -0.228975;-0.946119;-0.228975;,
  -0.000000;-0.946119;-0.323820;,
  0.228975;-0.946119;-0.228975;,
  0.323820;-0.946119;0.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;0.075503;0.997146;,
  0.000000;0.000000;1.000000;,
  0.000000;-0.996322;-0.085685;,
  -0.992058;-0.076693;0.099693;,
  -0.994316;-0.106214;-0.007413;,
  -0.992490;0.009191;0.121977;,
  -1.000000;0.000000;0.000000;,
  -0.991840;-0.065458;-0.109402;,
  -0.992373;0.000000;-0.123272;,
  -0.993121;0.084819;0.080724;,
  -0.994126;0.108231;0.000000;,
  -0.993940;0.072598;-0.082541;,
  0.992062;-0.076675;0.099669;,
  0.994318;-0.106189;-0.007412;,
  1.000000;0.000000;-0.000001;,
  0.992494;0.009189;0.121948;,
  0.991844;-0.065443;-0.109377;,
  0.992376;0.000000;-0.123244;,
  0.994128;0.108206;-0.000001;,
  0.993124;0.084799;0.080705;,
  0.993943;0.072581;-0.082522;,
  0.992058;-0.076693;0.099693;,
  0.994316;-0.106214;-0.007413;,
  0.992490;0.009191;0.121977;,
  1.000000;0.000000;0.000000;,
  0.991840;-0.065458;-0.109402;,
  0.992373;0.000000;-0.123272;,
  0.993121;0.084819;0.080724;,
  0.994126;0.108231;0.000000;,
  0.993940;0.072598;-0.082541;,
  -0.992062;-0.076674;0.099668;,
  -0.994318;-0.106188;-0.007411;,
  -0.992494;0.009188;0.121947;,
  -0.991844;-0.065442;-0.109375;,
  -0.992377;0.000000;-0.123241;,
  -0.994129;0.108204;0.000000;,
  -0.993124;0.084798;0.080704;,
  -0.993943;0.072580;-0.082520;,
  -0.871365;0.000000;-0.490636;,
  0.871365;0.000000;-0.490636;,
  0.518553;0.000000;-0.855045;,
  -0.315934;-0.939465;-0.132629;,
  0.315934;-0.939465;-0.132629;,
  -0.357541;0.913365;-0.194754;,
  0.357541;0.913365;-0.194754;,
  -0.310416;0.911592;0.269522;,
  0.310416;0.911592;0.269522;,
  -0.236224;-0.970649;0.045150;,
  0.236224;-0.970649;0.045150;,
  0.000000;-0.978588;-0.205831;,
  0.000000;-0.998495;0.054847;,
  0.000000;0.925312;0.379207;,
  0.000000;0.954431;-0.298431;,
  0.000000;0.078366;0.996925;,
  0.000000;0.423281;0.905998;,
  0.203932;0.414386;0.886959;,
  0.239267;0.076090;0.967968;,
  0.477893;0.206793;-0.853730;,
  0.410931;0.521750;-0.747605;,
  -0.989430;0.142201;0.028425;,
  -0.922357;0.109070;0.370624;,
  -0.752610;0.629476;-0.193229;,
  -0.886701;0.461593;0.026320;,
  0.000000;0.572303;-0.820042;,
  0.000000;0.235415;-0.971895;,
  0.000000;-0.514751;-0.857340;,
  0.000000;0.901136;-0.433537;,
  0.000000;0.644813;0.764340;,
  0.000000;-1.000000;-0.000000;,
  0.316274;0.191712;-0.929095;,
  0.600077;0.161657;-0.783437;,
  0.000000;0.114449;0.993429;,
  0.305150;0.108990;0.946047;,
  0.994992;0.050475;0.086269;,
  -0.994992;0.050475;0.086269;,
  -0.429908;0.536424;-0.726243;,
  -0.000751;0.496161;-0.868230;,
  0.430871;0.537725;-0.724708;,
  0.633540;0.549394;-0.544786;,
  0.726878;0.498119;0.472786;,
  0.609032;0.471898;0.637490;,
  0.004740;0.481403;0.876486;,
  -0.601983;0.470098;0.645465;,
  -0.722133;0.492994;0.485264;,
  -0.630944;0.547949;-0.549237;,
  -0.000000;-0.783706;0.621133;,
  0.439207;-0.783706;0.439207;,
  -0.439207;-0.783706;0.439207;,
  -0.621132;-0.783706;0.000000;,
  -0.439207;-0.783706;-0.439207;,
  -0.000000;-0.783706;-0.621132;,
  0.439207;-0.783706;-0.439207;,
  0.621132;-0.783706;0.000000;,
  0.000000;0.150575;0.988599;,
  0.000000;-0.975796;0.218682;,
  0.000000;-0.924130;-0.382077;,
  -0.977275;-0.211461;-0.014758;,
  -0.982050;-0.115012;0.149503;,
  -0.970069;0.018245;0.242142;,
  -0.981596;-0.098052;-0.163876;,
  -0.969608;0.000000;-0.244663;,
  -0.984445;0.127266;0.121123;,
  -0.976572;0.215191;0.000000;,
  -0.986273;0.109053;-0.123989;,
  0.982059;-0.114983;0.149465;,
  0.977286;-0.211410;-0.014755;,
  0.970084;0.018240;0.242083;,
  0.981605;-0.098028;-0.163836;,
  0.969623;0.000000;-0.244603;,
  0.976584;0.215138;0.000000;,
  0.984453;0.127234;0.121092;,
  0.986280;0.109025;-0.123958;,
  0.977275;-0.211461;-0.014758;,
  0.982050;-0.115012;0.149503;,
  0.970069;0.018245;0.242142;,
  0.981596;-0.098052;-0.163876;,
  0.969608;0.000000;-0.244663;,
  0.984445;0.127266;0.121123;,
  0.976572;0.215191;0.000000;,
  0.986273;0.109053;-0.123989;,
  -0.982059;-0.114983;0.149465;,
  -0.977286;-0.211410;-0.014755;,
  -0.970084;0.018240;0.242083;,
  -0.981605;-0.098028;-0.163836;,
  -0.969623;0.000000;-0.244603;,
  -0.976584;0.215138;0.000000;,
  -0.984453;0.127234;0.121092;,
  -0.986280;0.109025;-0.123958;,
  -0.518553;0.000000;-0.855045;,
  0.922357;0.109070;0.370624;,
  0.898926;0.347477;0.266818;,
  0.886701;0.461593;0.026320;,
  0.989430;0.142201;0.028425;,
  -0.203932;0.414386;0.886959;,
  -0.239267;0.076090;0.967968;,
  -0.477893;0.206793;-0.853730;,
  0.354850;-0.932460;0.067824;,
  0.000000;-0.993976;0.109601;,
  0.465304;-0.863329;-0.195333;,
  -0.742114;-0.062556;-0.667348;,
  -0.354850;-0.932460;0.067824;,
  -0.465304;-0.863329;-0.195333;,
  0.742114;-0.062556;-0.667348;,
  0.000000;-0.911953;-0.410294;,
  0.742114;0.062556;0.667348;,
  -0.742114;0.062556;0.667348;,
  0.000000;-0.901131;0.433546;,
  0.999651;0.023787;-0.011447;,
  -0.999651;0.023791;-0.011443;,
  -0.305150;0.108990;0.946047;,
  -0.316274;0.191712;-0.929095;,
  -0.600077;0.161657;-0.783437;,
  0.000000;0.000000;0.000000;,
  0.000000;0.202086;-0.979368;;
  158;
  4;0,0,1,1;,
  4;1,1,2,2;,
  4;2,2,3,3;,
  4;3,3,4,4;,
  4;4,4,5,5;,
  4;5,5,6,6;,
  4;6,6,7,7;,
  4;7,7,0,0;,
  3;10,11,9;,
  3;12,11,10;,
  3;13,11,12;,
  3;14,11,13;,
  3;15,11,14;,
  3;16,11,15;,
  3;17,11,16;,
  3;9,11,17;,
  3;95,8,96;,
  3;96,8,97;,
  3;97,8,98;,
  3;99,100,100;,
  3;100,100,101;,
  3;101,102,102;,
  3;102,102,103;,
  3;104,8,95;,
  4;105,10,9,106;,
  4;107,12,10,105;,
  4;108,13,12,107;,
  4;109,14,13,108;,
  4;110,15,14,109;,
  4;111,16,15,110;,
  4;112,17,16,111;,
  4;106,9,17,112;,
  4;18,18,18,18;,
  4;18,18,18,18;,
  4;19,19,19,19;,
  4;19,19,19,19;,
  4;113,113,20,20;,
  4;20,20,21,21;,
  4;114,114,22,22;,
  4;22,22,115,115;,
  4;24,23,25,26;,
  4;27,24,26,28;,
  4;26,25,29,30;,
  4;28,26,30,31;,
  4;32,33,34,35;,
  4;33,36,37,34;,
  4;35,34,38,39;,
  4;34,37,40,38;,
  4;116,117,23,24;,
  4;117,118,25,23;,
  4;119,116,24,27;,
  4;120,119,27,28;,
  4;118,121,29,25;,
  4;121,122,30,29;,
  4;122,123,31,30;,
  4;123,120,28,31;,
  4;124,125,33,32;,
  4;126,124,32,35;,
  4;125,127,36,33;,
  4;127,128,37,36;,
  4;129,130,39,38;,
  4;130,126,35,39;,
  4;128,131,40,37;,
  4;131,129,38,40;,
  4;18,18,18,18;,
  4;18,18,18,18;,
  4;19,19,19,19;,
  4;19,19,19,19;,
  4;113,20,20,113;,
  4;20,21,21,20;,
  4;114,22,22,114;,
  4;22,115,115,22;,
  4;42,44,43,41;,
  4;45,46,44,42;,
  4;44,48,47,43;,
  4;46,49,48,44;,
  4;50,52,26,51;,
  4;51,26,54,53;,
  4;52,56,55,26;,
  4;26,55,57,54;,
  4;132,42,41,133;,
  4;133,41,43,134;,
  4;135,45,42,132;,
  4;136,46,45,135;,
  4;134,43,47,137;,
  4;137,47,48,138;,
  4;138,48,49,139;,
  4;139,49,46,136;,
  4;140,50,51,141;,
  4;142,52,50,140;,
  4;141,51,53,143;,
  4;143,53,54,144;,
  4;145,55,56,146;,
  4;146,56,52,142;,
  4;144,54,57,147;,
  4;147,57,55,145;,
  4;60,59,59,60;,
  4;19,19,19,19;,
  4;21,21,21,21;,
  4;88,88,88,88;,
  4;59,59,44,44;,
  4;26,26,58,58;,
  4;88,88,88,88;,
  4;21,21,21,21;,
  4;19,19,19,19;,
  4;58,58,148,148;,
  4;83,78,77,84;,
  4;71,66,64,72;,
  4;73,76,75,74;,
  4;69,62,68,70;,
  4;149,150,151,152;,
  4;79,82,81,80;,
  4;67,61,69,70;,
  4;153,154,73,74;,
  4;63,65,71,72;,
  4;155,155,83,84;,
  4;71,74,75,66;,
  4;68,156,157,70;,
  4;62,158,156,68;,
  4;66,151,150,64;,
  4;159,159,159,159;,
  4;67,160,161,61;,
  4;162,162,162,162;,
  4;63,81,82,65;,
  4;65,153,74,71;,
  4;70,157,160,67;,
  4;69,163,158,62;,
  4;164,149,150,164;,
  4;64,78,83,72;,
  4;61,161,163,69;,
  4;72,83,81,63;,
  4;165,165,80,165;,
  4;85,85,85,85;,
  4;86,86,86,86;,
  4;87,87,87,87;,
  4;166,166,166,166;,
  4;167,167,167,167;,
  4;168,168,168,168;,
  4;90,89,89,90;,
  4;19,19,19,19;,
  4;91,92,92,91;,
  4;88,88,88,88;,
  4;93,93,93,93;,
  4;94,94,94,94;,
  4;88,88,88,88;,
  4;169,169,91,91;,
  4;19,19,19,19;,
  4;170,170,171,171;,
  4;19,19,19,19;,
  4;88,88,88,88;,
  4;172,172,172,172;,
  4;172,172,172,172;,
  4;89,173,173,89;,
  4;172,172,172,172;,
  4;170,173,173,170;,
  4;172,172,172,172;,
  4;19,19,19,19;,
  4;88,88,88,88;;
 }
 MeshTextureCoords {
  164;
  0.299292;0.293080;,
  0.263055;0.051036;,
  0.213677;0.056247;,
  0.213677;0.293080;,
  0.163913;0.051036;,
  0.128062;0.293080;,
  0.148144;0.089023;,
  0.092599;0.293080;,
  0.160979;0.066452;,
  0.128062;0.293080;,
  0.213677;0.066829;,
  0.213677;0.293080;,
  0.264365;0.066452;,
  0.299292;0.293080;,
  0.279209;0.089023;,
  0.334754;0.293080;,
  0.213677;0.293080;,
  0.213677;0.293191;,
  0.299292;0.293080;,
  0.128062;0.293080;,
  0.092599;0.293080;,
  0.128062;0.293080;,
  0.213677;0.293080;,
  0.299292;0.293080;,
  0.334754;0.293080;,
  0.213677;0.249411;,
  0.910598;0.220288;,
  0.743365;0.220288;,
  0.743365;0.143523;,
  0.910598;0.143523;,
  0.743365;0.066757;,
  0.910598;0.066757;,
  0.743365;0.066757;,
  0.910598;0.066757;,
  0.743365;0.066757;,
  0.910598;0.066757;,
  0.743365;0.143523;,
  0.910598;0.143523;,
  0.743365;0.220288;,
  0.910598;0.220288;,
  0.743365;0.242601;,
  0.910598;0.242601;,
  0.739060;0.234626;,
  0.739060;0.214337;,
  0.739060;0.144533;,
  0.739060;0.144533;,
  0.739060;0.214337;,
  0.739060;0.144533;,
  0.739060;0.074731;,
  0.739060;0.074731;,
  0.739060;0.074731;,
  0.914903;0.214337;,
  0.914903;0.234626;,
  0.914904;0.144533;,
  0.914903;0.144533;,
  0.914903;0.214337;,
  0.914903;0.144533;,
  0.914903;0.074731;,
  0.914903;0.074731;,
  0.914903;0.074731;,
  0.746262;0.191828;,
  0.746262;0.123333;,
  0.895477;0.123333;,
  0.895477;0.191828;,
  0.746262;0.054839;,
  0.895477;0.054839;,
  0.746262;0.054839;,
  0.895477;0.054839;,
  0.746262;0.054839;,
  0.895477;0.054839;,
  0.746262;0.123333;,
  0.895477;0.123333;,
  0.746262;0.191828;,
  0.895477;0.191828;,
  0.746262;0.211737;,
  0.895477;0.211737;,
  0.899319;0.204621;,
  0.899319;0.124235;,
  0.899319;0.124235;,
  0.899319;0.186517;,
  0.899319;0.186517;,
  0.899319;0.124235;,
  0.899319;0.061954;,
  0.899319;0.061954;,
  0.899319;0.061954;,
  0.742421;0.186517;,
  0.742421;0.124235;,
  0.742421;0.124235;,
  0.742421;0.204621;,
  0.742421;0.124235;,
  0.742421;0.186517;,
  0.742421;0.061954;,
  0.742421;0.061954;,
  0.742421;0.061954;,
  0.726288;0.061101;,
  0.814210;0.061101;,
  0.814210;0.236945;,
  0.726288;0.236945;,
  0.726288;0.061101;,
  0.814210;0.061101;,
  0.726288;0.236945;,
  0.814210;0.236945;,
  0.638366;0.236945;,
  0.638366;0.061101;,
  0.638366;0.061101;,
  0.638366;0.236945;,
  0.236767;0.091156;,
  0.334500;0.077847;,
  0.348372;0.228765;,
  0.236767;0.244110;,
  0.236767;0.030490;,
  0.301985;0.030490;,
  0.301985;0.030490;,
  0.236767;0.030490;,
  0.236767;0.253700;,
  0.343171;0.242108;,
  0.333059;0.089153;,
  0.236767;0.100745;,
  0.236767;0.253700;,
  0.339549;0.253700;,
  0.327423;0.253700;,
  0.236767;0.253700;,
  0.130363;0.242108;,
  0.140476;0.089153;,
  0.139035;0.077847;,
  0.125163;0.228765;,
  0.146111;0.253700;,
  0.133985;0.253700;,
  0.171550;0.030490;,
  0.171550;0.030490;,
  0.111664;0.244109;,
  0.183042;0.056498;,
  0.235075;0.056498;,
  0.306454;0.244109;,
  0.183042;0.049319;,
  0.235075;0.049319;,
  0.111664;0.221315;,
  0.306454;0.221315;,
  0.218295;0.460332;,
  0.302141;0.460332;,
  0.302141;0.655121;,
  0.218295;0.655121;,
  0.218295;0.460332;,
  0.302141;0.460332;,
  0.218295;0.655121;,
  0.311065;0.655121;,
  0.297516;0.460332;,
  0.218295;0.460332;,
  0.315690;0.655121;,
  0.218295;0.655121;,
  0.314839;0.655121;,
  0.314839;0.460332;,
  0.125525;0.655121;,
  0.139074;0.460332;,
  0.121751;0.460332;,
  0.121751;0.655121;,
  0.120900;0.655121;,
  0.134449;0.655121;,
  -0.000000;0.219084;,
  -0.000000;0.000000;,
  0.623488;0.000000;,
  0.623488;0.360158;,
  0.134449;0.460332;,
  0.134449;0.460332;;
 }
}