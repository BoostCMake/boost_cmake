include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_core)
find_package(${CMAKE_WORKSPACE_NAME}_detail)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_io
                        ${CMAKE_WORKSPACE_NAME}::core
                        ${CMAKE_WORKSPACE_NAME}::detail
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

#  Boost.IO Library test Jamfile
#
#  Copyright 2003 Daryle Walker.  Use, modification, and distribution
#  are subject to the Boost Software License, Version 1.0.  (See
#  accompanying file LICENSE_1_0.txt or a copy at
#  <http://www.boost.org/LICENSE_1_0.txt>.)
#
#  See <http://www.boost.org/libs/io/> for the library's home page.

#test-suite "io"
cm_test(NAME io_test_ios_state_unit_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ios_state_unit_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME io_test_ios_state_test SOURCES ${CMAKE_CURRENT_BINARY_DIR}/ios_state_test.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME io_test_quoted_manip_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/quoted_manip_test.cpp)
