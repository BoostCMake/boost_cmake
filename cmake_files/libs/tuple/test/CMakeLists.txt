include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_tuple
                        boost::test
                        )

bcm_test_link_libraries(boost::test_exec_monitor)

bcm_test(NAME tuple_test_tuple_test_bench SOURCES ${CMAKE_WORKSPACE_SOURCE}/tuple_test_bench.cpp)
bcm_test(NAME tuple_test_io_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/io_test.cpp)
bcm_test(NAME tuple_test_another_tuple_test_bench SOURCES ${CMAKE_WORKSPACE_SOURCE}/another_tuple_test_bench.cpp)

