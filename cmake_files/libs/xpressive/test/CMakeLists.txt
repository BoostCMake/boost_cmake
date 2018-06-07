include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_xpressive
                        boost::test
                        boost::unit_test_framework
                        )

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# Turn off debug symbols on MSVC to bring down the size of object files
#        <toolset>gcc:<cxxflags>-W
#        <toolset>gcc:<cxxflags>-Wall
#        <toolset>msvc:<cxxflags>-W4

#         [ compile test_typeof.cpp ]
#         [ compile test_typeof2.cpp ]
bcm_test(NAME xpressive_test_regress SOURCES ${CMAKE_WORKSPACE_SOURCE}/regress.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_regress_u SOURCES ${CMAKE_WORKSPACE_SOURCE}/regress_u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_c_traits SOURCES ${CMAKE_WORKSPACE_SOURCE}/c_traits.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_c_traits_u SOURCES ${CMAKE_WORKSPACE_SOURCE}/c_traits_u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test1.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test2.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test3.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test4.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test5 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test5.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test6 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test6.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test7 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test7.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test8 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test8.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test9 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test9.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test10 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test10.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test11 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test11.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test1u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test1u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test2u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test2u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test3u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test3u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test4u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test4u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test5u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test5u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test6u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test6u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test7u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test7u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test8u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test8u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test9u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test9u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test10u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test10u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test11u SOURCES ${CMAKE_WORKSPACE_SOURCE}/test11u.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_misc1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/misc1.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_misc2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/misc2.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_format SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_format.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_cycles SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_cycles.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_non_char SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_non_char.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_static SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_static.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_actions SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_actions.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_assert SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_assert.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_assert_with_placeholder SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_assert_with_placeholder.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_symbols SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_symbols.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_dynamic SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_dynamic.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_dynamic_grammar SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_dynamic_grammar.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_test_skip SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_skip.cpp NEED_PATCH)
bcm_test(NAME xpressive_test_multiple_defs SOURCES ${CMAKE_WORKSPACE_SOURCE}/multiple_defs1.cpp ${CMAKE_WORKSPACE_SOURCE}/multiple_defs2.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_basic_regex SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_basic_regex.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_match_results SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_match_results.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_regex_algorithms SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_regex_algorithms.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_regex_compiler SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_regex_compiler.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_regex_constants SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_regex_constants.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_regex_error SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_regex_error.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_regex_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_regex_iterator.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_regex_primitives SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_regex_primitives.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_regex_token_iterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_regex_token_iterator.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_regex_traits SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_regex_traits.cpp COMPILE_ONLY)
bcm_test(NAME xpressive_test_test_sub_match SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_sub_match.cpp COMPILE_ONLY)