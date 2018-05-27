include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_rational
                        boost::mpl
                        boost::preprocessor
                        boost::test
                        )

bcm_test(NAME rational_test_rational_test SOURCES rational_test.cpp)
bcm_test(NAME rational_test_rational_example SOURCES rational_example.cpp)