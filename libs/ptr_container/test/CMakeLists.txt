include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)
find_package(${CMAKE_WORKSPACE_NAME}_assign)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_conversion)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_ptr_container
                        ${CMAKE_WORKSPACE_NAME}::tuple
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::functional
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        ${CMAKE_WORKSPACE_NAME}::lambda
                        ${CMAKE_WORKSPACE_NAME}::assign
                        ${CMAKE_WORKSPACE_NAME}::numeric_conversion
                        )

#//
#// Boost.Pointer Container
#//
#//  Copyright Thorsten Ottosen 2003-2008. Use, modification and
#//  distribution is subject to the Boost Software License, Version
#//  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#//  http://www.boost.org/LICENSE_1_0.txt)
#//
#// For more information, see http://www.boost.org/libs/ptr_container/
#//

#test-suite ptr_container
cm_test(NAME ptr_container_test_ptr_inserter SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_inserter.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_ptr_vector SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_vector.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

# TODO: fix test. error: no match for ‘operator+=’
#cm_test(NAME ptr_container_test_ptr_list SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_list.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME ptr_container_test_ptr_deque SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_deque.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_ptr_set SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_set.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_ptr_map SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_map.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_ptr_map_adapter SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_map_adapter.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_ptr_array SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_array.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_tree_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/tree_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_incomplete_type_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/incomplete_type_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_view_example SOURCES ${CURRENT_TEST_SOURCES_DIR}/view_example.cpp)
cm_test(NAME ptr_container_test_iterator_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/iterator_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_tut1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/tut1.cpp)
cm_test(NAME ptr_container_test_indirect_fun SOURCES ${CMAKE_CURRENT_BINARY_DIR}/indirect_fun.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_serialization SOURCES ${CMAKE_CURRENT_BINARY_DIR}/serialization.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_no_exceptions SOURCES ${CMAKE_CURRENT_BINARY_DIR}/no_exceptions.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME ptr_container_test_ptr_unordered_set SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_unordered_set.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_ptr_unordered_map SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_unordered_map.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME ptr_container_test_ptr_circular_buffer SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_circular_buffer.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
#   [ sc-test null_filter_iterator ]
