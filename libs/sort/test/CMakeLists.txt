include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_sort
                        boost::test
                        )

#  Boost sorting_algo library test suite Jamfile  ----------------------------
#
#  Copyright Steven Ross 2009. Use, modification and
#  distribution is subject to the Boost Software License, Version
#  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)
#
#  See http://www.boost.org/libs/sort for library home page.


bcm_test(NAME sort_test_integer_sort SOURCES integer_sort_test.cpp)
bcm_test(NAME sort_test_float_sort SOURCES float_sort_test.cpp)
bcm_test(NAME sort_test_string_sort SOURCES string_sort_test.cpp)
bcm_test(NAME sort_test_sort_detail SOURCES sort_detail_test.cpp)
