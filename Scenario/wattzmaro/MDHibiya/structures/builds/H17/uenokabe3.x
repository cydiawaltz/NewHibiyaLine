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
 1.729671;4.262927;1.476987;,
 -0.278857;4.262928;1.476987;,
 -0.278858;1.289956;1.476987;,
 1.729670;1.289956;1.476987;,
 1.721491;4.262927;0.439848;,
 1.721491;4.262928;1.482787;,
 1.721491;1.289956;1.482789;,
 1.721491;1.289956;0.439850;;
 2;
 4;0,1,2,3;,
 4;4,5,6,7;;

 MeshMaterialList {
  2;
  2;
  0,
  1;

  Material Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.500000;
   1.000000;1.000000;1.000000;;
   1.000000;1.000000;1.000000;;

   TextureFilename {
    "uenokabe2.png";
   }
  }

  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.500000;
   1.000000;1.000000;1.000000;;
   1.000000;1.000000;1.000000;;

   TextureFilename {
    "uenokabe2.png";
   }
  }
 }

 MeshNormals {
  2;
  0.000000;0.000000;1.000000;,
  1.000000;0.000000;-0.000000;;
  2;
  4;0,0,0,0;,
  4;1,1,1,1;;
 }

 MeshTextureCoords {
  8;
  0.330646;0.000000;,
  1.002141;0.000000;,
  1.002141;1.000000;,
  0.330646;1.000000;,
  0.665854;0.000000;,
  1.000319;0.000000;,
  1.000319;1.000000;,
  0.665854;1.000000;;
 }
}
