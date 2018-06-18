include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_align)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_regex
                       ${CMAKE_WORKSPACE_NAME}::align
                       ${CMAKE_WORKSPACE_NAME}::test
                       ${CMAKE_WORKSPACE_NAME}::thread
                       ${CMAKE_WORKSPACE_NAME}::detail
                       ${CMAKE_WORKSPACE_NAME}::timer
                       ${CMAKE_WORKSPACE_NAME}::range
                       ${CMAKE_WORKSPACE_NAME}::array
                       ${CMAKE_WORKSPACE_NAME}::lexical_cast
                       ${CMAKE_WORKSPACE_NAME}::config
                       )

# copyright John Maddock 2003
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt.

# There are unidentified linker problems on these platforms:
#<toolset>gcc-mw:<link>static
#<toolset>gcc-mingw:<link>static

#
# rule for simple regex test programs:
#
# cm_test(NAME $(name) SOURCES $(sources))

# sources
set(R_SOURCE
    regress/basic_tests.cpp
    regress/main.cpp
    regress/test_alt.cpp
    regress/test_anchors.cpp
    regress/test_asserts.cpp
    regress/test_backrefs.cpp
    regress/test_deprecated.cpp
    regress/test_emacs.cpp
    regress/test_escapes.cpp
    regress/test_grep.cpp
    regress/test_locale.cpp
    regress/test_mfc.cpp
    regress/test_non_greedy_repeats.cpp
    regress/test_perl_ex.cpp
    regress/test_replace.cpp
    regress/test_sets.cpp
    regress/test_simple_repeats.cpp
    regress/test_tricky_cases.cpp
    regress/test_icu.cpp
    regress/test_unicode.cpp
    regress/test_overloads.cpp
    regress/test_operators.cpp
    )

# add_library(${CMAKE_WORKSPACE_NAME}_regex_recursive STATIC
#     ../src/c_regex_traits.cpp
#     ../src/cpp_regex_traits.cpp
#     ../src/cregex.cpp
#     ../src/fileiter.cpp
#     ../src/icu.cpp
#     ../src/instances.cpp
#     ../src/posix_api.cpp
#     ../src/regex.cpp
#     ../src/regex_debug.cpp
#     ../src/regex_raw_buffer.cpp
#     ../src/regex_traits_defaults.cpp
#     ../src/static_mutex.cpp
#     ../src/w32_regex_traits.cpp
#     ../src/wc_regex_traits.cpp
#     ../src/wide_posix_api.cpp
#     ../src/winstances.cpp
#     ../src/usinstances.cpp
# )
# target_compile_definitions(${CMAKE_WORKSPACE_NAME}_regex_recursive PUBLIC BOOST_REGEX_RECURSIVE=1)
# target_link_libraries(${CMAKE_WORKSPACE_NAME}_regex_recursive ${CMAKE_WORKSPACE_NAME}_regex)
# cm_mark_as_test(${CMAKE_WORKSPACE_NAME}_regex_recursive)

#c_compiler_checks
cm_test(NAME regex_test_c_compiler_checks_posix_api_check_c SOURCES c_compiler_checks/posix_api_check.c)
cm_test(NAME regex_test_c_compiler_checks_posix_api_check SOURCES c_compiler_checks/posix_api_check.cpp)
cm_test(NAME regex_test_c_compiler_checks_wide_posix_api_check_c SOURCES c_compiler_checks/wide_posix_api_check.c COMPILE_ONLY)
cm_test(NAME regex_test_c_compiler_checks_wide_posix_api_check SOURCES c_compiler_checks/wide_posix_api_check.cpp)

#captures
cm_test(NAME regex_test_captures_captures_test SOURCES files/captures/captures_test.cpp)
target_compile_definitions(regex_test_captures_captures_test PUBLIC BOOST_REGEX_NO_LIB=1 BOOST_REGEX_MATCH_EXTRA=1)

#collate_info
cm_test(NAME regex_test_collate_info_collate_info SOURCES collate_info/collate_info.cpp)

#concepts
cm_test(NAME regex_test_concepts_concept_check SOURCES concepts/concept_check.cpp COMPILE_ONLY)
cm_test(NAME regex_test_concepts_icu_concept_check SOURCES concepts/icu_concept_check.cpp COMPILE_ONLY)

#config_info
cm_test(NAME regex_test_config_info_regex_config_info SOURCES files/config_info/regex_config_info.cpp)

#named_subexpressions
cm_test(NAME regex_test_named_subexpressions_named_subexpressions_test SOURCES files/named_subexpressions/named_subexpressions_test.cpp)

#object_cache
cm_test(NAME regex_test_object_cache_object_cache_test SOURCES files/object_cache/object_cache_test.cpp)

#pathology
cm_test(NAME regex_test_pathology_bad_expression_test SOURCES files/pathology/bad_expression_test.cpp)
cm_test(NAME regex_test_pathology_recursion_test SOURCES files/pathology/recursion_test.cpp)

#regress
cm_test(NAME regex_test_regress SOURCES ${R_SOURCE})
cm_test(NAME regex_test_regress_threaded SOURCES ${R_SOURCE})
target_compile_definitions(regex_test_regress_threaded PUBLIC TEST_THREADS)

#static_mutex
cm_test(NAME regex_test_static_mutex_static_mutex_test SOURCES static_mutex/static_mutex_test.cpp)

#unicode
cm_test(NAME regex_test_unicode_iterator_test_utf8 SOURCES files/unicode/unicode_iterator_test.cpp)
target_compile_definitions(regex_test_unicode_iterator_test_utf8 PUBLIC TEST_UTF8)
cm_test(NAME regex_test_unicode_iterator_test_utf16 SOURCES files/unicode/unicode_iterator_test.cpp)
target_compile_definitions(regex_test_unicode_iterator_test_utf16 PUBLIC TEST_UTF16)


# cm_test(NAME config_info_regex_config_info SOURCES config_info/regex_config_info.cpp)
# cm_test(NAME regex_dll_config_info SOURCES config_info/regex_config_info.cpp)
# cm_test(NAME concepts_range_concept_check SOURCES concepts/range_concept_check.cpp COMPILE_ONLY)
# cm_test(NAME concepts_test_bug_11988 SOURCES concepts/test_bug_11988.cpp)
# cm_test(NAME regex_regress_recursive SOURCES ${R_SOURCE})
# target_compile_definitions(regex_regress_recursive PUBLIC BOOST_REGEX_RECURSIVE=1)
# target_link_libraries(regex_regress_recursive ${CMAKE_WORKSPACE_NAME}_regex_recursive)
# cm_test(NAME regex_regress_noeh SOURCES ${R_SOURCE})
# set_target_properties(regex_regress_noeh PROPERTIES CXX_EXCEPTIONS off)
# target_compile_definitions(regex_regress_noeh PUBLIC BOOST_NO_EXCEPTIONS=1)
cm_test(NAME regex_test_test_consolidated SOURCES test_consolidated.cpp COMPILE_ONLY)




