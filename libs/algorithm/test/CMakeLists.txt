include(CMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_algorithm
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
cm_test(NAME algorithm_test_empty_search_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/empty_search_test.cpp)
cm_test(NAME algorithm_test_search_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/search_test1.cpp)
cm_test(NAME algorithm_test_search_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/search_test2.cpp)
cm_test(NAME algorithm_test_search_test3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/search_test3.cpp)
cm_test(NAME algorithm_test_search_test4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/search_test4.cpp)
cm_test(NAME algorithm_test_search_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/search_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME algorithm_test_search_fail2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/search_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME algorithm_test_search_fail3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/search_fail3.cpp COMPILE_ONLY WILL_FAIL)

# Misc tests
cm_test(NAME algorithm_test_clamp_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/clamp_test.cpp)
cm_test(NAME algorithm_test_power_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/power_test.cpp)
cm_test(NAME algorithm_test_power_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/power_fail1.cpp COMPILE_ONLY WILL_FAIL)

# Cxx11 tests
cm_test(NAME algorithm_test_all_of_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/all_of_test.cpp)
cm_test(NAME algorithm_test_any_of_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/any_of_test.cpp)
cm_test(NAME algorithm_test_none_of_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/none_of_test.cpp)
cm_test(NAME algorithm_test_one_of_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/one_of_test.cpp)

cm_test(NAME algorithm_test_ordered_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/ordered_test.cpp)
cm_test(NAME algorithm_test_find_if_not_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/find_if_not_test1.cpp)
cm_test(NAME algorithm_test_copy_if_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/copy_if_test1.cpp)
cm_test(NAME algorithm_test_copy_n_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/copy_n_test1.cpp)
cm_test(NAME algorithm_test_iota_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/iota_test1.cpp)

cm_test(NAME algorithm_test_is_permutation_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_permutation_test1.cpp)
cm_test(NAME algorithm_test_partition_point_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/partition_point_test1.cpp)
cm_test(NAME algorithm_test_is_partitioned_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/is_partitioned_test1.cpp)
cm_test(NAME algorithm_test_partition_copy_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/partition_copy_test1.cpp)

# Cxx14 tests
cm_test(NAME algorithm_test_equal_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/equal_test.cpp)
cm_test(NAME algorithm_test_mismatch_test SOURCES ${CURRENT_TEST_SOURCES_DIR}/mismatch_test.cpp)

# Hex tests
cm_test(NAME algorithm_test_hex_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/hex_test1.cpp)
cm_test(NAME algorithm_test_hex_test2 SOURCES ${CURRENT_TEST_SOURCES_DIR}/hex_test2.cpp)
cm_test(NAME algorithm_test_hex_test3 SOURCES ${CURRENT_TEST_SOURCES_DIR}/hex_test3.cpp)
cm_test(NAME algorithm_test_hex_test4 SOURCES ${CURRENT_TEST_SOURCES_DIR}/hex_test4.cpp)
cm_test(NAME algorithm_test_hex_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/hex_fail1.cpp COMPILE_ONLY WILL_FAIL)

# Gather tests
cm_test(NAME algorithm_test_gather_test1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/gather_test1.cpp)
cm_test(NAME algorithm_test_gather_fail1 SOURCES ${CURRENT_TEST_SOURCES_DIR}/gather_fail1.cpp COMPILE_ONLY WILL_FAIL)
