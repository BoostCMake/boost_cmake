include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_any)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_lambda
                       ${CMAKE_WORKSPACE_NAME}::function
                       ${CMAKE_WORKSPACE_NAME}::smart_ptr
                       ${CMAKE_WORKSPACE_NAME}::test
                       ${CMAKE_WORKSPACE_NAME}::any
                       )

# Lambda library

# Copyright (C) 2001-2003 Jaakko Jarvi

# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/


cm_test(NAME lambda_test_algorithm_test SOURCES algorithm_test.cpp)
cm_test(NAME lambda_test_bind_tests_simple SOURCES bind_tests_simple.cpp)
cm_test(NAME lambda_test_bind_tests_advanced SOURCES bind_tests_advanced.cpp)
cm_test(NAME lambda_test_bind_tests_simple_f_refs SOURCES bind_tests_simple_f_refs.cpp)

if(NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    cm_test(NAME lambda_test_bll_and_function SOURCES bll_and_function.cpp)
endif()

cm_test(NAME lambda_test_lambda_cast_test SOURCES cast_test.cpp)
cm_test(NAME lambda_test_constructor_tests SOURCES constructor_tests.cpp)
cm_test(NAME lambda_test_control_structures SOURCES control_structures.cpp)
cm_test(NAME lambda_test_exception_test SOURCES exception_test.cpp)
cm_test(NAME lambda_test_extending_rt_traits SOURCES extending_rt_traits.cpp)
cm_test(NAME lambda_test_is_instance_of_test SOURCES is_instance_of_test.cpp)
cm_test(NAME lambda_test_member_pointer_test SOURCES member_pointer_test.cpp)
cm_test(NAME lambda_test_operator_tests_simple SOURCES operator_tests_simple.cpp)
cm_test(NAME lambda_test_phoenix_control_structures SOURCES phoenix_control_structures.cpp)
cm_test(NAME lambda_test_switch_construct SOURCES switch_construct.cpp)
cm_test(NAME lambda_test_result_of_tests SOURCES result_of_tests.cpp)
cm_test(NAME lambda_test_ret_test SOURCES ret_test.cpp)

