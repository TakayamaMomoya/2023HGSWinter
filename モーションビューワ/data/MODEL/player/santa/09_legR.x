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
 47;
 0.64252;-0.36944;-9.68797;,
 -0.88861;-8.27598;-7.67526;,
 -7.41068;-8.27598;-7.97515;,
 -10.49253;-0.36944;-7.97515;,
 0.49585;-0.36944;13.94828;,
 0.49585;-0.36944;-0.06862;,
 -10.49253;-0.36944;-0.06862;,
 -10.49253;-0.36944;17.83850;,
 0.49585;-8.27598;6.80166;,
 -7.41068;-8.27598;4.62735;,
 -4.37128;-14.78001;-0.29313;,
 0.12707;-14.78001;-0.29312;,
 0.12707;-14.78001;2.53051;,
 -4.37128;-14.78001;1.92786;,
 -10.49253;-0.36944;-0.06862;,
 -7.41068;-8.27598;-0.06862;,
 -7.41068;-8.27598;4.62735;,
 -10.49253;-0.36944;17.83850;,
 5.34806;-8.27598;3.89447;,
 6.69135;-8.27598;-0.99073;,
 10.49253;-0.36944;-0.06862;,
 8.40239;-0.36944;7.83792;,
 -1.06758;-11.85022;-6.07323;,
 -5.77075;-11.85022;-4.78010;,
 -7.41068;-11.85022;-0.06862;,
 -7.41068;-11.85022;3.83510;,
 0.49585;-11.85022;4.89434;,
 -7.41068;-11.85022;3.83510;,
 5.34806;-11.85022;3.89447;,
 6.69135;-11.85022;-0.99073;,
 2.88769;-14.78000;1.96164;,
 3.65194;-14.78000;-0.81775;,
 5.34806;-8.27598;3.89447;,
 5.34806;-11.85022;3.89447;,
 8.40239;-0.36944;7.83792;,
 10.49253;-0.36944;-0.06862;,
 5.48787;-8.27598;-4.03702;,
 7.01901;-0.36944;-6.04973;,
 3.78619;-11.85022;-3.15157;,
 -0.76243;-14.78000;-3.70939;,
 -3.43825;-14.78000;-2.97369;,
 1.99908;-14.78000;-2.04713;,
 -7.41068;-11.85022;-0.06862;,
 6.69135;-11.85022;-0.99073;,
 -5.77075;-11.85022;-4.78010;,
 -1.06758;-11.85022;-6.07323;,
 3.78619;-11.85022;-3.15157;;
 
 32;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,4,7,9;,
 4;10,11,12,13;,
 4;14,15,16,17;,
 4;18,19,20,21;,
 4;1,22,23,2;,
 4;15,24,25,16;,
 4;26,8,9,27;,
 4;28,29,19,18;,
 4;30,12,11,31;,
 4;32,8,26,33;,
 4;34,4,8,32;,
 4;35,5,4,34;,
 4;36,1,0,37;,
 4;38,22,1,36;,
 4;37,0,5,35;,
 4;6,5,0,3;,
 4;2,15,14,3;,
 4;23,24,15,2;,
 4;39,11,10,40;,
 4;31,11,39,41;,
 4;19,29,38,36;,
 4;20,19,36,37;,
 4;26,27,13,12;,
 4;27,42,10,13;,
 4;33,26,12,30;,
 4;43,33,30,31;,
 4;42,44,40,10;,
 4;44,45,39,40;,
 4;45,46,41,39;,
 4;46,43,31,41;;
 
 MeshMaterialList {
  15;
  32;
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10;;
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
  38;
  0.556092;-0.439079;-0.705671;,
  -0.357826;-0.664443;-0.656107;,
  0.693755;-0.314516;-0.647907;,
  -0.054199;-0.158373;-0.985891;,
  0.699467;-0.526743;0.482999;,
  0.000000;1.000000;0.000000;,
  0.633683;-0.455702;0.625125;,
  -0.920327;-0.391149;0.000000;,
  0.665420;-0.317697;-0.675489;,
  -0.082443;-0.353150;-0.931927;,
  -0.098448;-0.570617;0.815294;,
  0.736742;-0.339723;0.584637;,
  0.154533;-0.552326;-0.819180;,
  0.055920;-0.470742;0.880497;,
  0.167209;-0.501469;0.848864;,
  0.218090;-0.240210;-0.945905;,
  0.204352;-0.366045;-0.907883;,
  0.913255;-0.395809;-0.096441;,
  -0.970038;-0.239075;-0.043245;,
  -0.893571;-0.435417;-0.109284;,
  0.866644;-0.440194;-0.234855;,
  0.953430;-0.268906;-0.136603;,
  -0.373649;-0.925324;-0.064517;,
  0.000001;-1.000000;-0.000001;,
  0.014423;-0.903580;0.428177;,
  -0.308377;-0.902266;0.301364;,
  0.317532;-0.878539;0.356850;,
  0.338423;-0.930985;-0.136880;,
  0.065286;-0.904649;-0.421127;,
  -0.332897;-0.867353;-0.369971;,
  0.347685;-0.780948;-0.518879;,
  0.239143;-0.681872;0.691275;,
  -0.005132;-0.760433;0.649396;,
  -0.931722;-0.363171;0.000000;,
  -0.982782;-0.184767;0.000000;,
  -0.146503;-0.484316;0.862540;,
  -0.952676;-0.291624;-0.085810;,
  -0.961320;-0.216309;-0.170511;;
  32;
  4;15,16,9,3;,
  4;5,5,5,5;,
  4;14,31,32,10;,
  4;22,23,24,25;,
  4;33,18,34,33;,
  4;11,21,17,4;,
  4;16,12,1,9;,
  4;18,19,7,34;,
  4;13,14,10,35;,
  4;6,20,21,11;,
  4;26,24,23,27;,
  4;11,14,13,6;,
  4;4,31,14,11;,
  4;5,5,5,5;,
  4;8,16,15,2;,
  4;0,12,16,8;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;36,18,33,33;,
  4;37,19,18,36;,
  4;28,23,22,29;,
  4;27,23,28,30;,
  4;21,20,0,8;,
  4;17,21,8,2;,
  4;13,35,25,24;,
  4;7,19,22,25;,
  4;6,13,24,26;,
  4;20,6,26,27;,
  4;19,1,29,22;,
  4;1,12,28,29;,
  4;12,0,30,28;,
  4;0,20,27,30;;
 }
 MeshTextureCoords {
  47;
  0.500000;0.750000;,
  0.500000;0.875000;,
  0.625000;0.875000;,
  0.625000;0.750000;,
  0.500000;0.500000;,
  0.500000;0.625000;,
  0.625000;0.625000;,
  0.625000;0.500000;,
  0.500000;0.375000;,
  0.625000;0.375000;,
  0.625000;0.125000;,
  0.500000;0.125000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.750000;0.750000;,
  0.750000;0.875000;,
  0.875000;0.875000;,
  0.875000;0.750000;,
  0.125000;0.875000;,
  0.250000;0.875000;,
  0.250000;0.750000;,
  0.125000;0.750000;,
  0.500000;1.000000;,
  0.625000;1.000000;,
  0.750000;1.000000;,
  0.875000;1.000000;,
  0.500000;0.250000;,
  0.625000;0.250000;,
  0.125000;1.000000;,
  0.250000;1.000000;,
  0.375000;0.250000;,
  0.375000;0.125000;,
  0.375000;0.375000;,
  0.375000;0.250000;,
  0.375000;0.500000;,
  0.375000;0.625000;,
  0.375000;0.875000;,
  0.375000;0.750000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.625000;0.000000;,
  0.375000;0.000000;,
  0.625000;0.125000;,
  0.375000;0.125000;,
  0.625000;0.000000;,
  0.500000;0.000000;,
  0.375000;0.000000;;
 }
}
