include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_property_tree
                        boost::detail
                        boost::test
                        )

# Boost.PropertyTree
#
# Copyright (c) 2009 Sebastian Redl
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing



bcm_test(NAME property_tree_test_test_property_tree SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_property_tree.cpp)
bcm_test(NAME testproperty_tree_test__info_parser SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_info_parser.cpp)
bcm_test(NAME property_tree_test_test_json_parser SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_json_parser.cpp)
# bcm_test(NAME property_tree_test_test_json_parser2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_json_parser2.cpp)
bcm_test(NAME property_tree_test_test_ini_parser SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_ini_parser.cpp)
bcm_test(NAME property_tree_test_test_xml_parser_rapidxml SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_xml_parser_rapidxml.cpp)
bcm_test(NAME property_tree_test_test_multi_module1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test_multi_module1.cpp ${CMAKE_WORKSPACE_SOURCE}/test_multi_module2.cpp)

