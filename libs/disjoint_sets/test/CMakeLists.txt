include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_detail)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_disjoint_sets
                        boost::test
                        boost::detail
                        )

bcm_test(NAME disjoint_test_disjoint_set_test SOURCES ../disjoint_set_test.cpp)
