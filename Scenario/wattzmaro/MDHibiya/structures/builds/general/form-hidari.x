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
 8;
 1.500000;1.100000;0.008078;,
 1.500000;1.100000;1.658078;,
 2.700000;1.100000;1.658078;,
 2.700000;1.100000;0.008078;,
 2.680587;1.100000;0.009678;,
 2.680587;1.100000;1.659678;,
 2.680587;0.850000;1.659678;,
 2.680587;0.850000;0.009678;;
 4;
 3;0,1,2;,
 3;0,2,3;,
 3;4,5,6;,
 3;4,6,7;;

 MeshMaterialList {
  2;
  4;
  0,
  0,
  1,
  1;

  Material hanendFormRMaterial {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;

   TextureFilename {
    "kiiroi-sen.png";
   }
  }

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;

   TextureFilename {
    "PlatformC.dds";
   }
  }
 }

 MeshNormals {
  4;
  0.000000;1.000000;0.000000;,
  -0.000000;1.000000;0.000000;,
  1.000000;0.000000;-0.000000;,
  1.000000;0.000000;0.000000;;
  4;
  3;0,0,0;,
  3;1,1,1;,
  3;2,2,2;,
  3;3,3,3;;
 }

 MeshTextureCoords {
  8;
  0.000000;1.007994;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.008168;1.001233;,
  0.000000;1.000000;,
  0.600000;1.000000;,
  0.600000;0.000000;,
  0.000000;0.000000;;
 }
}
