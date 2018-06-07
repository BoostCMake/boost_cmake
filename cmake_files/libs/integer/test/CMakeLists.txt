include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_type_traits)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_integer
                        boost::core
                        boost::mpl
                        boost::detail
                        boost::type_traits
                        boost::utility
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME integer_test_integer_traits_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/integer_traits_test.cpp)
bcm_test(NAME integer_test_integer_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/integer_test.cpp)
if (VERSION GREATER 1.60)
    bcm_test(NAME integer_test_integer_mask_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/integer_mask_test.cpp)
endif()
bcm_test(NAME integer_test_static_log2_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/static_log2_test.cpp)
bcm_test(NAME integer_test_static_min_max_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/static_min_max_test.cpp)
bcm_test(NAME integer_test_integer_traits_include_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/integer_traits_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_test_integer_include_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/integer_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_test_integer_mask_include_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/integer_mask_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_test_static_log2_include_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/static_log2_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_test_static_min_max_include_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/static_min_max_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_test_integer_fwd_include_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/integer_fwd_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_test_fail_int_exact SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_int_exact.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME integer_test_fail_int_fast SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_int_fast.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME integer_test_fail_int_least SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_int_least.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME integer_test_fail_uint_exact SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_uint_exact.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME integer_test_fail_uint_fast SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_uint_fast.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME integer_test_fail_uint_least SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_uint_least.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME integer_test_fail_uint_65 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_uint_65.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME integer_test_common_factor_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/common_factor_test.cpp)