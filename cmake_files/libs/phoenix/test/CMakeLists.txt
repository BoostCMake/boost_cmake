include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

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

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_phoenix
                        boost::static_assert
                        boost::assign
                        boost::thread
                        boost::typeof
                        boost::spirit
                        boost::test
                        boost::signals2
                        boost::lambda
                        boost::any
                        boost::log
                        )

#==============================================================================
#    Copyright (c) 2003-2006 Joel de Guzman
#    Copyright (c) 2014-2015 John Fletcher
#
#   Use, modification and distribution is subject to the Boost Software
#   License, Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt)
#==============================================================================

# bring in rules for testing


bcm_test(NAME phoenix_test_core_custom_terminal SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/custom_terminal.cpp)
bcm_test(NAME phoenix_test_core_intel_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/intel_test.cpp)
bcm_test(NAME phoenix_test_core_primitives_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/core/primitives_tests.cpp)

bcm_test(NAME phoenix_test_stdlib_cmath SOURCES ${CMAKE_WORKSPACE_SOURCE}/stdlib/cmath.cpp)

bcm_test(NAME phoenix_test_operator_arithmetic_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/arithmetic_tests.cpp)
bcm_test(NAME phoenix_test_operator_bitwise_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/bitwise_tests.cpp)
bcm_test(NAME phoenix_test_operator_comparison_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/comparison_tests.cpp)
bcm_test(NAME phoenix_test_operator_if_else_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/if_else_tests.cpp)
bcm_test(NAME phoenix_test_operator_io_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/io_tests.cpp)
bcm_test(NAME phoenix_test_operator_logical_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/logical_tests.cpp)
bcm_test(NAME phoenix_test_operator_misc_binary_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/misc_binary_tests.cpp)
bcm_test(NAME phoenix_test_operator_self_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/self_tests.cpp)
bcm_test(NAME phoenix_test_operator_unary_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/unary_tests.cpp)
bcm_test(NAME phoenix_test_operator_member SOURCES ${CMAKE_WORKSPACE_SOURCE}/operator/member.cpp)

bcm_test(NAME phoenix_test_object_cast_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/object/cast_tests.cpp)
bcm_test(NAME phoenix_test_object_new_delete_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/object/new_delete_tests.cpp)

#    [ run function/lazy_compose_tests.cpp ]
#    [ run function/lazy_fold_tests.cpp ]
#    [ run function/lazy_ptr_tests.cpp ]
#    [ run function/lazy_scan_tests.cpp ]
#    [ run function/lazy_thunk_tests.cpp ]
#    [ run function/function_tests_phx2.cpp ]
bcm_test(NAME phoenix_test_function_adapt_function SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/adapt_function.cpp)
bcm_test(NAME phoenix_test_function_function_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/function_tests.cpp)
bcm_test(NAME phoenix_test_function_lazy_argument_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/lazy_argument_tests.cpp)
bcm_test(NAME phoenix_test_function_lazy_list_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/lazy_list_tests.cpp)
bcm_test(NAME phoenix_test_function_lazy_list2_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/lazy_list2_tests.cpp)
bcm_test(NAME phoenix_test_function_lazy_list3_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/lazy_list3_tests.cpp)
bcm_test(NAME phoenix_test_function_lazy_make_pair_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/lazy_make_pair_tests.cpp)
bcm_test(NAME phoenix_test_function_lazy_templated_struct_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/lazy_templated_struct_tests.cpp)
bcm_test(NAME phoenix_test_function_lazy_operator_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/function/lazy_operator_tests.cpp)

#    [ run bind/bind_function_object_tests_phx2.cpp ]
bcm_test(NAME phoenix_test_bind_bind_function_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/bind/bind_function_tests.cpp)
bcm_test(NAME phoenix_test_bind_bind_function_object_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/bind/bind_function_object_tests.cpp)
bcm_test(NAME phoenix_test_bind_bind_member_function_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/bind/bind_member_function_tests.cpp)
bcm_test(NAME phoenix_test_bind_bind_member_variable_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/bind/bind_member_variable_tests.cpp)
bcm_test(NAME phoenix_test_bind_bug5782 SOURCES ${CMAKE_WORKSPACE_SOURCE}/bind/bug5782.cpp)

