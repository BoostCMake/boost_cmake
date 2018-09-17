include(CMTest)

patch_directory(${CURRENT_TEST_SOURCES_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/files ${CMAKE_CURRENT_BINARY_DIR})

find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_property_tree
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

#test-suite "property_tree"
# TODO: fix all tests. Reasons:
#In file included from boost-1.59.0/libs/property_tree/test/test_utils.hpp:21:0,
#from build_boost/libs/property_tree/test/test_ini_parser.cpp:14:
#boost-1.59.0/libs/test/include/boost/test/minimal.hpp: In function ‘int main(int, char**)’:
#boost-1.59.0/libs/test/include/boost/test/minimal.hpp:124:26: error: redefinition of ‘int main(int, char**)’
#int BOOST_TEST_CALL_DECL main( int argc, char* argv[] )

#[[
cm_test(NAME property_tree_test_test_property_tree SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_property_tree.cpp)
cm_test(NAME testproperty_tree_test__info_parser SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_info_parser.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME property_tree_test_test_json_parser SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_json_parser.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
# TODO: fix test. Just run it.
# cm_test(NAME property_tree_test_test_json_parser2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_json_parser2.cpp)
cm_test(NAME property_tree_test_test_ini_parser SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_ini_parser.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})
cm_test(NAME property_tree_test_test_xml_parser_rapidxml SOURCES ${CMAKE_CURRENT_BINARY_DIR}/test_xml_parser_rapidxml.cpp SOURCES_PREFIX ${CURRENT_TEST_SOURCES_DIR})

cm_test(NAME property_tree_test_test_multi_module1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test_multi_module1.cpp ${CURRENT_TEST_SOURCES_DIR}/test_multi_module2.cpp)
]]
