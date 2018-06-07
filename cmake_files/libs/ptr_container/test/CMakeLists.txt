include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

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


bcm_test(NAME ptr_container_test_ptr_inserter SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_inserter.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_ptr_vector SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_vector.cpp NEED_PATCH)
#bcm_test(NAME ptr_container_test_ptr_list SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_list.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_ptr_deque SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_deque.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_ptr_set SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_set.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_ptr_map SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_map.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_ptr_map_adapter SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_map_adapter.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_ptr_array SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_array.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_tree_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/tree_test.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_incomplete_type_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/incomplete_type_test.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_view_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/view_example.cpp)
bcm_test(NAME ptr_container_test_iterator_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterator_test.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_tut1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/tut1.cpp)
bcm_test(NAME ptr_container_test_indirect_fun SOURCES ${CMAKE_WORKSPACE_SOURCE}/indirect_fun.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_serialization SOURCES ${CMAKE_WORKSPACE_SOURCE}/serialization.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_no_exceptions SOURCES ${CMAKE_WORKSPACE_SOURCE}/no_exceptions.cpp NEED_PATCH)

bcm_test(NAME ptr_container_test_ptr_unordered_set SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_unordered_set.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_ptr_unordered_map SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_unordered_map.cpp NEED_PATCH)
bcm_test(NAME ptr_container_test_ptr_circular_buffer SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_circular_buffer.cpp NEED_PATCH)
