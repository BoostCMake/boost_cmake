include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_multiprecision)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_align)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}::test
        ${CMAKE_WORKSPACE_NAME}::multiprecision
        ${CMAKE_WORKSPACE_NAME}::thread
        ${CMAKE_WORKSPACE_NAME}::lexical_cast
        ${CMAKE_WORKSPACE_NAME}::thread
        ${CMAKE_WORKSPACE_NAME}::align
        )


#test-suite "utils-ts"
cm_test(NAME test_test_utils-ts_algorithm-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/utils-ts/algorithm-test.cpp)
cm_test(NAME test_test_utils-ts_basic_cstring-test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/utils-ts/basic_cstring-test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/utils-ts)
cm_test(NAME test_test_utils-ts_class_properties-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/utils-ts/class_properties-test.cpp)
cm_test(NAME test_test_utils-ts_foreach-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/utils-ts/foreach-test.cpp)
cm_test(NAME test_test_utils-ts_named_params-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/utils-ts/named_params-test.cpp)

if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    cm_test(NAME test_test_utils-ts_runtime-param-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/utils-ts/runtime-param-test.cpp)
endif()
cm_test(NAME test_test_utils-ts_string_cast-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/utils-ts/string_cast-test.cpp)
cm_test(NAME test_test_utils-ts_token_iterator-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/utils-ts/token_iterator-test.cpp)

#test-suite "usage-variants-ts"
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    cm_test(NAME test_test_usage-variants-ts_single-header-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/usage-variants-ts/single-header-test.cpp)
    cm_test(NAME test_test_usage-variants-ts_single-header-custom-init-test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/usage-variants-ts/single-header-custom-init-test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/usage-variants-ts)
    cm_test(NAME test_test_usage-variants-ts_single-header-custom-main-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/usage-variants-ts/single-header-custom-main-test.cpp)
endif()

if(NOT BUILD_SHARED_LIBS)
    cm_test(NAME test_test_usage-variants-ts_static-library-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/usage-variants-ts/static-library-test.cpp)
    cm_test(NAME test_test_usage-variants-ts_static-library-custom-init-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/usage-variants-ts/static-library-custom-init-test.cpp)
else()
    cm_test(NAME test_test_usage-variants-ts_shared-library-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/usage-variants-ts/shared-library-test.cpp)
    cm_test(NAME test_test_usage-variants-ts_shared-library-custom-init-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/usage-variants-ts/shared-library-custom-init-test.cpp)
    cm_test(NAME test_test_usage-variants-ts_shared-library-custom-main-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/usage-variants-ts/shared-library-custom-main-test.cpp)
endif()

#test-suite "framework-ts"
cm_test(NAME test_test_framework-ts_result-report-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/framework-ts/result-report-test.cpp ARGS ${CURRENT_TEST_SOURCES_DIR}/baseline-outputs/result-report-test.pattern)
cm_test(NAME test_test_framework-ts_run-by-name-or-label-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/framework-ts/run-by-name-or-label-test.cpp)


#test-suite "writing-test-ts"
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    cm_test(NAME test_test_writing-test-ts_assertion-construction-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/assertion-construction-test.cpp)
endif()

cm_test(NAME test_test_writing-test-ts_boost_check_equal-str-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/boost_check_equal-str-test.cpp)

if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    cm_test(NAME test_test_writing-test-ts_collection-comparison-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/collection-comparison-test.cpp)
    cm_test(NAME test_test_writing-test-ts_dont_print_log_value-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/dont_print_log_value-test.cpp)
    cm_test(NAME test_test_writing-test-ts_fp-comparisons-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/fp-comparisons-test.cpp)
    cm_test(NAME test_test_writing-test-ts_fp-multiprecision-comparison-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/fp-multiprecision-comparison-test.cpp)
    cm_test(NAME test_test_writing-test-ts_output_test_stream-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/output_test_stream-test.cpp)
    cm_test(NAME test_test_writing-test-ts_test_tools-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/test_tools-test.cpp ARGS ${CURRENT_TEST_SOURCES_DIR}/baseline-outputs/test_tools-test.pattern)
    cm_test(NAME test_test_writing-test-ts_windows-headers-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/windows-headers-test.cpp)
    cm_test(NAME test_test_writing-test-ts_tools-under-debugger-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/tools-under-debugger-test.cpp)
    cm_test(NAME test_test_writing-test-ts_tools-debuggable-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/writing-test-ts/tools-debuggable-test.cpp)
endif()

#test-suite "test-organization-ts"
cm_test(NAME test_test_test-organization-ts_parameterized_test-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/test-organization-ts/parameterized_test-test.cpp)
cm_test(NAME test_test_test-organization-ts_test_case_template-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/test-organization-ts/test_case_template-test.cpp)

if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    file(GLOB TEST_FILES ${CURRENT_TEST_SOURCES_DIR}/test-organization-ts/datasets-test/*.cpp)
    cm_test(NAME test_test_test-organization-ts_datasets-test SOURCES ${TEST_FILES})
endif()

#if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    cm_test(NAME test_test_test-organization-ts_test_unit-order-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/test-organization-ts/test_unit-order-test.cpp)
#endif()
    
cm_test(NAME test_test_test-organization-ts_test-tree-management-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/test-organization-ts/test-tree-management-test.cpp)

#test-suite "multithreading-ts"
cm_test(NAME test_test_multithreading-ts_sync-access-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/multithreading-ts/sync-access-test.cpp)

#test-suite "prg_exec_monitor-ts"
cm_test(NAME test_test_prg_exec_monitor-ts_result-code-test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/prg_exec_monitor-ts/result-code-test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/prg_exec_monitor-ts)
cm_test(NAME test_test_prg_exec_monitor-ts_system-exception-test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/prg_exec_monitor-ts/system-exception-test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/prg_exec_monitor-ts)
cm_test(NAME test_test_prg_exec_monitor-ts_uncatched-exception-test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/prg_exec_monitor-ts/uncatched-exception-test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/prg_exec_monitor-ts)
cm_test(NAME test_test_prg_exec_monitor-ts_user-fatal-exception-test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/prg_exec_monitor-ts/user-fatal-exception-test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/prg_exec_monitor-ts)

#test-suite "execution_monitor-ts"
cm_test(NAME test_test_execution_monitor-ts_errors-handling-test SOURCES ${CURRENT_TEST_SOURCES_DIR}/execution_monitor-ts/errors-handling-test.cpp ARGS  ${CURRENT_TEST_SOURCES_DIR}/baseline-outputs/errors-handling-test.pattern
        ${CURRENT_TEST_SOURCES_DIR}/baseline-outputs/errors-handling-test.pattern2)

cm_test(NAME test_test_execution_monitor-ts_custom-exception-test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/execution_monitor-ts/custom-exception-test.cpp)
