xof 0302txt 0032

Header {
 1;
 0;
 1;
}

template Vector {
 <3d82ab5e-62da-11cf-ab39-0020af71e433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template MeshFace {
 <3d82ab5f-62da-11cf-ab39-0020af71e433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template Mesh {
 <3d82ab44-62da-11cf-ab39-0020af71e433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

template MeshNormals {
 <f6f23f43-7686-11cf-8f52-0040333594a3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template Coords2d {
 <f6f23f44-7686-11cf-8f52-0040333594a3>
 FLOAT u;
 FLOAT v;
}

template MeshTextureCoords {
 <f6f23f40-7686-11cf-8f52-0040333594a3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template ColorRGBA {
 <35ff44e0-6c7c-11cf-8f52-0040333594a3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <d3e16e81-7835-11cf-8f52-0040333594a3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template Material {
 <3d82ab4d-62da-11cf-ab39-0020af71e433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshMaterialList {
 <f6f23f42-7686-11cf-8f52-0040333594a3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material <3d82ab4d-62da-11cf-ab39-0020af71e433>]
}

template TextureFilename {
 <a42790e1-7810-11cf-8f52-0040333594a3>
 STRING filename;
}

Mesh {
 16;
 0.010000;4.559999;0.905333;,
 0.010000;4.440000;0.905333;,
 -0.010000;4.440000;0.905333;,
 -0.010000;4.559999;0.905333;,
 -0.010000;4.440000;4.327737;,
 -0.010000;4.559999;4.327737;,
 0.010000;4.440000;4.327737;,
 0.010000;4.559999;4.327737;,
 -0.150000;4.550000;4.275019;,
 -0.150000;4.550000;0.850219;,
 0.150000;4.550000;0.850219;,
 0.150000;4.550000;4.275019;,
 -0.154815;4.544640;0.850581;,
 -0.154815;4.733107;0.850581;,
 0.154815;4.733107;0.850581;,
 0.154815;4.544640;0.850581;;
 16;
 3;0,1,2;,
 3;0,2,3;,
 3;3,2,4;,
 3;3,4,5;,
 3;5,4,6;,
 3;5,6,7;,
 3;7,6,1;,
 3;7,1,0;,
 3;0,3,5;,
 3;0,5,7;,
 3;1,6,4;,
 3;1,4,2;,
 3;8,9,10;,
 3;8,10,11;,
 3;12,13,14;,
 3;12,14,15;;

 MeshMaterialList {
  3;
  16;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  1,
  2,
  2;

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;

   TextureFilename {
    "rail.dds";
   }
  }

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;

   TextureFilename {
    "gaishi2.dds";
   }
  }

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;

   TextureFilename {
    "tsurigu.dds";
   }
  }
 }

 MeshNormals {
  10;
  -0.000000;-0.000000;-1.000000;,
  -0.000000;0.000000;-1.000000;,
  -1.000000;0.000000;0.000000;,
  -0.000000;0.000000;1.000000;,
  1.000000;0.000000;0.000000;,
  1.000000;-0.000000;0.000000;,
  0.000000;1.000000;-0.000000;,
  0.000000;-1.000000;0.000000;,
  -0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;;
  16;
  3;0,0,0;,
  3;1,1,1;,
  3;2,2,2;,
  3;2,2,2;,
  3;3,3,3;,
  3;3,3,3;,
  3;4,4,4;,
  3;5,5,5;,
  3;6,6,6;,
  3;6,6,6;,
  3;7,7,7;,
  3;8,8,8;,
  3;7,7,7;,
  3;7,7,7;,
  3;9,9,9;,
  3;9,9,9;;
 }

 MeshTextureCoords {
  16;
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;5.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;5.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;;
 }
}
