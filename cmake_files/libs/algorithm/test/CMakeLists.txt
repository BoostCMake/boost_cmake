include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_algorithm
boost::test
)

#  Boost algorithm library test suite Jamfile  ----------------------------
#
#  Copyright Marshall Clow 2010-2012. Use, modification and
#  distribution is subject to the Boost Software License, Version
#  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)
#
#  See http://www.boost.org for updates, documentation, and revision history.

# Search tests
bcm_test(NAME algorithm_test_empty_search_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/empty_search_test.cpp)
bcm_test(NAME algorithm_test_search_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/search_test1.cpp)
bcm_test(NAME algorithm_test_search_test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/search_test2.cpp)
bcm_test(NAME algorithm_test_search_test3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/search_test3.cpp)
bcm_test(NAME algorithm_test_search_test4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/search_test4.cpp)
bcm_test(NAME algorithm_test_search_fail1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/search_fail1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME algorithm_test_search_fail2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/search_fail2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME algorithm_test_search_fail3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/search_fail3.cpp COMPILE_ONLY WILL_FAIL)

# Misc tests
bcm_test(NAME algorithm_test_clamp_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/clamp_test.cpp)
bcm_test(NAME algorithm_test_power_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/power_test.cpp)
bcm_test(NAME algorithm_test_power_fail1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/power_fail1.cpp COMPILE_ONLY WILL_FAIL)

# Cxx11 tests
bcm_test(NAME algorithm_test_all_of_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/all_of_test.cpp)
bcm_test(NAME algorithm_test_any_of_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/any_of_test.cpp)
bcm_test(NAME algorithm_test_none_of_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/none_of_test.cpp)
bcm_test(NAME algorithm_test_one_of_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/one_of_test.cpp)

bcm_test(NAME algorithm_test_ordered_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/ordered_test.cpp)
bcm_test(NAME algorithm_test_find_if_not_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/find_if_not_test1.cpp)
bcm_test(NAME algorithm_test_copy_if_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/copy_if_test1.cpp)
bcm_test(NAME algorithm_test_copy_n_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/copy_n_test1.cpp)
bcm_test(NAME algorithm_test_iota_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/iota_test1.cpp)

bcm_test(NAME algorithm_test_is_permutation_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_permutation_test1.cpp)
bcm_test(NAME algorithm_test_partition_point_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/partition_point_test1.cpp)
bcm_test(NAME algorithm_test_is_partitioned_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_partitioned_test1.cpp)
bcm_test(NAME algorithm_test_partition_copy_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/partition_copy_test1.cpp)

# Cxx14 tests
bcm_test(NAME algorithm_test_equal_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/equal_test.cpp)
bcm_test(NAME algorithm_test_mismatch_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/mismatch_test.cpp)

# Hex tests
bcm_test(NAME algorithm_test_hex_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/hex_test1.cpp)
bcm_test(NAME algorithm_test_hex_test2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/hex_test2.cpp)
bcm_test(NAME algorithm_test_hex_test3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/hex_test3.cpp)
bcm_test(NAME algorithm_test_hex_test4 SOURCES ${CMAKE_WORKSPACE_SOURCE}/hex_test4.cpp)
bcm_test(NAME algorithm_test_hex_fail1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/hex_fail1.cpp COMPILE_ONLY WILL_FAIL)

# Gather tests
bcm_test(NAME algorithm_test_gather_test1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/gather_test1.cpp)
bcm_test(NAME algorithm_test_gather_fail1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/gather_fail1.cpp COMPILE_ONLY WILL_FAIL)

# SortSubrange tests
# bcm_test(NAME algorithm_test_sort_subrange_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/sort_subrange_test.cpp)
# bcm_test(NAME algorithm_test_partition_subrange_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/partition_subrange_test.cpp)

# Is_palindrome tests
# bcm_test(NAME algorithm_test_is_palindrome_test SOURCES ${CMAKE_WORKSPACE_SOURCE}/is_palindrome_test.cpp)
