include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_assign)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)
find_package(${CMAKE_WORKSPACE_NAME}_spirit)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_signals2)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)
find_package(${CMAKE_WORKSPACE_NAME}_any)
find_package(${CMAKE_WORKSPACE_NAME}_log)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_phoenix
                        ${CMAKE_WORKSPACE_NAME}::static_assert
                        ${CMAKE_WORKSPACE_NAME}::assign
                        ${CMAKE_WORKSPACE_NAME}::thread
                        ${CMAKE_WORKSPACE_NAME}::typeof
                        ${CMAKE_WORKSPACE_NAME}::spirit
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::signals2
                        ${CMAKE_WORKSPACE_NAME}::lambda
                        ${CMAKE_WORKSPACE_NAME}::any
                        ${CMAKE_WORKSPACE_NAME}::log
                        )

#==============================================================================
#    Copyright (c) 2003-2006 Joel de Guzman
#    Copyright (c) 2014-2015 John Fletcher
#
#   Use, modification and distribution is subject to the Boost Software
#   License, Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt)
#==============================================================================

#test-suite phoenix_core
cm_test(NAME phoenix_test_core_custom_terminal SOURCES ${CURRENT_TEST_SOURCES_DIR}/core/custom_terminal.cpp)
cm_test(NAME phoenix_test_core_intel_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/core/intel_test.cpp)
cm_test(NAME phoenix_test_core_primitives_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/core/primitives_tests.cpp)

#test-suite phoenix_stdlib
cm_test(NAME phoenix_test_stdlib_cmath SOURCES ${CURRENT_TEST_SOURCES_DIR}/stdlib/cmath.cpp)

#test-suite phoenix_operator
cm_test(NAME phoenix_test_operator_arithmetic_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/arithmetic_tests.cpp)
cm_test(NAME phoenix_test_operator_bitwise_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/bitwise_tests.cpp)
cm_test(NAME phoenix_test_operator_comparison_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/comparison_tests.cpp)
cm_test(NAME phoenix_test_operator_if_else_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/if_else_tests.cpp)
cm_test(NAME phoenix_test_operator_io_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/io_tests.cpp)
cm_test(NAME phoenix_test_operator_logical_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/logical_tests.cpp)
cm_test(NAME phoenix_test_operator_misc_binary_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/misc_binary_tests.cpp)
cm_test(NAME phoenix_test_operator_self_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/self_tests.cpp)
cm_test(NAME phoenix_test_operator_unary_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/unary_tests.cpp)
cm_test(NAME phoenix_test_operator_member SOURCES ${CURRENT_TEST_SOURCES_DIR}/operator/member.cpp)

#test-suite phoenix_object
cm_test(NAME phoenix_test_object_cast_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/object/cast_tests.cpp)
cm_test(NAME phoenix_test_object_new_delete_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/object/new_delete_tests.cpp)

#test-suite phoenix_function
cm_test(NAME phoenix_test_function_adapt_function SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/adapt_function.cpp)
cm_test(NAME phoenix_test_function_function_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/function_tests.cpp)
cm_test(NAME phoenix_test_function_lazy_argument_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/lazy_argument_tests.cpp)
cm_test(NAME phoenix_test_function_lazy_list_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/lazy_list_tests.cpp)
cm_test(NAME phoenix_test_function_lazy_list2_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/lazy_list2_tests.cpp)
cm_test(NAME phoenix_test_function_lazy_list3_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/lazy_list3_tests.cpp)
cm_test(NAME phoenix_test_function_lazy_make_pair_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/lazy_make_pair_tests.cpp)
cm_test(NAME phoenix_test_function_lazy_templated_struct_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/lazy_templated_struct_tests.cpp)
cm_test(NAME phoenix_test_function_lazy_operator_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/function/lazy_operator_tests.cpp)
#    [ run function/function_tests_phx2.cpp ]

#test-suite phoenix_bind
cm_test(NAME phoenix_test_bind_bind_function_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind/bind_function_tests.cpp)
cm_test(NAME phoenix_test_bind_bind_function_object_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind/bind_function_object_tests.cpp)
#    [ run bind/bind_function_object_tests_phx2.cpp ]
cm_test(NAME phoenix_test_bind_bind_member_function_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind/bind_member_function_tests.cpp)
cm_test(NAME phoenix_test_bind_bind_member_variable_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind/bind_member_variable_tests.cpp)
cm_test(NAME phoenix_test_bind_bug5782 SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind/bug5782.cpp)

