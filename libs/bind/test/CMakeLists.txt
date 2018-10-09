include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_smart_ptr)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_bind
                        ${CMAKE_WORKSPACE_NAME}::function
                        ${CMAKE_WORKSPACE_NAME}::smart_ptr
                        )

#  Boost.Bind Library test Jamfile
#
#  Copyright (c) 2003-2006 Peter Dimov
#
#  Distributed under the Boost Software License, Version 1.0. (See
#  accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)

#test-suite "bind"
cm_test(NAME bind_test_bind_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_test.cpp)
cm_test(NAME bind_test_bind_dm_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_dm_test.cpp)
cm_test(NAME bind_test_bind_eq_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_eq_test.cpp)
cm_test(NAME bind_test_bind_const_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_const_test.cpp)
cm_test(NAME bind_test_bind_cv_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_cv_test.cpp)
cm_test(NAME bind_test_bind_stateful_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_stateful_test.cpp)
cm_test(NAME bind_test_bind_dm2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_dm2_test.cpp)
cm_test(NAME bind_test_bind_not_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_not_test.cpp)
cm_test(NAME bind_test_bind_rel_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_rel_test.cpp)
cm_test(NAME bind_test_bind_function_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_function_test.cpp)
cm_test(NAME bind_test_bind_lookup_problem_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_lookup_problem_test.cpp)
cm_test(NAME bind_test_bind_rv_sp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_rv_sp_test.cpp)
cm_test(NAME bind_test_bind_unary_addr SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_unary_addr.cpp COMPILE_ONLY)
cm_test(NAME bind_test_bind_dm3_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_dm3_test.cpp)
cm_test(NAME bind_test_bind_visit_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_visit_test.cpp)
cm_test(NAME bind_test_bind_placeholder_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_placeholder_test.cpp)
cm_test(NAME bind_test_bind_rvalue_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_rvalue_test.cpp)
cm_test(NAME bind_test_bind_and_or_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_and_or_test.cpp)
cm_test(NAME bind_test_bind_void_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_void_test.cpp)
cm_test(NAME bind_test_bind_void_dm_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_void_dm_test.cpp)
cm_test(NAME bind_test_bind_void_mf_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_void_mf_test.cpp)
cm_test(NAME bind_test_mem_fn_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fn_test.cpp)
cm_test(NAME bind_test_mem_fn_void_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fn_void_test.cpp)
cm_test(NAME bind_test_mem_fn_derived_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fn_derived_test.cpp)
cm_test(NAME bind_test_mem_fn_eq_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fn_eq_test.cpp)
cm_test(NAME bind_test_mem_fn_dm_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fn_dm_test.cpp)
cm_test(NAME bind_test_mem_fn_rv_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fn_rv_test.cpp)
cm_test(NAME bind_test_ref_fn_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ref_fn_test.cpp)
cm_test(NAME bind_test_bind_fnobj2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_fnobj2_test.cpp)
cm_test(NAME bind_test_bind_fn2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_fn2_test.cpp)
cm_test(NAME bind_test_bind_mf2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_mf2_test.cpp)
cm_test(NAME bind_test_bind_eq2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_eq2_test.cpp)
cm_test(NAME bind_test_mem_fn_ref_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fn_ref_test.cpp)
cm_test(NAME bind_test_bind_ref_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_ref_test.cpp)
cm_test(NAME bind_test_bind_eq3_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_eq3_test.cpp)
cm_test(NAME bind_test_protect_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/protect_test.cpp)
cm_test(NAME bind_test_mem_fn_unary_addr_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mem_fn_unary_addr_test.cpp)
cm_test(NAME bind_test_bind_function2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_function2_test.cpp)
cm_test(NAME bind_test_bind_fwd_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_fwd_test.cpp)
cm_test(NAME bind_test_bind_fwd2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_fwd2_test.cpp)
cm_test(NAME bind_test_bind_no_placeholders_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_no_placeholders_test)
cm_test(NAME bind_test_placeholder_const_ref_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/placeholder_const_ref_test)
cm_test(NAME bind_test_bind_function_ap_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_function_ap_test)
cm_test(NAME bind_test_bind_type_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_type_test)
cm_test(NAME bind_test_ SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind_unique_ptr_test)
