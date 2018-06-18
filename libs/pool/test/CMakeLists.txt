include(BCMTest)

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

if(NOT APPLE AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    cm_test(NAME pool_test___example_time_pool_alloc SOURCES ../example/time_pool_alloc.cpp)
endif()

cm_test(NAME pool_test_test_poisoned_macros SOURCES test_poisoned_macros.cpp COMPILE_ONLY)

find_program(VALGRIND_PATH valgrind)
if(VALGRIND_PATH)
    cm_test(NAME pool_test_test_simple_seg_storage SOURCES test_simple_seg_storage.cpp)
    cm_test(NAME pool_test_test_pool_alloc SOURCES test_pool_alloc.cpp)
    cm_test(NAME pool_test_pool_msvc_compiler_bug_test SOURCES pool_msvc_compiler_bug_test.cpp)
    cm_test(NAME pool_test_test_msvc_mem_leak_detect SOURCES test_msvc_mem_leak_detect.cpp)
    cm_test(NAME pool_test_test_bug_3349 SOURCES test_bug_3349.cpp)#
    cm_test(NAME pool_test_test_bug_4960 SOURCES test_bug_4960.cpp)#
    cm_test(NAME pool_test_test_bug_1252 SOURCES test_bug_1252.cpp)#
    cm_test(NAME pool_test_test_bug_2696 SOURCES test_bug_2696.cpp)#
    cm_test(NAME pool_test_test_bug_5526 SOURCES test_bug_5526.cpp)#
    cm_test(NAME pool_test_test_threading SOURCES test_threading.cpp) #

    cm_test(NAME pool_test_valgrind_config_check SOURCES valgrind_config_check.cpp)
    cm_test(NAME pool_test_test_simple_seg_storage_valgrind_2 SOURCES test_simple_seg_storage.cpp)
    target_compile_definitions(pool_test_test_simple_seg_storage_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_pool_alloc_valgrind_2 SOURCES test_pool_alloc.cpp)
    target_compile_definitions(pool_test_test_pool_alloc_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_pool_msvc_compiler_bug_test_valgrind_2 SOURCES pool_msvc_compiler_bug_test.cpp)
    target_compile_definitions(pool_test_pool_msvc_compiler_bug_test_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_msvc_mem_leak_detect_valgrind_2 SOURCES test_msvc_mem_leak_detect.cpp)
    target_compile_definitions(pool_test_test_msvc_mem_leak_detect_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_3349_valgrind_2 SOURCES test_bug_3349.cpp)
    target_compile_definitions(pool_test_test_bug_3349_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_4960_valgrind_2 SOURCES test_bug_4960.cpp)
    target_compile_definitions(pool_test_test_bug_4960_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_1252_valgrind_2 SOURCES test_bug_1252.cpp)
    target_compile_definitions(pool_test_test_bug_1252_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_2696_valgrind_2 SOURCES test_bug_2696.cpp)
    target_compile_definitions(pool_test_test_bug_2696_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_bug_5526_valgrind_2 SOURCES test_bug_5526.cpp)
    target_compile_definitions(pool_test_test_bug_5526_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_threading_valgrind_2 SOURCES test_threading.cpp)
    target_compile_definitions(pool_test_test_threading_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_valgrind_fail_1 SOURCES test_valgrind_fail_1.cpp WILL_FAIL)
    target_compile_definitions(pool_test_test_valgrind_fail_1 PUBLIC BOOST_POOL_VALGRIND=1)
    cm_test(NAME pool_test_test_valgrind_fail_2 SOURCES test_valgrind_fail_2.cpp WILL_FAIL)
    target_compile_definitions(pool_test_test_valgrind_fail_2 PUBLIC BOOST_POOL_VALGRIND=1)
endif()

