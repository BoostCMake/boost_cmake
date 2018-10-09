include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_thread)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)


cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_circular_buffer
                        ${CMAKE_WORKSPACE_NAME}::thread
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# Boost circular_buffer test Jamfile.
#
# Copyright (c) 2003-2008 Jan Gaspar
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# Added warning suppression Paul A. Bristow 25 Nov 2008

#test-suite "circular_buffer"
cm_test(NAME circular_buffer_base_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/base_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME circular_buffer_space_optimized_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/space_optimized_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME circular_buffer_soft_iterator_invalidation SOURCES ${CMAKE_CURRENT_BINARY_DIR}/soft_iterator_invalidation.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME circular_buffer_constant_erase_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/constant_erase_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME circular_buffer_bounded_buffer_comparison SOURCES ${CURRENT_TEST_SOURCES_DIR}/bounded_buffer_comparison.cpp COMPILE_ONLY)
