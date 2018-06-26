include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_core)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_assert
                        boost::core
                        )

cm_test(NAME assert_test_assert_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/assert_test.cpp)
cm_test(NAME assert_test_current_function_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/current_function_test.cpp)
cm_test(NAME assert_test_verify_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/verify_test.cpp)
# cm_test(NAME assert_test_assert_is_void_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/assert_is_void_test.cpp)

# expansion tests are in exp/ so that there is a backslash in the path on Windows
cm_test(NAME assert_test_assert_exp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exp/assert_exp_test.cpp)
cm_test(NAME assert_test_assert_msg_exp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exp/assert_msg_exp_test.cpp)
cm_test(NAME assert_test_verify_exp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exp/verify_exp_test.cpp)
cm_test(NAME assert_test_verify_msg_exp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/exp/verify_msg_exp_test.cpp)
cm_test(NAME assert_test_assert_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/assert_test2.cpp)
cm_test(NAME assert_test_assert_msg_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/assert_msg_test2.cpp)

