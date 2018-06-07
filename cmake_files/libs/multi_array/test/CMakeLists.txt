include(BCMTest)
workspace_src (${CMAKE_CURRENT_SOURCE_DIR} CMAKE_WORKSPACE_SOURCE)

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


bcm_test(NAME multi_array_test_fail_cbracket SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_cbracket.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cdata SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_cdata.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_citerator SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_citerator.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cparen SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_cparen.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_criterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_criterator.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_csubarray SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_csubarray.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_csubarray2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_csubarray2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_csubarray3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_csubarray3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cview SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_cview.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cview2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_cview2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_cview3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_cview3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cbracket SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_cbracket.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cdata SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_cdata.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_citerator SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_citerator.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cparen SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_cparen.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_criterator SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_criterator.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_csubarray SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_csubarray.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_csubarray2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_csubarray2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_csubarray3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_csubarray3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cview SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_cview.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cview2 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_cview2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_fail_ref_cview3 SOURCES ${CMAKE_WORKSPACE_SOURCE}/fail_ref_cview3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME multi_array_test_constructors SOURCES ${CMAKE_WORKSPACE_SOURCE}/constructors.cpp)
bcm_test(NAME multi_array_test_access SOURCES ${CMAKE_WORKSPACE_SOURCE}/access.cpp)
bcm_test(NAME multi_array_test_compare SOURCES ${CMAKE_WORKSPACE_SOURCE}/compare.cpp)
bcm_test(NAME multi_array_test_iterators SOURCES ${CMAKE_WORKSPACE_SOURCE}/iterators.cpp)
bcm_test(NAME multi_array_test_slice SOURCES ${CMAKE_WORKSPACE_SOURCE}/slice.cpp)
bcm_test(NAME multi_array_test_assign SOURCES ${CMAKE_WORKSPACE_SOURCE}/assign.cpp)
bcm_test(NAME multi_array_test_assign_to_array SOURCES ${CMAKE_WORKSPACE_SOURCE}/assign_to_array.cpp)
bcm_test(NAME multi_array_test_index_bases SOURCES ${CMAKE_WORKSPACE_SOURCE}/index_bases.cpp)
bcm_test(NAME multi_array_test_storage_order_convert SOURCES ${CMAKE_WORKSPACE_SOURCE}/storage_order_convert.cpp)
bcm_test(NAME multi_array_test_storage_order SOURCES ${CMAKE_WORKSPACE_SOURCE}/storage_order.cpp)
bcm_test(NAME multi_array_test_reshape SOURCES ${CMAKE_WORKSPACE_SOURCE}/reshape.cpp)
bcm_test(NAME multi_array_test_range1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/range1.cpp)
bcm_test(NAME multi_array_test_idxgen1 SOURCES ${CMAKE_WORKSPACE_SOURCE}/idxgen1.cpp)
bcm_test(NAME multi_array_test_stl_interaction SOURCES ${CMAKE_WORKSPACE_SOURCE}/stl_interaction.cpp)
bcm_test(NAME multi_array_test_resize SOURCES ${CMAKE_WORKSPACE_SOURCE}/resize.cpp)
bcm_test(NAME multi_array_test_assert SOURCES ${CMAKE_WORKSPACE_SOURCE}/assert.cpp)
bcm_test(NAME multi_array_test_reverse_view SOURCES ${CMAKE_WORKSPACE_SOURCE}/reverse_view.cpp)
bcm_test(NAME multi_array_test_concept_checks SOURCES ${CMAKE_WORKSPACE_SOURCE}/concept_checks.cpp COMPILE_ONLY)

