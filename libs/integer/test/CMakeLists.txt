include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_integer
                       ${CMAKE_WORKSPACE_NAME}::core
                       ${CMAKE_WORKSPACE_NAME}::mpl
                       ${CMAKE_WORKSPACE_NAME}::detail
                       ${CMAKE_WORKSPACE_NAME}::type_traits
                       ${CMAKE_WORKSPACE_NAME}::utility
                       )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


cm_test(NAME integer_test_integer_traits_test SOURCES integer_traits_test.cpp)
cm_test(NAME integer_test_integer_test SOURCES integer_test.cpp)
if(VERSION GREATER 1.60)
    cm_test(NAME integer_test_integer_mask_test SOURCES integer_mask_test.cpp)
endif()
cm_test(NAME integer_test_static_log2_test SOURCES static_log2_test.cpp)
cm_test(NAME integer_test_static_min_max_test SOURCES static_min_max_test.cpp)
cm_test(NAME integer_test_integer_traits_include_test SOURCES integer_traits_include_test.cpp COMPILE_ONLY)
cm_test(NAME integer_test_integer_include_test SOURCES integer_include_test.cpp COMPILE_ONLY)
cm_test(NAME integer_test_integer_mask_include_test SOURCES integer_mask_include_test.cpp COMPILE_ONLY)
cm_test(NAME integer_test_static_log2_include_test SOURCES static_log2_include_test.cpp COMPILE_ONLY)
cm_test(NAME integer_test_static_min_max_include_test SOURCES static_min_max_include_test.cpp COMPILE_ONLY)
cm_test(NAME integer_test_integer_fwd_include_test SOURCES integer_fwd_include_test.cpp COMPILE_ONLY)
cm_test(NAME integer_test_fail_int_exact SOURCES fail_int_exact.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME integer_test_fail_int_fast SOURCES fail_int_fast.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME integer_test_fail_int_least SOURCES fail_int_least.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME integer_test_fail_uint_exact SOURCES fail_uint_exact.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME integer_test_fail_uint_fast SOURCES fail_uint_fast.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME integer_test_fail_uint_least SOURCES fail_uint_least.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME integer_test_fail_uint_65 SOURCES fail_uint_65.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME integer_test_common_factor_test SOURCES common_factor_test.cpp)