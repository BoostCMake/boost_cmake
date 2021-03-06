include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_bind)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_mpl
                        ${CMAKE_WORKSPACE_NAME}::bind
                        )

cm_test(NAME mpl_test_aux_increased_arity SOURCES ${CURRENT_TEST_SOURCES_DIR}/aux_/increased_arity.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_aux_largest_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/aux_/largest_int.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_aux_msvc_is_class SOURCES ${CURRENT_TEST_SOURCES_DIR}/aux_/msvc_is_class.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_aux_template_arity SOURCES ${CURRENT_TEST_SOURCES_DIR}/aux_/template_arity.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_aux_preprocessor_is_seq SOURCES ${CURRENT_TEST_SOURCES_DIR}/aux_/preprocessor/is_seq.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_aux_preprocessor_token_equal SOURCES ${CURRENT_TEST_SOURCES_DIR}/aux_/preprocessor/token_equal.cpp COMPILE_ONLY)

cm_test(NAME mpl_test_advance SOURCES ${CURRENT_TEST_SOURCES_DIR}/advance.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_always SOURCES ${CURRENT_TEST_SOURCES_DIR}/always.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_apply SOURCES ${CURRENT_TEST_SOURCES_DIR}/apply.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_apply_wrap SOURCES ${CURRENT_TEST_SOURCES_DIR}/apply_wrap.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_arithmetic SOURCES ${CURRENT_TEST_SOURCES_DIR}/arithmetic.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_as_sequence SOURCES ${CURRENT_TEST_SOURCES_DIR}/as_sequence.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_assert SOURCES ${CURRENT_TEST_SOURCES_DIR}/assert.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_at SOURCES ${CURRENT_TEST_SOURCES_DIR}/at.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_back SOURCES ${CURRENT_TEST_SOURCES_DIR}/back.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_bind SOURCES ${CURRENT_TEST_SOURCES_DIR}/bind.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_bitwise SOURCES ${CURRENT_TEST_SOURCES_DIR}/bitwise.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_bool SOURCES ${CURRENT_TEST_SOURCES_DIR}/bool.cpp)
cm_test(NAME mpl_test_comparison SOURCES ${CURRENT_TEST_SOURCES_DIR}/comparison.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_contains SOURCES ${CURRENT_TEST_SOURCES_DIR}/contains.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_copy SOURCES ${CURRENT_TEST_SOURCES_DIR}/copy.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_copy_if SOURCES ${CURRENT_TEST_SOURCES_DIR}/copy_if.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_count SOURCES ${CURRENT_TEST_SOURCES_DIR}/count.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_count_if SOURCES ${CURRENT_TEST_SOURCES_DIR}/count_if.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_deque SOURCES ${CURRENT_TEST_SOURCES_DIR}/deque.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_distance SOURCES ${CURRENT_TEST_SOURCES_DIR}/distance.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_empty SOURCES ${CURRENT_TEST_SOURCES_DIR}/empty.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_equal SOURCES ${CURRENT_TEST_SOURCES_DIR}/equal.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_erase SOURCES ${CURRENT_TEST_SOURCES_DIR}/erase.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_erase_range SOURCES ${CURRENT_TEST_SOURCES_DIR}/erase_range.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_eval_if SOURCES ${CURRENT_TEST_SOURCES_DIR}/eval_if.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_filter_view SOURCES ${CURRENT_TEST_SOURCES_DIR}/filter_view.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_find SOURCES ${CURRENT_TEST_SOURCES_DIR}/find.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_find_if SOURCES ${CURRENT_TEST_SOURCES_DIR}/find_if.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_fold SOURCES ${CURRENT_TEST_SOURCES_DIR}/fold.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_for_each SOURCES ${CURRENT_TEST_SOURCES_DIR}/for_each.cpp)
cm_test(NAME mpl_test_front SOURCES ${CURRENT_TEST_SOURCES_DIR}/front.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_has_xxx SOURCES ${CURRENT_TEST_SOURCES_DIR}/has_xxx.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_identity SOURCES ${CURRENT_TEST_SOURCES_DIR}/identity.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_if SOURCES ${CURRENT_TEST_SOURCES_DIR}/if.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_index_of SOURCES ${CURRENT_TEST_SOURCES_DIR}/index_of.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_inherit SOURCES ${CURRENT_TEST_SOURCES_DIR}/inherit.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_insert SOURCES ${CURRENT_TEST_SOURCES_DIR}/insert.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_insert_range SOURCES ${CURRENT_TEST_SOURCES_DIR}/insert_range.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_int SOURCES ${CURRENT_TEST_SOURCES_DIR}/int.cpp)
cm_test(NAME mpl_test_char SOURCES ${CURRENT_TEST_SOURCES_DIR}/char.cpp)
cm_test(NAME mpl_test_integral_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/integral_c.cpp)
cm_test(NAME mpl_test_is_placeholder SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_placeholder.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_is_sequence SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_sequence.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_iterator_tags SOURCES ${CURRENT_TEST_SOURCES_DIR}/iterator_tags.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_joint_view SOURCES ${CURRENT_TEST_SOURCES_DIR}/joint_view.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_lambda SOURCES ${CURRENT_TEST_SOURCES_DIR}/lambda.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_lambda_args SOURCES ${CURRENT_TEST_SOURCES_DIR}/lambda_args.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_list SOURCES ${CURRENT_TEST_SOURCES_DIR}/list.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_list_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/list_c.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_logical SOURCES ${CURRENT_TEST_SOURCES_DIR}/logical.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_lower_bound SOURCES ${CURRENT_TEST_SOURCES_DIR}/lower_bound.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/map.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_max_element SOURCES ${CURRENT_TEST_SOURCES_DIR}/max_element.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_min_max SOURCES ${CURRENT_TEST_SOURCES_DIR}/min_max.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_multiset SOURCES ${CURRENT_TEST_SOURCES_DIR}/multiset.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_next SOURCES ${CURRENT_TEST_SOURCES_DIR}/next.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_no_has_xxx SOURCES ${CURRENT_TEST_SOURCES_DIR}/no_has_xxx.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_numeric_ops SOURCES ${CURRENT_TEST_SOURCES_DIR}/numeric_ops.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_pair_view SOURCES ${CURRENT_TEST_SOURCES_DIR}/pair_view.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_partition SOURCES ${CURRENT_TEST_SOURCES_DIR}/partition.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_pop_front SOURCES ${CURRENT_TEST_SOURCES_DIR}/pop_front.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_push_back SOURCES ${CURRENT_TEST_SOURCES_DIR}/push_back.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_push_front SOURCES ${CURRENT_TEST_SOURCES_DIR}/push_front.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_quote SOURCES ${CURRENT_TEST_SOURCES_DIR}/quote.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_range_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/range_c.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_remove SOURCES ${CURRENT_TEST_SOURCES_DIR}/remove.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_remove_if SOURCES ${CURRENT_TEST_SOURCES_DIR}/remove_if.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_replace SOURCES ${CURRENT_TEST_SOURCES_DIR}/replace.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_replace_if SOURCES ${CURRENT_TEST_SOURCES_DIR}/replace_if.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_reverse SOURCES ${CURRENT_TEST_SOURCES_DIR}/reverse.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_same_as SOURCES ${CURRENT_TEST_SOURCES_DIR}/same_as.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/set.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_set_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/set_c.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_single_view SOURCES ${CURRENT_TEST_SOURCES_DIR}/single_view.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_size SOURCES ${CURRENT_TEST_SOURCES_DIR}/size.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_size_t SOURCES ${CURRENT_TEST_SOURCES_DIR}/size_t.cpp)
cm_test(NAME mpl_test_sizeof SOURCES ${CURRENT_TEST_SOURCES_DIR}/sizeof.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_sort SOURCES ${CURRENT_TEST_SOURCES_DIR}/sort.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_stable_partition SOURCES ${CURRENT_TEST_SOURCES_DIR}/stable_partition.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_transform SOURCES ${CURRENT_TEST_SOURCES_DIR}/transform.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_transform_view SOURCES ${CURRENT_TEST_SOURCES_DIR}/transform_view.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_unique SOURCES ${CURRENT_TEST_SOURCES_DIR}/unique.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_unpack_args SOURCES ${CURRENT_TEST_SOURCES_DIR}/unpack_args.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_upper_bound SOURCES ${CURRENT_TEST_SOURCES_DIR}/upper_bound.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_vector SOURCES ${CURRENT_TEST_SOURCES_DIR}/vector.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_vector_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/vector_c.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_zip_view SOURCES ${CURRENT_TEST_SOURCES_DIR}/zip_view.cpp COMPILE_ONLY)
cm_test(NAME mpl_test_string SOURCES ${CURRENT_TEST_SOURCES_DIR}/string.cpp)
