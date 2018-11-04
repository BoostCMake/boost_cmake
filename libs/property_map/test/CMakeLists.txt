include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_property_map
                        ${CMAKE_WORKSPACE_NAME}::test
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

#test-suite property_map
cm_test(NAME property_map_test_property_map_cc SOURCES ${CURRENT_TEST_SOURCES_DIR}/property_map_cc.cpp COMPILE_ONLY)
cm_test(NAME property_map_test_compose_property_map_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/compose_property_map_test.cpp)
cm_test(NAME property_map_test_dynamic_properties_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/dynamic_properties_test.cpp)
cm_test(NAME property_map_test_function_property_map_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/function_property_map_test.cpp)
cm_test(NAME property_map_test_transform_value_property_map_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/transform_value_property_map_test.cpp)
