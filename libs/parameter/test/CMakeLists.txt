include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_graph)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter
                        ${CMAKE_WORKSPACE_NAME}::static_assert
                        ${CMAKE_WORKSPACE_NAME}::tuple
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::assert
                        ${CMAKE_WORKSPACE_NAME}::graph
                        )

# Copyright David Abrahams, Daniel Wallin 2006. Distributed under the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Boost Parameter Library test Jamfile

# literate
cm_test(NAME parameter_test_literate_extracting-parameter-types0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/extracting-parameter-types0.cpp)
cm_test(NAME parameter_test_literate_extracting-parameter-types1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/extracting-parameter-types1.cpp)
cm_test(NAME parameter_test_literate_template-keywords0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/template-keywords0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_template-keywords1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/template-keywords1.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_top-level0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/top-level0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_headers-and-namespaces0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/headers-and-namespaces0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_predicate-requirements0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/predicate-requirements0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_handling-out-parameters0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/handling-out-parameters0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_writing-the-function0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/writing-the-function0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_building-argumentpacks0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/building-argumentpacks0.cpp)
cm_test(NAME parameter_test_literate_defining-the-keywords0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/defining-the-keywords0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_defining-the-keywords1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/defining-the-keywords1.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_exercising-the-code-so-far0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/exercising-the-code-so-far0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_lazy-default-computation0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/lazy-default-computation0.cpp)
cm_test(NAME parameter_test_literate_lazy-default-computation1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/lazy-default-computation1.cpp)
cm_test(NAME parameter_test_literate_namespaces0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/namespaces0.cpp)
cm_test(NAME parameter_test_literate_namespaces1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/namespaces1.cpp)
cm_test(NAME parameter_test_literate_namespaces2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/namespaces2.cpp)
cm_test(NAME parameter_test_literate_namespaces3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/namespaces3.cpp)
cm_test(NAME parameter_test_literate_optional-parameters0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/optional-parameters0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_static-member-functions0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/static-member-functions0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_parameter-enabled-constructors0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/parameter-enabled-constructors0.cpp)
cm_test(NAME parameter_test_literate_required-parameters0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/required-parameters0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_class-template-skeleton0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/class-template-skeleton0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_deduced-template-parameters0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/deduced-template-parameters0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_deduced-parameters0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/deduced-parameters0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_default-expression-evaluation0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/default-expression-evaluation0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_parameter-enabled-member-functions0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/parameter-enabled-member-functions0.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_parameter-enabled-member-functions1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/parameter-enabled-member-functions1.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_literate_fine-grained-name-control0 SOURCES ${CURRENT_TEST_SOURCES_DIR}/literate/fine-grained-name-control0.cpp)

#test-suite "parameter"
cm_test(NAME parameter_test_basics SOURCES ${CURRENT_TEST_SOURCES_DIR}/basics.cpp)
cm_test(NAME parameter_test_sfinae SOURCES ${CURRENT_TEST_SOURCES_DIR}/sfinae.cpp)
cm_test(NAME parameter_test_macros SOURCES ${CURRENT_TEST_SOURCES_DIR}/macros.cpp)
cm_test(NAME parameter_test_earwicker SOURCES ${CURRENT_TEST_SOURCES_DIR}/earwicker.cpp)
cm_test(NAME parameter_test_tutorial SOURCES ${CURRENT_TEST_SOURCES_DIR}/tutorial.cpp)
cm_test(NAME parameter_test_singular SOURCES ${CURRENT_TEST_SOURCES_DIR}/singular.cpp)
cm_test(NAME parameter_test_mpl SOURCES ${CURRENT_TEST_SOURCES_DIR}/mpl.cpp)
cm_test(NAME parameter_test_preprocessor SOURCES ${CURRENT_TEST_SOURCES_DIR}/preprocessor.cpp)
cm_test(NAME parameter_test_preprocessor_deduced SOURCES ${CURRENT_TEST_SOURCES_DIR}/preprocessor_deduced.cpp)
cm_test(NAME parameter_test_efficiency SOURCES ${CURRENT_TEST_SOURCES_DIR}/efficiency.cpp)
cm_test(NAME parameter_test_maybe SOURCES ${CURRENT_TEST_SOURCES_DIR}/maybe.cpp)
cm_test(NAME parameter_test_deduced SOURCES ${CURRENT_TEST_SOURCES_DIR}/deduced.cpp)
cm_test(NAME parameter_test_optional_deduced_sfinae SOURCES ${CURRENT_TEST_SOURCES_DIR}/optional_deduced_sfinae.cpp)
cm_test(NAME parameter_test_deduced_dependent_predicate SOURCES ${CURRENT_TEST_SOURCES_DIR}/deduced_dependent_predicate.cpp)
cm_test(NAME parameter_test_normalized_argument_types SOURCES ${CURRENT_TEST_SOURCES_DIR}/normalized_argument_types.cpp)
cm_test(NAME parameter_test_ntp SOURCES ${CURRENT_TEST_SOURCES_DIR}/ntp.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_unwrap_cv_reference SOURCES ${CURRENT_TEST_SOURCES_DIR}/unwrap_cv_reference.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_duplicates SOURCES ${CURRENT_TEST_SOURCES_DIR}/duplicates.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME parameter_test_deduced_unmatched_arg SOURCES ${CURRENT_TEST_SOURCES_DIR}/deduced_unmatched_arg.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME parameter_test_compose SOURCES ${CURRENT_TEST_SOURCES_DIR}/compose.cpp COMPILE_ONLY)

# TODO: add python test.
# [ bpl-test python_test ]