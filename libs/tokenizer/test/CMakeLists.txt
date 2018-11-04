include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_array)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_tokenizer
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::array
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#test-suite tokenizer
cm_test(NAME tokenizer_test_examples SOURCES ${CURRENT_TEST_SOURCES_DIR}/examples.cpp)
cm_test(NAME tokenizer_test_simple_example_1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/simple_example_1.cpp)
cm_test(NAME tokenizer_test_simple_example_2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/simple_example_2.cpp)
cm_test(NAME tokenizer_test_simple_example_3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/simple_example_3.cpp)
cm_test(NAME tokenizer_test_simple_example_4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/simple_example_4.cpp)
cm_test(NAME tokenizer_test_simple_example_5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/simple_example_5.cpp)
