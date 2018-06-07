include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_format
                        boost::test
                        )

#  Boost.Format Library test Jamfile
#
#  Copyright (c) 2003 Samuel Krempp
#
#  Distributed under the Boost Software License, Version 1.0. (See accompany-
#  ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

bcm_test_link_libraries(boost::test_exec_monitor)

bcm_test(NAME format_test_format_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/format_test1.cpp)
bcm_test(NAME format_test_format_test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/format_test2.cpp)
bcm_test(NAME format_test_format_test3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/format_test3.cpp)
bcm_test(NAME format_test_format_test_wstring SOURCES ${CMAKE_WORKSPACE_SOURCE}/format_test_wstring.cpp)
bcm_test(NAME format_test_format_test_enum SOURCES ${CMAKE_WORKSPACE_SOURCE}/format_test_enum.cpp)