#test-suite phoenix_statement
cm_test(NAME phoenix_test_statement_if_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/statement/if_tests.cpp)
cm_test(NAME phoenix_test_statement_loops_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/statement/loops_tests.cpp)
cm_test(NAME phoenix_test_statement_switch_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/statement/switch_tests.cpp)
cm_test(NAME phoenix_test_statement_exceptions SOURCES ${CURRENT_TEST_SOURCES_DIR}/statement/exceptions.cpp)
cm_test(NAME phoenix_test_statement_bug5715 SOURCES ${CURRENT_TEST_SOURCES_DIR}/statement/bug5715.cpp)

#test-suite phoenix_container
cm_test(NAME phoenix_test_container_container_tests1a SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests1a.cpp)
cm_test(NAME phoenix_test_container_container_tests1b SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests1b.cpp)
cm_test(NAME phoenix_test_container_container_tests2a SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests2a.cpp)
cm_test(NAME phoenix_test_container_container_tests2b SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests2b.cpp)
cm_test(NAME phoenix_test_container_container_tests3a SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests3a.cpp)
cm_test(NAME phoenix_test_container_container_tests3b SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests3b.cpp)
cm_test(NAME phoenix_test_container_container_tests4a SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests4a.cpp)
cm_test(NAME phoenix_test_container_container_tests4b SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests4b.cpp)
cm_test(NAME phoenix_test_container_container_tests5a SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests5a.cpp)
cm_test(NAME phoenix_test_container_container_tests5b SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests5b.cpp)
cm_test(NAME phoenix_test_container_container_tests6a SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests6a.cpp)
cm_test(NAME phoenix_test_container_container_tests6b SOURCES ${CURRENT_TEST_SOURCES_DIR}/container/container_tests6b.cpp)

#test-suite phoenix_scope
#    [ run scope/lambda_tests.cpp ]
#    [ run scope/lambda_tests1.cpp ]
cm_test(NAME phoenix_test_scope_lambda_tests1a SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1a.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests1b1p SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1b1p.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests1b1q SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1b1q.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests1b1r SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1b1r.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests1b1s SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1b1s.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests1b1t SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1b1t.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests1b2p SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1b2p.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests1b2q SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1b2q.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests1b2r SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests1b2r.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests2.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests2a SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests2a.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests3.cpp)
cm_test(NAME phoenix_test_scope_lambda_tests3a SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests3a.cpp)
#    [ run scope/lambda_tests3a1.cpp ]
cm_test(NAME phoenix_test_scope_lambda_tests3b SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/lambda_tests3b.cpp)
#    [ run scope/lambda_tests_phx2.cpp ]
cm_test(NAME phoenix_test_scope_let_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/let_tests.cpp)
cm_test(NAME phoenix_test_scope_let_tests_113 SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/let_tests_113.cpp)
#    [ run scope/let_tests_113a.cpp ]
cm_test(NAME phoenix_test_scope_let_tests_157 SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/let_tests_157.cpp)
#    [ run scope/let_tests_157a.cpp ]
cm_test(NAME phoenix_test_scope_let_tests_rest SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/let_tests_rest.cpp)
#    [ run scope/more_let_tests1.cpp ]
#    [ run scope/more_let_tests2a.cpp ]
#    [ run scope/more_let_tests2b.cpp ]
cm_test(NAME phoenix_test_scope_more_lambda_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/more_lambda_tests.cpp)
cm_test(NAME phoenix_test_scope_more_let_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/more_let_tests.cpp)
cm_test(NAME phoenix_test_scope_dynamic_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/dynamic_tests.cpp)
cm_test(NAME phoenix_test_scope_bug3289 SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/bug3289.cpp)
cm_test(NAME phoenix_test_scope_bug8298 SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/bug8298.cpp)
cm_test(NAME phoenix_test_scope_bug8298f SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/bug8298f.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME phoenix_test_scope_bug_000008 SOURCES ${CURRENT_TEST_SOURCES_DIR}/scope/bug_000008.cpp)

