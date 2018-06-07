include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_multi_index)
find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_assign
                        boost::function
                        boost::bind
                        boost::functional
                        boost::multi_index
                        boost::test
                        )

# Boost.Assign library
#
#  Copyright Thorsten Ottosen 2003-2005. Use, modification and
#  distribution is subject to the Boost Software License, Version
#  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)
#
# For more information, see http://www.boost.org/libs/assign/
#
bcm_test(NAME assign_test_basic SOURCES ${CMAKE_WORKSPACE_SOURCE}/basic.cpp NEED_PATCH)
bcm_test(NAME assign_test_std SOURCES ${CMAKE_WORKSPACE_SOURCE}/std.cpp NEED_PATCH)
#bcm_test(NAME assign_test_list_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/list_of.cpp NEED_PATCH)
bcm_test(NAME assign_test_ptr_list_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_list_of.cpp NEED_PATCH)
bcm_test(NAME assign_test_static_list_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/static_list_of.cpp NEED_PATCH)
bcm_test(NAME assign_test_tuple_list_of SOURCES ${CMAKE_WORKSPACE_SOURCE}/tuple_list_of.cpp NEED_PATCH)
#bcm_test(NAME assign_test_list_inserter SOURCES ${CMAKE_WORKSPACE_SOURCE}/list_inserter.cpp NEED_PATCH)
bcm_test(NAME assign_test_ptr_list_inserter SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_list_inserter.cpp NEED_PATCH)
bcm_test(NAME assign_test_ptr_map_inserter SOURCES ${CMAKE_WORKSPACE_SOURCE}/ptr_map_inserter.cpp NEED_PATCH)
bcm_test(NAME assign_test_list_of_workaround SOURCES ${CMAKE_WORKSPACE_SOURCE}/list_of_workaround.cpp NEED_PATCH)
bcm_test(NAME assign_test_email_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/email_example.cpp NEED_PATCH)
bcm_test(NAME assign_test_my_vector_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/my_vector_example.cpp NEED_PATCH)
bcm_test(NAME assign_test_multi_index_container SOURCES ${CMAKE_WORKSPACE_SOURCE}/multi_index_container.cpp NEED_PATCH)
