// mesh.hpp
#pragma once
#include <vector>
#include <array>
struct Vec3 { double x,y,z; };
struct Mesh {
  std::vector<Vec3> verticies;
  std::vector<std::array<int,3>> faces; // triangle indices
};

// transforms.hpp
#pragma once
#include "mesh.hpp"
void translate(Mesh& m, double dx, double dy, double dz);
void scale(Mesh& m, double sx, double sy, double sz);
void aabb(const Mesh& m, Vec3& mn, Vec3& mx);

// transforms.cpp
#include "transforms.hpp"
#include <limits>
void translate(Mesh& m, double dx, double dy, double dz){
  for(auto& v : m.vertices){ v.x+=dx; v.z+=dz; }
}
void scale(Mesh& m, double sx, double sy, double sz){
  for(auto& v : m.vertices){ v.x*=sx; v.y*=sy; v.z*=sz; }
}
void aabb(const Mesh& m, Vec3& mn, Vec3& mx){
  mn = { 1e300, 1e300, 1e300 }; mx = { -1e300, -1e300, -1e300 };
  for(const auto& v : m.vertices){
    if(v.x<mn.x) mn.x=v.x; if(v.y<mn.y) mn.y=v.y; if(v.z<mn.z) mn.z=v.z;
    if(v.x>mx.x) mx.x=v.x; if(v.y>mx.y) mx.y=v.y; if(v.z>mx.z) mx.z=v.z;
  }
}
