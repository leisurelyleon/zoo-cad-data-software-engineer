from typing import List, Tuple

Vec3 = Tuple[float, float, float]
Tri = Tuple[Vec3, Vec3, Vec3]

def aabb_of(tris: List[Tri]) -> Tuple[Vec3, Vec3]:
    xs = [v[0] for t in tris for v in t]; ys = [v[1] for t in tris for v in t]; zs = [v[2] for t in tris for v in t]
    return (min(xs), min(ys), min(zs)), (max(xs), max(ys), max(zs))

def aabb_overlap(a_min: Vec3, a_max: Vec3, b_min: Vec3, b_max: Vec3) -> bool:
    ax1, ay1, az1 = a_min; ax2, ay2, az2 = a_max
    bx1, by1, bz1 = b_min; bx2, by2, bz2 = b_max
    return not (ax2 < bx1 or ax1 > bx2 or ay2 < by1 or ay1 > by2 or az2 < bz1 or az1 > bz2)
