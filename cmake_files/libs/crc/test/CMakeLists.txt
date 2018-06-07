include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_random)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_timer)
find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_crc
                        boost::random
                        boost::detail
                        boost::timer
                        boost::test
                        )

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

if((NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR (NOT PROJECT_VERSION LESS 1.60.0))
    bcm_test(NAME crc_test_crc_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/crc_test.cpp NEED_PATCH)
endif()