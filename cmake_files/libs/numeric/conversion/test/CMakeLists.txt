include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_numeric_conversion
boost::test
boost::utility
)

# Boost Numeric Conversion Library test Jamfile
#
# Copyright (C) 2003, Fernando Luis Cacciola Carballal.
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)
#
# import testing ;