#test-suite phoenix_algorithm 
cm_test(NAME phoenix_test_algorithm_for_each SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/for_each.cpp)
cm_test(NAME phoenix_test_algorithm_for_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/for_test.cpp)
cm_test(NAME phoenix_test_algorithm_iteration SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/iteration.cpp)
cm_test(NAME phoenix_test_algorithm_transformation1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/transformation1.cpp)
cm_test(NAME phoenix_test_algorithm_transformation2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/transformation2.cpp)
cm_test(NAME phoenix_test_algorithm_transformation3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/transformation3.cpp)
cm_test(NAME phoenix_test_algorithm_transformation4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/transformation4.cpp)
cm_test(NAME phoenix_test_algorithm_querying SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/querying.cpp)
cm_test(NAME phoenix_test_algorithm_querying_find SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/querying_find.cpp)
cm_test(NAME phoenix_test_algorithm_querying2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/algorithm/querying2.cpp)

#test-suite phoenix_boost_bind_compatibility
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_and_or_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_and_or_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_const_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_const_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_cv_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_cv_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_dm_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_dm_test.cpp)
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_dm1_test.cpp ]
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_dm2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_dm2_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_dm3_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_dm3_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_eq_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_eq_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_eq2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_eq2_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_eq3_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_eq3_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_fn2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_fn2_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_function_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_function_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_interoperation_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_interoperation_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_mf2_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_mf2_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_not_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_not_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_placeholder_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_placeholder_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_ref_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_ref_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_rel_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_rel_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_rvalue_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_rvalue_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_rv_sp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_rv_sp_test.cpp)
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp1_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp2_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp3_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp4_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp5_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp6_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp7_test.cpp ]cm_test(NAME phoenix_test_boost_bind_compatibility_bind_stateful_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_stateful_test.cpp)
cm_test(NAME phoenix_test_boost_bind_compatibility_bind_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/boost_bind_compatibility/bind_test.cpp)
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_void_dm_test.cpp ]

#test-suite phoenix_regression
cm_test(NAME phoenix_test_regression_bug4853 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug4853.cpp)
cm_test(NAME phoenix_test_regression_bug5626 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug5626.cpp)
cm_test(NAME phoenix_test_regression_bug5824 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug5824.cpp)
#   [ run regression/bug5875.cpp ]
cm_test(NAME phoenix_test_regression_bug5968 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug5968.cpp)
cm_test(NAME phoenix_test_regression_bug6040 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug6040.cpp)
cm_test(NAME phoenix_test_regression_bug6268 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug6268.cpp)
cm_test(NAME phoenix_test_regression_bug7165 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug7165.cpp)
cm_test(NAME phoenix_test_regression_bug7166 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug7166.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME phoenix_test_regression_bug7624 SOURCES ${CURRENT_TEST_SOURCES_DIR}/regression/bug7624.cpp)

