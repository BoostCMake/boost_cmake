include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_function
                        ${CMAKE_WORKSPACE_NAME}::static_assert
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::lambda
                        )

# Function library

# Copyright Douglas Gregor 2001-2003. Use, modification and
# distribution is subject to the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/

#test-suite function
cm_test(NAME function_test_function_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_test.cpp)

cm_test(NAME function_test_function_n_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_n_test.cpp)

cm_test(NAME function_test_allocator_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/allocator_test.cpp)

cm_test(NAME function_test_stateless_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/stateless_test.cpp)

cm_test(NAME function_test_lambda_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/lambda_test.cpp)

cm_test(NAME function_test_function_test_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_test_fail1.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME function_test_function_test_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_test_fail2.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME function_test_function_30 SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_30.cpp COMPILE_ONLY)

cm_test(NAME function_test_function_arith_cxx98 SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_arith_cxx98.cpp)

cm_test(NAME function_test_function_arith_portable SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_arith_portable.cpp)

cm_test(NAME function_test_sum_avg_cxx98 SOURCES ${CURRENT_TEST_SOURCES_DIR}/sum_avg_cxx98.cpp)

cm_test(NAME function_test_sum_avg_portable SOURCES ${CURRENT_TEST_SOURCES_DIR}/sum_avg_portable.cpp)

cm_test(NAME function_test_mem_fun_cxx98 SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fun_cxx98.cpp)

cm_test(NAME function_test_mem_fun_portable SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fun_portable.cpp)

cm_test(NAME function_test_std_bind_cxx98 SOURCES ${CURRENT_TEST_SOURCES_DIR}/std_bind_cxx98.cpp)

cm_test(NAME function_test_std_bind_portable SOURCES ${CURRENT_TEST_SOURCES_DIR}/std_bind_portable.cpp)

cm_test(NAME function_test_function_ref_cxx98 SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_ref_cxx98.cpp)

cm_test(NAME function_test_function_ref_portable SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_ref_portable.cpp)

cm_test(NAME function_test_contains_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/contains_test.cpp)

cm_test(NAME function_test_contains2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/contains2_test.cpp)

cm_test(NAME function_test_nothrow_swap SOURCES ${CURRENT_TEST_SOURCES_DIR}/nothrow_swap.cpp)

cm_test(NAME function_test_rvalues_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/rvalues_test.cpp)

cm_test(NAME function_test_function_typeof_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_typeof_test.cpp COMPILE_ONLY)
