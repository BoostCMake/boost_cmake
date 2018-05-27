include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)


bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer
                        boost::thread
                        boost::bind
                        boost::timer
                        boost::test
                        boost::unit_test_framework
                        )

# Boost circular_buffer test Jamfile.
#
# Copyright (c) 2003-2008 Jan Gaspar
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# Added warning suppression Paul A. Bristow 25 Nov 2008

# Bring in rules for testing.


bcm_test(NAME circular_buffer_base_test SOURCES base_test.cpp)
bcm_test(NAME circular_buffer_space_optimized_test SOURCES space_optimized_test.cpp)
bcm_test(NAME circular_buffer_soft_iterator_invalidation SOURCES soft_iterator_invalidation.cpp)
bcm_test(NAME circular_buffer_constant_erase_test SOURCES constant_erase_test.cpp)
bcm_test(NAME circular_buffer_bounded_buffer_comparison SOURCES bounded_buffer_comparison.cpp COMPILE_ONLY)