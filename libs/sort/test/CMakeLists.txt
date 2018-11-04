include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_sort
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

#  Boost sorting_algo library test suite Jamfile  ----------------------------
#
#  Copyright Steven Ross 2009. Use, modification and
#  distribution is subject to the Boost Software License, Version
#  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)
#
#  See http://www.boost.org/libs/sort for library home page.

#test-suite "sort"
cm_test(NAME sort_test_integer_sort_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/integer_sort_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME sort_test_float_sort_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/float_sort_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME sort_test_string_sort_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/string_sort_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME sort_test_sort_detail_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/sort_detail_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
