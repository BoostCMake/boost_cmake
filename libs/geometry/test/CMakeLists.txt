include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_program_options)
find_package(${CMAKE_WORKSPACE_NAME}_foreach)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_optional)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_ptr_container)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_conversion)
find_package(${CMAKE_WORKSPACE_NAME}_assign)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_geometry
                        boost::random
                        boost::program_options
                        boost::foreach
                        boost::test
                        boost::typeof
                        boost::optional
                        boost::timer
                        boost::ptr_container
                        boost::numeric_conversion
                        boost::assign
                        )

#core
cm_test(NAME geometry_test_core_access SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/access.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_coordinate_dimension SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/coordinate_dimension.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_coordinate_system SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/coordinate_system.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_coordinate_type SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/coordinate_type.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_geometry_id SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/geometry_id.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_point_type SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/point_type.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_radian_access SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/radian_access.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_radius SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/radius.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#    cm_test(NAME SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/reverse_dispatch.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_ring SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/ring.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_tag SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/tag.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_core_topological_dimension SOURCES ${CMAKE_CURRENT_BINARY_DIR}/core/topological_dimension.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#point_concept
cm_test(NAME geometry_test_concepts_linestring_conceptr SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/linestring_concept.cpp COMPILE_ONLY)
cm_test(NAME geometry_test_concepts_point_well_formed_non_cartesian SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_well_formed_non_cartesian.cpp COMPILE_ONLY)
cm_test(NAME geometry_test_concepts_point_well_formed SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_well_formed.cpp COMPILE_ONLY)
cm_test(NAME geometry_test_concepts_point_well_formed_traits SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_well_formed_traits.cpp COMPILE_ONLY)
cm_test(NAME geometry_test_concepts_point_array SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_array.cpp COMPILE_ONLY)
cm_test(NAME geometry_test_concepts_point_geographic_custom_point_with_wrong_units SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_geographic_custom_with_wrong_units.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME geometry_test_concepts_point_geographic_point_with_wrong_units SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_geographic_with_wrong_units.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME geometry_test_concepts_point_without_coordinate_type SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_without_coordinate_type.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME geometry_test_concepts_point_without_dimension SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_without_dimension.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME geometry_test_concepts_point_without_getter SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_without_getter.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME geometry_test_concepts_point_without_setter SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_without_setter.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME geometry_test_concepts_point_with_incorrect_dimension SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/point_with_incorrect_dimension.cpp COMPILE_ONLY WILL_FAIL)

#geometries
cm_test(NAME geometry_test_geometries_adapted SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/adapted.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_array_as_point SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/${CMAKE_WORKSPACE_NAME}_array_as_point.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_fusion SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/${CMAKE_WORKSPACE_NAME}_fusion.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_polygon SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/${CMAKE_WORKSPACE_NAME}_polygon.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_range SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/${CMAKE_WORKSPACE_NAME}_range.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_tuple SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/${CMAKE_WORKSPACE_NAME}_tuple.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_geometries_box SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/box.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#[ compile-fail custom_linestring.cpp
#    : # requirements
#    <define>TEST_FAIL_CLEAR
#    : # target name
#    custom_linestring_test_fail_clear
#)
cm_test(NAME geometry_test_geometries_custom_linestring SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/custom_linestring.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_geometries_geometries SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/geometries.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_geometries_geometries PRIVATE -DBOOST_GEOMETRY_EXPERIMENTAL_ENABLE_INITIALIZER_LIST)
cm_test(NAME geometry_test_geometries_segment SOURCES ${CMAKE_CURRENT_BINARY_DIR}/geometries/segment.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#arithmetic
cm_test(NAME geometry_test_arithmetic_arithmetic SOURCES ${CMAKE_CURRENT_BINARY_DIR}/arithmetic/arithmetic.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_arithmetic_dot_product SOURCES ${CMAKE_CURRENT_BINARY_DIR}/arithmetic/dot_product.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#algorithms
cm_test(NAME geometry_test_algorithms_append SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/append.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_area SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/area.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_assign SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/assign.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_buffer SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/buffer.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_centroid SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/centroid.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_comparable_distance SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/comparable_distance.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_convex_hull SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/convex_hull.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_correct SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/correct.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_convert SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/convert.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_envelope SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/envelope.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_expand SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/expand.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_for_each SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/for_each.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_is_simple SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/is_simple.cpp)
cm_test(NAME geometry_test_algorithms_is_valid SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/is_valid.cpp)
cm_test(NAME geometry_test_algorithms_is_valid_failure SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/is_valid_failure.cpp)
cm_test(NAME geometry_test_algorithms_length SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/length.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_make SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/make.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_area_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/area_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_centroid_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/centroid_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_convert_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/convert_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_convex_hull_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/convex_hull_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_correct_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/correct_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_envelope_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/envelope_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_for_each_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/for_each_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_length_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/length_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_num_geometries_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/num_geometries_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_num_interior_rings_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/num_interior_rings_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_num_points_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/num_points_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_perimeter_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/perimeter_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_reverse_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/reverse_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_simplify_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/simplify_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_transform_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/transform_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_unique_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/unique_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_num_geometries SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/num_geometries.cpp)
cm_test(NAME geometry_test_algorithms_num_interior_rings SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/num_interior_rings.cpp)
cm_test(NAME geometry_test_algorithms_num_points SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/num_points.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_num_segments SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/num_segments.cpp)
cm_test(NAME geometry_test_algorithms_perimeter SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/perimeter.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_point_on_surface SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/point_on_surface.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_remove_spikes SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/remove_spikes.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_reverse SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/reverse.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_simplify SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/simplify.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_transform SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/transform.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_unique SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/unique.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#algorithms buffer
cm_test(NAME geometry_test_algorithms_buffer_buffer_point SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/buffer/buffer_point.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_buffer_buffer_point PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_buffer_point PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/buffer)
cm_test(NAME geometry_test_algorithms_buffer_buffer_linestring SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/buffer/buffer_linestring.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_buffer_buffer_linestring PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_buffer_linestring  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/buffer)
cm_test(NAME geometry_test_algorithms_buffer_buffer_polygon SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/buffer/buffer_polygon.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_buffer_buffer_polygon PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_buffer_polygon  PRIVATE ${CURRENT_TEST_SOURCES_DIR}/algorithms/buffer)
cm_test(NAME geometry_test_algorithms_buffer_buffer_multi_point SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/buffer/buffer_multi_point.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_include_directories(geometry_test_algorithms_buffer_buffer_multi_point PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/buffer)
target_compile_definitions(geometry_test_algorithms_buffer_buffer_multi_point PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
cm_test(NAME geometry_test_algorithms_buffer_buffer_multi_linestring SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/buffer/buffer_multi_linestring.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_buffer_buffer_multi_linestring PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_buffer_multi_linestring PRIVATE ${CURRENT_TEST_SOURCES_DIR}/algorithms/buffer)
cm_test(NAME geometry_test_algorithms_buffer_buffer_multi_polygon SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/buffer/buffer_multi_polygon.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_include_directories(geometry_test_algorithms_buffer_buffer_multi_polygon PRIVATE ${CURRENT_TEST_SOURCES_DIR}/algorithms/buffer)
target_compile_definitions(geometry_test_algorithms_buffer_buffer_multi_polygon PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)

cm_test(NAME geometry_test_algorithms_buffer_buffer_linestring_aimes SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/buffer/buffer_linestring_aimes.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_buffer_buffer_linestring_aimes PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_buffer_linestring_aimes PRIVATE ${CURRENT_TEST_SOURCES_DIR}/algorithms/buffer)
#    cm_test(NAME SOURCES ${CMAKE_CURRENT_BINARY_DIR}/country_buffer.cpp          : : : <define>BOOST_GEOMETRY_TEST_ONLY_ONE_TYPE  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#algorithms detail
cm_test(NAME geometry_test_algorithms_detail_as_range SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/detail/as_range.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_detail_partition SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/detail/partition.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#algorithms distance
cm_test(NAME geometry_test_algorithms_distance_distance SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/distance/distance.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_distance_distance_areal_areal SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/distance/distance_areal_areal.cpp)
cm_test(NAME geometry_test_algorithms_distance_distance_linear_areal SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/distance/distance_linear_areal.cpp)
cm_test(NAME geometry_test_algorithms_distance_distance_linear_linear SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/distance/distance_linear_linear.cpp)
cm_test(NAME geometry_test_algorithms_distance_distance_pointlike_areal SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/distance/distance_pointlike_areal.cpp)
cm_test(NAME geometry_test_algorithms_distance_distance_pointlike_linear SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/distance/distance_pointlike_linear.cpp)
cm_test(NAME geometry_test_algorithms_distance_distance_pointlike_pointlike SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/distance/distance_pointlike_pointlike.cpp)
cm_test(NAME geometry_test_algorithms_distance_distance_se_pl_l SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/distance/distance_se_pl_l.cpp)
cm_test(NAME geometry_test_algorithms_distance_distance_se_pl_pl SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/distance/distance_se_pl_pl.cpp)
#algorithms overlay
cm_test(NAME geometry_test_algorithms_overlay_assemble SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/assemble.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_traverse_ccw SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/traverse_ccw.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_get_turn_info SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/get_turn_info.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_get_turns SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/get_turns.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_get_turns_areal_areal SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/get_turns_areal_areal.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_get_turns_linear_linear SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/get_turns_linear_linear.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_get_turns_linear_areal SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/get_turns_linear_areal.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_traverse_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/traverse_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_overlay_traverse_multi PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE -DBOOST_GEOMETRY_RESCALE_TO_ROBUST)
cm_test(NAME geometry_test_algorithms_overlay_relative_order SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/relative_order.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_select_rings SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/select_rings.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_self_intersection_points SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/self_intersection_points.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_overlay_traverse SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/overlay/traverse.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_overlay_traverse PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
#algorithms relational_operations
cm_test(NAME geometry_test_algorithms_relational_operations_covered_by SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/covered_by.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_crosses SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/crosses.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_equals SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/equals.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_intersects_intersects SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/intersects/intersects.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/intersects)
cm_test(NAME geometry_test_algorithms_relational_operations_covered_by_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/covered_by_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations)
cm_test(NAME geometry_test_algorithms_relational_operations_equals_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/equals_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations)
cm_test(NAME geometry_test_algorithms_relational_operations_intersects_intersects_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/intersects/intersects_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/intersects)
cm_test(NAME geometry_test_algorithms_relational_operations_touches_touches_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/touches/touches_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/touches)
cm_test(NAME geometry_test_algorithms_relational_operations_overlaps_overlaps SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/overlaps/overlaps.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/overlaps)
cm_test(NAME geometry_test_algorithms_relational_operations_touches_touches SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/touches/touches.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/touches)

#algorithms relational_operations disjoint
cm_test(NAME geometry_test_algorithms_relational_operations_disjoint_disjoint SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/disjoint/disjoint.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_disjoint_disjoint_coverage_a_a SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/disjoint/disjoint_coverage_a_a.cpp)
cm_test(NAME geometry_test_algorithms_relational_operations_disjoint_disjoint_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/disjoint/disjoint_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#algorithms relational_operations relate
cm_test(NAME geometry_test_algorithms_relational_operations_relate_relate_areal_areal SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/relate/relate_areal_areal.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_relate_relate_linear_areal SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/relate/relate_linear_areal.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_relate_relate_linear_linear SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/relate/relate_linear_linear.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#algorithms relational_operations within
cm_test(NAME geometry_test_algorithms_relational_operations_within_within_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/within/within_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_within_within SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/within/within.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_within_within_areal_areal SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/within/within_areal_areal.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_within_within_linear_areal SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/within/within_linear_areal.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_algorithms_relational_operations_within_within_linear_linear SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/relational_operations/within/within_linear_linear.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

#algorithms set_operations
#algorithms set_operations difference
cm_test(NAME geometry_test_algorithms_set_operations_difference_difference SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/set_operations/difference/difference.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_set_operations_difference_difference PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
cm_test(NAME geometry_test_algorithms_set_operations_difference_difference_linear_linear SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/difference/difference_linear_linear.cpp)
cm_test(NAME geometry_test_algorithms_set_operations_difference_difference_pl_pl SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/difference/difference_pl_pl.cpp)
cm_test(NAME geometry_test_algorithms_set_operations_difference_difference_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/set_operations/difference/difference_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_set_operations_difference_difference_multi PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
cm_test(NAME geometry_test_algorithms_set_operations_difference_difference_multi_spike SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/set_operations/difference/difference_multi_spike.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_set_operations_difference_difference_multi_spike PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
#algorithms set_operations intersection
cm_test(NAME geometry_test_algorithms_set_operations_intersection_intersection SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/set_operations/intersection/intersection.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_set_operations_intersection_intersection PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
cm_test(NAME geometry_test_algorithms_set_operations_intersection_intersection_linear_linear SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/intersection/intersection_linear_linear.cpp)
target_compile_definitions(geometry_test_algorithms_set_operations_intersection_intersection_linear_linear PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
cm_test(NAME geometry_test_algorithms_set_operations_intersection_intersection_pl_pl SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/intersection/intersection_pl_pl.cpp)
cm_test(NAME geometry_test_algorithms_set_operations_intersection_intersection_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/set_operations/intersection/intersection_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_set_operations_intersection_intersection_multi PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
#algorithms set_operations sym_difference
cm_test(NAME geometry_test_algorithms_set_operations_sym_difference_sym_difference_linear_linear SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/sym_difference/sym_difference_linear_linear.cpp)
#algorithms set_operations union
cm_test(NAME geometry_test_algorithms_set_union_union_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/set_operations/union/union_multi.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_set_union_union_multi PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
cm_test(NAME geometry_test_algorithms_set_union_union SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms/set_operations/union/union.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_definitions(geometry_test_algorithms_set_union_union PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
cm_test(NAME geometry_test_algorithms_set_union_union_linear_linear SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/union/union_linear_linear.cpp)
cm_test(NAME geometry_test_algorithms_set_union_union_pl_pl SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/union/union_pl_pl.cpp)
#iterators
cm_test(NAME geometry_test_iterators_closing_iterator SOURCES ${CMAKE_CURRENT_BINARY_DIR}/iterators/closing_iterator.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_iterators_concatenate_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterators/concatenate_iterator.cpp)
cm_test(NAME geometry_test_iterators_ever_circling_iterator SOURCES ${CMAKE_CURRENT_BINARY_DIR}/iterators/ever_circling_iterator.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_iterators_flatten_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterators/flatten_iterator.cpp)
cm_test(NAME geometry_test_iterators_point_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterators/point_iterator.cpp)
cm_test(NAME geometry_test_iterators_segment_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterators/segment_iterator.cpp)
#strategies
cm_test(NAME geometry_test_strategies_andoyer SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/andoyer.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_cross_track SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/cross_track.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_crossings_multiply SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/crossings_multiply.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_distance_default_result SOURCES ${CURRENT_TEST_SOURCES_DIR}/strategies/distance_default_result.cpp)
cm_test(NAME geometry_test_strategies_douglas_peucker SOURCES ${CURRENT_TEST_SOURCES_DIR}/strategies/douglas_peucker.cpp)
cm_test(NAME geometry_test_strategies_franklin SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/franklin.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_haversine SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/haversine.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_point_in_box SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/point_in_box.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_projected_point SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/projected_point.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_projected_point_ax SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/projected_point_ax.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_pythagoras SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/pythagoras.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_pythagoras_point_box SOURCES ${CURRENT_TEST_SOURCES_DIR}/strategies/pythagoras_point_box.cpp)
cm_test(NAME geometry_test_strategies_spherical_side SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/spherical_side.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_segment_intersection_collinear SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/segment_intersection_collinear.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_side_of_intersection SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/side_of_intersection.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_transform_cs SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/transform_cs.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_transformer SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/transformer.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_vincenty SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/vincenty.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_strategies_winding SOURCES ${CMAKE_CURRENT_BINARY_DIR}/strategies/winding.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#policies
cm_test(NAME geometry_test_policies_compare SOURCES ${CMAKE_CURRENT_BINARY_DIR}/policies/compare.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_policies_rescale_policy SOURCES ${CMAKE_CURRENT_BINARY_DIR}/policies/rescale_policy.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#io
#io wkt
cm_test(NAME geometry_test_io_wkt_wkt_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/io/wkt/wkt_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_io_wkt_wkt SOURCES ${CMAKE_CURRENT_BINARY_DIR}/io/wkt/wkt.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#io dsv
cm_test(NAME geometry_test_io_dsv_dsv_multi SOURCES ${CMAKE_CURRENT_BINARY_DIR}/io/dsv/dsv_multi.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#util
cm_test(NAME geometry_test_util_calculation_type SOURCES ${CMAKE_CURRENT_BINARY_DIR}/util/calculation_type.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_util_for_each_coordinate SOURCES ${CMAKE_CURRENT_BINARY_DIR}/util/for_each_coordinate.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_util_math_sqrt SOURCES ${CURRENT_TEST_SOURCES_DIR}/util/math_sqrt.cpp)
cm_test(NAME geometry_test_util_promote_integral SOURCES ${CURRENT_TEST_SOURCES_DIR}/util/promote_integral.cpp)
cm_test(NAME geometry_test_util_range SOURCES ${CMAKE_CURRENT_BINARY_DIR}/util/range.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_util_rational SOURCES ${CMAKE_CURRENT_BINARY_DIR}/util/rational.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_util_select_most_precise SOURCES ${CMAKE_CURRENT_BINARY_DIR}/util/select_most_precise.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_util_write_dsv SOURCES ${CMAKE_CURRENT_BINARY_DIR}/util/write_dsv.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#views
cm_test(NAME geometry_test_views_segment_view SOURCES ${CMAKE_CURRENT_BINARY_DIR}/views/segment_view.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_views_box_view SOURCES ${CMAKE_CURRENT_BINARY_DIR}/views/box_view.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_views_reversible_view SOURCES ${CMAKE_CURRENT_BINARY_DIR}/views/reversible_view.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_views_closeable_view SOURCES ${CMAKE_CURRENT_BINARY_DIR}/views/closeable_view.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME geometry_test_views_reversible_closeable SOURCES ${CMAKE_CURRENT_BINARY_DIR}/views/reversible_closeable.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})


include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/buffer)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/detail)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/detail/sections)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/distance)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/overlay)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms)

include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/disjoint)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/relate)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations/within)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/relational_operations)

include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/difference)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/intersection)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/sym_difference)
include_directories(${CURRENT_TEST_SOURCES_DIR}/algorithms/set_operations/union)

include_directories(${CURRENT_TEST_SOURCES_DIR}/arithmetic)

include_directories(${CURRENT_TEST_SOURCES_DIR}/concepts)

include_directories(${CURRENT_TEST_SOURCES_DIR}/core)

include_directories(${CURRENT_TEST_SOURCES_DIR}/geometries)

include_directories(${CURRENT_TEST_SOURCES_DIR}/io)

include_directories(${CURRENT_TEST_SOURCES_DIR}/iterators)

include_directories(${CURRENT_TEST_SOURCES_DIR}/point_concept)

include_directories(${CURRENT_TEST_SOURCES_DIR}/policies)

include_directories(${CURRENT_TEST_SOURCES_DIR}/robustness)

include_directories(${CURRENT_TEST_SOURCES_DIR}/strategies)

include_directories(${CURRENT_TEST_SOURCES_DIR}/test_common)

include_directories(${CURRENT_TEST_SOURCES_DIR}/test_geometries)

include_directories(${CURRENT_TEST_SOURCES_DIR}/util)

include_directories(${CURRENT_TEST_SOURCES_DIR}/views)

include_directories(${CURRENT_TEST_SOURCES_DIR})