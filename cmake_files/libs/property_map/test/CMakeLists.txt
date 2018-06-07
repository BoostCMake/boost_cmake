include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_property_map
                        boost::test
                        )

# Function library

# Copyright (C) 2005 Trustees of Indiana University
#
# Author: Douglas Gregor
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/

bcm_test(NAME property_map_test_property_map_cc SOURCES ${CMAKE_WORKSPACE_SOURCE}/property_map_cc.cpp COMPILE_ONLY)
bcm_test(NAME property_map_test_compose_property_map_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/compose_property_map_test.cpp)
bcm_test(NAME property_map_test_dynamic_properties_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/dynamic_properties_test.cpp)
bcm_test(NAME property_map_test_function_property_map_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/function_property_map_test.cpp)
bcm_test(NAME property_map_test_transform_value_property_map_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/transform_value_property_map_test.cpp)

