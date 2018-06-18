include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_tuple
                       ${CMAKE_WORKSPACE_NAME}::test
                       )

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}::test_exec_monitor)

cm_test(NAME tuple_test_tuple_test_bench SOURCES tuple_test_bench.cpp)
cm_test(NAME tuple_test_io_test SOURCES io_test.cpp)
cm_test(NAME tuple_test_another_tuple_test_bench SOURCES another_tuple_test_bench.cpp)