#test-suite phoenix_include
cm_test(NAME phoenix_test_include_bind SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/bind.cpp)
cm_test(NAME phoenix_test_include_core SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core.cpp)
cm_test(NAME phoenix_test_include_function SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/function.cpp)
cm_test(NAME phoenix_test_include_fusion SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/fusion.cpp)
cm_test(NAME phoenix_test_include_object SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/object.cpp)
cm_test(NAME phoenix_test_include_operator SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator.cpp)
cm_test(NAME phoenix_test_include_scope SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/scope.cpp)
#    [ run include/spirit.cpp ]
#    [ run include/spirit_no_specialize.cpp ]
cm_test(NAME phoenix_test_include_statement SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement.cpp)
cm_test(NAME phoenix_test_include_stl SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/stl.cpp)
cm_test(NAME phoenix_test_include_version SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/version.cpp)
cm_test(NAME phoenix_test_include_bind_bind_member_function SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/bind/bind_member_function.cpp)
cm_test(NAME phoenix_test_include_bind_bind_member_variable SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/bind/bind_member_variable.cpp)
cm_test(NAME phoenix_test_include_core_actor SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/actor.cpp)
cm_test(NAME phoenix_test_include_core_argument SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/argument.cpp)
cm_test(NAME phoenix_test_include_core_arity SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/arity.cpp)
cm_test(NAME phoenix_test_include_core_debug SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/debug.cpp)
cm_test(NAME phoenix_test_include_core_domain SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/domain.cpp)
cm_test(NAME phoenix_test_include_core_environment SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/environment.cpp)
cm_test(NAME phoenix_test_include_core_expression SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/expression.cpp)
cm_test(NAME phoenix_test_include_core_function_equal SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/function_equal.cpp)
cm_test(NAME phoenix_test_include_core_is_actor SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/is_actor.cpp)
cm_test(NAME phoenix_test_include_core_is_nullary SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/is_nullary.cpp)
cm_test(NAME phoenix_test_include_core_limits SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/limits.cpp)
cm_test(NAME phoenix_test_include_core_meta_grammar SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/meta_grammar.cpp)
cm_test(NAME phoenix_test_include_core_nothing SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/nothing.cpp)
cm_test(NAME phoenix_test_include_core_reference SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/reference.cpp)
cm_test(NAME phoenix_test_include_core_terminal SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/terminal.cpp)
#   [ run include/core/bug7730.cpp ]
cm_test(NAME phoenix_test_include_core_value SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/value.cpp)
cm_test(NAME phoenix_test_include_core_visit_each SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/core/visit_each.cpp)
cm_test(NAME phoenix_test_function_function SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/function/function.cpp)
cm_test(NAME phoenix_test_include_function_lazy_headers SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/function/lazy_headers.cpp)
cm_test(NAME phoenix_test_include_fusion_at SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/fusion/at.cpp)
cm_test(NAME phoenix_test_include_object_const_cast SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/object/const_cast.cpp)
cm_test(NAME phoenix_test_include_object_construct SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/object/construct.cpp)
cm_test(NAME phoenix_test_include_object_delete SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/object/delete.cpp)
cm_test(NAME phoenix_test_include_object_dynamic_cast SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/object/dynamic_cast.cpp)
cm_test(NAME phoenix_test_include_object_new SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/object/new.cpp)
cm_test(NAME phoenix_test_include_object_reinterpret_cast SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/object/reinterpret_cast.cpp)
cm_test(NAME phoenix_test_include_object_static_cast SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/object/static_cast.cpp)
cm_test(NAME phoenix_test_include_operator_arithmetic SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator/arithmetic.cpp)
cm_test(NAME phoenix_test_include_operator_bitwise SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator/bitwise.cpp)
cm_test(NAME phoenix_test_include_operator_comparison SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator/comparison.cpp)
cm_test(NAME phoenix_test_include_operator_if_else SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator/if_else.cpp)
cm_test(NAME phoenix_test_include_operator_io SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator/io.cpp)
cm_test(NAME phoenix_test_include_operator_logical SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator/logical.cpp)
cm_test(NAME phoenix_test_operator_member2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator/member.cpp)
cm_test(NAME phoenix_test_include_operator_self SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/operator/self.cpp)
cm_test(NAME phoenix_test_include_scope_dynamic SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/scope/dynamic.cpp)
cm_test(NAME phoenix_test_include_scope_lambda SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/scope/lambda.cpp)
cm_test(NAME phoenix_test_include_scope_let SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/scope/let.cpp)
cm_test(NAME phoenix_test_include_scope_local_variable SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/scope/local_variable.cpp)
cm_test(NAME phoenix_test_include_scope_scoped_environment SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/scope/scoped_environment.cpp)
cm_test(NAME phoenix_test_include_scope_this SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/scope/this.cpp)
cm_test(NAME phoenix_test_include_statement_do_while SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement/do_while.cpp)
cm_test(NAME phoenix_test_include_statement_for SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement/for.cpp)
cm_test(NAME phoenix_test_include_statement_if SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement/if.cpp)
cm_test(NAME phoenix_test_include_statement_sequence SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement/sequence.cpp)
cm_test(NAME phoenix_test_include_statement_switch SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement/switch.cpp)
cm_test(NAME phoenix_test_include_statement_throw SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement/throw.cpp)
cm_test(NAME phoenix_test_include_statement_try_catch SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement/try_catch.cpp)
cm_test(NAME phoenix_test_include_statement_while SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/statement/while.cpp)
cm_test(NAME phoenix_test_include_stl_algorithm SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/stl/algorithm.cpp)
cm_test(NAME phoenix_test_include_stl_container SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/stl/container.cpp)
cm_test(NAME phoenix_test_container_container SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/stl/container/container.cpp)
cm_test(NAME phoenix_test_include_iteration SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/stl/algorithm/iteration.cpp)
cm_test(NAME phoenix_test_include_querying SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/stl/algorithm/querying.cpp)
cm_test(NAME phoenix_test_include_stl_algorithm_transformation SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/stl/algorithm/transformation.cpp)
cm_test(NAME phoenix_test_include_support_iterate SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/support/iterate.cpp)
cm_test(NAME phoenix_test_include_support_preprocessor_round SOURCES ${CURRENT_TEST_SOURCES_DIR}/include/support/preprocessor/round.cpp)
