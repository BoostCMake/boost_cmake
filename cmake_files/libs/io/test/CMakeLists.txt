include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_unit_test_framework)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_io
                        boost::test
                        boost::core
                        boost::detail
                        boost::unit_test_framework
                        )

#  Boost.IO Library test Jamfile
#
#  Copyright 2003 Daryle Walker.  Use, modification, and distribution
#  are subject to the Boost Software License, Version 1.0.  (See
#  accompanying file LICENSE_1_0.txt or a copy at
#  <http://www.boost.org/LICENSE_1_0.txt>.)
#
#  See <http://www.boost.org/libs/io/> for the library's home page.

bcm_test(NAME io_test_ios_state_unit_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/ios_state_unit_test.cpp NEED_PATCH)
bcm_test(NAME io_test_ios_state_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/ios_state_test.cpp NEED_PATCH)

bcm_test(NAME io_test_quoted_manip_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/quoted_manip_test.cpp)

