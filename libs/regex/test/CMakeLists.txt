include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

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

# sources
set(R_SOURCE
        ${CURRENT_TEST_SOURCES_DIR}/regress/basic_tests.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/main.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_alt.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_anchors.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_asserts.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_backrefs.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_deprecated.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_emacs.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_escapes.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_grep.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_locale.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_mfc.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_non_greedy_repeats.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_perl_ex.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_replace.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_sets.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_simple_repeats.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_tricky_cases.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_icu.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_unicode.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_overloads.cpp
        ${CURRENT_TEST_SOURCES_DIR}/regress/test_operators.cpp
    )

set(${CMAKE_WORKSPACE_NAME}_regex_recursive
        ${CURRENT_TEST_SOURCES_DIR}/../src/c_regex_traits.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/cpp_regex_traits.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/cregex.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/fileiter.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/icu.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/instances.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/posix_api.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/regex.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/regex_debug.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/regex_raw_buffer.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/regex_traits_defaults.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/static_mutex.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/w32_regex_traits.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/wc_regex_traits.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/wide_posix_api.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/winstances.cpp
        ${CURRENT_TEST_SOURCES_DIR}/../src/usinstances.cpp
)

cm_test(NAME regex_test_regress SOURCES ${R_SOURCE} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/regress)

cm_test(NAME regex_test_regress_threaded SOURCES ${R_SOURCE} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/regress)
target_compile_definitions( regex_test_regress_threaded PUBLIC -DTEST_THREADS)

#c_compiler_checks
cm_test(NAME regex_test_c_compiler_checks_posix_api_check_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/c_compiler_checks/posix_api_check.c)
cm_test(NAME regex_test_c_compiler_checks_posix_api_check SOURCES ${CURRENT_TEST_SOURCES_DIR}/c_compiler_checks/posix_api_check.cpp)
cm_test(NAME regex_test_c_compiler_checks_wide_posix_api_check_c SOURCES ${CURRENT_TEST_SOURCES_DIR}/c_compiler_checks/wide_posix_api_check.c COMPILE_ONLY)
cm_test(NAME regex_test_c_compiler_checks_wide_posix_api_check SOURCES ${CURRENT_TEST_SOURCES_DIR}/c_compiler_checks/wide_posix_api_check.cpp)

#pathology
cm_test(NAME regex_test_pathology_bad_expression_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/pathology/bad_expression_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/pathology)
cm_test(NAME regex_test_pathology_recursion_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/pathology/recursion_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/pathology)

#captures
cm_test(NAME regex_test_captures_captures_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/captures/captures_test.cpp  SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/captures)
target_compile_definitions(regex_test_captures_captures_test PUBLIC BOOST_REGEX_NO_LIB=1 BOOST_REGEX_MATCH_EXTRA=1)

#collate_info
cm_test(NAME regex_test_collate_info_collate_info SOURCES ${CURRENT_TEST_SOURCES_DIR}/collate_info/collate_info.cpp)

#concepts
cm_test(NAME regex_test_concepts_concept_check SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/concept_check.cpp COMPILE_ONLY)
cm_test(NAME regex_test_concepts_icu_concept_check SOURCES ${CURRENT_TEST_SOURCES_DIR}/concepts/icu_concept_check.cpp COMPILE_ONLY)

#config_info
cm_test(NAME regex_test_config_info_regex_config_info SOURCES ${CMAKE_CURRENT_BINARY_DIR}/config_info/regex_config_info.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

target_include_directories(regex_test_config_info_regex_config_info PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

#named_subexpressions
cm_test(NAME regex_test_named_subexpressions_named_subexpressions_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/named_subexpressions/named_subexpressions_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/named_subexpressions)

#object_cache
cm_test(NAME regex_test_object_cache_object_cache_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/object_cache/object_cache_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/object_cache)

#static_mutex
cm_test(NAME regex_test_static_mutex_static_mutex_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/static_mutex/static_mutex_test.cpp)

#unicode
cm_test(NAME regex_test_unicode_iterator_test_utf8 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/unicode/unicode_iterator_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/unicode)
target_compile_definitions(regex_test_unicode_iterator_test_utf8 PUBLIC TEST_UTF8)
cm_test(NAME regex_test_unicode_iterator_test_utf16 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/unicode/unicode_iterator_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/unicode)
target_compile_definitions(regex_test_unicode_iterator_test_utf16 PUBLIC TEST_UTF16)

cm_test(NAME regex_test_regress_recursive SOURCES ${R_SOURCE} ${${CMAKE_WORKSPACE_NAME}_regex_recursive} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/regress)
target_compile_definitions( regex_test_regress_recursive PUBLIC -DBOOST_REGEX_RECURSIVE=1)

cm_test(NAME regex_test_regress_noeh SOURCES ${R_SOURCE} SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR}/regress)
target_compile_definitions( regex_test_regress_noeh PUBLIC -DBOOST_NO_EXCEPTIONS=1)

cm_test(NAME regex_test_test_consolidated SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_consolidated.cpp COMPILE_ONLY)
