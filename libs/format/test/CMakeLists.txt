include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_format
                        boost::test
                        )

#  Boost.Format Library test Jamfile
#
#  Copyright (c) 2003 Samuel Krempp
#
#  Distributed under the Boost Software License, Version 1.0. (See accompany-
#  ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

cm_test_link_libraries(boost::test_exec_monitor)

cm_test(NAME format_test_format_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/format_test1.cpp)
cm_test(NAME format_test_format_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/format_test2.cpp)
cm_test(NAME format_test_format_test3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/format_test3.cpp)
cm_test(NAME format_test_format_test_wstring SOURCES ${CURRENT_TEST_SOURCES_DIR}/format_test_wstring.cpp)
cm_test(NAME format_test_format_test_enum SOURCES ${CURRENT_TEST_SOURCES_DIR}/format_test_enum.cpp)


