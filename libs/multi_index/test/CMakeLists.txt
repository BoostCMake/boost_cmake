include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_serialization)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_index
                        ${CMAKE_WORKSPACE_NAME}::serialization)

#test-suite "multi_index"
cm_test(NAME multi_index_test_test_basic SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_basic.cpp ${CURRENT_TEST_SOURCES_DIR}/test_basic_main.cpp)
cm_test(NAME multi_index_test_test_capacity SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_capacity.cpp ${CURRENT_TEST_SOURCES_DIR}/test_capacity_main.cpp)
cm_test(NAME multi_index_test_test_comparison SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_comparison.cpp ${CURRENT_TEST_SOURCES_DIR}/test_comparison_main.cpp)
cm_test(NAME multi_index_test_test_composite_key SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_composite_key.cpp ${CURRENT_TEST_SOURCES_DIR}/test_composite_key_main.cpp)
cm_test(NAME multi_index_test_test_conv_iterators SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_conv_iterators.cpp ${CURRENT_TEST_SOURCES_DIR}/test_conv_iterators_main.cpp)
cm_test(NAME multi_index_test_test_copy_assignment SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_copy_assignment.cpp ${CURRENT_TEST_SOURCES_DIR}/test_copy_assignment_main.cpp)
cm_test(NAME multi_index_test_test_hash_ops SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_hash_ops.cpp ${CURRENT_TEST_SOURCES_DIR}/test_hash_ops_main.cpp)
cm_test(NAME multi_index_test_test_iterators SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_iterators.cpp ${CURRENT_TEST_SOURCES_DIR}/test_iterators_main.cpp)
cm_test(NAME multi_index_test_test_key_extractors SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_key_extractors.cpp ${CURRENT_TEST_SOURCES_DIR}/test_key_extractors_main.cpp)
cm_test(NAME multi_index_test_test_list_ops SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_list_ops.cpp ${CURRENT_TEST_SOURCES_DIR}/test_list_ops_main.cpp)
cm_test(NAME multi_index_test_test_modifiers SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_modifiers.cpp ${CURRENT_TEST_SOURCES_DIR}/test_modifiers_main.cpp)
cm_test(NAME multi_index_test_test_mpl_ops SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_mpl_ops.cpp ${CURRENT_TEST_SOURCES_DIR}/test_mpl_ops_main.cpp)
cm_test(NAME multi_index_test_test_observers SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_observers.cpp ${CURRENT_TEST_SOURCES_DIR}/test_observers_main.cpp)
cm_test(NAME multi_index_test_test_projection SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_projection.cpp ${CURRENT_TEST_SOURCES_DIR}/test_projection_main.cpp)
cm_test(NAME multi_index_test_test_range SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_range.cpp ${CURRENT_TEST_SOURCES_DIR}/test_range_main.cpp)
cm_test(NAME multi_index_test_test_rearrange SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_rearrange.cpp ${CURRENT_TEST_SOURCES_DIR}/test_rearrange_main.cpp)
cm_test(NAME multi_index_test_test_safe_mode SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_safe_mode.cpp ${CURRENT_TEST_SOURCES_DIR}/test_safe_mode_main.cpp)
cm_test(NAME multi_index_test_test_serialization SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_serialization.cpp ${CURRENT_TEST_SOURCES_DIR}/test_serialization1.cpp
        ${CURRENT_TEST_SOURCES_DIR}/test_serialization2.cpp ${CURRENT_TEST_SOURCES_DIR}/test_serialization3.cpp ${CURRENT_TEST_SOURCES_DIR}/test_serialization_main.cpp)
cm_test(NAME multi_index_test_test_set_ops SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_set_ops.cpp ${CURRENT_TEST_SOURCES_DIR}/test_set_ops_main.cpp)
cm_test(NAME multi_index_test_test_special_set_ops SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_special_set_ops.cpp ${CURRENT_TEST_SOURCES_DIR}/test_special_set_ops_main.cpp)

if(WIN32)
    cm_test(NAME multi_index_test_test_update SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_update.cpp ${CURRENT_TEST_SOURCES_DIR}/test_update_main.cpp)
endif()
