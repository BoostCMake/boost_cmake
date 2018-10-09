include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_chrono)
find_package(${CMAKE_WORKSPACE_NAME}_interprocess)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_icl
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::chrono
                        ${CMAKE_WORKSPACE_NAME}::interprocess
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# (C) Copyright 2008-2011: Joachim Faulhaber
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# HACK: Workaround broken includes
configure_file(${CURRENT_TEST_SOURCES_DIR}/disable_test_warnings.hpp ${CMAKE_CURRENT_BINARY_DIR}/include/libs/icl/test/disable_test_warnings.hpp @ONLY)
configure_file(${CURRENT_TEST_SOURCES_DIR}/chrono/utility.hpp ${CMAKE_CURRENT_BINARY_DIR}/include/libs/icl/test/chrono/utility.hpp @ONLY)
add_library(icl_test_include_workaround INTERFACE)
target_include_directories(icl_test_include_workaround INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)
cm_test_link_libraries(icl_test_include_workaround)

# interval
cm_test(NAME fastest_icl_interval__fastest_icl_interval SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_icl_interval_/fastest_icl_interval.cpp)

# sets
cm_test(NAME icl_test_fastest_interval_set__fastest_interval_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_set_/fastest_interval_set.cpp)
cm_test(NAME icl_test_fastest_interval_set_infix__fastest_interval_set_infix SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_set_infix_/fastest_interval_set_infix.cpp)

cm_test(NAME icl_test_fastest_separate_interval_set__fastest_separate_interval_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_separate_interval_set_/fastest_separate_interval_set.cpp)
cm_test(NAME icl_test_fastest_separate_interval_set_infix__fastest_separate_interval_set_infix SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_separate_interval_set_infix_/fastest_separate_interval_set_infix.cpp)

cm_test(NAME icl_test_fastest_split_interval_set__fastest_split_interval_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_split_interval_set_/fastest_split_interval_set.cpp)
cm_test(NAME icl_test_fastest_split_interval_set_infix__fastest_split_interval_set_infix SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_split_interval_set_infix_/fastest_split_interval_set_infix.cpp)

cm_test(NAME icl_test_fastest_interval_set_mixed__fastest_interval_set_mixed SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_set_mixed_/fastest_interval_set_mixed.cpp)

# maps
cm_test(NAME icl_test_fastest_interval_map__fastest_interval_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_/fastest_interval_map.cpp)

cm_test(NAME icl_test_fast_stat_interval_map__fast_stat_interval_map_right_open SOURCES ${CURRENT_TEST_SOURCES_DIR}/fast_stat_interval_map_/fast_stat_interval_map.cpp)
cm_test(NAME icl_test_fast_stat_interval_map__fast_stat_interval_map_left_open SOURCES ${CURRENT_TEST_SOURCES_DIR}/fast_stat_interval_map_/fast_stat_interval_map.cpp)
target_compile_definitions(icl_test_fast_stat_interval_map__fast_stat_interval_map_left_open PUBLIC BOOST_ICL_CONTINUOUS_STATIC_INTERVAL_DEFAULT=left_open_interval)

cm_test(NAME icl_test_fastest_interval_map_infix__fastest_interval_map_infix SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_infix_/fastest_interval_map_infix.cpp)
cm_test(NAME icl_test_fastest_split_interval_map__fastest_split_interval_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_split_interval_map_/fastest_split_interval_map.cpp)
cm_test(NAME icl_test_fastest_split_interval_map_infix__fastest_split_interval_map_infix SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_split_interval_map_infix_/fastest_split_interval_map_infix.cpp)
cm_test(NAME icl_test_fastest_interval_map_mixed__fastest_interval_map_mixed SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_mixed_/fastest_interval_map_mixed.cpp)
cm_test(NAME icl_test_fastest_interval_map_mixed2__fastest_interval_map_mixed2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_mixed2_/fastest_interval_map_mixed2.cpp)
cm_test(NAME icl_test_fastest_interval_map_infix_mixed__fastest_interval_map_infix_mixed SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_infix_mixed_/fastest_interval_map_infix_mixed.cpp)
cm_test(NAME icl_test_fastest_icl_map__fastest_icl_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_icl_map_/fastest_icl_map.cpp)

