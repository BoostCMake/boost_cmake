include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_detail)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_disjoint_sets
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::detail
                        )

cm_test(NAME disjoint_test_disjoint_set_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../disjoint_set_test.cpp)
