include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_random)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_polygon
                       ${CMAKE_WORKSPACE_NAME}::test
                       ${CMAKE_WORKSPACE_NAME}::random
                       )

# test/Jamfile.v2 controls building of Polygon Library unit tests
#
# Copyright (c) 2010 Intel Corporation
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)


cm_test(NAME polygon_test_polygon_point_test SOURCES polygon_point_test.cpp)
cm_test(NAME polygon_test_polygon_segment_test SOURCES polygon_segment_test.cpp)
cm_test(NAME polygon_test_polygon_interval_test SOURCES polygon_interval_test.cpp)
cm_test(NAME polygon_test_polygon_rectangle_test SOURCES polygon_rectangle_test.cpp)
# cm_test(NAME polygon_test_polygon_rectangle_formation_test SOURCES polygon_rectangle_formation_test.cpp)
cm_test(NAME polygon_test_polygon_set_data_test SOURCES polygon_set_data_test.cpp)
cm_test(NAME polygon_test_polygon_90_data_test SOURCES polygon_90_data_test.cpp)
cm_test(NAME polygon_test_gtl_${CMAKE_WORKSPACE_NAME}_unit_test SOURCES gtl_${CMAKE_WORKSPACE_NAME}_unit_test.cpp)

cm_test(NAME polygon_test_voronoi_builder_test SOURCES voronoi_builder_test.cpp)
cm_test(NAME polygon_test_voronoi_ctypes_test SOURCES voronoi_ctypes_test.cpp)
cm_test(NAME polygon_test_voronoi_diagram_test SOURCES voronoi_diagram_test.cpp)
cm_test(NAME polygon_test_voronoi_geometry_type_test SOURCES voronoi_geometry_type_test.cpp)
cm_test(NAME polygon_test_voronoi_predicates_test SOURCES voronoi_predicates_test.cpp)
cm_test(NAME polygon_test_voronoi_robust_fpt_test SOURCES voronoi_robust_fpt_test.cpp)
cm_test(NAME polygon_test_voronoi_structures_test SOURCES voronoi_structures_test.cpp)