# handcoded tests using laws (not LaBatea) -------------------------------
# Concept Set
cm_test(NAME icl_test_fastest_set_interval_set__fastest_set_interval_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_set_interval_set_/fastest_set_interval_set.cpp)
cm_test(NAME icl_test_fastest_set_icl_set__fastest_set_icl_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_set_icl_set_/fastest_set_icl_set.cpp)

# Concept Map
cm_test(NAME icl_test_fastest_partial_interval_quantifier__fastest_partial_interval_quantifier SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_partial_interval_quantifier_/fastest_partial_interval_quantifier.cpp)
cm_test(NAME icl_test_fastest_total_interval_quantifier__fastest_total_interval_quantifier SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_total_interval_quantifier_/fastest_total_interval_quantifier.cpp)
cm_test(NAME icl_test_fastest_partial_icl_quantifier__fastest_partial_icl_quantifier SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_partial_icl_quantifier_/fastest_partial_icl_quantifier.cpp)
cm_test(NAME icl_test_fastest_total_icl_quantifier__fastest_total_icl_quantifier SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_total_icl_quantifier_/fastest_total_icl_quantifier.cpp)

# Misc -------------------------------------------------------------------
cm_test(NAME icl_test_test_misc__test_misc SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_misc_/test_misc.cpp)
cm_test(NAME icl_test_test_doc_code__test_doc_code SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_doc_code_/test_doc_code.cpp)
cm_test(NAME icl_test_test_type_traits__test_type_traits SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_type_traits_/test_type_traits.cpp)
# test_combinable is too slow or too large for some compilers
# cm_test(NAME icl_test_test_combinable__test_combinable SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_combinable_/test_combinable.cpp)
cm_test(NAME icl_test_test_changing_interval_defaults__test_changing_interval_defaults SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_changing_interval_defaults_/test_changing_interval_defaults.cpp)

# Bug fixes --------------------------------------------------------------
cm_test(NAME icl_test_fix_icl_after_thread__fix_icl_after_thread SOURCES ${CURRENT_TEST_SOURCES_DIR}/fix_icl_after_thread_/fix_icl_after_thread.cpp)
cm_test(NAME icl_test_fix_tickets__fix_tickets SOURCES ${CURRENT_TEST_SOURCES_DIR}/fix_tickets_/fix_tickets.cpp)

# Check for compiler bugs ------------------------------------------------
# compile-fail-tests
cm_test(NAME icl_test_cmp_msvc_value_born_error__cmp_msvc_value_born_error SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp_msvc_value_born_error_/cmp_msvc_value_born_error.cpp)
cm_test(NAME icl_test_cmp_clang_ttp_passing__cmp_clang_ttp_passing SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp_clang_ttp_passing_/cmp_clang_ttp_passing.cpp)
cm_test(NAME icl_test_cmp_clang_ttp_passing2__cmp_clang_ttp_passing2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/cmp_clang_ttp_passing2_/cmp_clang_ttp_passing2.cpp)

# Examples ---------------------------------------------------------------
cm_test(NAME icl_test_ex_${CMAKE_WORKSPACE_NAME}_party__ex_${CMAKE_WORKSPACE_NAME}_party SOURCES ${CURRENT_TEST_SOURCES_DIR}/ex_${CMAKE_WORKSPACE_NAME}_party_/ex_${CMAKE_WORKSPACE_NAME}_party.cpp)

# Ad hoc -----------------------------------------------------------------
# cm_test(NAME icl_test_test_casual__test_casual SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_casual_/test_casual.cpp)

