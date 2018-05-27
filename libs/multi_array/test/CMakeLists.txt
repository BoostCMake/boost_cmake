include(BCMTest)

find_package(${CMAKE_WORKSPACE_NAME}_detail)
find_package(${CMAKE_WORKSPACE_NAME}_test)

bcm_test_link_libraries(${CMAKE_WORKSPACE_NAME}_multi_array
                        boost::detail
                        boost::test
                        )

# Copyright David Abrahams 2003. Permission to copy, use,
# modify, sell and distribute this software is granted provided this
# copyright notice appears in all copies. This software is provided
# "as is" without express or implied warranty, and with no claim as
# to its suitability for any purpose.


bcm_test(NAME multi_array_test_fail_cbracket SOURCES fail_cbracket.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cdata SOURCES fail_cdata.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_citerator SOURCES fail_citerator.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cparen SOURCES fail_cparen.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_criterator SOURCES fail_criterator.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_csubarray SOURCES fail_csubarray.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_csubarray2 SOURCES fail_csubarray2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_csubarray3 SOURCES fail_csubarray3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cview SOURCES fail_cview.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cview2 SOURCES fail_cview2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cview3 SOURCES fail_cview3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cbracket SOURCES fail_ref_cbracket.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cdata SOURCES fail_ref_cdata.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_citerator SOURCES fail_ref_citerator.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cparen SOURCES fail_ref_cparen.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_criterator SOURCES fail_ref_criterator.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_csubarray SOURCES fail_ref_csubarray.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_csubarray2 SOURCES fail_ref_csubarray2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_csubarray3 SOURCES fail_ref_csubarray3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cview SOURCES fail_ref_cview.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cview2 SOURCES fail_ref_cview2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cview3 SOURCES fail_ref_cview3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_constructors SOURCES constructors.cpp)
bcm_test(NAME multi_array_test_access SOURCES access.cpp)
bcm_test(NAME multi_array_test_compare SOURCES compare.cpp)
bcm_test(NAME multi_array_test_iterators SOURCES iterators.cpp)
bcm_test(NAME multi_array_test_slice SOURCES slice.cpp)
bcm_test(NAME multi_array_test_assign SOURCES assign.cpp)
bcm_test(NAME multi_array_test_assign_to_array SOURCES assign_to_array.cpp)
bcm_test(NAME multi_array_test_index_bases SOURCES index_bases.cpp)
bcm_test(NAME multi_array_test_storage_order_convert SOURCES storage_order_convert.cpp)
bcm_test(NAME multi_array_test_storage_order SOURCES storage_order.cpp)
bcm_test(NAME multi_array_test_reshape SOURCES reshape.cpp)
bcm_test(NAME multi_array_test_range1 SOURCES range1.cpp)
bcm_test(NAME multi_array_test_idxgen1 SOURCES idxgen1.cpp)
bcm_test(NAME multi_array_test_stl_interaction SOURCES stl_interaction.cpp)
bcm_test(NAME multi_array_test_resize SOURCES resize.cpp)
bcm_test(NAME multi_array_test_assert SOURCES assert.cpp)
bcm_test(NAME multi_array_test_reverse_view SOURCES reverse_view.cpp)
bcm_test(NAME multi_array_test_concept_checks SOURCES concept_checks.cpp COMPILE_ONLY)

