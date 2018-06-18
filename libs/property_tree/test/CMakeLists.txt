include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_property_tree
                       ${CMAKE_WORKSPACE_NAME}::detail
                       ${CMAKE_WORKSPACE_NAME}::test
                       )

# Boost.PropertyTree
#
# Copyright (c) 2009 Sebastian Redl
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing


cm_test(NAME property_tree_test_test_property_tree SOURCES test_property_tree.cpp)
cm_test(NAME testproperty_tree_test__info_parser SOURCES test_info_parser.cpp)
cm_test(NAME property_tree_test_test_json_parser SOURCES test_json_parser.cpp)
# cm_test(NAME property_tree_test_test_json_parser2 SOURCES test_json_parser2.cpp)
cm_test(NAME property_tree_test_test_ini_parser SOURCES test_ini_parser.cpp)
cm_test(NAME property_tree_test_test_xml_parser_rapidxml SOURCES test_xml_parser_rapidxml.cpp)
cm_test(NAME property_tree_test_test_multi_module1 SOURCES test_multi_module1.cpp test_multi_module2.cpp)

