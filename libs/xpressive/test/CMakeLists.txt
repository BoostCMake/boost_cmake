include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_xpressive
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# Turn off debug symbols on MSVC to bring down the size of object files
#        <toolset>gcc:<cxxflags>-W
#        <toolset>gcc:<cxxflags>-Wall
#        <toolset>msvc:<cxxflags>-W4


cm_test(NAME xpressive_test_regress SOURCES ${CMAKE_CURRENT_BINARY_DIR}/regress.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_regress_u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/regress_u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_c_traits SOURCES ${CMAKE_CURRENT_BINARY_DIR}/c_traits.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_c_traits_u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/c_traits_u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test1 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test1.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test2 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test2.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test3 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test3.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test4 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test4.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test5 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test5.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test6 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test6.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test7 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test7.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test8 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test8.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test9 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test9.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test10 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test10.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test11 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test11.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test1u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test1u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test2u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test2u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test3u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test3u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test4u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test4u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test5u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test5u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test6u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test6u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test7u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test7u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test8u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test8u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test9u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test9u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test10u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test10u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test11u SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test11u.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_misc1 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/misc1.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_misc2 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/misc2.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_format SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_format.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_cycles SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_cycles.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_non_char SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_non_char.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_static SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_static.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_actions SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_actions.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_assert SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_assert.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_assert_with_placeholder SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_assert_with_placeholder.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_symbols SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_symbols.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_dynamic SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_dynamic.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_dynamic_grammar SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_dynamic_grammar.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_test_skip SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_skip.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME xpressive_test_multiple_defs1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/multiple_defs1.cpp ${CURRENT_TEST_SOURCES_DIR}/multiple_defs2.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_basic_regex SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_basic_regex.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_match_results SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_match_results.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_regex_algorithms SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_regex_algorithms.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_regex_compiler SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_regex_compiler.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_regex_constants SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_regex_constants.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_regex_error SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_regex_error.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_regex_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_regex_iterator.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_regex_primitives SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_regex_primitives.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_regex_token_iterator SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_regex_token_iterator.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_regex_traits SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_regex_traits.cpp COMPILE_ONLY)
cm_test(NAME xpressive_test_test_sub_match SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_sub_match.cpp COMPILE_ONLY)
#         [ compile test_typeof.cpp ]
#         [ compile test_typeof2.cpp ]
