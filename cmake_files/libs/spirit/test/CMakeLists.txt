include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_dynamic_bitset)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_assign)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_spirit
                        boost::random
                        boost::functional
                        boost::dynamic_bitset
                        boost::bind
                        boost::assign
                        boost::lambda
                        )

#==============================================================================
#   Copyright (c) 2001-2011 Joel de Guzman
#   Copyright (c) 2001-2012 Hartmut Kaiser
#   Copyright (c)      2011 Bryce Lelbach
#
#   Use, modification and distribution is subject to the Boost Software
#   License, Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt)
#==============================================================================

# bring in rules for testing

###############################################################################

add_library(test_spirit_flags INTERFACE)
target_include_directories(test_spirit_flags INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
bcm_test_link_libraries(test_spirit_flags)


###############################################################################

###########################################################################


bcm_test(NAME spirit_test_qi_actions SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/actions.cpp)
bcm_test(NAME spirit_test_qi_actions2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/actions2.cpp)
bcm_test(NAME spirit_test_qi_alternative SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/alternative.cpp)
bcm_test(NAME spirit_test_qi_attr SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/attr.cpp)
bcm_test(NAME spirit_test_qi_attribute1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/attribute1.cpp)
bcm_test(NAME spirit_test_qi_attribute2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/attribute2.cpp)
bcm_test(NAME spirit_test_qi_and_predicate SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/and_predicate.cpp)
bcm_test(NAME spirit_test_qi_auto SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/auto.cpp)
bcm_test(NAME spirit_test_qi_binary SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/binary.cpp)
bcm_test(NAME spirit_test_qi_bool1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/bool1.cpp)
bcm_test(NAME spirit_test_qi_bool2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/bool2.cpp)
bcm_test(NAME spirit_test_qi_char1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/char1.cpp)
bcm_test(NAME spirit_test_qi_char2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/char2.cpp)
bcm_test(NAME spirit_test_qi_char_class SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/char_class.cpp)
bcm_test(NAME spirit_test_qi_debug SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/debug.cpp)
bcm_test(NAME spirit_test_qi_difference SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/difference.cpp)
bcm_test(NAME spirit_test_qi_encoding SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/encoding.cpp)
bcm_test(NAME spirit_test_qi_end SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/end.cpp)
bcm_test(NAME spirit_test_qi_eps SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/eps.cpp)
bcm_test(NAME spirit_test_qi_expect SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/expect.cpp)
bcm_test(NAME spirit_test_qi_grammar SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/grammar.cpp)
bcm_test(NAME spirit_test_qi_int1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/int1.cpp)
bcm_test(NAME spirit_test_qi_int2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/int2.cpp)
bcm_test(NAME spirit_test_qi_int3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/int3.cpp)
bcm_test(NAME spirit_test_qi_kleene SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/kleene.cpp)
bcm_test(NAME spirit_test_qi_lazy SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/lazy.cpp)
bcm_test(NAME spirit_test_qi_lexeme SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/lexeme.cpp)
bcm_test(NAME spirit_test_qi_lit1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/lit1.cpp)
bcm_test(NAME spirit_test_qi_lit2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/lit2.cpp)
bcm_test(NAME spirit_test_qi_list SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/list.cpp)
bcm_test(NAME spirit_test_qi_hold SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/hold.cpp)
bcm_test(NAME spirit_test_qi_match_manip1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/match_manip1.cpp)
bcm_test(NAME spirit_test_qi_match_manip2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/match_manip2.cpp)
bcm_test(NAME spirit_test_qi_match_manip3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/match_manip3.cpp)
bcm_test(NAME spirit_test_qi_match_manip_attr SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/match_manip_attr.cpp)
bcm_test(NAME spirit_test_qi_matches SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/matches.cpp)
bcm_test(NAME spirit_test_qi_no_case SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/no_case.cpp)
bcm_test(NAME spirit_test_qi_no_skip SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/no_skip.cpp)
bcm_test(NAME spirit_test_qi_not_predicate SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/not_predicate.cpp)
bcm_test(NAME spirit_test_qi_optional SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/optional.cpp)
bcm_test(NAME spirit_test_qi_parse_attr SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/parse_attr.cpp)
bcm_test(NAME spirit_test_qi_pass_container1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/pass_container1.cpp)
bcm_test(NAME spirit_test_qi_pass_container2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/pass_container2.cpp)
bcm_test(NAME spirit_test_qi_permutation SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/permutation.cpp)
bcm_test(NAME spirit_test_qi_plus SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/plus.cpp)
bcm_test(NAME spirit_test_qi_range_run SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/range_run.cpp)
bcm_test(NAME spirit_test_qi_raw SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/raw.cpp)
bcm_test(NAME spirit_test_qi_real1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/real1.cpp)
bcm_test(NAME spirit_test_qi_real2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/real2.cpp)
bcm_test(NAME spirit_test_qi_real3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/real3.cpp)
bcm_test(NAME spirit_test_qi_real4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/real4.cpp)
bcm_test(NAME spirit_test_qi_real5 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/real5.cpp)
bcm_test(NAME spirit_test_qi_repeat SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/repeat.cpp)
bcm_test(NAME spirit_test_qi_rule1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/rule1.cpp)
bcm_test(NAME spirit_test_qi_rule2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/rule2.cpp)
bcm_test(NAME spirit_test_qi_rule3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/rule3.cpp)
bcm_test(NAME spirit_test_qi_rule4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/rule4.cpp)
bcm_test(NAME spirit_test_qi_sequence SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/sequence.cpp)
bcm_test(NAME spirit_test_qi_sequential_or SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/sequential_or.cpp)
bcm_test(NAME spirit_test_qi_skip SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/skip.cpp)
bcm_test(NAME spirit_test_qi_stream SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/stream.cpp)
bcm_test(NAME spirit_test_qi_symbols1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/symbols1.cpp)
bcm_test(NAME spirit_test_qi_symbols2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/symbols2.cpp)
bcm_test(NAME spirit_test_qi_terminal_ex SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/terminal_ex.cpp)
bcm_test(NAME spirit_test_qi_tst SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/tst.cpp)
bcm_test(NAME spirit_test_qi_uint1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/uint1.cpp)
bcm_test(NAME spirit_test_qi_uint2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/uint2.cpp)
bcm_test(NAME spirit_test_qi_uint3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/uint3.cpp)
bcm_test(NAME spirit_test_qi_uint_radix SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/uint_radix.cpp)
bcm_test(NAME spirit_test_qi_utree1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/utree1.cpp)
bcm_test(NAME spirit_test_qi_utree2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/utree2.cpp)
bcm_test(NAME spirit_test_qi_utree3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/utree3.cpp)
bcm_test(NAME spirit_test_qi_utree4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/utree4.cpp)

###########################################################################


#[ run qi/regression_float_fraction.cpp                      : : : : qi_regression_float_fraction ]
bcm_test(NAME spirit_test_qi_pass_container3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/pass_container3.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_qi_regression_attr_with_action SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_attr_with_action.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_qi_regression_container_attribute SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_container_attribute.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_qi_regression_debug_optional SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_debug_optional.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_qi_regression_fusion_proto_spirit SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_fusion_proto_spirit.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_qi_regression_one_element_fusion_sequence SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_one_element_fusion_sequence.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_qi_regression_one_element_sequence_attribute SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_one_element_sequence_attribute.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_qi_regression_adapt_adt SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_adapt_adt.cpp)
bcm_test(NAME spirit_test_qi_regression_clear SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_clear.cpp)
bcm_test(NAME spirit_test_qi_regression_lazy_repeat SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_lazy_repeat.cpp)
bcm_test(NAME spirit_test_qi_regression_numeric_alternatives SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_numeric_alternatives.cpp)
bcm_test(NAME spirit_test_qi_regression_reorder SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_reorder.cpp)
bcm_test(NAME spirit_test_qi_regression_repeat SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_repeat.cpp)
bcm_test(NAME spirit_test_qi_regression_transform_assignment SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_transform_assignment.cpp)
bcm_test(NAME spirit_test_qi_regression_binary_action SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_binary_action.cpp)
bcm_test(NAME spirit_test_qi_regression_stream_eof SOURCES ${CMAKE_WORKSPACE_SOURCE}/qi/regression_stream_eof.cpp)

###########################################################################


bcm_test(NAME spirit_test_karma_grammar_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/grammar_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME spirit_test_karma_rule_fail SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/rule_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME spirit_test_karma_actions SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/actions.cpp)
bcm_test(NAME spirit_test_karma_alternative1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/alternative1.cpp)
bcm_test(NAME spirit_test_karma_alternative2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/alternative2.cpp)
bcm_test(NAME spirit_test_karma_and_predicate SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/and_predicate.cpp)
bcm_test(NAME spirit_test_karma_attribute SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/attribute.cpp)
bcm_test(NAME spirit_test_karma_auto1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/auto1.cpp)
bcm_test(NAME spirit_test_karma_auto2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/auto2.cpp)
bcm_test(NAME spirit_test_karma_auto3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/auto3.cpp)
bcm_test(NAME spirit_test_karma_binary1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/binary1.cpp)
bcm_test(NAME spirit_test_karma_binary2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/binary2.cpp)
bcm_test(NAME spirit_test_karma_binary3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/binary3.cpp)
bcm_test(NAME spirit_test_karma_bool SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/bool.cpp)
bcm_test(NAME spirit_test_karma_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/buffer.cpp)
bcm_test(NAME spirit_test_karma_case_handling1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/case_handling1.cpp)
bcm_test(NAME spirit_test_karma_case_handling2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/case_handling2.cpp)
bcm_test(NAME spirit_test_karma_case_handling3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/case_handling3.cpp)
bcm_test(NAME spirit_test_karma_center_alignment SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/center_alignment.cpp)
bcm_test(NAME spirit_test_karma_char1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/char1.cpp)
bcm_test(NAME spirit_test_karma_char2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/char2.cpp)
bcm_test(NAME spirit_test_karma_char3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/char3.cpp)
bcm_test(NAME spirit_test_karma_char_class SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/char_class.cpp)
bcm_test(NAME spirit_test_karma_columns SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/columns.cpp)
bcm_test(NAME spirit_test_karma_debug SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/debug.cpp)
bcm_test(NAME spirit_test_karma_delimiter SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/delimiter.cpp)
bcm_test(NAME spirit_test_karma_duplicate SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/duplicate.cpp)
bcm_test(NAME spirit_test_karma_encoding SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/encoding.cpp)
bcm_test(NAME spirit_test_karma_eol SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/eol.cpp)
bcm_test(NAME spirit_test_karma_eps SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/eps.cpp)
bcm_test(NAME spirit_test_karma_format_manip SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/format_manip.cpp)
bcm_test(NAME spirit_test_karma_format_manip_attr SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/format_manip_attr.cpp)
bcm_test(NAME spirit_test_karma_format_pointer_container SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/format_pointer_container.cpp)
bcm_test(NAME spirit_test_karma_generate_attr SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/generate_attr.cpp)
bcm_test(NAME spirit_test_karma_grammar SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/grammar.cpp)
bcm_test(NAME spirit_test_karma_int1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/int1.cpp)
bcm_test(NAME spirit_test_karma_int2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/int2.cpp)
bcm_test(NAME spirit_test_karma_int3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/int3.cpp)
bcm_test(NAME spirit_test_karma_kleene SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/kleene.cpp)
bcm_test(NAME spirit_test_karma_lazy SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/lazy.cpp)
bcm_test(NAME spirit_test_karma_left_alignment SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/left_alignment.cpp)
bcm_test(NAME spirit_test_karma_list SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/list.cpp)
bcm_test(NAME spirit_test_karma_lit SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/lit.cpp)
bcm_test(NAME spirit_test_karma_maxwidth SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/maxwidth.cpp)
bcm_test(NAME spirit_test_karma_not_predicate SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/not_predicate.cpp)
bcm_test(NAME spirit_test_karma_omit SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/omit.cpp)
bcm_test(NAME spirit_test_karma_optional SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/optional.cpp)
bcm_test(NAME spirit_test_karma_pattern1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/pattern1.cpp)
bcm_test(NAME spirit_test_karma_pattern2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/pattern2.cpp)
bcm_test(NAME spirit_test_karma_pattern3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/pattern3.cpp)
bcm_test(NAME spirit_test_karma_pattern4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/pattern4.cpp)
bcm_test(NAME spirit_test_karma_plus SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/plus.cpp)
bcm_test(NAME spirit_test_karma_real1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/real1.cpp)
bcm_test(NAME spirit_test_karma_real2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/real2.cpp)
bcm_test(NAME spirit_test_karma_real3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/real3.cpp)
bcm_test(NAME spirit_test_karma_repeat1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/repeat1.cpp)
bcm_test(NAME spirit_test_karma_repeat2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/repeat2.cpp)
bcm_test(NAME spirit_test_karma_right_alignment SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/right_alignment.cpp)
bcm_test(NAME spirit_test_karma_sequence1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/sequence1.cpp)
bcm_test(NAME spirit_test_karma_sequence2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/sequence2.cpp)
bcm_test(NAME spirit_test_karma_stream SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/stream.cpp)
bcm_test(NAME spirit_test_karma_symbols1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/symbols1.cpp)
bcm_test(NAME spirit_test_karma_symbols2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/symbols2.cpp)
bcm_test(NAME spirit_test_karma_symbols3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/symbols3.cpp)
bcm_test(NAME spirit_test_karma_tricky_alignment SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/tricky_alignment.cpp)
bcm_test(NAME spirit_test_karma_uint_radix SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/uint_radix.cpp)
bcm_test(NAME spirit_test_karma_utree1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/utree1.cpp)
bcm_test(NAME spirit_test_karma_utree2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/utree2.cpp)
bcm_test(NAME spirit_test_karma_utree3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/utree3.cpp)
bcm_test(NAME spirit_test_karma_wstream SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/wstream.cpp)

###########################################################################


bcm_test(NAME spirit_test_regression_const_real_policies SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_const_real_policies.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_karma_regression_adapt_adt SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_adapt_adt.cpp)
bcm_test(NAME spirit_test_karma_regression_optional_double SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_optional_double.cpp)
bcm_test(NAME spirit_test_karma_regression_semantic_action_attribute SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_semantic_action_attribute.cpp)
bcm_test(NAME spirit_test_karma_regression_real_scientific SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_real_scientific.cpp)
bcm_test(NAME spirit_test_karma_regression_center_alignment SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_center_alignment.cpp)
bcm_test(NAME spirit_test_karma_regression_container_variant_sequence SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_container_variant_sequence.cpp)
bcm_test(NAME spirit_test_karma_regression_real_0 SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_real_0.cpp)
bcm_test(NAME spirit_test_karma_regression_unicode_char SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_unicode_char.cpp)
bcm_test(NAME spirit_test_karma_regression_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/karma/regression_iterator.cpp)

###########################################################################


bcm_test(NAME spirit_test_lex_auto_switch_lexerstate SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/auto_switch_lexerstate.cpp)
bcm_test(NAME spirit_test_lex_dedent_handling_phoenix SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/dedent_handling_phoenix.cpp)
bcm_test(NAME spirit_test_lex_id_type_enum SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/id_type_enum.cpp)
bcm_test(NAME spirit_test_lex_lexertl1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/lexertl1.cpp)
bcm_test(NAME spirit_test_lex_lexertl2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/lexertl2.cpp)
bcm_test(NAME spirit_test_lex_lexertl3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/lexertl3.cpp)
bcm_test(NAME spirit_test_lex_lexertl4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/lexertl4.cpp)
bcm_test(NAME spirit_test_lex_lexertl5 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/lexertl5.cpp)
bcm_test(NAME spirit_test_lex_lexer_state_switcher SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/lexer_state_switcher.cpp)
bcm_test(NAME spirit_test_lex_semantic_actions SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/semantic_actions.cpp)
bcm_test(NAME spirit_test_lex_set_token_value SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/set_token_value.cpp)
bcm_test(NAME spirit_test_lex_set_token_value_phoenix SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/set_token_value_phoenix.cpp)
bcm_test(NAME spirit_test_lex_state_switcher SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/state_switcher.cpp)
bcm_test(NAME spirit_test_lex_string_token_id SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/string_token_id.cpp)
bcm_test(NAME spirit_test_lex_token_iterpair SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/token_iterpair.cpp)
bcm_test(NAME spirit_test_lex_token_moretypes SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/token_moretypes.cpp)
bcm_test(NAME spirit_test_lex_token_omit SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/token_omit.cpp)
bcm_test(NAME spirit_test_lex_token_onetype SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/token_onetype.cpp)

###########################################################################

#     [ run lex/regression_matlib_static.cpp : : :
#       <phoenix_v3>on:<dependency>.//lex_regression_matlib_generate-p3
#       <phoenix_v3>off:<dependency>.//lex_regression_matlib_generate-p2
#       : lex_regression_matlib_static ]
#     [ run lex/regression_matlib_switch.cpp : : :
#       <phoenix_v3>on:<dependency>.//lex_regression_matlib_generate_switch-p3
#       <phoenix_v3>off:<dependency>.//lex_regression_matlib_generate_switch-p2
#         : lex_regression_matlib_switch ]

bcm_test(NAME spirit_test_lex_regression_basic_lexer SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_basic_lexer.cpp)
bcm_test(NAME spirit_test_lex_regression_matlib_dynamic SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_matlib_dynamic.cpp)
bcm_test(NAME spirit_test_lex_regression_matlib_generate SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_matlib_generate.cpp)
bcm_test(NAME spirit_test_lex_regression_matlib_generate_switch SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_matlib_generate_switch.cpp)
bcm_test(NAME spirit_test_lex_regression_word_count SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_word_count.cpp)
bcm_test(NAME spirit_test_lex_regression_syntax_error SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_syntax_error.cpp)
bcm_test(NAME spirit_test_lex_regression_wide SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_wide.cpp)
bcm_test(NAME spirit_test_lex_regression_file_iterator1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_file_iterator1.cpp)
bcm_test(NAME spirit_test_lex_regression_file_iterator2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_file_iterator2.cpp)
bcm_test(NAME spirit_test_lex_regression_file_iterator3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_file_iterator3.cpp)
bcm_test(NAME spirit_test_lex_regression_file_iterator4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_file_iterator4.cpp)
bcm_test(NAME spirit_test_regression_static_wide_6253 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_static_wide_6253.cpp)
bcm_test(NAME spirit_test_regression_less_8563 SOURCES ${CMAKE_WORKSPACE_SOURCE}/lex/regression_less_8563.cpp)

###########################################################################


bcm_test(NAME spirit_test_support_utree SOURCES ${CMAKE_WORKSPACE_SOURCE}/support/utree.cpp)
bcm_test(NAME spirit_test_support_utree_debug SOURCES ${CMAKE_WORKSPACE_SOURCE}/support/utree_debug.cpp)

###########################################################################


bcm_test(NAME spirit_test_support_regression_multi_pass_position_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/support/regression_multi_pass_position_iterator.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_support_regression_multi_pass_functor SOURCES ${CMAKE_WORKSPACE_SOURCE}/support/regression_multi_pass_functor.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_support_regression_multi_pass_parse SOURCES ${CMAKE_WORKSPACE_SOURCE}/support/regression_multi_pass_parse.cpp COMPILE_ONLY)
bcm_test(NAME spirit_test_regression_multi_pass_error_handler SOURCES ${CMAKE_WORKSPACE_SOURCE}/support/regression_multi_pass_error_handler.cpp)

# use this alias to build Spirit against Phoenix V3

include_directories(${CMAKE_WORKSPACE_SOURCE})
include_directories(${CMAKE_WORKSPACE_SOURCE}/karma)
