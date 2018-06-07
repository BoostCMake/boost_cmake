include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_array)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_tokenizer
                        boost::test
                        boost::array
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME tokenizer_test_examples SOURCES ${CMAKE_WORKSPACE_SOURCE}/examples.cpp)
bcm_test(NAME tokenizer_test_simple_example_1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/simple_example_1.cpp)
bcm_test(NAME tokenizer_test_simple_example_2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/simple_example_2.cpp)
bcm_test(NAME tokenizer_test_simple_example_3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/simple_example_3.cpp)
bcm_test(NAME tokenizer_test_simple_example_4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/simple_example_4.cpp)
bcm_test(NAME tokenizer_test_simple_example_5 SOURCES ${CMAKE_WORKSPACE_SOURCE}/simple_example_5.cpp)

