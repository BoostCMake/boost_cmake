include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_logic
                        boost::test
                        )

# Tribool library

# Copyright (C) 2002-2003 Douglas Gregor

# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/

bcm_test(NAME logic_test_tribool_test SOURCES tribool_test.cpp)
bcm_test(NAME logic_test_tribool_rename_test SOURCES tribool_rename_test.cpp)
bcm_test(NAME logic_test_tribool_io_test SOURCES tribool_io_test.cpp)



