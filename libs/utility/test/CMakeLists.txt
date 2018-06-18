include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_test)
find_package(${CMAKE_WORKSPACE_NAME}_random)

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_utility
                       ${CMAKE_WORKSPACE_NAME}::test
                       ${CMAKE_WORKSPACE_NAME}::random
                       )

# Copyright David Abrahams 2003.

# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

# For more information, see http://www.boost.org/

# bring in rules for testing


# Please keep the tests ordered by filename
#        [ compile-fail string_ref_from_rvalue.cpp ]
#        [ compile-fail string_view_from_rvalue.cpp ]

cm_test_link_libraries(${CMAKE_WORKSPACE_NAME}::test_exec_monitor)

cm_test(NAME utility_test___base_from_member_test SOURCES ../base_from_member_test.cpp)
cm_test(NAME utility_test___base_from_member_ref_test SOURCES ../base_from_member_ref_test.cpp)
cm_test(NAME utility_test___binary_test SOURCES ../binary_test.cpp)
cm_test(NAME utility_test___call_traits_test SOURCES ../call_traits_test.cpp ARGS -u)
cm_test(NAME utility_test___compressed_pair_test SOURCES ../compressed_pair_test.cpp)
cm_test(NAME utility_test___iterators_test SOURCES ../iterators_test.cpp)
cm_test(NAME utility_test_next_prior_test SOURCES next_prior_test.cpp)
cm_test(NAME utility_test___numeric_traits_test SOURCES ../numeric_traits_test.cpp)
cm_test(NAME utility_test___operators_test SOURCES ../operators_test.cpp)
cm_test(NAME utility_test_result_of_test SOURCES result_of_test.cpp COMPILE_ONLY)
cm_test(NAME utility_test___shared_iterator_test SOURCES ../shared_iterator_test.cpp)
cm_test(NAME utility_test__string_ref_test1 SOURCES string_ref_test1.cpp)
cm_test(NAME utility_test__string_ref_test2 SOURCES string_ref_test2.cpp)
cm_test(NAME utility_test__string_ref_test_io SOURCES string_ref_test_io.cpp)
cm_test(NAME utility_test___value_init_test SOURCES ../value_init_test.cpp)
cm_test(NAME utility_test___value_init_workaround_test SOURCES ../value_init_workaround_test.cpp)
cm_test(NAME utility_test___initialized_test SOURCES ../initialized_test.cpp)

cm_test(NAME utility_test___value_init_test_fail1 SOURCES ../value_init_test_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME utility_test___value_init_test_fail2 SOURCES ../value_init_test_fail2.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME utility_test___value_init_test_fail3 SOURCES ../value_init_test_fail3.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME utility_test___initialized_test_fail1 SOURCES ../initialized_test_fail1.cpp COMPILE_ONLY WILL_FAIL)
cm_test(NAME utility_test___initialized_test_fail2 SOURCES ../initialized_test_fail2.cpp COMPILE_ONLY WILL_FAIL)

cm_test(NAME utility_test___generator_iterator_test SOURCES ../generator_iterator_test.cpp)


