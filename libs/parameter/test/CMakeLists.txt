include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_graph)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter
                        boost::static_assert
                        boost::tuple
                        boost::bind
                        boost::timer
                        boost::assert
                        boost::graph
                        )

# Copyright David Abrahams, Daniel Wallin 2006. Distributed under the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Boost Parameter Library test Jamfile

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
