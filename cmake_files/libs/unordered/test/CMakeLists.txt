include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_unordered
                        boost::static_assert
                        boost::concept_check
                        boost::utility
                        )


# Copyright 2006-2008 Daniel James.
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# Would be nice to define -Wundef, but I'm getting warnings from
# Boost.Preprocessor on trunk.

#alias framework : /boost/test//${CMAKE_WORKSPACE_NAME}_unit_test_framework ;


bcm_test(NAME unordered_test_unordered_fwd_set_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/fwd_set_test.cpp)
bcm_test(NAME unordered_test_unordered_fwd_map_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/fwd_map_test.cpp)
bcm_test(NAME unordered_test_unordered_allocator_traits SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/allocator_traits.cpp)
bcm_test(NAME unordered_test_unordered_minimal_allocator SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/minimal_allocator.cpp)
bcm_test(NAME unordered_test_unordered_compile_set SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/compile_set.cpp)
bcm_test(NAME unordered_test_unordered_compile_map SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/compile_map.cpp)
bcm_test(NAME unordered_test_compile_map_unordered_allocator SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/compile_map.cpp)
target_compile_definitions(unordered_test_compile_map_unordered_allocator PUBLIC BOOST_UNORDERED_USE_ALLOCATOR_TRAITS=0)
bcm_test(NAME unordered_test_unordered_noexcept_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/noexcept_tests.cpp)
bcm_test(NAME unordered_test_unordered_link_test_12 SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/link_test_1.cpp ${CMAKE_WORKSPACE_SOURCE}/unordered/link_test_2.cpp)
bcm_test(NAME unordered_test_unordered_incomplete_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/incomplete_test.cpp)
bcm_test(NAME unordered_test_unordered_simple_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/simple_tests.cpp)
bcm_test(NAME unordered_test_unordered_equivalent_keys_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/equivalent_keys_tests.cpp)
bcm_test(NAME unordered_test_unordered_constructor_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/constructor_tests.cpp)
bcm_test(NAME unordered_test_unordered_copy_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/copy_tests.cpp)
bcm_test(NAME unordered_test_unordered_move_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/move_tests.cpp)
bcm_test(NAME unordered_test_unordered_assign_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/assign_tests.cpp)
bcm_test(NAME unordered_test_unordered_insert_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/insert_tests.cpp)
bcm_test(NAME unordered_test_unordered_insert_stable_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/insert_stable_tests.cpp)
# bcm_test(NAME unordered_test_unordered_insert_hint_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/insert_hint_tests.cpp)
# bcm_test(NAME unordered_test_unordered_emplace_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/emplace_tests.cpp)
bcm_test(NAME unordered_test_unordered_unnecessary_copy_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/unnecessary_copy_tests.cpp)
bcm_test(NAME unordered_test_unordered_erase_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/erase_tests.cpp)
bcm_test(NAME unordered_test_unordered_erase_equiv_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/erase_equiv_tests.cpp)
# bcm_test(NAME unordered_test_unordered_extract_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/extract_tests.cpp)
# bcm_test(NAME unordered_test_unordered_node_handle_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/node_handle_tests.cpp)
# bcm_test(NAME unordered_test_unordered_merge_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/merge_tests.cpp)

# bcm_test(NAME unordered_test_insert_node_type_fail_map SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/insert_node_type_fail.cpp COMPILE_ONLY WILL_FAIL)
# target_compile_definitions(unordered_test_insert_node_type_fail_map PUBLIC UNORDERED_TEST_MAP)

# bcm_test(NAME unordered_test_insert_node_type_fail_multimap SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/insert_node_type_fail.cpp COMPILE_ONLY WILL_FAIL)
# target_compile_definitions(unordered_test_insert_node_type_fail_multimap PUBLIC UNORDERED_TEST_MULTIMAP)

# bcm_test(NAME unordered_test_insert_node_type_fail_set SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/insert_node_type_fail.cpp  COMPILE_ONLY WILL_FAIL)
# target_compile_definitions(unordered_test_insert_node_type_fail_set PUBLIC UNORDERED_TEST_SET)

# bcm_test(NAME unordered_test_insert_node_type_fail_multiset SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/insert_node_type_fail.cpp COMPILE_ONLY WILL_FAIL)
# target_compile_definitions(unordered_test_insert_node_type_fail_multiset PUBLIC UNORDERED_TEST_MULTISET)

bcm_test(NAME unordered_test_unordered_find_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/find_tests.cpp)
bcm_test(NAME unordered_test_unordered_at_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/at_tests.cpp)
bcm_test(NAME unordered_test_unordered_bucket_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/bucket_tests.cpp)
bcm_test(NAME unordered_test_unordered_load_factor_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/load_factor_tests.cpp)
bcm_test(NAME unordered_test_unordered_rehash_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/rehash_tests.cpp)
bcm_test(NAME unordered_test_unordered_equality_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/equality_tests.cpp)
bcm_test(NAME unordered_test_unordered_swap_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/swap_tests.cpp)
bcm_test(NAME unordered_test_bmove_compile_set SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/compile_set.cpp)
target_compile_definitions(unordered_test_bmove_compile_set PUBLIC BOOST_UNORDERED_USE_MOVE)
bcm_test(NAME unordered_test_bmove_compile_map SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/compile_map.cpp)
target_compile_definitions(unordered_test_bmove_compile_map PUBLIC BOOST_UNORDERED_USE_MOVE)
bcm_test(NAME unordered_test_bmove_copy SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/copy_tests.cpp)
target_compile_definitions(unordered_test_bmove_copy PUBLIC BOOST_UNORDERED_USE_MOVE)
bcm_test(NAME unordered_test_bmove_move SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/move_tests.cpp)
target_compile_definitions(unordered_test_bmove_move PUBLIC BOOST_UNORDERED_USE_MOVE)
bcm_test(NAME unordered_test_bmove_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/unordered/assign_tests.cpp)
target_compile_definitions(unordered_test_bmove_assign PUBLIC BOOST_UNORDERED_USE_MOVE)

bcm_test(NAME unordered_test_exception_constructor_exception_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception/constructor_exception_tests.cpp)
bcm_test(NAME unordered_test_exception_copy_exception_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception/copy_exception_tests.cpp)
bcm_test(NAME unordered_test_exception_assign_exception_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception/assign_exception_tests.cpp)
# bcm_test(NAME unordered_test_exception_move_assign_exception_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception/move_assign_exception_tests.cpp)
bcm_test(NAME unordered_test_exception_insert_exception_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception/insert_exception_tests.cpp)
bcm_test(NAME unordered_test_exception_erase_exception_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception/erase_exception_tests.cpp)
bcm_test(NAME unordered_test_exception_rehash_exception_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception/rehash_exception_tests.cpp)
bcm_test(NAME unordered_test_exception_swap_exception_tests SOURCES ${CMAKE_WORKSPACE_SOURCE}/exception/swap_exception_tests.cpp)
target_compile_definitions(unordered_test_exception_swap_exception_tests PUBLIC BOOST_UNORDERED_SWAP_METHOD=2)

