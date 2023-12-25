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
 226;
 2.23093;2.46105;-8.61650;,
 1.15927;2.86937;-11.93278;,
 7.78978;6.29302;-11.93278;,
 8.60290;5.88471;-9.09997;,
 -0.21616;11.06282;-9.36797;,
 -0.21614;10.61140;9.94507;,
 5.28336;14.40718;9.94507;,
 5.28337;14.85853;-9.36797;,
 2.29605;3.15091;11.80478;,
 3.36769;1.59829;8.99823;,
 8.86718;5.39406;9.27620;,
 8.14069;6.94675;11.80478;,
 0.44696;9.05881;9.57679;,
 0.02053;9.51010;-9.36797;,
 6.35499;13.30594;-9.36797;,
 6.35498;12.85459;9.94507;,
 0.39363;7.94070;-11.12564;,
 6.33101;11.73651;-11.12564;,
 5.65646;12.40849;-12.09110;,
 0.15697;8.61269;-12.09110;,
 0.19708;9.44836;11.39639;,
 6.10507;13.24418;11.76467;,
 6.75719;11.54476;11.12495;,
 0.52023;8.25963;11.10852;,
 31.46083;-0.07540;-5.78726;,
 12.86067;-3.15828;-8.13192;,
 12.86067;13.31882;-8.13192;,
 31.46083;12.35902;-5.78726;,
 0.08845;5.97792;0.00000;,
 0.08845;5.97792;-7.95063;,
 0.04423;4.25605;-7.95063;,
 0.04423;4.25605;0.00000;,
 12.86067;-3.15828;8.13192;,
 31.46083;-0.07540;5.78725;,
 31.46083;12.35902;5.78725;,
 12.86067;13.31882;8.13192;,
 32.35522;-0.84671;5.31508;,
 32.35522;-0.84671;-5.31508;,
 32.35522;13.13029;-5.31508;,
 32.35522;13.13029;5.31508;,
 31.46083;13.75116;-4.72848;,
 12.86067;13.85544;-7.07314;,
 12.86067;13.85544;7.07314;,
 31.46083;13.75116;4.72847;,
 31.46083;-1.46750;4.72847;,
 12.86067;-4.55039;7.07314;,
 12.86067;-4.55039;-7.07314;,
 31.46083;-1.46750;-4.72848;,
 11.44753;13.61707;-7.95063;,
 11.44753;-4.31202;-7.95063;,
 11.44753;-4.31202;7.95063;,
 11.44753;13.61707;7.95063;,
 0.00000;-4.31202;-7.95063;,
 0.08845;5.97792;7.95063;,
 0.00000;-4.31202;7.95063;,
 0.04423;4.25605;7.95063;,
 0.00000;-4.31202;-0.00000;,
 -6.62992;0.00000;0.00000;,
 -6.61591;2.71335;0.00000;,
 -6.61591;2.71335;-5.03564;,
 -6.62992;0.00000;-5.03564;,
 -6.62992;0.00000;5.03564;,
 -6.61591;2.71335;5.03564;,
 -6.64392;-2.71336;0.00000;,
 -6.64392;-2.71336;-5.03564;,
 -6.64392;-2.71336;5.03564;,
 16.16456;10.86384;-9.42191;,
 15.99555;11.21129;-11.93278;,
 21.20021;14.51521;-11.93278;,
 21.41723;14.13533;-9.62430;,
 13.71749;19.46558;-9.36797;,
 13.71749;19.01420;9.94507;,
 19.21699;22.80998;9.94507;,
 19.21700;23.26133;-9.36797;,
 16.22968;11.71133;11.89743;,
 16.53861;10.48368;9.86371;,
 21.12596;13.94130;9.86371;,
 20.87235;15.50713;11.89743;,
 14.38060;17.46160;9.57679;,
 13.95413;17.91288;-9.36797;,
 20.28865;21.70870;-9.36797;,
 20.28863;21.25734;9.94507;,
 14.32727;16.34349;-11.12564;,
 20.26465;20.13930;-11.12564;,
 19.59008;20.81127;-12.09110;,
 14.09060;17.01549;-12.09110;,
 14.13070;17.85115;11.39639;,
 20.03873;21.64694;11.76467;,
 20.69081;19.94755;11.12495;,
 14.45386;16.66244;11.10852;,
 12.42480;15.11424;-2.71221;,
 12.42480;20.98350;-2.71221;,
 10.35014;20.98350;-1.93079;,
 10.35014;14.39902;-1.93079;,
 8.27545;20.98350;-2.71221;,
 8.27545;13.37688;-2.71221;,
 7.41608;20.98350;-4.59870;,
 7.41608;13.37688;-4.59870;,
 8.27545;20.98350;-6.48520;,
 8.27545;13.37688;-6.48520;,
 10.35014;20.98350;-7.26661;,
 10.35014;14.39902;-7.26661;,
 12.42480;20.98350;-6.48520;,
 12.42480;15.11424;-6.48520;,
 13.28418;20.98350;-4.59870;,
 13.28418;15.11424;-4.59870;,
 10.35014;15.11424;-4.59870;,
 27.53606;32.04050;-2.71272;,
 25.40639;31.70435;-4.59871;,
 25.40639;31.70435;-1.93077;,
 23.33167;31.32097;-2.71220;,
 22.47230;31.32097;-4.59871;,
 23.33167;31.32097;-6.48522;,
 25.40639;31.70435;-7.26664;,
 27.53606;32.04050;-6.48573;,
 29.58032;32.59855;-4.59923;,
 15.76079;24.54635;-2.71221;,
 13.68611;24.54635;-1.93079;,
 11.61141;24.54635;-2.71221;,
 10.75205;24.54635;-4.59870;,
 11.61141;24.54635;-6.48520;,
 13.68611;24.54635;-7.26661;,
 15.76079;24.54635;-6.48520;,
 16.62015;24.54635;-4.59870;,
 22.41830;28.04251;-2.71220;,
 20.34360;28.04251;-1.93077;,
 18.26890;28.04251;-2.71218;,
 17.40954;28.04251;-4.59870;,
 18.26890;28.04251;-6.48522;,
 20.34360;28.04251;-7.26664;,
 22.41830;28.04251;-6.48521;,
 23.27767;28.04251;-4.59870;,
 20.12406;6.61820;-9.78147;,
 3.45183;-2.62296;-8.43439;,
 -2.87696;5.26703;-8.43439;,
 24.61591;22.50756;-9.78147;,
 3.08944;-3.55369;-8.24355;,
 3.08944;-3.55369;8.49458;,
 -4.02444;5.31508;8.49458;,
 -4.02444;5.31508;-8.24355;,
 3.45183;-2.62296;8.68542;,
 20.12406;6.61820;10.03249;,
 24.61591;22.50756;10.03249;,
 -2.87696;5.26703;8.68542;,
 4.37421;-3.43584;7.66674;,
 4.06331;-3.32363;-7.12094;,
 12.16648;13.96203;-6.21573;,
 12.16648;13.96203;6.46676;,
 23.84553;23.46794;-7.96898;,
 -3.35063;5.85752;-7.31989;,
 -3.35063;5.85752;7.57091;,
 23.84553;23.46794;8.22001;,
 21.32791;6.54038;-8.97317;,
 24.96614;23.49390;-8.97317;,
 24.96614;23.49390;9.22420;,
 21.32791;6.54038;9.22420;,
 20.89440;5.65784;-7.96898;,
 4.06331;-3.32363;-7.12094;,
 4.37421;-3.43584;7.66674;,
 20.89440;5.65784;8.22001;,
 9.36520;6.77992;-9.05271;,
 8.29357;7.18822;-11.93278;,
 14.92404;10.61189;-11.93278;,
 15.73718;10.20360;-9.41268;,
 6.91814;15.38164;-9.36797;,
 6.91814;14.93025;9.94507;,
 12.41763;18.72606;9.94507;,
 12.41765;19.17738;-9.36797;,
 9.43032;7.46980;11.80478;,
 10.50197;5.91717;9.42360;,
 16.00145;9.71290;9.86371;,
 15.27494;11.26561;11.80478;,
 7.58124;13.37766;9.57679;,
 7.15479;13.82898;-9.36797;,
 13.48927;17.62479;-9.36797;,
 13.48927;17.17341;9.94507;,
 7.52791;12.25955;-11.12564;,
 13.46530;16.05536;-11.12564;,
 12.79072;16.72737;-12.09110;,
 7.29125;12.93155;-12.09110;,
 7.33134;13.76724;11.39639;,
 13.23937;17.56300;11.76467;,
 13.89148;15.86363;11.12495;,
 7.65450;12.57847;11.10852;,
 12.42480;15.11424;6.64715;,
 12.42480;20.98350;6.64715;,
 10.35014;20.98350;7.42857;,
 10.35014;14.39902;7.42857;,
 8.27545;20.98350;6.64715;,
 8.27545;13.37688;6.64715;,
 7.41608;20.98350;4.76066;,
 7.41608;13.37688;4.76066;,
 8.27545;20.98350;2.87416;,
 8.27545;13.37688;2.87416;,
 10.35014;20.98350;2.09275;,
 10.35014;14.39902;2.09275;,
 12.42480;20.98350;2.87416;,
 12.42480;15.11424;2.87416;,
 13.28418;20.98350;4.76066;,
 13.28418;15.11424;4.76066;,
 10.35014;15.11424;4.76066;,
 27.53606;32.04050;6.64664;,
 25.40639;31.70435;4.76066;,
 25.40639;31.70435;7.42859;,
 23.33167;31.32097;6.64716;,
 22.47230;31.32097;4.76065;,
 23.33167;31.32097;2.87415;,
 25.40639;31.70435;2.09273;,
 27.53606;32.04050;2.87363;,
 29.58032;32.59855;4.76013;,
 15.76079;24.54635;6.64715;,
 13.68611;24.54635;7.42857;,
 11.61141;24.54635;6.64715;,
 10.75205;24.54635;4.76066;,
 11.61141;24.54635;2.87416;,
 13.68611;24.54635;2.09275;,
 15.76079;24.54635;2.87416;,
 16.62015;24.54635;4.76066;,
 22.41830;28.04251;6.64716;,
 20.34360;28.04251;7.42859;,
 18.26890;28.04251;6.64718;,
 17.40954;28.04251;4.76067;,
 18.26890;28.04251;2.87415;,
 20.34360;28.04251;2.09273;,
 22.41830;28.04251;2.87415;,
 23.27767;28.04251;4.76066;;
 
 234;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,14,15;,
 4;14,7,6,15;,
 4;12,5,4,13;,
 4;13,16,17,14;,
 4;14,17,18,7;,
 4;7,18,19,4;,
 4;4,19,16,13;,
 4;5,20,21,6;,
 4;6,21,22,15;,
 4;15,22,23,12;,
 4;12,23,20,5;,
 4;16,0,3,17;,
 4;17,3,2,18;,
 4;18,2,1,19;,
 4;19,1,0,16;,
 4;20,8,11,21;,
 4;21,11,10,22;,
 4;22,10,9,23;,
 4;23,9,8,20;,
 4;24,25,26,27;,
 4;28,29,30,31;,
 4;32,33,34,35;,
 4;36,37,38,39;,
 4;40,41,42,43;,
 4;44,45,46,47;,
 4;37,24,27,38;,
 4;38,27,26,48;,
 4;48,26,25,49;,
 4;49,25,24,37;,
 4;50,32,35,51;,
 4;51,35,34,39;,
 4;39,34,33,36;,
 4;36,33,32,50;,
 4;38,40,43,39;,
 4;39,43,42,51;,
 4;51,42,41,48;,
 4;48,41,40,38;,
 4;36,44,47,37;,
 4;37,47,46,49;,
 4;49,46,45,50;,
 4;50,45,44,36;,
 3;52,30,49;,
 3;30,29,49;,
 3;49,29,48;,
 3;29,28,48;,
 3;28,53,48;,
 3;48,53,51;,
 3;54,50,55;,
 3;55,50,53;,
 3;53,50,51;,
 3;52,49,56;,
 3;56,49,54;,
 3;54,49,50;,
 4;57,58,59,60;,
 4;55,53,28,31;,
 4;61,62,58,57;,
 4;52,56,63,64;,
 4;31,30,59,58;,
 3;52,64,30;,
 3;30,64,59;,
 3;59,64,60;,
 4;56,54,65,63;,
 3;65,54,61;,
 3;61,54,62;,
 3;62,54,55;,
 4;55,31,58,62;,
 4;66,67,68,69;,
 4;70,71,72,73;,
 4;74,75,76,77;,
 4;78,79,80,81;,
 4;80,73,72,81;,
 4;78,71,70,79;,
 4;79,82,83,80;,
 4;80,83,84,73;,
 4;73,84,85,70;,
 4;70,85,82,79;,
 4;71,86,87,72;,
 4;72,87,88,81;,
 4;81,88,89,78;,
 4;78,89,86,71;,
 4;82,66,69,83;,
 4;83,69,68,84;,
 4;84,68,67,85;,
 4;85,67,66,82;,
 4;86,74,77,87;,
 4;87,77,76,88;,
 4;88,76,75,89;,
 4;89,75,74,86;,
 4;90,91,92,93;,
 4;93,92,94,95;,
 4;95,94,96,97;,
 4;97,96,98,99;,
 4;99,98,100,101;,
 4;101,100,102,103;,
 4;103,102,104,105;,
 4;105,104,91,90;,
 3;93,106,90;,
 3;95,106,93;,
 3;97,106,95;,
 3;99,106,97;,
 3;101,106,99;,
 3;103,106,101;,
 3;105,106,103;,
 3;90,106,105;,
 3;107,108,109;,
 3;109,108,110;,
 3;110,108,111;,
 3;111,108,112;,
 3;112,108,113;,
 3;113,108,114;,
 3;114,108,115;,
 3;115,108,107;,
 4;91,116,117,92;,
 4;92,117,118,94;,
 4;94,118,119,96;,
 4;96,119,120,98;,
 4;98,120,121,100;,
 4;100,121,122,102;,
 4;102,122,123,104;,
 4;104,123,116,91;,
 4;116,124,125,117;,
 4;117,125,126,118;,
 4;118,126,127,119;,
 4;119,127,128,120;,
 4;120,128,129,121;,
 4;121,129,130,122;,
 4;122,130,131,123;,
 4;123,131,124,116;,
 4;124,107,109,125;,
 4;125,109,110,126;,
 4;126,110,111,127;,
 4;127,111,112,128;,
 4;128,112,113,129;,
 4;129,113,114,130;,
 4;130,114,115,131;,
 4;131,115,107,124;,
 4;132,133,134,135;,
 4;136,137,138,139;,
 4;140,141,142,143;,
 4;144,145,146,147;,
 4;148,149,150,151;,
 4;152,132,135,153;,
 4;153,135,134,139;,
 4;139,134,133,136;,
 4;136,133,132,152;,
 4;137,140,143,138;,
 4;138,143,142,154;,
 4;154,142,141,155;,
 4;155,141,140,137;,
 4;153,148,151,154;,
 4;154,151,150,138;,
 4;138,150,149,139;,
 4;139,149,148,153;,
 4;152,156,157,136;,
 4;136,157,158,137;,
 4;137,158,159,155;,
 4;155,144,147,154;,
 4;154,147,146,153;,
 4;153,146,145,152;,
 4;160,161,162,163;,
 4;164,165,166,167;,
 4;168,169,170,171;,
 4;172,173,174,175;,
 4;174,167,166,175;,
 4;172,165,164,173;,
 4;173,176,177,174;,
 4;174,177,178,167;,
 4;167,178,179,164;,
 4;164,179,176,173;,
 4;165,180,181,166;,
 4;166,181,182,175;,
 4;175,182,183,172;,
 4;172,183,180,165;,
 4;176,160,163,177;,
 4;177,163,162,178;,
 4;178,162,161,179;,
 4;179,161,160,176;,
 4;180,168,171,181;,
 4;181,171,170,182;,
 4;182,170,169,183;,
 4;183,169,168,180;,
 4;184,185,186,187;,
 4;187,186,188,189;,
 4;189,188,190,191;,
 4;191,190,192,193;,
 4;193,192,194,195;,
 4;195,194,196,197;,
 4;197,196,198,199;,
 4;199,198,185,184;,
 3;187,200,184;,
 3;189,200,187;,
 3;191,200,189;,
 3;193,200,191;,
 3;195,200,193;,
 3;197,200,195;,
 3;199,200,197;,
 3;184,200,199;,
 3;201,202,203;,
 3;203,202,204;,
 3;204,202,205;,
 3;205,202,206;,
 3;206,202,207;,
 3;207,202,208;,
 3;208,202,209;,
 3;209,202,201;,
 4;185,210,211,186;,
 4;186,211,212,188;,
 4;188,212,213,190;,
 4;190,213,214,192;,
 4;192,214,215,194;,
 4;194,215,216,196;,
 4;196,216,217,198;,
 4;198,217,210,185;,
 4;210,218,219,211;,
 4;211,219,220,212;,
 4;212,220,221,213;,
 4;213,221,222,214;,
 4;214,222,223,215;,
 4;215,223,224,216;,
 4;216,224,225,217;,
 4;217,225,218,210;,
 4;218,201,203,219;,
 4;219,203,204,220;,
 4;220,204,205,221;,
 4;221,205,206,222;,
 4;222,206,207,223;,
 4;223,207,208,224;,
 4;224,208,209,225;,
 4;225,209,201,218;,
 4;63,65,61,57;,
 4;64,63,57,60;;
 
 MeshMaterialList {
  1;
  234;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
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
  266;
  0.498942;-0.804563;0.322079;,
  -0.536778;0.777716;-0.327151;,
  -0.535812;0.772746;0.340248;,
  0.495367;-0.804374;-0.328014;,
  0.408494;-0.660390;0.630093;,
  0.864189;0.372034;-0.338773;,
  -0.237163;0.341843;-0.909339;,
  -0.269853;0.363134;0.891803;,
  0.921515;0.381631;0.071891;,
  0.416389;-0.683748;-0.599257;,
  0.443773;-0.860449;-0.250385;,
  0.233520;-0.386999;0.892020;,
  0.452198;-0.696140;0.557589;,
  0.717438;-0.660396;-0.221718;,
  0.886073;0.463546;0.000000;,
  0.044985;-0.209368;-0.976802;,
  0.019200;0.409060;-0.912305;,
  0.044985;-0.209367;0.976802;,
  -0.139598;0.700613;0.699752;,
  0.717438;-0.660396;0.221718;,
  0.262745;-0.122798;-0.957019;,
  0.252261;0.220549;-0.942190;,
  0.040920;0.219289;-0.974802;,
  0.059021;-0.122410;-0.990723;,
  0.059021;-0.122409;0.990723;,
  0.040921;0.219287;0.974802;,
  0.252258;0.220547;0.942192;,
  0.262742;-0.122797;0.957020;,
  0.233600;0.954609;0.184804;,
  0.233600;0.954609;-0.184805;,
  -0.028535;0.983375;0.179331;,
  -0.028535;0.983375;-0.179333;,
  0.330559;-0.923772;0.193328;,
  0.330559;-0.923772;-0.193328;,
  0.070574;-0.978713;-0.192718;,
  0.070574;-0.978713;0.192718;,
  -0.205035;0.001058;-0.978754;,
  -0.876518;0.481369;0.000000;,
  -0.782192;0.623038;0.000000;,
  -0.305878;0.001579;0.952069;,
  -0.136358;0.000704;0.990659;,
  -0.999670;0.025673;0.000000;,
  -0.117791;-0.993038;0.000000;,
  -0.233943;-0.972250;0.000000;,
  -0.999987;0.005164;0.000000;,
  -0.999987;0.005164;0.000000;,
  0.498939;-0.804566;0.322078;,
  -0.536780;0.777715;-0.327149;,
  -0.535812;0.772745;0.340252;,
  0.495364;-0.804379;-0.328008;,
  0.408493;-0.660394;0.630090;,
  0.890495;0.327205;-0.316158;,
  -0.236687;0.342420;-0.909246;,
  -0.277317;0.370502;0.886467;,
  0.943374;0.283130;0.172867;,
  0.416391;-0.683757;-0.599245;,
  0.522569;-0.835737;-0.168714;,
  0.523806;-0.667747;0.528905;,
  0.821825;-0.321504;0.470360;,
  0.682939;0.000000;0.730475;,
  0.000002;0.000000;1.000000;,
  -0.682939;0.000000;0.730475;,
  -1.000000;0.000000;0.000001;,
  -0.682938;0.000000;-0.730476;,
  0.000002;0.000000;-1.000000;,
  0.682938;0.000000;-0.730476;,
  1.000000;0.000000;0.000001;,
  0.642687;-0.269989;0.716979;,
  0.000002;-0.000001;1.000000;,
  -0.642687;0.269988;0.716980;,
  -0.926976;0.375120;0.000001;,
  -0.642686;0.269988;-0.716981;,
  0.000002;-0.000001;-1.000000;,
  0.642686;-0.269989;-0.716980;,
  0.926976;-0.375121;0.000001;,
  0.320351;-0.947299;-0.000000;,
  0.480763;-0.646129;0.592777;,
  0.000001;-0.000005;1.000000;,
  -0.480764;0.646125;0.592780;,
  -0.603866;0.797086;0.000001;,
  -0.480763;0.646125;-0.592781;,
  0.000001;-0.000005;-1.000000;,
  0.480762;-0.646129;-0.592778;,
  0.603864;-0.797087;0.000001;,
  0.440229;-0.699010;0.563546;,
  0.318399;-0.507196;0.800858;,
  -0.430194;0.727476;0.534521;,
  -0.504613;0.863346;0.000000;,
  -0.430194;0.727475;-0.534521;,
  -0.319964;0.531305;-0.784435;,
  0.440186;-0.699006;-0.563584;,
  0.533665;-0.845696;0.000008;,
  -0.182646;0.982687;0.031095;,
  -0.254670;0.921186;0.294209;,
  -0.169241;0.985575;0.000002;,
  -0.323434;0.898309;0.297373;,
  -0.342078;0.939672;-0.000000;,
  -0.323434;0.898309;-0.297374;,
  -0.254670;0.921186;-0.294210;,
  -0.182654;0.982686;-0.031087;,
  -0.209482;0.977813;0.000008;,
  0.541847;-0.557051;-0.629361;,
  0.780778;-0.549953;-0.296544;,
  -0.780059;-0.625706;0.000000;,
  0.522431;-0.525702;0.671344;,
  -0.438171;0.661834;0.608261;,
  0.092993;-0.273200;-0.957452;,
  -0.193523;0.229659;-0.953837;,
  -0.187653;0.106473;-0.976448;,
  0.003272;-0.227878;-0.973684;,
  0.003272;-0.227878;0.973684;,
  -0.187652;0.106472;0.976448;,
  -0.193522;0.229658;0.953838;,
  0.092992;-0.273199;0.957452;,
  -0.377237;0.919491;0.110577;,
  -0.377237;0.919491;-0.110577;,
  -0.568991;0.815351;0.107017;,
  -0.568991;0.815351;-0.107018;,
  0.402575;-0.763076;0.505618;,
  0.432928;-0.826050;-0.360852;,
  0.552537;-0.821853;-0.138781;,
  0.551521;-0.813651;0.183840;,
  0.777200;-0.629227;-0.005750;,
  0.498938;-0.804564;0.322082;,
  -0.536782;0.777714;-0.327147;,
  -0.535813;0.772745;0.340249;,
  0.495365;-0.804376;-0.328012;,
  0.408490;-0.660388;0.630099;,
  0.861653;0.372249;-0.344942;,
  -0.237167;0.341845;-0.909337;,
  -0.269851;0.363134;0.891804;,
  0.920751;0.382302;0.077870;,
  0.416390;-0.683751;-0.599252;,
  0.440896;-0.851932;-0.282531;,
  0.204147;-0.350758;0.913944;,
  0.410737;-0.649722;0.639653;,
  -1.000000;0.000000;0.000001;,
  -0.682938;0.000000;-0.730476;,
  0.682938;0.000000;-0.730476;,
  1.000000;0.000000;0.000001;,
  -0.926976;0.375120;0.000001;,
  -0.642686;0.269988;-0.716981;,
  0.642686;-0.269989;-0.716980;,
  0.926976;-0.375121;0.000001;,
  0.320351;-0.947299;-0.000000;,
  0.000001;-0.000005;1.000000;,
  -0.480764;0.646125;0.592780;,
  -0.603866;0.797086;0.000001;,
  -0.480763;0.646125;-0.592781;,
  0.000001;-0.000003;-1.000000;,
  0.480762;-0.646128;-0.592778;,
  0.603864;-0.797087;0.000001;,
  0.440229;-0.699010;0.563546;,
  0.318399;-0.507196;0.800858;,
  -0.430194;0.727475;0.534521;,
  -0.504613;0.863346;0.000000;,
  -0.430194;0.727475;-0.534521;,
  -0.319964;0.531306;-0.784434;,
  0.440185;-0.699005;-0.563586;,
  0.533665;-0.845696;0.000008;,
  -0.182646;0.982687;0.031095;,
  -0.254670;0.921186;0.294209;,
  -0.169241;0.985575;0.000002;,
  -0.323434;0.898309;0.297373;,
  -0.342078;0.939672;-0.000000;,
  -0.323434;0.898309;-0.297374;,
  -0.254670;0.921186;-0.294210;,
  -0.182654;0.982686;-0.031087;,
  -0.209482;0.977813;0.000008;,
  -0.999987;0.005162;0.000000;,
  0.835968;0.519805;-0.175952;,
  0.857665;0.513868;0.018726;,
  -0.955417;-0.293829;-0.029031;,
  -0.969782;-0.243614;0.013208;,
  -0.973959;-0.196700;0.112749;,
  -0.946827;-0.320750;-0.025261;,
  -0.150613;0.320149;0.935318;,
  0.903639;0.289027;-0.316069;,
  0.013724;-0.023068;-0.999640;,
  -0.962940;-0.177676;0.202925;,
  0.945791;0.302179;0.119028;,
  -0.125673;0.248129;-0.960541;,
  -0.945009;-0.326810;0.012330;,
  0.329913;-0.184234;-0.925859;,
  0.244669;0.543291;-0.803102;,
  0.244666;0.543290;0.803103;,
  0.329908;-0.184231;0.925862;,
  -0.467994;0.883731;0.000000;,
  -0.041692;-0.999131;0.000000;,
  -0.083457;-0.996511;0.000000;,
  -0.205035;0.001058;-0.978754;,
  0.000000;0.000000;-1.000000;,
  -0.000000;0.000000;1.000000;,
  -0.078466;-0.996917;0.000000;,
  -0.225657;0.974207;0.000000;,
  -0.272715;0.001408;-0.962094;,
  -0.205035;0.001058;-0.978754;,
  -0.401357;0.002071;0.915919;,
  -0.401357;0.002072;0.915919;,
  -0.401357;0.002072;0.915920;,
  0.835967;0.519807;-0.175957;,
  0.857668;0.513863;0.018723;,
  -0.955418;-0.293825;-0.029035;,
  -0.969785;-0.243605;0.013201;,
  -0.964531;-0.263206;0.020052;,
  -0.947897;-0.316846;0.033173;,
  -0.130367;0.236125;0.962938;,
  0.943792;0.195273;-0.266692;,
  0.014536;-0.021966;-0.999653;,
  -0.949998;-0.311711;0.018464;,
  -0.060974;0.037832;0.997422;,
  -0.110073;0.177477;-0.977950;,
  -0.939785;-0.316541;0.128863;,
  0.367142;-0.898440;-0.240856;,
  0.116346;-0.984932;-0.127951;,
  0.496871;-0.838052;-0.225362;,
  0.509511;-0.860464;-0.000001;,
  0.496871;-0.838052;0.225362;,
  0.367142;-0.898440;0.240856;,
  0.116347;-0.984932;0.127951;,
  0.000000;-1.000000;0.000000;,
  -0.319964;0.531306;0.784434;,
  0.318316;-0.507142;-0.800925;,
  0.480663;-0.638641;0.600917;,
  0.342944;-0.455194;0.821698;,
  0.342778;-0.455086;-0.821827;,
  0.480580;-0.638630;-0.600994;,
  0.601092;-0.799180;0.000016;,
  0.819714;-0.196041;-0.538180;,
  -0.438171;0.661835;-0.608261;,
  -0.383227;0.429417;-0.817764;,
  0.196833;-0.734531;-0.649401;,
  0.171068;-0.511883;0.841850;,
  -0.495155;0.578098;0.648555;,
  0.780777;-0.549953;0.296545;,
  0.819712;-0.196041;0.538183;,
  -0.023161;0.999732;0.000000;,
  -0.627083;0.778952;0.000000;,
  0.158059;-0.987419;-0.004690;,
  0.211942;-0.099584;-0.972195;,
  0.215547;-0.095010;0.971860;,
  0.835968;0.519806;-0.175953;,
  0.857666;0.513866;0.018723;,
  -0.955419;-0.293823;-0.029034;,
  -0.969785;-0.243605;0.013204;,
  -0.972513;-0.198053;0.122446;,
  -0.946382;-0.321485;-0.031766;,
  -0.130902;0.271697;0.953439;,
  0.898998;0.289624;-0.328512;,
  0.013724;-0.023068;-0.999640;,
  -0.958281;-0.180016;0.222019;,
  0.943848;0.303341;0.130900;,
  -0.079364;0.193612;-0.977863;,
  -0.944532;-0.328420;-0.000679;,
  0.509511;-0.860464;-0.000001;,
  0.496871;-0.838052;0.225362;,
  0.367142;-0.898440;0.240856;,
  0.116347;-0.984932;0.127951;,
  -0.319965;0.531306;0.784434;,
  0.318314;-0.507139;-0.800928;,
  0.480663;-0.638641;0.600917;,
  0.342944;-0.455194;0.821698;,
  0.342775;-0.455082;-0.821830;,
  0.480579;-0.638629;-0.600996;,
  0.601092;-0.799180;0.000016;,
  -0.999987;0.005160;0.000000;;
  234;
  4;10,10,10,10;,
  4;1,2,2,1;,
  4;11,12,12,11;,
  4;3,0,0,3;,
  4;170,170,171,171;,
  4;172,172,173,173;,
  4;0,4,4,0;,
  4;170,5,5,170;,
  4;1,6,6,1;,
  4;173,174,174,173;,
  4;2,7,7,2;,
  4;171,8,8,171;,
  4;3,9,9,3;,
  4;172,175,175,172;,
  4;176,176,176,176;,
  4;5,177,177,5;,
  4;6,178,178,6;,
  4;174,179,179,174;,
  4;7,11,11,7;,
  4;8,180,180,8;,
  4;181,181,181,181;,
  4;175,182,182,175;,
  4;20,23,22,21;,
  4;37,37,41,41;,
  4;24,27,26,25;,
  4;19,13,14,14;,
  4;29,31,30,28;,
  4;32,35,34,33;,
  4;183,20,21,184;,
  4;184,21,22,16;,
  4;16,22,23,15;,
  4;15,23,20,183;,
  4;17,24,25,18;,
  4;18,25,26,185;,
  4;185,26,27,186;,
  4;186,27,24,17;,
  4;14,29,28,14;,
  4;185,28,30,18;,
  4;18,30,31,187;,
  4;16,31,29,184;,
  4;19,32,33,13;,
  4;13,33,34,15;,
  4;188,34,35,189;,
  4;17,35,32,19;,
  3;36,190,15;,
  3;190,191,15;,
  3;15,191,16;,
  3;37,37,187;,
  3;37,38,187;,
  3;187,38,18;,
  3;39,17,40;,
  3;40,17,192;,
  3;192,17,18;,
  3;42,188,42;,
  3;42,188,193;,
  3;193,188,189;,
  4;169,44,45,169;,
  4;41,38,37,41;,
  4;169,45,44,169;,
  4;42,42,43,43;,
  4;194,194,194,194;,
  3;36,195,190;,
  3;190,195,196;,
  3;196,195,191;,
  4;42,193,43,43;,
  3;197,39,198;,
  3;198,39,199;,
  3;199,39,40;,
  4;194,194,194,194;,
  4;56,56,56,56;,
  4;47,48,48,47;,
  4;57,57,58,58;,
  4;49,46,46,49;,
  4;200,200,201,201;,
  4;202,202,203,203;,
  4;46,50,50,46;,
  4;200,51,51,200;,
  4;47,52,52,47;,
  4;203,204,204,203;,
  4;48,53,53,48;,
  4;201,54,54,201;,
  4;49,55,55,49;,
  4;202,205,205,202;,
  4;206,206,206,206;,
  4;51,207,207,51;,
  4;52,208,208,52;,
  4;204,209,209,204;,
  4;53,210,210,53;,
  4;54,58,58,54;,
  4;211,211,211,211;,
  4;205,212,212,205;,
  4;59,67,68,60;,
  4;60,68,69,61;,
  4;61,69,70,62;,
  4;62,70,71,63;,
  4;63,71,72,64;,
  4;64,72,73,65;,
  4;65,73,74,66;,
  4;66,74,67,59;,
  3;213,75,214;,
  3;215,75,213;,
  3;216,75,215;,
  3;217,75,216;,
  3;218,75,217;,
  3;219,75,218;,
  3;220,75,219;,
  3;214,75,220;,
  3;92,94,93;,
  3;93,94,95;,
  3;95,94,96;,
  3;96,94,97;,
  3;97,94,98;,
  3;98,94,99;,
  3;99,94,100;,
  3;100,94,92;,
  4;67,76,77,68;,
  4;68,77,78,69;,
  4;69,78,79,70;,
  4;70,79,80,71;,
  4;71,80,81,72;,
  4;72,81,82,73;,
  4;73,82,83,74;,
  4;74,83,76,67;,
  4;76,84,85,77;,
  4;77,221,86,78;,
  4;78,86,87,79;,
  4;79,87,88,80;,
  4;80,88,89,81;,
  4;81,222,90,82;,
  4;82,90,91,83;,
  4;83,91,84,76;,
  4;84,223,224,85;,
  4;221,93,95,86;,
  4;86,95,96,87;,
  4;87,96,97,88;,
  4;88,97,98,89;,
  4;222,225,226,90;,
  4;90,226,227,91;,
  4;91,227,223,84;,
  4;106,109,108,107;,
  4;103,103,103,103;,
  4;110,113,112,111;,
  4;121,120,122,122;,
  4;115,117,116,114;,
  4;101,228,228,102;,
  4;229,107,108,230;,
  4;230,108,109,231;,
  4;231,109,106,101;,
  4;232,110,111,233;,
  4;233,111,112,105;,
  4;234,235,235,104;,
  4;104,113,110,232;,
  4;236,115,114,236;,
  4;105,114,116,233;,
  4;233,116,117,237;,
  4;230,117,115,229;,
  4;101,119,120,231;,
  4;231,120,121,238;,
  4;232,121,118,104;,
  4;239,239,239,239;,
  4;234,122,122,102;,
  4;240,240,240,240;,
  4;133,133,133,133;,
  4;124,125,125,124;,
  4;134,135,135,134;,
  4;126,123,123,126;,
  4;241,241,242,242;,
  4;243,243,244,244;,
  4;123,127,127,123;,
  4;241,128,128,241;,
  4;124,129,129,124;,
  4;244,245,245,244;,
  4;125,130,130,125;,
  4;242,131,131,242;,
  4;126,132,132,126;,
  4;243,246,246,243;,
  4;247,247,247,247;,
  4;128,248,248,128;,
  4;129,249,249,129;,
  4;245,250,250,245;,
  4;130,134,134,130;,
  4;131,251,251,131;,
  4;252,252,252,252;,
  4;246,253,253,246;,
  4;59,67,68,60;,
  4;60,68,69,61;,
  4;61,69,140,136;,
  4;136,140,141,137;,
  4;137,141,72,64;,
  4;64,72,142,138;,
  4;138,142,143,139;,
  4;139,143,67,59;,
  3;213,144,214;,
  3;215,144,213;,
  3;254,144,215;,
  3;255,144,254;,
  3;256,144,255;,
  3;257,144,256;,
  3;220,144,257;,
  3;214,144,220;,
  3;160,162,161;,
  3;161,162,163;,
  3;163,162,164;,
  3;164,162,165;,
  3;165,162,166;,
  3;166,162,167;,
  3;167,162,168;,
  3;168,162,160;,
  4;67,76,145,68;,
  4;68,145,146,69;,
  4;69,146,147,140;,
  4;140,147,148,141;,
  4;141,148,149,72;,
  4;72,149,150,142;,
  4;142,150,151,143;,
  4;143,151,76,67;,
  4;76,152,153,145;,
  4;145,258,154,146;,
  4;146,154,155,147;,
  4;147,155,156,148;,
  4;148,156,157,149;,
  4;149,259,158,150;,
  4;150,158,159,151;,
  4;151,159,152,76;,
  4;152,260,261,153;,
  4;258,161,163,154;,
  4;154,163,164,155;,
  4;155,164,165,156;,
  4;156,165,166,157;,
  4;259,262,263,158;,
  4;158,263,264,159;,
  4;159,264,260,152;,
  4;265,265,169,169;,
  4;265,265,169,169;;
 }
 MeshTextureCoords {
  226;
  0.223431;0.616858;,
  0.246097;0.610942;,
  0.105861;0.561340;,
  0.088663;0.567256;,
  0.275188;0.492235;,
  0.275187;0.498775;,
  0.158872;0.443782;,
  0.158872;0.437243;,
  0.222054;0.606863;,
  0.199389;0.629357;,
  0.083073;0.574364;,
  0.098439;0.551869;,
  0.261163;0.521269;,
  0.270182;0.514731;,
  0.136207;0.459737;,
  0.136207;0.466276;,
  0.262291;0.537468;,
  0.136714;0.482475;,
  0.150981;0.472739;,
  0.267296;0.527732;,
  0.266448;0.515625;,
  0.141492;0.460631;,
  0.127700;0.485253;,
  0.259613;0.532848;,
  0.117458;0.236466;,
  0.245775;0.273852;,
  0.245775;0.074033;,
  0.117458;0.085673;,
  0.333887;0.163057;,
  0.333887;0.163057;,
  0.334192;0.183938;,
  0.334192;0.183938;,
  0.245775;0.273852;,
  0.117458;0.236466;,
  0.117458;0.085673;,
  0.245775;0.074033;,
  0.111288;0.245820;,
  0.111288;0.245820;,
  0.111288;0.076320;,
  0.111288;0.076320;,
  0.117458;0.068790;,
  0.245775;0.067526;,
  0.245775;0.067526;,
  0.117458;0.068790;,
  0.117458;0.253348;,
  0.245775;0.290735;,
  0.245775;0.290735;,
  0.117458;0.253348;,
  0.255524;0.070416;,
  0.255524;0.287844;,
  0.255524;0.287844;,
  0.255524;0.070416;,
  0.334497;0.287844;,
  0.333887;0.163057;,
  0.334497;0.287844;,
  0.334192;0.183938;,
  0.334497;0.287844;,
  0.334344;0.235891;,
  0.334192;0.183938;,
  0.334192;0.183938;,
  0.334344;0.235891;,
  0.334344;0.235891;,
  0.334192;0.183938;,
  0.334497;0.287844;,
  0.334497;0.287844;,
  0.334497;0.287844;,
  0.264163;0.698349;,
  0.270725;0.690218;,
  0.068619;0.612907;,
  0.060192;0.621796;,
  0.359186;0.497070;,
  0.359186;0.507632;,
  0.145632;0.418812;,
  0.145631;0.408251;,
  0.261634;0.678518;,
  0.249637;0.707244;,
  0.071503;0.626337;,
  0.081350;0.589697;,
  0.333437;0.543963;,
  0.349997;0.533403;,
  0.104017;0.444582;,
  0.104018;0.455143;,
  0.335508;0.570126;,
  0.104949;0.481305;,
  0.131143;0.465581;,
  0.344698;0.554402;,
  0.343140;0.534847;,
  0.113722;0.446027;,
  0.088400;0.485792;,
  0.330591;0.562663;,
  0.279659;0.931844;,
  0.279659;0.882418;,
  0.294810;0.882418;,
  0.294810;0.937867;,
  0.309962;0.882418;,
  0.309962;0.946474;,
  0.316238;0.882418;,
  0.316238;0.946474;,
  0.309962;0.882418;,
  0.309962;0.946474;,
  0.294810;0.882418;,
  0.294810;0.937867;,
  0.279659;0.882418;,
  0.279659;0.931844;,
  0.273383;0.882418;,
  0.273383;0.931844;,
  0.294810;0.931844;,
  0.169300;0.789307;,
  0.184854;0.792137;,
  0.184854;0.792137;,
  0.200005;0.795366;,
  0.206281;0.795366;,
  0.200005;0.795366;,
  0.184854;0.792137;,
  0.169300;0.789307;,
  0.154371;0.784607;,
  0.255296;0.852415;,
  0.270448;0.852415;,
  0.285599;0.852415;,
  0.291875;0.852415;,
  0.285599;0.852415;,
  0.270448;0.852415;,
  0.255296;0.852415;,
  0.249020;0.852415;,
  0.206676;0.822974;,
  0.221827;0.822974;,
  0.236979;0.822974;,
  0.243255;0.822974;,
  0.236979;0.822974;,
  0.221827;0.822974;,
  0.206676;0.822974;,
  0.200400;0.822974;,
  0.879540;0.189226;,
  0.734831;0.275198;,
  0.679899;0.201796;,
  0.918528;0.041405;,
  0.731685;0.283857;,
  0.731685;0.283857;,
  0.669940;0.201349;,
  0.669940;0.201349;,
  0.734831;0.275198;,
  0.879540;0.189226;,
  0.918528;0.041405;,
  0.679899;0.201796;,
  0.795959;0.240228;,
  0.795959;0.240228;,
  0.810471;0.120905;,
  0.810471;0.120905;,
  0.911841;0.032470;,
  0.675788;0.196303;,
  0.675788;0.196303;,
  0.911841;0.032470;,
  0.889989;0.189950;,
  0.921568;0.032229;,
  0.921568;0.032229;,
  0.889989;0.189950;,
  0.886227;0.198161;,
  0.738942;0.280691;,
  0.738942;0.280691;,
  0.886227;0.198161;,
  0.247636;0.681541;,
  0.279558;0.673210;,
  0.082049;0.603350;,
  0.057827;0.611681;,
  0.320529;0.506023;,
  0.320529;0.515234;,
  0.156710;0.437780;,
  0.156709;0.428571;,
  0.245696;0.667464;,
  0.213774;0.699146;,
  0.049955;0.621694;,
  0.071596;0.590011;,
  0.300776;0.546915;,
  0.313480;0.537705;,
  0.124788;0.460252;,
  0.124788;0.469462;,
  0.302365;0.569730;,
  0.125502;0.492276;,
  0.145596;0.478564;,
  0.309415;0.556017;,
  0.308221;0.538965;,
  0.132232;0.461513;,
  0.112807;0.496189;,
  0.298594;0.563222;,
  0.293958;0.931844;,
  0.293958;0.882418;,
  0.309109;0.882418;,
  0.309109;0.937867;,
  0.324261;0.882418;,
  0.324261;0.946474;,
  0.330537;0.882418;,
  0.330537;0.946474;,
  0.324261;0.882418;,
  0.324261;0.946474;,
  0.309109;0.882418;,
  0.309109;0.937867;,
  0.293958;0.882418;,
  0.293958;0.931844;,
  0.287682;0.882418;,
  0.287682;0.931844;,
  0.309109;0.931844;,
  0.183599;0.789307;,
  0.199152;0.792137;,
  0.199152;0.792137;,
  0.214304;0.795366;,
  0.220580;0.795366;,
  0.214304;0.795366;,
  0.199152;0.792137;,
  0.183599;0.789307;,
  0.168670;0.784607;,
  0.269595;0.852415;,
  0.284746;0.852415;,
  0.299898;0.852415;,
  0.306174;0.852415;,
  0.299898;0.852415;,
  0.284746;0.852415;,
  0.269595;0.852415;,
  0.263319;0.852415;,
  0.220975;0.822974;,
  0.236126;0.822974;,
  0.251278;0.822974;,
  0.257554;0.822974;,
  0.251278;0.822974;,
  0.236126;0.822974;,
  0.220975;0.822974;,
  0.214699;0.822974;;
 }
}