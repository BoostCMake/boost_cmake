include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_algorithm_minmax
boost::test
)

#  Boost algorithm library test suite Jamfile  ----------------------------
#
#  Copyright Marshall Clow 2010-2012. Use, modification and
#  distribution is subject to the Boost Software License, Version
#  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)
#
#  See http://www.boost.org for updates, documentation, and revision history.

# Search tests
bcm_test(NAME algorithm_minmax_test_minmax_element_test SOURCES minmax_element_test.cpp)
bcm_test(NAME algorithm_minmax_test_minmax_test SOURCES minmax_test.cpp)