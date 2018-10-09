include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_fusion)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_array)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_variant
                        ${CMAKE_WORKSPACE_NAME}::fusion
                        ${CMAKE_WORKSPACE_NAME}::test
                        ${CMAKE_WORKSPACE_NAME}::lexical_cast
                        ${CMAKE_WORKSPACE_NAME}::array
                        )

#  Boost.Variant Library test Jamfile
#
#  Copyright (C) 2003, Eric Friedman, Itay Maman.
#  Copyright (C) 2013, Antony Polukhin.
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)
#
#<dependency>/boost/test//minimal

cm_test(NAME variant_test_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test1.cpp ${CURRENT_TEST_SOURCES_DIR}/class_a.cpp)
cm_test(NAME variant_test_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test2.cpp)
cm_test(NAME variant_test_test3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test3.cpp)
cm_test(NAME variant_test_test3_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/test3.cpp)
set_target_properties(variant_test_test3_no_rtti PROPERTIES CXX_RTTI off)
target_compile_definitions(variant_test_test3_no_rtti PUBLIC BOOST_NO_TYPEID)
cm_test(NAME variant_test_test4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test4.cpp ${CURRENT_TEST_SOURCES_DIR}/class_a.cpp)
cm_test(NAME variant_test_test5 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test5.cpp)
cm_test(NAME variant_test_test6 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test6.cpp)
cm_test(NAME variant_test_test7 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test7.cpp)
cm_test(NAME variant_test_test8 SOURCES ${CURRENT_TEST_SOURCES_DIR}/test8.cpp)
cm_test(NAME recursive_variant_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/recursive_variant_test.cpp)
cm_test(NAME variant_test_variant_reference_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/variant_reference_test.cpp)
cm_test(NAME variant_test_variant_comparison_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/variant_comparison_test.cpp)
cm_test(NAME variant_test_variant_visit_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/variant_visit_test.cpp)
cm_test(NAME variant_test_variant_get_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/variant_get_test.cpp)
cm_test(NAME variant_test_variant_polymorphic_get_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/variant_polymorphic_get_test.cpp)
cm_test(NAME variant_test_variant_multivisit_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/variant_multivisit_test.cpp)
cm_test(NAME variant_test_variant_hash_variant_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/hash_variant_test.cpp)
cm_test(NAME variant_test_rvalue_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/rvalue_test.cpp)
cm_test(NAME variant_test_variant_nonempty_check SOURCES ${CURRENT_TEST_SOURCES_DIR}/variant_nonempty_check.cpp)
cm_test(NAME variant_test_ecursive_variant_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/recursive_variant_test.cpp)
target_compile_definitions(variant_test_ecursive_variant_test PUBLIC BOOST_NO_EXCEPTIONS)
cm_test(NAME variant_test_ecursive_variant_test_no_rtti SOURCES ${CURRENT_TEST_SOURCES_DIR}/recursive_variant_test.cpp)
set_target_properties(variant_test_ecursive_variant_test_no_rtti PROPERTIES CXX_RTTI off)
target_compile_definitions(variant_test_ecursive_variant_test_no_rtti PUBLIC BOOST_NO_TYPEID)
cm_test(NAME variant_test_variant_swap_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/variant_swap_test.cpp)
cm_test(NAME variant_test_auto_visitors SOURCES ${CURRENT_TEST_SOURCES_DIR}/auto_visitors.cpp)
