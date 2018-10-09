include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_format
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

#  Boost.Format Library test Jamfile
#
#  Copyright (c) 2003 Samuel Krempp
#
#  Distributed under the Boost Software License, Version 1.0. (See accompany-
#  ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#test-suite "format"
cm_test(NAME format_test_format_test1 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/format_test1.cpp)
cm_test(NAME format_test_format_test2 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/format_test2.cpp)
cm_test(NAME format_test_format_test3 SOURCES ${CMAKE_CURRENT_BINARY_DIR}/format_test3.cpp)
cm_test(NAME format_test_format_test_wstring SOURCES ${CMAKE_CURRENT_BINARY_DIR}/format_test_wstring.cpp)
cm_test(NAME format_test_format_test_enum SOURCES ${CMAKE_CURRENT_BINARY_DIR}/format_test_enum.cpp)
