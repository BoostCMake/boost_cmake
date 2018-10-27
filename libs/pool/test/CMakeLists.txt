include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_serialization)
find_package(${CMAKE_WORKSPACE_NAME}_thread)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_pool
                        ${CMAKE_WORKSPACE_NAME}::core
                        ${CMAKE_WORKSPACE_NAME}::random
                        ${CMAKE_WORKSPACE_NAME}::smart_ptr
                        ${CMAKE_WORKSPACE_NAME}::serialization
                        ${CMAKE_WORKSPACE_NAME}::thread
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

cm_test(NAME pool_test_test_simple_seg_storage SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_simple_seg_storage.cpp)
cm_test(NAME pool_test_test_pool_alloc SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_pool_alloc.cpp)
cm_test(NAME pool_test_pool_msvc_compiler_bug_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/pool_msvc_compiler_bug_test.cpp)
cm_test(NAME pool_test_test_msvc_mem_leak_detect SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_msvc_mem_leak_detect.cpp)
cm_test(NAME pool_test_test_bug_3349 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_3349.cpp)
cm_test(NAME pool_test_test_bug_4960 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_4960.cpp)
cm_test(NAME pool_test_test_bug_1252 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_1252.cpp)
cm_test(NAME pool_test_test_bug_2696 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_2696.cpp)
cm_test(NAME pool_test_test_bug_5526 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_5526.cpp)
cm_test(NAME pool_test_test_threading SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_threading.cpp)

if(NOT APPLE)
    cm_test(NAME pool_test___example_time_pool_alloc SOURCES ${CURRENT_TEST_SOURCES_DIR}/../example/time_pool_alloc.cpp)
endif()

cm_test(NAME pool_test_test_poisoned_macros SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_poisoned_macros.cpp COMPILE_ONLY)


try_compile(HAS_VALGRIND ${CURRENT_TEST_SOURCES_DIR} ${CURRENT_TEST_SOURCES_DIR}/valgrind_config_check.cpp CMAKE_FLAGS
        "-DCMAKE_CXX_LINK_EXECUTABLE='echo not linking now...'")
if(HAS_VALGRIND)
    cm_test(NAME pool_test_test_simple_seg_storage_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_simple_seg_storage.cpp)
    target_compile_definitions(pool_test_test_simple_seg_storage_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_pool_alloc SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_pool_alloc.cpp)
    target_compile_definitions(pool_test_test_pool_alloc PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_pool_msvc_compiler_bug_test_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/pool_msvc_compiler_bug_test.cpp)
    target_compile_definitions(pool_test_pool_msvc_compiler_bug_test_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_msvc_mem_leak_detect_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_msvc_mem_leak_detect.cpp)
    target_compile_definitions(pool_test_test_msvc_mem_leak_detect_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_3349_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_3349.cpp)
    target_compile_definitions(pool_test_test_bug_3349_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_4960_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_4960.cpp)
    target_compile_definitions(pool_test_test_bug_4960_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_1252_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_1252.cpp)
    target_compile_definitions(pool_test_test_bug_1252_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_2696_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_2696.cpp)
    target_compile_definitions(pool_test_test_bug_2696_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_5526_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_5526.cpp)
    target_compile_definitions(pool_test_test_bug_5526_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_threading_valgrind SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_threading.cpp)
    target_compile_definitions(pool_test_test_threading_valgrind PUBLIC -DBOOST_POOL_VALGRIND=1)

    cm_test(NAME pool_test_test_simple_seg_storage_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_simple_seg_storage.cpp)
    target_compile_definitions(pool_test_test_simple_seg_storage_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_pool_alloc_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_pool_alloc.cpp)
    target_compile_definitions(pool_test_test_pool_alloc_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_pool_msvc_compiler_bug_test_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/pool_msvc_compiler_bug_test.cpp)
    target_compile_definitions(pool_test_pool_msvc_compiler_bug_test_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_msvc_mem_leak_detect_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_msvc_mem_leak_detect.cpp)
    target_compile_definitions(pool_test_test_msvc_mem_leak_detect_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_3349_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_3349.cpp)
    target_compile_definitions(pool_test_test_bug_3349_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_4960_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_4960.cpp)
    target_compile_definitions(pool_test_test_bug_4960_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_1252_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_1252.cpp)
    target_compile_definitions(pool_test_test_bug_1252_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_2696_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_2696.cpp)
    target_compile_definitions(pool_test_test_bug_2696_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_5526_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_bug_5526.cpp)
    target_compile_definitions(pool_test_test_bug_5526_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_threading_valgrind_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_threading.cpp)
    target_compile_definitions(pool_test_test_threading_valgrind_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_valgrind_fail_1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_valgrind_fail_1.cpp WILL_FAIL)
    target_compile_definitions(pool_test_test_valgrind_fail_1 PUBLIC -DBOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_valgrind_fail_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_valgrind_fail_2.cpp WILL_FAIL)
    target_compile_definitions(pool_test_test_valgrind_fail_2 PUBLIC -DBOOST_POOL_VALGRIND=1)
endif()
