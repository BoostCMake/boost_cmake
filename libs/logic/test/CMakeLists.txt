include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_logic
                        ${CMAKE_WORKSPACE_NAME}::test
                        )

# Tribool library

# Copyright (C) 2002-2003 Douglas Gregor

# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/

cm_test(NAME logic_test_tribool_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/tribool_test.cpp)
cm_test(NAME logic_test_tribool_rename_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/tribool_rename_test.cpp)
cm_test(NAME logic_test_tribool_io_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/tribool_io_test.cpp)
