include(BCMTest)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_functional
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


cm_test(NAME functional_test_function_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_test.cpp)

