include(BCMTest)

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


cm_test(NAME parameter_test_basics SOURCES basics.cpp)
cm_test(NAME parameter_test_sfinae SOURCES sfinae.cpp)
cm_test(NAME parameter_test_macros SOURCES macros.cpp)
cm_test(NAME parameter_test_earwicker SOURCES earwicker.cpp)
cm_test(NAME parameter_test_tutorial SOURCES tutorial.cpp)
cm_test(NAME parameter_test_singular SOURCES singular.cpp)
cm_test(NAME parameter_test_mpl SOURCES mpl.cpp)
cm_test(NAME parameter_test_preprocessor SOURCES preprocessor.cpp)
cm_test(NAME parameter_test_preprocessor_deduced SOURCES preprocessor_deduced.cpp)
cm_test(NAME parameter_test_efficiency SOURCES efficiency.cpp)
cm_test(NAME parameter_test_maybe SOURCES maybe.cpp)
cm_test(NAME parameter_test_deduced SOURCES deduced.cpp)
cm_test(NAME parameter_test_optional_deduced_sfinae SOURCES optional_deduced_sfinae.cpp)
cm_test(NAME parameter_test_deduced_dependent_predicate SOURCES deduced_dependent_predicate.cpp)
cm_test(NAME parameter_test_normalized_argument_types SOURCES normalized_argument_types.cpp)
cm_test(NAME parameter_test_ntp SOURCES ntp.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_unwrap_cv_reference SOURCES unwrap_cv_reference.cpp COMPILE_ONLY)
cm_test(NAME parameter_test_duplicates SOURCES duplicates.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME parameter_test_deduced_unmatched_arg SOURCES deduced_unmatched_arg.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME parameter_test_compose SOURCES compose.cpp COMPILE_ONLY)


