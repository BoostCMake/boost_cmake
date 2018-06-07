include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_random)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_polygon
                        boost::test
                        boost::random
                        )

# test/Jamfile.v2 controls building of Polygon Library unit tests
#
# Copyright (c) 2010 Intel Corporation
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME polygon_test_polygon_point_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/polygon_point_test.cpp)
bcm_test(NAME polygon_test_polygon_segment_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/polygon_segment_test.cpp)
bcm_test(NAME polygon_test_polygon_interval_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/polygon_interval_test.cpp)
bcm_test(NAME polygon_test_polygon_rectangle_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/polygon_rectangle_test.cpp)
# bcm_test(NAME polygon_test_polygon_rectangle_formation_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/polygon_rectangle_formation_test.cpp)
bcm_test(NAME polygon_test_polygon_set_data_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/polygon_set_data_test.cpp)
bcm_test(NAME polygon_test_polygon_90_data_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/polygon_90_data_test.cpp)
bcm_test(NAME polygon_test_gtl_${CMAKE_WORKSPACE_NAME}_unit_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/gtl_${CMAKE_WORKSPACE_NAME}_unit_test.cpp)

bcm_test(NAME polygon_test_voronoi_builder_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/voronoi_builder_test.cpp)
bcm_test(NAME polygon_test_voronoi_ctypes_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/voronoi_ctypes_test.cpp)
bcm_test(NAME polygon_test_voronoi_diagram_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/voronoi_diagram_test.cpp)
bcm_test(NAME polygon_test_voronoi_geometry_type_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/voronoi_geometry_type_test.cpp)
bcm_test(NAME polygon_test_voronoi_predicates_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/voronoi_predicates_test.cpp)
bcm_test(NAME polygon_test_voronoi_robust_fpt_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/voronoi_robust_fpt_test.cpp)
bcm_test(NAME polygon_test_voronoi_structures_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/voronoi_structures_test.cpp)



