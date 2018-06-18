include(BCMTest)

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

# bring in rules for testing

cm_test(NAME bind_test_bind_test SOURCES bind_test.cpp)
cm_test(NAME bind_test_bind_dm_test SOURCES bind_dm_test.cpp)
cm_test(NAME bind_test_bind_eq_test SOURCES bind_eq_test.cpp)
cm_test(NAME bind_test_bind_const_test SOURCES bind_const_test.cpp)
cm_test(NAME bind_test_bind_cv_test SOURCES bind_cv_test.cpp)
cm_test(NAME bind_test_bind_stateful_test SOURCES bind_stateful_test.cpp)
cm_test(NAME bind_test_bind_dm2_test SOURCES bind_dm2_test.cpp)
cm_test(NAME bind_test_bind_not_test SOURCES bind_not_test.cpp)
cm_test(NAME bind_test_bind_rel_test SOURCES bind_rel_test.cpp)
cm_test(NAME bind_test_bind_function_test SOURCES bind_function_test.cpp)
cm_test(NAME bind_test_bind_lookup_problem_test SOURCES bind_lookup_problem_test.cpp)
cm_test(NAME bind_test_bind_rv_sp_test SOURCES bind_rv_sp_test.cpp)
cm_test(NAME bind_test_bind_unary_addr SOURCES bind_unary_addr.cpp COMPILE_ONLY)
cm_test(NAME bind_test_bind_dm3_test SOURCES bind_dm3_test.cpp)
cm_test(NAME bind_test_bind_visit_test SOURCES bind_visit_test.cpp)
cm_test(NAME bind_test_bind_placeholder_test SOURCES bind_placeholder_test.cpp)
cm_test(NAME bind_test_bind_rvalue_test SOURCES bind_rvalue_test.cpp)
cm_test(NAME bind_test_bind_and_or_test SOURCES bind_and_or_test.cpp)
cm_test(NAME bind_test_bind_void_test SOURCES bind_void_test.cpp)
cm_test(NAME bind_test_bind_void_dm_test SOURCES bind_void_dm_test.cpp)
cm_test(NAME bind_test_bind_void_mf_test SOURCES bind_void_mf_test.cpp)
cm_test(NAME bind_test_mem_fn_test SOURCES mem_fn_test.cpp)
cm_test(NAME bind_test_mem_fn_void_test SOURCES mem_fn_void_test.cpp)
cm_test(NAME bind_test_mem_fn_derived_test SOURCES mem_fn_derived_test.cpp)
cm_test(NAME bind_test_mem_fn_eq_test SOURCES mem_fn_eq_test.cpp)
cm_test(NAME bind_test_mem_fn_dm_test SOURCES mem_fn_dm_test.cpp)
cm_test(NAME bind_test_mem_fn_rv_test SOURCES mem_fn_rv_test.cpp)
cm_test(NAME bind_test_ref_fn_test SOURCES ref_fn_test.cpp)
cm_test(NAME bind_test_bind_fnobj2_test SOURCES bind_fnobj2_test.cpp)
cm_test(NAME bind_test_bind_fn2_test SOURCES bind_fn2_test.cpp)
cm_test(NAME bind_test_bind_mf2_test SOURCES bind_mf2_test.cpp)
cm_test(NAME bind_test_bind_eq2_test SOURCES bind_eq2_test.cpp)
cm_test(NAME bind_test_mem_fn_ref_test SOURCES mem_fn_ref_test.cpp)
cm_test(NAME bind_test_bind_ref_test SOURCES bind_ref_test.cpp)
cm_test(NAME bind_test_bind_eq3_test SOURCES bind_eq3_test.cpp)
cm_test(NAME bind_test_protect_test SOURCES protect_test.cpp)
cm_test(NAME bind_test_mem_fn_unary_addr_test SOURCES mem_fn_unary_addr_test.cpp)
cm_test(NAME bind_test_bind_function2_test SOURCES bind_function2_test.cpp)
cm_test(NAME bind_test_bind_fwd_test SOURCES bind_fwd_test.cpp)
cm_test(NAME bind_test_bind_fwd2_test SOURCES bind_fwd2_test.cpp)
# cm_test(NAME bind_test_bind_no_placeholders_test SOURCES bind_no_placeholders_test.cpp)
# cm_test(NAME bind_test_placeholder_const_ref_test SOURCES placeholder_const_ref_test.cpp)
# cm_test(NAME bind_test_bind_function_ap_test SOURCES bind_function_ap_test.cpp)
# cm_test(NAME bind_test_bind_type_test SOURCES bind_type_test.cpp)
# cm_test(NAME bind_test_bind_unique_ptr_test SOURCES bind_unique_ptr_test.cpp)
# cm_test(NAME bind_test_bind_nested_rv_test SOURCES bind_nested_rv_test.cpp)
# cm_test(NAME bind_test_arg_copy_test SOURCES arg_copy_test.cpp COMPILE_ONLY)
# cm_test(NAME bind_test_arg_copy_fail SOURCES arg_copy_fail.cpp COMPILE_ONLY WILL_FAIL)
# cm_test(NAME bind_test_placeholder_std_bind_test SOURCES placeholder_std_bind_test.cpp)