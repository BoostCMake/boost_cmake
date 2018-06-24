include(BCMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_align)

cm_test_link_libraries(boost::test
        boost::multiprecision
        boost::thread
        boost::lexical_cast
        boost::thread
        boost::align
        )


cm_test(NAME test_test_class_properties_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/class_properties_test.cpp)
cm_test(NAME test_test_basic_cstring_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/basic_cstring_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME test_test_prg_exec_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/prg_exec_fail1.cpp WILL_FAIL)

if(NOT BUILD_SHARED_LIBS)
    cm_test(NAME test_test_prg_exec_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/prg_exec_fail2.cpp WILL_FAIL)
    cm_test(NAME test_test_prg_exec_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/prg_exec_fail3.cpp WILL_FAIL)
    cm_test(NAME test_test_prg_exec_fail4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/prg_exec_fail4.cpp WILL_FAIL)
endif()

cm_test(NAME test_test_errors_handling_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/errors_handling_test.cpp)
cm_test(NAME test_test_online_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/online_test.cpp)
cm_test(NAME test_test_minimal_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/minimal_test.cpp WILL_FAIL)
cm_test(NAME test_test_foreach_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/foreach_test.cpp)
cm_test(NAME test_test_output_test_stream_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/output_test_stream_test.cpp)
cm_test(NAME test_test_result_report_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/result_report_test.cpp)
cm_test(NAME test_test_parameterized_test_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/parameterized_test_test.cpp)
cm_test(NAME test_test_test_fp_comparisons SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_fp_comparisons.cpp)
cm_test(NAME test_test_test_tools_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_tools_test.cpp)
cm_test(NAME test_test_test_case_template_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_case_template_test.cpp)
cm_test(NAME test_test_custom_exception_tmsest SOURCES ${CMAKE_CURRENT_BINARY_DIR}/custom_exception_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME test_test_fixed_mapping_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/fixed_mapping_test.cpp)
cm_test(NAME test_test_ifstream_line_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ifstream_line_iterator_test.cpp)
cm_test(NAME test_test_algorithms_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/algorithms_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME test_test_token_iterator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/token_iterator_test.cpp)
cm_test(NAME test_test_boost_check_equal_str SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_check_equal_str.cpp)
cm_test(NAME test_test_test_tree_management_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_tree_management_test.cpp)

cm_test(NAME test_test_sync_access_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/sync_access_test.cpp)
target_compile_definitions(test_test_sync_access_test PRIVATE -DBOOST_TEST_NO_AUTO_LINK=1)