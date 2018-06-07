include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

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
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_geometry
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
                        boost::unit_test_framework
                        )

#core
bcm_test(NAME geometry_test_core_access SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/access.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_coordinate_dimension SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/coordinate_dimension.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_coordinate_system SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/coordinate_system.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_coordinate_type SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/coordinate_type.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_geometry_id SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/geometry_id.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_point_type SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/point_type.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_radian_access SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/radian_access.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_radius SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/radius.cpp  NEED_PATCH)
#    bcm_test(NAME SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/reverse_dispatch.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_ring SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/ring.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_tag SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/tag.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_core_topological_dimension SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/topological_dimension.cpp  NEED_PATCH)

#point_concept
bcm_test(NAME geometry_test_point_concept_concept_checker SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/concept_checker.cpp COMPILE_ONLY)
bcm_test(NAME geometry_test_point_concept_well_formed_non_cartesian_point SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/well_formed_non_cartesian_point.cpp COMPILE_ONLY)
bcm_test(NAME geometry_test_point_concept_well_formed_point SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/well_formed_point.cpp COMPILE_ONLY)
bcm_test(NAME geometry_test_point_concept_well_formed_point_traits SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/well_formed_point_traits.cpp COMPILE_ONLY)
bcm_test(NAME geometry_test_point_concept_array_point SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/array_point.cpp COMPILE_ONLY)
bcm_test(NAME geometry_test_point_concept_geographic_custom_point_with_wrong_units SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/geographic_custom_point_with_wrong_units.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME geometry_test_point_concept_geographic_point_with_wrong_units SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/geographic_point_with_wrong_units.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME geometry_test_point_concept_point_without_coordinate_type SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/point_without_coordinate_type.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME geometry_test_point_concept_point_without_dimension SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/point_without_dimension.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME geometry_test_point_concept_point_without_getter SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/point_without_getter.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME geometry_test_point_concept_point_without_setter SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/point_without_setter.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME geometry_test_point_concept_point_with_incorrect_dimension SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/point_with_incorrect_dimension.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME geometry_test_point_concept_spherical_equatorial_custom_point_with_wrong_units SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/spherical_equatorial_custom_point_with_wrong_units.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME geometry_test_point_concept_spherical_equatorial_point_with_wrong_units SOURCES ${CMAKE_WORKSPACE_SOURCE}/point_concept/spherical_equatorial_point_with_wrong_units.cpp COMPILE_ONLY WILL_FAIL)

#geometries
bcm_test(NAME geometry_test_geometries_adapted SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/adapted.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_array_as_point SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/${CMAKE_WORKSPACE_NAME}_array_as_point.cpp NEED_PATCH)
bcm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_fusion SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/${CMAKE_WORKSPACE_NAME}_fusion.cpp NEED_PATCH)
bcm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_polygon SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/${CMAKE_WORKSPACE_NAME}_polygon.cpp NEED_PATCH)
bcm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_range SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/${CMAKE_WORKSPACE_NAME}_range.cpp NEED_PATCH)
bcm_test(NAME geometry_test_geometries_${CMAKE_WORKSPACE_NAME}_tuple SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/${CMAKE_WORKSPACE_NAME}_tuple.cpp NEED_PATCH)
bcm_test(NAME geometry_test_geometries_box SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/box.cpp  NEED_PATCH)
#[ compile-fail custom_linestring.cpp
#    : # requirements
#    <define>TEST_FAIL_CLEAR
#    : # target name
#    custom_linestring_test_fail_clear
#)
bcm_test(NAME geometry_test_geometries_custom_linestring SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/custom_linestring.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_geometries_geometries SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/geometries.cpp NEED_PATCH)
target_compile_definitions(geometry_test_geometries_geometries PRIVATE -DBOOST_GEOMETRY_EXPERIMENTAL_ENABLE_INITIALIZER_LIST)
bcm_test(NAME geometry_test_geometries_segment SOURCES ${CMAKE_WORKSPACE_SOURCE}/geometries/segment.cpp  NEED_PATCH)

