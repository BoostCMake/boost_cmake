include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}::algorithm
                       ${CMAKE_WORKSPACE_NAME}::test
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
cm_test(NAME algorithm_test_empty_search_test SOURCES empty_search_test.cpp)
cm_test(NAME algorithm_test_search_test1 SOURCES search_test1.cpp)
cm_test(NAME algorithm_test_search_test2 SOURCES search_test2.cpp)
cm_test(NAME algorithm_test_search_test3 SOURCES search_test3.cpp)
cm_test(NAME algorithm_test_search_test4 SOURCES search_test4.cpp)
cm_test(NAME algorithm_test_search_fail1 SOURCES search_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME algorithm_test_search_fail2 SOURCES search_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME algorithm_test_search_fail3 SOURCES search_fail3.cpp COMPILE_ONLY WILL_FAIL)

# Misc tests
cm_test(NAME algorithm_test_clamp_test SOURCES clamp_test.cpp)
cm_test(NAME algorithm_test_power_test SOURCES power_test.cpp)
cm_test(NAME algorithm_test_power_fail1 SOURCES power_fail1.cpp COMPILE_ONLY WILL_FAIL)

# Cxx11 tests
cm_test(NAME algorithm_test_all_of_test SOURCES all_of_test.cpp)
cm_test(NAME algorithm_test_any_of_test SOURCES any_of_test.cpp)
cm_test(NAME algorithm_test_none_of_test SOURCES none_of_test.cpp)
cm_test(NAME algorithm_test_one_of_test SOURCES one_of_test.cpp)

cm_test(NAME algorithm_test_ordered_test SOURCES ordered_test.cpp)
cm_test(NAME algorithm_test_find_if_not_test1 SOURCES find_if_not_test1.cpp)
cm_test(NAME algorithm_test_copy_if_test1 SOURCES copy_if_test1.cpp)
cm_test(NAME algorithm_test_copy_n_test1 SOURCES copy_n_test1.cpp)
cm_test(NAME algorithm_test_iota_test1 SOURCES iota_test1.cpp)

cm_test(NAME algorithm_test_is_permutation_test1 SOURCES is_permutation_test1.cpp)
cm_test(NAME algorithm_test_partition_point_test1 SOURCES partition_point_test1.cpp)
cm_test(NAME algorithm_test_is_partitioned_test1 SOURCES is_partitioned_test1.cpp)
cm_test(NAME algorithm_test_partition_copy_test1 SOURCES partition_copy_test1.cpp)

# Cxx14 tests
cm_test(NAME algorithm_test_equal_test SOURCES equal_test.cpp)
cm_test(NAME algorithm_test_mismatch_test SOURCES mismatch_test.cpp)

# Hex tests
cm_test(NAME algorithm_test_hex_test1 SOURCES hex_test1.cpp)
cm_test(NAME algorithm_test_hex_test2 SOURCES hex_test2.cpp)
cm_test(NAME algorithm_test_hex_test3 SOURCES hex_test3.cpp)
cm_test(NAME algorithm_test_hex_test4 SOURCES hex_test4.cpp)
cm_test(NAME algorithm_test_hex_fail1 SOURCES hex_fail1.cpp COMPILE_ONLY WILL_FAIL)

# Gather tests
cm_test(NAME algorithm_test_gather_test1 SOURCES gather_test1.cpp)
cm_test(NAME algorithm_test_gather_fail1 SOURCES gather_fail1.cpp COMPILE_ONLY WILL_FAIL)

# SortSubrange tests
# cm_test(NAME algorithm_test_sort_subrange_test SOURCES sort_subrange_test.cpp)
# cm_test(NAME algorithm_test_partition_subrange_test SOURCES partition_subrange_test.cpp)

# Is_palindrome tests
# cm_test(NAME algorithm_test_is_palindrome_test SOURCES is_palindrome_test.cpp)
