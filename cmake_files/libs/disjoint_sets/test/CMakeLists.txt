include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_detail)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_disjoint_sets
                        boost::test
                        boost::detail
                        )

bcm_test(NAME disjoint_test_disjoint_set_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/../disjoint_set_test.cpp)
