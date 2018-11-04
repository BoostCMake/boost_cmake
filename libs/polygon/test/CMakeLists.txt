include(CMTest)

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

#test-suite polygon-unit
cm_test(NAME polygon_test_polygon_point_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/polygon_point_test.cpp)
cm_test(NAME polygon_test_polygon_segment_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/polygon_segment_test.cpp)
cm_test(NAME polygon_test_polygon_interval_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/polygon_interval_test.cpp)
cm_test(NAME polygon_test_polygon_rectangle_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/polygon_rectangle_test.cpp)
cm_test(NAME polygon_test_polygon_set_data_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/polygon_set_data_test.cpp)
cm_test(NAME polygon_test_polygon_90_data_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/polygon_90_data_test.cpp)
cm_test(NAME polygon_test_gtl_${CMAKE_WORKSPACE_NAME}_unit_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/gtl_${CMAKE_WORKSPACE_NAME}_unit_test.cpp)

#test-suite voronoi-unit
cm_test(NAME polygon_test_voronoi_builder_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/voronoi_builder_test.cpp)
cm_test(NAME polygon_test_voronoi_ctypes_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/voronoi_ctypes_test.cpp)
cm_test(NAME polygon_test_voronoi_diagram_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/voronoi_diagram_test.cpp)
cm_test(NAME polygon_test_voronoi_geometry_type_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/voronoi_geometry_type_test.cpp)
cm_test(NAME polygon_test_voronoi_predicates_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/voronoi_predicates_test.cpp)
cm_test(NAME polygon_test_voronoi_robust_fpt_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/voronoi_robust_fpt_test.cpp)
cm_test(NAME polygon_test_voronoi_structures_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/voronoi_structures_test.cpp)
