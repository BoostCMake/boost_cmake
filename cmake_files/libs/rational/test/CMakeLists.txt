include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_preprocessor)
find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_rational
                        boost::mpl
                        boost::preprocessor
                        boost::test
                        )

bcm_test(NAME rational_test_rational_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/rational_test.cpp)
bcm_test(NAME rational_test_rational_example SOURCES ${CMAKE_WORKSPACE_SOURCE}/rational_example.cpp)