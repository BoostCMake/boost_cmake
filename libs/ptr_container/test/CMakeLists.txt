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

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_ptr_container
                        boost::tuple
                        boost::bind
                        boost::functional
                        boost::timer
                        boost::test
                        boost::lexical_cast
                        boost::lambda
                        boost::assign
                        boost::numeric_conversion
                        boost::unit_test_framework
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


bcm_test(NAME ptr_container_test_ptr_inserter SOURCES ptr_inserter.cpp)
bcm_test(NAME ptr_container_test_ptr_vector SOURCES ptr_vector.cpp)
#bcm_test(NAME ptr_container_test_ptr_list SOURCES ptr_list.cpp)
bcm_test(NAME ptr_container_test_ptr_deque SOURCES ptr_deque.cpp)
bcm_test(NAME ptr_container_test_ptr_set SOURCES ptr_set.cpp)
bcm_test(NAME ptr_container_test_ptr_map SOURCES ptr_map.cpp)
bcm_test(NAME ptr_container_test_ptr_map_adapter SOURCES ptr_map_adapter.cpp)
bcm_test(NAME ptr_container_test_ptr_array SOURCES ptr_array.cpp)
bcm_test(NAME ptr_container_test_tree_test SOURCES tree_test.cpp)
bcm_test(NAME ptr_container_test_incomplete_type_test SOURCES incomplete_type_test.cpp)
bcm_test(NAME ptr_container_test_view_example SOURCES view_example.cpp)
bcm_test(NAME ptr_container_test_iterator_test SOURCES iterator_test.cpp)
bcm_test(NAME ptr_container_test_tut1 SOURCES tut1.cpp)
bcm_test(NAME ptr_container_test_indirect_fun SOURCES indirect_fun.cpp)
bcm_test(NAME ptr_container_test_serialization SOURCES serialization.cpp)
bcm_test(NAME ptr_container_test_no_exceptions SOURCES no_exceptions.cpp)

bcm_test(NAME ptr_container_test_ptr_unordered_set SOURCES ptr_unordered_set.cpp)
bcm_test(NAME ptr_container_test_ptr_unordered_map SOURCES ptr_unordered_map.cpp)
bcm_test(NAME ptr_container_test_ptr_circular_buffer SOURCES ptr_circular_buffer.cpp)