bcm_test(NAME phoenix_test_statement_if_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/statement/if_tests.cpp)
bcm_test(NAME phoenix_test_statement_loops_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/statement/loops_tests.cpp)
bcm_test(NAME phoenix_test_statement_switch_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/statement/switch_tests.cpp)
bcm_test(NAME phoenix_test_statement_exceptions SOURCES ${CMAKE_WORKSPACE_SOURCE}/statement/exceptions.cpp)
bcm_test(NAME phoenix_test_statement_bug5715 SOURCES ${CMAKE_WORKSPACE_SOURCE}/statement/bug5715.cpp)

bcm_test(NAME phoenix_test_container_container_tests1a SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests1a.cpp)
bcm_test(NAME phoenix_test_container_container_tests1b SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests1b.cpp)
bcm_test(NAME phoenix_test_container_container_tests2a SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests2a.cpp)
bcm_test(NAME phoenix_test_container_container_tests2b SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests2b.cpp)
bcm_test(NAME phoenix_test_container_container_tests3a SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests3a.cpp)
bcm_test(NAME phoenix_test_container_container_tests3b SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests3b.cpp)
bcm_test(NAME phoenix_test_container_container_tests4a SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests4a.cpp)
bcm_test(NAME phoenix_test_container_container_tests4b SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests4b.cpp)
bcm_test(NAME phoenix_test_container_container_tests5a SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests5a.cpp)
bcm_test(NAME phoenix_test_container_container_tests5b SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests5b.cpp)
bcm_test(NAME phoenix_test_container_container_tests6a SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests6a.cpp)
bcm_test(NAME phoenix_test_container_container_tests6b SOURCES ${CMAKE_WORKSPACE_SOURCE}/container/container_tests6b.cpp)

#    [ run scope/lambda_tests.cpp ]
#    [ run scope/lambda_tests1.cpp ]
#    [ run scope/lambda_tests1b.cpp ]
#    [ run scope/lambda_tests3a1.cpp ]
#    [ run scope/lambda_tests_phx2.cpp ]
#    [ run scope/let_tests_113a.cpp ]
#    [ run scope/let_tests_157a.cpp ]
#    [ run scope/more_let_tests1.cpp ]
#    [ run scope/more_let_tests2a.cpp ]
#    [ run scope/more_let_tests2b.cpp ]
bcm_test(NAME phoenix_test_scope_lambda_tests1a SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1a.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests1b1p SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1b1p.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests1b1q SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1b1q.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests1b1r SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1b1r.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests1b1s SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1b1s.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests1b1t SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1b1t.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests1b2p SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1b2p.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests1b2q SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1b2q.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests1b2r SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests1b2r.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests2.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests2a SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests2a.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests3.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests3a SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests3a.cpp)
bcm_test(NAME phoenix_test_scope_lambda_tests3b SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/lambda_tests3b.cpp)
bcm_test(NAME phoenix_test_scope_let_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/let_tests.cpp)
bcm_test(NAME phoenix_test_scope_let_tests_113 SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/let_tests_113.cpp)
bcm_test(NAME phoenix_test_scope_let_tests_157 SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/let_tests_157.cpp)
bcm_test(NAME phoenix_test_scope_let_tests_rest SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/let_tests_rest.cpp)
bcm_test(NAME phoenix_test_scope_more_lambda_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/more_lambda_tests.cpp)
bcm_test(NAME phoenix_test_scope_more_let_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/more_let_tests.cpp)
bcm_test(NAME phoenix_test_scope_dynamic_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/dynamic_tests.cpp)
bcm_test(NAME phoenix_test_scope_bug3289 SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/bug3289.cpp)
bcm_test(NAME phoenix_test_scope_bug8298 SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/bug8298.cpp)
bcm_test(NAME phoenix_test_scope_bug8298f SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/bug8298f.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME phoenix_test_scope_bug_000008 SOURCES ${CMAKE_WORKSPACE_SOURCE}/scope/bug_000008.cpp)

bcm_test(NAME phoenix_test_algorithm_for_each SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/for_each.cpp)
# bcm_test(NAME phoenix_test_algorithm_for_each2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/for_each2.cpp)
bcm_test(NAME phoenix_test_algorithm_for_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/for_test.cpp)
# bcm_test(NAME phoenix_test_algorithm_for_test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/for_test2.cpp)
bcm_test(NAME phoenix_test_algorithm_iteration SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/iteration.cpp)
bcm_test(NAME phoenix_test_algorithm_transformation1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/transformation1.cpp)
bcm_test(NAME phoenix_test_algorithm_transformation2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/transformation2.cpp)
bcm_test(NAME phoenix_test_algorithm_transformation3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/transformation3.cpp)
bcm_test(NAME phoenix_test_algorithm_transformation4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/transformation4.cpp)
bcm_test(NAME phoenix_test_algorithm_querying SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/querying.cpp)
bcm_test(NAME phoenix_test_algorithm_querying_find SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/querying_find.cpp)
bcm_test(NAME phoenix_test_algorithm_querying2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/querying2.cpp)
# bcm_test(NAME phoenix_test_algorithm_querying_find2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/algorithm/querying_find2.cpp)

