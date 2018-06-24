include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_rational
                        boost::mpl
                        boost::preprocessor
                        boost::test
                        )

cm_test(NAME rational_test_rational_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/rational_test.cpp)
cm_test(NAME rational_test_rational_example SOURCES ${CURRENT_TEST_SOURCES_DIR}/rational_example.cpp)