include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_crc
                        ${CMAKE_WORKSPACE_NAME}::random
                        ${CMAKE_WORKSPACE_NAME}::detail
                        ${CMAKE_WORKSPACE_NAME}::timer
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

if (NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    # TODO: fix test. Reason error: [-fpermissive]
    cm_test(NAME crc_test_crc_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/crc_test.cpp)
endif()