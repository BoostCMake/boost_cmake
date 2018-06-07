include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_assert)
find_package(${CMAKE_WORKSPACE_NAME}_graph)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_parameter
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


bcm_test(NAME parameter_test_basics SOURCES ${CMAKE_WORKSPACE_SOURCE}/basics.cpp)
bcm_test(NAME parameter_test_sfinae SOURCES ${CMAKE_WORKSPACE_SOURCE}/sfinae.cpp)
bcm_test(NAME parameter_test_macros SOURCES ${CMAKE_WORKSPACE_SOURCE}/macros.cpp)
bcm_test(NAME parameter_test_earwicker SOURCES ${CMAKE_WORKSPACE_SOURCE}/earwicker.cpp)
bcm_test(NAME parameter_test_tutorial SOURCES ${CMAKE_WORKSPACE_SOURCE}/tutorial.cpp)
bcm_test(NAME parameter_test_singular SOURCES ${CMAKE_WORKSPACE_SOURCE}/singular.cpp)
bcm_test(NAME parameter_test_mpl SOURCES ${CMAKE_WORKSPACE_SOURCE}/mpl.cpp)
bcm_test(NAME parameter_test_preprocessor SOURCES ${CMAKE_WORKSPACE_SOURCE}/preprocessor.cpp)
bcm_test(NAME parameter_test_preprocessor_deduced SOURCES ${CMAKE_WORKSPACE_SOURCE}/preprocessor_deduced.cpp)
bcm_test(NAME parameter_test_efficiency SOURCES ${CMAKE_WORKSPACE_SOURCE}/efficiency.cpp)
bcm_test(NAME parameter_test_maybe SOURCES ${CMAKE_WORKSPACE_SOURCE}/maybe.cpp)
bcm_test(NAME parameter_test_deduced SOURCES ${CMAKE_WORKSPACE_SOURCE}/deduced.cpp)
bcm_test(NAME parameter_test_optional_deduced_sfinae SOURCES ${CMAKE_WORKSPACE_SOURCE}/optional_deduced_sfinae.cpp)
bcm_test(NAME parameter_test_deduced_dependent_predicate SOURCES ${CMAKE_WORKSPACE_SOURCE}/deduced_dependent_predicate.cpp)
bcm_test(NAME parameter_test_normalized_argument_types SOURCES ${CMAKE_WORKSPACE_SOURCE}/normalized_argument_types.cpp)
bcm_test(NAME parameter_test_ntp SOURCES ${CMAKE_WORKSPACE_SOURCE}/ntp.cpp COMPILE_ONLY)
bcm_test(NAME parameter_test_unwrap_cv_reference SOURCES ${CMAKE_WORKSPACE_SOURCE}/unwrap_cv_reference.cpp COMPILE_ONLY)
bcm_test(NAME parameter_test_duplicates SOURCES ${CMAKE_WORKSPACE_SOURCE}/duplicates.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME parameter_test_deduced_unmatched_arg SOURCES ${CMAKE_WORKSPACE_SOURCE}/deduced_unmatched_arg.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME parameter_test_compose SOURCES ${CMAKE_WORKSPACE_SOURCE}/compose.cpp COMPILE_ONLY)


