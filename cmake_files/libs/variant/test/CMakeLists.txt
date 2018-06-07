include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_fusion)
find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_lexical_cast)
find_package(${CMAKE_WORKSPACE_NAME}_array)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_variant
                        boost::fusion
                        boost::test
                        boost::lexical_cast
                        boost::array
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

bcm_test(NAME variant_test_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test1.cpp ${CMAKE_WORKSPACE_SOURCE}/class_a.cpp)
bcm_test(NAME variant_test_test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test2.cpp)
bcm_test(NAME variant_test_test3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test3.cpp)
bcm_test(NAME variant_test_test3_no_rtti SOURCES ${CMAKE_WORKSPACE_SOURCE}/test3.cpp)
set_target_properties(variant_test_test3_no_rtti PROPERTIES CXX_RTTI off)
target_compile_definitions(variant_test_test3_no_rtti PUBLIC BOOST_NO_TYPEID)
bcm_test(NAME variant_test_test4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test4.cpp ${CMAKE_WORKSPACE_SOURCE}/class_a.cpp)
bcm_test(NAME variant_test_test5 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test5.cpp)
bcm_test(NAME variant_test_test6 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test6.cpp)
bcm_test(NAME variant_test_test7 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test7.cpp)
bcm_test(NAME variant_test_test8 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test8.cpp)
# bcm_test(NAME variant_test_test9 SOURCES ${CMAKE_WORKSPACE_SOURCE}/test9.cpp)
bcm_test(NAME recursive_variant_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/recursive_variant_test.cpp)
bcm_test(NAME variant_test_variant_reference_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/variant_reference_test.cpp)
bcm_test(NAME variant_test_variant_comparison_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/variant_comparison_test.cpp)
bcm_test(NAME variant_test_variant_visit_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/variant_visit_test.cpp)
bcm_test(NAME variant_test_variant_get_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/variant_get_test.cpp)
bcm_test(NAME variant_test_variant_polymorphic_get_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/variant_polymorphic_get_test.cpp)
bcm_test(NAME variant_test_variant_multivisit_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/variant_multivisit_test.cpp)
bcm_test(NAME variant_test_variant_hash_variant_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/hash_variant_test.cpp)
bcm_test(NAME variant_test_rvalue_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/rvalue_test.cpp)
bcm_test(NAME variant_test_variant_nonempty_check SOURCES ${CMAKE_WORKSPACE_SOURCE}/variant_nonempty_check.cpp)
bcm_test(NAME variant_test_ecursive_variant_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/recursive_variant_test.cpp)
target_compile_definitions(variant_test_ecursive_variant_test PUBLIC BOOST_NO_EXCEPTIONS)
bcm_test(NAME variant_test_ecursive_variant_test_no_rtti SOURCES ${CMAKE_WORKSPACE_SOURCE}/recursive_variant_test.cpp)
set_target_properties(variant_test_ecursive_variant_test_no_rtti PROPERTIES CXX_RTTI off)
target_compile_definitions(variant_test_ecursive_variant_test_no_rtti PUBLIC BOOST_NO_TYPEID)
# bcm_test(NAME hash_recursive_variant_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/hash_recursive_variant_test.cpp)
bcm_test(NAME variant_test_variant_swap_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/variant_swap_test.cpp)
bcm_test(NAME variant_test_auto_visitors SOURCES ${CMAKE_WORKSPACE_SOURCE}/auto_visitors.cpp)
# bcm_test(NAME overload_selection SOURCES ${CMAKE_WORKSPACE_SOURCE}/overload_selection.cpp)
# bcm_test(NAME recursive_wrapper_move_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/recursive_wrapper_move_test.cpp)
