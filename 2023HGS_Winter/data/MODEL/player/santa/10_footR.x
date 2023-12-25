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
 108;
 -1.37967;-13.78047;-5.07292;,
 5.36711;-13.78047;-5.07292;,
 5.36711;-19.42938;-5.07292;,
 -1.37967;-19.42938;-5.07292;,
 5.36711;-18.32844;14.71072;,
 5.36711;-19.05485;9.97332;,
 -1.37967;-18.64789;9.19481;,
 -1.37967;-18.32844;14.71072;,
 5.36711;-22.74883;17.84676;,
 5.36711;-19.03546;17.63664;,
 -1.37967;-19.03546;17.63664;,
 -1.37967;-22.74883;17.84676;,
 5.36711;-25.07830;6.01050;,
 5.36711;-25.07830;9.02733;,
 -1.37967;-25.07830;8.16703;,
 -1.37967;-25.07830;6.01050;,
 5.36711;-13.78047;6.01050;,
 5.36711;-19.05485;9.97332;,
 5.36711;-20.53173;9.94121;,
 5.36711;-19.42938;6.01050;,
 -8.12645;-18.32844;14.71072;,
 -8.12645;-19.05485;9.97332;,
 -8.12645;-20.53173;9.94121;,
 -8.12645;-21.08910;11.92863;,
 -8.12645;-25.07830;10.84533;,
 -8.12645;-25.07830;9.02733;,
 -1.37967;-25.07830;10.84533;,
 -8.12645;-19.03546;17.63664;,
 -8.12645;-22.74883;17.84676;,
 -8.12645;-13.78047;6.01050;,
 -8.12645;-19.05485;9.97332;,
 -1.37967;-13.78047;6.01050;,
 -8.12645;-19.42938;-5.07292;,
 -8.12645;-13.78047;-5.07292;,
 -8.12645;-2.86527;-5.07292;,
 -8.12645;-2.86527;6.01050;,
 -1.37967;-2.86527;6.01050;,
 -1.37967;-2.86527;-5.07292;,
 5.36711;-2.86527;6.01050;,
 5.36711;-2.86527;-5.07292;,
 -1.37967;-25.07830;-5.07292;,
 5.36711;-25.07830;-5.07292;,
 -8.12645;-25.07830;6.01050;,
 -8.12645;-25.07830;-5.07292;,
 -8.12645;-13.78047;6.01050;,
 -8.12645;-19.42938;6.01050;,
 -8.12645;-25.07830;-5.07292;,
 -1.37967;-25.07830;-5.07292;,
 5.36711;-25.07830;-5.07292;,
 5.36711;-25.07830;6.01050;,
 5.36711;-25.07830;10.84533;,
 5.36711;-25.07830;9.02733;,
 5.36711;-21.08910;11.92863;,
 -1.37967;-25.07830;15.68015;,
 5.36711;-25.07830;15.68015;,
 -8.12645;-25.07830;15.68015;,
 -8.12645;-25.07830;9.02733;,
 -8.12645;-25.07830;10.84533;,
 -8.12645;-25.07830;6.01050;,
 5.36711;-25.07830;10.84533;,
 5.36711;-22.74883;17.84676;,
 5.36711;-25.07830;15.68015;,
 5.36711;-18.32844;14.71072;,
 5.36711;-19.03546;17.63664;,
 -8.12645;-18.32844;14.71072;,
 -8.12645;-22.74883;17.84676;,
 -8.12645;-19.03546;17.63664;,
 -8.12645;-25.07830;15.68015;,
 5.36711;-13.78047;6.01050;,
 -0.33938;-0.04913;-4.79345;,
 3.43998;-0.04913;-3.83517;,
 3.43998;-7.95567;-3.83517;,
 -0.33938;-7.95567;-4.79345;,
 -0.33938;-0.04913;5.21727;,
 3.43998;-0.04913;4.11798;,
 4.47640;-0.04913;0.14140;,
 -0.33938;-0.04913;0.14140;,
 3.43998;-7.95567;4.11798;,
 -0.33938;-7.95567;5.21727;,
 4.47640;-15.86221;0.14140;,
 3.43998;-15.86221;4.11798;,
 -0.33938;-15.86221;5.21727;,
 -0.33938;-15.86221;0.14140;,
 4.47640;-0.04913;0.14140;,
 3.43998;-0.04913;4.11798;,
 3.43998;-7.95567;4.11798;,
 4.47640;-7.95567;0.14140;,
 -4.11873;-7.95567;4.11798;,
 -4.11873;-0.04913;4.11798;,
 -6.11679;-0.04913;0.14140;,
 -6.11679;-7.95567;0.14140;,
 -4.11873;-15.86221;4.11798;,
 -6.11679;-15.86221;0.14140;,
 -4.11873;-0.04913;4.11798;,
 -4.11873;-7.95567;4.11798;,
 -6.11679;-0.04913;0.14140;,
 -4.11873;-7.95567;-3.83517;,
 -4.11873;-0.04913;-3.83517;,
 -0.33938;-15.86221;-4.79345;,
 3.43998;-15.86221;-3.83517;,
 -4.11873;-15.86221;-3.83517;,
 -4.11873;-15.86221;-3.83517;,
 -0.33938;-15.86221;-4.79345;,
 3.43998;-15.86221;-3.83517;,
 4.47640;-15.86221;0.14140;,
 3.43998;-15.86221;4.11798;,
 -4.11873;-15.86221;4.11798;,
 -6.11679;-15.86221;0.14140;;
 
 70;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,14,15;,
 4;16,17,18,19;,
 4;20,21,22,23;,
 4;24,25,14,26;,
 4;27,28,11,10;,
 4;29,30,6,31;,
 4;32,33,0,3;,
 4;34,35,36,37;,
 4;38,39,37,36;,
 4;2,1,16,19;,
 4;40,41,12,15;,
 4;42,43,40,15;,
 4;44,33,32,45;,
 4;46,32,3,47;,
 4;2,48,47,3;,
 4;48,2,19,49;,
 4;50,51,18,52;,
 4;53,54,8,11;,
 4;28,55,53,11;,
 4;23,22,56,57;,
 4;32,46,58,45;,
 4;55,24,26,53;,
 4;59,54,53,26;,
 4;60,61,50,52;,
 4;62,63,60,52;,
 4;10,9,4,7;,
 4;64,27,10,7;,
 4;65,66,20,23;,
 4;67,65,23,57;,
 4;5,68,31,6;,
 4;13,59,26,14;,
 4;17,62,52,18;,
 4;51,49,19,18;,
 4;21,44,45,22;,
 4;25,42,15,14;,
 4;30,64,7,6;,
 4;22,45,58,56;,
 4;33,34,37,0;,
 4;31,36,35,29;,
 4;29,35,34,33;,
 4;68,38,36,31;,
 4;0,37,39,1;,
 4;1,39,38,68;,
 4;69,70,71,72;,
 4;73,74,75,76;,
 4;77,74,73,78;,
 4;79,80,81,82;,
 4;83,84,85,86;,
 4;87,88,89,90;,
 4;91,92,82,81;,
 4;93,94,78,73;,
 4;95,93,73,76;,
 4;96,97,69,72;,
 4;97,95,76,69;,
 4;75,70,69,76;,
 4;71,70,83,86;,
 4;98,99,79,82;,
 4;92,100,98,82;,
 4;89,97,96,90;,
 4;101,96,72,102;,
 4;71,103,102,72;,
 4;103,71,86,104;,
 4;85,105,104,86;,
 4;81,80,77,78;,
 4;94,91,81,78;,
 4;106,87,90,107;,
 4;96,101,107,90;;
 
 MeshMaterialList {
  15;
  70;
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  12,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11,
  11;;
  Material {
   0.400000;0.400000;0.400000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.680000;0.496000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.072000;0.072000;0.072000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.080000;0.080000;0.080000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.056000;0.056000;0.056000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.080000;0.080000;0.080000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.056000;0.056000;0.056000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  48;
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;0.056494;0.998403;,
  0.000000;0.056494;0.998403;,
  0.000000;-0.916801;0.399345;,
  0.000000;0.056494;0.998403;,
  0.014679;0.301068;0.953490;,
  0.000000;0.301100;0.953593;,
  1.000000;0.000000;0.000000;,
  0.000000;-0.339451;0.940624;,
  -1.000000;0.000000;0.000000;,
  0.016963;0.997675;0.066012;,
  0.000000;0.997818;0.066021;,
  0.033426;0.993931;-0.104801;,
  0.000000;0.994487;-0.104859;,
  0.000000;1.000000;0.000000;,
  -0.626266;0.000000;-0.779610;,
  0.245779;0.000000;-0.969326;,
  -0.639710;0.000000;0.768616;,
  -0.000000;0.000000;-1.000000;,
  -1.000000;0.000000;-0.000001;,
  -0.626266;0.000000;-0.779610;,
  -0.000000;0.000000;-1.000000;,
  0.245779;0.000000;-0.969326;,
  1.000000;0.000000;-0.000000;,
  0.716971;0.000000;0.697103;,
  -0.000000;0.000000;1.000000;,
  -1.000000;0.000000;-0.000001;,
  0.027992;0.574130;0.818286;,
  0.000000;0.574355;0.818607;,
  0.000000;0.972025;0.234880;,
  0.000000;0.972024;0.234880;,
  -0.016963;0.997675;0.066012;,
  0.000000;0.972024;0.234880;,
  -0.027992;0.574130;0.818286;,
  -0.014679;0.301068;0.953490;,
  -0.033426;0.993931;-0.104801;,
  0.000000;0.000000;1.000000;,
  -0.000000;0.000000;1.000000;,
  1.000000;0.000000;-0.000000;,
  0.967674;0.000000;-0.252206;,
  0.967674;0.000000;-0.252206;,
  -0.000000;0.000000;-1.000000;,
  0.245779;0.000000;-0.969326;,
  0.967673;0.000000;-0.252206;,
  1.000000;0.000000;-0.000000;,
  -0.000000;0.000000;1.000000;,
  -1.000000;0.000000;-0.000001;;
  70;
  4;1,1,1,1;,
  4;11,13,14,12;,
  4;9,3,5,9;,
  4;0,0,0,0;,
  4;8,8,8,8;,
  4;10,10,10,10;,
  4;0,0,0,0;,
  4;2,9,9,5;,
  4;6,28,29,7;,
  4;1,1,1,1;,
  4;15,15,15,15;,
  4;15,15,15,15;,
  4;8,8,8,8;,
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;10,10,10,10;,
  4;1,1,1,1;,
  4;1,1,1,1;,
  4;8,8,8,8;,
  4;8,8,8,8;,
  4;4,4,9,9;,
  4;9,4,4,9;,
  4;10,10,10,10;,
  4;10,10,10,10;,
  4;4,0,0,4;,
  4;0,4,4,0;,
  4;8,8,8,8;,
  4;8,8,8,8;,
  4;30,31,11,12;,
  4;32,33,30,12;,
  4;10,10,10,10;,
  4;10,10,10,10;,
  4;34,35,7,29;,
  4;0,0,0,0;,
  4;8,8,8,8;,
  4;8,8,8,8;,
  4;10,10,10,10;,
  4;0,0,0,0;,
  4;36,32,12,14;,
  4;10,10,10,10;,
  4;1,1,1,1;,
  4;7,37,37,6;,
  4;10,10,10,10;,
  4;35,37,37,7;,
  4;1,1,1,1;,
  4;8,8,8,8;,
  4;19,17,23,22;,
  4;15,15,15,15;,
  4;25,25,38,26;,
  4;0,0,0,0;,
  4;39,25,25,24;,
  4;18,18,20,27;,
  4;0,0,0,0;,
  4;18,18,26,38;,
  4;15,15,15,15;,
  4;21,16,19,22;,
  4;15,15,15,15;,
  4;15,15,15,15;,
  4;40,41,39,24;,
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;20,16,21,27;,
  4;21,21,22,42;,
  4;23,43,42,22;,
  4;44,40,24,45;,
  4;25,25,45,24;,
  4;46,25,25,26;,
  4;18,18,46,26;,
  4;18,18,27,47;,
  4;21,21,47,27;;
 }
 MeshTextureCoords {
  108;
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.625000;0.875000;,
  0.500000;0.875000;,
  0.625000;0.562500;,
  0.625000;0.590626;,
  0.500000;0.596219;,
  0.500000;0.562500;,
  0.625000;0.375000;,
  0.625000;0.500000;,
  0.500000;0.500000;,
  0.500000;0.375000;,
  0.625000;0.125000;,
  0.625000;0.163999;,
  0.500000;0.152877;,
  0.500000;0.125000;,
  0.750000;0.750000;,
  0.784374;0.750000;,
  0.791511;0.875000;,
  0.750000;0.875000;,
  0.187500;0.750000;,
  0.215626;0.750000;,
  0.208489;0.875000;,
  0.187500;0.875000;,
  0.375000;0.187500;,
  0.375000;0.163999;,
  0.500000;0.187500;,
  0.375000;0.500000;,
  0.375000;0.375000;,
  0.375000;0.625000;,
  0.375000;0.590626;,
  0.500000;0.625000;,
  0.375000;0.875000;,
  0.375000;0.750000;,
  0.375000;0.750000;,
  0.375000;0.625000;,
  0.500000;0.625000;,
  0.500000;0.750000;,
  0.625000;0.625000;,
  0.625000;0.750000;,
  0.500000;0.000000;,
  0.625000;0.000000;,
  0.375000;0.125000;,
  0.375000;0.000000;,
  0.250000;0.750000;,
  0.250000;0.875000;,
  0.375000;1.000000;,
  0.500000;1.000000;,
  0.625000;1.000000;,
  0.750000;1.000000;,
  0.812500;1.000000;,
  0.788999;1.000000;,
  0.812500;0.875000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.375000;0.250000;,
  0.211001;1.000000;,
  0.187500;1.000000;,
  0.250000;1.000000;,
  0.625000;0.187500;,
  0.875000;0.875000;,
  0.875000;1.000000;,
  0.812500;0.750000;,
  0.875000;0.750000;,
  0.375000;0.562500;,
  0.125000;0.875000;,
  0.125000;0.750000;,
  0.125000;1.000000;,
  0.625000;0.625000;,
  0.500000;0.750000;,
  0.625000;0.750000;,
  0.625000;0.875000;,
  0.500000;0.875000;,
  0.500000;0.500000;,
  0.625000;0.500000;,
  0.625000;0.625000;,
  0.500000;0.625000;,
  0.625000;0.375000;,
  0.500000;0.375000;,
  0.625000;0.125000;,
  0.625000;0.250000;,
  0.500000;0.250000;,
  0.500000;0.125000;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  0.875000;0.875000;,
  0.750000;0.875000;,
  0.125000;0.875000;,
  0.125000;0.750000;,
  0.250000;0.750000;,
  0.250000;0.875000;,
  0.375000;0.250000;,
  0.375000;0.125000;,
  0.375000;0.500000;,
  0.375000;0.375000;,
  0.375000;0.625000;,
  0.375000;0.875000;,
  0.375000;0.750000;,
  0.500000;0.000000;,
  0.625000;0.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;1.000000;,
  0.625000;1.000000;,
  0.750000;1.000000;,
  0.875000;1.000000;,
  0.125000;1.000000;,
  0.250000;1.000000;;
 }
}