# ========================================================================
# Chrono -----------------------------------------------------------------
# interval
cm_test(NAME icl_test_fastest_icl_interval__fastest_icl_interval_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_icl_interval_/fastest_icl_interval.cpp)
target_compile_definitions(icl_test_fastest_icl_interval__fastest_icl_interval_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

# sets
cm_test(NAME icl_test_fastest_interval_set__fastest_interval_set_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_set_/fastest_interval_set.cpp)
target_compile_definitions(icl_test_fastest_interval_set__fastest_interval_set_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_interval_set_infix__fastest_interval_set_infix_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_set_infix_/fastest_interval_set_infix.cpp)
target_compile_definitions(icl_test_fastest_interval_set_infix__fastest_interval_set_infix_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_interval_set_mixed__fastest_interval_set_mixed_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_set_mixed_/fastest_interval_set_mixed.cpp)
target_compile_definitions(icl_test_fastest_interval_set_mixed__fastest_interval_set_mixed_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

# maps
cm_test(NAME icl_test_fastest_interval_map__fastest_interval_map_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_/fastest_interval_map.cpp)
target_compile_definitions(icl_test_fastest_interval_map__fastest_interval_map_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_interval_map_infix__fastest_interval_map_infix_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_infix_/fastest_interval_map_infix.cpp)
target_compile_definitions(icl_test_fastest_interval_map_infix__fastest_interval_map_infix_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_interval_map_mixed__fastest_interval_map_mixed_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_mixed_/fastest_interval_map_mixed.cpp)
target_compile_definitions(icl_test_fastest_interval_map_mixed__fastest_interval_map_mixed_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_interval_map_mixed2__fastest_interval_map_mixed2_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_mixed2_/fastest_interval_map_mixed2.cpp)
target_compile_definitions(icl_test_fastest_interval_map_mixed2__fastest_interval_map_mixed2_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_interval_map_infix_mixed__fastest_interval_map_infix_mixed_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_interval_map_infix_mixed_/fastest_interval_map_infix_mixed.cpp)
target_compile_definitions(icl_test_fastest_interval_map_infix_mixed__fastest_interval_map_infix_mixed_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_icl_map__fastest_icl_map_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_icl_map_/fastest_icl_map.cpp)
target_compile_definitions(icl_test_fastest_icl_map__fastest_icl_map_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

# handcoded tests using laws (not LaBatea) -------------------------------
# Concept Set
cm_test(NAME icl_test_fastest_set_interval_set__fastest_set_interval_set_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_set_interval_set_/fastest_set_interval_set.cpp)
target_compile_definitions(icl_test_fastest_set_interval_set__fastest_set_interval_set_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_set_icl_set__fastest_set_icl_set_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_set_icl_set_/fastest_set_icl_set.cpp)
target_compile_definitions(icl_test_fastest_set_icl_set__fastest_set_icl_set_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

# Concept Map
cm_test(NAME icl_test_fastest_partial_interval_quantifier__fastest_partial_interval_quantifier_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_partial_interval_quantifier_/fastest_partial_interval_quantifier.cpp)
target_compile_definitions(icl_test_fastest_partial_interval_quantifier__fastest_partial_interval_quantifier_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_total_interval_quantifier__fastest_total_interval_quantifier_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_total_interval_quantifier_/fastest_total_interval_quantifier.cpp)
target_compile_definitions(icl_test_fastest_total_interval_quantifier__fastest_total_interval_quantifier_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_partial_icl_quantifier__fastest_partial_icl_quantifier_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_partial_icl_quantifier_/fastest_partial_icl_quantifier.cpp)
target_compile_definitions(icl_test_fastest_partial_icl_quantifier__fastest_partial_icl_quantifier_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
cm_test(NAME icl_test_fastest_total_icl_quantifier__fastest_total_icl_quantifier_chrono SOURCES ${CURRENT_TEST_SOURCES_DIR}/fastest_total_icl_quantifier_/fastest_total_icl_quantifier.cpp)
target_compile_definitions(icl_test_fastest_total_icl_quantifier__fastest_total_icl_quantifier_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

