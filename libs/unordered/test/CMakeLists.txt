include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_static_assert)
find_package(${CMAKE_WORKSPACE_NAME}_concept_check)
find_package(${CMAKE_WORKSPACE_NAME}_utility)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_unordered
                        ${CMAKE_WORKSPACE_NAME}::static_assert
                        ${CMAKE_WORKSPACE_NAME}::concept_check
                        ${CMAKE_WORKSPACE_NAME}::utility
                        )


# Copyright 2006-2008 Daniel James.
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# Would be nice to define -Wundef, but I'm getting warnings from
# Boost.Preprocessor on trunk.

#alias framework : /boost/test//${CMAKE_WORKSPACE_NAME}_unit_test_framework ;

#test-suite unordered-exception
cm_test(NAME unordered_test_exception_constructor_exception_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception/constructor_exception_tests.cpp)
cm_test(NAME unordered_test_exception_copy_exception_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception/copy_exception_tests.cpp)
cm_test(NAME unordered_test_exception_assign_exception_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception/assign_exception_tests.cpp)
cm_test(NAME unordered_test_exception_insert_exception_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception/insert_exception_tests.cpp)
cm_test(NAME unordered_test_exception_erase_exception_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception/erase_exception_tests.cpp)
cm_test(NAME unordered_test_exception_rehash_exception_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception/rehash_exception_tests.cpp)
cm_test(NAME unordered_test_exception_swap_exception_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/exception/swap_exception_tests.cpp)
target_compile_definitions(unordered_test_exception_swap_exception_tests PUBLIC BOOST_UNORDERED_SWAP_METHOD=2)

#test-suite unordered
cm_test(NAME unordered_test_unordered_fwd_set_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/fwd_set_test.cpp)
cm_test(NAME unordered_test_unordered_fwd_map_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/fwd_map_test.cpp)
cm_test(NAME unordered_test_unordered_allocator_traits SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/allocator_traits.cpp)
cm_test(NAME unordered_test_unordered_minimal_allocator SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/minimal_allocator.cpp)
cm_test(NAME unordered_test_unordered_compile_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/compile_set.cpp)
cm_test(NAME unordered_test_unordered_compile_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/compile_map.cpp)
cm_test(NAME unordered_test_compile_map_unordered_allocator SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/compile_map.cpp)
target_compile_definitions(unordered_test_compile_map_unordered_allocator PUBLIC BOOST_UNORDERED_USE_ALLOCATOR_TRAITS=0)
cm_test(NAME unordered_test_unordered_noexcept_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/noexcept_tests.cpp)
cm_test(NAME unordered_test_unordered_link_test_12 SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/link_test_1.cpp ${CURRENT_TEST_SOURCES_DIR}/unordered/link_test_2.cpp)
cm_test(NAME unordered_test_unordered_incomplete_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/incomplete_test.cpp)
cm_test(NAME unordered_test_unordered_simple_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/simple_tests.cpp)
cm_test(NAME unordered_test_unordered_equivalent_keys_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/equivalent_keys_tests.cpp)
cm_test(NAME unordered_test_unordered_constructor_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/constructor_tests.cpp)
cm_test(NAME unordered_test_unordered_copy_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/copy_tests.cpp)
cm_test(NAME unordered_test_unordered_move_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/move_tests.cpp)
cm_test(NAME unordered_test_unordered_assign_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/assign_tests.cpp)
cm_test(NAME unordered_test_unordered_insert_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/insert_tests.cpp)
cm_test(NAME unordered_test_unordered_insert_stable_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/insert_stable_tests.cpp)
cm_test(NAME unordered_test_unordered_unnecessary_copy_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/unnecessary_copy_tests.cpp)
cm_test(NAME unordered_test_unordered_erase_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/erase_tests.cpp)
cm_test(NAME unordered_test_unordered_erase_equiv_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/erase_equiv_tests.cpp)
cm_test(NAME unordered_test_unordered_find_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/find_tests.cpp)
cm_test(NAME unordered_test_unordered_at_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/at_tests.cpp)
cm_test(NAME unordered_test_unordered_bucket_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/bucket_tests.cpp)
cm_test(NAME unordered_test_unordered_load_factor_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/load_factor_tests.cpp)
cm_test(NAME unordered_test_unordered_rehash_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/rehash_tests.cpp)
cm_test(NAME unordered_test_unordered_equality_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/equality_tests.cpp)
cm_test(NAME unordered_test_unordered_swap_tests SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/swap_tests.cpp)
cm_test(NAME unordered_test_bmove_compile_set SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/compile_set.cpp)
target_compile_definitions(unordered_test_bmove_compile_set PUBLIC BOOST_UNORDERED_USE_MOVE)
cm_test(NAME unordered_test_bmove_compile_map SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/compile_map.cpp)
target_compile_definitions(unordered_test_bmove_compile_map PUBLIC BOOST_UNORDERED_USE_MOVE)
cm_test(NAME unordered_test_bmove_copy SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/copy_tests.cpp)
target_compile_definitions(unordered_test_bmove_copy PUBLIC BOOST_UNORDERED_USE_MOVE)
cm_test(NAME unordered_test_bmove_move SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/move_tests.cpp)
target_compile_definitions(unordered_test_bmove_move PUBLIC BOOST_UNORDERED_USE_MOVE)
cm_test(NAME unordered_test_bmove_assign SOURCES ${CURRENT_TEST_SOURCES_DIR}/unordered/assign_tests.cpp)
target_compile_definitions(unordered_test_bmove_assign PUBLIC BOOST_UNORDERED_USE_MOVE)
