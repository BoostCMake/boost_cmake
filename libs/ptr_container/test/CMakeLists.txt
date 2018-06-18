include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_tuple)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_lambda)
find_package(${CMAKE_WORKSPACE_NAME}_assign)
find_package(${CMAKE_WORKSPACE_NAME}_numeric_conversion)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)

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
                       ${CMAKE_WORKSPACE_NAME}::unit_test_framework
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


cm_test(NAME ptr_container_test_ptr_inserter SOURCES ptr_inserter.cpp)
cm_test(NAME ptr_container_test_ptr_vector SOURCES ptr_vector.cpp)
#cm_test(NAME ptr_container_test_ptr_list SOURCES ptr_list.cpp)
cm_test(NAME ptr_container_test_ptr_deque SOURCES ptr_deque.cpp)
cm_test(NAME ptr_container_test_ptr_set SOURCES ptr_set.cpp)
cm_test(NAME ptr_container_test_ptr_map SOURCES ptr_map.cpp)
cm_test(NAME ptr_container_test_ptr_map_adapter SOURCES ptr_map_adapter.cpp)
cm_test(NAME ptr_container_test_ptr_array SOURCES ptr_array.cpp)
cm_test(NAME ptr_container_test_tree_test SOURCES tree_test.cpp)
cm_test(NAME ptr_container_test_incomplete_type_test SOURCES incomplete_type_test.cpp)
cm_test(NAME ptr_container_test_view_example SOURCES view_example.cpp)
cm_test(NAME ptr_container_test_iterator_test SOURCES iterator_test.cpp)
cm_test(NAME ptr_container_test_tut1 SOURCES tut1.cpp)
cm_test(NAME ptr_container_test_indirect_fun SOURCES indirect_fun.cpp)
cm_test(NAME ptr_container_test_serialization SOURCES serialization.cpp)
cm_test(NAME ptr_container_test_no_exceptions SOURCES no_exceptions.cpp)

cm_test(NAME ptr_container_test_ptr_unordered_set SOURCES ptr_unordered_set.cpp)
cm_test(NAME ptr_container_test_ptr_unordered_map SOURCES ptr_unordered_map.cpp)
cm_test(NAME ptr_container_test_ptr_circular_buffer SOURCES ptr_circular_buffer.cpp)
