
cimport typ_defs
from typ_defs cimport *

cdef extern from "CircleOnSphereUtils.h":

    vector[Vector3] createCirclePointsOnSphere( Vector2 center, double opening_angle_alpha, int amount, float circle_segment_range )
    Vector3 test_haversine( Vector2 center, double opening_angle_alpha, int amount,float circle_segment_range  )


def get_circle_test_points(center , opening_angle_alpha , amount, circle_segment_range):

    cdef Vector2 center_point
    center_point[0] = center[0]
    center_point[1] = center[1]

    cdef vector[Vector3] points
    points = createCirclePointsOnSphere( center_point, opening_angle_alpha, amount, circle_segment_range)
    py_points = []
    for p in points:
        #print [p[0],p[1],p[2]]
        py_points.append([p[0],p[1],p[2]])

    return py_points

def testHaversine(center , opening_angle_alpha , amount, circle_segment_range):
    cdef Vector2 center_point
    center_point[0] = center[0]
    center_point[1] = center[1]
    result = test_haversine( center_point, opening_angle_alpha, amount,circle_segment_range)
    return [result[0],result[1],result[2]]
