include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_any)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda
                        boost::function
                        boost::smart_ptr
                        boost::test
                        boost::any
                        )

# Lambda library

# Copyright (C) 2001-2003 Jaakko Jarvi

# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/


bcm_test(NAME lambda_test_algorithm_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm_test.cpp)
bcm_test(NAME lambda_test_bind_tests_simple SOURCES ${CMAKE_WORKSPACE_SOURCE}/bind_tests_simple.cpp)
bcm_test(NAME lambda_test_bind_tests_advanced SOURCES ${CMAKE_WORKSPACE_SOURCE}/bind_tests_advanced.cpp)
bcm_test(NAME lambda_test_bind_tests_simple_f_refs SOURCES ${CMAKE_WORKSPACE_SOURCE}/bind_tests_simple_f_refs.cpp)

if(NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    bcm_test(NAME lambda_test_bll_and_function SOURCES ${CMAKE_WORKSPACE_SOURCE}/bll_and_function.cpp)
endif()

bcm_test(NAME lambda_test_lambda_cast_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/cast_test.cpp)
bcm_test(NAME lambda_test_constructor_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/constructor_tests.cpp)
bcm_test(NAME lambda_test_control_structures SOURCES ${CMAKE_WORKSPACE_SOURCE}/control_structures.cpp)
bcm_test(NAME lambda_test_exception_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception_test.cpp)
bcm_test(NAME lambda_test_extending_rt_traits SOURCES ${CMAKE_WORKSPACE_SOURCE}/extending_rt_traits.cpp)
bcm_test(NAME lambda_test_is_instance_of_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_instance_of_test.cpp)
bcm_test(NAME lambda_test_member_pointer_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/member_pointer_test.cpp)
bcm_test(NAME lambda_test_operator_tests_simple SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator_tests_simple.cpp)
bcm_test(NAME lambda_test_phoenix_control_structures SOURCES ${CMAKE_WORKSPACE_SOURCE}/phoenix_control_structures.cpp)
bcm_test(NAME lambda_test_switch_construct SOURCES ${CMAKE_WORKSPACE_SOURCE}/switch_construct.cpp)
bcm_test(NAME lambda_test_result_of_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/result_of_tests.cpp)
bcm_test(NAME lambda_test_ret_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/ret_test.cpp)