#arithmetic
bcm_test(NAME geometry_test_arithmetic_arithmetic SOURCES ${CMAKE_WORKSPACE_SOURCE}/arithmetic/arithmetic.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_arithmetic_dot_product SOURCES ${CMAKE_WORKSPACE_SOURCE}/arithmetic/dot_product.cpp  NEED_PATCH)

#algorithms
bcm_test(NAME geometry_test_algorithms_append SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/append.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_area SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/area.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/assign.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_centroid SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/centroid.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_comparable_distance SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/comparable_distance.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_convex_hull SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/convex_hull.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_correct SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/correct.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_convert SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/convert.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_envelope SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/envelope.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_expand SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/expand.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_for_each SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/for_each.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_is_simple SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/is_simple.cpp )
bcm_test(NAME geometry_test_algorithms_is_valid SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/is_valid.cpp)
bcm_test(NAME geometry_test_algorithms_is_valid_failure SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/is_valid_failure.cpp )
bcm_test(NAME geometry_test_algorithms_length SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/length.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_make SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/make.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_area SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_area.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_centroid SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_centroid.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_convert SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_convert.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_convex_hull SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_convex_hull.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_correct SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_correct.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_envelope SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_envelope.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_for_each SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_for_each.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_length SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_length.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_num_geometries SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_num_geometries.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_num_interior_rings SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_num_interior_rings.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_num_points SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_num_points.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_perimeter SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_perimeter.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_reverse SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_reverse.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_simplify SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_simplify.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_transform SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_transform.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_multi_unique SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/multi_unique.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_num_geometries SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/num_geometries.cpp )
bcm_test(NAME geometry_test_algorithms_num_interior_rings SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/num_interior_rings.cpp )
bcm_test(NAME geometry_test_algorithms_num_points SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/num_points.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_num_segments SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/num_segments.cpp )
bcm_test(NAME geometry_test_algorithms_perimeter SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/perimeter.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_point_on_surface SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/point_on_surface.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_remove_spikes SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/remove_spikes.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_reverse SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/reverse.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_simplify SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/simplify.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_transform SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/transform.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_unique SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/unique.cpp  NEED_PATCH)
#algorithms buffer
bcm_test(NAME geometry_test_algorithms_buffer_point_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer/point_buffer.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_buffer_point_buffer PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_point_buffer PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/buffer)
bcm_test(NAME geometry_test_algorithms_buffer_linestring_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer/linestring_buffer.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_buffer_linestring_buffer PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_linestring_buffer  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/buffer)
bcm_test(NAME geometry_test_algorithms_buffer_polygon_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer/polygon_buffer.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_buffer_polygon_buffer PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_polygon_buffer  PRIVATE ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer)
bcm_test(NAME geometry_test_algorithms_buffer_multi_point_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer/multi_point_buffer.cpp NEED_PATCH)
target_include_directories(geometry_test_algorithms_buffer_multi_point_buffer PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/buffer)
target_compile_definitions(geometry_test_algorithms_buffer_multi_point_buffer PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
bcm_test(NAME geometry_test_algorithms_buffer_multi_linestring_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer/multi_linestring_buffer.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_buffer_multi_linestring_buffer PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_multi_linestring_buffer PRIVATE ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer)
bcm_test(NAME geometry_test_algorithms_buffer_multi_polygon_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer/multi_polygon_buffer.cpp NEED_PATCH)
target_include_directories(geometry_test_algorithms_buffer_multi_polygon_buffer PRIVATE ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer)
target_compile_definitions(geometry_test_algorithms_buffer_multi_polygon_buffer PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)

target_include_directories(geometry_test_algorithms_buffer_multi_polygon_buffer PRIVATE ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer)
bcm_test(NAME geometry_test_algorithms_buffer_aimes_linestring_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer/aimes_linestring_buffer.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_buffer_aimes_linestring_buffer PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
target_include_directories(geometry_test_algorithms_buffer_aimes_linestring_buffer PRIVATE ${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer)
#    bcm_test(NAME SOURCES ${CMAKE_WORKSPACE_SOURCE}/country_buffer.cpp          : : : <define>BOOST_GEOMETRY_TEST_ONLY_ONE_TYPE  NEED_PATCH)
#algorithms detail
bcm_test(NAME geometry_test_algorithms_detail_as_range SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/detail/as_range.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_detail_partition SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/detail/partition.cpp  NEED_PATCH)
#algorithms distance
bcm_test(NAME geometry_test_algorithms_distance_distance SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_distance_distance_areal_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance_areal_areal.cpp )
bcm_test(NAME geometry_test_algorithms_distance_distance_linear_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance_linear_areal.cpp )
bcm_test(NAME geometry_test_algorithms_distance_distance_linear_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance_linear_linear.cpp )
bcm_test(NAME geometry_test_algorithms_distance_distance_pointlike_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance_pointlike_areal.cpp )
bcm_test(NAME geometry_test_algorithms_distance_distance_pointlike_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance_pointlike_linear.cpp )
bcm_test(NAME geometry_test_algorithms_distance_distance_pointlike_pointlike SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance_pointlike_pointlike.cpp)
bcm_test(NAME geometry_test_algorithms_distance_distance_se_pl_l SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance_se_pl_l.cpp )
bcm_test(NAME geometry_test_algorithms_distance_distance_se_pl_pl SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/distance/distance_se_pl_pl.cpp )
#algorithms overlay
bcm_test(NAME geometry_test_algorithms_overlay_assemble SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/assemble.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_ccw_traverse SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/ccw_traverse.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_get_turn_info SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/get_turn_info.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_get_turns SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/get_turns.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_get_turns_areal_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/get_turns_areal_areal.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_get_turns_linear_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/get_turns_linear_linear.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_get_turns_linear_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/get_turns_linear_areal.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_multi_traverse SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/multi_traverse.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_overlay_multi_traverse PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE -DBOOST_GEOMETRY_RESCALE_TO_ROBUST)
bcm_test(NAME geometry_test_algorithms_overlay_relative_order SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/relative_order.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_select_rings SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/select_rings.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_self_intersection_points SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/self_intersection_points.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_overlay_traverse SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay/traverse.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_overlay_traverse PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
#algorithms relational_operations
bcm_test(NAME geometry_test_algorithms_relational_operations_covered_by SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/covered_by.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_crosses SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/crosses.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_equals SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/equals.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_intersects SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/intersects.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_multi_covered_by SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/multi_covered_by.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_multi_equals SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/multi_equals.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_multi_intersects SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/multi_intersects.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_multi_touches SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/multi_touches.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_overlaps SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/overlaps.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_touches SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/touches.cpp  NEED_PATCH)
#algorithms relational_operations disjoint
bcm_test(NAME geometry_test_algorithms_relational_operations_disjoint_disjoint SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/disjoint/disjoint.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_disjoint_disjoint_coverage SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/disjoint/disjoint_coverage.cpp )
bcm_test(NAME geometry_test_algorithms_relational_operations_disjoint_multi_disjoint SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/disjoint/multi_disjoint.cpp  NEED_PATCH)
#algorithms relational_operations relate
bcm_test(NAME geometry_test_algorithms_relational_operations_relate_relate_areal_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/relate/relate_areal_areal.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_relate_relate_linear_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/relate/relate_linear_areal.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_relate_relate_linear_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/relate/relate_linear_linear.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_relate_relate_pointlike_xxx SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/relate/relate_pointlike_xxx.cpp  NEED_PATCH)
#algorithms relational_operations within
bcm_test(NAME geometry_test_algorithms_relational_operations_within_multi_within SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/within/multi_within.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_within_within SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/within/within.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_within_within_areal_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/within/within_areal_areal.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_within_within_linear_areal SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/within/within_linear_areal.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_within_within_linear_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/within/within_linear_linear.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_algorithms_relational_operations_within_within_pointlike_xxx SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/within/within_pointlike_xxx.cpp  NEED_PATCH)
#target_include_directories(geometry_test_algorithms_relational_operations_within_within_pointlike_xxx PRIVATE ${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/within)

#algorithms set_operations
#algorithms set_operations difference
bcm_test(NAME geometry_test_algorithms_set_operations_difference_difference SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/difference/difference.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_set_operations_difference_difference PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
bcm_test(NAME geometry_test_algorithms_set_operations_difference_difference_linear_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/difference/difference_linear_linear.cpp )
bcm_test(NAME geometry_test_algorithms_set_operations_difference_difference_pl_pl SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/difference/difference_pl_pl.cpp )
bcm_test(NAME geometry_test_algorithms_set_operations_difference_multi_difference SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/difference/multi_difference.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_set_operations_difference_multi_difference PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
bcm_test(NAME geometry_test_algorithms_set_operations_difference_multi_difference_spike SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/difference/multi_difference_spike.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_set_operations_difference_multi_difference_spike PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
#algorithms set_operations intersection
bcm_test(NAME geometry_test_algorithms_set_operations_intersection_intersection SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/intersection/intersection.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_set_operations_intersection_intersection PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
bcm_test(NAME geometry_test_algorithms_set_operations_intersection_intersection_linear_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/intersection/intersection_linear_linear.cpp )
target_compile_definitions(geometry_test_algorithms_set_operations_intersection_intersection_linear_linear PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
bcm_test(NAME geometry_test_algorithms_set_operations_intersection_intersection_pl_pl SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/intersection/intersection_pl_pl.cpp )
bcm_test(NAME geometry_test_algorithms_set_operations_intersection_multi_intersection SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/intersection/multi_intersection.cpp  NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_set_operations_intersection_multi_intersection PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
#algorithms set_operations sym_difference
bcm_test(NAME geometry_test_algorithms_set_operations_sym_difference_sym_difference_linear_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/sym_difference/sym_difference_linear_linear.cpp )
#algorithms set_operations union
bcm_test(NAME geometry_test_algorithms_set_union_multi_union SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/union/multi_union.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_set_union_multi_union PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
bcm_test(NAME geometry_test_algorithms_set_union_union SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/union/union.cpp NEED_PATCH)
target_compile_definitions(geometry_test_algorithms_set_union_union PRIVATE -DBOOST_GEOMETRY_TEST_ONLY_ONE_TYPE)
bcm_test(NAME geometry_test_algorithms_set_union_union_linear_linear SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/union/union_linear_linear.cpp )
bcm_test(NAME geometry_test_algorithms_set_union_union_pl_pl SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/union/union_pl_pl.cpp )
#iterators
bcm_test(NAME geometry_test_iterators_closing_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterators/closing_iterator.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_iterators_concatenate_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterators/concatenate_iterator.cpp )
bcm_test(NAME geometry_test_iterators_ever_circling_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterators/ever_circling_iterator.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_iterators_flatten_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterators/flatten_iterator.cpp )
bcm_test(NAME geometry_test_iterators_point_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterators/point_iterator.cpp )
bcm_test(NAME geometry_test_iterators_segment_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterators/segment_iterator.cpp )
#strategies
bcm_test(NAME geometry_test_strategies_andoyer SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/andoyer.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_cross_track SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/cross_track.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_crossings_multiply SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/crossings_multiply.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_distance_default_result SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/distance_default_result.cpp )
bcm_test(NAME geometry_test_strategies_douglas_peucker SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/douglas_peucker.cpp )
bcm_test(NAME geometry_test_strategies_franklin SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/franklin.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_haversine SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/haversine.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_point_in_box SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/point_in_box.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_projected_point SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/projected_point.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_projected_point_ax SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/projected_point_ax.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_pythagoras SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/pythagoras.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_pythagoras_point_box SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/pythagoras_point_box.cpp )
bcm_test(NAME geometry_test_strategies_spherical_side SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/spherical_side.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_segment_intersection_collinear SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/segment_intersection_collinear.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_side_of_intersection SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/side_of_intersection.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_transform_cs SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/transform_cs.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_transformer SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/transformer.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_vincenty SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/vincenty.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_strategies_winding SOURCES ${CMAKE_WORKSPACE_SOURCE}/strategies/winding.cpp  NEED_PATCH)
#policies
bcm_test(NAME geometry_test_policies_compare SOURCES ${CMAKE_WORKSPACE_SOURCE}/policies/compare.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_policies_rescale_policy SOURCES ${CMAKE_WORKSPACE_SOURCE}/policies/rescale_policy.cpp  NEED_PATCH)
#io
#io wkt
bcm_test(NAME geometry_test_io_wkt_multi_wkt SOURCES ${CMAKE_WORKSPACE_SOURCE}/io/wkt/multi_wkt.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_io_wkt_wkt SOURCES ${CMAKE_WORKSPACE_SOURCE}/io/wkt/wkt.cpp  NEED_PATCH)
#io dsv
bcm_test(NAME geometry_test_io_dsv SOURCES ${CMAKE_WORKSPACE_SOURCE}/io/dsv/multi_dsv.cpp  NEED_PATCH)
#util
bcm_test(NAME geometry_test_util_calculation_type SOURCES ${CMAKE_WORKSPACE_SOURCE}/util/calculation_type.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_util_for_each_coordinate SOURCES ${CMAKE_WORKSPACE_SOURCE}/util/for_each_coordinate.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_util_math_sqrt SOURCES ${CMAKE_WORKSPACE_SOURCE}/util/math_sqrt.cpp )
bcm_test(NAME geometry_test_util_promote_integral SOURCES ${CMAKE_WORKSPACE_SOURCE}/util/promote_integral.cpp )
bcm_test(NAME geometry_test_util_range SOURCES ${CMAKE_WORKSPACE_SOURCE}/util/range.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_util_rational SOURCES ${CMAKE_WORKSPACE_SOURCE}/util/rational.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_util_select_most_precise SOURCES ${CMAKE_WORKSPACE_SOURCE}/util/select_most_precise.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_util_write_dsv SOURCES ${CMAKE_WORKSPACE_SOURCE}/util/write_dsv.cpp  NEED_PATCH)
#views
bcm_test(NAME geometry_test_views_segment_view SOURCES ${CMAKE_WORKSPACE_SOURCE}/views/segment_view.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_views_box_view SOURCES ${CMAKE_WORKSPACE_SOURCE}/views/box_view.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_views_reversible_view SOURCES ${CMAKE_WORKSPACE_SOURCE}/views/reversible_view.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_views_closeable_view SOURCES ${CMAKE_WORKSPACE_SOURCE}/views/closeable_view.cpp  NEED_PATCH)
bcm_test(NAME geometry_test_views_reversible_closeable SOURCES ${CMAKE_WORKSPACE_SOURCE}/views/reversible_closeable.cpp NEED_PATCH)


include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/buffer)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/detail)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/detail/sections)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/distance)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/overlay)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms)

include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/disjoint)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/relate)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations/within)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/relational_operations)

include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/difference)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/intersection)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/sym_difference)
include_directories(${CMAKE_WORKSPACE_SOURCE}/algorithms/set_operations/union)

include_directories(${CMAKE_WORKSPACE_SOURCE}/arithmetic)

include_directories(${CMAKE_WORKSPACE_SOURCE}/concepts)

include_directories(${CMAKE_WORKSPACE_SOURCE}/core)

include_directories(${CMAKE_WORKSPACE_SOURCE}/geometries)

include_directories(${CMAKE_WORKSPACE_SOURCE}/io)

include_directories(${CMAKE_WORKSPACE_SOURCE}/iterators)

include_directories(${CMAKE_WORKSPACE_SOURCE}/point_concept)

include_directories(${CMAKE_WORKSPACE_SOURCE}/policies)

include_directories(${CMAKE_WORKSPACE_SOURCE}/robustness)

include_directories(${CMAKE_WORKSPACE_SOURCE}/strategies)

include_directories(${CMAKE_WORKSPACE_SOURCE}/test_common)

include_directories(${CMAKE_WORKSPACE_SOURCE}/test_geometries)

include_directories(${CMAKE_WORKSPACE_SOURCE}/util)

include_directories(${CMAKE_WORKSPACE_SOURCE}/views)

include_directories(${CMAKE_WORKSPACE_SOURCE})