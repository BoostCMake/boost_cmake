include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_serialization)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_index
                        boost::serialization)

bcm_test(NAME multi_index_test_test_basic SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_basic.cpp ${CMAKE_WORKSPACE_SOURCE}/test_basic_main.cpp)
bcm_test(NAME multi_index_test_test_capacity SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_capacity.cpp ${CMAKE_WORKSPACE_SOURCE}/test_capacity_main.cpp)
bcm_test(NAME multi_index_test_test_comparison SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_comparison.cpp ${CMAKE_WORKSPACE_SOURCE}/test_comparison_main.cpp)
bcm_test(NAME multi_index_test_test_composite_key SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_composite_key.cpp ${CMAKE_WORKSPACE_SOURCE}/test_composite_key_main.cpp)
bcm_test(NAME multi_index_test_test_conv_iterators SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_conv_iterators.cpp ${CMAKE_WORKSPACE_SOURCE}/test_conv_iterators_main.cpp)
bcm_test(NAME multi_index_test_test_copy_assignment SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_copy_assignment.cpp ${CMAKE_WORKSPACE_SOURCE}/test_copy_assignment_main.cpp)
bcm_test(NAME multi_index_test_test_hash_ops SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_hash_ops.cpp ${CMAKE_WORKSPACE_SOURCE}/test_hash_ops_main.cpp)
bcm_test(NAME multi_index_test_test_iterators SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_iterators.cpp ${CMAKE_WORKSPACE_SOURCE}/test_iterators_main.cpp)
bcm_test(NAME multi_index_test_test_key_extractors SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_key_extractors.cpp ${CMAKE_WORKSPACE_SOURCE}/test_key_extractors_main.cpp)
bcm_test(NAME multi_index_test_test_list_ops SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_list_ops.cpp ${CMAKE_WORKSPACE_SOURCE}/test_list_ops_main.cpp)
bcm_test(NAME multi_index_test_test_modifiers SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_modifiers.cpp ${CMAKE_WORKSPACE_SOURCE}/test_modifiers_main.cpp)
bcm_test(NAME multi_index_test_test_mpl_ops SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_mpl_ops.cpp ${CMAKE_WORKSPACE_SOURCE}/test_mpl_ops_main.cpp)
bcm_test(NAME multi_index_test_test_observers SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_observers.cpp ${CMAKE_WORKSPACE_SOURCE}/test_observers_main.cpp)
bcm_test(NAME multi_index_test_test_projection SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_projection.cpp ${CMAKE_WORKSPACE_SOURCE}/test_projection_main.cpp)
bcm_test(NAME multi_index_test_test_range SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_range.cpp ${CMAKE_WORKSPACE_SOURCE}/test_range_main.cpp)
bcm_test(NAME multi_index_test_test_rearrange SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_rearrange.cpp ${CMAKE_WORKSPACE_SOURCE}/test_rearrange_main.cpp)
bcm_test(NAME multi_index_test_test_safe_mode SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_safe_mode.cpp ${CMAKE_WORKSPACE_SOURCE}/test_safe_mode_main.cpp)
bcm_test(NAME multi_index_test_test_serialization SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_serialization.cpp ${CMAKE_WORKSPACE_SOURCE}/test_serialization1.cpp
        ${CMAKE_WORKSPACE_SOURCE}/test_serialization2.cpp ${CMAKE_WORKSPACE_SOURCE}/test_serialization3.cpp ${CMAKE_WORKSPACE_SOURCE}/test_serialization_main.cpp)
bcm_test(NAME multi_index_test_test_set_ops SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_set_ops.cpp ${CMAKE_WORKSPACE_SOURCE}/test_set_ops_main.cpp)
bcm_test(NAME multi_index_test_test_special_set_ops SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_special_set_ops.cpp ${CMAKE_WORKSPACE_SOURCE}/test_special_set_ops_main.cpp)

if(WIN32)
    bcm_test(NAME multi_index_test_test_update SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_update.cpp ${CMAKE_WORKSPACE_SOURCE}/test_update_main.cpp)
endif()