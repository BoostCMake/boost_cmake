include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_function)
find_package(${CMAKE_WORKSPACE_NAME}_bind)
find_package(${CMAKE_WORKSPACE_NAME}_functional)
find_package(${CMAKE_WORKSPACE_NAME}_multi_index)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_assign
                        ${CMAKE_WORKSPACE_NAME}::function
                        ${CMAKE_WORKSPACE_NAME}::bind
                        ${CMAKE_WORKSPACE_NAME}::functional
                        ${CMAKE_WORKSPACE_NAME}::multi_index
                        ${CMAKE_WORKSPACE_NAME}::test
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

cm_test(NAME assign_test_basic SOURCES ${CMAKE_CURRENT_BINARY_DIR}/basic.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME assign_test_std SOURCES ${CMAKE_CURRENT_BINARY_DIR}/std.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME assign_test_list_of SOURCES ${CMAKE_CURRENT_BINARY_DIR}/list_of.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_options(assign_test_list_of PRIVATE -std=c++03)

cm_test(NAME assign_test_ptr_list_of SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_list_of.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME assign_test_static_list_of SOURCES ${CMAKE_CURRENT_BINARY_DIR}/static_list_of.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME assign_test_tuple_list_of SOURCES ${CMAKE_CURRENT_BINARY_DIR}/tuple_list_of.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME assign_test_list_inserter SOURCES ${CMAKE_CURRENT_BINARY_DIR}/list_inserter.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
target_compile_options(assign_test_list_inserter PRIVATE -std=c++03)

cm_test(NAME assign_test_ptr_list_inserter SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_list_inserter.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME assign_test_ptr_map_inserter SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ptr_map_inserter.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME assign_test_list_of_workaround SOURCES ${CMAKE_CURRENT_BINARY_DIR}/list_of_workaround.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME assign_test_email_example SOURCES ${CMAKE_CURRENT_BINARY_DIR}/email_example.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME assign_test_my_vector_example SOURCES ${CMAKE_CURRENT_BINARY_DIR}/my_vector_example.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME assign_test_multi_index_container SOURCES ${CMAKE_CURRENT_BINARY_DIR}/multi_index_container.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
