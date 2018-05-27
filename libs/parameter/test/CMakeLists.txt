include(BCMTest)

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


bcm_test(NAME parameter_test_basics SOURCES basics.cpp)
bcm_test(NAME parameter_test_sfinae SOURCES sfinae.cpp)
bcm_test(NAME parameter_test_macros SOURCES macros.cpp)
bcm_test(NAME parameter_test_earwicker SOURCES earwicker.cpp)
bcm_test(NAME parameter_test_tutorial SOURCES tutorial.cpp)
bcm_test(NAME parameter_test_singular SOURCES singular.cpp)
bcm_test(NAME parameter_test_mpl SOURCES mpl.cpp)
bcm_test(NAME parameter_test_preprocessor SOURCES preprocessor.cpp)
bcm_test(NAME parameter_test_preprocessor_deduced SOURCES preprocessor_deduced.cpp)
bcm_test(NAME parameter_test_efficiency SOURCES efficiency.cpp)
bcm_test(NAME parameter_test_maybe SOURCES maybe.cpp)
bcm_test(NAME parameter_test_deduced SOURCES deduced.cpp)
bcm_test(NAME parameter_test_optional_deduced_sfinae SOURCES optional_deduced_sfinae.cpp)
bcm_test(NAME parameter_test_deduced_dependent_predicate SOURCES deduced_dependent_predicate.cpp)
bcm_test(NAME parameter_test_normalized_argument_types SOURCES normalized_argument_types.cpp)
bcm_test(NAME parameter_test_ntp SOURCES ntp.cpp COMPILE_ONLY)
bcm_test(NAME parameter_test_unwrap_cv_reference SOURCES unwrap_cv_reference.cpp COMPILE_ONLY)
bcm_test(NAME parameter_test_duplicates SOURCES duplicates.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME parameter_test_deduced_unmatched_arg SOURCES deduced_unmatched_arg.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME parameter_test_compose SOURCES compose.cpp COMPILE_ONLY)