#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_dm1_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp1_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp2_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp3_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp4_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp5_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp6_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_rv_sp7_test.cpp ]
#    [ run ${CMAKE_WORKSPACE_NAME}_bind_compatibility/bind_void_dm_test.cpp ]
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_and_or_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_and_or_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_const_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_const_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_cv_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_cv_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_dm_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_dm_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_dm2_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_dm2_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_dm3_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_dm3_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_eq_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_eq_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_eq2_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_eq2_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_eq3_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_eq3_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_fn2_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_fn2_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_function_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_function_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_interoperation_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_interoperation_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_mf2_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_mf2_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_not_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_not_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_placeholder_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_placeholder_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_ref_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_ref_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_rel_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_rel_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_rvalue_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_rvalue_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_rv_sp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_rv_sp_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_stateful_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_stateful_test.cpp)
bcm_test(NAME phoenix_test_boost_bind_compatibility_bind_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/boost_bind_compatibility/bind_test.cpp)

#   [ run regression/bug5875.cpp ]
bcm_test(NAME phoenix_test_regression_bug4853 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug4853.cpp)
bcm_test(NAME phoenix_test_regression_bug5626 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug5626.cpp)
bcm_test(NAME phoenix_test_regression_bug5824 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug5824.cpp)
bcm_test(NAME phoenix_test_regression_bug5968 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug5968.cpp)
bcm_test(NAME phoenix_test_regression_bug6040 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug6040.cpp)
bcm_test(NAME phoenix_test_regression_bug6268 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug6268.cpp)
bcm_test(NAME phoenix_test_regression_bug7165 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug7165.cpp)
bcm_test(NAME phoenix_test_regression_bug7166 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug7166.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME phoenix_test_regression_bug7624 SOURCES ${CMAKE_WORKSPACE_SOURCE}/regression/bug7624.cpp)

