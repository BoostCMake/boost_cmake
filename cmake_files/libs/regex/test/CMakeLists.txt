include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_align)
find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_range)
find_package(${CMAKE_WORKSPACE_NAME}_array)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_regex
                        boost::align
                        boost::test
                        boost::thread
                        boost::detail
                        boost::timer
                        boost::range
                        boost::array
                        boost::lexical_cast
                        boost::config
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
# bcm_test(NAME $(name) SOURCES $(sources))

# sources
set(R_SOURCE
        ${CMAKE_WORKSPACE_SOURCE}/regress/basic_tests.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/main.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_alt.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_anchors.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_asserts.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_backrefs.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_deprecated.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_emacs.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_escapes.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_grep.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_locale.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_mfc.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_non_greedy_repeats.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_perl_ex.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_replace.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_sets.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_simple_repeats.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_tricky_cases.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_icu.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_unicode.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_overloads.cpp
        ${CMAKE_WORKSPACE_SOURCE}/regress/test_operators.cpp
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
# bcm_mark_as_test(${CMAKE_WORKSPACE_NAME}_regex_recursive)

#c_compiler_checks
bcm_test(NAME regex_test_c_compiler_checks_posix_api_check_c SOURCES ${CMAKE_WORKSPACE_SOURCE}/c_compiler_checks/posix_api_check.c)
bcm_test(NAME regex_test_c_compiler_checks_posix_api_check SOURCES ${CMAKE_WORKSPACE_SOURCE}/c_compiler_checks/posix_api_check.cpp)
bcm_test(NAME regex_test_c_compiler_checks_wide_posix_api_check_c SOURCES ${CMAKE_WORKSPACE_SOURCE}/c_compiler_checks/wide_posix_api_check.c COMPILE_ONLY)
bcm_test(NAME regex_test_c_compiler_checks_wide_posix_api_check SOURCES ${CMAKE_WORKSPACE_SOURCE}/c_compiler_checks/wide_posix_api_check.cpp)

#captures
bcm_test(NAME regex_test_captures_captures_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/captures/captures_test.cpp NEED_PATCH)
target_compile_definitions(regex_test_captures_captures_test PUBLIC BOOST_REGEX_NO_LIB=1 BOOST_REGEX_MATCH_EXTRA=1)

#collate_info
bcm_test(NAME regex_test_collate_info_collate_info SOURCES ${CMAKE_WORKSPACE_SOURCE}/collate_info/collate_info.cpp)

#concepts
bcm_test(NAME regex_test_concepts_concept_check SOURCES ${CMAKE_WORKSPACE_SOURCE}/concepts/concept_check.cpp COMPILE_ONLY)
bcm_test(NAME regex_test_concepts_icu_concept_check SOURCES ${CMAKE_WORKSPACE_SOURCE}/concepts/icu_concept_check.cpp COMPILE_ONLY)

#config_info
bcm_test(NAME regex_test_config_info_regex_config_info SOURCES ${CMAKE_WORKSPACE_SOURCE}/config_info/regex_config_info.cpp)
workspace_src (${CMAKE_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE_DIR)
target_include_directories(regex_test_config_info_regex_config_info PRIVATE ${CMAKE_WORKSPACE_SOURCE_DIR})

#named_subexpressions
bcm_test(NAME regex_test_named_subexpressions_named_subexpressions_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/named_subexpressions/named_subexpressions_test.cpp NEED_PATCH)

#object_cache
bcm_test(NAME regex_test_object_cache_object_cache_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/object_cache/object_cache_test.cpp NEED_PATCH)

#pathology
bcm_test(NAME regex_test_pathology_bad_expression_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/pathology/bad_expression_test.cpp NEED_PATCH)
bcm_test(NAME regex_test_pathology_recursion_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/pathology/recursion_test.cpp NEED_PATCH)

#regress
bcm_test(NAME regex_test_regress SOURCES ${R_SOURCE})
bcm_test(NAME regex_test_regress_threaded SOURCES ${R_SOURCE})
target_compile_definitions(regex_test_regress_threaded PUBLIC TEST_THREADS)

#static_mutex
bcm_test(NAME regex_test_static_mutex_static_mutex_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/static_mutex/static_mutex_test.cpp)

#unicode
bcm_test(NAME regex_test_unicode_iterator_test_utf8 SOURCES ${CMAKE_WORKSPACE_SOURCE}/unicode/unicode_iterator_test.cpp NEED_PATCH)
target_compile_definitions(regex_test_unicode_iterator_test_utf8 PUBLIC TEST_UTF8)
bcm_test(NAME regex_test_unicode_iterator_test_utf16 SOURCES ${CMAKE_WORKSPACE_SOURCE}/unicode/unicode_iterator_test.cpp NEED_PATCH)
target_compile_definitions(regex_test_unicode_iterator_test_utf16 PUBLIC TEST_UTF16)


# bcm_test(NAME config_info_regex_config_info SOURCES ${CMAKE_WORKSPACE_SOURCE}/config_info/regex_config_info.cpp NEED_PATCH)
# bcm_test(NAME regex_dll_config_info SOURCES ${CMAKE_WORKSPACE_SOURCE}/config_info/regex_config_info.cpp NEED_PATCH)
# bcm_test(NAME concepts_range_concept_check SOURCES ${CMAKE_WORKSPACE_SOURCE}/concepts/range_concept_check.cpp COMPILE_ONLY)
# bcm_test(NAME concepts_test_bug_11988 SOURCES ${CMAKE_WORKSPACE_SOURCE}/concepts/test_bug_11988.cpp)
# bcm_test(NAME regex_regress_recursive SOURCES ${R_SOURCE})
# target_compile_definitions(regex_regress_recursive PUBLIC BOOST_REGEX_RECURSIVE=1)
# target_link_libraries(regex_regress_recursive ${CMAKE_WORKSPACE_NAME}_regex_recursive)
# bcm_test(NAME regex_regress_noeh SOURCES ${R_SOURCE})
# set_target_properties(regex_regress_noeh PROPERTIES CXX_EXCEPTIONS off)
# target_compile_definitions(regex_regress_noeh PUBLIC BOOST_NO_EXCEPTIONS=1)
bcm_test(NAME regex_test_test_consolidated SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_consolidated.cpp COMPILE_ONLY)




