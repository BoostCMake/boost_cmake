include(BCMTest)

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
bcm_test(NAME assign_test_basic SOURCES basic.cpp)
bcm_test(NAME assign_test_std SOURCES std.cpp)
#bcm_test(NAME assign_test_list_of SOURCES list_of.cpp)
bcm_test(NAME assign_test_ptr_list_of SOURCES ptr_list_of.cpp)
bcm_test(NAME assign_test_static_list_of SOURCES static_list_of.cpp)
bcm_test(NAME assign_test_tuple_list_of SOURCES tuple_list_of.cpp)
#bcm_test(NAME assign_test_list_inserter SOURCES list_inserter.cpp)
bcm_test(NAME assign_test_ptr_list_inserter SOURCES ptr_list_inserter.cpp)
bcm_test(NAME assign_test_ptr_map_inserter SOURCES ptr_map_inserter.cpp)
bcm_test(NAME assign_test_list_of_workaround SOURCES list_of_workaround.cpp)
bcm_test(NAME assign_test_email_example SOURCES email_example.cpp)
bcm_test(NAME assign_test_my_vector_example SOURCES my_vector_example.cpp)
bcm_test(NAME assign_test_multi_index_container SOURCES multi_index_container.cpp)