#    [ run include/spirit.cpp ]
#    [ run include/spirit_no_specialize.cpp ]
#   [ run include/core/bug7730.cpp ]
bcm_test(NAME phoenix_test_include_bind SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/bind.cpp)
bcm_test(NAME phoenix_test_include_core SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core.cpp)
bcm_test(NAME phoenix_test_include_function SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/function.cpp)
bcm_test(NAME phoenix_test_include_fusion SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/fusion.cpp)
bcm_test(NAME phoenix_test_include_object SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/object.cpp)
bcm_test(NAME phoenix_test_include_operator SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator.cpp)
bcm_test(NAME phoenix_test_include_scope SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/scope.cpp)
bcm_test(NAME phoenix_test_include_statement SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement.cpp)
bcm_test(NAME phoenix_test_include_stl SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/stl.cpp)
bcm_test(NAME phoenix_test_include_version SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/version.cpp)
bcm_test(NAME phoenix_test_include_bind_bind_member_function SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/bind/bind_member_function.cpp)
bcm_test(NAME phoenix_test_include_bind_bind_member_variable SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/bind/bind_member_variable.cpp)
bcm_test(NAME phoenix_test_include_core_actor SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/actor.cpp)
bcm_test(NAME phoenix_test_include_core_argument SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/argument.cpp)
bcm_test(NAME phoenix_test_include_core_arity SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/arity.cpp)
bcm_test(NAME phoenix_test_include_core_debug SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/debug.cpp)
bcm_test(NAME phoenix_test_include_core_domain SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/domain.cpp)
bcm_test(NAME phoenix_test_include_core_environment SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/environment.cpp)
bcm_test(NAME phoenix_test_include_core_expression SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/expression.cpp)
bcm_test(NAME phoenix_test_include_core_function_equal SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/function_equal.cpp)
bcm_test(NAME phoenix_test_include_core_is_actor SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/is_actor.cpp)
bcm_test(NAME phoenix_test_include_core_is_nullary SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/is_nullary.cpp)
bcm_test(NAME phoenix_test_include_core_limits SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/limits.cpp)
bcm_test(NAME phoenix_test_include_core_meta_grammar SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/meta_grammar.cpp)
bcm_test(NAME phoenix_test_include_core_nothing SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/nothing.cpp)
bcm_test(NAME phoenix_test_include_core_reference SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/reference.cpp)
bcm_test(NAME phoenix_test_include_core_terminal SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/terminal.cpp)
bcm_test(NAME phoenix_test_include_core_value SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/value.cpp)
bcm_test(NAME phoenix_test_include_core_visit_each SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/core/visit_each.cpp)
bcm_test(NAME phoenix_test_function_function SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/function/function.cpp)
bcm_test(NAME phoenix_test_include_function_lazy_headers SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/function/lazy_headers.cpp)
bcm_test(NAME phoenix_test_include_fusion_at SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/fusion/at.cpp)
bcm_test(NAME phoenix_test_include_object_const_cast SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/object/const_cast.cpp)
bcm_test(NAME phoenix_test_include_object_construct SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/object/construct.cpp)
bcm_test(NAME phoenix_test_include_object_delete SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/object/delete.cpp)
bcm_test(NAME phoenix_test_include_object_dynamic_cast SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/object/dynamic_cast.cpp)
bcm_test(NAME phoenix_test_include_object_new SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/object/new.cpp)
bcm_test(NAME phoenix_test_include_object_reinterpret_cast SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/object/reinterpret_cast.cpp)
bcm_test(NAME phoenix_test_include_object_static_cast SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/object/static_cast.cpp)
bcm_test(NAME phoenix_test_include_operator_arithmetic SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator/arithmetic.cpp)
bcm_test(NAME phoenix_test_include_operator_bitwise SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator/bitwise.cpp)
bcm_test(NAME phoenix_test_include_operator_comparison SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator/comparison.cpp)
bcm_test(NAME phoenix_test_include_operator_if_else SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator/if_else.cpp)
bcm_test(NAME phoenix_test_include_operator_io SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator/io.cpp)
bcm_test(NAME phoenix_test_include_operator_logical SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator/logical.cpp)
bcm_test(NAME phoenix_test_operator_member2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator/member.cpp)
bcm_test(NAME phoenix_test_include_operator_self SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/operator/self.cpp)
bcm_test(NAME phoenix_test_include_scope_dynamic SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/scope/dynamic.cpp)
bcm_test(NAME phoenix_test_include_scope_lambda SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/scope/lambda.cpp)
bcm_test(NAME phoenix_test_include_scope_let SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/scope/let.cpp)
bcm_test(NAME phoenix_test_include_scope_local_variable SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/scope/local_variable.cpp)
bcm_test(NAME phoenix_test_include_scope_scoped_environment SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/scope/scoped_environment.cpp)
bcm_test(NAME phoenix_test_include_scope_this SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/scope/this.cpp)
bcm_test(NAME phoenix_test_include_statement_do_while SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement/do_while.cpp)
bcm_test(NAME phoenix_test_include_statement_for SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement/for.cpp)
bcm_test(NAME phoenix_test_include_statement_if SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement/if.cpp)
bcm_test(NAME phoenix_test_include_statement_sequence SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement/sequence.cpp)
bcm_test(NAME phoenix_test_include_statement_switch SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement/switch.cpp)
bcm_test(NAME phoenix_test_include_statement_throw SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement/throw.cpp)
bcm_test(NAME phoenix_test_include_statement_try_catch SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement/try_catch.cpp)
bcm_test(NAME phoenix_test_include_statement_while SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/statement/while.cpp)
bcm_test(NAME phoenix_test_include_stl_algorithm SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/stl/algorithm.cpp)
bcm_test(NAME phoenix_test_include_stl_container SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/stl/container.cpp)
bcm_test(NAME phoenix_test_container_container SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/stl/container/container.cpp)
bcm_test(NAME phoenix_test_include_iteration SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/stl/algorithm/iteration.cpp)
bcm_test(NAME phoenix_test_include_querying SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/stl/algorithm/querying.cpp)
bcm_test(NAME phoenix_test_include_stl_algorithm_transformation SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/stl/algorithm/transformation.cpp)
bcm_test(NAME phoenix_test_include_support_iterate SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/support/iterate.cpp)
bcm_test(NAME phoenix_test_include_support_preprocessor_round SOURCES ${CMAKE_WORKSPACE_SOURCE}/include/support/preprocessor/round.cpp)

