include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_core)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_assert
                        boost::core
                        )

bcm_test(NAME assert_test_assert_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/assert_test.cpp)
bcm_test(NAME assert_test_current_function_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/current_function_test.cpp)
bcm_test(NAME assert_test_verify_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/verify_test.cpp)
# bcm_test(NAME assert_test_assert_is_void_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/assert_is_void_test.cpp)

# expansion tests are in exp/ so that there is a backslash in the path on Windows
bcm_test(NAME assert_test_assert_exp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exp/assert_exp_test.cpp)
bcm_test(NAME assert_test_assert_msg_exp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exp/assert_msg_exp_test.cpp)
bcm_test(NAME assert_test_verify_exp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exp/verify_exp_test.cpp)
bcm_test(NAME assert_test_verify_msg_exp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/exp/verify_msg_exp_test.cpp)
bcm_test(NAME assert_test_assert_test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/assert_test2.cpp)
bcm_test(NAME assert_test_assert_msg_test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/assert_msg_test2.cpp)

