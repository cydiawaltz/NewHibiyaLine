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
 20;
 -7.199832;4.043219;11.931650;,
 -7.199832;4.043218;8.761286;,
 -7.199832;1.146957;8.761288;,
 -7.199832;1.146958;11.931652;,
 -7.215068;4.043219;3.451797;,
 -4.460781;4.043218;3.451797;,
 -4.460782;1.146957;3.451797;,
 -7.215069;1.146958;3.451797;,
 -7.211223;4.043219;8.780366;,
 -7.211223;4.043217;6.026079;,
 -7.211223;1.146956;6.026080;,
 -7.211223;1.146958;8.780367;,
 -7.199832;4.043219;6.629747;,
 -7.199832;4.043217;3.459383;,
 -7.199832;1.146956;3.459384;,
 -7.199832;1.146958;6.629749;,
 -7.199832;4.043218;12.124762;,
 -7.199832;4.043218;11.879323;,
 -7.199832;1.146957;11.879324;,
 -7.199832;1.146957;12.124763;;
 5;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,14,15;,
 4;16,17,18,19;;

 MeshMaterialList {
  5;
  5;
  0,
  1,
  2,
  3,
  4;

  Material Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.500000;
   1.000000;1.000000;1.000000;;
   1.000000;1.000000;1.000000;;

   TextureFilename {
    "kouji1.png";
   }
  }

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.500000;
   1.000000;1.000000;1.000000;;
   1.000000;1.000000;1.000000;;

   TextureFilename {
    "kouji1.png";
   }
  }

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.500000;
   1.000000;1.000000;1.000000;;
   1.000000;1.000000;1.000000;;

   TextureFilename {
    "kouji1.png";
   }
  }

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.500000;
   1.000000;1.000000;1.000000;;
   1.000000;1.000000;1.000000;;

   TextureFilename {
    "kouji1.png";
   }
  }

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.500000;
   1.000000;1.000000;1.000000;;
   1.000000;1.000000;1.000000;;

   TextureFilename {
    "kouji1.png";
   }
  }
 }

 MeshNormals {
  2;
  -1.000000;-0.000000;0.000000;,
  0.000000;0.000000;-1.000000;;
  5;
  4;0,0,0,0;,
  4;1,1,1,1;,
  4;0,0,0,0;,
  4;0,0,0,0;,
  4;0,0,0,0;;
 }

 MeshTextureCoords {
  20;
  0.024798;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.024798;1.000000;,
  0.000000;0.000000;,
  0.438776;0.000000;,
  0.438776;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.438776;0.000000;,
  0.438776;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.946153;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.946153;1.000000;;
 }
}
