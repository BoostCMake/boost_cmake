include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_rational
                        ${CMAKE_WORKSPACE_NAME}::mpl
                        ${CMAKE_WORKSPACE_NAME}::preprocessor
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# TODO: fix test. boost-1.59.0/libs/test/include/boost/test/unit_test_suite.hpp:50:1: error: expected initializer before ‘namespace’
#cm_test(NAME rational_test_rational_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/rational_test.cpp)
cm_test(NAME rational_test_rational_example SOURCES ${CURRENT_TEST_SOURCES_DIR}/rational_example.cpp)
