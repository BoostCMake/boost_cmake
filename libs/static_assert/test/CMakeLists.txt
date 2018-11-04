include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_mpl)
find_package(${CMAKE_WORKSPACE_NAME}_typeof)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_static_assert
                        ${CMAKE_WORKSPACE_NAME}::typeof
                        ${CMAKE_WORKSPACE_NAME}::type_traits
                        ${CMAKE_WORKSPACE_NAME}::mpl)

# copyright John Maddock 2003
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_static_assert ${CMAKE_WORKSPACE_NAME}::type_traits)

#test-suite static_assert
cm_test(NAME static_assert_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test.cpp)
#   [ run static_assert_example_1.cpp ]
cm_test(NAME static_assert_example_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_example_2.cpp)
cm_test(NAME static_assert_example_3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_example_3.cpp)
cm_test(NAME static_assert_test_fail_1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_4.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_5.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_6.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_7 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_7.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_8 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_8.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_9 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_9.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME static_assert_test_fail_10 SOURCES ${CURRENT_TEST_SOURCES_DIR}/../static_assert_test_fail_10.cpp COMPILE_ONLY WILL_FAIL)
