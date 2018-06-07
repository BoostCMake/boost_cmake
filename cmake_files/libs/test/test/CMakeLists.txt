include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_align)

bcm_test_link_libraries(boost::test
        boost::multiprecision
        boost::thread
        boost::lexical_cast
        boost::unit_test_framework
        boost::thread
        boost::align
        )


bcm_test(NAME test_test_class_properties_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/class_properties_test.cpp)
bcm_test(NAME test_test_basic_cstring_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/basic_cstring_test.cpp NEED_PATCH)

bcm_test(NAME test_test_prg_exec_fail1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/prg_exec_fail1.cpp WILL_FAIL)

if(NOT BUILD_SHARED_LIBS)
    bcm_test(NAME test_test_prg_exec_fail2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/prg_exec_fail2.cpp WILL_FAIL)
    bcm_test(NAME test_test_prg_exec_fail3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/prg_exec_fail3.cpp WILL_FAIL)
    bcm_test(NAME test_test_prg_exec_fail4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/prg_exec_fail4.cpp WILL_FAIL)
endif()

bcm_test(NAME test_test_errors_handling_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/errors_handling_test.cpp)
bcm_test(NAME test_test_online_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/online_test.cpp)
bcm_test(NAME test_test_minimal_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/minimal_test.cpp WILL_FAIL)
bcm_test(NAME test_test_foreach_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/foreach_test.cpp)
bcm_test(NAME test_test_output_test_stream_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/output_test_stream_test.cpp)
bcm_test(NAME test_test_result_report_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/result_report_test.cpp)
bcm_test(NAME test_test_parameterized_test_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/parameterized_test_test.cpp)
bcm_test(NAME test_test_test_fp_comparisons SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_fp_comparisons.cpp)
bcm_test(NAME test_test_test_tools_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_tools_test.cpp)
bcm_test(NAME test_test_test_case_template_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_case_template_test.cpp)
bcm_test(NAME test_test_custom_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/custom_exception_test.cpp NEED_PATCH)
bcm_test(NAME test_test_fixed_mapping_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/fixed_mapping_test.cpp)
bcm_test(NAME test_test_ifstream_line_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/ifstream_line_iterator_test.cpp)
bcm_test(NAME test_test_algorithms_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithms_test.cpp NEED_PATCH)
bcm_test(NAME test_test_token_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/token_iterator_test.cpp)
bcm_test(NAME test_test_boost_check_equal_str SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_check_equal_str.cpp)
bcm_test(NAME test_test_test_tree_management_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_tree_management_test.cpp)

bcm_test(NAME test_test_sync_access_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/sync_access_test.cpp)
target_compile_definitions(test_test_sync_access_test PRIVATE -DBOOST_TEST_NO_AUTO_LINK=1)