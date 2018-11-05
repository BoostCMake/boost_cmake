include(CMTest)

#find_package(${CMAKE_WORKSPACE_NAME}_random)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_dll
                        #${CMAKE_WORKSPACE_NAME}::random
                        )

# Boost Endian Library test Jamfile

# Copyright Beman Dawes 2006, 2013

# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

# See library home page at http://www.boost.org/libs/endian

add_library(dll_test_test_library SHARED ${CURRENT_TEST_SOURCES_DIR}/test_library.cpp)
target_link_libraries(dll_test_test_library ${CMAKE_WORKSPACE_NAME}_dll)

add_library(dll_test_getting_started_library SHARED ${CURRENT_TEST_SOURCES_DIR}/../example/getting_started_library.cpp)
target_link_libraries(dll_test_getting_started_library ${CMAKE_WORKSPACE_NAME}_dll)

add_library(dll_test_my_plugin_sum SHARED ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial1/my_plugin_sum.cpp)
target_link_libraries(dll_test_my_plugin_sum ${CMAKE_WORKSPACE_NAME}_dll)

add_library(dll_test_my_plugin_aggregator SHARED ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial2/my_plugin_aggregator.cpp)
target_link_libraries(dll_test_my_plugin_aggregator ${CMAKE_WORKSPACE_NAME}_dll)

add_library(dll_test_on_unload_lib SHARED ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial6/on_unload_lib.cpp)
target_link_libraries(dll_test_test_library ${CMAKE_WORKSPACE_NAME}_dll)

add_library(dll_test_library1 SHARED ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial7/library1.cpp)
target_link_libraries(dll_test_library1 ${CMAKE_WORKSPACE_NAME}_dll)

add_library(dll_test_library2 SHARED ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial7/library2.cpp)
target_link_libraries(dll_test_library2 ${CMAKE_WORKSPACE_NAME}_dll)

add_library(dll_test_refcounting_plugin SHARED ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial8/refcounting_plugin.cpp)
target_link_libraries(dll_test_refcounting_plugin ${CMAKE_WORKSPACE_NAME}_dll)
target_compile_definitions(dll_test_refcounting_plugin PRIVATE -DBOOST_DLL_FORCE_ALIAS_INSTANTIATION)

add_library(dll_test_cpp_plugin SHARED ${CURRENT_TEST_SOURCES_DIR}/cpp_test_library.cpp)
target_link_libraries(dll_test_cpp_plugin ${CMAKE_WORKSPACE_NAME}_dll)

#test-suite boostdll
cm_test(NAME dll_test_shared_library_load_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/shared_library_load_test.cpp)
target_link_libraries(dll_test_shared_library_load_test dll_test_library1 dll_test_test_library)
cm_test(NAME dll_test_shared_library_search_symbol_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/shared_library_search_symbol_test.cpp)
target_link_libraries(dll_test_shared_library_search_symbol_test dll_test_test_library)
cm_test(NAME dll_test_shared_library_get_symbol_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/shared_library_get_symbol_test.cpp)
target_link_libraries(dll_test_shared_library_load_test dll_test_test_library)

if(WIN32)
    cm_test(NAME dll_test_shared_library_get_symbol_test_win SOURCES ${CURRENT_TEST_SOURCES_DIR}/shared_library_get_symbol_test.cpp)
endif()

cm_test(NAME dll_test_symbol_runtime_info_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/symbol_runtime_info_test.cpp)
target_link_libraries(dll_test_symbol_runtime_info_test dll_test_test_library)

cm_test(NAME dll_test_shared_library_errors SOURCES ${CURRENT_TEST_SOURCES_DIR}/shared_library_errors.cpp)
target_link_libraries(dll_test_shared_library_errors dll_test_test_library)

cm_test(NAME dll_test_structures_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/structures_tests.cpp)

cm_test(NAME dll_test_library_info_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/library_info_test.cpp ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial4/static_plugin.cpp)
target_link_libraries(dll_test_library_info_test dll_test_test_library)

cm_test(NAME dll_test___example_getting_started SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/getting_started.cpp)
target_link_libraries(dll_test___example_getting_started dll_test_getting_started_library)

cm_test(NAME dll_test___example_tutorial1_tutorial1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial1/tutorial1.cpp)
target_link_libraries(dll_test___example_tutorial1_tutorial1 dll_test_my_plugin_sum)

cm_test(NAME dll_test___example_tutorial2_tutorial2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial2/tutorial2.cpp)
target_link_libraries(dll_test___example_tutorial2_tutorial2 dll_test_my_plugin_aggregator)

cm_test(NAME dll_test___example_tutorial3_tutorial3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial3/tutorial3.cpp)
target_link_libraries(dll_test___example_tutorial3_tutorial3 dll_test_my_plugin_sum dll_test_my_plugin_aggregator)

cm_test(NAME dll_test___example_tutorial4_tutorial4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial4/load_self.cpp ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial4/static_plugin.cpp)

cm_test(NAME dll_test___example_tutorial5_tutorial5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial5/load_all.cpp ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial4/static_plugin.cpp)
target_link_libraries(dll_test___example_tutorial5_tutorial5 dll_test_getting_started_library dll_test_my_plugin_sum dll_test_my_plugin_aggregator)

cm_test(NAME dll_test___example_tutorial6_tutorial6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial6/tutorial6.cpp)
target_link_libraries(dll_test___example_tutorial6_tutorial6 dll_test_on_unload_lib)

cm_test(NAME dll_test___example_tutorial7_tutorial7 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial7/tutorial7.cpp)
target_link_libraries(dll_test___example_tutorial7_tutorial7 dll_test_test_library1 dll_test_test_library2)

cm_test(NAME dll_test___example_tutorial8_tutorial8 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial8/tutorial8.cpp)
target_link_libraries(dll_test___example_tutorial8_tutorial8 dll_test_refcounting_plugin)

cm_test(NAME dll_test___example_tutorial8_tutorial8_static SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial8/tutorial8_static.cpp)

cm_test(NAME dll_test___example_tutorial9_tutorial9 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/tutorial9/tutorial9.cpp)

# test for shared libraries
cm_test(NAME dll_test_section_name_too_big SOURCES ${CURRENT_TEST_SOURCES_DIR}/section_name_too_big.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME dll_test_shared_library_concurrent_load_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/shared_library_concurrent_load_test.cpp)
target_link_libraries(dll_test_shared_library_concurrent_load_test dll_test_test_library1 dll_test_test_library2 dll_test_my_plugin_aggregator dll_test_refcounting_plugin)

if(MSVC)
    cm_test(NAME dll_test_cpp_mangle_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/cpp_mangle_test.cpp)
    target_link_libraries(dll_test_cpp_mangle_test dll_test_cpp_plugin)

    cm_test(NAME dll_test_cpp_load_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/cpp_load_test.cpp)
    target_link_libraries(dll_test_cpp_load_test dll_test_cpp_plugin)
endif()
